Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0746C9A69
	for <lists.virtualization@lfdr.de>; Mon, 27 Mar 2023 06:05:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3444581E3A;
	Mon, 27 Mar 2023 04:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3444581E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QE32ddHf4Pun; Mon, 27 Mar 2023 04:05:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C1FE481E45;
	Mon, 27 Mar 2023 04:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1FE481E45
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD2EEC0090;
	Mon, 27 Mar 2023 04:05:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38B42C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Mar 2023 04:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 213BD60E50
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Mar 2023 04:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 213BD60E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMxeUACPI-5T
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Mar 2023 04:05:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 987F660742
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 987F660742
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Mar 2023 04:05:42 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0Vef7jFx_1679889937; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vef7jFx_1679889937) by smtp.aliyun-inc.com;
 Mon, 27 Mar 2023 12:05:37 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v6 01/11] virtio_ring: split: separate dma codes
Date: Mon, 27 Mar 2023 12:05:26 +0800
Message-Id: <20230327040536.48338-2-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230327040536.48338-1-xuanzhuo@linux.alibaba.com>
References: <20230327040536.48338-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 47bb36a6322f
Cc: "Michael S. Tsirkin" <mst@redhat.com>
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

DMA-related logic is separated from the virtqueue_add_split() to
one new function. DMA address will be saved as sg->dma_address if
use_dma_api is true, then virtqueue_add_split() will use it directly.
Unmap operation will be simpler.

The purpose of this is to facilitate subsequent support to receive
dma address mapped by drivers.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 122 +++++++++++++++++++++++++++--------
 1 file changed, 94 insertions(+), 28 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 41144b5246a8..2aafb7da793d 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -379,6 +379,14 @@ static dma_addr_t vring_map_one_sg(const struct vring_virtqueue *vq,
 			    direction);
 }
 
+static dma_addr_t vring_sg_address(struct scatterlist *sg)
+{
+	if (sg->dma_address)
+		return sg->dma_address;
+
+	return (dma_addr_t)sg_phys(sg);
+}
+
 static dma_addr_t vring_map_single(const struct vring_virtqueue *vq,
 				   void *cpu_addr, size_t size,
 				   enum dma_data_direction direction)
@@ -520,6 +528,80 @@ static inline unsigned int virtqueue_add_desc_split(struct virtqueue *vq,
 	return next;
 }
 
+static void virtqueue_unmap_sgs(struct vring_virtqueue *vq,
+				struct scatterlist *sgs[],
+				unsigned int total_sg,
+				unsigned int out_sgs,
+				unsigned int in_sgs)
+{
+	struct scatterlist *sg;
+	unsigned int n;
+
+	if (!vq->use_dma_api)
+		return;
+
+	for (n = 0; n < out_sgs; n++) {
+		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
+			if (!sg->dma_address)
+				return;
+
+			dma_unmap_page(vring_dma_dev(vq), sg->dma_address,
+				       sg->length, DMA_TO_DEVICE);
+		}
+	}
+
+	for (; n < (out_sgs + in_sgs); n++) {
+		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
+			if (!sg->dma_address)
+				return;
+
+			dma_unmap_page(vring_dma_dev(vq), sg->dma_address,
+				       sg->length, DMA_FROM_DEVICE);
+		}
+	}
+}
+
+static int virtqueue_map_sgs(struct vring_virtqueue *vq,
+			     struct scatterlist *sgs[],
+			     unsigned int total_sg,
+			     unsigned int out_sgs,
+			     unsigned int in_sgs)
+{
+	struct scatterlist *sg;
+	unsigned int n;
+
+	if (!vq->use_dma_api)
+		return 0;
+
+	for (n = 0; n < out_sgs; n++) {
+		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
+			dma_addr_t addr = vring_map_one_sg(vq, sg, DMA_TO_DEVICE);
+
+			if (vring_mapping_error(vq, addr))
+				goto err;
+
+			sg->dma_address = addr;
+		}
+	}
+
+	for (; n < (out_sgs + in_sgs); n++) {
+		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
+			dma_addr_t addr = vring_map_one_sg(vq, sg, DMA_FROM_DEVICE);
+
+			if (vring_mapping_error(vq, addr))
+				goto err;
+
+			sg->dma_address = addr;
+		}
+	}
+
+	return 0;
+
+err:
+	virtqueue_unmap_sgs(vq, sgs, total_sg, out_sgs, in_sgs);
+	return -ENOMEM;
+}
+
 static inline int virtqueue_add_split(struct virtqueue *_vq,
 				      struct scatterlist *sgs[],
 				      unsigned int total_sg,
@@ -532,9 +614,9 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 	struct vring_virtqueue *vq = to_vvq(_vq);
 	struct scatterlist *sg;
 	struct vring_desc *desc;
-	unsigned int i, n, avail, descs_used, prev, err_idx;
-	int head;
+	unsigned int i, n, avail, descs_used, prev;
 	bool indirect;
+	int head;
 
 	START_USE(vq);
 
@@ -586,32 +668,30 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 		return -ENOSPC;
 	}
 
+	if (virtqueue_map_sgs(vq, sgs, total_sg, out_sgs, in_sgs))
+		goto err_map;
+
 	for (n = 0; n < out_sgs; n++) {
 		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
-			dma_addr_t addr = vring_map_one_sg(vq, sg, DMA_TO_DEVICE);
-			if (vring_mapping_error(vq, addr))
-				goto unmap_release;
-
 			prev = i;
 			/* Note that we trust indirect descriptor
 			 * table since it use stream DMA mapping.
 			 */
-			i = virtqueue_add_desc_split(_vq, desc, i, addr, sg->length,
+			i = virtqueue_add_desc_split(_vq, desc, i,
+						     vring_sg_address(sg),
+						     sg->length,
 						     VRING_DESC_F_NEXT,
 						     indirect);
 		}
 	}
 	for (; n < (out_sgs + in_sgs); n++) {
 		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
-			dma_addr_t addr = vring_map_one_sg(vq, sg, DMA_FROM_DEVICE);
-			if (vring_mapping_error(vq, addr))
-				goto unmap_release;
-
 			prev = i;
 			/* Note that we trust indirect descriptor
 			 * table since it use stream DMA mapping.
 			 */
-			i = virtqueue_add_desc_split(_vq, desc, i, addr,
+			i = virtqueue_add_desc_split(_vq, desc, i,
+						     vring_sg_address(sg),
 						     sg->length,
 						     VRING_DESC_F_NEXT |
 						     VRING_DESC_F_WRITE,
@@ -679,23 +759,9 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 	return 0;
 
 unmap_release:
-	err_idx = i;
-
-	if (indirect)
-		i = 0;
-	else
-		i = head;
-
-	for (n = 0; n < total_sg; n++) {
-		if (i == err_idx)
-			break;
-		if (indirect) {
-			vring_unmap_one_split_indirect(vq, &desc[i]);
-			i = virtio16_to_cpu(_vq->vdev, desc[i].next);
-		} else
-			i = vring_unmap_one_split(vq, i);
-	}
+	virtqueue_unmap_sgs(vq, sgs, total_sg, out_sgs, in_sgs);
 
+err_map:
 	if (indirect)
 		kfree(desc);
 
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
