Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387A7E33BF
	for <lists.virtualization@lfdr.de>; Tue,  7 Nov 2023 04:12:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA0754211D;
	Tue,  7 Nov 2023 03:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA0754211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVjt4-rcwSLv; Tue,  7 Nov 2023 03:12:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 997DE41FBD;
	Tue,  7 Nov 2023 03:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 997DE41FBD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50A4FC0032;
	Tue,  7 Nov 2023 03:12:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0F2EC007F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Nov 2023 03:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A756582AA9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Nov 2023 03:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A756582AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVzNDmNNQXEH
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Nov 2023 03:12:43 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23B39821B4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Nov 2023 03:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23B39821B4
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R311e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VvsQhb7_1699326757; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VvsQhb7_1699326757) by smtp.aliyun-inc.com;
 Tue, 07 Nov 2023 11:12:38 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 08/21] virtio_net: sq support premapped mode
Date: Tue,  7 Nov 2023 11:12:14 +0800
Message-Id: <20231107031227.100015-9-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20231107031227.100015-1-xuanzhuo@linux.alibaba.com>
References: <20231107031227.100015-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 59a160d210e8
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
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

If the xsk is enabling, the xsk tx will share the send queue.
But the xsk requires that the send queue use the premapped mode.
So the send queue must support premapped mode.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio/main.c       | 163 ++++++++++++++++++++++++++++----
 drivers/net/virtio/virtio_net.h |  16 ++++
 2 files changed, 163 insertions(+), 16 deletions(-)

diff --git a/drivers/net/virtio/main.c b/drivers/net/virtio/main.c
index 16e75c08639e..f052db459156 100644
--- a/drivers/net/virtio/main.c
+++ b/drivers/net/virtio/main.c
@@ -46,6 +46,7 @@ module_param(napi_tx, bool, 0644);
 #define VIRTIO_XDP_REDIR	BIT(1)
 
 #define VIRTIO_XDP_FLAG	BIT(0)
+#define VIRTIO_XMIT_DATA_MASK (VIRTIO_XDP_FLAG)
 
 #define VIRTNET_DRIVER_VERSION "1.0.0"
 
@@ -167,6 +168,29 @@ static struct xdp_frame *ptr_to_xdp(void *ptr)
 	return (struct xdp_frame *)((unsigned long)ptr & ~VIRTIO_XDP_FLAG);
 }
 
