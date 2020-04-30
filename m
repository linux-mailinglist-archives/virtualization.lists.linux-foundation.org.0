Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF71BF5CA
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 12:44:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 52EC087E08;
	Thu, 30 Apr 2020 10:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EsaPj1jqzZQT; Thu, 30 Apr 2020 10:44:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7677687DC4;
	Thu, 30 Apr 2020 10:44:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52546C016F;
	Thu, 30 Apr 2020 10:44:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8717BC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 83798877DF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YitgqceLwc8b
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:44:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2F6C3877A4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588243451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/BSehBAKSN0nwBzw1nOctUAYHBMNoV8xn17tmQQttA=;
 b=LedLzuZJ2iukfulLBibxyaZI56SGfeOFGfM3dAMCj4FuABRD12TP2KHF9i38dSrOWBoqem
 N09MoOGyQtzVuJbEleD6/W/4hFJwXTUT7RkRFqY+QN2KNYOx78NBciPNkOgRRv24JBYf0V
 Kosw6ZRhyZLEBYGw0upF7N3sVR7QjzQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-TzYrhZBnPl-W79Om0EGnww-1; Thu, 30 Apr 2020 06:44:10 -0400
X-MC-Unique: TzYrhZBnPl-W79Om0EGnww-1
Received: by mail-wm1-f72.google.com with SMTP id n127so427351wme.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c/BSehBAKSN0nwBzw1nOctUAYHBMNoV8xn17tmQQttA=;
 b=I/7j5sSUbX9vDORTq6bxVs33wBorcpTNuh4jXVsoF/pUTMWtQGpLrFzzcZKOcY4Cnc
 ZrD6V0EMVEIi7WYHUYmPdmWPaMcvXr7t86oOzu3NxRY8pWzXR7lHnT1zOEW8ZuK8OKOe
 j6cpQfGwd43ZrItAkVwHoGeyxIeJIyJGk97y0Z5OaMu92pFcxCL4sk7GfGAec3EESF+/
 qDr5ziFapvjmfJivKlVtSaL2D+CyfU2hxJQkin+iWjMv5JNCcr5s3oLyukxnr/NQdp8O
 XwJWtRySAVuow5q+F97k2e25uwB8Z8JZhkGNChbo+DssPEX+vQvxRf1OjExXwv7ek4SM
 J3hA==
X-Gm-Message-State: AGi0PubGJuJ3zXQ7iE2C8FPIifM0Hz7dFOQ0M60LmXTNBQYd1l3WyJFb
 EE7NTll0BbdLjHi26sgngkZwZUJZkQ1GDYf9n1t1xQdcS+u9FUZ6HDO6k+JydX2SrQqNiKYRqGU
 SklieHsCxxWZaq//cZhjyDz2OWpSazIV9hNQFO9IYmw==
X-Received: by 2002:a5d:4252:: with SMTP id s18mr3112398wrr.367.1588243449000; 
 Thu, 30 Apr 2020 03:44:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ1quCNpfJZHUNzPMjzd9Th59ts8HRWcQGuNOmO8/gQLyE28fsfGJakOa0t33lAO/qw4cInug==
X-Received: by 2002:a5d:4252:: with SMTP id s18mr3112376wrr.367.1588243448703; 
 Thu, 30 Apr 2020 03:44:08 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id m188sm11659549wme.47.2020.04.30.03.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 03:44:07 -0700 (PDT)
Date: Thu, 30 Apr 2020 12:44:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3] virtio-blk: handle block_device_operations callbacks
 after hot unplug
Message-ID: <20200430104405.vtpuro47dqseiyxl@steredhat>
References: <20200429165345.144702-1-stefanha@redhat.com>
 <20200430084323.qts2q5ql7rkclk2h@steredhat>
 <20200430101410.GA164094@stefanha-x1.localdomain>
 <20200430062549-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200430062549-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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

