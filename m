Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8550964D7FB
	for <lists.virtualization@lfdr.de>; Thu, 15 Dec 2022 09:48:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3DF9418BA;
	Thu, 15 Dec 2022 08:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3DF9418BA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XNpMTDCp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2u8d4n8gpzQ; Thu, 15 Dec 2022 08:48:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 168814189A;
	Thu, 15 Dec 2022 08:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 168814189A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46D9AC0078;
	Thu, 15 Dec 2022 08:48:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF7D9C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Dec 2022 08:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACF2F60AAA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Dec 2022 08:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF2F60AAA
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XNpMTDCp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIuwHrE9dE_F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Dec 2022 08:48:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D0B60A9B
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2D0B60A9B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Dec 2022 08:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671094084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vPYq3xaTcRrGA5H3fD5XE2s5UjQ66B/GUTj/UoI/FpM=;
 b=XNpMTDCp58DdVVpJ6vCSyeX8wheKVcODE4DJGOK1jItGnBnrbPYgaqnJXjnnjTGaJOGgI3
 OqqYdDDtTnjdtNK79GndEFBcD3MhyJTMTCnBPptHYNgmIyaBH53aD+td/Mtq2QoEHT8dt1
 5ejQw6sFIhv5kMj6M3Bn+YXhvhr5Awg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-evC8nukXMXOzqrf7UZHOyQ-1; Thu, 15 Dec 2022 03:48:03 -0500
X-MC-Unique: evC8nukXMXOzqrf7UZHOyQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 w20-20020a056402269400b004700a51c202so7102352edd.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Dec 2022 00:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPYq3xaTcRrGA5H3fD5XE2s5UjQ66B/GUTj/UoI/FpM=;
 b=qEZVh32q9LceTsiHtlKPr56FpJ0B2Zzxv+rfznB0CDCIykXKkP1emi2rlAUXlfbFah
 MskD78Rzi/gf5MFDM+LqpqG7vWSA6ZS26INtjJw2iSKqlX/fJFvMb0gb/jLX+lsdAzbT
 4KAvcmE/Y1Dm+HbyZ3TO/F/AczWaGNtw7hfgQHhGbudXq0JbRdtk2tu3Lx21U1jjFnPG
 gsAl3CbQ48OapysTlRddsUYw715qhO2Ek0EDNZzUdzUl5VWYWYeuG3KGewDGVDsp9WPP
 l9iETZcSf5yTWL2HJnj3EZS6N/Fa1yoJCCzdnLWuZk0z+zJUhE3nBkgWlH1wurhvfZVt
 MGaQ==
X-Gm-Message-State: ANoB5pli6NAkbIS5wZQF2WZTtLIMh4Ekl6fn3r+L9pnCUbxpsA7wE0th
 omIJOZVqAZnlpSd/k9xjL7sBY6HOo4i7fvlThzw0YDx6DlaiQ5fZdJUKIw8JuiRJ4djE/ne6mO8
 GdXYv7DvpNur4Kp42MdkJLG/xDwEXyBMWUuiRiB4nkw==
X-Received: by 2002:a17:906:37cd:b0:7c0:a36d:115b with SMTP id
 o13-20020a17090637cd00b007c0a36d115bmr24488108ejc.14.1671094081986; 
 Thu, 15 Dec 2022 00:48:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf503ey+/mMta2+c/4hqTGb1R/Vm13ytl/EGq9VoKAaBzgKE2DbSQFdo/v+vWSFR2CX0sDEulw==
X-Received: by 2002:a17:906:37cd:b0:7c0:a36d:115b with SMTP id
 o13-20020a17090637cd00b007c0a36d115bmr24488091ejc.14.1671094081689; 
 Thu, 15 Dec 2022 00:48:01 -0800 (PST)
Received: from sgarzare-redhat (host-87-11-6-51.retail.telecomitalia.it.
 [87.11.6.51]) by smtp.gmail.com with ESMTPSA id
 qu27-20020a170907111b00b007c0d41736c0sm6804799ejb.39.2022.12.15.00.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 00:48:01 -0800 (PST)
Date: Thu, 15 Dec 2022 09:47:57 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Subject: Re: [PATCH net-next v8] virtio/vsock: replace virtio_vsock_pkt with
 sk_buff