+static inline void *virtnet_sq_unmap(struct virtnet_sq *sq, void *data)
+{
+	struct virtnet_sq_dma *next, *head;
+
+	head = (void *)((unsigned long)data & ~VIRTIO_XMIT_DATA_MASK);
+
+	data = head->data;
+
+	while (head) {
+		virtqueue_dma_unmap_single_attrs(sq->vq, head->addr, head->len,
+						 DMA_TO_DEVICE, 0);
+
+		next = head->next;
+
+		head->next = sq->dmainfo.free;
+		sq->dmainfo.free = head;
+
+		head = next;
+	}
+
+	return data;
+}
+
 static void __free_old_xmit(struct virtnet_sq *sq, bool in_napi,
 			    u64 *bytes, u64 *packets)
 {
@@ -175,14 +199,24 @@ static void __free_old_xmit(struct virtnet_sq *sq, bool in_napi,
 
 	while ((ptr = virtqueue_get_buf(sq->vq, &len)) != NULL) {
 		if (!is_xdp_frame(ptr)) {
-			struct sk_buff *skb = ptr;
+			struct sk_buff *skb;
+
+			if (sq->do_dma)
+				ptr = virtnet_sq_unmap(sq, ptr);
+
+			skb = ptr;
 
 			pr_debug("Sent skb %p\n", skb);
 
 			*bytes += skb->len;
 			napi_consume_skb(skb, in_napi);
 		} else {
-			struct xdp_frame *frame = ptr_to_xdp(ptr);
+			struct xdp_frame *frame;
+
+			if (sq->do_dma)
+				ptr = virtnet_sq_unmap(sq, ptr);
+
+			frame = ptr_to_xdp(ptr);
 
 			*bytes += xdp_get_frame_len(frame);
 			xdp_return_frame(frame);
@@ -567,22 +601,104 @@ static void *virtnet_rq_alloc(struct virtnet_rq *rq, u32 size, gfp_t gfp)
 	return buf;
 }
 
-static void virtnet_rq_set_premapped(struct virtnet_info *vi)
+static int virtnet_sq_set_premapped(struct virtnet_sq *sq)
 {
-	int i;
+	struct virtnet_sq_dma *d;
+	int err, size, i;
 
-	/* disable for big mode */
-	if (!vi->mergeable_rx_bufs && vi->big_packets)
-		return;
+	size = virtqueue_get_vring_size(sq->vq);
+
+	size += MAX_SKB_FRAGS + 2;
+
+	sq->dmainfo.head = kcalloc(size, sizeof(*sq->dmainfo.head), GFP_KERNEL);
+	if (!sq->dmainfo.head)
+		return -ENOMEM;
+
+	err = virtqueue_set_dma_premapped(sq->vq);
+	if (err) {
+		kfree(sq->dmainfo.head);
+		return err;
+	}
+
+	sq->dmainfo.free = NULL;
+
+	sq->do_dma = true;
+
+	for (i = 0; i < size; ++i) {
+		d = &sq->dmainfo.head[i];
+
+		d->next = sq->dmainfo.free;
+		sq->dmainfo.free = d;
+	}
+
+	return 0;
+}
+
+static void virtnet_set_premapped(struct virtnet_info *vi)
+{
+	int i;
 
 	for (i = 0; i < vi->max_queue_pairs; i++) {
-		if (virtqueue_set_dma_premapped(vi->rq[i].vq))
-			continue;
+		virtnet_sq_set_premapped(&vi->sq[i]);
 
-		vi->rq[i].do_dma = true;
+		/* disable for big mode */
+		if (vi->mergeable_rx_bufs || !vi->big_packets) {
+			if (!virtqueue_set_dma_premapped(vi->rq[i].vq))
+				vi->rq[i].do_dma = true;
+		}
 	}
 }
 
+static struct virtnet_sq_dma *virtnet_sq_map_sg(struct virtnet_sq *sq, int nents, void *data)
+{
+	struct virtnet_sq_dma *d, *head;
+	struct scatterlist *sg;
+	int i;
+
+	head = NULL;
+
+	for_each_sg(sq->sg, sg, nents, i) {
+		sg->dma_address = virtqueue_dma_map_single_attrs(sq->vq, sg_virt(sg),
+								 sg->length,
+								 DMA_TO_DEVICE, 0);
+		if (virtqueue_dma_mapping_error(sq->vq, sg->dma_address))
+			goto err;
+
+		d = sq->dmainfo.free;
+		sq->dmainfo.free = d->next;
+
+		d->addr = sg->dma_address;
+		d->len = sg->length;
+
+		d->next = head;
+		head = d;
+	}
+
+	head->data = data;
+
+	return (void *)((unsigned long)head | ((unsigned long)data & VIRTIO_XMIT_DATA_MASK));
+err:
+	virtnet_sq_unmap(sq, head);
+	return NULL;
+}
+
+static int virtnet_add_outbuf(struct virtnet_sq *sq, u32 num, void *data)
+{
+	int ret;
+
+	if (sq->do_dma) {
+		data = virtnet_sq_map_sg(sq, num, data);
+		if (!data)
+			return -ENOMEM;
+	}
+
+	ret = virtqueue_add_outbuf(sq->vq, sq->sg, num, data, GFP_ATOMIC);
+	if (ret && sq->do_dma)
+		virtnet_sq_unmap(sq, data);
+
+	return ret;
+}
+
 static void free_old_xmit(struct virtnet_sq *sq, bool in_napi)
 {
 	u64 bytes, packets = 0;
@@ -686,8 +802,7 @@ static int __virtnet_xdp_xmit_one(struct virtnet_info *vi,
 			    skb_frag_size(frag), skb_frag_off(frag));
 	}
 
-	err = virtqueue_add_outbuf(sq->vq, sq->sg, nr_frags + 1,
-				   xdp_to_ptr(xdpf), GFP_ATOMIC);
+	err = virtnet_add_outbuf(sq, nr_frags + 1, xdp_to_ptr(xdpf));
 	if (unlikely(err))
 		return -ENOSPC; /* Caller handle free/refcnt */
 
@@ -2126,7 +2241,8 @@ static int xmit_skb(struct virtnet_sq *sq, struct sk_buff *skb)
 			return num_sg;
 		num_sg++;
 	}
-	return virtqueue_add_outbuf(sq->vq, sq->sg, num_sg, skb, GFP_ATOMIC);
+
+	return virtnet_add_outbuf(sq, num_sg, skb);
 }
 
 static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
@@ -3818,6 +3934,8 @@ static void virtnet_free_queues(struct virtnet_info *vi)
 	for (i = 0; i < vi->max_queue_pairs; i++) {
 		__netif_napi_del(&vi->rq[i].napi);
 		__netif_napi_del(&vi->sq[i].napi);
+
+		kfree(vi->sq[i].dmainfo.head);
 	}
 
 	/* We called __netif_napi_del(),
@@ -3866,10 +3984,23 @@ static void free_receive_page_frags(struct virtnet_info *vi)
 
 static void virtnet_sq_free_unused_buf(struct virtqueue *vq, void *buf)
 {
-	if (!is_xdp_frame(buf))
+	struct virtnet_info *vi = vq->vdev->priv;
+	struct virtnet_sq *sq;
+	int i = vq2rxq(vq);
+
+	sq = &vi->sq[i];
+
+	if (!is_xdp_frame(buf)) {
+		if (sq->do_dma)
+			buf = virtnet_sq_unmap(sq, buf);
+
 		dev_kfree_skb(buf);
-	else
+	} else {
+		if (sq->do_dma)
+			buf = virtnet_sq_unmap(sq, buf);
+
 		xdp_return_frame(ptr_to_xdp(buf));
+	}
 }
 
 static void virtnet_rq_free_unused_buf(struct virtqueue *vq, void *buf)
@@ -4075,7 +4206,7 @@ static int init_vqs(struct virtnet_info *vi)
 	if (ret)
 		goto err_free;
 
-	virtnet_rq_set_premapped(vi);
+	virtnet_set_premapped(vi);
 
 	cpus_read_lock();
 	virtnet_set_affinity(vi);
diff --git a/drivers/net/virtio/virtio_net.h b/drivers/net/virtio/virtio_net.h
index d814341d9f97..ce806afb6d64 100644
--- a/drivers/net/virtio/virtio_net.h
+++ b/drivers/net/virtio/virtio_net.h
@@ -48,6 +48,18 @@ struct virtnet_rq_dma {
 	u16 need_sync;
 };
 
+struct virtnet_sq_dma {
+	struct virtnet_sq_dma *next;
+	dma_addr_t addr;
+	u32 len;
+	void *data;
+};
+
+struct virtnet_sq_dma_head {
+	struct virtnet_sq_dma *free;
+	struct virtnet_sq_dma *head;
+};
+
 /* Internal representation of a send virtqueue */
 struct virtnet_sq {
 	/* Virtqueue associated with this virtnet_sq */
@@ -67,6 +79,10 @@ struct virtnet_sq {
 
 	/* Record whether sq is in reset state. */
 	bool reset;
+
+	bool do_dma;
+
+	struct virtnet_sq_dma_head dmainfo;
 };
 
 /* Internal representation of a receive virtqueue */
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
