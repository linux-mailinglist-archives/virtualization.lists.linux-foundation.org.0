Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D20A777863
	for <lists.virtualization@lfdr.de>; Thu, 10 Aug 2023 14:31:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5ABA41742;
	Thu, 10 Aug 2023 12:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5ABA41742
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hD9V7VW_ebGH; Thu, 10 Aug 2023 12:31:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5694F4174F;
	Thu, 10 Aug 2023 12:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5694F4174F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E507C0DD2;
	Thu, 10 Aug 2023 12:31:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA684C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7672841753
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7672841753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMRraeDQ0UgY
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:16 +0000 (UTC)
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D316405B7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D316405B7
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VpTqSC5_1691670665; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VpTqSC5_1691670665) by smtp.aliyun-inc.com;
 Thu, 10 Aug 2023 20:31:06 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v13 06/12] virtio_ring: skip unmap for premapped
Date: Thu, 10 Aug 2023 20:30:51 +0800
Message-Id: <20230810123057.43407-7-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230810123057.43407-1-xuanzhuo@linux.alibaba.com>
References: <20230810123057.43407-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 6ea114ee5d47
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

Now we add a case where we skip dma unmap, the vq->premapped is true.

We can't just rely on use_dma_api to determine whether to skip the dma
operation. For convenience, I introduced the "do_unmap". By default, it
is the same as use_dma_api. If the driver is configured with premapped,
then do_unmap is false.

