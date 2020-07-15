Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1DB220C68
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 13:53:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1D428B2A4;
	Wed, 15 Jul 2020 11:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2RKI071WJ+Y; Wed, 15 Jul 2020 11:53:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 236018B2B0;
	Wed, 15 Jul 2020 11:53:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 058ECC0733;
	Wed, 15 Jul 2020 11:53:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF17AC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 11:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D69A32048A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 11:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oy1wJYA4NMYx
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 11:53:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id BBBF320488
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594813992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XRebg+2hQH/Gw0w35KIF4+WcCOOUcfl15x3ccfbN2AQ=;
 b=O20OELM49Xr0qDIoGZCnKj6UVpVz+GaHqhKe81dRV59AGw6oizviDbrZMBifuKx65Ezd2Q
 8at+nv3swqu2iEdTnYAPNng2mx0+P7JYA3QnbiBXeVt5Cpj364XqTIPCScCvEyunNallXB
 jz3VsNAC79L7zY0hY1dGjDg60++pse8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-1PpijuOGNFawbK1eoGsl-w-1; Wed, 15 Jul 2020 07:53:10 -0400
X-MC-Unique: 1PpijuOGNFawbK1eoGsl-w-1
Received: by mail-qk1-f200.google.com with SMTP id q192so1302811qka.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 04:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XRebg+2hQH/Gw0w35KIF4+WcCOOUcfl15x3ccfbN2AQ=;
 b=VQyEn6VZM0VIH2e5KtODa6Hw4hjF2RoEUFEVIy0XB3dh6mxRQ9OnVaRdXnIg6MJ6f5
 w68qCULwQajET0+a+cJx+OllqmQDjqT9V5YjNZ2IaGqdiVns8JN35tVfm+G3KfppC324
 Zylnp/EOAQqFC51eh3fDL7da/769o1UNoQmLv88dSP98+oDmMMqLc1lH0rF8Msb+jKCl
 Hu/WoV/EFKswCZvlGE8m79qp/dbftFZ5r8HqFC/vdZ+ze5TInUo+I3LxfuXx+5zbBArQ
 y6FdMAfjQIfQxutZaLdIxp6bKCwJPKJAm1x7ZLbYL5IA8wfFNB81GtpilVZdHDY6UuZI
 AwsA==
X-Gm-Message-State: AOAM530UwsI/Pe3UOTDaY8ynXW9QqSgi5Eom8yActMs8h7oI8U/ZKUPb
 r5lIbyDZlYSIzkZTXCUaY2wo98ifQM/k+UQE9z9W+Z16tQARFbwXHJWZ2ltDAXyK79tAExf0xWc
 xGcEYXS2pjIxGBnf8Rt3Q0/1Ztio72yOFSZTOQJiXgg==
X-Received: by 2002:ac8:1bad:: with SMTP id z42mr10171630qtj.110.1594813990105; 
 Wed, 15 Jul 2020 04:53:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZLQW6IPoaal5RqoixSgcxDNeoXQMbVkN1Hy7ePJAHUY2LlFS6AhokOzXIHgq7pLbao1Bw3A==
X-Received: by 2002:ac8:1bad:: with SMTP id z42mr10171616qtj.110.1594813989842; 
 Wed, 15 Jul 2020 04:53:09 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id u27sm2131046qkm.121.2020.07.15.04.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 04:53:09 -0700 (PDT)
Date: Wed, 15 Jul 2020 07:53:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] virtio-blk: check host supplied logical block size
Message-ID: <20200715075151-mutt-send-email-mst@kernel.org>
References: <20200715095518.3724-1-mlevitsk@redhat.com>
 <20200715060233-mutt-send-email-mst@kernel.org>
 <5dd5af8032160eb49a4f0e38749e2d9cd968a0d6.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5dd5af8032160eb49a4f0e38749e2d9cd968a0d6.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Wed, Jul 15, 2020 at 01:19:55PM +0300, Maxim Levitsky wrote:
> On Wed, 2020-07-15 at 06:06 -0400, Michael S. Tsirkin wrote:
> > On Wed, Jul 15, 2020 at 12:55:18PM +0300, Maxim Levitsky wrote:
> > > Linux kernel only supports logical block sizes which are power of
> > > two,
> > > at least 512 bytes and no more that PAGE_SIZE.
> > > 
> > > Check this instead of crashing later on.
> > > 
> > > Note that there is no need to check physical block size since it is
> > > only a hint, and virtio-blk already only supports power of two
> > > values.
> > > 
> > > Bugzilla link: https://bugzilla.redhat.com/show_bug.cgi?id=1664619
> > > 
> > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > ---
> > >  drivers/block/virtio_blk.c | 20 ++++++++++++++++++--
> > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > index 980df853ee497..36dda31cc4e96 100644
> > > --- a/drivers/block/virtio_blk.c
> > > +++ b/drivers/block/virtio_blk.c
> > > @@ -681,6 +681,12 @@ static const struct blk_mq_ops virtio_mq_ops =
> > > {
> > >  static unsigned int virtblk_queue_depth;
> > >  module_param_named(queue_depth, virtblk_queue_depth, uint, 0444);
> > >  
> > > +
> > > +static bool virtblk_valid_block_size(unsigned int blksize)
> > > +{
> > > +	return blksize >= 512 && blksize <= PAGE_SIZE &&
> > > is_power_of_2(blksize);
> > > +}
> > > +
> > 
> > Is this a blk core assumption? in that case, does not this belong
> > in blk core?
> 
> It is a blk core assumption. 
> I had checked other drivers and these that have variable block size all
> check this manually like that.
> 
> I don't mind fixing all of them but I am a bit afraid to create
> too much mess.

You don't have to, start by adding this in blk core and using in virtio.
Patches to update all drivers can then come separately.

> > 
> > >  static int virtblk_probe(struct virtio_device *vdev)
> > >  {
> > >  	struct virtio_blk *vblk;
> > > @@ -809,9 +815,16 @@ static int virtblk_probe(struct virtio_device
> > > *vdev)
> > >  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
> > >  				   struct virtio_blk_config, blk_size,
> > >  				   &blk_size);
> > > -	if (!err)
> > > +	if (!err) {
> > > +		if (!virtblk_valid_block_size(blk_size)) {
> > > +			dev_err(&vdev->dev,
> > > +				"%s failure: unsupported logical block
> > > size %d\n",
> > > +				__func__, blk_size);
> > > +			err = -EINVAL;
> > > +			goto out_cleanup_queue;
> > > +		}
> > >  		blk_queue_logical_block_size(q, blk_size);
> > > -	else
> > > +	} else
> > >  		blk_size = queue_logical_block_size(q);
> > >  
> > >  	/* Use topology information if available */
> > 
> > OK so if we are doing this pls add {} around  blk_size =
> > queue_logical_block_size(q);
> > too.
> Will do.
> 
> > 
> > > @@ -872,6 +885,9 @@ static int virtblk_probe(struct virtio_device
> > > *vdev)
> > >  	device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
> > >  	return 0;
> > >  
> > > +out_cleanup_queue:
> > > +	blk_cleanup_queue(vblk->disk->queue);
> > > +	vblk->disk->queue = NULL;
> > >  out_free_tags:
> > >  	blk_mq_free_tag_set(&vblk->tag_set);
> > >  out_put_disk:
> > > -- 
> > > 2.26.2
> 
> 
> Best regards,
> 	Maxim Levitsky

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
