Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A9624C40
	for <lists.virtualization@lfdr.de>; Thu, 10 Nov 2022 21:59:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64C380C98;
	Thu, 10 Nov 2022 20:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C64C380C98
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RdzropSO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWDAxGfyCuCW; Thu, 10 Nov 2022 20:58:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 15A6B80C63;
	Thu, 10 Nov 2022 20:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A6B80C63
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4086BC007B;
	Thu, 10 Nov 2022 20:58:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C36ECC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Nov 2022 20:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D1DB80C5E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Nov 2022 20:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1DB80C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZX-rQ144eCa
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Nov 2022 20:58:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7D5880C48
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7D5880C48
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Nov 2022 20:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668113929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l4bjVeY8h1B+ikCJP5+tnp5Nk7QJmlYDYZuuSMICxdY=;
 b=RdzropSOdFQuvtep3KKYPrhiGUHfQqPsof9UO7bDYlsvAtkPgbDcHIFG97vu3hshmtD/y7
 VDLd1SsiarZAY/gd4FgnP/k1WZ7e+FKk2VzDI3dTnHhBkAzkolhBx9OIKh/7teFhSXJrqf
 fWmy4yuh/csEziu6R0Do7gLJBOZCWuA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-Gv0C3D_AORSVmCdWzVl7bA-1; Thu, 10 Nov 2022 15:58:48 -0500
X-MC-Unique: Gv0C3D_AORSVmCdWzVl7bA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso1532691wmb.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Nov 2022 12:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4bjVeY8h1B+ikCJP5+tnp5Nk7QJmlYDYZuuSMICxdY=;
 b=XmuPvwP+xvm3LrjCpkSVbyHEV5qdSJLDGfe6oVqHR/W6I09tcqSofx63k3GPrG0W3V
 G6iaPZkC8miVBwCWFguUvXRdwfJOIuGRKbOrRu1u200gCkkYGsILwg9y5lf/agHPTYD3
 JY56AWr5/6I34aF2Bm+gQRcehY1NnL8KY9rlYxoqTHLuotLe6STH676L4gSBkpqycxRT
 jjSSEbPt7pD29Hm95y0DAl75uiSX2YwpkwH/E0dam3Lgvy9Y2I3IGNc9SbsMhjOqxEvA
 amU02TEx8UpdN45tnLAbSylEF8TCC7pEuf3waFrhORvNNK2CICrl4hvrfBZL7hiaj9B8
 YZLA==
X-Gm-Message-State: ACrzQf2lmvK59vlMgrZn4veELSo/mOUjnYuqYjFMmGNBnTY/0kJjM6HU
 1vXizawZiQzGlqumjoi9FXEFNeRFvwGMdj+duJa0e7m03TC2PtbkUFc5AWCnC7Zv3qLyEddWq03
 Nw+zb2bsnRZ06QuymsSD/+LYsxal80GRmaRzOGu++ZA==
X-Received: by 2002:a05:6000:1888:b0:236:8b32:cb47 with SMTP id
 a8-20020a056000188800b002368b32cb47mr40401355wri.601.1668113926211; 
 Thu, 10 Nov 2022 12:58:46 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4RiY3bqKn4Q26xld9r2djAs8YsqS18HqkLDTqh2mqrZmZm953Nu7aAnQDsCTn+TdC7KwKsbQ==
X-Received: by 2002:a05:6000:1888:b0:236:8b32:cb47 with SMTP id
 a8-20020a056000188800b002368b32cb47mr40401334wri.601.1668113925597; 
 Thu, 10 Nov 2022 12:58:45 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003c6d21a19a0sm726252wms.29.2022.11.10.12.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 12:58:44 -0800 (PST)
Date: Thu, 10 Nov 2022 15:58:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: Re: [PATCH v3] virtio/vsock: replace virtio_vsock_pkt with sk_buff
Message-ID: <20221110155543-mutt-send-email-mst@kernel.org>
References: <20221110171723.24263-1-bobby.eshleman@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20221110171723.24263-1-bobby.eshleman@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Cong Wang <cong.wang@bytedance.com>,
 Bobby Eshleman <bobby.eshleman@bytedance.com>,
 Jiang Wang <jiang.wang@bytedance.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 kvm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
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

