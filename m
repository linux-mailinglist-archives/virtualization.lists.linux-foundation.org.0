Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98E7CA75E
	for <lists.virtualization@lfdr.de>; Mon, 16 Oct 2023 14:00:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 516D28214B;
	Mon, 16 Oct 2023 12:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 516D28214B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3qJr4EN9giw; Mon, 16 Oct 2023 12:00:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3B9158212C;
	Mon, 16 Oct 2023 12:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B9158212C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74E71C008C;
	Mon, 16 Oct 2023 12:00:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DD4BC008C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Oct 2023 12:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED592820DE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Oct 2023 12:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED592820DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h16Bum8w-sLH
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Oct 2023 12:00:46 +0000 (UTC)
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B15F82009
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Oct 2023 12:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B15F82009
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VuHUmQm_1697457640; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VuHUmQm_1697457640) by smtp.aliyun-inc.com;
 Mon, 16 Oct 2023 20:00:41 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v1 05/19] virtio_net: add prefix virtnet to all
 struct/api inside virtio_net.h
Date: Mon, 16 Oct 2023 20:00:19 +0800
Message-Id: <20231016120033.26933-6-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20231016120033.26933-1-xuanzhuo@linux.alibaba.com>
References: <20231016120033.26933-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 9790cc452aab
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

We move some structures and APIs to the header file, but these
structures and APIs do not prefixed with virtnet. This patch adds
virtnet for these.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio/main.c       | 122 ++++++++++++++++----------------
 drivers/net/virtio/virtio_net.h |  30 ++++----
 2 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/drivers/net/virtio/main.c b/drivers/net/virtio/main.c
index d8b6c0d86f29..ba38b6078e1d 100644
--- a/drivers/net/virtio/main.c
+++ b/drivers/net/virtio/main.c
@@ -180,7 +180,7 @@ skb_vnet_common_hdr(struct sk_buff *skb)
  * private is used to chain pages for big packets, put the whole
  * most recent used list in the beginning for reuse
  */
-static void give_pages(struct receive_queue *rq, struct page *page)
+static void give_pages(struct virtnet_rq *rq, struct page *page)
 {
 	struct page *end;
 
@@ -190,7 +190,7 @@ static void give_pages(struct receive_queue *rq, struct page *page)
 	rq->pages = page;
 }
 