So as long as do_unmap is false, for addr of desc, we should skip dma
unmap operation.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 42 ++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index bb3d73d221cd..7973814b6e31 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -175,6 +175,11 @@ struct vring_virtqueue {
 	/* Do DMA mapping by driver */
 	bool premapped;
 
+	/* Do unmap or not for desc. Just when premapped is False and
+	 * use_dma_api is true, this is true.
+	 */
+	bool do_unmap;
+
 	/* Head of free buffer list. */
 	unsigned int free_head;
 	/* Number we've added since last sync. */
@@ -440,7 +445,7 @@ static void vring_unmap_one_split_indirect(const struct vring_virtqueue *vq,
 {
 	u16 flags;
 
-	if (!vq->use_dma_api)
+	if (!vq->do_unmap)
 		return;
 
 	flags = virtio16_to_cpu(vq->vq.vdev, desc->flags);
@@ -458,18 +463,21 @@ static unsigned int vring_unmap_one_split(const struct vring_virtqueue *vq,
 	struct vring_desc_extra *extra = vq->split.desc_extra;
 	u16 flags;
 
-	if (!vq->use_dma_api)
-		goto out;
-
 	flags = extra[i].flags;
 
 	if (flags & VRING_DESC_F_INDIRECT) {
+		if (!vq->use_dma_api)
+			goto out;
+
 		dma_unmap_single(vring_dma_dev(vq),
 				 extra[i].addr,
 				 extra[i].len,
 				 (flags & VRING_DESC_F_WRITE) ?
 				 DMA_FROM_DEVICE : DMA_TO_DEVICE);
 	} else {
+		if (!vq->do_unmap)
+			goto out;
+
 		dma_unmap_page(vring_dma_dev(vq),
 			       extra[i].addr,
 			       extra[i].len,
@@ -635,7 +643,7 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 	}
 	/* Last one doesn't continue. */
 	desc[prev].flags &= cpu_to_virtio16(_vq->vdev, ~VRING_DESC_F_NEXT);
-	if (!indirect && vq->use_dma_api)
+	if (!indirect && vq->do_unmap)
 		vq->split.desc_extra[prev & (vq->split.vring.num - 1)].flags &=
 			~VRING_DESC_F_NEXT;
 
@@ -794,7 +802,7 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
 				VRING_DESC_F_INDIRECT));
 		BUG_ON(len == 0 || len % sizeof(struct vring_desc));
 
-		if (vq->use_dma_api) {
+		if (vq->do_unmap) {
 			for (j = 0; j < len / sizeof(struct vring_desc); j++)
 				vring_unmap_one_split_indirect(vq, &indir_desc[j]);
 		}
@@ -1217,17 +1225,20 @@ static void vring_unmap_extra_packed(const struct vring_virtqueue *vq,
 {
 	u16 flags;
 
-	if (!vq->use_dma_api)
-		return;
-
 	flags = extra->flags;
 
 	if (flags & VRING_DESC_F_INDIRECT) {
+		if (!vq->use_dma_api)
+			return;
+
 		dma_unmap_single(vring_dma_dev(vq),
 				 extra->addr, extra->len,
 				 (flags & VRING_DESC_F_WRITE) ?
 				 DMA_FROM_DEVICE : DMA_TO_DEVICE);
 	} else {
+		if (!vq->do_unmap)
+			return;
+
 		dma_unmap_page(vring_dma_dev(vq),
 			       extra->addr, extra->len,
 			       (flags & VRING_DESC_F_WRITE) ?
@@ -1240,7 +1251,7 @@ static void vring_unmap_desc_packed(const struct vring_virtqueue *vq,
 {
 	u16 flags;
 
-	if (!vq->use_dma_api)
+	if (!vq->do_unmap)
 		return;
 
 	flags = le16_to_cpu(desc->flags);
@@ -1329,7 +1340,7 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 				sizeof(struct vring_packed_desc));
 	vq->packed.vring.desc[head].id = cpu_to_le16(id);
 
-	if (vq->use_dma_api) {
+	if (vq->do_unmap) {
 		vq->packed.desc_extra[id].addr = addr;
 		vq->packed.desc_extra[id].len = total_sg *
 				sizeof(struct vring_packed_desc);
@@ -1470,7 +1481,7 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 			desc[i].len = cpu_to_le32(sg->length);
 			desc[i].id = cpu_to_le16(id);
 
-			if (unlikely(vq->use_dma_api)) {
+			if (unlikely(vq->do_unmap)) {
 				vq->packed.desc_extra[curr].addr = addr;
 				vq->packed.desc_extra[curr].len = sg->length;
 				vq->packed.desc_extra[curr].flags =
@@ -1604,7 +1615,7 @@ static void detach_buf_packed(struct vring_virtqueue *vq,
 	vq->free_head = id;
 	vq->vq.num_free += state->num;
 
-	if (unlikely(vq->use_dma_api)) {
+	if (unlikely(vq->do_unmap)) {
 		curr = id;
 		for (i = 0; i < state->num; i++) {
 			vring_unmap_extra_packed(vq,
@@ -1621,7 +1632,7 @@ static void detach_buf_packed(struct vring_virtqueue *vq,
 		if (!desc)
 			return;
 
-		if (vq->use_dma_api) {
+		if (vq->do_unmap) {
 			len = vq->packed.desc_extra[id].len;
 			for (i = 0; i < len / sizeof(struct vring_packed_desc);
 					i++)
@@ -2080,6 +2091,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	vq->dma_dev = dma_dev;
 	vq->use_dma_api = vring_use_dma_api(vdev);
 	vq->premapped = false;
+	vq->do_unmap = vq->use_dma_api;
 
 	vq->indirect = virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC) &&
 		!context;
@@ -2587,6 +2599,7 @@ static struct virtqueue *__vring_new_virtqueue(unsigned int index,
 	vq->dma_dev = dma_dev;
 	vq->use_dma_api = vring_use_dma_api(vdev);
 	vq->premapped = false;
+	vq->do_unmap = vq->use_dma_api;
 
 	vq->indirect = virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC) &&
 		!context;
@@ -2771,6 +2784,7 @@ int virtqueue_set_dma_premapped(struct virtqueue *_vq)
 	}
 
 	vq->premapped = true;
+	vq->do_unmap = false;
 
 	END_USE(vq);
 
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
