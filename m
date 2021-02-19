Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7E31FD3C
	for <lists.virtualization@lfdr.de>; Fri, 19 Feb 2021 17:38:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B65D886C32;
	Fri, 19 Feb 2021 16:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EaZDyAaafg2u; Fri, 19 Feb 2021 16:38:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B66198650A;
	Fri, 19 Feb 2021 16:38:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C481C000D;
	Fri, 19 Feb 2021 16:38:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAB02C000D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 16:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BE85A8650A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 16:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIt3fmRloxa9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 16:38:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9757181EB5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 16:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613752717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yLHUSgztqphVGzpy64DPiEubzzxMBP24dAWW1jTd1qU=;
 b=S5CQUxnm+10HpvZbi4ZXjx1DAiLm2TeReeaFOXM8qM9SK5MRZHqAfQVs+nyEiVKBN3mxxR
 H/PHO7Qe+M9XbXePZn9QRAY4tjqoGg5vrya/70bxNK4P56DBEFZEVl2vHlvY8ebA8l8ZRt
 6JOdE8BzzKeVxWT2dRbNj096feVkhaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-rOrCZLYtOvm5wdANcEFjzA-1; Fri, 19 Feb 2021 11:38:35 -0500
X-MC-Unique: rOrCZLYtOvm5wdANcEFjzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F6C1107ACC7;
 Fri, 19 Feb 2021 16:38:33 +0000 (UTC)
Received: from gondolin (ovpn-113-92.ams2.redhat.com [10.36.113.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A82FB1970D;
 Fri, 19 Feb 2021 16:38:31 +0000 (UTC)
Date: Fri, 19 Feb 2021 17:38:28 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v2] virtio/s390: implement virtio-ccw revision 2 correctly
Message-ID: <20210219173828.6a2ab5d4.cohuck@redhat.com>
In-Reply-To: <20210216110645.1087321-1-cohuck@redhat.com>
References: <20210216110645.1087321-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-s390@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>,
 kvm@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>
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

I was thinking of queuing this, but maybe it is quicker to pick it into
the s390 tree directly and save us the extra pull request dance?
Especially as this is a stable-worthy bugfix.

On Tue, 16 Feb 2021 12:06:45 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> CCW_CMD_READ_STATUS was introduced with revision 2 of virtio-ccw,
> and drivers should only rely on it being implemented when they
> negotiated at least that revision with the device.
> 
> However, virtio_ccw_get_status() issued READ_STATUS for any
> device operating at least at revision 1. If the device accepts
> READ_STATUS regardless of the negotiated revision (which some
> implementations like QEMU do, even though the spec currently does
> not allow it), everything works as intended. While a device
> rejecting the command should also be handled gracefully, we will
> not be able to see any changes the device makes to the status,
> such as setting NEEDS_RESET or setting the status to zero after
> a completed reset.
> 
> We negotiated the revision to at most 1, as we never bumped the
> maximum revision; let's do that now and properly send READ_STATUS
> only if we are operating at least at revision 2.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7d3ce5ab9430 ("virtio/s390: support READ_STATUS command for virtio-ccw")
> Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v1->v2:
>   tweak patch description and cc:stable
> 
> ---
>  drivers/s390/virtio/virtio_ccw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> index 5730572b52cd..54e686dca6de 100644
> --- a/drivers/s390/virtio/virtio_ccw.c
> +++ b/drivers/s390/virtio/virtio_ccw.c
> @@ -117,7 +117,7 @@ struct virtio_rev_info {
>  };
>  
>  /* the highest virtio-ccw revision we support */
> -#define VIRTIO_CCW_REV_MAX 1
> +#define VIRTIO_CCW_REV_MAX 2
>  
>  struct virtio_ccw_vq_info {
>  	struct virtqueue *vq;
> @@ -952,7 +952,7 @@ static u8 virtio_ccw_get_status(struct virtio_device *vdev)
>  	u8 old_status = vcdev->dma_area->status;
>  	struct ccw1 *ccw;
>  
> -	if (vcdev->revision < 1)
> +	if (vcdev->revision < 2)
>  		return vcdev->dma_area->status;
>  
>  	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