Message-ID: <20221215084757.6bpkciaovrnsxoiu@sgarzare-redhat>
References: <20221215043645.3545127-1-bobby.eshleman@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20221215043645.3545127-1-bobby.eshleman@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Cong Wang <cong.wang@bytedance.com>, Krasnov Arseniy <oxffffaa@gmail.com>,
 Jiang Wang <jiang.wang@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, kvm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Dec 15, 2022 at 04:36:44AM +0000, Bobby Eshleman wrote:
>This commit changes virtio/vsock to use sk_buff instead of
>virtio_vsock_pkt. Beyond better conforming to other net code, using
>sk_buff allows vsock to use sk_buff-dependent features in the future
>(such as sockmap) and improves throughput.
>
>This patch introduces the following performance changes:
>
>Tool/Config: uperf w/ 64 threads, SOCK_STREAM
>Test Runs: 5, mean of results
>Before: commit 95ec6bce2a0b ("Merge branch 'net-ipa-more-endpoints'")
>
>Test: 64KB, g2h
>Before: 21.63 Gb/s
>After: 25.59 Gb/s (+18%)
>
>Test: 16B, g2h
>Before: 11.86 Mb/s
>After: 17.41 Mb/s (+46%)
>
>Test: 64KB, h2g
>Before: 2.15 Gb/s
>After: 3.6 Gb/s (+67%)
>
>Test: 16B, h2g
>Before: 14.38 Mb/s
>After: 18.43 Mb/s (+28%)
>
>Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
>---
>
>Testing: passed vsock_test h2g and g2h
>Note2: net-next is closed, but sending out now in case more comments
>roll in, as discussed here:
>https://lore.kernel.org/all/Y34SoH1nFTXXLWbK@bullseye/
>
>Changes in v8:
>- vhost/vsock: remove unused enum
>- vhost/vsock: use spin_lock_bh() instead of spin_lock()
>- vsock/loopback: use __skb_dequeue instead of skb_dequeue
>
>Changes in v7:
>- use skb_queue_empty() instead of skb_queue_empty_lockless()
>
>Changes in v6:
>- use skb->cb instead of skb->_skb_refdst
>- use lock-free __skb_queue_purge for rx_queue when rx_lock held
>
>Changes in v5:
>- last_skb instead of skb: last_hdr->len = cpu_to_le32(last_skb->len)
>
>Changes in v4:
>- vdso/bits.h -> linux/bits.h
>- add virtio_vsock_alloc_skb() helper
>- virtio/vsock: rename buf_len -> total_len
>- update last_hdr->len
>- fix build_skb() for vsockmon (tested)
>- add queue helpers
>- use spin_{unlock/lock}_bh() instead of spin_lock()/spin_unlock()
>- note: I only ran a few g2h tests to check that this change
>  had no perf impact. The above data is still from patch
>  v3.
>
>Changes in v3:
>- fix seqpacket bug
>- use zero in vhost_add_used(..., 0) device doesn't write to buffer
>- use xmas tree style declarations
>- vsock_hdr() -> virtio_vsock_hdr() and other include file style fixes
>- no skb merging
>- save space by not using vsock_metadata
>- use _skb_refdst instead of skb buffer space for flags
>- use skb_pull() to keep track of read bytes instead of using an an
>  extra variable 'off' in the skb buffer space
>- remove unnecessary sk_allocation assignment
>- do not zero hdr needlessly
>- introduce virtio_transport_skb_len() because skb->len changes now
>- use spin_lock() directly on queue lock instead of sk_buff_head helpers
>  which use spin_lock_irqsave() (e.g., skb_dequeue)
>- do not reduce buffer size to be page size divisible
>- Note: the biggest performance change came from loosening the spinlock
>  variation and not reducing the buffer size.
>
>Changes in v2:
>- Use alloc_skb() directly instead of sock_alloc_send_pskb() to minimize
>  uAPI changes.
>- Do not marshal errors to -ENOMEM for non-virtio implementations.
>- No longer a part of the original series
>- Some code cleanup and refactoring
>- Include performance stats
>
> drivers/vhost/vsock.c                   | 213 +++++-------
> include/linux/virtio_vsock.h            | 126 +++++--
> net/vmw_vsock/virtio_transport.c        | 149 +++------
> net/vmw_vsock/virtio_transport_common.c | 422 +++++++++++++-----------
> net/vmw_vsock/vsock_loopback.c          |  51 +--
> 5 files changed, 495 insertions(+), 466 deletions(-)
>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index 5703775af129..ee0a00432cb1 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -51,8 +51,7 @@ struct vhost_vsock {
> 	struct hlist_node hash;
>
> 	struct vhost_work send_pkt_work;
>-	spinlock_t send_pkt_list_lock;
>-	struct list_head send_pkt_list;	/* host->guest pending packets */
>+	struct sk_buff_head send_pkt_queue; /* host->guest pending packets */
>
> 	atomic_t queued_replies;
>
>@@ -108,40 +107,33 @@ vhost_transport_do_send_pkt(struct vhost_vsock 
>*vsock,
> 	vhost_disable_notify(&vsock->dev, vq);
>
> 	do {
>-		struct virtio_vsock_pkt *pkt;
>+		struct virtio_vsock_hdr *hdr;
>+		size_t iov_len, payload_len;
> 		struct iov_iter iov_iter;
>+		u32 flags_to_restore = 0;
>+		struct sk_buff *skb;
> 		unsigned out, in;
> 		size_t nbytes;
>-		size_t iov_len, payload_len;
> 		int head;
>-		u32 flags_to_restore = 0;
>
>-		spin_lock_bh(&vsock->send_pkt_list_lock);
>-		if (list_empty(&vsock->send_pkt_list)) {
>-			spin_unlock_bh(&vsock->send_pkt_list_lock);
>+		spin_lock_bh(&vsock->send_pkt_queue.lock);
>+		skb = __skb_dequeue(&vsock->send_pkt_queue);
>+		spin_unlock_bh(&vsock->send_pkt_queue.lock);

Sorry for coming late, but I just commented in Paolo's reply.
Here I think we can directly use the new virtio_vsock_skb_dequeue().

With that fixed, you can put my R-b:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Below I left a little comment.

>+
>+		if (!skb) {
> 			vhost_enable_notify(&vsock->dev, vq);
> 			break;
> 		}
>
>-		pkt = list_first_entry(&vsock->send_pkt_list,
>-				       struct virtio_vsock_pkt, list);
>-		list_del_init(&pkt->list);
>-		spin_unlock_bh(&vsock->send_pkt_list_lock);
>-
> 		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
> 					 &out, &in, NULL, NULL);
> 		if (head < 0) {
>-			spin_lock_bh(&vsock->send_pkt_list_lock);
>-			list_add(&pkt->list, &vsock->send_pkt_list);
>-			spin_unlock_bh(&vsock->send_pkt_list_lock);
>+			virtio_vsock_skb_queue_head(&vsock->send_pkt_queue, skb);
> 			break;
> 		}
>
> 		if (head == vq->num) {
>-			spin_lock_bh(&vsock->send_pkt_list_lock);
>-			list_add(&pkt->list, &vsock->send_pkt_list);
>-			spin_unlock_bh(&vsock->send_pkt_list_lock);
>-
>+			virtio_vsock_skb_queue_head(&vsock->send_pkt_queue, skb);
> 			/* We cannot finish yet if more buffers snuck in while
> 			 * re-enabling notify.
> 			 */
>@@ -153,26 +145,27 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		}
>
> 		if (out) {
>-			virtio_transport_free_pkt(pkt);
>+			kfree_skb(skb);
> 			vq_err(vq, "Expected 0 output buffers, got %u\n", out);
> 			break;
> 		}
>
> 		iov_len = iov_length(&vq->iov[out], in);
>-		if (iov_len < sizeof(pkt->hdr)) {
>-			virtio_transport_free_pkt(pkt);
>+		if (iov_len < sizeof(*hdr)) {
>+			kfree_skb(skb);
> 			vq_err(vq, "Buffer len [%zu] too small\n", iov_len);
> 			break;
> 		}
>
> 		iov_iter_init(&iov_iter, READ, &vq->iov[out], in, iov_len);
>-		payload_len = pkt->len - pkt->off;
>+		payload_len = skb->len;
>+		hdr = virtio_vsock_hdr(skb);
>
> 		/* If the packet is greater than the space available in the
> 		 * buffer, we split it using multiple buffers.
> 		 */
>-		if (payload_len > iov_len - sizeof(pkt->hdr)) {
>-			payload_len = iov_len - sizeof(pkt->hdr);
>+		if (payload_len > iov_len - sizeof(*hdr)) {
>+			payload_len = iov_len - sizeof(*hdr);
>
> 			/* As we are copying pieces of large packet's buffer to
> 			 * small rx buffers, headers of packets in rx queue are
>@@ -185,31 +178,30 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 			 * bits set. After initialized header will be copied to
> 			 * rx buffer, these required bits will be restored.
> 			 */
>-			if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOM) {
>-				pkt->hdr.flags &= ~cpu_to_le32(VIRTIO_VSOCK_SEQ_EOM);
>+			if (le32_to_cpu(hdr->flags) & VIRTIO_VSOCK_SEQ_EOM) {
>+				hdr->flags &= ~cpu_to_le32(VIRTIO_VSOCK_SEQ_EOM);
> 				flags_to_restore |= VIRTIO_VSOCK_SEQ_EOM;
>
>-				if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOR) {
>-					pkt->hdr.flags &= ~cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
>+				if (le32_to_cpu(hdr->flags) & VIRTIO_VSOCK_SEQ_EOR) {
>+					hdr->flags &= ~cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
> 					flags_to_restore |= VIRTIO_VSOCK_SEQ_EOR;
> 				}
> 			}
> 		}
>
> 		/* Set the correct length in the header */
>-		pkt->hdr.len = cpu_to_le32(payload_len);
>+		hdr->len = cpu_to_le32(payload_len);
>
>-		nbytes = copy_to_iter(&pkt->hdr, sizeof(pkt->hdr), &iov_iter);
>-		if (nbytes != sizeof(pkt->hdr)) {
>-			virtio_transport_free_pkt(pkt);
>+		nbytes = copy_to_iter(hdr, sizeof(*hdr), &iov_iter);
>+		if (nbytes != sizeof(*hdr)) {
>+			kfree_skb(skb);
> 			vq_err(vq, "Faulted on copying pkt hdr\n");
> 			break;
> 		}
>
>-		nbytes = copy_to_iter(pkt->buf + pkt->off, payload_len,
>-				      &iov_iter);
>+		nbytes = copy_to_iter(skb->data, payload_len, &iov_iter);
> 		if (nbytes != payload_len) {
>-			virtio_transport_free_pkt(pkt);
>+			kfree_skb(skb);
> 			vq_err(vq, "Faulted on copying pkt buf\n");
> 			break;
> 		}
>@@ -217,31 +209,28 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		/* Deliver to monitoring devices all packets that we
> 		 * will transmit.
> 		 */
>-		virtio_transport_deliver_tap_pkt(pkt);
>+		virtio_transport_deliver_tap_pkt(skb);
>
>-		vhost_add_used(vq, head, sizeof(pkt->hdr) + payload_len);
>+		vhost_add_used(vq, head, sizeof(*hdr) + payload_len);
> 		added = true;
>
>-		pkt->off += payload_len;
>+		skb_pull(skb, payload_len);
> 		total_len += payload_len;
>
> 		/* If we didn't send all the payload we can requeue the packet
> 		 * to send it with the next available buffer.
> 		 */
>-		if (pkt->off < pkt->len) {
>-			pkt->hdr.flags |= cpu_to_le32(flags_to_restore);
>+		if (skb->len > 0) {
>+			hdr->flags |= cpu_to_le32(flags_to_restore);
>
>-			/* We are queueing the same virtio_vsock_pkt to handle
>+			/* We are queueing the same skb to handle
> 			 * the remaining bytes, and we want to deliver it
> 			 * to monitoring devices in the next iteration.
> 			 */
>-			pkt->tap_delivered = false;
>-
>-			spin_lock_bh(&vsock->send_pkt_list_lock);
>-			list_add(&pkt->list, &vsock->send_pkt_list);
>-			spin_unlock_bh(&vsock->send_pkt_list_lock);
>+			virtio_vsock_skb_clear_tap_delivered(skb);
>+			virtio_vsock_skb_queue_head(&vsock->send_pkt_queue, skb);
> 		} else {
>-			if (pkt->reply) {
>+			if (virtio_vsock_skb_reply(skb)) {
> 				int val;
>
> 				val = atomic_dec_return(&vsock->queued_replies);
>@@ -253,7 +242,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 					restart_tx = true;
> 			}
>
>-			virtio_transport_free_pkt(pkt);
>+			consume_skb(skb);
> 		}
> 	} while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
> 	if (added)
>@@ -278,28 +267,26 @@ static void vhost_transport_send_pkt_work(struct vhost_work *work)
> }
>
> static int
>-vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
>+vhost_transport_send_pkt(struct sk_buff *skb)
> {
>+	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
> 	struct vhost_vsock *vsock;
>-	int len = pkt->len;
>+	int len = skb->len;
>
> 	rcu_read_lock();
>
> 	/* Find the vhost_vsock according to guest context id  */
>-	vsock = vhost_vsock_get(le64_to_cpu(pkt->hdr.dst_cid));
>+	vsock = vhost_vsock_get(le64_to_cpu(hdr->dst_cid));
> 	if (!vsock) {
> 		rcu_read_unlock();
>-		virtio_transport_free_pkt(pkt);
>+		kfree_skb(skb);
> 		return -ENODEV;
> 	}
>
>-	if (pkt->reply)
>+	if (virtio_vsock_skb_reply(skb))
> 		atomic_inc(&vsock->queued_replies);
>
>-	spin_lock_bh(&vsock->send_pkt_list_lock);
>-	list_add_tail(&pkt->list, &vsock->send_pkt_list);
>-	spin_unlock_bh(&vsock->send_pkt_list_lock);
>-
>+	virtio_vsock_skb_queue_tail(&vsock->send_pkt_queue, skb);
> 	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
>
> 	rcu_read_unlock();
>@@ -310,10 +297,8 @@ static int
> vhost_transport_cancel_pkt(struct vsock_sock *vsk)
> {
> 	struct vhost_vsock *vsock;
>-	struct virtio_vsock_pkt *pkt, *n;
> 	int cnt = 0;
> 	int ret = -ENODEV;
>-	LIST_HEAD(freeme);
>
> 	rcu_read_lock();
>
>@@ -322,20 +307,7 @@ vhost_transport_cancel_pkt(struct vsock_sock *vsk)
> 	if (!vsock)
> 		goto out;
>
>-	spin_lock_bh(&vsock->send_pkt_list_lock);
>-	list_for_each_entry_safe(pkt, n, &vsock->send_pkt_list, list) {
>-		if (pkt->vsk != vsk)
>-			continue;
>-		list_move(&pkt->list, &freeme);
>-	}
>-	spin_unlock_bh(&vsock->send_pkt_list_lock);
>-
>-	list_for_each_entry_safe(pkt, n, &freeme, list) {
>-		if (pkt->reply)
>-			cnt++;
>-		list_del(&pkt->list);
>-		virtio_transport_free_pkt(pkt);
>-	}
>+	cnt = virtio_transport_purge_skbs(vsk, &vsock->send_pkt_queue);
>
> 	if (cnt) {
> 		struct vhost_virtqueue *tx_vq = &vsock->vqs[VSOCK_VQ_TX];
>@@ -352,12 +324,14 @@ vhost_transport_cancel_pkt(struct vsock_sock *vsk)
> 	return ret;
> }
>
>-static struct virtio_vsock_pkt *
>-vhost_vsock_alloc_pkt(struct vhost_virtqueue *vq,
>+static struct sk_buff *
>+vhost_vsock_alloc_skb(struct vhost_virtqueue *vq,
> 		      unsigned int out, unsigned int in)
> {
>-	struct virtio_vsock_pkt *pkt;
>+	struct virtio_vsock_hdr *hdr;
> 	struct iov_iter iov_iter;
>+	struct sk_buff *skb;
>+	size_t payload_len;
> 	size_t nbytes;
> 	size_t len;
>
>@@ -366,50 +340,47 @@ vhost_vsock_alloc_pkt(struct vhost_virtqueue *vq,
> 		return NULL;
> 	}
>
>-	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
>-	if (!pkt)
>+	len = iov_length(vq->iov, out);
>+
>+	/* len contains both payload and hdr */
>+	skb = virtio_vsock_alloc_skb(len, GFP_KERNEL);
>+	if (!skb)
> 		return NULL;
>
>-	len = iov_length(vq->iov, out);
> 	iov_iter_init(&iov_iter, WRITE, vq->iov, out, len);
>
>-	nbytes = copy_from_iter(&pkt->hdr, sizeof(pkt->hdr), &iov_iter);
>-	if (nbytes != sizeof(pkt->hdr)) {
>+	hdr = virtio_vsock_hdr(skb);
>+	nbytes = copy_from_iter(hdr, sizeof(*hdr), &iov_iter);
>+	if (nbytes != sizeof(*hdr)) {
> 		vq_err(vq, "Expected %zu bytes for pkt->hdr, got %zu bytes\n",
>-		       sizeof(pkt->hdr), nbytes);
>-		kfree(pkt);
>+		       sizeof(*hdr), nbytes);
>+		kfree_skb(skb);
> 		return NULL;
> 	}
>
>-	pkt->len = le32_to_cpu(pkt->hdr.len);
>+	payload_len = le32_to_cpu(hdr->len);
>
> 	/* No payload */
>-	if (!pkt->len)
>-		return pkt;
>+	if (!payload_len)
>+		return skb;
>
> 	/* The pkt is too big */
>-	if (pkt->len > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE) {
>-		kfree(pkt);
>+	if (payload_len > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE) {
>+		kfree_skb(skb);
> 		return NULL;
> 	}
>
>-	pkt->buf = kvmalloc(pkt->len, GFP_KERNEL);
>-	if (!pkt->buf) {
>-		kfree(pkt);
>-		return NULL;
>-	}
>+	virtio_vsock_skb_rx_put(skb);
>
>-	pkt->buf_len = pkt->len;
>-
>-	nbytes = copy_from_iter(pkt->buf, pkt->len, &iov_iter);
>-	if (nbytes != pkt->len) {
>-		vq_err(vq, "Expected %u byte payload, got %zu bytes\n",
>-		       pkt->len, nbytes);
>-		virtio_transport_free_pkt(pkt);
>+	nbytes = copy_from_iter(skb->data, payload_len, &iov_iter);
>+	if (nbytes != payload_len) {
>+		vq_err(vq, "Expected %zu byte payload, got %zu bytes\n",
>+		       payload_len, nbytes);
>+		kfree_skb(skb);
> 		return NULL;
> 	}
>
>-	return pkt;
>+	return skb;
> }
>
> /* Is there space left for replies to rx packets? */
>@@ -496,9 +467,9 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> 						  poll.work);
> 	struct vhost_vsock *vsock = container_of(vq->dev, struct vhost_vsock,
> 						 dev);
>-	struct virtio_vsock_pkt *pkt;
> 	int head, pkts = 0, total_len = 0;
> 	unsigned int out, in;
>+	struct sk_buff *skb;
> 	bool added = false;
>
> 	mutex_lock(&vq->mutex);
>@@ -511,6 +482,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>
> 	vhost_disable_notify(&vsock->dev, vq);
> 	do {
>+		struct virtio_vsock_hdr *hdr;
>+
> 		if (!vhost_vsock_more_replies(vsock)) {
> 			/* Stop tx until the device processes already
> 			 * pending replies.  Leave tx virtqueue
>@@ -532,24 +505,26 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> 			break;
> 		}
>
>-		pkt = vhost_vsock_alloc_pkt(vq, out, in);
>-		if (!pkt) {
>+		skb = vhost_vsock_alloc_skb(vq, out, in);
>+		if (!skb) {
> 			vq_err(vq, "Faulted on pkt\n");
> 			continue;
> 		}
>
>-		total_len += sizeof(pkt->hdr) + pkt->len;
>+		total_len += sizeof(*hdr) + skb->len;
>
> 		/* Deliver to monitoring devices all received packets */
>-		virtio_transport_deliver_tap_pkt(pkt);
>+		virtio_transport_deliver_tap_pkt(skb);
>+
>+		hdr = virtio_vsock_hdr(skb);
>
> 		/* Only accept correctly addressed packets */
>-		if (le64_to_cpu(pkt->hdr.src_cid) == vsock->guest_cid &&
>-		    le64_to_cpu(pkt->hdr.dst_cid) ==
>+		if (le64_to_cpu(hdr->src_cid) == vsock->guest_cid &&
>+		    le64_to_cpu(hdr->dst_cid) ==
> 		    vhost_transport_get_local_cid())
>-			virtio_transport_recv_pkt(&vhost_transport, pkt);
>+			virtio_transport_recv_pkt(&vhost_transport, skb);
> 		else
>-			virtio_transport_free_pkt(pkt);
>+			kfree_skb(skb);
>
> 		vhost_add_used(vq, head, 0);
> 		added = true;
>@@ -693,8 +668,7 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
> 		       VHOST_VSOCK_WEIGHT, true, NULL);
>
> 	file->private_data = vsock;
>-	spin_lock_init(&vsock->send_pkt_list_lock);
>-	INIT_LIST_HEAD(&vsock->send_pkt_list);
>+	skb_queue_head_init(&vsock->send_pkt_queue);
> 	vhost_work_init(&vsock->send_pkt_work, vhost_transport_send_pkt_work);
> 	return 0;
>
>@@ -760,16 +734,7 @@ static int vhost_vsock_dev_release(struct inode *inode, struct file *file)
> 	vhost_vsock_flush(vsock);
> 	vhost_dev_stop(&vsock->dev);
>
>-	spin_lock_bh(&vsock->send_pkt_list_lock);
>-	while (!list_empty(&vsock->send_pkt_list)) {
>-		struct virtio_vsock_pkt *pkt;
>-
>-		pkt = list_first_entry(&vsock->send_pkt_list,
>-				struct virtio_vsock_pkt, list);
>-		list_del_init(&pkt->list);
>-		virtio_transport_free_pkt(pkt);
>-	}
>-	spin_unlock_bh(&vsock->send_pkt_list_lock);
>+	virtio_vsock_skb_queue_purge(&vsock->send_pkt_queue);
>
> 	vhost_dev_cleanup(&vsock->dev);
> 	kfree(vsock->dev.vqs);
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index 35d7eedb5e8e..7ed943615271 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -7,6 +7,106 @@
> #include <net/sock.h>
> #include <net/af_vsock.h>
>
>+#define VIRTIO_VSOCK_SKB_HEADROOM (sizeof(struct virtio_vsock_hdr))
>+
>+struct virtio_vsock_skb_cb {
>+	bool reply;
>+	bool tap_delivered;
>+};
>+
>+#define VIRTIO_VSOCK_SKB_CB(skb) ((struct virtio_vsock_skb_cb *)((skb)->cb))
>+
>+static inline struct virtio_vsock_hdr *virtio_vsock_hdr(struct sk_buff *skb)
>+{
>+	return (struct virtio_vsock_hdr *)skb->head;
>+}
>+
>+static inline bool virtio_vsock_skb_reply(struct sk_buff *skb)
>+{
>+	return VIRTIO_VSOCK_SKB_CB(skb)->reply;
>+}
>+
>+static inline void virtio_vsock_skb_set_reply(struct sk_buff *skb)
>+{
>+	VIRTIO_VSOCK_SKB_CB(skb)->reply = true;
>+}
>+
>+static inline bool virtio_vsock_skb_tap_delivered(struct sk_buff *skb)
>+{
>+	return VIRTIO_VSOCK_SKB_CB(skb)->tap_delivered;
>+}
>+
>+static inline void virtio_vsock_skb_set_tap_delivered(struct sk_buff *skb)
>+{
>+	VIRTIO_VSOCK_SKB_CB(skb)->tap_delivered = true;
>+}
>+
>+static inline void virtio_vsock_skb_clear_tap_delivered(struct sk_buff *skb)
>+{
>+	VIRTIO_VSOCK_SKB_CB(skb)->tap_delivered = false;
>+}

Maybe, we can have a single

virtio_vsock_skb_set_tap_delivered(struct sk_buff *skb,
                                    bool tap_delivered)

to be used in both cases.

Anyway, I don't have a strong opinion on that.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