On Thu, Apr 30, 2020 at 06:28:21AM -0400, Michael S. Tsirkin wrote:
> On Thu, Apr 30, 2020 at 11:14:10AM +0100, Stefan Hajnoczi wrote:
> > On Thu, Apr 30, 2020 at 10:43:23AM +0200, Stefano Garzarella wrote:
> > > On Wed, Apr 29, 2020 at 05:53:45PM +0100, Stefan Hajnoczi wrote:
> > > > A userspace process holding a file descriptor to a virtio_blk device can
> > > > still invoke block_device_operations after hot unplug.  This leads to a
> > > > use-after-free accessing vblk->vdev in virtblk_getgeo() when
> > > > ioctl(HDIO_GETGEO) is invoked:
> > > > 
> > > >   BUG: unable to handle kernel NULL pointer dereference at 0000000000000090
> > > >   IP: [<ffffffffc00e5450>] virtio_check_driver_offered_feature+0x10/0x90 [virtio]
> > > >   PGD 800000003a92f067 PUD 3a930067 PMD 0
> > > >   Oops: 0000 [#1] SMP
> > > >   CPU: 0 PID: 1310 Comm: hdio-getgeo Tainted: G           OE  ------------   3.10.0-1062.el7.x86_64 #1
> > > >   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
> > > >   task: ffff9be5fbfb8000 ti: ffff9be5fa890000 task.ti: ffff9be5fa890000
> > > >   RIP: 0010:[<ffffffffc00e5450>]  [<ffffffffc00e5450>] virtio_check_driver_offered_feature+0x10/0x90 [virtio]
> > > >   RSP: 0018:ffff9be5fa893dc8  EFLAGS: 00010246
> > > >   RAX: ffff9be5fc3f3400 RBX: ffff9be5fa893e30 RCX: 0000000000000000
> > > >   RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff9be5fbc10b40
> > > >   RBP: ffff9be5fa893dc8 R08: 0000000000000301 R09: 0000000000000301
> > > >   R10: 0000000000000000 R11: 0000000000000000 R12: ffff9be5fdc24680
> > > >   R13: ffff9be5fbc10b40 R14: ffff9be5fbc10480 R15: 0000000000000000
> > > >   FS:  00007f1bfb968740(0000) GS:ffff9be5ffc00000(0000) knlGS:0000000000000000
> > > >   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > >   CR2: 0000000000000090 CR3: 000000003a894000 CR4: 0000000000360ff0
> > > >   DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > >   DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > >   Call Trace:
> > > >    [<ffffffffc016ac37>] virtblk_getgeo+0x47/0x110 [virtio_blk]
> > > >    [<ffffffff8d3f200d>] ? handle_mm_fault+0x39d/0x9b0
> > > >    [<ffffffff8d561265>] blkdev_ioctl+0x1f5/0xa20
> > > >    [<ffffffff8d488771>] block_ioctl+0x41/0x50
> > > >    [<ffffffff8d45d9e0>] do_vfs_ioctl+0x3a0/0x5a0
> > > >    [<ffffffff8d45dc81>] SyS_ioctl+0xa1/0xc0
> > > > 
> > > > A related problem is that virtblk_remove() leaks the vd_index_ida index
> > > > when something still holds a reference to vblk->disk during hot unplug.
> > > > This causes virtio-blk device names to be lost (vda, vdb, etc).
> > > > 
> > > > Fix these issues by protecting vblk->vdev with a mutex and reference
> > > > counting vblk so the vd_index_ida index can be removed in all cases.
> > > > 
> > > > Fixes: 48e4043d4529523cbc7fa8dd745bd8e2c45ce1d3
> > > >        ("virtio: add virtio disk geometry feature")
> > > > Reported-by: Lance Digby <ldigby@redhat.com>
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > >  drivers/block/virtio_blk.c | 87 ++++++++++++++++++++++++++++++++++----
> > > >  1 file changed, 79 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > > index 93468b7c6701..6f7f277495f4 100644
> > > > --- a/drivers/block/virtio_blk.c
> > > > +++ b/drivers/block/virtio_blk.c
> > > > @@ -33,6 +33,16 @@ struct virtio_blk_vq {
> > > >  } ____cacheline_aligned_in_smp;
> > > >  
> > > >  struct virtio_blk {
> > > > +	/*
> > > > +	 * vdev may be accessed without taking this mutex in blk-mq and
> > > > +	 * virtqueue code paths because virtblk_remove() stops them before vdev
> > > > +	 * is freed.
> > > > +	 *
> > > > +	 * Everything else must hold this mutex when accessing vdev and must
> > > > +	 * handle the case where vdev is NULL after virtblk_remove() has been
> > > > +	 * called.
> > > > +	 */
> > > > +	struct mutex vdev_mutex;
> > > 
> > > The patch LGTM, I'm just worried about cache_type_store() and
> > > cache_type_show() because IIUC they aren't in blk-mq and virtqueue code
> > > paths, but they use vdev.
> > > 
> > > Do we have to take the mutex there too?
> > 
> > No, because del_gendisk() in virtblk_remove() deletes the sysfs
> > attributes before vblk->vdev is set to NULL.  kernfs deactivates the
> > kernfs nodes so that further read()/write() operations fail with ENODEV
> > (see fs/kernfs/dir.c and fs/kernfs/file.c).

Thanks for the clarification!

> > 
> > I have tested that a userspace process with a sysfs attr file open
> > cannot access the attribute after virtblk_remove().

Great!

> > 
> > Stefan
> 
> Sounds good, but pls update the comment adding something like
> " .. or anything coming from block layer since del_gendisk()
>   in virtblk_remove deletes the disk before vblk->vdev is set to NULL.
> "

With the comment fixed:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
