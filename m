Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6032F714DE
	for <lists.virtualization@lfdr.de>; Tue, 23 Jul 2019 11:17:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 47F75C5D;
	Tue, 23 Jul 2019 09:17:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 965222C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 09:17:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0088DFE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 09:17:50 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 44so10169975qtg.11
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 02:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=h3zIJ0ur5GAZZrotsV7XoPvlwXrYwk1PNIbGMg1g2l8=;
	b=r9dfPOTfi0rAANzLCk1gwsOZFCMQEc1Rw9ZHQpMo0TJbVt5vc0FmlDcGRCj36bLc8R
	aecuGfdN98aA1ujhtu/ILSXDIfS5nNs5PBY8kkmzO6t0figQYBaBiyTEyAVQDpUjipT4
	eqeRfH8X2n6h5Slomu3xoEacOo3K0VA7RlwOxYPtGwZAOfQpJL6v5FoWAQUdnjOJNZil
	NUNLLgTIg9XqtQnOqWQU09D5lOfzUVZMMfq1Lu3NW0mUbTPIZh81uxYVboOvTPrIyqHe
	AlZIyxRwmcA8/d6I1cEPdrv/tZC/7V0JKAggKr95X3FjNY1VThjoH5z72As9rDjDmQWF
	yq8g==
X-Gm-Message-State: APjAAAUQZFeTRP8ZgoSGPO2s/wFzOqazj/gPTvOdt5mJUC2CwKjjxHeU
	rJgfQ2lQczhAo3P9wEw5u66fAA==
X-Google-Smtp-Source: APXvYqxqDdyi/5f/Mq5iXeKI3cXWz3/L5aeuMAmOkwcJvye1XplCRbmF7QAI4/d2iz8KsKqyIf1pvQ==
X-Received: by 2002:ac8:7510:: with SMTP id u16mr50609787qtq.60.1563873470240; 
	Tue, 23 Jul 2019 02:17:50 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	p59sm20299552qtd.75.2019.07.23.02.17.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 02:17:49 -0700 (PDT)
Date: Tue, 23 Jul 2019 05:17:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/6] vhost: validate MMU notifier registration
Message-ID: <20190723042428-mutt-send-email-mst@kernel.org>
References: <20190723075718.6275-1-jasowang@redhat.com>
	<20190723075718.6275-3-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723075718.6275-3-jasowang@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

On Tue, Jul 23, 2019 at 03:57:14AM -0400, Jason Wang wrote:
> The return value of mmu_notifier_register() is not checked in
> vhost_vring_set_num_addr(). This will cause an out of sync between mm
> and MMU notifier thus a double free. To solve this, introduce a
> boolean flag to track whether MMU notifier is registered and only do
> unregistering when it was true.
> 
> Reported-and-tested-by:
> syzbot+e58112d71f77113ddb7b@syzkaller.appspotmail.com
> Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual address")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Right. This fixes the bug.
But it's not great that simple things like
setting vq address put pressure on memory allocator.
Also, if we get a single during processing
notifier register will fail, disabling optimization permanently.

In fact, see below:


> ---
>  drivers/vhost/vhost.c | 19 +++++++++++++++----
>  drivers/vhost/vhost.h |  1 +
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 34c0d970bcbc..058191d5efad 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -630,6 +630,7 @@ void vhost_dev_init(struct vhost_dev *dev,
>  	dev->iov_limit = iov_limit;
>  	dev->weight = weight;
>  	dev->byte_weight = byte_weight;
> +	dev->has_notifier = false;
>  	init_llist_head(&dev->work_list);
>  	init_waitqueue_head(&dev->wait);
>  	INIT_LIST_HEAD(&dev->read_list);
> @@ -731,6 +732,7 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
>  	if (err)
>  		goto err_mmu_notifier;
>  #endif
> +	dev->has_notifier = true;
>  
>  	return 0;
>  

I just noticed that set owner now fails if we get a signal.
Userspace could retry in theory but it does not:
this is userspace abi breakage since it used to only
fail on invalid input.

> @@ -960,7 +962,11 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
>  	}
>  	if (dev->mm) {
>  #if VHOST_ARCH_CAN_ACCEL_UACCESS
> -		mmu_notifier_unregister(&dev->mmu_notifier, dev->mm);
> +		if (dev->has_notifier) {
> +			mmu_notifier_unregister(&dev->mmu_notifier,
> +						dev->mm);
> +			dev->has_notifier = false;
> +		}
>  #endif
>  		mmput(dev->mm);
>  	}
> @@ -2065,8 +2071,10 @@ static long vhost_vring_set_num_addr(struct vhost_dev *d,
>  	/* Unregister MMU notifer to allow invalidation callback
>  	 * can access vq->uaddrs[] without holding a lock.
>  	 */
> -	if (d->mm)
> +	if (d->has_notifier) {
>  		mmu_notifier_unregister(&d->mmu_notifier, d->mm);
> +		d->has_notifier = false;
> +	}
>  
>  	vhost_uninit_vq_maps(vq);
>  #endif
> @@ -2086,8 +2094,11 @@ static long vhost_vring_set_num_addr(struct vhost_dev *d,
>  	if (r == 0)
>  		vhost_setup_vq_uaddr(vq);
>  
> -	if (d->mm)
> -		mmu_notifier_register(&d->mmu_notifier, d->mm);
> +	if (d->mm) {
> +		r = mmu_notifier_register(&d->mmu_notifier, d->mm);
> +		if (!r)
> +			d->has_notifier = true;
> +	}
>  #endif
>  
>  	mutex_unlock(&vq->mutex);
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index 819296332913..a62f56a4cf72 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -214,6 +214,7 @@ struct vhost_dev {
>  	int iov_limit;
>  	int weight;
>  	int byte_weight;
> +	bool has_notifier;
>  };
>  
>  bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts, int total_len);
> -- 
> 2.18.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
