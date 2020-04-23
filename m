Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 466611B5BC4
	for <lists.virtualization@lfdr.de>; Thu, 23 Apr 2020 14:51:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D072E88571;
	Thu, 23 Apr 2020 12:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QEJ+OWE0RNz; Thu, 23 Apr 2020 12:51:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4EA89882A4;
	Thu, 23 Apr 2020 12:51:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FA23C0175;
	Thu, 23 Apr 2020 12:51:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10B26C0175
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 12:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D0A532324B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 12:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5V9z-aa7ousN
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 12:51:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id C5E5B2042D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587646294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oFynhrdn2AeeDCMTi/GbcSIhzhXYtqVnBO1H8k4rM8s=;
 b=D+Epvj1L+i6jM65ar/hlC8//2grbrreW75dDV5UX2VoAUcFe1Pwq8sA8gMYDTobmTFcGaJ
 jELLS3w/84SOQV9tL/3QpdgKLRqqOnW98GHzufPWyfS3vu1N/kI79SsuU56uoTA842nzEZ
 4C8AHpX7XCImxzPHGd/xCYy2ZvikMkE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-Wy977rXnOzee8N5xokZrAQ-1; Thu, 23 Apr 2020 08:51:23 -0400
X-MC-Unique: Wy977rXnOzee8N5xokZrAQ-1
Received: by mail-wr1-f69.google.com with SMTP id s11so2805523wru.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 05:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oFynhrdn2AeeDCMTi/GbcSIhzhXYtqVnBO1H8k4rM8s=;
 b=UjW2HMb9dFG5BiFfPdxQlBQvqElgwgZQ9AH6sSOE++EfaziKoXrN2VLeoeCILjcn9B
 G5lpNQsxm1SgHROFn4ttNMg5eGf/gDwfeBACbBOfPXcaN3Gc1GqYZXPYOHOuVJcK0EdP
 39Rfp5nt6j1ITvaATKwrF6mw7kBj+xgmD8c9PJp3shC6Elx/uoJJ8eD3V28GJ9jtsPtT
 vUxS2z9FgXLJN9ptuE0NR6N3c7/wtnhNAj6VKOLf5kqScNJ/GQUe2cevMH0lFziFNq/j
 MMXSFgRWAHf33tuPgYfOSLdGFIuMDBQujzlw4ok0C39sIaeruqpq1u8ISP9g1gI8rBEi
 FPSA==
X-Gm-Message-State: AGi0PuY9KuZXqajr6dc90zNIga3HcuHDkg/a9ggZd/AlrlIZEv9lM0Db
 igim6jidapdmfwgqtQ9xQoN68VZgty+aeum9nkDPVbh7l+1LKsmGdLBFPTT6jZJGrNbSXfNT8Cd
 +68darFPLVMP9M/nrjfhCN8kS8EWsewugbeIdLgXHaA==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr4890722wrp.275.1587646282060; 
 Thu, 23 Apr 2020 05:51:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypI/kzDW73KAZYZbxhnpJuArcvjawCoIOFrcjvuGR9Ia4oEPXtyQVUt1e61nouVHczLBSQLGAg==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr4890704wrp.275.1587646281858; 
 Thu, 23 Apr 2020 05:51:21 -0700 (PDT)
Received: from redhat.com (bzq-109-65-97-189.red.bezeqint.net. [109.65.97.189])
 by smtp.gmail.com with ESMTPSA id l4sm3745135wrv.60.2020.04.23.05.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 05:51:21 -0700 (PDT)
Date: Thu, 23 Apr 2020 08:51:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio-blk: handle block_device_operations callbacks
 after hot unplug
Message-ID: <20200423084914-mutt-send-email-mst@kernel.org>
References: <20200423123717.139141-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200423123717.139141-1-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Lance Digby <ldigby@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Thu, Apr 23, 2020 at 01:37:17PM +0100, Stefan Hajnoczi wrote:
> A virtio_blk block device can still be referenced after hot unplug by
> userspace processes that hold the file descriptor.  In this case
> virtblk_getgeo() can be invoked after virtblk_remove() was called.  For
> example, a program that has /dev/vdb open can call ioctl(HDIO_GETGEO)
> after hot unplug.
> 
> Fix this by clearing vblk->disk->private_data and checking that the
> virtio_blk driver instance is still around in virtblk_getgeo().
> 
> Note that the virtblk_getgeo() function itself is guaranteed to remain
> in memory after hot unplug because the virtio_blk module refcount is
> still held while a block device reference exists.
> 
> Originally-by: Lance Digby <ldigby@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  drivers/block/virtio_blk.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 93468b7c6701..b50cdf37a6f7 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -300,6 +300,10 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
>  {
>  	struct virtio_blk *vblk = bd->bd_disk->private_data;
>  
> +	/* Driver instance has been removed */
> +	if (!vblk)
> +		return -ENOTTY;
> +
>  	/* see if the host passed in geometry config */
>  	if (virtio_has_feature(vblk->vdev, VIRTIO_BLK_F_GEOMETRY)) {
>  		virtio_cread(vblk->vdev, struct virtio_blk_config,

Just so I understand, what serializes this access?
See below for what looks like a race condition ...

> @@ -835,6 +839,7 @@ static void virtblk_remove(struct virtio_device *vdev)
>  	vdev->config->reset(vdev);
>  
>  	refc = kref_read(&disk_to_dev(vblk->disk)->kobj.kref);

So what if private_data is tested at this time ...

> +	vblk->disk->private_data = NULL;
>  	put_disk(vblk->disk);
>  	vdev->config->del_vqs(vdev);
>  	kfree(vblk->vqs);

... and then used at this time?

What prevents this?


> -- 
> 2.25.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