-static struct page *get_a_page(struct receive_queue *rq, gfp_t gfp_mask)
+static struct page *get_a_page(struct virtnet_rq *rq, gfp_t gfp_mask)
 {
 	struct page *p = rq->pages;
 
@@ -225,7 +225,7 @@ static void virtqueue_napi_complete(struct napi_struct *napi,
 	opaque = virtqueue_enable_cb_prepare(vq);
 	if (napi_complete_done(napi, processed)) {
 		if (unlikely(virtqueue_poll(vq, opaque)))
-			virtqueue_napi_schedule(napi, vq);
+			virtnet_vq_napi_schedule(napi, vq);
 	} else {
 		virtqueue_disable_cb(vq);
 	}
@@ -240,7 +240,7 @@ static void skb_xmit_done(struct virtqueue *vq)
 	virtqueue_disable_cb(vq);
 
 	if (napi->weight)
-		virtqueue_napi_schedule(napi, vq);
+		virtnet_vq_napi_schedule(napi, vq);
 	else
 		/* We were probably waiting for more output buffers. */
 		netif_wake_subqueue(vi->dev, vq2txq(vq));
@@ -281,7 +281,7 @@ static struct sk_buff *virtnet_build_skb(void *buf, unsigned int buflen,
 
 /* Called from bottom half context */
 static struct sk_buff *page_to_skb(struct virtnet_info *vi,
-				   struct receive_queue *rq,
+				   struct virtnet_rq *rq,
 				   struct page *page, unsigned int offset,
 				   unsigned int len, unsigned int truesize,
 				   unsigned int headroom)
@@ -380,7 +380,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
 	return skb;
 }
 
-static void virtnet_rq_unmap(struct receive_queue *rq, void *buf, u32 len)
+static void virtnet_rq_unmap(struct virtnet_rq *rq, void *buf, u32 len)
 {
 	struct page *page = virt_to_head_page(buf);
 	struct virtnet_rq_dma *dma;
@@ -409,7 +409,7 @@ static void virtnet_rq_unmap(struct receive_queue *rq, void *buf, u32 len)
 	put_page(page);
 }
 
-static void *virtnet_rq_get_buf(struct receive_queue *rq, u32 *len, void **ctx)
+static void *virtnet_rq_get_buf(struct virtnet_rq *rq, u32 *len, void **ctx)
 {
 	void *buf;
 
@@ -420,7 +420,7 @@ static void *virtnet_rq_get_buf(struct receive_queue *rq, u32 *len, void **ctx)
 	return buf;
 }
 
-static void *virtnet_rq_detach_unused_buf(struct receive_queue *rq)
+static void *virtnet_rq_detach_unused_buf(struct virtnet_rq *rq)
 {
 	void *buf;
 
@@ -431,7 +431,7 @@ static void *virtnet_rq_detach_unused_buf(struct receive_queue *rq)
 	return buf;
 }
 
-static void virtnet_rq_init_one_sg(struct receive_queue *rq, void *buf, u32 len)
+static void virtnet_rq_init_one_sg(struct virtnet_rq *rq, void *buf, u32 len)
 {
 	struct virtnet_rq_dma *dma;
 	dma_addr_t addr;
@@ -456,7 +456,7 @@ static void virtnet_rq_init_one_sg(struct receive_queue *rq, void *buf, u32 len)
 	rq->sg[0].length = len;
 }
 
-static void *virtnet_rq_alloc(struct receive_queue *rq, u32 size, gfp_t gfp)
+static void *virtnet_rq_alloc(struct virtnet_rq *rq, u32 size, gfp_t gfp)
 {
 	struct page_frag *alloc_frag = &rq->alloc_frag;
 	struct virtnet_rq_dma *dma;
@@ -530,11 +530,11 @@ static void virtnet_rq_set_premapped(struct virtnet_info *vi)
 	}
 }
 
-static void free_old_xmit(struct send_queue *sq, bool in_napi)
+static void free_old_xmit(struct virtnet_sq *sq, bool in_napi)
 {
 	struct virtnet_sq_stats stats = {};
 
-	__free_old_xmit(sq, in_napi, &stats);
+	virtnet_free_old_xmit(sq, in_napi, &stats);
 
 	/* Avoid overhead when no packets have been processed
 	 * happens when called speculatively from start_xmit.
@@ -550,7 +550,7 @@ static void free_old_xmit(struct send_queue *sq, bool in_napi)
 
 static void check_sq_full_and_disable(struct virtnet_info *vi,
 				      struct net_device *dev,
-				      struct send_queue *sq)
+				      struct virtnet_sq *sq)
 {
 	bool use_napi = sq->napi.weight;
 	int qnum;
@@ -571,7 +571,7 @@ static void check_sq_full_and_disable(struct virtnet_info *vi,
 		netif_stop_subqueue(dev, qnum);
 		if (use_napi) {
 			if (unlikely(!virtqueue_enable_cb_delayed(sq->vq)))
-				virtqueue_napi_schedule(&sq->napi, sq->vq);
+				virtnet_vq_napi_schedule(&sq->napi, sq->vq);
 		} else if (unlikely(!virtqueue_enable_cb_delayed(sq->vq))) {
 			/* More just got used, free them then recheck. */
 			free_old_xmit(sq, false);
@@ -584,7 +584,7 @@ static void check_sq_full_and_disable(struct virtnet_info *vi,
 }
 
 static int __virtnet_xdp_xmit_one(struct virtnet_info *vi,
-				   struct send_queue *sq,
+				   struct virtnet_sq *sq,
 				   struct xdp_frame *xdpf)
 {
 	struct virtio_net_hdr_mrg_rxbuf *hdr;
@@ -674,9 +674,9 @@ static int virtnet_xdp_xmit(struct net_device *dev,
 {
 	struct virtnet_info *vi = netdev_priv(dev);
 	struct virtnet_sq_stats stats = {};
-	struct receive_queue *rq = vi->rq;
+	struct virtnet_rq *rq = vi->rq;
 	struct bpf_prog *xdp_prog;
-	struct send_queue *sq;
+	struct virtnet_sq *sq;
 	int nxmit = 0;
 	int kicks = 0;
 	int ret;
@@ -697,7 +697,7 @@ static int virtnet_xdp_xmit(struct net_device *dev,
 	}
 
 	/* Free up any pending old buffers before queueing new ones. */
-	__free_old_xmit(sq, false, &stats);
+	virtnet_free_old_xmit(sq, false, &stats);
 
 	for (i = 0; i < n; i++) {
 		struct xdp_frame *xdpf = frames[i];
@@ -708,7 +708,7 @@ static int virtnet_xdp_xmit(struct net_device *dev,
 	}
 	ret = nxmit;
 
-	if (!is_xdp_raw_buffer_queue(vi, sq - vi->sq))
+	if (!virtnet_is_xdp_raw_buffer_queue(vi, sq - vi->sq))
 		check_sq_full_and_disable(vi, dev, sq);
 
 	if (flags & XDP_XMIT_FLUSH) {
@@ -816,7 +816,7 @@ static unsigned int virtnet_get_headroom(struct virtnet_info *vi)
  * across multiple buffers (num_buf > 1), and we make sure buffers
  * have enough headroom.
  */
-static struct page *xdp_linearize_page(struct receive_queue *rq,
+static struct page *xdp_linearize_page(struct virtnet_rq *rq,
 				       int *num_buf,
 				       struct page *p,
 				       int offset,
@@ -897,7 +897,7 @@ static struct sk_buff *receive_small_build_skb(struct virtnet_info *vi,
 
 static struct sk_buff *receive_small_xdp(struct net_device *dev,
 					 struct virtnet_info *vi,
-					 struct receive_queue *rq,
+					 struct virtnet_rq *rq,
 					 struct bpf_prog *xdp_prog,
 					 void *buf,
 					 unsigned int xdp_headroom,
@@ -984,7 +984,7 @@ static struct sk_buff *receive_small_xdp(struct net_device *dev,
 
 static struct sk_buff *receive_small(struct net_device *dev,
 				     struct virtnet_info *vi,
-				     struct receive_queue *rq,
+				     struct virtnet_rq *rq,
 				     void *buf, void *ctx,
 				     unsigned int len,
 				     unsigned int *xdp_xmit,
@@ -1031,7 +1031,7 @@ static struct sk_buff *receive_small(struct net_device *dev,
 
 static struct sk_buff *receive_big(struct net_device *dev,
 				   struct virtnet_info *vi,
-				   struct receive_queue *rq,
+				   struct virtnet_rq *rq,
 				   void *buf,
 				   unsigned int len,
 				   struct virtnet_rq_stats *stats)
@@ -1052,7 +1052,7 @@ static struct sk_buff *receive_big(struct net_device *dev,
 	return NULL;
 }
 
-static void mergeable_buf_free(struct receive_queue *rq, int num_buf,
+static void mergeable_buf_free(struct virtnet_rq *rq, int num_buf,
 			       struct net_device *dev,
 			       struct virtnet_rq_stats *stats)
 {
@@ -1126,7 +1126,7 @@ static struct sk_buff *build_skb_from_xdp_buff(struct net_device *dev,
 /* TODO: build xdp in big mode */
 static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
 				      struct virtnet_info *vi,
-				      struct receive_queue *rq,
+				      struct virtnet_rq *rq,
 				      struct xdp_buff *xdp,
 				      void *buf,
 				      unsigned int len,
@@ -1214,7 +1214,7 @@ static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
 }
 
 static void *mergeable_xdp_get_buf(struct virtnet_info *vi,
-				   struct receive_queue *rq,
+				   struct virtnet_rq *rq,
 				   struct bpf_prog *xdp_prog,
 				   void *ctx,
 				   unsigned int *frame_sz,
@@ -1289,7 +1289,7 @@ static void *mergeable_xdp_get_buf(struct virtnet_info *vi,
 
 static struct sk_buff *receive_mergeable_xdp(struct net_device *dev,
 					     struct virtnet_info *vi,
-					     struct receive_queue *rq,
+					     struct virtnet_rq *rq,
 					     struct bpf_prog *xdp_prog,
 					     void *buf,
 					     void *ctx,
@@ -1349,7 +1349,7 @@ static struct sk_buff *receive_mergeable_xdp(struct net_device *dev,
 
 static struct sk_buff *receive_mergeable(struct net_device *dev,
 					 struct virtnet_info *vi,
-					 struct receive_queue *rq,
+					 struct virtnet_rq *rq,
 					 void *buf,
 					 void *ctx,
 					 unsigned int len,
@@ -1494,7 +1494,7 @@ static void virtio_skb_set_hash(const struct virtio_net_hdr_v1_hash *hdr_hash,
 	skb_set_hash(skb, __le32_to_cpu(hdr_hash->hash_value), rss_hash_type);
 }
 
-static void receive_buf(struct virtnet_info *vi, struct receive_queue *rq,
+static void receive_buf(struct virtnet_info *vi, struct virtnet_rq *rq,
 			void *buf, unsigned int len, void **ctx,
 			unsigned int *xdp_xmit,
 			struct virtnet_rq_stats *stats)
@@ -1554,7 +1554,7 @@ static void receive_buf(struct virtnet_info *vi, struct receive_queue *rq,
  * not need to use  mergeable_len_to_ctx here - it is enough
  * to store the headroom as the context ignoring the truesize.
  */
-static int add_recvbuf_small(struct virtnet_info *vi, struct receive_queue *rq,
+static int add_recvbuf_small(struct virtnet_info *vi, struct virtnet_rq *rq,
 			     gfp_t gfp)
 {
 	char *buf;
@@ -1583,7 +1583,7 @@ static int add_recvbuf_small(struct virtnet_info *vi, struct receive_queue *rq,
 	return err;
 }
 
-static int add_recvbuf_big(struct virtnet_info *vi, struct receive_queue *rq,
+static int add_recvbuf_big(struct virtnet_info *vi, struct virtnet_rq *rq,
 			   gfp_t gfp)
 {
 	struct page *first, *list = NULL;
@@ -1632,7 +1632,7 @@ static int add_recvbuf_big(struct virtnet_info *vi, struct receive_queue *rq,
 	return err;
 }
 
-static unsigned int get_mergeable_buf_len(struct receive_queue *rq,
+static unsigned int get_mergeable_buf_len(struct virtnet_rq *rq,
 					  struct ewma_pkt_len *avg_pkt_len,
 					  unsigned int room)
 {
@@ -1650,7 +1650,7 @@ static unsigned int get_mergeable_buf_len(struct receive_queue *rq,
 }
 
 static int add_recvbuf_mergeable(struct virtnet_info *vi,
-				 struct receive_queue *rq, gfp_t gfp)
+				 struct virtnet_rq *rq, gfp_t gfp)
 {
 	struct page_frag *alloc_frag = &rq->alloc_frag;
 	unsigned int headroom = virtnet_get_headroom(vi);
@@ -1705,7 +1705,7 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
  * before we're receiving packets, or from refill_work which is
  * careful to disable receiving (using napi_disable).
  */
-static bool try_fill_recv(struct virtnet_info *vi, struct receive_queue *rq,
+static bool try_fill_recv(struct virtnet_info *vi, struct virtnet_rq *rq,
 			  gfp_t gfp)
 {
 	int err;
@@ -1737,9 +1737,9 @@ static bool try_fill_recv(struct virtnet_info *vi, struct receive_queue *rq,
 static void skb_recv_done(struct virtqueue *rvq)
 {
 	struct virtnet_info *vi = rvq->vdev->priv;
-	struct receive_queue *rq = &vi->rq[vq2rxq(rvq)];
+	struct virtnet_rq *rq = &vi->rq[vq2rxq(rvq)];
 
-	virtqueue_napi_schedule(&rq->napi, rvq);
+	virtnet_vq_napi_schedule(&rq->napi, rvq);
 }
 
 static void virtnet_napi_enable(struct virtqueue *vq, struct napi_struct *napi)
@@ -1751,7 +1751,7 @@ static void virtnet_napi_enable(struct virtqueue *vq, struct napi_struct *napi)
 	 * Call local_bh_enable after to trigger softIRQ processing.
 	 */
 	local_bh_disable();
-	virtqueue_napi_schedule(napi, vq);
+	virtnet_vq_napi_schedule(napi, vq);
 	local_bh_enable();
 }
 
@@ -1787,7 +1787,7 @@ static void refill_work(struct work_struct *work)
 	int i;
 
 	for (i = 0; i < vi->curr_queue_pairs; i++) {
-		struct receive_queue *rq = &vi->rq[i];
+		struct virtnet_rq *rq = &vi->rq[i];
 
 		napi_disable(&rq->napi);
 		still_empty = !try_fill_recv(vi, rq, GFP_KERNEL);
@@ -1801,7 +1801,7 @@ static void refill_work(struct work_struct *work)
 	}
 }
 
-static int virtnet_receive(struct receive_queue *rq, int budget,
+static int virtnet_receive(struct virtnet_rq *rq, int budget,
 			   unsigned int *xdp_xmit)
 {
 	struct virtnet_info *vi = rq->vq->vdev->priv;
@@ -1848,14 +1848,14 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
 	return stats.packets;
 }
 
-static void virtnet_poll_cleantx(struct receive_queue *rq)
+static void virtnet_poll_cleantx(struct virtnet_rq *rq)
 {
 	struct virtnet_info *vi = rq->vq->vdev->priv;
 	unsigned int index = vq2rxq(rq->vq);
-	struct send_queue *sq = &vi->sq[index];
+	struct virtnet_sq *sq = &vi->sq[index];
 	struct netdev_queue *txq = netdev_get_tx_queue(vi->dev, index);
 
-	if (!sq->napi.weight || is_xdp_raw_buffer_queue(vi, index))
+	if (!sq->napi.weight || virtnet_is_xdp_raw_buffer_queue(vi, index))
 		return;
 
 	if (__netif_tx_trylock(txq)) {
@@ -1878,10 +1878,10 @@ static void virtnet_poll_cleantx(struct receive_queue *rq)
 
 static int virtnet_poll(struct napi_struct *napi, int budget)
 {
-	struct receive_queue *rq =
-		container_of(napi, struct receive_queue, napi);
+	struct virtnet_rq *rq =
+		container_of(napi, struct virtnet_rq, napi);
 	struct virtnet_info *vi = rq->vq->vdev->priv;
-	struct send_queue *sq;
+	struct virtnet_sq *sq;
 	unsigned int received;
 	unsigned int xdp_xmit = 0;
 
@@ -1972,14 +1972,14 @@ static int virtnet_open(struct net_device *dev)
 
 static int virtnet_poll_tx(struct napi_struct *napi, int budget)
 {
-	struct send_queue *sq = container_of(napi, struct send_queue, napi);
+	struct virtnet_sq *sq = container_of(napi, struct virtnet_sq, napi);
 	struct virtnet_info *vi = sq->vq->vdev->priv;
 	unsigned int index = vq2txq(sq->vq);
 	struct netdev_queue *txq;
 	int opaque;
 	bool done;
 
-	if (unlikely(is_xdp_raw_buffer_queue(vi, index))) {
+	if (unlikely(virtnet_is_xdp_raw_buffer_queue(vi, index))) {
 		/* We don't need to enable cb for XDP */
 		napi_complete_done(napi, 0);
 		return 0;
@@ -2016,7 +2016,7 @@ static int virtnet_poll_tx(struct napi_struct *napi, int budget)
 	return 0;
 }
 
-static int xmit_skb(struct send_queue *sq, struct sk_buff *skb)
+static int xmit_skb(struct virtnet_sq *sq, struct sk_buff *skb)
 {
 	struct virtio_net_hdr_mrg_rxbuf *hdr;
 	const unsigned char *dest = ((struct ethhdr *)skb->data)->h_dest;
@@ -2067,7 +2067,7 @@ static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct virtnet_info *vi = netdev_priv(dev);
 	int qnum = skb_get_queue_mapping(skb);
-	struct send_queue *sq = &vi->sq[qnum];
+	struct virtnet_sq *sq = &vi->sq[qnum];
 	int err;
 	struct netdev_queue *txq = netdev_get_tx_queue(dev, qnum);
 	bool kick = !netdev_xmit_more();
@@ -2121,7 +2121,7 @@ static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
 }
 
 static int virtnet_rx_resize(struct virtnet_info *vi,
-			     struct receive_queue *rq, u32 ring_num)
+			     struct virtnet_rq *rq, u32 ring_num)
 {
 	bool running = netif_running(vi->dev);
 	int err, qindex;
@@ -2144,7 +2144,7 @@ static int virtnet_rx_resize(struct virtnet_info *vi,
 }
 
 static int virtnet_tx_resize(struct virtnet_info *vi,
-			     struct send_queue *sq, u32 ring_num)
+			     struct virtnet_sq *sq, u32 ring_num)
 {
 	bool running = netif_running(vi->dev);
 	struct netdev_queue *txq;
@@ -2290,8 +2290,8 @@ static void virtnet_stats(struct net_device *dev,
 
 	for (i = 0; i < vi->max_queue_pairs; i++) {
 		u64 tpackets, tbytes, terrors, rpackets, rbytes, rdrops;
-		struct receive_queue *rq = &vi->rq[i];
-		struct send_queue *sq = &vi->sq[i];
+		struct virtnet_rq *rq = &vi->rq[i];
+		struct virtnet_sq *sq = &vi->sq[i];
 
 		do {
 			start = u64_stats_fetch_begin(&sq->stats.syncp);
@@ -2604,8 +2604,8 @@ static int virtnet_set_ringparam(struct net_device *dev,
 {
 	struct virtnet_info *vi = netdev_priv(dev);
 	u32 rx_pending, tx_pending;
-	struct receive_queue *rq;
-	struct send_queue *sq;
+	struct virtnet_rq *rq;
+	struct virtnet_sq *sq;
 	int i, err;
 
 	if (ring->rx_mini_pending || ring->rx_jumbo_pending)
@@ -2909,7 +2909,7 @@ static void virtnet_get_ethtool_stats(struct net_device *dev,
 	size_t offset;
 
 	for (i = 0; i < vi->curr_queue_pairs; i++) {
-		struct receive_queue *rq = &vi->rq[i];
+		struct virtnet_rq *rq = &vi->rq[i];
 
 		stats_base = (u8 *)&rq->stats;
 		do {
@@ -2923,7 +2923,7 @@ static void virtnet_get_ethtool_stats(struct net_device *dev,
 	}
 
 	for (i = 0; i < vi->curr_queue_pairs; i++) {
-		struct send_queue *sq = &vi->sq[i];
+		struct virtnet_sq *sq = &vi->sq[i];
 
 		stats_base = (u8 *)&sq->stats;
 		do {
@@ -3604,7 +3604,7 @@ static int virtnet_set_features(struct net_device *dev,
 static void virtnet_tx_timeout(struct net_device *dev, unsigned int txqueue)
 {
 	struct virtnet_info *priv = netdev_priv(dev);
-	struct send_queue *sq = &priv->sq[txqueue];
+	struct virtnet_sq *sq = &priv->sq[txqueue];
 	struct netdev_queue *txq = netdev_get_tx_queue(dev, txqueue);
 
 	u64_stats_update_begin(&sq->stats.syncp);
@@ -3729,10 +3729,10 @@ static void free_receive_page_frags(struct virtnet_info *vi)
 
 static void virtnet_sq_free_unused_buf(struct virtqueue *vq, void *buf)
 {
-	if (!is_xdp_frame(buf))
+	if (!virtnet_is_xdp_frame(buf))
 		dev_kfree_skb(buf);
 	else
-		xdp_return_frame(ptr_to_xdp(buf));
+		xdp_return_frame(virtnet_ptr_to_xdp(buf));
 }
 
 static void virtnet_rq_free_unused_buf(struct virtqueue *vq, void *buf)
@@ -3761,7 +3761,7 @@ static void free_unused_bufs(struct virtnet_info *vi)
 	}
 
 	for (i = 0; i < vi->max_queue_pairs; i++) {
-		struct receive_queue *rq = &vi->rq[i];
+		struct virtnet_rq *rq = &vi->rq[i];
 
 		while ((buf = virtnet_rq_detach_unused_buf(rq)) != NULL)
 			virtnet_rq_free_unused_buf(rq->vq, buf);
diff --git a/drivers/net/virtio/virtio_net.h b/drivers/net/virtio/virtio_net.h
index ddaf0ecf4d9d..282504d6639a 100644
--- a/drivers/net/virtio/virtio_net.h
+++ b/drivers/net/virtio/virtio_net.h
@@ -59,8 +59,8 @@ struct virtnet_rq_dma {
 };
 
 /* Internal representation of a send virtqueue */
-struct send_queue {
-	/* Virtqueue associated with this send _queue */
+struct virtnet_sq {
+	/* Virtqueue associated with this virtnet_sq */
 	struct virtqueue *vq;
 
 	/* TX: fragments + linear part + virtio header */
@@ -80,8 +80,8 @@ struct send_queue {
 };
 
 /* Internal representation of a receive virtqueue */
-struct receive_queue {
-	/* Virtqueue associated with this receive_queue */
+struct virtnet_rq {
+	/* Virtqueue associated with this virtnet_rq */
 	struct virtqueue *vq;
 
 	struct napi_struct napi;
@@ -123,8 +123,8 @@ struct virtnet_info {
 	struct virtio_device *vdev;
 	struct virtqueue *cvq;
 	struct net_device *dev;
-	struct send_queue *sq;
-	struct receive_queue *rq;
+	struct virtnet_sq *sq;
+	struct virtnet_rq *rq;
 	unsigned int status;
 
 	/* Max # of queue pairs supported by the device */
@@ -201,24 +201,24 @@ struct virtnet_info {
 	struct failover *failover;
 };
 
-static inline bool is_xdp_frame(void *ptr)
+static inline bool virtnet_is_xdp_frame(void *ptr)
 {
 	return (unsigned long)ptr & VIRTIO_XDP_FLAG;
 }
 
-static inline struct xdp_frame *ptr_to_xdp(void *ptr)
+static inline struct xdp_frame *virtnet_ptr_to_xdp(void *ptr)
 {
 	return (struct xdp_frame *)((unsigned long)ptr & ~VIRTIO_XDP_FLAG);
 }
 
-static inline void __free_old_xmit(struct send_queue *sq, bool in_napi,
-				   struct virtnet_sq_stats *stats)
+static inline void virtnet_free_old_xmit(struct virtnet_sq *sq, bool in_napi,
+					 struct virtnet_sq_stats *stats)
 {
 	unsigned int len;
 	void *ptr;
 
 	while ((ptr = virtqueue_get_buf(sq->vq, &len)) != NULL) {
-		if (!is_xdp_frame(ptr)) {
+		if (!virtnet_is_xdp_frame(ptr)) {
 			struct sk_buff *skb = ptr;
 
 			pr_debug("Sent skb %p\n", skb);
@@ -226,7 +226,7 @@ static inline void __free_old_xmit(struct send_queue *sq, bool in_napi,
 			stats->bytes += skb->len;
 			napi_consume_skb(skb, in_napi);
 		} else {
-			struct xdp_frame *frame = ptr_to_xdp(ptr);
+			struct xdp_frame *frame = virtnet_ptr_to_xdp(ptr);
 
 			stats->bytes += xdp_get_frame_len(frame);
 			xdp_return_frame(frame);
@@ -235,8 +235,8 @@ static inline void __free_old_xmit(struct send_queue *sq, bool in_napi,
 	}
 }
 
-static inline void virtqueue_napi_schedule(struct napi_struct *napi,
-					   struct virtqueue *vq)
+static inline void virtnet_vq_napi_schedule(struct napi_struct *napi,
+					    struct virtqueue *vq)
 {
 	if (napi_schedule_prep(napi)) {
 		virtqueue_disable_cb(vq);
@@ -244,7 +244,7 @@ static inline void virtqueue_napi_schedule(struct napi_struct *napi,
 	}
 }
 
-static inline bool is_xdp_raw_buffer_queue(struct virtnet_info *vi, int q)
+static inline bool virtnet_is_xdp_raw_buffer_queue(struct virtnet_info *vi, int q)
 {
 	if (q < (vi->curr_queue_pairs - vi->xdp_queue_pairs))
 		return false;
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
