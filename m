Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81112433F
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 10:31:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3956C883D6;
	Wed, 18 Dec 2019 09:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyIM04qj0Sdg; Wed, 18 Dec 2019 09:31:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 10E54883D4;
	Wed, 18 Dec 2019 09:31:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF003C077D;
	Wed, 18 Dec 2019 09:31:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8BF4C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A0419878BC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ive9h7gWqGP5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:31:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CBFBD87842
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576661458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hx2PRHjSlP93MZ/PJ9sqnd7hc74Rcuj/f6tSCXaA79Y=;
 b=bcy9alv34RWeh9UcyONrUZEdPYSP1mi+wGuOH3bVFq9gz5gn6UwZ+S8/Ds3y1dZlbbsg81
 1FinIOA/hwxmVujfjKBnX2ym4QLW2RPu5NF1Eq98HelTPKr6iTeeJ6iV29eFxmlSNDaW2I
 /mNVmMCvdf+Oy0GI4Xp8OSjg6CByEzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-9OEV0quoP_6ognKz6yNwTQ-1; Wed, 18 Dec 2019 04:30:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A79108C28F;
 Wed, 18 Dec 2019 09:30:55 +0000 (UTC)
Received: from gondolin (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC1A26942C;
 Wed, 18 Dec 2019 09:30:38 +0000 (UTC)
Date: Wed, 18 Dec 2019 10:30:36 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH 2/2] virtio-pci: check name when counting MSI-X vectors
Message-ID: <20191218103036.1ec596ff.cohuck@redhat.com>
In-Reply-To: <20191217190610.248061-2-dverkamp@chromium.org>
References: <20191217190610.248061-1-dverkamp@chromium.org>
 <20191217190610.248061-2-dverkamp@chromium.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 9OEV0quoP_6ognKz6yNwTQ-1
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

On Tue, 17 Dec 2019 11:06:10 -0800
Daniel Verkamp <dverkamp@chromium.org> wrote:

> VQs without a name specified are not valid; they are skipped in the
> later loop that assigns MSI-X vectors to queues, but the per_vq_vectors
> loop above that counts the required number of vectors previously still
> counted any queue with a non-NULL callback as needing a vector.
> 
> Add a check to the per_vq_vectors loop so that vectors with no name are
> not counted to make the two loops consistent.  This prevents
> over-counting unnecessary vectors (e.g. for features which were not
> negotiated with the device).
> 
> Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
> ---
>  drivers/virtio/virtio_pci_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> index f2862f66c2ac..222d630c41fc 100644
> --- a/drivers/virtio/virtio_pci_common.c
> +++ b/drivers/virtio/virtio_pci_common.c
> @@ -294,7 +294,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
>  		/* Best option: one for change interrupt, one per vq. */
>  		nvectors = 1;
>  		for (i = 0; i < nvqs; ++i)
> -			if (callbacks[i])
> +			if (names[i] && callbacks[i])
>  				++nvectors;
>  	} else {
>  		/* Second best: one for change, shared for all vqs. */

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
