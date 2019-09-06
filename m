Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E432ABA26
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 16:03:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 358ED2356;
	Fri,  6 Sep 2019 14:03:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3C7232351
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:03:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B2D597DB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:03:02 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29EED69066
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:03:02 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id h18so6348672qto.18
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 07:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=69RmnXR6zcsEVhnC3KQRmXknmA6GZn+HdYR3IeVhjJw=;
	b=sd6XiSDqWsloXACdN4wqKzC0VnjWJDRtFZ7r4KqVgnLQzlZhZfsGgb0eO7UxfwCBxX
	5NQR3BG8NmXOJWC7oQCgUqUTKq20Bx8RIRJ8zrIF9zSMBerFf7eeyczTLCKbeLLX/ql/
	YDEJVkf/TkrdfJcgCQV9k9muP01xgts335dlANeRmEHbmUtij7H01gvCYSd+DEOmSHgd
	sfg8rEf41vPXkOT3HTCmy0qOtWuKA5RNDVtf8QtQujPD42RPjpFrFenwnrp/YyPujS2R
	tdDR9m/pENV/1dpJREWreacwlikmFP0CwCZmvJRDXdOE+aDZtAxDsCZg7IDeehckQXQT
	wX7g==
X-Gm-Message-State: APjAAAU2CbCP/taOpckYxd9YfpY9+49CnTmbOQVRYXv1T7myHgeTFLsi
	EKm/GLhoe2RKJRVTCyqyQb7LcC1zn/Pe+qQPCPuLGGb0U66zFy0FueRHQ8WrCFfcyWOBA54eIRN
	iUCCFIWk921NiKx2GtYW+eeFdR8hpZQGrlCYOzwtMNQ==
X-Received: by 2002:ac8:6a15:: with SMTP id t21mr9290532qtr.145.1567778581517; 
	Fri, 06 Sep 2019 07:03:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcpH88rdeTHqxjQr9dT1lPBuVD/AjE6lRlaotJPnRZBpDHEe56xygVfVxboYQ47stviHNvVg==
X-Received: by 2002:ac8:6a15:: with SMTP id t21mr9290512qtr.145.1567778581326; 
	Fri, 06 Sep 2019 07:03:01 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	c26sm3344940qtk.93.2019.09.06.07.02.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 07:03:00 -0700 (PDT)
Date: Fri, 6 Sep 2019 10:02:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matthias Lange <matthias.lange@kernkonzept.com>
Subject: Re: [PATCH] virtio_ring: fix unmap of indirect descriptors
Message-ID: <20190906095904-mutt-send-email-mst@kernel.org>
References: <20190906120659.4545-1-matthias.lange@kernkonzept.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906120659.4545-1-matthias.lange@kernkonzept.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, Sep 06, 2019 at 02:06:59PM +0200, Matthias Lange wrote:
> The function virtqueue_add_split() DMA-maps the scatterlist buffers. In
> case a mapping error occurs the already mapped buffers must be unmapped.
> This happens by jumping to the 'unmap_release' label.
> 
> In case of indirect descriptors the release is wrong and may leak kernel
> memory. Because the implementation assumes that the head descriptor is
> already mapped it starts iterating over the descriptor list starting
> from the head descriptor. However for indirect descriptors the head
> descriptor is never mapped in case of an error.
> 
> The fix is to initialize the start index with zero in case of indirect
> descriptors and use the 'desc' pointer directly for iterating over the
> descriptor chain.
> 
> This fix also changes the return code from EIO to ENOSPC in case of a
> mapping error. The reason is that drivers such as virtio_blk may retry
> their request and thus can recover from a mapping error.
> 
> Signed-off-by: Matthias Lange <matthias.lange@kernkonzept.com>

Thanks for the patch!

However please, split this to 2 patches.
I think the 1st patch at least is a stable candidate.

About the return code part - could you please add a bit more explanation
in the commit log? E.g. document when does it trigger and what is the
effect of the fix.  Thanks!

> ---
>  drivers/virtio/virtio_ring.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index c8be1c4f5b55..d2e001f92e6e 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -566,13 +566,17 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
>  
>  unmap_release:
>  	err_idx = i;
> -	i = head;
> +
> +	if (indirect)
> +		i = 0;
> +	else
> +		i = head;
>  
>  	for (n = 0; n < total_sg; n++) {
>  		if (i == err_idx)
>  			break;
>  		vring_unmap_one_split(vq, &desc[i]);
> -		i = virtio16_to_cpu(_vq->vdev, vq->split.vring.desc[i].next);
> +		i = virtio16_to_cpu(_vq->vdev, desc[i].next);
>  	}
>  
>  	if (indirect)
> @@ -1081,7 +1085,7 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
>  	kfree(desc);
>  
>  	END_USE(vq);
> -	return -EIO;
> +	return -ENOSPC;
>  }
>  
>  static inline int virtqueue_add_packed(struct virtqueue *_vq,
> -- 
> 2.17.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
