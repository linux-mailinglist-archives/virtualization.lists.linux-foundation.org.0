Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB8C7AF027
	for <lists.virtualization@lfdr.de>; Tue, 26 Sep 2023 18:01:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B45082532;
	Tue, 26 Sep 2023 16:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B45082532
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WmlRzZ1h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxYk_HN_d8cM; Tue, 26 Sep 2023 16:01:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D99BC82521;
	Tue, 26 Sep 2023 16:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D99BC82521
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21639C008C;
	Tue, 26 Sep 2023 16:01:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF03BC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 16:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4D4461023
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 16:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4D4461023
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WmlRzZ1h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svTNzahMdA7e
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 16:01:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7428160FA6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 16:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7428160FA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695744104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iD1AsxrNIkIZhfRnBaDFkww4dxECBQPx6etbCugAnTE=;
 b=WmlRzZ1h4Sn7JvEutK41hoiiKsZgUFtrkAdpfaIWLW9qaIca2fbSc56r4ZOhVmfWLcqYOE
 L3HJPllxxya1BHp2SD8EHDuuMKYrs5T0RyN4rNQOjKBQAvJQ50cYmDuKjgYebJ93K2HziX
 PEi0IgswNUAQl5h4scGndf9J3GqR1I4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-7vrQLcTiMImqDYwsxV7wfQ-1; Tue, 26 Sep 2023 12:01:42 -0400
X-MC-Unique: 7vrQLcTiMImqDYwsxV7wfQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5043eb2c436so11494790e87.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 09:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695744101; x=1696348901;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iD1AsxrNIkIZhfRnBaDFkww4dxECBQPx6etbCugAnTE=;
 b=oI1TtRt8N8vnRlQPXJnD5G5PCnWzakfhFqYefXjkkjPPIr6Hb1VOdxRJ+Saj2Ivrbr
 IAQcQyTum+RIaYsA3hpLcAU/jkfKmsC6/CrN2eLGp4KWznnTEa8grwtDba78NNq9mzJ1
 Pl+X1mpS8YTeCOEC9CavH1HLFvaITXiLf8rtE4F5Ev8Jkh9Bn3tLPGTgMUI6K0VOlAN7
 yUakFXMZotTY9+wlrCcfeEuTbaH72THzzSbn6e8kS+Xdpp0B7XStJ4tB3N+xyNnrNqlk
 jHAhAMwWfhi+OU+QsLwW7i7pEhWWWvstiRQg0TCxsXs3LhKUSesIKAq/AWgfYW0PLSrr
 hLOA==
X-Gm-Message-State: AOJu0YzBL0U4XDzEK4Lbt9DRxOCekEYmO72CbQjnuYLqW9Ns2vW83ktu
 R7MYzQoeYRBCrHyqdMp6Smm1sCm/N8z0JghmO0pRim6UFw9asR9dggh3tVrBFPxiB+/GzjFe0J+
 fkZIGFEvphRuBTm8ycTd1OdvjeJywSuUPCZR63wVvSA==
X-Received: by 2002:a05:6512:10c8:b0:500:c534:3e4e with SMTP id
 k8-20020a05651210c800b00500c5343e4emr9210171lfg.60.1695744101158; 
 Tue, 26 Sep 2023 09:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+RypNZ3z4KmvZCpbo89wPDw9vZ78KwLUpD8TZXZPEN5de9mJWY7AdanSlflBbpcWmFvTmdA==
X-Received: by 2002:a05:6512:10c8:b0:500:c534:3e4e with SMTP id
 k8-20020a05651210c800b00500c5343e4emr9210115lfg.60.1695744100432; 
 Tue, 26 Sep 2023 09:01:40 -0700 (PDT)
Received: from redhat.com ([2.52.31.177]) by smtp.gmail.com with ESMTPSA id
 y14-20020aa7c24e000000b00531050807a9sm6898259edo.13.2023.09.26.09.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 09:01:39 -0700 (PDT)
