Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820A74CABE
	for <lists.virtualization@lfdr.de>; Mon, 10 Jul 2023 05:43:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E43060BCE;
	Mon, 10 Jul 2023 03:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E43060BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0SmZrqiCWSn; Mon, 10 Jul 2023 03:43:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9400B60737;
	Mon, 10 Jul 2023 03:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9400B60737
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCD5AC0DD4;
	Mon, 10 Jul 2023 03:43:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A05EC0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jul 2023 03:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02A7260B2E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jul 2023 03:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02A7260B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kqtMX1IsXkvN
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jul 2023 03:42:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E515C60B8D
Received: from out30-101.freemail.mail.aliyun.com
 (out30-101.freemail.mail.aliyun.com [115.124.30.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E515C60B8D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jul 2023 03:42:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VmxB8N8_1688960570; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VmxB8N8_1688960570) by smtp.aliyun-inc.com;
 Mon, 10 Jul 2023 11:42:51 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v11 10/10] virtio_net: merge dma operation for one page
Date: Mon, 10 Jul 2023 11:42:37 +0800
Message-Id: <20230710034237.12391-11-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230710034237.12391-1-xuanzhuo@linux.alibaba.com>
References: <20230710034237.12391-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 39991abed41c
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Currently, the virtio core will perform a dma operation for each
operation. Although, the same page may be operated multiple times.

The driver does the dma operation and manages the dma address based the
feature premapped of virtio core.

This way, we can perform only one dma operation for the same page. In
the case of mtu 1500, this can reduce a lot of dma operations.

