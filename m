Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3524777785A
	for <lists.virtualization@lfdr.de>; Thu, 10 Aug 2023 14:31:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAADA4173F;
	Thu, 10 Aug 2023 12:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAADA4173F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tx4U0rJj82tP; Thu, 10 Aug 2023 12:31:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 662F34172D;
	Thu, 10 Aug 2023 12:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 662F34172D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05B54C0DD7;
	Thu, 10 Aug 2023 12:31:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81440C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7F3C405B7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F3C405B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E11yWoRFOX2C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:08 +0000 (UTC)
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B769140191
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B769140191
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VpTqS9p_1691670660; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VpTqS9p_1691670660) by smtp.aliyun-inc.com;
 Thu, 10 Aug 2023 20:31:01 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v13 02/12] virtio_ring: put mapping error check in
 vring_map_one_sg
Date: Thu, 10 Aug 2023 20:30:47 +0800
Message-Id: <20230810123057.43407-3-xuanzhuo@linux.alibaba.com>
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

This patch put the dma addr error check in vring_map_one_sg().

The benefits of doing this:

1. reduce one judgment of vq->use_dma_api.
2. make vring_map_one_sg more simple, without calling
   vring_mapping_error to check the return value. simplifies subsequent
   code

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 37 +++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index f8754f1d64d3..87d7ceeecdbd 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -355,9 +355,8 @@ static struct device *vring_dma_dev(const struct vring_virtqueue *vq)
 }
 
 /* Map one sg entry. */
-static dma_addr_t vring_map_one_sg(const struct vring_virtqueue *vq,
-				   struct scatterlist *sg,
-				   enum dma_data_direction direction)
+static int vring_map_one_sg(const struct vring_virtqueue *vq, struct scatterlist *sg,
+			    enum dma_data_direction direction, dma_addr_t *addr)
 {
 	if (!vq->use_dma_api) {
 		/*
@@ -366,7 +365,8 @@ static dma_addr_t vring_map_one_sg(const struct vring_virtqueue *vq,
 		 * depending on the direction.
 		 */
 		kmsan_handle_dma(sg_page(sg), sg->offset, sg->length, direction);
-		return (dma_addr_t)sg_phys(sg);
+		*addr = (dma_addr_t)sg_phys(sg);
+		return 0;
 	}
 
 	/*
@@ -374,9 +374,14 @@ static dma_addr_t vring_map_one_sg(const struct vring_virtqueue *vq,
 	 * the way it expects (we don't guarantee that the scatterlist
 	 * will exist for the lifetime of the mapping).
 	 */
-	return dma_map_page(vring_dma_dev(vq),
+	*addr = dma_map_page(vring_dma_dev(vq),
 			    sg_page(sg), sg->offset, sg->length,
 			    direction);
+
+	if (dma_mapping_error(vring_dma_dev(vq), *addr))
+		return -ENOMEM;
+
+	return 0;
 }
 
 static dma_addr_t vring_map_single(const struct vring_virtqueue *vq,
@@ -588,8 +593,9 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 
 	for (n = 0; n < out_sgs; n++) {
 		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
-			dma_addr_t addr = vring_map_one_sg(vq, sg, DMA_TO_DEVICE);
-			if (vring_mapping_error(vq, addr))
+			dma_addr_t addr;
+
+			if (vring_map_one_sg(vq, sg, DMA_TO_DEVICE, &addr))
 				goto unmap_release;
 
 			prev = i;
@@ -603,8 +609,9 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 	}
 	for (; n < (out_sgs + in_sgs); n++) {
 		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
-			dma_addr_t addr = vring_map_one_sg(vq, sg, DMA_FROM_DEVICE);
-			if (vring_mapping_error(vq, addr))
+			dma_addr_t addr;
+
+			if (vring_map_one_sg(vq, sg, DMA_FROM_DEVICE, &addr))
 				goto unmap_release;
 
 			prev = i;
@@ -1281,9 +1288,8 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 
 	for (n = 0; n < out_sgs + in_sgs; n++) {
 		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
-			addr = vring_map_one_sg(vq, sg, n < out_sgs ?
-					DMA_TO_DEVICE : DMA_FROM_DEVICE);
-			if (vring_mapping_error(vq, addr))
+			if (vring_map_one_sg(vq, sg, n < out_sgs ?
+					     DMA_TO_DEVICE : DMA_FROM_DEVICE, &addr))
 				goto unmap_release;
 
 			desc[i].flags = cpu_to_le16(n < out_sgs ?
@@ -1428,9 +1434,10 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	c = 0;
 	for (n = 0; n < out_sgs + in_sgs; n++) {
 		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
-			dma_addr_t addr = vring_map_one_sg(vq, sg, n < out_sgs ?
-					DMA_TO_DEVICE : DMA_FROM_DEVICE);
-			if (vring_mapping_error(vq, addr))
+			dma_addr_t addr;
+
+			if (vring_map_one_sg(vq, sg, n < out_sgs ?
+					     DMA_TO_DEVICE : DMA_FROM_DEVICE, &addr))
 				goto unmap_release;
 
 			flags = cpu_to_le16(vq->packed.avail_used_flags |
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
