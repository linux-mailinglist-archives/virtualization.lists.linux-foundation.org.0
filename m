Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3B15A8E0A
	for <lists.virtualization@lfdr.de>; Thu,  1 Sep 2022 08:13:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25C5D400C8;
	Thu,  1 Sep 2022 06:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25C5D400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9G3c0snrmDU2; Thu,  1 Sep 2022 06:12:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B127F400BB;
	Thu,  1 Sep 2022 06:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B127F400BB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4469C0077;
	Thu,  1 Sep 2022 06:12:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A26E8C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Sep 2022 06:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AA8541902
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Sep 2022 06:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AA8541902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZyZOtes47BV
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Sep 2022 06:12:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6169E418FE
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6169E418FE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Sep 2022 06:12:51 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R231e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VNxZAUn_1662012766; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VNxZAUn_1662012766) by smtp.aliyun-inc.com;
 Thu, 01 Sep 2022 14:12:47 +0800
Message-ID: <1662012653.6443956-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [RFC v3 6/7] virtio: in order support for virtio_ring
Date: Thu, 1 Sep 2022 14:10:53 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>
References: <20220901055434.824-1-qtxuning1999@sjtu.edu.cn>
 <20220901055434.824-7-qtxuning1999@sjtu.edu.cn>
In-Reply-To: <20220901055434.824-7-qtxuning1999@sjtu.edu.cn>
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, Guo Zhi <qtxuning1999@sjtu.edu.cn>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu,  1 Sep 2022 13:54:33 +0800, Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
> If in order feature negotiated, we can skip the used ring to get
> buffer's desc id sequentially.  For skipped buffers in the batch, the
> used ring doesn't contain the buffer length, actually there is not need
> to get skipped buffers' length as they are tx buffer.

As far as I know, currently virtio-net will use the buffer's length here for
statistics. So whether virtio-net also needs to make some changes.

Thanks.

>
> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---
>  drivers/virtio/virtio_ring.c | 74 +++++++++++++++++++++++++++++++-----
>  1 file changed, 64 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 00aa4b7a49c2..d52624179b43 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -103,6 +103,9 @@ struct vring_virtqueue {
>  	/* Host supports indirect buffers */
>  	bool indirect;
>
> +	/* Host supports in order feature */
> +	bool in_order;
> +
>  	/* Host publishes avail event idx */
>  	bool event;
>
> @@ -144,6 +147,19 @@ struct vring_virtqueue {
>  			/* DMA address and size information */
>  			dma_addr_t queue_dma_addr;
>  			size_t queue_size_in_bytes;
> +
> +			/* If in_order feature is negotiated, here is the next head to consume */
> +			u16 next_desc_begin;
> +			/*
> +			 * If in_order feature is negotiated,
> +			 * here is the last descriptor's id in the batch
> +			 */
> +			u16 last_desc_in_batch;
> +			/*
> +			 * If in_order feature is negotiated,
> +			 * buffers except last buffer in the batch are skipped buffer
> +			 */
> +			bool is_skipped_buffer;
>  		} split;
>
>  		/* Available for packed ring */
> @@ -584,8 +600,6 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
>  					 total_sg * sizeof(struct vring_desc),
>  					 VRING_DESC_F_INDIRECT,
>  					 false);
> -		vq->split.desc_extra[head & (vq->split.vring.num - 1)].flags &=
> -			~VRING_DESC_F_NEXT;
>  	}
>
>  	/* We're using some buffers from the free list. */
> @@ -701,8 +715,16 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
>  	}
>
>  	vring_unmap_one_split(vq, i);
> -	vq->split.desc_extra[i].next = vq->free_head;
> -	vq->free_head = head;
> +	/*
> +	 * If in_order feature is negotiated,
> +	 * the descriptors are made available in order.
> +	 * Since the free_head is already a circular list,
> +	 * it must consume it sequentially.
> +	 */
> +	if (!vq->in_order) {
> +		vq->split.desc_extra[i].next = vq->free_head;
> +		vq->free_head = head;
> +	}
>
>  	/* Plus final descriptor */
>  	vq->vq.num_free++;
> @@ -744,7 +766,7 @@ static void *virtqueue_get_buf_ctx_split(struct virtqueue *_vq,
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  	void *ret;
> -	unsigned int i;
> +	unsigned int i, j;
>  	u16 last_used;
>
>  	START_USE(vq);
> @@ -763,11 +785,38 @@ static void *virtqueue_get_buf_ctx_split(struct virtqueue *_vq,
>  	/* Only get used array entries after they have been exposed by host. */
>  	virtio_rmb(vq->weak_barriers);
>
> -	last_used = (vq->last_used_idx & (vq->split.vring.num - 1));
> -	i = virtio32_to_cpu(_vq->vdev,
> -			vq->split.vring.used->ring[last_used].id);
> -	*len = virtio32_to_cpu(_vq->vdev,
> -			vq->split.vring.used->ring[last_used].len);
> +	if (vq->in_order) {
> +		last_used = (vq->last_used_idx & (vq->split.vring.num - 1));
> +		if (!vq->split.is_skipped_buffer) {
> +			vq->split.last_desc_in_batch =
> +				virtio32_to_cpu(_vq->vdev,
> +						vq->split.vring.used->ring[last_used].id);
> +			vq->split.is_skipped_buffer = true;
> +		}
> +		/* For skipped buffers in batch, we can ignore the len info, simply set len as 0 */
> +		if (vq->split.next_desc_begin != vq->split.last_desc_in_batch) {
> +			*len = 0;
> +		} else {
> +			*len = virtio32_to_cpu(_vq->vdev,
> +					       vq->split.vring.used->ring[last_used].len);
> +			vq->split.is_skipped_buffer = false;
> +		}
> +		i = vq->split.next_desc_begin;
> +		j = i;
> +		/* Indirect only takes one descriptor in descriptor table */
> +		while (!vq->indirect && (vq->split.desc_extra[j].flags & VRING_DESC_F_NEXT))
> +			j = (j + 1) & (vq->split.vring.num - 1);
> +		/* move to next */
> +		j = (j + 1) % vq->split.vring.num;
> +		/* Next buffer will use this descriptor in order */
> +		vq->split.next_desc_begin = j;
> +	} else {
> +		last_used = (vq->last_used_idx & (vq->split.vring.num - 1));
> +		i = virtio32_to_cpu(_vq->vdev,
> +				    vq->split.vring.used->ring[last_used].id);
> +		*len = virtio32_to_cpu(_vq->vdev,
> +				       vq->split.vring.used->ring[last_used].len);
> +	}
>
>  	if (unlikely(i >= vq->split.vring.num)) {
>  		BAD_RING(vq, "id %u out of range\n", i);
> @@ -2223,6 +2272,7 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
>
>  	vq->indirect = virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC) &&
>  		!context;
> +	vq->in_order = virtio_has_feature(vdev, VIRTIO_F_IN_ORDER);
>  	vq->event = virtio_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX);
>
>  	if (virtio_has_feature(vdev, VIRTIO_F_ORDER_PLATFORM))
> @@ -2235,6 +2285,10 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
>  	vq->split.avail_flags_shadow = 0;
>  	vq->split.avail_idx_shadow = 0;
>
> +	vq->split.next_desc_begin = 0;
> +	vq->split.last_desc_in_batch = 0;
> +	vq->split.is_skipped_buffer = false;
> +
>  	/* No callback?  Tell other side not to bother us. */
>  	if (!callback) {
>  		vq->split.avail_flags_shadow |= VRING_AVAIL_F_NO_INTERRUPT;
> --
> 2.17.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
