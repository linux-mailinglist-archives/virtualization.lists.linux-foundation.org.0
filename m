Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F471B6FEE
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 10:42:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E1858810C;
	Fri, 24 Apr 2020 08:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id naD9NcIVzBxc; Fri, 24 Apr 2020 08:42:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCADD86822;
	Fri, 24 Apr 2020 08:42:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0D70C0175;
	Fri, 24 Apr 2020 08:42:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2D2BC0175
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 08:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C1FF986F2B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 08:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkaawK8TsOCh
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 08:42:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 03B3986F22
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587717724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eRBkH5/Xmo1XGOKZTIj29qxMagsUMmu9LlrB6+bvzhA=;
 b=EW70wBtr1F6SmUMHajB+MYX1jdUm3XualGWMRnZ6XPeYqa1/aHrF2333ns9kJ9X4VCA7Lc
 EW/iZq4hjF/oKFyL2aSp9+dcqieufvTKwdCmJZ2Ewts8vHWmnPNwairkJ55xxF5YJ8Og5K
 7INLAC5wTiA1+Gv6VvPg7ePSYA4jpm4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-To9Pj-CFNvWnNlFhqN7Vtg-1; Fri, 24 Apr 2020 04:42:02 -0400
X-MC-Unique: To9Pj-CFNvWnNlFhqN7Vtg-1
Received: by mail-wm1-f72.google.com with SMTP id 14so3885615wmo.9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 01:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eRBkH5/Xmo1XGOKZTIj29qxMagsUMmu9LlrB6+bvzhA=;
 b=q1Lekq0cTwA7K1JYU43G19HBvjdutUMbW1/RUr1HSlpq4zBp0oZXAhuWTedb1oofud
 u62Ed1DVMGEAREEER4JMNNvZsNUptRvpPLEzK8jZTdtFv5TH7lPvnRBfgkeTTQXd7y8j
 LY5emx4Ou6pp5TL4cI36hPPCTpe3PT3iZDa5PKEi0A53vXWEcmmj7dz2NCie+J4Ik/xY
 FB5JCu8nSQrgx9G7Ink1482eTtWSlIN9Qnx8KCIw+2KssYM0yKiwYZwUNHhJpCVV+QVF
 tRdO/SfUHnt5FErfnNHKf4LMMVf9PIHQxMStTsTHA56msmoHxVOlwofsUKIupjcXdBU2
 eaMw==
X-Gm-Message-State: AGi0PubE4nbk5jUH2cBwYnZNrMlaiwmr9opWqZlivq0RjHo91wElMCkM
 6UYxbDeC+jDt2DHcigPmFi+RY7r2QXsyPWhnpoPrVuFU5HmGx+BKAmtQEiCZ3d45jxV9CKY4WkG
 fIhFqGqEa2VKbz60fm/EJ9MuG9bpgMEUuEH+8OOto4Q==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr8507229wmj.3.1587717721285;
 Fri, 24 Apr 2020 01:42:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypKxuCqGvW3NHNyEw4+X3HPjqbYB2EyJcTmS/3W+wWEll8LclKWavyc7mGG0iFRlqlH/YaX6NQ==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr8507206wmj.3.1587717721017;
 Fri, 24 Apr 2020 01:42:01 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id s12sm1831955wmc.7.2020.04.24.01.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 01:42:00 -0700 (PDT)
Date: Fri, 24 Apr 2020 10:41:58 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio-blk: handle block_device_operations callbacks
 after hot unplug
Message-ID: <20200424084158.uayekt5c3lus4532@steredhat>
References: <20200423123717.139141-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200423123717.139141-1-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Lance Digby <ldigby@redhat.com>,
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
> @@ -835,6 +839,7 @@ static void virtblk_remove(struct virtio_device *vdev)
>  	vdev->config->reset(vdev);
>  
>  	refc = kref_read(&disk_to_dev(vblk->disk)->kobj.kref);
> +	vblk->disk->private_data = NULL;
>  	put_disk(vblk->disk);
>  	vdev->config->del_vqs(vdev);
>  	kfree(vblk->vqs);

As pointed out, can be a race. We had a very similar issue in
virtio-vsock, and we solved using RCU to assign and get the pointer [1],
maybe the same solution can work here.

Cheers,
Stefano

[1] 0deab087b16a vsock/virtio: use RCU to avoid use-after-free on the_virtio_vsock

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
