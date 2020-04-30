Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D49B1BF333
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 10:43:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4E6F86C32;
	Thu, 30 Apr 2020 08:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBE1Y5Gfwc15; Thu, 30 Apr 2020 08:43:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1867086C31;
	Thu, 30 Apr 2020 08:43:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3B0FC016F;
	Thu, 30 Apr 2020 08:43:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64A56C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5A39B86C32
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlSgCxzU94sv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F278E86C31
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588236212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1kM0a92K8sUlr72TjTnIA2PAkVDQz3aVDeS/XY8PMQg=;
 b=XDvpUvDhRnwOKZG+FPlzDGoCsF3fZiQ267Nabsh+hTaIQ2DlacOlaf9rs25zXqs7JTxeem
 3nAPQVR2/beI1RZT7wUAqZyKEBOU++YO/e/5e5YqRmI9QEnt4fMUFh5edwC7nZA8Alt1+D
 FdL6R5zoL+xRb+7l5kxDrawn/8PXuLE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-FdBjuockN4-TY9B1ekZnaw-1; Thu, 30 Apr 2020 04:43:28 -0400
X-MC-Unique: FdBjuockN4-TY9B1ekZnaw-1
Received: by mail-wr1-f71.google.com with SMTP id v9so3498758wrt.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 01:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1kM0a92K8sUlr72TjTnIA2PAkVDQz3aVDeS/XY8PMQg=;
 b=MPeuHMSipEy4egTO9bq7VugQ9pRJWHvRlunDjtP91bVq034CDuO4nHykrrE8hC1yNH
 7Uye3xYICINgwyWRnAnr0e9bG1IvM1N1FiNpFqaxPJfJGrV6ZqPPizECG+9MtnD0ZTby
 MKIShED3YvNcz30c9llYdgqlb0oiZ9mdWLYcDV2PfRoMeoxhSZFP0SPrtovcDDT26GNf
 fPxm/eMk5ipNygvlLz1Z613OzlIWlqZsJ4jLmsVg1HSe7Pxw7pv5xUsDCGKBeMyy3ma/
 SvpEEEQybdX6NVvsHmBmWmiquqSVZizvHGmugWyTkrqMWkGCMRrW3XsoFwxut6IG6VWC
 WunA==
X-Gm-Message-State: AGi0PuZ7xSBAxQxgwTDwCu7cZAiCXm/S9GRJ/Pzx5vrAxGXujVXh4qFr
 HgUQhfvoRGHbOoQGKHaQJmdVSxZmm8ooRH5LESfF9yWZUX/b90jCAMY1aT5u/46fQ8v2K4TyQl5
 44OR8olzPb/ZIQyzqIovLYkrbikHpe1kUdzH5xZJCEg==
X-Received: by 2002:adf:f4d1:: with SMTP id h17mr2481681wrp.69.1588236207414; 
 Thu, 30 Apr 2020 01:43:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypJw8hg1EN3eBuDG3y+jkkwakE2C8r3PVXSy4jnI3smooojJLNVd47P9FjcsLtLJYEZWpp/vOQ==
X-Received: by 2002:adf:f4d1:: with SMTP id h17mr2481646wrp.69.1588236207089; 
 Thu, 30 Apr 2020 01:43:27 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id l4sm2984683wrv.60.2020.04.30.01.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 01:43:26 -0700 (PDT)
Date: Thu, 30 Apr 2020 10:43:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3] virtio-blk: handle block_device_operations callbacks
 after hot unplug
Message-ID: <20200430084323.qts2q5ql7rkclk2h@steredhat>
References: <20200429165345.144702-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200429165345.144702-1-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, Lance Digby <ldigby@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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

