Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B28451BC46D
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 18:03:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22EE08539F;
	Tue, 28 Apr 2020 16:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLrGTSjisClC; Tue, 28 Apr 2020 16:03:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 012BA85A1D;
	Tue, 28 Apr 2020 16:03:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7140C0172;
	Tue, 28 Apr 2020 16:03:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44D3DC0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 41813845DB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-hxM4z-TE3u
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:03:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8A7958448B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588089800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hBJi8zIGk8WOyhlWyio6gaGrcbzBQ/4UwNnQCnZWksU=;
 b=HSYs+E+rfXXOR+drQaCHDo96y6Z7wi3ie7UGSGNw0Jn8ivuNrTQe+LLkiEo4ncnSdmYLkU
 TB90T11XN2Sm8bmJoTS8wJAzcLlEth87Gb4O33ZL6JQa6hgD7uvpDcp1FYLuszMatbBltM
 5BX6B9wETEDcgafjFkgcEO1UHwPpzWQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-lMLzWJOTPaSwhetb-rKFmw-1; Tue, 28 Apr 2020 12:03:18 -0400
X-MC-Unique: lMLzWJOTPaSwhetb-rKFmw-1
Received: by mail-wm1-f72.google.com with SMTP id b203so1049897wmd.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 09:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hBJi8zIGk8WOyhlWyio6gaGrcbzBQ/4UwNnQCnZWksU=;
 b=K3wRjUgizHiAhY17prQOsCr+QsLdwAIerpqfByUHuvFKG0Q1QBZuLndioj64xzE/bS
 WX0TMcVlrWgHGs/DYP6tuFz80YjHSMLvCQZ/8zqud8P/ZWnW5DgrLWDjm/GxW/Xn/wXB
 MEd4nG0FifQj1hfDr30cFSDPASLAM5RffwT9VmPvp0iiP2OgBkssfhaHTBlFzHqWxy5/
 +f73GULlaVEVz77QEmQLR5MtEvKSMaoxSa716QPlOpv1nHk3SqwIaBYslj+OmdjKmGGd
 xAJEBth/YGroMghbxQVWIjVbAhNWarzz1wH9L6bGYwD3jkJzuaulfNvO+A8JDffkoC/J
 vLAw==
X-Gm-Message-State: AGi0PuaLWsPenwR3a+XJw+IA33RsLx+/6JdcRZA0JxiR7t5Xdip9HpoF
 cvHX/7mYrnAZEzmnwQimQdqG3UTQaE9PxVoCiQ9G7YOj3rBT80CHsKxx2j7MhPOgZ2LtoioYdB1
 OGcw47wMNiSAPFjUsnU6A5eY5ajyxA3w46ymJTJBG3g==
X-Received: by 2002:adf:9441:: with SMTP id 59mr33346452wrq.211.1588089796853; 
 Tue, 28 Apr 2020 09:03:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypJNhjJambiiyG5T3FZZ1d5lIJD6EM5AUWopnTqnTUlnP3xrL7KImVBSqMiGIyDR01pmOUe3Cw==
X-Received: by 2002:adf:9441:: with SMTP id 59mr33346389wrq.211.1588089796232; 
 Tue, 28 Apr 2020 09:03:16 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 l4sm26559989wrv.60.2020.04.28.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:03:15 -0700 (PDT)
Date: Tue, 28 Apr 2020 12:03:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2] virtio-blk: handle block_device_operations callbacks
 after hot unplug
Message-ID: <20200428120244-mutt-send-email-mst@kernel.org>
References: <20200428143009.107645-1-stefanha@redhat.com>
 <20200428110515-mutt-send-email-mst@kernel.org>
 <20200428155715.GA109767@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200428155715.GA109767@stefanha-x1.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 cohuck@redhat.com, linux-kernel@vger.kernel.org,
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