Tested on Aliyun g7.4large machine, in the case of a cpu 100%, pps
increased from 1893766 to 1901105. An increase of 0.4%.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio_net.c | 283 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 267 insertions(+), 16 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 486b5849033d..4de845d35bed 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -126,6 +126,27 @@ static const struct virtnet_stat_desc virtnet_rq_stats_desc[] = {
 #define VIRTNET_SQ_STATS_LEN	ARRAY_SIZE(virtnet_sq_stats_desc)
 #define VIRTNET_RQ_STATS_LEN	ARRAY_SIZE(virtnet_rq_stats_desc)
 
+/* The bufs on the same page may share this struct. */
+struct virtnet_rq_dma {
+	struct virtnet_rq_dma *next;
+
+	dma_addr_t addr;
+
+	void *buf;
+	u32 len;
+
+	u32 ref;
+};
+
+/* Record the dma and buf. */
+struct virtnet_rq_data {
+	struct virtnet_rq_data *next;
+
+	void *buf;
+
+	struct virtnet_rq_dma *dma;
+};
+
 /* Internal representation of a send virtqueue */
 struct send_queue {
 	/* Virtqueue associated with this send _queue */
@@ -175,6 +196,13 @@ struct receive_queue {
 	char name[16];
 
 	struct xdp_rxq_info xdp_rxq;
+
+	struct virtnet_rq_data *data_array;
+	struct virtnet_rq_data *data_free;
+
+	struct virtnet_rq_dma *dma_array;
+	struct virtnet_rq_dma *dma_free;
+	struct virtnet_rq_dma *last_dma;
 };
 
 /* This structure can contain rss message with maximum settings for indirection table and keysize
@@ -549,6 +577,176 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
 	return skb;
 }
 
+static void virtnet_rq_unmap(struct receive_queue *rq, struct virtnet_rq_dma *dma)
+{
+	struct device *dev;
+
+	--dma->ref;
+
+	if (dma->ref)
+		return;
+
+	dev = virtqueue_dma_dev(rq->vq);
+
+	dma_unmap_page(dev, dma->addr, dma->len, DMA_FROM_DEVICE);
+
+	dma->next = rq->dma_free;
+	rq->dma_free = dma;
+}
+
+static void *virtnet_rq_recycle_data(struct receive_queue *rq,
+				     struct virtnet_rq_data *data)
+{
+	void *buf;
+
+	buf = data->buf;
+
+	data->next = rq->data_free;
+	rq->data_free = data;
+
+	return buf;
+}
+
+static struct virtnet_rq_data *virtnet_rq_get_data(struct receive_queue *rq,
+						   void *buf,
+						   struct virtnet_rq_dma *dma)
+{
+	struct virtnet_rq_data *data;
+
+	data = rq->data_free;
+	rq->data_free = data->next;
+
+	data->buf = buf;
+	data->dma = dma;
+
+	return data;
+}
+
+static void *virtnet_rq_get_buf(struct receive_queue *rq, u32 *len, void **ctx)
+{
+	struct virtnet_rq_data *data;
+	void *buf;
+
+	buf = virtqueue_get_buf_ctx(rq->vq, len, ctx);
+	if (!buf || !rq->data_array)
+		return buf;
+
+	data = buf;
+
+	virtnet_rq_unmap(rq, data->dma);
+
+	return virtnet_rq_recycle_data(rq, data);
+}
+
+static void *virtnet_rq_detach_unused_buf(struct receive_queue *rq)
+{
+	struct virtnet_rq_data *data;
+	void *buf;
+
+	buf = virtqueue_detach_unused_buf(rq->vq);
+	if (!buf || !rq->data_array)
+		return buf;
+
+	data = buf;
+
+	virtnet_rq_unmap(rq, data->dma);
+
+	return virtnet_rq_recycle_data(rq, data);
+}
+
+static int virtnet_rq_map_sg(struct receive_queue *rq, void *buf, u32 len)
+{
+	struct virtnet_rq_dma *dma = rq->last_dma;
+	struct device *dev;
+	u32 off, map_len;
+	dma_addr_t addr;
+	void *end;
+
+	if (likely(dma) && buf >= dma->buf && (buf + len <= dma->buf + dma->len)) {
+		++dma->ref;
+		addr = dma->addr + (buf - dma->buf);
+		goto ok;
+	}
+
+	end = buf + len - 1;
+	off = offset_in_page(end);
+	map_len = len + PAGE_SIZE - off;
+
+	dev = virtqueue_dma_dev(rq->vq);
+
+	addr = dma_map_page_attrs(dev, virt_to_page(buf), offset_in_page(buf),
+				  map_len, DMA_FROM_DEVICE, 0);
+	if (addr == DMA_MAPPING_ERROR)
+		return -ENOMEM;
+
+	dma = rq->dma_free;
+	rq->dma_free = dma->next;
+
+	dma->ref = 1;
+	dma->buf = buf;
+	dma->addr = addr;
+	dma->len = map_len;
+
+	rq->last_dma = dma;
+
+ok:
+	sg_init_table(rq->sg, 1);
+	rq->sg[0].dma_address = addr;
+	rq->sg[0].length = len;
+
+	return 0;
+}
+
+static int virtnet_rq_merge_map_init(struct virtnet_info *vi)
+{
+	struct receive_queue *rq;
+	int i, err, j, num;
+
+	/* disable for big mode */
+	if (!vi->mergeable_rx_bufs && vi->big_packets)
+		return 0;
+
+	for (i = 0; i < vi->max_queue_pairs; i++) {
+		err = virtqueue_set_premapped(vi->rq[i].vq);
+		if (err)
+			continue;
+
+		rq = &vi->rq[i];
+
+		num = virtqueue_get_vring_size(rq->vq);
+
+		rq->data_array = kmalloc_array(num, sizeof(*rq->data_array), GFP_KERNEL);
+		if (!rq->data_array)
+			goto err;
+
+		rq->dma_array = kmalloc_array(num, sizeof(*rq->dma_array), GFP_KERNEL);
+		if (!rq->dma_array)
+			goto err;
+
+		for (j = 0; j < num; ++j) {
+			rq->data_array[j].next = rq->data_free;
+			rq->data_free = &rq->data_array[j];
+
+			rq->dma_array[j].next = rq->dma_free;
+			rq->dma_free = &rq->dma_array[j];
+		}
+	}
+
+	return 0;
+
+err:
+	for (i = 0; i < vi->max_queue_pairs; i++) {
+		struct receive_queue *rq;
+
+		rq = &vi->rq[i];
+
+		kfree(rq->dma_array);
+		kfree(rq->data_array);
+	}
+
+	return -ENOMEM;
+}
+
 static void free_old_xmit_skbs(struct send_queue *sq, bool in_napi)
 {
 	unsigned int len;
@@ -835,7 +1033,7 @@ static struct page *xdp_linearize_page(struct receive_queue *rq,
 		void *buf;
 		int off;
 
-		buf = virtqueue_get_buf(rq->vq, &buflen);
+		buf = virtnet_rq_get_buf(rq, &buflen, NULL);
 		if (unlikely(!buf))
 			goto err_buf;
 
@@ -1126,7 +1324,7 @@ static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
 		return -EINVAL;
 
 	while (--*num_buf > 0) {
-		buf = virtqueue_get_buf_ctx(rq->vq, &len, &ctx);
+		buf = virtnet_rq_get_buf(rq, &len, &ctx);
 		if (unlikely(!buf)) {
 			pr_debug("%s: rx error: %d buffers out of %d missing\n",
 				 dev->name, *num_buf,
@@ -1351,7 +1549,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 	while (--num_buf) {
 		int num_skb_frags;
 
-		buf = virtqueue_get_buf_ctx(rq->vq, &len, &ctx);
+		buf = virtnet_rq_get_buf(rq, &len, &ctx);
 		if (unlikely(!buf)) {
 			pr_debug("%s: rx error: %d buffers out of %d missing\n",
 				 dev->name, num_buf,
@@ -1414,7 +1612,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 err_skb:
 	put_page(page);
 	while (num_buf-- > 1) {
-		buf = virtqueue_get_buf(rq->vq, &len);
+		buf = virtnet_rq_get_buf(rq, &len, NULL);
 		if (unlikely(!buf)) {
 			pr_debug("%s: rx error: %d buffers missing\n",
 				 dev->name, num_buf);
@@ -1529,6 +1727,7 @@ static int add_recvbuf_small(struct virtnet_info *vi, struct receive_queue *rq,
 	unsigned int xdp_headroom = virtnet_get_headroom(vi);
 	void *ctx = (void *)(unsigned long)xdp_headroom;
 	int len = vi->hdr_len + VIRTNET_RX_PAD + GOOD_PACKET_LEN + xdp_headroom;
+	struct virtnet_rq_data *data;
 	int err;
 
 	len = SKB_DATA_ALIGN(len) +
@@ -1539,11 +1738,34 @@ static int add_recvbuf_small(struct virtnet_info *vi, struct receive_queue *rq,
 	buf = (char *)page_address(alloc_frag->page) + alloc_frag->offset;
 	get_page(alloc_frag->page);
 	alloc_frag->offset += len;
-	sg_init_one(rq->sg, buf + VIRTNET_RX_PAD + xdp_headroom,
-		    vi->hdr_len + GOOD_PACKET_LEN);
-	err = virtqueue_add_inbuf_ctx(rq->vq, rq->sg, 1, buf, ctx, gfp);
+
+	if (rq->data_array) {
+		err = virtnet_rq_map_sg(rq, buf + VIRTNET_RX_PAD + xdp_headroom,
+					vi->hdr_len + GOOD_PACKET_LEN);
+		if (err)
+			goto map_err;
+
+		data = virtnet_rq_get_data(rq, buf, rq->last_dma);
+	} else {
+		sg_init_one(rq->sg, buf + VIRTNET_RX_PAD + xdp_headroom,
+			    vi->hdr_len + GOOD_PACKET_LEN);
+		data = (void *)buf;
+	}
+
+	err = virtqueue_add_inbuf_ctx(rq->vq, rq->sg, 1, data, ctx, gfp);
 	if (err < 0)
-		put_page(virt_to_head_page(buf));
+		goto add_err;
+
+	return err;
+
+add_err:
+	if (rq->data_array) {
+		virtnet_rq_unmap(rq, data->dma);
+		virtnet_rq_recycle_data(rq, data);
+	}
+
+map_err:
+	put_page(virt_to_head_page(buf));
 	return err;
 }
 
@@ -1620,6 +1842,7 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
 	unsigned int headroom = virtnet_get_headroom(vi);
 	unsigned int tailroom = headroom ? sizeof(struct skb_shared_info) : 0;
 	unsigned int room = SKB_DATA_ALIGN(headroom + tailroom);
+	struct virtnet_rq_data *data;
 	char *buf;
 	void *ctx;
 	int err;
@@ -1650,12 +1873,32 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
 		alloc_frag->offset += hole;
 	}
 
-	sg_init_one(rq->sg, buf, len);
+	if (rq->data_array) {
+		err = virtnet_rq_map_sg(rq, buf, len);
+		if (err)
+			goto map_err;
+
+		data = virtnet_rq_get_data(rq, buf, rq->last_dma);
+	} else {
+		sg_init_one(rq->sg, buf, len);
+		data = (void *)buf;
+	}
+
 	ctx = mergeable_len_to_ctx(len + room, headroom);
-	err = virtqueue_add_inbuf_ctx(rq->vq, rq->sg, 1, buf, ctx, gfp);
+	err = virtqueue_add_inbuf_ctx(rq->vq, rq->sg, 1, data, ctx, gfp);
 	if (err < 0)
-		put_page(virt_to_head_page(buf));
+		goto add_err;
+
+	return 0;
+
+add_err:
+	if (rq->data_array) {
+		virtnet_rq_unmap(rq, data->dma);
+		virtnet_rq_recycle_data(rq, data);
+	}
 
+map_err:
+	put_page(virt_to_head_page(buf));
 	return err;
 }
 
@@ -1775,13 +2018,13 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
 		void *ctx;
 
 		while (stats.packets < budget &&
-		       (buf = virtqueue_get_buf_ctx(rq->vq, &len, &ctx))) {
+		       (buf = virtnet_rq_get_buf(rq, &len, &ctx))) {
 			receive_buf(vi, rq, buf, len, ctx, xdp_xmit, &stats);
 			stats.packets++;
 		}
 	} else {
 		while (stats.packets < budget &&
-		       (buf = virtqueue_get_buf(rq->vq, &len)) != NULL) {
+		       (buf = virtnet_rq_get_buf(rq, &len, NULL)) != NULL) {
 			receive_buf(vi, rq, buf, len, NULL, xdp_xmit, &stats);
 			stats.packets++;
 		}
@@ -3514,6 +3757,9 @@ static void virtnet_free_queues(struct virtnet_info *vi)
 	for (i = 0; i < vi->max_queue_pairs; i++) {
 		__netif_napi_del(&vi->rq[i].napi);
 		__netif_napi_del(&vi->sq[i].napi);
+
+		kfree(vi->rq[i].data_array);
+		kfree(vi->rq[i].dma_array);
 	}
 
 	/* We called __netif_napi_del(),
@@ -3591,9 +3837,10 @@ static void free_unused_bufs(struct virtnet_info *vi)
 	}
 
 	for (i = 0; i < vi->max_queue_pairs; i++) {
-		struct virtqueue *vq = vi->rq[i].vq;
-		while ((buf = virtqueue_detach_unused_buf(vq)) != NULL)
-			virtnet_rq_free_unused_buf(vq, buf);
+		struct receive_queue *rq = &vi->rq[i];
+
+		while ((buf = virtnet_rq_detach_unused_buf(rq)) != NULL)
+			virtnet_rq_free_unused_buf(rq->vq, buf);
 		cond_resched();
 	}
 }
@@ -3767,6 +4014,10 @@ static int init_vqs(struct virtnet_info *vi)
 	if (ret)
 		goto err_free;
 
+	ret = virtnet_rq_merge_map_init(vi);
+	if (ret)
+		goto err_free;
+
 	cpus_read_lock();
 	virtnet_set_affinity(vi);
 	cpus_read_unlock();
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
