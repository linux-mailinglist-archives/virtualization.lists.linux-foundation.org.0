Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D736FC152
	for <lists.virtualization@lfdr.de>; Tue,  9 May 2023 10:09:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82C3C844B3;
	Tue,  9 May 2023 08:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C3C844B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgT8NwQk6Alv; Tue,  9 May 2023 08:09:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4B4AC84450;
	Tue,  9 May 2023 08:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B4AC84450
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DB51C008B;
	Tue,  9 May 2023 08:09:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37B83C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 May 2023 08:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DE7F41DC3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 May 2023 08:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DE7F41DC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Og4sR7awlDrt
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 May 2023 08:09:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD0C641DB7
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD0C641DB7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 May 2023 08:09:11 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0ViAH4l2_1683619744; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0ViAH4l2_1683619744) by smtp.aliyun-inc.com;
 Tue, 09 May 2023 16:09:05 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v8 02/12] virtio_ring: packed: separate dma codes
Date: Tue,  9 May 2023 16:08:52 +0800
Message-Id: <20230509080902.104619-3-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230509080902.104619-1-xuanzhuo@linux.alibaba.com>
References: <20230509080902.104619-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 3c61b1a50a99
Cc: Christoph Hellwig <hch@infradead.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>
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

DMA-related logic is separated from the virtqueue_add_packed(). DMA
address will be saved as sg->dma_address, then virtqueue_add_packed()
will use it directly. Unmap operation will be simpler.

The purpose of this is to facilitate subsequent support to receive
dma address mapped by drivers.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 39 +++++++++---------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index f243fea8987b..e5fa97c91f03 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1448,9 +1448,9 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	struct vring_virtqueue *vq = to_vvq(_vq);
 	struct vring_packed_desc *desc;
 	struct scatterlist *sg;
-	unsigned int i, n, c, descs_used, err_idx;
+	unsigned int i, n, c, descs_used;
 	__le16 head_flags, flags;
-	u16 head, id, prev, curr, avail_used_flags;
+	u16 head, id, prev, curr;
 	int err;
 
 	START_USE(vq);
@@ -1479,7 +1479,6 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	}
 
 	head = vq->packed.next_avail_idx;
-	avail_used_flags = vq->packed.avail_used_flags;
 
 	WARN_ON_ONCE(total_sg > vq->packed.vring.num && !vq->indirect);
 
@@ -1497,15 +1496,15 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	id = vq->free_head;
 	BUG_ON(id == vq->packed.vring.num);
 
+	if (virtqueue_map_sgs(vq, sgs, total_sg, out_sgs, in_sgs)) {
+		END_USE(vq);
+		return -EIO;
+	}
+
 	curr = id;
 	c = 0;
 	for (n = 0; n < out_sgs + in_sgs; n++) {
 		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
-			dma_addr_t addr = vring_map_one_sg(vq, sg, n < out_sgs ?
-					DMA_TO_DEVICE : DMA_FROM_DEVICE);
-			if (vring_mapping_error(vq, addr))
-				goto unmap_release;
-
 			flags = cpu_to_le16(vq->packed.avail_used_flags |
 				    (++c == total_sg ? 0 : VRING_DESC_F_NEXT) |
 				    (n < out_sgs ? 0 : VRING_DESC_F_WRITE));
@@ -1514,12 +1513,12 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 			else
 				desc[i].flags = flags;
 
-			desc[i].addr = cpu_to_le64(addr);
+			desc[i].addr = cpu_to_le64(vring_sg_address(sg));
 			desc[i].len = cpu_to_le32(sg->length);
 			desc[i].id = cpu_to_le16(id);
 
 			if (unlikely(vq->use_dma_api)) {
-				vq->packed.desc_extra[curr].addr = addr;
+				vq->packed.desc_extra[curr].addr = vring_sg_address(sg);
 				vq->packed.desc_extra[curr].len = sg->length;
 				vq->packed.desc_extra[curr].flags =
 					le16_to_cpu(flags);
@@ -1565,26 +1564,6 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	END_USE(vq);
 
 	return 0;
-
-unmap_release:
-	err_idx = i;
-	i = head;
-	curr = vq->free_head;
-
-	vq->packed.avail_used_flags = avail_used_flags;
-
-	for (n = 0; n < total_sg; n++) {
-		if (i == err_idx)
-			break;
-		vring_unmap_extra_packed(vq, &vq->packed.desc_extra[curr]);
-		curr = vq->packed.desc_extra[curr].next;
-		i++;
-		if (i >= vq->packed.vring.num)
-			i = 0;
-	}
-
-	END_USE(vq);
-	return -EIO;
 }
 
 static bool virtqueue_kick_prepare_packed(struct virtqueue *_vq)
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