On Tue, Apr 28, 2020 at 04:57:15PM +0100, Stefan Hajnoczi wrote:
> On Tue, Apr 28, 2020 at 11:25:07AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Apr 28, 2020 at 03:30:09PM +0100, Stefan Hajnoczi wrote:
> > > A userspace process holding a file descriptor to a virtio_blk device can
> > > still invoke block_device_operations after hot unplug.  For example, a
> > > program that has /dev/vdb open can call ioctl(HDIO_GETGEO) after hot
> > > unplug to invoke virtblk_getgeo().
> > 
> > 
> > which causes what? a use after free?
> 
> Yes, use after free.  I will include the kernel panic in the next
> revision.
> 
> virtio_check_driver_offered_feature() accesses vdev->dev.driver, which
> doesn't work after virtblk_remove() has freed vdev :).
> 
> > > 
> > > Introduce a reference count in struct virtio_blk so that its lifetime
> > > covers both virtio_driver probe/remove and block_device_operations
> > > open/release users.  This ensures that block_device_operations functions
> > > like virtblk_getgeo() can safely access struct virtio_blk.
> > > 
> > > Add remove_mutex to prevent block_device_operations functions from
> > > accessing vblk->vdev during virtblk_remove() and let the safely check
> > 
> > let the -> let them?
> 
> Thanks, will fix.
> 
> > 
> > > for !vblk->vdev after virtblk_remove() returns.
> > > 
> > > Switching to a reference count also solves the vd_index_ida leak where
> > > vda, vdb, vdc, etc indices were lost when the device was hot unplugged
> > > while the block device was still open.
> > 
> > Can you move this statement up so we list both issues (use after free
> > and leak) upfront, then discuss the fix?
> 
> Thanks, will fix.

Maybe add Fixes: if there's a specific commit that added geo support.