On Wed, Apr 29, 2020 at 05:53:45PM +0100, Stefan Hajnoczi wrote:
> A userspace process holding a file descriptor to a virtio_blk device can
> still invoke block_device_operations after hot unplug.  This leads to a
> use-after-free accessing vblk->vdev in virtblk_getgeo() when
> ioctl(HDIO_GETGEO) is invoked:
> 
>   BUG: unable to handle kernel NULL pointer dereference at 0000000000000090
>   IP: [<ffffffffc00e5450>] virtio_check_driver_offered_feature+0x10/0x90 [virtio]
>   PGD 800000003a92f067 PUD 3a930067 PMD 0
>   Oops: 0000 [#1] SMP
>   CPU: 0 PID: 1310 Comm: hdio-getgeo Tainted: G           OE  ------------   3.10.0-1062.el7.x86_64 #1
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
>   task: ffff9be5fbfb8000 ti: ffff9be5fa890000 task.ti: ffff9be5fa890000
>   RIP: 0010:[<ffffffffc00e5450>]  [<ffffffffc00e5450>] virtio_check_driver_offered_feature+0x10/0x90 [virtio]
>   RSP: 0018:ffff9be5fa893dc8  EFLAGS: 00010246
>   RAX: ffff9be5fc3f3400 RBX: ffff9be5fa893e30 RCX: 0000000000000000
>   RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff9be5fbc10b40
>   RBP: ffff9be5fa893dc8 R08: 0000000000000301 R09: 0000000000000301
>   R10: 0000000000000000 R11: 0000000000000000 R12: ffff9be5fdc24680
>   R13: ffff9be5fbc10b40 R14: ffff9be5fbc10480 R15: 0000000000000000
>   FS:  00007f1bfb968740(0000) GS:ffff9be5ffc00000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 0000000000000090 CR3: 000000003a894000 CR4: 0000000000360ff0
>   DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>   DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>   Call Trace:
>    [<ffffffffc016ac37>] virtblk_getgeo+0x47/0x110 [virtio_blk]
>    [<ffffffff8d3f200d>] ? handle_mm_fault+0x39d/0x9b0
>    [<ffffffff8d561265>] blkdev_ioctl+0x1f5/0xa20
>    [<ffffffff8d488771>] block_ioctl+0x41/0x50
>    [<ffffffff8d45d9e0>] do_vfs_ioctl+0x3a0/0x5a0
>    [<ffffffff8d45dc81>] SyS_ioctl+0xa1/0xc0
> 
> A related problem is that virtblk_remove() leaks the vd_index_ida index
> when something still holds a reference to vblk->disk during hot unplug.
> This causes virtio-blk device names to be lost (vda, vdb, etc).
> 
> Fix these issues by protecting vblk->vdev with a mutex and reference
> counting vblk so the vd_index_ida index can be removed in all cases.
> 
> Fixes: 48e4043d4529523cbc7fa8dd745bd8e2c45ce1d3
>        ("virtio: add virtio disk geometry feature")
> Reported-by: Lance Digby <ldigby@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  drivers/block/virtio_blk.c | 87 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 79 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 93468b7c6701..6f7f277495f4 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -33,6 +33,16 @@ struct virtio_blk_vq {
>  } ____cacheline_aligned_in_smp;
>  
>  struct virtio_blk {
> +	/*
> +	 * vdev may be accessed without taking this mutex in blk-mq and
> +	 * virtqueue code paths because virtblk_remove() stops them before vdev
> +	 * is freed.
> +	 *
> +	 * Everything else must hold this mutex when accessing vdev and must
> +	 * handle the case where vdev is NULL after virtblk_remove() has been
> +	 * called.
> +	 */
> +	struct mutex vdev_mutex;

The patch LGTM, I'm just worried about cache_type_store() and
cache_type_show() because IIUC they aren't in blk-mq and virtqueue code
paths, but they use vdev.

Do we have to take the mutex there too?

Thanks,
Stefano

>  	struct virtio_device *vdev;
>  
>  	/* The disk structure for the kernel. */
> @@ -44,6 +54,13 @@ struct virtio_blk {
>  	/* Process context for config space updates */
>  	struct work_struct config_work;
>  
> +	/*
> +	 * Tracks references from block_device_operations open/release and
> +	 * virtio_driver probe/remove so this object can be freed once no
> +	 * longer in use.
> +	 */
> +	refcount_t refs;
> +
>  	/* What host tells us, plus 2 for header & tailer. */
>  	unsigned int sg_elems;
>  
> @@ -295,10 +312,55 @@ static int virtblk_get_id(struct gendisk *disk, char *id_str)
>  	return err;
>  }
>  
> +static void virtblk_get(struct virtio_blk *vblk)
> +{
> +	refcount_inc(&vblk->refs);
> +}
> +
> +static void virtblk_put(struct virtio_blk *vblk)
> +{
> +	if (refcount_dec_and_test(&vblk->refs)) {
> +		ida_simple_remove(&vd_index_ida, vblk->index);
> +		mutex_destroy(&vblk->vdev_mutex);
> +		kfree(vblk);
> +	}
> +}
> +
> +static int virtblk_open(struct block_device *bd, fmode_t mode)
> +{
> +	struct virtio_blk *vblk = bd->bd_disk->private_data;
> +	int ret = 0;
> +
> +	mutex_lock(&vblk->vdev_mutex);
> +
> +	if (vblk->vdev)
> +		virtblk_get(vblk);
> +	else
> +		ret = -ENXIO;
> +
> +	mutex_unlock(&vblk->vdev_mutex);
> +	return ret;
> +}
> +
> +static void virtblk_release(struct gendisk *disk, fmode_t mode)
> +{
> +	struct virtio_blk *vblk = disk->private_data;
> +
> +	virtblk_put(vblk);
> +}
> +
>  /* We provide getgeo only to please some old bootloader/partitioning tools */
>  static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
>  {
>  	struct virtio_blk *vblk = bd->bd_disk->private_data;
> +	int ret = 0;
> +
> +	mutex_lock(&vblk->vdev_mutex);
> +
> +	if (!vblk->vdev) {
> +		ret = -ENXIO;
> +		goto out;
> +	}
>  
>  	/* see if the host passed in geometry config */
>  	if (virtio_has_feature(vblk->vdev, VIRTIO_BLK_F_GEOMETRY)) {
> @@ -314,11 +376,15 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
>  		geo->sectors = 1 << 5;
>  		geo->cylinders = get_capacity(bd->bd_disk) >> 11;
>  	}
> -	return 0;
> +out:
> +	mutex_unlock(&vblk->vdev_mutex);
> +	return ret;
>  }
>  
>  static const struct block_device_operations virtblk_fops = {
>  	.owner  = THIS_MODULE,
> +	.open = virtblk_open,
> +	.release = virtblk_release,
>  	.getgeo = virtblk_getgeo,
>  };
>  
> @@ -655,6 +721,10 @@ static int virtblk_probe(struct virtio_device *vdev)
>  		goto out_free_index;
>  	}
>  
> +	/* This reference is dropped in virtblk_remove(). */
> +	refcount_set(&vblk->refs, 1);
> +	mutex_init(&vblk->vdev_mutex);
> +
>  	vblk->vdev = vdev;
>  	vblk->sg_elems = sg_elems;
>  
> @@ -820,8 +890,6 @@ static int virtblk_probe(struct virtio_device *vdev)
>  static void virtblk_remove(struct virtio_device *vdev)
>  {
>  	struct virtio_blk *vblk = vdev->priv;
> -	int index = vblk->index;
> -	int refc;
>  
>  	/* Make sure no work handler is accessing the device. */
>  	flush_work(&vblk->config_work);
> @@ -831,18 +899,21 @@ static void virtblk_remove(struct virtio_device *vdev)
>  
>  	blk_mq_free_tag_set(&vblk->tag_set);
>  
> +	mutex_lock(&vblk->vdev_mutex);
> +
>  	/* Stop all the virtqueues. */
>  	vdev->config->reset(vdev);
>  
> -	refc = kref_read(&disk_to_dev(vblk->disk)->kobj.kref);
> +	/* Virtqueues are stopped, nothing can use vblk->vdev anymore. */
> +	vblk->vdev = NULL;
> +
>  	put_disk(vblk->disk);
>  	vdev->config->del_vqs(vdev);
>  	kfree(vblk->vqs);
> -	kfree(vblk);
>  
> -	/* Only free device id if we don't have any users */
> -	if (refc == 1)
> -		ida_simple_remove(&vd_index_ida, index);
> +	mutex_unlock(&vblk->vdev_mutex);
> +
> +	virtblk_put(vblk);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> -- 
> 2.25.3
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
