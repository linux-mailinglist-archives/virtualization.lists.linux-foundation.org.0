Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B54131C3893
	for <lists.virtualization@lfdr.de>; Mon,  4 May 2020 13:49:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 47AFA869AC;
	Mon,  4 May 2020 11:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9UO-ZRqpgiq; Mon,  4 May 2020 11:48:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3321F8699E;
	Mon,  4 May 2020 11:48:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FDBAC088F;
	Mon,  4 May 2020 11:48:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD489C0175
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 11:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A3282882C4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 11:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LrLpaarulyT
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 11:48:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 377AD87E6D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588592930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVUbf4Vvyd7XKNKZTKfHUhQcEHuWOEo+8/NvmCcHaIU=;
 b=AOiGvk6usDturpaqLPVcRaSwTXn0X4rCWcEVVLAu3sGCCn5zlCWkkCVyjvnBEOku/vRuOa
 cFIyCAh4clYtmJF09BWSObHBixUFP5ZxxVhzRpb8g7SrHY0G6jbsahswYqA0Hj11c4WgRH
 ayqO5eubbNH2A86Xwbm+ZNlTiXZgNAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-GVPQcwnQMpe_TM179QC8zQ-1; Mon, 04 May 2020 07:48:47 -0400
X-MC-Unique: GVPQcwnQMpe_TM179QC8zQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 376FA835B44;
 Mon,  4 May 2020 11:48:45 +0000 (UTC)
Received: from gondolin (ovpn-112-215.ams2.redhat.com [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39A2C6A96B;
 Mon,  4 May 2020 11:48:37 +0000 (UTC)
Date: Mon, 4 May 2020 13:48:34 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4] virtio-blk: handle block_device_operations callbacks
 after hot unplug
Message-ID: <20200504134834.423eb89e.cohuck@redhat.com>
In-Reply-To: <20200430140442.171016-1-stefanha@redhat.com>
References: <20200430140442.171016-1-stefanha@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
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

On Thu, 30 Apr 2020 15:04:42 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

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

Should be

Fixes: 48e4043d4529 ("virtio: add virtio disk geometry feature")

> Reported-by: Lance Digby <ldigby@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v4:
>  * Clarify vdev_mutex usage [Stefano and Michael]
> 
>  drivers/block/virtio_blk.c | 86 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 78 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 93468b7c6701..9d21bf0f155e 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -33,6 +33,15 @@ struct virtio_blk_vq {
>  } ____cacheline_aligned_in_smp;
>  
>  struct virtio_blk {
> +	/*
> +	 * This mutex must be held by anything that may run after
> +	 * virtblk_remove() sets vblk->vdev to NULL.
> +	 *
> +	 * blk-mq, virtqueue processing, and sysfs attribute code paths are
> +	 * shut down before vblk->vdev is set to NULL and therefore do not need
> +	 * to hold this mutex.
> +	 */
> +	struct mutex vdev_mutex;
>  	struct virtio_device *vdev;
>  
>  	/* The disk structure for the kernel. */
> @@ -44,6 +53,13 @@ struct virtio_blk {
>  	/* Process context for config space updates */
>  	struct work_struct config_work;
>  
> +	/*
> +	 * Tracks references from block_device_operations open/release and
> +	 * virtio_driver probe/remove so this object can be freed once no
> +	 * longer in use.
> +	 */
> +	refcount_t refs;

Using a struct kref might be more idiomatic.

> +
>  	/* What host tells us, plus 2 for header & tailer. */
>  	unsigned int sg_elems;
>  
> @@ -295,10 +311,55 @@ static int virtblk_get_id(struct gendisk *disk, char *id_str)
>  	return err;
>  }
>  
> +static void virtblk_get(struct virtio_blk *vblk)
> +{
> +	refcount_inc(&vblk->refs);

Should the code even be able to grab a ref if !vblk->vdev?

> +}
> +
> +static void virtblk_put(struct virtio_blk *vblk)
> +{
> +	if (refcount_dec_and_test(&vblk->refs)) {
> +		ida_simple_remove(&vd_index_ida, vblk->index);
> +		mutex_destroy(&vblk->vdev_mutex);
> +		kfree(vblk);

I think that's where putting these cleanups into a release() funtion
would be more idiomatic.

> +	}
> +}

(...)

Looks sane to me.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