> > 
> > > 
> > > Reported-by: Lance Digby <ldigby@redhat.com>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > > If someone has a simpler solution please let me know.  I looked at
> > > various approaches including reusing device_lock(&vblk->vdev.dev) but
> > > they were more complex and extending the lifetime of virtio_device after
> > > remove() has been called seems questionable.
> > > ---
> > >  drivers/block/virtio_blk.c | 85 ++++++++++++++++++++++++++++++++++----
> > >  1 file changed, 77 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > index 93468b7c6701..3dd53b445cc1 100644
> > > --- a/drivers/block/virtio_blk.c
> > > +++ b/drivers/block/virtio_blk.c
> > > @@ -44,6 +44,13 @@ struct virtio_blk {
> > >  	/* Process context for config space updates */
> > >  	struct work_struct config_work;
> > >  
> > > +	/*
> > > +	 * Tracks references from block_device_operations open/release and
> > > +	 * virtio_driver probe/remove so this object can be freed once no
> > > +	 * longer in use.
> > > +	 */
> > > +	refcount_t refs;
> > > +
> > >  	/* What host tells us, plus 2 for header & tailer. */
> > >  	unsigned int sg_elems;
> > >  
> > > @@ -53,6 +60,9 @@ struct virtio_blk {
> > >  	/* num of vqs */
> > >  	int num_vqs;
> > >  	struct virtio_blk_vq *vqs;
> > > +
> > > +	/* Provides mutual exclusion with virtblk_remove(). */
> > 
> > This is not the best way to document access rules.
> > Which fields does this protect, exactly?
> > I think it's just vdev. Right?
> > Pls add to the comment.
> 
> Yes, vblk->vdev cannot be dereferenced after virtblk_remove() is
> entered.
> 
> I'll document this mutex as protecting vdev.
> 
> > 
> > > +	struct mutex remove_mutex;
> > >  };
> > >  
> > >  struct virtblk_req {
> > > @@ -295,10 +305,54 @@ static int virtblk_get_id(struct gendisk *disk, char *id_str)
> > >  	return err;
> > >  }
> > >  
> > > +static void virtblk_get(struct virtio_blk *vblk)
> > > +{
> > > +	refcount_inc(&vblk->refs);
> > > +}
> > > +
> > > +static void virtblk_put(struct virtio_blk *vblk)
> > > +{
> > > +	if (refcount_dec_and_test(&vblk->refs)) {
> > > +		ida_simple_remove(&vd_index_ida, vblk->index);
> > > +		mutex_destroy(&vblk->remove_mutex);
> > > +		kfree(vblk);
> > > +	}
> > > +}
> > > +
> > > +static int virtblk_open(struct block_device *bd, fmode_t mode)
> > > +{
> > > +	struct virtio_blk *vblk = bd->bd_disk->private_data;
> > > +	int ret = -ENXIO;
> > 
> > 
> > It's more common to do
> > 
> > 	int ret = 0;
> > 
> > and on error:
> > 	ret = -ENXIO;
> > 
> > 
> > let's do this.
> 
> Will fix.
> 
> > > +
> > > +	mutex_lock(&vblk->remove_mutex);
> > > +
> > > +	if (vblk->vdev) {
> > > +		virtblk_get(vblk);
> > > +		ret = 0;
> > > +	}
> > 
> > I prefer
> > 	else
> > 		ret = -ENXIO
> > 
> > here.
> 
> Got it.
> 
> > > +
> > > +	mutex_unlock(&vblk->remove_mutex);
> > > +	return ret;
> > > +}
> > > +
> > > +static void virtblk_release(struct gendisk *disk, fmode_t mode)
> > > +{
> > > +	struct virtio_blk *vblk = disk->private_data;
> > > +
> > > +	virtblk_put(vblk);
> > > +}
> > > +
> > >  /* We provide getgeo only to please some old bootloader/partitioning tools */
> > >  static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
> > >  {
> > >  	struct virtio_blk *vblk = bd->bd_disk->private_data;
> > > +	int ret = -ENXIO;
> > 
> > It's more common to do
> > 
> > 	int ret = 0;
> > 
> > and on error:
> > 	ret = -ENXIO;
> > 
> > 
> > let's do this.
> 
> Will fix.
> 
> > 
> > > +
> > > +	mutex_lock(&vblk->remove_mutex);
> > > +
> > > +	if (!vblk->vdev) {
> > > +		goto out;
> > > +	}
> > 
> > 
> > single lines are not supposed to use {}.
> > if you add ret = -ENXIO here then it won't be a single line anymore
> > though.
> 
> Oops, a QEMU coding style habit :).
> 
> > >  
> > >  	/* see if the host passed in geometry config */
> > >  	if (virtio_has_feature(vblk->vdev, VIRTIO_BLK_F_GEOMETRY)) {
> > > @@ -314,11 +368,17 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
> > >  		geo->sectors = 1 << 5;
> > >  		geo->cylinders = get_capacity(bd->bd_disk) >> 11;
> > >  	}
> > > -	return 0;
> > > +
> > > +	ret = 0;
> > > +out:
> > > +	mutex_unlock(&vblk->remove_mutex);
> > > +	return ret;
> > >  }
> > >  
> > >  static const struct block_device_operations virtblk_fops = {
> > >  	.owner  = THIS_MODULE,
> > > +	.open = virtblk_open,
> > > +	.release = virtblk_release,
> > >  	.getgeo = virtblk_getgeo,
> > >  };
> > >  
> > > @@ -655,6 +715,10 @@ static int virtblk_probe(struct virtio_device *vdev)
> > >  		goto out_free_index;
> > >  	}
> > >  
> > > +	/* This reference is dropped in virtblk_remove(). */
> > > +	refcount_set(&vblk->refs, 1);
> > > +	mutex_init(&vblk->remove_mutex);
> > > +
> > >  	vblk->vdev = vdev;
> > >  	vblk->sg_elems = sg_elems;
> > >  
> > > @@ -820,8 +884,12 @@ static int virtblk_probe(struct virtio_device *vdev)
> > >  static void virtblk_remove(struct virtio_device *vdev)
> > >  {
> > >  	struct virtio_blk *vblk = vdev->priv;
> > > -	int index = vblk->index;
> > > -	int refc;
> > > +
> > > +	/*
> > > +	 * Virtqueue processing is stopped safely here but mutual exclusion is
> > > +	 * needed for block_device_operations.
> > > +	 */
> > > +	mutex_lock(&vblk->remove_mutex);
> > >  
> > >  	/* Make sure no work handler is accessing the device. */
> > >  	flush_work(&vblk->config_work);
> > > @@ -834,15 +902,16 @@ static void virtblk_remove(struct virtio_device *vdev)
> > >  	/* Stop all the virtqueues. */
> > >  	vdev->config->reset(vdev);
> > >  
> > > -	refc = kref_read(&disk_to_dev(vblk->disk)->kobj.kref);
> > > +	/* Virtqueue are stopped, nothing can use vblk->vdev anymore. */
> > 
> > Virtqueues?
> 
> Thanks, will fix.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
