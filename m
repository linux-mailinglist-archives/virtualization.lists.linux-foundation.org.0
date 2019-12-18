Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CD124322
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 10:28:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1D23287908;
	Wed, 18 Dec 2019 09:28:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjU94Cl5K9W0; Wed, 18 Dec 2019 09:28:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76E4A878BC;
	Wed, 18 Dec 2019 09:28:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53CF1C077D;
	Wed, 18 Dec 2019 09:28:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49C4CC077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 32CF620501
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNyeFmV0Inri
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:28:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 063C91FE32
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576661314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbaqknV8R5gk1lfMUDObaoppQRG8uXuRhQGdHjWuJ0Y=;
 b=DuxT8Yy4eEndh1ivRvGqTVnUf9OGAKRNL/eNaGplYdFav7mNQrfcONrY+QqOibReAqMWNN
 G2BPqCoNz6pyLrhmMkDszs0acmcUR+5jIZLDt4HMq0nh20Y1E32JW0ZbiFR2ps0DuJLYIY
 fkpjL5/Vcfuc9dNyVnC1VOp0e7n2P9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-I6jrDWtEMbqjorEu1tFiAA-1; Wed, 18 Dec 2019 04:28:31 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFDEC800D4C;
 Wed, 18 Dec 2019 09:28:29 +0000 (UTC)
Received: from gondolin (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 611A95C545;
 Wed, 18 Dec 2019 09:28:26 +0000 (UTC)
Date: Wed, 18 Dec 2019 10:28:23 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH 1/2] virtio-balloon: initialize all vq callbacks
Message-ID: <20191218102823.790d88fa.cohuck@redhat.com>
In-Reply-To: <20191217190610.248061-1-dverkamp@chromium.org>
References: <20191217190610.248061-1-dverkamp@chromium.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: I6jrDWtEMbqjorEu1tFiAA-1
X-Mimecast-Spam-Score: 0
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, 17 Dec 2019 11:06:09 -0800
Daniel Verkamp <dverkamp@chromium.org> wrote:

> Ensure that elements of the array that correspond to unavailable

s/array/callbacks array/ ?

> features are set to NULL; previously, they would be left uninitialized.
> 
> Since the corresponding names array elements were explicitly set to
> NULL, the uninitialized callback pointers would not actually be
> dereferenced; however, the uninitialized callbacks elements would still
> be read in vp_find_vqs_msix() and used to calculate the number of MSI-X
> vectors required.
> 
> Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
> ---
>  drivers/virtio/virtio_balloon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 93f995f6cf36..8e400ece9273 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -475,7 +475,9 @@ static int init_vqs(struct virtio_balloon *vb)
>  	names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
>  	callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
>  	names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
> +	callbacks[VIRTIO_BALLOON_VQ_STATS] = NULL;
>  	names[VIRTIO_BALLOON_VQ_STATS] = NULL;
> +	callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
>  	names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
>  
>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {

Alternatively, it might make sense to zero the whole array and drop the
explicit NULL assignments, which would also be a bit more future
proof... but this one fixes things as well, of course.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
