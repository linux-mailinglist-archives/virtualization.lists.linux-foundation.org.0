Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A587F13C38A
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 14:49:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6828183F08;
	Wed, 15 Jan 2020 13:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DtcwViBEuVw; Wed, 15 Jan 2020 13:49:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4C2338450D;
	Wed, 15 Jan 2020 13:49:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FB95C077D;
	Wed, 15 Jan 2020 13:49:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02EB2C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E181386294
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSAZ4C-vE0Zi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:49:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AA4DA86272
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579096163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=79M15GKwGi7t6ysWJj36dJhzxgOaifGqu7osrGbl4Jk=;
 b=BJHXhFBinMPoncxwuRgLeMnYLek2AAbW2dtf2xovxoM33t97bsSDS4XAhLp+tIB2zQXFJa
 VQ0J2fOWZ3h+OZ8zBqwbzp6gBEp6lC/ftNGelg8hOE2Wlu/MrG3IXhEXqsOVbVituajFmL
 Q15kB5Cgac2OGkZqCgEEtw5ZaKQlnmw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-NwGnfh9ONL6qLDORMQRjQw-1; Wed, 15 Jan 2020 08:49:21 -0500
Received: by mail-qv1-f70.google.com with SMTP id v5so11027592qvn.21
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 05:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=79M15GKwGi7t6ysWJj36dJhzxgOaifGqu7osrGbl4Jk=;
 b=oULCR634YMYRqJUVpoIrEH52GzVKhJK1F+p2uDoHJ5WFdJeXpb5c8xKU9H4cmZOFse
 V5BmxxPr8qOh1kMeiTTSyGdfgTdp+/yFHeKfaWKavGqIVaMs1friovdTtzQuTnIpqPN1
 Y+iJqHxlWdUquUEfgBj62c3vbqJKzPDLt3/tCiwkTA+76pAoF97BfUm6jw2wkvdHZUyC
 NgnTs6DBi+PLoIwoHyKJ0hdOcIe/+k7hed1OMmkWIgQFdweqIX2owWJndhJCNaXK+KoB
 1ZnWWS4ENEo9cs8iP19iqPdWlP83mEY0WR/yWYxQtv17MTnVjy1JCNBhN196giIyahDj
 w07Q==
X-Gm-Message-State: APjAAAXV7kxPYr/MVpd7YhLpyzjBRuVuKfqq/EiLHdtH8bISiR3Je4kG
 sEgOxtDgAB/YjAvXtdxdxzyHIV2sQD6hIWuruZ8E6hXSlfJ5kI8IWMxvYCxgCkac1367wq1xKMU
 1mJEx8Vyyohlij6EBjFQitu7U7o81Rr3Jnnt2U63kFA==
X-Received: by 2002:a37:a685:: with SMTP id
 p127mr23744223qke.449.1579096161385; 
 Wed, 15 Jan 2020 05:49:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqz42YoUKeG+vAxd7NWuh+eaZw45fe1oAMfHmK2nDoiIOLa/QZBznhzSgF9fNTakPe1VYtTTdg==
X-Received: by 2002:a37:a685:: with SMTP id
 p127mr23744193qke.449.1579096161132; 
 Wed, 15 Jan 2020 05:49:21 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id x27sm8332400qkx.81.2020.01.15.05.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 05:49:20 -0800 (PST)
Date: Wed, 15 Jan 2020 08:49:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Clement Leger <cleger@kalray.eu>
Subject: Re: [PATCH] virtio_ring: Use workqueue to execute virtqueue callback
Message-ID: <20200115084601-mutt-send-email-mst@kernel.org>
References: <20200115120535.17454-1-cleger@kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20200115120535.17454-1-cleger@kalray.eu>
X-MC-Unique: NwGnfh9ONL6qLDORMQRjQw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Wed, Jan 15, 2020 at 01:05:35PM +0100, Clement Leger wrote:
> Currently, in vring_interrupt, the vq callbacks are called directly.
> However, these callbacks are not meant to be executed in IRQ context.
> They do not return any irq_return_t value and some of them can do
> locking (rpmsg_recv_done -> rpmsg_recv_single -> mutex_lock).

That's a bug in rpmsg. Pls fix there.

> When compiled with DEBUG_ATOMIC_SLEEP, the kernel will spit out warnings
> when such case shappen.
> 
> In order to allow calling these callbacks safely (without sleeping in
> IRQ context), execute them in a workqueue if needed.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

If applied this would slow data path handling of VQ events
significantly. Teaching callbacks to return irqreturn_t
might be a good idea, though it's not an insignificant
amount of work.


> ---
>  drivers/virtio/virtio_ring.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 867c7ebd3f10..0e4d0e5ca227 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -183,6 +183,9 @@ struct vring_virtqueue {
>  	/* DMA, allocation, and size information */
>  	bool we_own_ring;
>  
> +	/* Work struct for vq callback handling */
> +	struct work_struct work;
> +
>  #ifdef DEBUG
>  	/* They're supposed to lock for us. */
>  	unsigned int in_use;
> @@ -2029,6 +2032,16 @@ static inline bool more_used(const struct vring_virtqueue *vq)
>  	return vq->packed_ring ? more_used_packed(vq) : more_used_split(vq);
>  }
>  
> +static void vring_work_handler(struct work_struct *work_struct)
> +{
> +	struct vring_virtqueue *vq = container_of(work_struct,
> +						  struct vring_virtqueue,
> +						  work);
> +	pr_debug("virtqueue callback for %p (%p)\n", vq, vq->vq.callback);
> +
> +	vq->vq.callback(&vq->vq);
> +}
> +
>  irqreturn_t vring_interrupt(int irq, void *_vq)
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
> @@ -2041,9 +2054,8 @@ irqreturn_t vring_interrupt(int irq, void *_vq)
>  	if (unlikely(vq->broken))
>  		return IRQ_HANDLED;
>  
> -	pr_debug("virtqueue callback for %p (%p)\n", vq, vq->vq.callback);
>  	if (vq->vq.callback)
> -		vq->vq.callback(&vq->vq);
> +		schedule_work(&vq->work);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -2110,6 +2122,8 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
>  					vq->split.avail_flags_shadow);
>  	}
>  
> +	INIT_WORK(&vq->work, vring_work_handler);
> +
>  	vq->split.desc_state = kmalloc_array(vring.num,
>  			sizeof(struct vring_desc_state_split), GFP_KERNEL);
>  	if (!vq->split.desc_state) {
> @@ -2179,6 +2193,8 @@ void vring_del_virtqueue(struct virtqueue *_vq)
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  
> +	cancel_work_sync(&vq->work);
> +
>  	if (vq->we_own_ring) {
>  		if (vq->packed_ring) {
>  			vring_free_queue(vq->vq.vdev,
> -- 
> 2.15.0.276.g89ea799

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