Date: Tue, 26 Sep 2023 12:01:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost v13 12/12] virtio_net: merge dma operations when
 filling mergeable buffers
Message-ID: <20230926120055-mutt-send-email-mst@kernel.org>
References: <20230810123057.43407-1-xuanzhuo@linux.alibaba.com>
 <20230810123057.43407-13-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20230810123057.43407-13-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

On Thu, Aug 10, 2023 at 08:30:57PM +0800, Xuan Zhuo wrote:
> Currently, the virtio core will perform a dma operation for each
> buffer. Although, the same page may be operated multiple times.
> 
> This patch, the driver does the dma operation and manages the dma
> address based the feature premapped of virtio core.
> 
> This way, we can perform only one dma operation for the pages of the
> alloc frag. This is beneficial for the iommu device.
> 
> kernel command line: intel_iommu=on iommu.passthrough=0
> 
>        |  strict=0  | strict=1
> Before |  775496pps | 428614pps
> After  | 1109316pps | 742853pps
> 
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Hi Xuan Zhuo,
looks like this patch is causing regressions. Do you have time to debug
or should I revert?

> ---
>  drivers/net/virtio_net.c | 228 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 202 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 486b5849033d..16adb5ef18f8 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -126,6 +126,14 @@ static const struct virtnet_stat_desc virtnet_rq_stats_desc[] = {
>  #define VIRTNET_SQ_STATS_LEN	ARRAY_SIZE(virtnet_sq_stats_desc)
>  #define VIRTNET_RQ_STATS_LEN	ARRAY_SIZE(virtnet_rq_stats_desc)
>  
> +/* The dma information of pages allocated at a time. */
> +struct virtnet_rq_dma {
> +	dma_addr_t addr;
> +	u32 ref;
> +	u16 len;
> +	u16 need_sync;
> +};
> +
>  /* Internal representation of a send virtqueue */
>  struct send_queue {
>  	/* Virtqueue associated with this send _queue */
> @@ -175,6 +183,12 @@ struct receive_queue {
>  	char name[16];
>  
>  	struct xdp_rxq_info xdp_rxq;
> +
> +	/* Record the last dma info to free after new pages is allocated. */
> +	struct virtnet_rq_dma *last_dma;
> +
> +	/* Do dma by self */
> +	bool do_dma;
>  };
>  
>  /* This structure can contain rss message with maximum settings for indirection table and keysize
> @@ -549,6 +563,156 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
>  	return skb;
>  }
>  
> +static void virtnet_rq_unmap(struct receive_queue *rq, void *buf, u32 len)
> +{
> +	struct page *page = virt_to_head_page(buf);
> +	struct virtnet_rq_dma *dma;
> +	void *head;
> +	int offset;
> +
> +	head = page_address(page);
> +
> +	dma = head;
> +
> +	--dma->ref;
> +
> +	if (dma->ref) {
> +		if (dma->need_sync && len) {
> +			offset = buf - (head + sizeof(*dma));
> +
> +			virtqueue_dma_sync_single_range_for_cpu(rq->vq, dma->addr, offset,
> +								len, DMA_FROM_DEVICE);
> +		}
> +
> +		return;
> +	}
> +
> +	virtqueue_dma_unmap_single_attrs(rq->vq, dma->addr, dma->len,
> +					 DMA_FROM_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
> +	put_page(page);
> +}
> +
> +static void *virtnet_rq_get_buf(struct receive_queue *rq, u32 *len, void **ctx)
> +{
> +	void *buf;
> +
> +	buf = virtqueue_get_buf_ctx(rq->vq, len, ctx);
> +	if (buf && rq->do_dma)
> +		virtnet_rq_unmap(rq, buf, *len);
> +
> +	return buf;
> +}
> +
> +static void *virtnet_rq_detach_unused_buf(struct receive_queue *rq)
> +{
> +	void *buf;
> +
> +	buf = virtqueue_detach_unused_buf(rq->vq);
> +	if (buf && rq->do_dma)
> +		virtnet_rq_unmap(rq, buf, 0);
> +
> +	return buf;
> +}
> +
> +static void virtnet_rq_init_one_sg(struct receive_queue *rq, void *buf, u32 len)
> +{
> +	struct virtnet_rq_dma *dma;
> +	dma_addr_t addr;
> +	u32 offset;
> +	void *head;
> +
> +	if (!rq->do_dma) {
> +		sg_init_one(rq->sg, buf, len);
> +		return;
> +	}
> +
> +	head = page_address(rq->alloc_frag.page);
> +
> +	offset = buf - head;
> +
> +	dma = head;
> +
> +	addr = dma->addr - sizeof(*dma) + offset;
> +
> +	sg_init_table(rq->sg, 1);
> +	rq->sg[0].dma_address = addr;
> +	rq->sg[0].length = len;
> +}
> +
> +static void *virtnet_rq_alloc(struct receive_queue *rq, u32 size, gfp_t gfp)
> +{
> +	struct page_frag *alloc_frag = &rq->alloc_frag;
> +	struct virtnet_rq_dma *dma;
> +	void *buf, *head;
> +	dma_addr_t addr;
> +
> +	if (unlikely(!skb_page_frag_refill(size, alloc_frag, gfp)))
> +		return NULL;
> +
> +	head = page_address(alloc_frag->page);
> +
> +	if (rq->do_dma) {
> +		dma = head;
> +
> +		/* new pages */
> +		if (!alloc_frag->offset) {
> +			if (rq->last_dma) {
> +				/* Now, the new page is allocated, the last dma
> +				 * will not be used. So the dma can be unmapped
> +				 * if the ref is 0.
> +				 */
> +				virtnet_rq_unmap(rq, rq->last_dma, 0);
> +				rq->last_dma = NULL;
> +			}
> +
> +			dma->len = alloc_frag->size - sizeof(*dma);
> +
> +			addr = virtqueue_dma_map_single_attrs(rq->vq, dma + 1,
> +							      dma->len, DMA_FROM_DEVICE, 0);
> +			if (virtqueue_dma_mapping_error(rq->vq, addr))
> +				return NULL;
> +
> +			dma->addr = addr;
> +			dma->need_sync = virtqueue_dma_need_sync(rq->vq, addr);
> +
> +			/* Add a reference to dma to prevent the entire dma from
> +			 * being released during error handling. This reference
> +			 * will be freed after the pages are no longer used.
> +			 */
> +			get_page(alloc_frag->page);
> +			dma->ref = 1;
> +			alloc_frag->offset = sizeof(*dma);
> +
> +			rq->last_dma = dma;
> +		}
> +
> +		++dma->ref;
> +	}
> +
> +	buf = head + alloc_frag->offset;
> +
> +	get_page(alloc_frag->page);
> +	alloc_frag->offset += size;
> +
> +	return buf;
> +}
> +
> +static void virtnet_rq_set_premapped(struct virtnet_info *vi)
> +{
> +	int i;
> +
> +	/* disable for big mode */
> +	if (!vi->mergeable_rx_bufs && vi->big_packets)
> +		return;
> +
> +	for (i = 0; i < vi->max_queue_pairs; i++) {
> +		if (virtqueue_set_dma_premapped(vi->rq[i].vq))
> +			continue;
> +
> +		vi->rq[i].do_dma = true;
> +	}
> +}
> +
>  static void free_old_xmit_skbs(struct send_queue *sq, bool in_napi)
>  {
>  	unsigned int len;
> @@ -835,7 +999,7 @@ static struct page *xdp_linearize_page(struct receive_queue *rq,
>  		void *buf;
>  		int off;
>  
> -		buf = virtqueue_get_buf(rq->vq, &buflen);
> +		buf = virtnet_rq_get_buf(rq, &buflen, NULL);
>  		if (unlikely(!buf))
>  			goto err_buf;
>  
> @@ -1126,7 +1290,7 @@ static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
>  		return -EINVAL;
>  
>  	while (--*num_buf > 0) {
> -		buf = virtqueue_get_buf_ctx(rq->vq, &len, &ctx);
> +		buf = virtnet_rq_get_buf(rq, &len, &ctx);
>  		if (unlikely(!buf)) {
>  			pr_debug("%s: rx error: %d buffers out of %d missing\n",
>  				 dev->name, *num_buf,
> @@ -1351,7 +1515,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>  	while (--num_buf) {
>  		int num_skb_frags;
>  
> -		buf = virtqueue_get_buf_ctx(rq->vq, &len, &ctx);
> +		buf = virtnet_rq_get_buf(rq, &len, &ctx);
>  		if (unlikely(!buf)) {
>  			pr_debug("%s: rx error: %d buffers out of %d missing\n",
>  				 dev->name, num_buf,
> @@ -1414,7 +1578,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>  err_skb:
>  	put_page(page);
>  	while (num_buf-- > 1) {
> -		buf = virtqueue_get_buf(rq->vq, &len);
> +		buf = virtnet_rq_get_buf(rq, &len, NULL);
>  		if (unlikely(!buf)) {
>  			pr_debug("%s: rx error: %d buffers missing\n",
>  				 dev->name, num_buf);
> @@ -1524,7 +1688,6 @@ static void receive_buf(struct virtnet_info *vi, struct receive_queue *rq,
>  static int add_recvbuf_small(struct virtnet_info *vi, struct receive_queue *rq,
>  			     gfp_t gfp)
>  {
> -	struct page_frag *alloc_frag = &rq->alloc_frag;
>  	char *buf;
>  	unsigned int xdp_headroom = virtnet_get_headroom(vi);
>  	void *ctx = (void *)(unsigned long)xdp_headroom;
> @@ -1533,17 +1696,21 @@ static int add_recvbuf_small(struct virtnet_info *vi, struct receive_queue *rq,
>  
>  	len = SKB_DATA_ALIGN(len) +
>  	      SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
> -	if (unlikely(!skb_page_frag_refill(len, alloc_frag, gfp)))
> +
> +	buf = virtnet_rq_alloc(rq, len, gfp);
> +	if (unlikely(!buf))
>  		return -ENOMEM;
>  
> -	buf = (char *)page_address(alloc_frag->page) + alloc_frag->offset;
> -	get_page(alloc_frag->page);
> -	alloc_frag->offset += len;
> -	sg_init_one(rq->sg, buf + VIRTNET_RX_PAD + xdp_headroom,
> -		    vi->hdr_len + GOOD_PACKET_LEN);
> +	virtnet_rq_init_one_sg(rq, buf + VIRTNET_RX_PAD + xdp_headroom,
> +			       vi->hdr_len + GOOD_PACKET_LEN);
> +
>  	err = virtqueue_add_inbuf_ctx(rq->vq, rq->sg, 1, buf, ctx, gfp);
> -	if (err < 0)
> +	if (err < 0) {
> +		if (rq->do_dma)
> +			virtnet_rq_unmap(rq, buf, 0);
>  		put_page(virt_to_head_page(buf));
> +	}
> +
>  	return err;
>  }
>  
> @@ -1620,23 +1787,22 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
>  	unsigned int headroom = virtnet_get_headroom(vi);
>  	unsigned int tailroom = headroom ? sizeof(struct skb_shared_info) : 0;
>  	unsigned int room = SKB_DATA_ALIGN(headroom + tailroom);
> -	char *buf;
> +	unsigned int len, hole;
>  	void *ctx;
> +	char *buf;
>  	int err;
> -	unsigned int len, hole;
>  
>  	/* Extra tailroom is needed to satisfy XDP's assumption. This
>  	 * means rx frags coalescing won't work, but consider we've
>  	 * disabled GSO for XDP, it won't be a big issue.
>  	 */
>  	len = get_mergeable_buf_len(rq, &rq->mrg_avg_pkt_len, room);
> -	if (unlikely(!skb_page_frag_refill(len + room, alloc_frag, gfp)))
> +
> +	buf = virtnet_rq_alloc(rq, len + room, gfp);
> +	if (unlikely(!buf))
>  		return -ENOMEM;
>  
> -	buf = (char *)page_address(alloc_frag->page) + alloc_frag->offset;
>  	buf += headroom; /* advance address leaving hole at front of pkt */
> -	get_page(alloc_frag->page);
> -	alloc_frag->offset += len + room;
>  	hole = alloc_frag->size - alloc_frag->offset;
>  	if (hole < len + room) {
>  		/* To avoid internal fragmentation, if there is very likely not
> @@ -1650,11 +1816,15 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
>  		alloc_frag->offset += hole;
>  	}
>  
> -	sg_init_one(rq->sg, buf, len);
> +	virtnet_rq_init_one_sg(rq, buf, len);
> +
>  	ctx = mergeable_len_to_ctx(len + room, headroom);
>  	err = virtqueue_add_inbuf_ctx(rq->vq, rq->sg, 1, buf, ctx, gfp);
> -	if (err < 0)
> +	if (err < 0) {
> +		if (rq->do_dma)
> +			virtnet_rq_unmap(rq, buf, 0);
>  		put_page(virt_to_head_page(buf));
> +	}
>  
>  	return err;
>  }
> @@ -1775,13 +1945,13 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
>  		void *ctx;
>  
>  		while (stats.packets < budget &&
> -		       (buf = virtqueue_get_buf_ctx(rq->vq, &len, &ctx))) {
> +		       (buf = virtnet_rq_get_buf(rq, &len, &ctx))) {
>  			receive_buf(vi, rq, buf, len, ctx, xdp_xmit, &stats);
>  			stats.packets++;
>  		}
>  	} else {
>  		while (stats.packets < budget &&
> -		       (buf = virtqueue_get_buf(rq->vq, &len)) != NULL) {
> +		       (buf = virtnet_rq_get_buf(rq, &len, NULL)) != NULL) {
>  			receive_buf(vi, rq, buf, len, NULL, xdp_xmit, &stats);
>  			stats.packets++;
>  		}
> @@ -3553,8 +3723,11 @@ static void free_receive_page_frags(struct virtnet_info *vi)
>  {
>  	int i;
>  	for (i = 0; i < vi->max_queue_pairs; i++)
> -		if (vi->rq[i].alloc_frag.page)
> +		if (vi->rq[i].alloc_frag.page) {
> +			if (vi->rq[i].do_dma && vi->rq[i].last_dma)
> +				virtnet_rq_unmap(&vi->rq[i], vi->rq[i].last_dma, 0);
>  			put_page(vi->rq[i].alloc_frag.page);
> +		}
>  }
>  
>  static void virtnet_sq_free_unused_buf(struct virtqueue *vq, void *buf)
> @@ -3591,9 +3764,10 @@ static void free_unused_bufs(struct virtnet_info *vi)
>  	}
>  
>  	for (i = 0; i < vi->max_queue_pairs; i++) {
> -		struct virtqueue *vq = vi->rq[i].vq;
> -		while ((buf = virtqueue_detach_unused_buf(vq)) != NULL)
> -			virtnet_rq_free_unused_buf(vq, buf);
> +		struct receive_queue *rq = &vi->rq[i];
> +
> +		while ((buf = virtnet_rq_detach_unused_buf(rq)) != NULL)
> +			virtnet_rq_free_unused_buf(rq->vq, buf);
>  		cond_resched();
>  	}
>  }
> @@ -3767,6 +3941,8 @@ static int init_vqs(struct virtnet_info *vi)
>  	if (ret)
>  		goto err_free;
>  
> +	virtnet_rq_set_premapped(vi);
> +
>  	cpus_read_lock();
>  	virtnet_set_affinity(vi);
>  	cpus_read_unlock();
> -- 
> 2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