On Thu, Nov 10, 2022 at 09:17:22AM -0800, Bobby Eshleman wrote:
> This commit changes virtio/vsock to use sk_buff instead of
> virtio_vsock_pkt. Beyond better conforming to other net code, using
> sk_buff allows vsock to use sk_buff-dependent features in the future
> (such as sockmap) and improves throughput.
> 
> This patch introduces the following performance changes:
> 
> Tool/Config: uperf w/ 64 threads, SOCK_STREAM
> Test Runs: 5, mean of results
> Before: commit 95ec6bce2a0b ("Merge branch 'net-ipa-more-endpoints'") 
> 
> Test: 64KB, g2h
> Before: 21.63 Gb/s
> After: 25.59 Gb/s (+18%)
> 
> Test: 16B, g2h
> Before: 11.86 Mb/s 
> After: 17.41 Mb/s (+46%)
> 
> Test: 64KB, h2g
> Before: 2.15 Gb/s
> After: 3.6 Gb/s (+67%)
> 
> Test: 16B, h2g
> Before: 14.38 Mb/s
> After: 18.43 Mb/s (+28%)
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
> ---
> Changes in v3:
> - fix seqpacket bug
> - use zero in vhost_add_used(..., 0) device doesn't write to
> buffer
> - use xmas tree style declarations
> - vsock_hdr() -> virtio_vsock_hdr() and other include file style fixes
> - no skb merging
> - save space by not using vsock_metadata
>     - use _skb_refdst instead of skb buffer space for flags
>     - use skb_pull() to keep track of read bytes instead of
>       using an an extra variable 'off' in the skb buffer space
> - remove unnecessary sk_allocation assignment
> - do not zero hdr needlessly
> - introduce virtio_transport_skb_len() because skb->len changes now
> - use spin_lock() directly on queue lock instead of sk_buff_head helpers
>   which use spin_lock_irqsave() (e.g., skb_dequeue)
> - do not reduce buffer size to be page size divisible
> - Note: the biggest performance change came from loosening the spinlock
>   variation and not reducing the buffer size.
> 
> Changes in v2:
> - Use alloc_skb() directly instead of sock_alloc_send_pskb() to minimize
>   uAPI changes.
> - Do not marshal errors to -ENOMEM for non-virtio implementations.
> - No longer a part of the original series
> - Some code cleanup and refactoring
> - Include performance stats
> 
>  drivers/vhost/vsock.c                   | 222 +++++-------
>  include/linux/virtio_vsock.h            |  99 +++--
>  net/vmw_vsock/virtio_transport.c        | 160 ++++-----
>  net/vmw_vsock/virtio_transport_common.c | 458 ++++++++++++------------
>  net/vmw_vsock/vsock_loopback.c          |  51 +--
>  5 files changed, 477 insertions(+), 513 deletions(-)
> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index 5703775af129..cf6b67154072 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -51,8 +51,7 @@ struct vhost_vsock {
>  	struct hlist_node hash;
>  
>  	struct vhost_work send_pkt_work;
> -	spinlock_t send_pkt_list_lock;
> -	struct list_head send_pkt_list;	/* host->guest pending packets */
> +	struct sk_buff_head send_pkt_queue; /* host->guest pending packets */
>  
>  	atomic_t queued_replies;
>  
> @@ -108,40 +107,37 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  	vhost_disable_notify(&vsock->dev, vq);
>  
>  	do {
> -		struct virtio_vsock_pkt *pkt;
> +		struct virtio_vsock_hdr *hdr;
> +		size_t iov_len, payload_len;
>  		struct iov_iter iov_iter;
> +		u32 flags_to_restore = 0;
> +		struct sk_buff *skb;
>  		unsigned out, in;
>  		size_t nbytes;
> -		size_t iov_len, payload_len;
>  		int head;
> -		u32 flags_to_restore = 0;
>  
> -		spin_lock_bh(&vsock->send_pkt_list_lock);
> -		if (list_empty(&vsock->send_pkt_list)) {
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> +		spin_lock(&vsock->send_pkt_queue.lock);
> +		skb = __skb_dequeue(&vsock->send_pkt_queue);
> +		spin_unlock(&vsock->send_pkt_queue.lock);
> +
> +		if (!skb) {
>  			vhost_enable_notify(&vsock->dev, vq);
>  			break;
>  		}
>  
> -		pkt = list_first_entry(&vsock->send_pkt_list,
> -				       struct virtio_vsock_pkt, list);
> -		list_del_init(&pkt->list);
> -		spin_unlock_bh(&vsock->send_pkt_list_lock);
> -
>  		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
>  					 &out, &in, NULL, NULL);
>  		if (head < 0) {
> -			spin_lock_bh(&vsock->send_pkt_list_lock);
> -			list_add(&pkt->list, &vsock->send_pkt_list);
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> +			spin_lock(&vsock->send_pkt_queue.lock);
> +			__skb_queue_head(&vsock->send_pkt_queue, skb);
> +			spin_unlock(&vsock->send_pkt_queue.lock);
>  			break;
>  		}
>  
>  		if (head == vq->num) {
> -			spin_lock_bh(&vsock->send_pkt_list_lock);
> -			list_add(&pkt->list, &vsock->send_pkt_list);
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> -
> +			spin_lock(&vsock->send_pkt_queue.lock);
> +			__skb_queue_head(&vsock->send_pkt_queue, skb);
> +			spin_unlock(&vsock->send_pkt_queue.lock);
>  			/* We cannot finish yet if more buffers snuck in while
>  			 * re-enabling notify.
>  			 */
> @@ -153,26 +149,27 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		}
>  
>  		if (out) {
> -			virtio_transport_free_pkt(pkt);
> +			virtio_vsock_kfree_skb(skb);
>  			vq_err(vq, "Expected 0 output buffers, got %u\n", out);
>  			break;
>  		}
>  
>  		iov_len = iov_length(&vq->iov[out], in);
> -		if (iov_len < sizeof(pkt->hdr)) {
> -			virtio_transport_free_pkt(pkt);
> +		if (iov_len < sizeof(*hdr)) {
> +			virtio_vsock_kfree_skb(skb);
>  			vq_err(vq, "Buffer len [%zu] too small\n", iov_len);
>  			break;
>  		}
>  
>  		iov_iter_init(&iov_iter, READ, &vq->iov[out], in, iov_len);
> -		payload_len = pkt->len - pkt->off;
> +		payload_len = skb->len;
> +		hdr = virtio_vsock_hdr(skb);
>  
>  		/* If the packet is greater than the space available in the
>  		 * buffer, we split it using multiple buffers.
>  		 */
> -		if (payload_len > iov_len - sizeof(pkt->hdr)) {
> -			payload_len = iov_len - sizeof(pkt->hdr);
> +		if (payload_len > iov_len - sizeof(*hdr)) {
> +			payload_len = iov_len - sizeof(*hdr);
>  
>  			/* As we are copying pieces of large packet's buffer to
>  			 * small rx buffers, headers of packets in rx queue are
> @@ -185,31 +182,30 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  			 * bits set. After initialized header will be copied to
>  			 * rx buffer, these required bits will be restored.
>  			 */
> -			if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
> -				pkt->hdr.flags &= ~cpu_to_le32(VIRTIO_VSOCK_SEQ_EOM);
> +			if (le32_to_cpu(hdr->flags) & VIRTIO_VSOCK_SEQ_EOM) {
> +				hdr->flags &= ~cpu_to_le32(VIRTIO_VSOCK_SEQ_EOM);
>  				flags_to_restore |= VIRTIO_VSOCK_SEQ_EOM;
>  
> -				if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOR) {
> -					pkt->hdr.flags &= ~cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
> +				if (le32_to_cpu(hdr->flags) & VIRTIO_VSOCK_SEQ_EOR) {
> +					hdr->flags &= ~cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
>  					flags_to_restore |= VIRTIO_VSOCK_SEQ_EOR;
>  				}
>  			}
>  		}
>  
>  		/* Set the correct length in the header */
> -		pkt->hdr.len = cpu_to_le32(payload_len);
> +		hdr->len = cpu_to_le32(payload_len);
>  
> -		nbytes = copy_to_iter(&pkt->hdr, sizeof(pkt->hdr), &iov_iter);
> -		if (nbytes != sizeof(pkt->hdr)) {
> -			virtio_transport_free_pkt(pkt);
> +		nbytes = copy_to_iter(hdr, sizeof(*hdr), &iov_iter);
> +		if (nbytes != sizeof(*hdr)) {
> +			virtio_vsock_kfree_skb(skb);
>  			vq_err(vq, "Faulted on copying pkt hdr\n");
>  			break;
>  		}
>  
> -		nbytes = copy_to_iter(pkt->buf + pkt->off, payload_len,
> -				      &iov_iter);
> +		nbytes = copy_to_iter(skb->data, payload_len, &iov_iter);
>  		if (nbytes != payload_len) {
> -			virtio_transport_free_pkt(pkt);
> +			virtio_vsock_kfree_skb(skb);
>  			vq_err(vq, "Faulted on copying pkt buf\n");
>  			break;
>  		}
> @@ -217,31 +213,30 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		/* Deliver to monitoring devices all packets that we
>  		 * will transmit.
>  		 */
> -		virtio_transport_deliver_tap_pkt(pkt);
> +		virtio_transport_deliver_tap_pkt(skb);
>  
> -		vhost_add_used(vq, head, sizeof(pkt->hdr) + payload_len);
> +		vhost_add_used(vq, head, sizeof(*hdr) + payload_len);
>  		added = true;
>  
> -		pkt->off += payload_len;
> +		skb_pull(skb, payload_len);
>  		total_len += payload_len;
>  
>  		/* If we didn't send all the payload we can requeue the packet
>  		 * to send it with the next available buffer.
>  		 */
> -		if (pkt->off < pkt->len) {
> -			pkt->hdr.flags |= cpu_to_le32(flags_to_restore);
> +		if (skb->len > 0) {
> +			hdr->flags |= cpu_to_le32(flags_to_restore);
>  
> -			/* We are queueing the same virtio_vsock_pkt to handle
> +			/* We are queueing the same skb to handle
>  			 * the remaining bytes, and we want to deliver it
>  			 * to monitoring devices in the next iteration.
>  			 */
> -			pkt->tap_delivered = false;
> -
> -			spin_lock_bh(&vsock->send_pkt_list_lock);
> -			list_add(&pkt->list, &vsock->send_pkt_list);
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> +			virtio_vsock_skb_clear_tap_delivered(skb);
> +			spin_lock(&vsock->send_pkt_queue.lock);
> +			__skb_queue_head(&vsock->send_pkt_queue, skb);
> +			spin_unlock(&vsock->send_pkt_queue.lock);
>  		} else {
> -			if (pkt->reply) {
> +			if (virtio_vsock_skb_reply(skb)) {
>  				int val;
>  
>  				val = atomic_dec_return(&vsock->queued_replies);
> @@ -253,7 +248,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  					restart_tx = true;
>  			}
>  
> -			virtio_transport_free_pkt(pkt);
> +			virtio_vsock_consume_skb(skb);
>  		}
>  	} while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
>  	if (added)
> @@ -278,28 +273,28 @@ static void vhost_transport_send_pkt_work(struct vhost_work *work)
>  }
>  
>  static int
> -vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
> +vhost_transport_send_pkt(struct sk_buff *skb)
>  {
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  	struct vhost_vsock *vsock;
> -	int len = pkt->len;
> +	int len = skb->len;
>  
>  	rcu_read_lock();
>  
>  	/* Find the vhost_vsock according to guest context id  */
> -	vsock = vhost_vsock_get(le64_to_cpu(pkt->hdr.dst_cid));
> +	vsock = vhost_vsock_get(le64_to_cpu(hdr->dst_cid));
>  	if (!vsock) {
>  		rcu_read_unlock();
> -		virtio_transport_free_pkt(pkt);
> +		virtio_vsock_kfree_skb(skb);
>  		return -ENODEV;
>  	}
>  
> -	if (pkt->reply)
> +	if (virtio_vsock_skb_reply(skb))
>  		atomic_inc(&vsock->queued_replies);
>  
> -	spin_lock_bh(&vsock->send_pkt_list_lock);
> -	list_add_tail(&pkt->list, &vsock->send_pkt_list);
> -	spin_unlock_bh(&vsock->send_pkt_list_lock);
> -
> +	spin_lock(&vsock->send_pkt_queue.lock);
> +	__skb_queue_tail(&vsock->send_pkt_queue, skb);
> +	spin_unlock(&vsock->send_pkt_queue.lock);
>  	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
>  
>  	rcu_read_unlock();
> @@ -310,10 +305,8 @@ static int
>  vhost_transport_cancel_pkt(struct vsock_sock *vsk)
>  {
>  	struct vhost_vsock *vsock;
> -	struct virtio_vsock_pkt *pkt, *n;
>  	int cnt = 0;
>  	int ret = -ENODEV;
> -	LIST_HEAD(freeme);
>  
>  	rcu_read_lock();
>  
> @@ -322,20 +315,7 @@ vhost_transport_cancel_pkt(struct vsock_sock *vsk)
>  	if (!vsock)
>  		goto out;
>  
> -	spin_lock_bh(&vsock->send_pkt_list_lock);
> -	list_for_each_entry_safe(pkt, n, &vsock->send_pkt_list, list) {
> -		if (pkt->vsk != vsk)
> -			continue;
> -		list_move(&pkt->list, &freeme);
> -	}
> -	spin_unlock_bh(&vsock->send_pkt_list_lock);
> -
> -	list_for_each_entry_safe(pkt, n, &freeme, list) {
> -		if (pkt->reply)
> -			cnt++;
> -		list_del(&pkt->list);
> -		virtio_transport_free_pkt(pkt);
> -	}
> +	cnt = virtio_transport_purge_skbs(vsk, &vsock->send_pkt_queue);
>  
>  	if (cnt) {
>  		struct vhost_virtqueue *tx_vq = &vsock->vqs[VSOCK_VQ_TX];
> @@ -352,12 +332,14 @@ vhost_transport_cancel_pkt(struct vsock_sock *vsk)
>  	return ret;
>  }
>  
> -static struct virtio_vsock_pkt *
> -vhost_vsock_alloc_pkt(struct vhost_virtqueue *vq,
> +static struct sk_buff *
> +vhost_vsock_alloc_skb(struct vhost_virtqueue *vq,
>  		      unsigned int out, unsigned int in)
>  {
> -	struct virtio_vsock_pkt *pkt;
> +	struct virtio_vsock_hdr *hdr;
>  	struct iov_iter iov_iter;
> +	struct sk_buff *skb;
> +	size_t payload_len;
>  	size_t nbytes;
>  	size_t len;
>  
> @@ -366,50 +348,48 @@ vhost_vsock_alloc_pkt(struct vhost_virtqueue *vq,
>  		return NULL;
>  	}
>  
> -	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
> -	if (!pkt)
> +	len = iov_length(vq->iov, out);
> +
> +	/* len contains both payload and hdr */
> +	skb = alloc_skb(len, GFP_KERNEL);
> +	if (!skb)
>  		return NULL;
>  
> -	len = iov_length(vq->iov, out);
> +	skb_reserve(skb, VIRTIO_VSOCK_SKB_HEADROOM);
>  	iov_iter_init(&iov_iter, WRITE, vq->iov, out, len);
>  
> -	nbytes = copy_from_iter(&pkt->hdr, sizeof(pkt->hdr), &iov_iter);
> -	if (nbytes != sizeof(pkt->hdr)) {
> +	hdr = virtio_vsock_hdr(skb);
> +	nbytes = copy_from_iter(hdr, sizeof(*hdr), &iov_iter);
> +	if (nbytes != sizeof(*hdr)) {
>  		vq_err(vq, "Expected %zu bytes for pkt->hdr, got %zu bytes\n",
> -		       sizeof(pkt->hdr), nbytes);
> -		kfree(pkt);
> +		       sizeof(*hdr), nbytes);
> +		virtio_vsock_kfree_skb(skb);
>  		return NULL;
>  	}
>  
> -	pkt->len = le32_to_cpu(pkt->hdr.len);
> +	payload_len = le32_to_cpu(hdr->len);
>  
>  	/* No payload */
> -	if (!pkt->len)
> -		return pkt;
> +	if (!payload_len)
> +		return skb;
>  
>  	/* The pkt is too big */
> -	if (pkt->len > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE) {
> -		kfree(pkt);
> +	if (payload_len > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE) {
> +		virtio_vsock_kfree_skb(skb);
>  		return NULL;
>  	}
>  
> -	pkt->buf = kvmalloc(pkt->len, GFP_KERNEL);
> -	if (!pkt->buf) {
> -		kfree(pkt);
> -		return NULL;
> -	}
> +	virtio_vsock_skb_rx_put(skb);
>  
> -	pkt->buf_len = pkt->len;
> -
> -	nbytes = copy_from_iter(pkt->buf, pkt->len, &iov_iter);
> -	if (nbytes != pkt->len) {
> -		vq_err(vq, "Expected %u byte payload, got %zu bytes\n",
> -		       pkt->len, nbytes);
> -		virtio_transport_free_pkt(pkt);
> +	nbytes = copy_from_iter(skb->data, payload_len, &iov_iter);
> +	if (nbytes != payload_len) {
> +		vq_err(vq, "Expected %zu byte payload, got %zu bytes\n",
> +		       payload_len, nbytes);
> +		virtio_vsock_kfree_skb(skb);
>  		return NULL;
>  	}
>  
> -	return pkt;
> +	return skb;
>  }
>  
>  /* Is there space left for replies to rx packets? */
> @@ -496,9 +476,9 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  						  poll.work);
>  	struct vhost_vsock *vsock = container_of(vq->dev, struct vhost_vsock,
>  						 dev);
> -	struct virtio_vsock_pkt *pkt;
>  	int head, pkts = 0, total_len = 0;
>  	unsigned int out, in;
> +	struct sk_buff *skb;
>  	bool added = false;
>  
>  	mutex_lock(&vq->mutex);
> @@ -511,6 +491,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  
>  	vhost_disable_notify(&vsock->dev, vq);
>  	do {
> +		struct virtio_vsock_hdr *hdr;
> +
>  		if (!vhost_vsock_more_replies(vsock)) {
>  			/* Stop tx until the device processes already
>  			 * pending replies.  Leave tx virtqueue
> @@ -532,24 +514,26 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  			break;
>  		}
>  
> -		pkt = vhost_vsock_alloc_pkt(vq, out, in);
> -		if (!pkt) {
> +		skb = vhost_vsock_alloc_skb(vq, out, in);
> +		if (!skb) {
>  			vq_err(vq, "Faulted on pkt\n");
>  			continue;
>  		}
>  
> -		total_len += sizeof(pkt->hdr) + pkt->len;
> +		total_len += sizeof(*hdr) + skb->len;
>  
>  		/* Deliver to monitoring devices all received packets */
> -		virtio_transport_deliver_tap_pkt(pkt);
> +		virtio_transport_deliver_tap_pkt(skb);
> +
> +		hdr = virtio_vsock_hdr(skb);
>  
>  		/* Only accept correctly addressed packets */
> -		if (le64_to_cpu(pkt->hdr.src_cid) == vsock->guest_cid &&
> -		    le64_to_cpu(pkt->hdr.dst_cid) ==
> +		if (le64_to_cpu(hdr->src_cid) == vsock->guest_cid &&
> +		    le64_to_cpu(hdr->dst_cid) ==
>  		    vhost_transport_get_local_cid())
> -			virtio_transport_recv_pkt(&vhost_transport, pkt);
> +			virtio_transport_recv_pkt(&vhost_transport, skb);
>  		else
> -			virtio_transport_free_pkt(pkt);
> +			virtio_vsock_kfree_skb(skb);
>  
>  		vhost_add_used(vq, head, 0);
>  		added = true;
> @@ -693,8 +677,7 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
>  		       VHOST_VSOCK_WEIGHT, true, NULL);
>  
>  	file->private_data = vsock;
> -	spin_lock_init(&vsock->send_pkt_list_lock);
> -	INIT_LIST_HEAD(&vsock->send_pkt_list);
> +	skb_queue_head_init(&vsock->send_pkt_queue);
>  	vhost_work_init(&vsock->send_pkt_work, vhost_transport_send_pkt_work);
>  	return 0;
>  
> @@ -760,16 +743,7 @@ static int vhost_vsock_dev_release(struct inode *inode, struct file *file)
>  	vhost_vsock_flush(vsock);
>  	vhost_dev_stop(&vsock->dev);
>  
> -	spin_lock_bh(&vsock->send_pkt_list_lock);
> -	while (!list_empty(&vsock->send_pkt_list)) {
> -		struct virtio_vsock_pkt *pkt;
> -
> -		pkt = list_first_entry(&vsock->send_pkt_list,
> -				struct virtio_vsock_pkt, list);
> -		list_del_init(&pkt->list);
> -		virtio_transport_free_pkt(pkt);
> -	}
> -	spin_unlock_bh(&vsock->send_pkt_list_lock);
> +	virtio_vsock_skb_queue_purge(&vsock->send_pkt_queue);
>  
>  	vhost_dev_cleanup(&vsock->dev);
>  	kfree(vsock->dev.vqs);
> diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> index 35d7eedb5e8e..17e1cb8c91b2 100644
> --- a/include/linux/virtio_vsock.h
> +++ b/include/linux/virtio_vsock.h
> @@ -4,9 +4,82 @@
>  
>  #include <uapi/linux/virtio_vsock.h>
>  #include <linux/socket.h>
> +#include <vdso/bits.h>

linux/bits please. Nothing to do with vdso.



>  #include <net/sock.h>
>  #include <net/af_vsock.h>
>  
> +#define VIRTIO_VSOCK_SKB_HEADROOM (sizeof(struct virtio_vsock_hdr))
> +
> +enum virtio_vsock_skb_flags {
> +	VIRTIO_VSOCK_SKB_FLAGS_REPLY		= BIT(0),
> +	VIRTIO_VSOCK_SKB_FLAGS_TAP_DELIVERED	= BIT(1),
> +};
> +
> +static inline struct virtio_vsock_hdr *virtio_vsock_hdr(struct sk_buff *skb)
> +{
> +	return (struct virtio_vsock_hdr *)skb->head;
> +}
> +
> +static inline bool virtio_vsock_skb_reply(struct sk_buff *skb)
> +{
> +	return skb->_skb_refdst & VIRTIO_VSOCK_SKB_FLAGS_REPLY;
> +}
> +
> +static inline void virtio_vsock_skb_set_reply(struct sk_buff *skb)
> +{
> +	skb->_skb_refdst |= VIRTIO_VSOCK_SKB_FLAGS_REPLY;
> +}
> +
> +static inline bool virtio_vsock_skb_tap_delivered(struct sk_buff *skb)
> +{
> +	return skb->_skb_refdst & VIRTIO_VSOCK_SKB_FLAGS_TAP_DELIVERED;
> +}
> +
> +static inline void virtio_vsock_skb_set_tap_delivered(struct sk_buff *skb)
> +{
> +	skb->_skb_refdst |= VIRTIO_VSOCK_SKB_FLAGS_TAP_DELIVERED;
> +}
> +
> +static inline void virtio_vsock_skb_clear_tap_delivered(struct sk_buff *skb)
> +{
> +	skb->_skb_refdst &= ~VIRTIO_VSOCK_SKB_FLAGS_TAP_DELIVERED;
> +}
> +
> +static inline void virtio_vsock_skb_rx_put(struct sk_buff *skb)
> +{
> +	u32 len;
> +
> +	len = le32_to_cpu(virtio_vsock_hdr(skb)->len);
> +
> +	if (len > 0)
> +		skb_put(skb, len);
> +}
> +
> +static inline void virtio_vsock_kfree_skb(struct sk_buff *skb)
> +{
> +	skb->_skb_refdst = 0;
> +	kfree_skb(skb);
> +}
> +
> +static inline void virtio_vsock_skb_queue_purge(struct sk_buff_head *queue)
> +{
> +	struct sk_buff *skb;
> +
> +	while ((skb = __skb_dequeue(queue)) != NULL)
> +		virtio_vsock_kfree_skb(skb);
> +}
> +
> +static inline size_t virtio_vsock_skb_len(struct sk_buff *skb)
> +{
> +	return (size_t)(skb_end_pointer(skb) - skb->head);
> +}
> +
> +static inline void virtio_vsock_consume_skb(struct sk_buff *skb)
> +{
> +	skb->_skb_refdst = 0;
> +	consume_skb(skb);
> +}
> +
>  #define VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE	(1024 * 4)
>  #define VIRTIO_VSOCK_MAX_BUF_SIZE		0xFFFFFFFFUL
>  #define VIRTIO_VSOCK_MAX_PKT_BUF_SIZE		(1024 * 64)
> @@ -35,23 +108,10 @@ struct virtio_vsock_sock {
>  	u32 last_fwd_cnt;
>  	u32 rx_bytes;
>  	u32 buf_alloc;
> -	struct list_head rx_queue;
> +	struct sk_buff_head rx_queue;
>  	u32 msg_count;
>  };
>  
> -struct virtio_vsock_pkt {
> -	struct virtio_vsock_hdr	hdr;
> -	struct list_head list;
> -	/* socket refcnt not held, only use for cancellation */
> -	struct vsock_sock *vsk;
> -	void *buf;
> -	u32 buf_len;
> -	u32 len;
> -	u32 off;
> -	bool reply;
> -	bool tap_delivered;
> -};
> -
>  struct virtio_vsock_pkt_info {
>  	u32 remote_cid, remote_port;
>  	struct vsock_sock *vsk;
> @@ -68,7 +128,7 @@ struct virtio_transport {
>  	struct vsock_transport transport;
>  
>  	/* Takes ownership of the packet */
> -	int (*send_pkt)(struct virtio_vsock_pkt *pkt);
> +	int (*send_pkt)(struct sk_buff *skb);
>  };
>  
>  ssize_t
> @@ -149,11 +209,10 @@ virtio_transport_dgram_enqueue(struct vsock_sock *vsk,
>  void virtio_transport_destruct(struct vsock_sock *vsk);
>  
>  void virtio_transport_recv_pkt(struct virtio_transport *t,
> -			       struct virtio_vsock_pkt *pkt);
> -void virtio_transport_free_pkt(struct virtio_vsock_pkt *pkt);
> -void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct virtio_vsock_pkt *pkt);
> +			       struct sk_buff *skb);
> +void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct sk_buff *skb);
>  u32 virtio_transport_get_credit(struct virtio_vsock_sock *vvs, u32 wanted);
>  void virtio_transport_put_credit(struct virtio_vsock_sock *vvs, u32 credit);
> -void virtio_transport_deliver_tap_pkt(struct virtio_vsock_pkt *pkt);
> -
> +void virtio_transport_deliver_tap_pkt(struct sk_buff *skb);
> +int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *queue);
>  #endif /* _LINUX_VIRTIO_VSOCK_H */
> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> index ad64f403536a..172dbc52a370 100644
> --- a/net/vmw_vsock/virtio_transport.c
> +++ b/net/vmw_vsock/virtio_transport.c
> @@ -42,8 +42,7 @@ struct virtio_vsock {
>  	bool tx_run;
>  
>  	struct work_struct send_pkt_work;
> -	spinlock_t send_pkt_list_lock;
> -	struct list_head send_pkt_list;
> +	struct sk_buff_head send_pkt_queue;
>  
>  	atomic_t queued_replies;
>  
> @@ -101,41 +100,36 @@ virtio_transport_send_pkt_work(struct work_struct *work)
>  	vq = vsock->vqs[VSOCK_VQ_TX];
>  
>  	for (;;) {
> -		struct virtio_vsock_pkt *pkt;
>  		struct scatterlist hdr, buf, *sgs[2];
>  		int ret, in_sg = 0, out_sg = 0;
> +		struct sk_buff *skb;
>  		bool reply;
>  
> -		spin_lock_bh(&vsock->send_pkt_list_lock);
> -		if (list_empty(&vsock->send_pkt_list)) {
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> -			break;
> -		}
> -
> -		pkt = list_first_entry(&vsock->send_pkt_list,
> -				       struct virtio_vsock_pkt, list);
> -		list_del_init(&pkt->list);
> -		spin_unlock_bh(&vsock->send_pkt_list_lock);
> +		spin_lock(&vsock->send_pkt_queue.lock);
> +		skb = __skb_dequeue(&vsock->send_pkt_queue);
> +		spin_unlock(&vsock->send_pkt_queue.lock);
>  
> -		virtio_transport_deliver_tap_pkt(pkt);
> +		if (!skb)
> +			break;
>  
> -		reply = pkt->reply;
> +		virtio_transport_deliver_tap_pkt(skb);
> +		reply = virtio_vsock_skb_reply(skb);
>  
> -		sg_init_one(&hdr, &pkt->hdr, sizeof(pkt->hdr));
> +		sg_init_one(&hdr, virtio_vsock_hdr(skb), sizeof(*virtio_vsock_hdr(skb)));
>  		sgs[out_sg++] = &hdr;
> -		if (pkt->buf) {
> -			sg_init_one(&buf, pkt->buf, pkt->len);
> +		if (skb->len > 0) {
> +			sg_init_one(&buf, skb->data, skb->len);
>  			sgs[out_sg++] = &buf;
>  		}
>  
> -		ret = virtqueue_add_sgs(vq, sgs, out_sg, in_sg, pkt, GFP_KERNEL);
> +		ret = virtqueue_add_sgs(vq, sgs, out_sg, in_sg, skb, GFP_KERNEL);
>  		/* Usually this means that there is no more space available in
>  		 * the vq
>  		 */
>  		if (ret < 0) {
> -			spin_lock_bh(&vsock->send_pkt_list_lock);
> -			list_add(&pkt->list, &vsock->send_pkt_list);
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> +			spin_lock(&vsock->send_pkt_queue.lock);
> +			__skb_queue_head(&vsock->send_pkt_queue, skb);
> +			spin_unlock(&vsock->send_pkt_queue.lock);
>  			break;
>  		}
>  
> @@ -164,32 +158,34 @@ virtio_transport_send_pkt_work(struct work_struct *work)
>  }
>  
>  static int
> -virtio_transport_send_pkt(struct virtio_vsock_pkt *pkt)
> +virtio_transport_send_pkt(struct sk_buff *skb)
>  {
> +	struct virtio_vsock_hdr *hdr;
>  	struct virtio_vsock *vsock;
> -	int len = pkt->len;
> +	int len = skb->len;
> +
> +	hdr = virtio_vsock_hdr(skb);
>  
>  	rcu_read_lock();
>  	vsock = rcu_dereference(the_virtio_vsock);
>  	if (!vsock) {
> -		virtio_transport_free_pkt(pkt);
> +		virtio_vsock_kfree_skb(skb);
>  		len = -ENODEV;
>  		goto out_rcu;
>  	}
>  
> -	if (le64_to_cpu(pkt->hdr.dst_cid) == vsock->guest_cid) {
> -		virtio_transport_free_pkt(pkt);
> +	if (le64_to_cpu(hdr->dst_cid) == vsock->guest_cid) {
> +		virtio_vsock_kfree_skb(skb);
>  		len = -ENODEV;
>  		goto out_rcu;
>  	}
>  
> -	if (pkt->reply)
> +	if (virtio_vsock_skb_reply(skb))
>  		atomic_inc(&vsock->queued_replies);
>  
> -	spin_lock_bh(&vsock->send_pkt_list_lock);
> -	list_add_tail(&pkt->list, &vsock->send_pkt_list);
> -	spin_unlock_bh(&vsock->send_pkt_list_lock);
> -
> +	spin_lock(&vsock->send_pkt_queue.lock);
> +	__skb_queue_tail(&vsock->send_pkt_queue, skb);
> +	spin_unlock(&vsock->send_pkt_queue.lock);
>  	queue_work(virtio_vsock_workqueue, &vsock->send_pkt_work);
>  
>  out_rcu:
> @@ -201,9 +197,7 @@ static int
>  virtio_transport_cancel_pkt(struct vsock_sock *vsk)
>  {
>  	struct virtio_vsock *vsock;
> -	struct virtio_vsock_pkt *pkt, *n;
>  	int cnt = 0, ret;
> -	LIST_HEAD(freeme);
>  
>  	rcu_read_lock();
>  	vsock = rcu_dereference(the_virtio_vsock);
> @@ -212,20 +206,7 @@ virtio_transport_cancel_pkt(struct vsock_sock *vsk)
>  		goto out_rcu;
>  	}
>  
> -	spin_lock_bh(&vsock->send_pkt_list_lock);
> -	list_for_each_entry_safe(pkt, n, &vsock->send_pkt_list, list) {
> -		if (pkt->vsk != vsk)
> -			continue;
> -		list_move(&pkt->list, &freeme);
> -	}
> -	spin_unlock_bh(&vsock->send_pkt_list_lock);
> -
> -	list_for_each_entry_safe(pkt, n, &freeme, list) {
> -		if (pkt->reply)
> -			cnt++;
> -		list_del(&pkt->list);
> -		virtio_transport_free_pkt(pkt);
> -	}
> +	cnt = virtio_transport_purge_skbs(vsk, &vsock->send_pkt_queue);
>  
>  	if (cnt) {
>  		struct virtqueue *rx_vq = vsock->vqs[VSOCK_VQ_RX];
> @@ -246,38 +227,29 @@ virtio_transport_cancel_pkt(struct vsock_sock *vsk)
>  
>  static void virtio_vsock_rx_fill(struct virtio_vsock *vsock)
>  {
> -	int buf_len = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE;
> -	struct virtio_vsock_pkt *pkt;
> -	struct scatterlist hdr, buf, *sgs[2];
> +	int buf_len = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE + VIRTIO_VSOCK_SKB_HEADROOM;
> +	struct scatterlist pkt, *p;
>  	struct virtqueue *vq;
> +	struct sk_buff *skb;
>  	int ret;
>  
>  	vq = vsock->vqs[VSOCK_VQ_RX];
>  
>  	do {
> -		pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
> -		if (!pkt)
> +		skb = alloc_skb(buf_len, GFP_KERNEL);
> +		if (!skb)
>  			break;
>  
> -		pkt->buf = kmalloc(buf_len, GFP_KERNEL);
> -		if (!pkt->buf) {
> -			virtio_transport_free_pkt(pkt);
> -			break;
> -		}
> -
> -		pkt->buf_len = buf_len;
> -		pkt->len = buf_len;
> -
> -		sg_init_one(&hdr, &pkt->hdr, sizeof(pkt->hdr));
> -		sgs[0] = &hdr;
> +		memset(skb->head, 0, VIRTIO_VSOCK_SKB_HEADROOM);
>  
> -		sg_init_one(&buf, pkt->buf, buf_len);
> -		sgs[1] = &buf;
> -		ret = virtqueue_add_sgs(vq, sgs, 0, 2, pkt, GFP_KERNEL);
> -		if (ret) {
> -			virtio_transport_free_pkt(pkt);
> +		sg_init_one(&pkt, virtio_vsock_hdr(skb), buf_len);
> +		p = &pkt;
> +		ret = virtqueue_add_sgs(vq, &p, 0, 1, skb, GFP_KERNEL);
> +		if (ret < 0) {
> +			virtio_vsock_kfree_skb(skb);
>  			break;
>  		}
> +
>  		vsock->rx_buf_nr++;
>  	} while (vq->num_free);
>  	if (vsock->rx_buf_nr > vsock->rx_buf_max_nr)
> @@ -299,12 +271,12 @@ static void virtio_transport_tx_work(struct work_struct *work)
>  		goto out;
>  
>  	do {
> -		struct virtio_vsock_pkt *pkt;
> +		struct sk_buff *skb;
>  		unsigned int len;
>  
>  		virtqueue_disable_cb(vq);
> -		while ((pkt = virtqueue_get_buf(vq, &len)) != NULL) {
> -			virtio_transport_free_pkt(pkt);
> +		while ((skb = virtqueue_get_buf(vq, &len)) != NULL) {
> +			virtio_vsock_consume_skb(skb);
>  			added = true;
>  		}
>  	} while (!virtqueue_enable_cb(vq));
> @@ -529,7 +501,7 @@ static void virtio_transport_rx_work(struct work_struct *work)
>  	do {
>  		virtqueue_disable_cb(vq);
>  		for (;;) {
> -			struct virtio_vsock_pkt *pkt;
> +			struct sk_buff *skb;
>  			unsigned int len;
>  
>  			if (!virtio_transport_more_replies(vsock)) {
> @@ -540,23 +512,23 @@ static void virtio_transport_rx_work(struct work_struct *work)
>  				goto out;
>  			}
>  
> -			pkt = virtqueue_get_buf(vq, &len);
> -			if (!pkt) {
> +			skb = virtqueue_get_buf(vq, &len);
> +			if (!skb)
>  				break;
> -			}
>  
>  			vsock->rx_buf_nr--;
>  
>  			/* Drop short/long packets */
> -			if (unlikely(len < sizeof(pkt->hdr) ||
> -				     len > sizeof(pkt->hdr) + pkt->len)) {
> -				virtio_transport_free_pkt(pkt);
> +			if (unlikely(len < sizeof(struct virtio_vsock_hdr) ||
> +				     len > virtio_vsock_skb_len(skb))) {
> +				virtio_vsock_kfree_skb(skb);
>  				continue;
>  			}
>  
> -			pkt->len = len - sizeof(pkt->hdr);
> -			virtio_transport_deliver_tap_pkt(pkt);
> -			virtio_transport_recv_pkt(&virtio_transport, pkt);
> +			skb_reserve(skb, VIRTIO_VSOCK_SKB_HEADROOM);
> +			virtio_vsock_skb_rx_put(skb);
> +			virtio_transport_deliver_tap_pkt(skb);
> +			virtio_transport_recv_pkt(&virtio_transport, skb);
>  		}
>  	} while (!virtqueue_enable_cb(vq));
>  
> @@ -610,7 +582,7 @@ static int virtio_vsock_vqs_init(struct virtio_vsock *vsock)
>  static void virtio_vsock_vqs_del(struct virtio_vsock *vsock)
>  {
>  	struct virtio_device *vdev = vsock->vdev;
> -	struct virtio_vsock_pkt *pkt;
> +	struct sk_buff *skb;
>  
>  	/* Reset all connected sockets when the VQs disappear */
>  	vsock_for_each_connected_socket(&virtio_transport.transport,
> @@ -637,23 +609,18 @@ static void virtio_vsock_vqs_del(struct virtio_vsock *vsock)
>  	virtio_reset_device(vdev);
>  
>  	mutex_lock(&vsock->rx_lock);
> -	while ((pkt = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_RX])))
> -		virtio_transport_free_pkt(pkt);
> +	while ((skb = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_RX])))
> +		virtio_vsock_kfree_skb(skb);
>  	mutex_unlock(&vsock->rx_lock);
>  
>  	mutex_lock(&vsock->tx_lock);
> -	while ((pkt = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_TX])))
> -		virtio_transport_free_pkt(pkt);
> +	while ((skb = virtqueue_detach_unused_buf(vsock->vqs[VSOCK_VQ_TX])))
> +		virtio_vsock_kfree_skb(skb);
>  	mutex_unlock(&vsock->tx_lock);
>  
> -	spin_lock_bh(&vsock->send_pkt_list_lock);
> -	while (!list_empty(&vsock->send_pkt_list)) {
> -		pkt = list_first_entry(&vsock->send_pkt_list,
> -				       struct virtio_vsock_pkt, list);
> -		list_del(&pkt->list);
> -		virtio_transport_free_pkt(pkt);
> -	}
> -	spin_unlock_bh(&vsock->send_pkt_list_lock);
> +	spin_lock(&vsock->send_pkt_queue.lock);
> +	virtio_vsock_skb_queue_purge(&vsock->send_pkt_queue);
> +	spin_unlock(&vsock->send_pkt_queue.lock);
>  
>  	/* Delete virtqueues and flush outstanding callbacks if any */
>  	vdev->config->del_vqs(vdev);
> @@ -690,8 +657,7 @@ static int virtio_vsock_probe(struct virtio_device *vdev)
>  	mutex_init(&vsock->tx_lock);
>  	mutex_init(&vsock->rx_lock);
>  	mutex_init(&vsock->event_lock);
> -	spin_lock_init(&vsock->send_pkt_list_lock);
> -	INIT_LIST_HEAD(&vsock->send_pkt_list);
> +	skb_queue_head_init(&vsock->send_pkt_queue);
>  	INIT_WORK(&vsock->rx_work, virtio_transport_rx_work);
>  	INIT_WORK(&vsock->tx_work, virtio_transport_tx_work);
>  	INIT_WORK(&vsock->event_work, virtio_transport_event_work);
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index a9980e9b9304..b40a17cbbccf 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -37,53 +37,58 @@ virtio_transport_get_ops(struct vsock_sock *vsk)
>  	return container_of(t, struct virtio_transport, transport);
>  }
>  
> -static struct virtio_vsock_pkt *
> -virtio_transport_alloc_pkt(struct virtio_vsock_pkt_info *info,
> +/* Returns a new packet on success, otherwise returns NULL.
> + *
> + * If NULL is returned, errp is set to a negative errno.
> + */
> +static struct sk_buff *
> +virtio_transport_alloc_skb(struct virtio_vsock_pkt_info *info,
>  			   size_t len,
>  			   u32 src_cid,
>  			   u32 src_port,
>  			   u32 dst_cid,
>  			   u32 dst_port)
>  {
> -	struct virtio_vsock_pkt *pkt;
> +	const size_t skb_len = VIRTIO_VSOCK_SKB_HEADROOM + len;
> +	struct virtio_vsock_hdr *hdr;
> +	struct sk_buff *skb;
> +	void *payload;
>  	int err;
>  
> -	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
> -	if (!pkt)
> +	skb = alloc_skb(skb_len, GFP_KERNEL);
> +	if (!skb)
>  		return NULL;
>  
> -	pkt->hdr.type		= cpu_to_le16(info->type);
> -	pkt->hdr.op		= cpu_to_le16(info->op);
> -	pkt->hdr.src_cid	= cpu_to_le64(src_cid);
> -	pkt->hdr.dst_cid	= cpu_to_le64(dst_cid);
> -	pkt->hdr.src_port	= cpu_to_le32(src_port);
> -	pkt->hdr.dst_port	= cpu_to_le32(dst_port);
> -	pkt->hdr.flags		= cpu_to_le32(info->flags);
> -	pkt->len		= len;
> -	pkt->hdr.len		= cpu_to_le32(len);
> -	pkt->reply		= info->reply;
> -	pkt->vsk		= info->vsk;
> +	skb_reserve(skb, VIRTIO_VSOCK_SKB_HEADROOM);
> +	payload = skb_put(skb, len);
>  
> -	if (info->msg && len > 0) {
> -		pkt->buf = kmalloc(len, GFP_KERNEL);
> -		if (!pkt->buf)
> -			goto out_pkt;
> -
> -		pkt->buf_len = len;
> +	hdr = virtio_vsock_hdr(skb);
> +	hdr->type	= cpu_to_le16(info->type);
> +	hdr->op		= cpu_to_le16(info->op);
> +	hdr->src_cid	= cpu_to_le64(src_cid);
> +	hdr->dst_cid	= cpu_to_le64(dst_cid);
> +	hdr->src_port	= cpu_to_le32(src_port);
> +	hdr->dst_port	= cpu_to_le32(dst_port);
> +	hdr->flags	= cpu_to_le32(info->flags);
> +	hdr->len	= cpu_to_le32(len);
>  
> -		err = memcpy_from_msg(pkt->buf, info->msg, len);
> +	if (info->msg && len > 0) {
> +		err = memcpy_from_msg(payload, info->msg, len);
>  		if (err)
>  			goto out;
>  
>  		if (msg_data_left(info->msg) == 0 &&
>  		    info->type == VIRTIO_VSOCK_TYPE_SEQPACKET) {
> -			pkt->hdr.flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOM);
> +			hdr->flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOM);
>  
>  			if (info->msg->msg_flags & MSG_EOR)
> -				pkt->hdr.flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
> +				hdr->flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
>  		}
>  	}
>  
> +	if (info->reply)
> +		virtio_vsock_skb_set_reply(skb);
> +
>  	trace_virtio_transport_alloc_pkt(src_cid, src_port,
>  					 dst_cid, dst_port,
>  					 len,
> @@ -91,85 +96,26 @@ virtio_transport_alloc_pkt(struct virtio_vsock_pkt_info *info,
>  					 info->op,
>  					 info->flags);
>  
> -	return pkt;
> +	return skb;
>  
>  out:
> -	kfree(pkt->buf);
> -out_pkt:
> -	kfree(pkt);
> +	virtio_vsock_kfree_skb(skb);
>  	return NULL;
>  }
>  
>  /* Packet capture */
>  static struct sk_buff *virtio_transport_build_skb(void *opaque)
>  {
> -	struct virtio_vsock_pkt *pkt = opaque;
> -	struct af_vsockmon_hdr *hdr;
> -	struct sk_buff *skb;
> -	size_t payload_len;
> -	void *payload_buf;
> -
> -	/* A packet could be split to fit the RX buffer, so we can retrieve
> -	 * the payload length from the header and the buffer pointer taking
> -	 * care of the offset in the original packet.
> -	 */
> -	payload_len = le32_to_cpu(pkt->hdr.len);
> -	payload_buf = pkt->buf + pkt->off;
> -
> -	skb = alloc_skb(sizeof(*hdr) + sizeof(pkt->hdr) + payload_len,
> -			GFP_ATOMIC);
> -	if (!skb)
> -		return NULL;
> -
> -	hdr = skb_put(skb, sizeof(*hdr));
> -
> -	/* pkt->hdr is little-endian so no need to byteswap here */
> -	hdr->src_cid = pkt->hdr.src_cid;
> -	hdr->src_port = pkt->hdr.src_port;
> -	hdr->dst_cid = pkt->hdr.dst_cid;
> -	hdr->dst_port = pkt->hdr.dst_port;
> -
> -	hdr->transport = cpu_to_le16(AF_VSOCK_TRANSPORT_VIRTIO);
> -	hdr->len = cpu_to_le16(sizeof(pkt->hdr));
> -	memset(hdr->reserved, 0, sizeof(hdr->reserved));
> -
> -	switch (le16_to_cpu(pkt->hdr.op)) {
> -	case VIRTIO_VSOCK_OP_REQUEST:
> -	case VIRTIO_VSOCK_OP_RESPONSE:
> -		hdr->op = cpu_to_le16(AF_VSOCK_OP_CONNECT);
> -		break;
> -	case VIRTIO_VSOCK_OP_RST:
> -	case VIRTIO_VSOCK_OP_SHUTDOWN:
> -		hdr->op = cpu_to_le16(AF_VSOCK_OP_DISCONNECT);
> -		break;
> -	case VIRTIO_VSOCK_OP_RW:
> -		hdr->op = cpu_to_le16(AF_VSOCK_OP_PAYLOAD);
> -		break;
> -	case VIRTIO_VSOCK_OP_CREDIT_UPDATE:
> -	case VIRTIO_VSOCK_OP_CREDIT_REQUEST:
> -		hdr->op = cpu_to_le16(AF_VSOCK_OP_CONTROL);
> -		break;
> -	default:
> -		hdr->op = cpu_to_le16(AF_VSOCK_OP_UNKNOWN);
> -		break;
> -	}
> -
> -	skb_put_data(skb, &pkt->hdr, sizeof(pkt->hdr));
> -
> -	if (payload_len) {
> -		skb_put_data(skb, payload_buf, payload_len);
> -	}
> -
> -	return skb;
> +	return skb_copy(opaque, GFP_ATOMIC);
>  }
>  
> -void virtio_transport_deliver_tap_pkt(struct virtio_vsock_pkt *pkt)
> +void virtio_transport_deliver_tap_pkt(struct sk_buff *skb)
>  {
> -	if (pkt->tap_delivered)
> +	if (virtio_vsock_skb_tap_delivered(skb))
>  		return;
>  
> -	vsock_deliver_tap(virtio_transport_build_skb, pkt);
> -	pkt->tap_delivered = true;
> +	vsock_deliver_tap(virtio_transport_build_skb, skb);
> +	virtio_vsock_skb_set_tap_delivered(skb);
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_deliver_tap_pkt);
>  
> @@ -192,8 +138,8 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
>  	u32 src_cid, src_port, dst_cid, dst_port;
>  	const struct virtio_transport *t_ops;
>  	struct virtio_vsock_sock *vvs;
> -	struct virtio_vsock_pkt *pkt;
>  	u32 pkt_len = info->pkt_len;
> +	struct sk_buff *skb;
>  
>  	info->type = virtio_transport_get_type(sk_vsock(vsk));
>  
> @@ -224,42 +170,47 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
>  	if (pkt_len == 0 && info->op == VIRTIO_VSOCK_OP_RW)
>  		return pkt_len;
>  
> -	pkt = virtio_transport_alloc_pkt(info, pkt_len,
> +	skb = virtio_transport_alloc_skb(info, pkt_len,
>  					 src_cid, src_port,
>  					 dst_cid, dst_port);
> -	if (!pkt) {
> +	if (!skb) {
>  		virtio_transport_put_credit(vvs, pkt_len);
>  		return -ENOMEM;
>  	}
>  
> -	virtio_transport_inc_tx_pkt(vvs, pkt);
> +	virtio_transport_inc_tx_pkt(vvs, skb);
>  
> -	return t_ops->send_pkt(pkt);
> +	return t_ops->send_pkt(skb);
>  }
>  
>  static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
> -					struct virtio_vsock_pkt *pkt)
> +					struct sk_buff *skb)
>  {
> -	if (vvs->rx_bytes + pkt->len > vvs->buf_alloc)
> +	if (vvs->rx_bytes + skb->len > vvs->buf_alloc)
>  		return false;
>  
> -	vvs->rx_bytes += pkt->len;
> +	vvs->rx_bytes += skb->len;
>  	return true;
>  }
>  
>  static void virtio_transport_dec_rx_pkt(struct virtio_vsock_sock *vvs,
> -					struct virtio_vsock_pkt *pkt)
> +					struct sk_buff *skb)
>  {
> -	vvs->rx_bytes -= pkt->len;
> -	vvs->fwd_cnt += pkt->len;
> +	int len;
> +
> +	len = skb_headroom(skb) - sizeof(struct virtio_vsock_hdr) - skb->len;
> +	vvs->rx_bytes -= len;
> +	vvs->fwd_cnt += len;
>  }
>  
> -void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct virtio_vsock_pkt *pkt)
> +void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct sk_buff *skb)
>  {
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
> +
>  	spin_lock_bh(&vvs->rx_lock);
>  	vvs->last_fwd_cnt = vvs->fwd_cnt;
> -	pkt->hdr.fwd_cnt = cpu_to_le32(vvs->fwd_cnt);
> -	pkt->hdr.buf_alloc = cpu_to_le32(vvs->buf_alloc);
> +	hdr->fwd_cnt = cpu_to_le32(vvs->fwd_cnt);
> +	hdr->buf_alloc = cpu_to_le32(vvs->buf_alloc);
>  	spin_unlock_bh(&vvs->rx_lock);
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_inc_tx_pkt);
> @@ -303,29 +254,29 @@ virtio_transport_stream_do_peek(struct vsock_sock *vsk,
>  				size_t len)
>  {
>  	struct virtio_vsock_sock *vvs = vsk->trans;
> -	struct virtio_vsock_pkt *pkt;
>  	size_t bytes, total = 0, off;
> +	struct sk_buff *skb, *tmp;
>  	int err = -EFAULT;
>  
>  	spin_lock_bh(&vvs->rx_lock);
>  
> -	list_for_each_entry(pkt, &vvs->rx_queue, list) {
> -		off = pkt->off;
> +	skb_queue_walk_safe(&vvs->rx_queue, skb,  tmp) {
> +		off = 0;
>  
>  		if (total == len)
>  			break;
>  
> -		while (total < len && off < pkt->len) {
> +		while (total < len && off < skb->len) {
>  			bytes = len - total;
> -			if (bytes > pkt->len - off)
> -				bytes = pkt->len - off;
> +			if (bytes > skb->len - off)
> +				bytes = skb->len - off;
>  
>  			/* sk_lock is held by caller so no one else can dequeue.
>  			 * Unlock rx_lock since memcpy_to_msg() may sleep.
>  			 */
>  			spin_unlock_bh(&vvs->rx_lock);
>  
> -			err = memcpy_to_msg(msg, pkt->buf + off, bytes);
> +			err = memcpy_to_msg(msg, skb->data + off, bytes);
>  			if (err)
>  				goto out;
>  
> @@ -352,37 +303,38 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
>  				   size_t len)
>  {
>  	struct virtio_vsock_sock *vvs = vsk->trans;
> -	struct virtio_vsock_pkt *pkt;
>  	size_t bytes, total = 0;
> -	u32 free_space;
> +	struct sk_buff *skb;
>  	int err = -EFAULT;
> +	u32 free_space;
>  
>  	spin_lock_bh(&vvs->rx_lock);
> -	while (total < len && !list_empty(&vvs->rx_queue)) {
> -		pkt = list_first_entry(&vvs->rx_queue,
> -				       struct virtio_vsock_pkt, list);
> +	while (total < len && !skb_queue_empty_lockless(&vvs->rx_queue)) {
> +		skb = __skb_dequeue(&vvs->rx_queue);
>  
>  		bytes = len - total;
> -		if (bytes > pkt->len - pkt->off)
> -			bytes = pkt->len - pkt->off;
> +		if (bytes > skb->len)
> +			bytes = skb->len;
>  
>  		/* sk_lock is held by caller so no one else can dequeue.
>  		 * Unlock rx_lock since memcpy_to_msg() may sleep.
>  		 */
>  		spin_unlock_bh(&vvs->rx_lock);
>  
> -		err = memcpy_to_msg(msg, pkt->buf + pkt->off, bytes);
> +		err = memcpy_to_msg(msg, skb->data, bytes);
>  		if (err)
>  			goto out;
>  
>  		spin_lock_bh(&vvs->rx_lock);
>  
>  		total += bytes;
> -		pkt->off += bytes;
> -		if (pkt->off == pkt->len) {
> -			virtio_transport_dec_rx_pkt(vvs, pkt);
> -			list_del(&pkt->list);
> -			virtio_transport_free_pkt(pkt);
> +		skb_pull(skb, bytes);
> +
> +		if (skb->len == 0) {
> +			virtio_transport_dec_rx_pkt(vvs, skb);
> +			virtio_vsock_consume_skb(skb);
> +		} else {
> +			__skb_queue_head(&vvs->rx_queue, skb);
>  		}
>  	}
>  
> @@ -414,10 +366,10 @@ static int virtio_transport_seqpacket_do_dequeue(struct vsock_sock *vsk,
>  						 int flags)
>  {
>  	struct virtio_vsock_sock *vvs = vsk->trans;
> -	struct virtio_vsock_pkt *pkt;
>  	int dequeued_len = 0;
>  	size_t user_buf_len = msg_data_left(msg);
>  	bool msg_ready = false;
> +	struct sk_buff *skb;
>  
>  	spin_lock_bh(&vvs->rx_lock);
>  
> @@ -427,13 +379,18 @@ static int virtio_transport_seqpacket_do_dequeue(struct vsock_sock *vsk,
>  	}
>  
>  	while (!msg_ready) {
> -		pkt = list_first_entry(&vvs->rx_queue, struct virtio_vsock_pkt, list);
> +		struct virtio_vsock_hdr *hdr;
> +
> +		skb = __skb_dequeue(&vvs->rx_queue);
> +		if (!skb)
> +			break;
> +		hdr = virtio_vsock_hdr(skb);
>  
>  		if (dequeued_len >= 0) {
>  			size_t pkt_len;
>  			size_t bytes_to_copy;
>  
> -			pkt_len = (size_t)le32_to_cpu(pkt->hdr.len);
> +			pkt_len = (size_t)le32_to_cpu(hdr->len);
>  			bytes_to_copy = min(user_buf_len, pkt_len);
>  
>  			if (bytes_to_copy) {
> @@ -444,7 +401,7 @@ static int virtio_transport_seqpacket_do_dequeue(struct vsock_sock *vsk,
>  				 */
>  				spin_unlock_bh(&vvs->rx_lock);
>  
> -				err = memcpy_to_msg(msg, pkt->buf, bytes_to_copy);
> +				err = memcpy_to_msg(msg, skb->data, bytes_to_copy);
>  				if (err) {
>  					/* Copy of message failed. Rest of
>  					 * fragments will be freed without copy.
> @@ -452,6 +409,7 @@ static int virtio_transport_seqpacket_do_dequeue(struct vsock_sock *vsk,
>  					dequeued_len = err;
>  				} else {
>  					user_buf_len -= bytes_to_copy;
> +					skb_pull(skb, bytes_to_copy);
>  				}
>  
>  				spin_lock_bh(&vvs->rx_lock);
> @@ -461,17 +419,16 @@ static int virtio_transport_seqpacket_do_dequeue(struct vsock_sock *vsk,
>  				dequeued_len += pkt_len;
>  		}
>  
> -		if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
> +		if (le32_to_cpu(hdr->flags) & VIRTIO_VSOCK_SEQ_EOM) {
>  			msg_ready = true;
>  			vvs->msg_count--;
>  
> -			if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOR)
> +			if (le32_to_cpu(hdr->flags) & VIRTIO_VSOCK_SEQ_EOR)
>  				msg->msg_flags |= MSG_EOR;
>  		}
>  
> -		virtio_transport_dec_rx_pkt(vvs, pkt);
> -		list_del(&pkt->list);
> -		virtio_transport_free_pkt(pkt);
> +		virtio_transport_dec_rx_pkt(vvs, skb);
> +		virtio_vsock_kfree_skb(skb);
>  	}
>  
>  	spin_unlock_bh(&vvs->rx_lock);
> @@ -609,7 +566,7 @@ int virtio_transport_do_socket_init(struct vsock_sock *vsk,
>  
>  	spin_lock_init(&vvs->rx_lock);
>  	spin_lock_init(&vvs->tx_lock);
> -	INIT_LIST_HEAD(&vvs->rx_queue);
> +	skb_queue_head_init(&vvs->rx_queue);
>  
>  	return 0;
>  }
> @@ -806,16 +763,16 @@ void virtio_transport_destruct(struct vsock_sock *vsk)
>  EXPORT_SYMBOL_GPL(virtio_transport_destruct);
>  
>  static int virtio_transport_reset(struct vsock_sock *vsk,
> -				  struct virtio_vsock_pkt *pkt)
> +				  struct sk_buff *skb)
>  {
>  	struct virtio_vsock_pkt_info info = {
>  		.op = VIRTIO_VSOCK_OP_RST,
> -		.reply = !!pkt,
> +		.reply = !!skb,
>  		.vsk = vsk,
>  	};
>  
>  	/* Send RST only if the original pkt is not a RST pkt */
> -	if (pkt && le16_to_cpu(pkt->hdr.op) == VIRTIO_VSOCK_OP_RST)
> +	if (skb && le16_to_cpu(virtio_vsock_hdr(skb)->op) == VIRTIO_VSOCK_OP_RST)
>  		return 0;
>  
>  	return virtio_transport_send_pkt_info(vsk, &info);
> @@ -825,29 +782,30 @@ static int virtio_transport_reset(struct vsock_sock *vsk,
>   * attempt was made to connect to a socket that does not exist.
>   */
>  static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
> -					  struct virtio_vsock_pkt *pkt)
> +					  struct sk_buff *skb)
>  {
> -	struct virtio_vsock_pkt *reply;
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  	struct virtio_vsock_pkt_info info = {
>  		.op = VIRTIO_VSOCK_OP_RST,
> -		.type = le16_to_cpu(pkt->hdr.type),
> +		.type = le16_to_cpu(hdr->type),
>  		.reply = true,
>  	};
> +	struct sk_buff *reply;
>  
>  	/* Send RST only if the original pkt is not a RST pkt */
> -	if (le16_to_cpu(pkt->hdr.op) == VIRTIO_VSOCK_OP_RST)
> +	if (le16_to_cpu(hdr->op) == VIRTIO_VSOCK_OP_RST)
>  		return 0;
>  
> -	reply = virtio_transport_alloc_pkt(&info, 0,
> -					   le64_to_cpu(pkt->hdr.dst_cid),
> -					   le32_to_cpu(pkt->hdr.dst_port),
> -					   le64_to_cpu(pkt->hdr.src_cid),
> -					   le32_to_cpu(pkt->hdr.src_port));
> +	reply = virtio_transport_alloc_skb(&info, 0,
> +					   le64_to_cpu(hdr->dst_cid),
> +					   le32_to_cpu(hdr->dst_port),
> +					   le64_to_cpu(hdr->src_cid),
> +					   le32_to_cpu(hdr->src_port));
>  	if (!reply)
>  		return -ENOMEM;
>  
>  	if (!t) {
> -		virtio_transport_free_pkt(reply);
> +		virtio_vsock_kfree_skb(reply);
>  		return -ENOTCONN;
>  	}
>  
> @@ -858,16 +816,11 @@ static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
>  static void virtio_transport_remove_sock(struct vsock_sock *vsk)
>  {
>  	struct virtio_vsock_sock *vvs = vsk->trans;
> -	struct virtio_vsock_pkt *pkt, *tmp;
>  
>  	/* We don't need to take rx_lock, as the socket is closing and we are
>  	 * removing it.
>  	 */
> -	list_for_each_entry_safe(pkt, tmp, &vvs->rx_queue, list) {
> -		list_del(&pkt->list);
> -		virtio_transport_free_pkt(pkt);
> -	}
> -
> +	virtio_vsock_skb_queue_purge(&vvs->rx_queue);
>  	vsock_remove_sock(vsk);
>  }
>  
> @@ -981,13 +934,14 @@ EXPORT_SYMBOL_GPL(virtio_transport_release);
>  
>  static int
>  virtio_transport_recv_connecting(struct sock *sk,
> -				 struct virtio_vsock_pkt *pkt)
> +				 struct sk_buff *skb)
>  {
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  	struct vsock_sock *vsk = vsock_sk(sk);
> -	int err;
>  	int skerr;
> +	int err;
>  
> -	switch (le16_to_cpu(pkt->hdr.op)) {
> +	switch (le16_to_cpu(hdr->op)) {
>  	case VIRTIO_VSOCK_OP_RESPONSE:
>  		sk->sk_state = TCP_ESTABLISHED;
>  		sk->sk_socket->state = SS_CONNECTED;
> @@ -1008,7 +962,7 @@ virtio_transport_recv_connecting(struct sock *sk,
>  	return 0;
>  
>  destroy:
> -	virtio_transport_reset(vsk, pkt);
> +	virtio_transport_reset(vsk, skb);
>  	sk->sk_state = TCP_CLOSE;
>  	sk->sk_err = skerr;
>  	sk_error_report(sk);
> @@ -1017,34 +971,37 @@ virtio_transport_recv_connecting(struct sock *sk,
>  
>  static void
>  virtio_transport_recv_enqueue(struct vsock_sock *vsk,
> -			      struct virtio_vsock_pkt *pkt)
> +			      struct sk_buff *skb)
>  {
>  	struct virtio_vsock_sock *vvs = vsk->trans;
>  	bool can_enqueue, free_pkt = false;
> +	struct virtio_vsock_hdr *hdr;
> +	u32 len;
>  
> -	pkt->len = le32_to_cpu(pkt->hdr.len);
> -	pkt->off = 0;
> +	hdr = virtio_vsock_hdr(skb);
> +	len = le32_to_cpu(hdr->len);
>  
>  	spin_lock_bh(&vvs->rx_lock);
>  
> -	can_enqueue = virtio_transport_inc_rx_pkt(vvs, pkt);
> +	can_enqueue = virtio_transport_inc_rx_pkt(vvs, skb);
>  	if (!can_enqueue) {
>  		free_pkt = true;
>  		goto out;
>  	}
>  
> -	if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM)
> +	if (le32_to_cpu(hdr->flags) & VIRTIO_VSOCK_SEQ_EOM)
>  		vvs->msg_count++;
>  
>  	/* Try to copy small packets into the buffer of last packet queued,
>  	 * to avoid wasting memory queueing the entire buffer with a small
>  	 * payload.
>  	 */
> -	if (pkt->len <= GOOD_COPY_LEN && !list_empty(&vvs->rx_queue)) {
> -		struct virtio_vsock_pkt *last_pkt;
> +	if (len <= GOOD_COPY_LEN && !skb_queue_empty_lockless(&vvs->rx_queue)) {
> +		struct virtio_vsock_hdr *last_hdr;
> +		struct sk_buff *last_skb;
>  
> -		last_pkt = list_last_entry(&vvs->rx_queue,
> -					   struct virtio_vsock_pkt, list);
> +		last_skb = skb_peek_tail(&vvs->rx_queue);
> +		last_hdr = virtio_vsock_hdr(last_skb);
>  
>  		/* If there is space in the last packet queued, we copy the
>  		 * new packet in its buffer. We avoid this if the last packet
> @@ -1052,35 +1009,34 @@ virtio_transport_recv_enqueue(struct vsock_sock *vsk,
>  		 * delimiter of SEQPACKET message, so 'pkt' is the first packet
>  		 * of a new message.
>  		 */
> -		if ((pkt->len <= last_pkt->buf_len - last_pkt->len) &&
> -		    !(le32_to_cpu(last_pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM)) {
> -			memcpy(last_pkt->buf + last_pkt->len, pkt->buf,
> -			       pkt->len);
> -			last_pkt->len += pkt->len;
> +		if (skb->len < skb_tailroom(last_skb) &&
> +		    !(le32_to_cpu(last_hdr->flags) & VIRTIO_VSOCK_SEQ_EOM)) {
> +			memcpy(skb_put(last_skb, skb->len), skb->data, skb->len);
>  			free_pkt = true;
> -			last_pkt->hdr.flags |= pkt->hdr.flags;
> +			last_hdr->flags |= hdr->flags;
>  			goto out;
>  		}
>  	}
>  
> -	list_add_tail(&pkt->list, &vvs->rx_queue);
> +	__skb_queue_tail(&vvs->rx_queue, skb);
>  
>  out:
>  	spin_unlock_bh(&vvs->rx_lock);
>  	if (free_pkt)
> -		virtio_transport_free_pkt(pkt);
> +		virtio_vsock_kfree_skb(skb);
>  }
>  
>  static int
>  virtio_transport_recv_connected(struct sock *sk,
> -				struct virtio_vsock_pkt *pkt)
> +				struct sk_buff *skb)
>  {
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  	struct vsock_sock *vsk = vsock_sk(sk);
>  	int err = 0;
>  
> -	switch (le16_to_cpu(pkt->hdr.op)) {
> +	switch (le16_to_cpu(hdr->op)) {
>  	case VIRTIO_VSOCK_OP_RW:
> -		virtio_transport_recv_enqueue(vsk, pkt);
> +		virtio_transport_recv_enqueue(vsk, skb);
>  		vsock_data_ready(sk);
>  		return err;
>  	case VIRTIO_VSOCK_OP_CREDIT_REQUEST:
> @@ -1090,18 +1046,17 @@ virtio_transport_recv_connected(struct sock *sk,
>  		sk->sk_write_space(sk);
>  		break;
>  	case VIRTIO_VSOCK_OP_SHUTDOWN:
> -		if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SHUTDOWN_RCV)
> +		if (le32_to_cpu(hdr->flags) & VIRTIO_VSOCK_SHUTDOWN_RCV)
>  			vsk->peer_shutdown |= RCV_SHUTDOWN;
> -		if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SHUTDOWN_SEND)
> +		if (le32_to_cpu(hdr->flags) & VIRTIO_VSOCK_SHUTDOWN_SEND)
>  			vsk->peer_shutdown |= SEND_SHUTDOWN;
>  		if (vsk->peer_shutdown == SHUTDOWN_MASK &&
>  		    vsock_stream_has_data(vsk) <= 0 &&
>  		    !sock_flag(sk, SOCK_DONE)) {
>  			(void)virtio_transport_reset(vsk, NULL);
> -
>  			virtio_transport_do_close(vsk, true);
>  		}
> -		if (le32_to_cpu(pkt->hdr.flags))
> +		if (le32_to_cpu(virtio_vsock_hdr(skb)->flags))
>  			sk->sk_state_change(sk);
>  		break;
>  	case VIRTIO_VSOCK_OP_RST:
> @@ -1112,28 +1067,30 @@ virtio_transport_recv_connected(struct sock *sk,
>  		break;
>  	}
>  
> -	virtio_transport_free_pkt(pkt);
> +	virtio_vsock_kfree_skb(skb);
>  	return err;
>  }
>  
>  static void
>  virtio_transport_recv_disconnecting(struct sock *sk,
> -				    struct virtio_vsock_pkt *pkt)
> +				    struct sk_buff *skb)
>  {
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  	struct vsock_sock *vsk = vsock_sk(sk);
>  
> -	if (le16_to_cpu(pkt->hdr.op) == VIRTIO_VSOCK_OP_RST)
> +	if (le16_to_cpu(hdr->op) == VIRTIO_VSOCK_OP_RST)
>  		virtio_transport_do_close(vsk, true);
>  }
>  
>  static int
>  virtio_transport_send_response(struct vsock_sock *vsk,
> -			       struct virtio_vsock_pkt *pkt)
> +			       struct sk_buff *skb)
>  {
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  	struct virtio_vsock_pkt_info info = {
>  		.op = VIRTIO_VSOCK_OP_RESPONSE,
> -		.remote_cid = le64_to_cpu(pkt->hdr.src_cid),
> -		.remote_port = le32_to_cpu(pkt->hdr.src_port),
> +		.remote_cid = le64_to_cpu(hdr->src_cid),
> +		.remote_port = le32_to_cpu(hdr->src_port),
>  		.reply = true,
>  		.vsk = vsk,
>  	};
> @@ -1142,8 +1099,9 @@ virtio_transport_send_response(struct vsock_sock *vsk,
>  }
>  
>  static bool virtio_transport_space_update(struct sock *sk,
> -					  struct virtio_vsock_pkt *pkt)
> +					  struct sk_buff *skb)
>  {
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  	struct vsock_sock *vsk = vsock_sk(sk);
>  	struct virtio_vsock_sock *vvs = vsk->trans;
>  	bool space_available;
> @@ -1158,8 +1116,8 @@ static bool virtio_transport_space_update(struct sock *sk,
>  
>  	/* buf_alloc and fwd_cnt is always included in the hdr */
>  	spin_lock_bh(&vvs->tx_lock);
> -	vvs->peer_buf_alloc = le32_to_cpu(pkt->hdr.buf_alloc);
> -	vvs->peer_fwd_cnt = le32_to_cpu(pkt->hdr.fwd_cnt);
> +	vvs->peer_buf_alloc = le32_to_cpu(hdr->buf_alloc);
> +	vvs->peer_fwd_cnt = le32_to_cpu(hdr->fwd_cnt);
>  	space_available = virtio_transport_has_space(vsk);
>  	spin_unlock_bh(&vvs->tx_lock);
>  	return space_available;
> @@ -1167,27 +1125,28 @@ static bool virtio_transport_space_update(struct sock *sk,
>  
>  /* Handle server socket */
>  static int
> -virtio_transport_recv_listen(struct sock *sk, struct virtio_vsock_pkt *pkt,
> +virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
>  			     struct virtio_transport *t)
>  {
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  	struct vsock_sock *vsk = vsock_sk(sk);
>  	struct vsock_sock *vchild;
>  	struct sock *child;
>  	int ret;
>  
> -	if (le16_to_cpu(pkt->hdr.op) != VIRTIO_VSOCK_OP_REQUEST) {
> -		virtio_transport_reset_no_sock(t, pkt);
> +	if (le16_to_cpu(hdr->op) != VIRTIO_VSOCK_OP_REQUEST) {
> +		virtio_transport_reset_no_sock(t, skb);
>  		return -EINVAL;
>  	}
>  
>  	if (sk_acceptq_is_full(sk)) {
> -		virtio_transport_reset_no_sock(t, pkt);
> +		virtio_transport_reset_no_sock(t, skb);
>  		return -ENOMEM;
>  	}
>  
>  	child = vsock_create_connected(sk);
>  	if (!child) {
> -		virtio_transport_reset_no_sock(t, pkt);
> +		virtio_transport_reset_no_sock(t, skb);
>  		return -ENOMEM;
>  	}
>  
> @@ -1198,10 +1157,10 @@ virtio_transport_recv_listen(struct sock *sk, struct virtio_vsock_pkt *pkt,
>  	child->sk_state = TCP_ESTABLISHED;
>  
>  	vchild = vsock_sk(child);
> -	vsock_addr_init(&vchild->local_addr, le64_to_cpu(pkt->hdr.dst_cid),
> -			le32_to_cpu(pkt->hdr.dst_port));
> -	vsock_addr_init(&vchild->remote_addr, le64_to_cpu(pkt->hdr.src_cid),
> -			le32_to_cpu(pkt->hdr.src_port));
> +	vsock_addr_init(&vchild->local_addr, le64_to_cpu(hdr->dst_cid),
> +			le32_to_cpu(hdr->dst_port));
> +	vsock_addr_init(&vchild->remote_addr, le64_to_cpu(hdr->src_cid),
> +			le32_to_cpu(hdr->src_port));
>  
>  	ret = vsock_assign_transport(vchild, vsk);
>  	/* Transport assigned (looking at remote_addr) must be the same
> @@ -1209,17 +1168,17 @@ virtio_transport_recv_listen(struct sock *sk, struct virtio_vsock_pkt *pkt,
>  	 */
>  	if (ret || vchild->transport != &t->transport) {
>  		release_sock(child);
> -		virtio_transport_reset_no_sock(t, pkt);
> +		virtio_transport_reset_no_sock(t, skb);
>  		sock_put(child);
>  		return ret;
>  	}
>  
> -	if (virtio_transport_space_update(child, pkt))
> +	if (virtio_transport_space_update(child, skb))
>  		child->sk_write_space(child);
>  
>  	vsock_insert_connected(vchild);
>  	vsock_enqueue_accept(sk, child);
> -	virtio_transport_send_response(vchild, pkt);
> +	virtio_transport_send_response(vchild, skb);
>  
>  	release_sock(child);
>  
> @@ -1237,29 +1196,30 @@ static bool virtio_transport_valid_type(u16 type)
>   * lock.
>   */
>  void virtio_transport_recv_pkt(struct virtio_transport *t,
> -			       struct virtio_vsock_pkt *pkt)
> +			       struct sk_buff *skb)
>  {
> +	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>  	struct sockaddr_vm src, dst;
>  	struct vsock_sock *vsk;
>  	struct sock *sk;
>  	bool space_available;
>  
> -	vsock_addr_init(&src, le64_to_cpu(pkt->hdr.src_cid),
> -			le32_to_cpu(pkt->hdr.src_port));
> -	vsock_addr_init(&dst, le64_to_cpu(pkt->hdr.dst_cid),
> -			le32_to_cpu(pkt->hdr.dst_port));
> +	vsock_addr_init(&src, le64_to_cpu(hdr->src_cid),
> +			le32_to_cpu(hdr->src_port));
> +	vsock_addr_init(&dst, le64_to_cpu(hdr->dst_cid),
> +			le32_to_cpu(hdr->dst_port));
>  
>  	trace_virtio_transport_recv_pkt(src.svm_cid, src.svm_port,
>  					dst.svm_cid, dst.svm_port,
> -					le32_to_cpu(pkt->hdr.len),
> -					le16_to_cpu(pkt->hdr.type),
> -					le16_to_cpu(pkt->hdr.op),
> -					le32_to_cpu(pkt->hdr.flags),
> -					le32_to_cpu(pkt->hdr.buf_alloc),
> -					le32_to_cpu(pkt->hdr.fwd_cnt));
> -
> -	if (!virtio_transport_valid_type(le16_to_cpu(pkt->hdr.type))) {
> -		(void)virtio_transport_reset_no_sock(t, pkt);
> +					le32_to_cpu(hdr->len),
> +					le16_to_cpu(hdr->type),
> +					le16_to_cpu(hdr->op),
> +					le32_to_cpu(hdr->flags),
> +					le32_to_cpu(hdr->buf_alloc),
> +					le32_to_cpu(hdr->fwd_cnt));
> +
> +	if (!virtio_transport_valid_type(le16_to_cpu(hdr->type))) {
> +		(void)virtio_transport_reset_no_sock(t, skb);
>  		goto free_pkt;
>  	}
>  
> @@ -1270,13 +1230,13 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
>  	if (!sk) {
>  		sk = vsock_find_bound_socket(&dst);
>  		if (!sk) {
> -			(void)virtio_transport_reset_no_sock(t, pkt);
> +			(void)virtio_transport_reset_no_sock(t, skb);
>  			goto free_pkt;
>  		}
>  	}
>  
> -	if (virtio_transport_get_type(sk) != le16_to_cpu(pkt->hdr.type)) {
> -		(void)virtio_transport_reset_no_sock(t, pkt);
> +	if (virtio_transport_get_type(sk) != le16_to_cpu(hdr->type)) {
> +		(void)virtio_transport_reset_no_sock(t, skb);
>  		sock_put(sk);
>  		goto free_pkt;
>  	}
> @@ -1287,13 +1247,13 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
>  
>  	/* Check if sk has been closed before lock_sock */
>  	if (sock_flag(sk, SOCK_DONE)) {
> -		(void)virtio_transport_reset_no_sock(t, pkt);
> +		(void)virtio_transport_reset_no_sock(t, skb);
>  		release_sock(sk);
>  		sock_put(sk);
>  		goto free_pkt;
>  	}
>  
> -	space_available = virtio_transport_space_update(sk, pkt);
> +	space_available = virtio_transport_space_update(sk, skb);
>  
>  	/* Update CID in case it has changed after a transport reset event */
>  	if (vsk->local_addr.svm_cid != VMADDR_CID_ANY)
> @@ -1304,23 +1264,23 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
>  
>  	switch (sk->sk_state) {
>  	case TCP_LISTEN:
> -		virtio_transport_recv_listen(sk, pkt, t);
> -		virtio_transport_free_pkt(pkt);
> +		virtio_transport_recv_listen(sk, skb, t);
> +		virtio_vsock_kfree_skb(skb);
>  		break;
>  	case TCP_SYN_SENT:
> -		virtio_transport_recv_connecting(sk, pkt);
> -		virtio_transport_free_pkt(pkt);
> +		virtio_transport_recv_connecting(sk, skb);
> +		virtio_vsock_kfree_skb(skb);
>  		break;
>  	case TCP_ESTABLISHED:
> -		virtio_transport_recv_connected(sk, pkt);
> +		virtio_transport_recv_connected(sk, skb);
>  		break;
>  	case TCP_CLOSING:
> -		virtio_transport_recv_disconnecting(sk, pkt);
> -		virtio_transport_free_pkt(pkt);
> +		virtio_transport_recv_disconnecting(sk, skb);
> +		virtio_vsock_kfree_skb(skb);
>  		break;
>  	default:
> -		(void)virtio_transport_reset_no_sock(t, pkt);
> -		virtio_transport_free_pkt(pkt);
> +		(void)virtio_transport_reset_no_sock(t, skb);
> +		virtio_vsock_kfree_skb(skb);
>  		break;
>  	}
>  
> @@ -1333,16 +1293,42 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
>  	return;
>  
>  free_pkt:
> -	virtio_transport_free_pkt(pkt);
> +	virtio_vsock_kfree_skb(skb);
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_recv_pkt);
>  
> -void virtio_transport_free_pkt(struct virtio_vsock_pkt *pkt)
> +/* Remove skbs found in a queue that have a vsk that matches.
> + *
> + * Each skb is freed.
> + *
> + * Returns the count of skbs that were reply packets.
> + */
> +int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *queue)
>  {
> -	kvfree(pkt->buf);
> -	kfree(pkt);
> +	struct sk_buff_head freeme;
> +	struct sk_buff *skb, *tmp;
> +	int cnt = 0;
> +
> +	skb_queue_head_init(&freeme);
> +
> +	spin_lock(&queue->lock);
> +	skb_queue_walk_safe(queue, skb, tmp) {
> +		if (vsock_sk(skb->sk) != vsk)
> +			continue;
> +
> +		__skb_unlink(skb, queue);
> +		skb_queue_tail(&freeme, skb);
> +
> +		if (virtio_vsock_skb_reply(skb))
> +			cnt++;
> +	}
> +	spin_unlock(&queue->lock);
> +
> +	virtio_vsock_skb_queue_purge(&freeme);
> +
> +	return cnt;
>  }
> -EXPORT_SYMBOL_GPL(virtio_transport_free_pkt);
> +EXPORT_SYMBOL_GPL(virtio_transport_purge_skbs);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Asias He");
> diff --git a/net/vmw_vsock/vsock_loopback.c b/net/vmw_vsock/vsock_loopback.c
> index 169a8cf65b39..e57394579146 100644
> --- a/net/vmw_vsock/vsock_loopback.c
> +++ b/net/vmw_vsock/vsock_loopback.c
> @@ -16,7 +16,7 @@ struct vsock_loopback {
>  	struct workqueue_struct *workqueue;
>  
>  	spinlock_t pkt_list_lock; /* protects pkt_list */
> -	struct list_head pkt_list;
> +	struct sk_buff_head pkt_queue;
>  	struct work_struct pkt_work;
>  };
>  
> @@ -27,13 +27,13 @@ static u32 vsock_loopback_get_local_cid(void)
>  	return VMADDR_CID_LOCAL;
>  }
>  
> -static int vsock_loopback_send_pkt(struct virtio_vsock_pkt *pkt)
> +static int vsock_loopback_send_pkt(struct sk_buff *skb)
>  {
>  	struct vsock_loopback *vsock = &the_vsock_loopback;
> -	int len = pkt->len;
> +	int len = skb->len;
>  
>  	spin_lock_bh(&vsock->pkt_list_lock);
> -	list_add_tail(&pkt->list, &vsock->pkt_list);
> +	skb_queue_tail(&vsock->pkt_queue, skb);
>  	spin_unlock_bh(&vsock->pkt_list_lock);
>  
>  	queue_work(vsock->workqueue, &vsock->pkt_work);
> @@ -44,21 +44,8 @@ static int vsock_loopback_send_pkt(struct virtio_vsock_pkt *pkt)
>  static int vsock_loopback_cancel_pkt(struct vsock_sock *vsk)
>  {
>  	struct vsock_loopback *vsock = &the_vsock_loopback;
> -	struct virtio_vsock_pkt *pkt, *n;
> -	LIST_HEAD(freeme);
>  
> -	spin_lock_bh(&vsock->pkt_list_lock);
> -	list_for_each_entry_safe(pkt, n, &vsock->pkt_list, list) {
> -		if (pkt->vsk != vsk)
> -			continue;
> -		list_move(&pkt->list, &freeme);
> -	}
> -	spin_unlock_bh(&vsock->pkt_list_lock);
> -
> -	list_for_each_entry_safe(pkt, n, &freeme, list) {
> -		list_del(&pkt->list);
> -		virtio_transport_free_pkt(pkt);
> -	}
> +	virtio_transport_purge_skbs(vsk, &vsock->pkt_queue);
>  
>  	return 0;
>  }
> @@ -121,20 +108,18 @@ static void vsock_loopback_work(struct work_struct *work)
>  {
>  	struct vsock_loopback *vsock =
>  		container_of(work, struct vsock_loopback, pkt_work);
> -	LIST_HEAD(pkts);
> +	struct sk_buff_head pkts;
> +	struct sk_buff *skb;
> +
> +	skb_queue_head_init(&pkts);
>  
>  	spin_lock_bh(&vsock->pkt_list_lock);
> -	list_splice_init(&vsock->pkt_list, &pkts);
> +	skb_queue_splice_init(&vsock->pkt_queue, &pkts);
>  	spin_unlock_bh(&vsock->pkt_list_lock);
>  
> -	while (!list_empty(&pkts)) {
> -		struct virtio_vsock_pkt *pkt;
> -
> -		pkt = list_first_entry(&pkts, struct virtio_vsock_pkt, list);
> -		list_del_init(&pkt->list);
> -
> -		virtio_transport_deliver_tap_pkt(pkt);
> -		virtio_transport_recv_pkt(&loopback_transport, pkt);
> +	while ((skb = skb_dequeue(&pkts))) {
> +		virtio_transport_deliver_tap_pkt(skb);
> +		virtio_transport_recv_pkt(&loopback_transport, skb);
>  	}
>  }
>  
> @@ -148,7 +133,7 @@ static int __init vsock_loopback_init(void)
>  		return -ENOMEM;
>  
>  	spin_lock_init(&vsock->pkt_list_lock);
> -	INIT_LIST_HEAD(&vsock->pkt_list);
> +	skb_queue_head_init(&vsock->pkt_queue);
>  	INIT_WORK(&vsock->pkt_work, vsock_loopback_work);
>  
>  	ret = vsock_core_register(&loopback_transport.transport,
> @@ -166,19 +151,13 @@ static int __init vsock_loopback_init(void)
>  static void __exit vsock_loopback_exit(void)
>  {
>  	struct vsock_loopback *vsock = &the_vsock_loopback;
> -	struct virtio_vsock_pkt *pkt;
>  
>  	vsock_core_unregister(&loopback_transport.transport);
>  
>  	flush_work(&vsock->pkt_work);
>  
>  	spin_lock_bh(&vsock->pkt_list_lock);
> -	while (!list_empty(&vsock->pkt_list)) {
> -		pkt = list_first_entry(&vsock->pkt_list,
> -				       struct virtio_vsock_pkt, list);
> -		list_del(&pkt->list);
> -		virtio_transport_free_pkt(pkt);
> -	}
> +	virtio_vsock_skb_queue_purge(&vsock->pkt_queue);
>  	spin_unlock_bh(&vsock->pkt_list_lock);
>  
>  	destroy_workqueue(vsock->workqueue);
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
