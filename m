Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0B212275C
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 10:11:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACE558664C;
	Tue, 17 Dec 2019 09:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ULk30+cj9Gp; Tue, 17 Dec 2019 09:11:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18AD486661;
	Tue, 17 Dec 2019 09:11:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E19A9C077D;
	Tue, 17 Dec 2019 09:11:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0924C077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 09:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 991548798A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 09:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcH6Huhcvv7B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 09:11:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B586B87986
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576573878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCZwm5aZkjx2dAfif127R8Xe1711YfpZD0UFefmS9no=;
 b=b51QTFix3ndjFKmODIN9jWz1rUf86npg8RrWBktIChZkYrGkNdd47TheCpDysBDkQ5/rwl
 qFkOTXHx7qnYGmNcMIpP0OgCJGid140j3kDKVH5g0nJew1/K7GLgJPx8fAwu7ZR1Kqr3t1
 8PGABU14iDpHF5DIIDE8A4XxO6fzL9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-R39nST7-Ps2ACt8trC-tug-1; Tue, 17 Dec 2019 04:11:14 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF8B7801E6D;
 Tue, 17 Dec 2019 09:11:13 +0000 (UTC)
Received: from gondolin (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7026519C4F;
 Tue, 17 Dec 2019 09:11:10 +0000 (UTC)
Date: Tue, 17 Dec 2019 10:11:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH] virtio-balloon: request nvqs based on features
Message-ID: <20191217101108.7bf5018d.cohuck@redhat.com>
In-Reply-To: <20191216231429.38202-1-dverkamp@chromium.org>
References: <20191216231429.38202-1-dverkamp@chromium.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: R39nST7-Ps2ACt8trC-tug-1
X-Mimecast-Spam-Score: 0
Cc: Liang Li <liang.z.li@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
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

On Mon, 16 Dec 2019 15:14:29 -0800
Daniel Verkamp <dverkamp@chromium.org> wrote:

> After 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT"),
> the virtio-balloon device unconditionally specifies 4 virtqueues as the
> argument to find_vqs(), which means that 5 MSI-X vectors are required in
> order to assign one vector per VQ plus one for configuration changes.
> 
> However, in cases where the virtio device only provides exactly as many
> MSI-X vectors as required for the features it implements (e.g. 3 for the
> basic configuration of inflate + deflate + config), this results in the
> selection of the fallback configuration where one interrupt vector is
> used for all VQs instead of having one VQ per vector.
> 
> Restore the logic that chose nvqs conditionally based on enabled
> features, which was removed as part of the aforementioned commit.
> This is slightly more complex than just incrementing a counter of the
> number of VQs, since the queue for a given feature is assigned a fixed
> index.

As Wei already said, this should not be necessary, but see below.

> 
> Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
> ---
>  drivers/virtio/virtio_balloon.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 93f995f6cf36..67c6318d77c7 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -465,6 +465,7 @@ static int init_vqs(struct virtio_balloon *vb)
>  	vq_callback_t *callbacks[VIRTIO_BALLOON_VQ_MAX];
>  	const char *names[VIRTIO_BALLOON_VQ_MAX];
>  	int err;
> +	unsigned nvqs;
>  
>  	/*
>  	 * Inflateq and deflateq are used unconditionally. The names[]
> @@ -475,20 +476,24 @@ static int init_vqs(struct virtio_balloon *vb)
>  	names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
>  	callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
>  	names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
> +	nvqs = VIRTIO_BALLOON_VQ_DEFLATE + 1;
> +
>  	names[VIRTIO_BALLOON_VQ_STATS] = NULL;
>  	names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;

Note that we set names[q] to NULL, but not callbacks[q].

>  
>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
>  		names[VIRTIO_BALLOON_VQ_STATS] = "stats";
>  		callbacks[VIRTIO_BALLOON_VQ_STATS] = stats_request;
> +		nvqs = VIRTIO_BALLOON_VQ_STATS + 1;
>  	}
>  
>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
>  		names[VIRTIO_BALLOON_VQ_FREE_PAGE] = "free_page_vq";
>  		callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
> +		nvqs = VIRTIO_BALLOON_VQ_FREE_PAGE + 1;
>  	}
>  
> -	err = vb->vdev->config->find_vqs(vb->vdev, VIRTIO_BALLOON_VQ_MAX,
> +	err = vb->vdev->config->find_vqs(vb->vdev, nvqs,
>  					 vqs, callbacks, names, NULL, NULL);

This will end up in vp_find_vqs_msix() eventually, which will try to
determine the number of needed vectors based upon whether callbacks[q]
is !NULL. That's probably the reason you end up trying to use more
vectors than needed. (Further down in that function, the code will skip
any queue with names[q] == NULL, but that's too late for determining
the number of vectors.)

So I think that either (a) virtio-pci should avoid trying to allocate a
vector for queues with names[q] == NULL, or (b) virtio-balloon should
clean out callbacks[q] for unused queues as well. Maybe both?

>  	if (err)
>  		return err;

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
