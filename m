Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2D5220985
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 12:06:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 589B18872B;
	Wed, 15 Jul 2020 10:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBJ4lxJvYUTo; Wed, 15 Jul 2020 10:06:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D191B88728;
	Wed, 15 Jul 2020 10:06:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B778EC07FF;
	Wed, 15 Jul 2020 10:06:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77A2CC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CAACD22658
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZfVS-yeD2+r
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:06:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id C541622274
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594807602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xBNcpWQc4Ly7N1dkjlNTikVzXMkApkE+anJ2teQxPYU=;
 b=ds2aWWDNbOgcmj+2X4jaIhqCYfIV8vVWlfTxeo0rpjk6dyEsszL+jS9wwHAIyHTuAGg23X
 x0h77YzsLENk2RT5ytMD9PUAqrY9IjNIdw+0E7I0+quLR7wsUAP4zEGgOPzIvUjS1fOPHi
 +jVKZV0vsKztYHQfGO0d35abxBXWRoU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-B0h-s3dgMMylAYOzmL5r-w-1; Wed, 15 Jul 2020 06:06:41 -0400
X-MC-Unique: B0h-s3dgMMylAYOzmL5r-w-1
Received: by mail-wr1-f72.google.com with SMTP id y16so759784wrr.20
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 03:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xBNcpWQc4Ly7N1dkjlNTikVzXMkApkE+anJ2teQxPYU=;
 b=Nxsh8RFsg0wJncyDhC314icfnWMyl5smWwJrtI+Y/ZS4+5jmTsPTHVyMGQY/BQMiCL
 RcoYRrmej0CI6WMfztOJ8dtFNLZzYlqlDSxn1e8hEgemYqAK+dS/F2i6GFmrHw++Z2vl
 6BaGCscvL6PRtKZN/yYYDItx81kErAy97SMucj6bKuetIZh0BGTJCPgiigktyWHShH+h
 jMd4gyJUT9XfFYzghb8LbvS5VRJivon6Z1FgPb2SaZTkzZA0MewFtx8sUpxVz9KhQk3X
 wXJhkEPS1OOLzNpg6yClP736B5RUYlKJtd7vr70n+7fyK8VjjDXDzzMo+y29ZEnt0oD7
 x/EQ==
X-Gm-Message-State: AOAM5315iBgCbxgrnwMfNJTL0/nqSMg3XBjTd4TGFvOMgaflOkEOmRcx
 BpP/rtkdjUydj91NkKY7kyJpBxKoGkRueS4qH8Spjrt9B4NWHr6MiB5M5AdVp9qYvCj5t1T2jfG
 6kHKlXqALMuYy2IIPD5/bNGdO4abEgyAa8Zy9BIQmTw==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr10603201wrw.370.1594807599930; 
 Wed, 15 Jul 2020 03:06:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwea8LjSmMMg83WCulVLpJxzWYofbQm7iliNTI4DNdbx1Z3ZYCaB7MdTPLhYSHvHIsiYhllvA==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr10603175wrw.370.1594807599711; 
 Wed, 15 Jul 2020 03:06:39 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id u15sm2743100wrm.64.2020.07.15.03.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 03:06:38 -0700 (PDT)
Date: Wed, 15 Jul 2020 06:06:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] virtio-blk: check host supplied logical block size
Message-ID: <20200715060233-mutt-send-email-mst@kernel.org>
References: <20200715095518.3724-1-mlevitsk@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200715095518.3724-1-mlevitsk@redhat.com>
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

On Wed, Jul 15, 2020 at 12:55:18PM +0300, Maxim Levitsky wrote:
> Linux kernel only supports logical block sizes which are power of two,
> at least 512 bytes and no more that PAGE_SIZE.
> 
> Check this instead of crashing later on.
> 
> Note that there is no need to check physical block size since it is
> only a hint, and virtio-blk already only supports power of two values.
> 
> Bugzilla link: https://bugzilla.redhat.com/show_bug.cgi?id=1664619
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  drivers/block/virtio_blk.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 980df853ee497..36dda31cc4e96 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -681,6 +681,12 @@ static const struct blk_mq_ops virtio_mq_ops = {
>  static unsigned int virtblk_queue_depth;
>  module_param_named(queue_depth, virtblk_queue_depth, uint, 0444);
>  
> +
> +static bool virtblk_valid_block_size(unsigned int blksize)
> +{
> +	return blksize >= 512 && blksize <= PAGE_SIZE && is_power_of_2(blksize);
> +}
> +

Is this a blk core assumption? in that case, does not this belong
in blk core?

>  static int virtblk_probe(struct virtio_device *vdev)
>  {
>  	struct virtio_blk *vblk;
> @@ -809,9 +815,16 @@ static int virtblk_probe(struct virtio_device *vdev)
>  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
>  				   struct virtio_blk_config, blk_size,
>  				   &blk_size);
> -	if (!err)
> +	if (!err) {
> +		if (!virtblk_valid_block_size(blk_size)) {
> +			dev_err(&vdev->dev,
> +				"%s failure: unsupported logical block size %d\n",
> +				__func__, blk_size);
> +			err = -EINVAL;
> +			goto out_cleanup_queue;
> +		}
>  		blk_queue_logical_block_size(q, blk_size);
> -	else
> +	} else
>  		blk_size = queue_logical_block_size(q);
>  
>  	/* Use topology information if available */

OK so if we are doing this pls add {} around  blk_size = queue_logical_block_size(q);
too.

> @@ -872,6 +885,9 @@ static int virtblk_probe(struct virtio_device *vdev)
>  	device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
>  	return 0;
>  
> +out_cleanup_queue:
> +	blk_cleanup_queue(vblk->disk->queue);
> +	vblk->disk->queue = NULL;
>  out_free_tags:
>  	blk_mq_free_tag_set(&vblk->tag_set);
>  out_put_disk:
> -- 
> 2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
