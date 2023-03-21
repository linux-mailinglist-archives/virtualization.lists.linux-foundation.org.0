Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC876C2DF7
	for <lists.virtualization@lfdr.de>; Tue, 21 Mar 2023 10:35:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ECD281E7E;
	Tue, 21 Mar 2023 09:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ECD281E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzsVsbOyYom5; Tue, 21 Mar 2023 09:35:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2123581F14;
	Tue, 21 Mar 2023 09:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2123581F14
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CEB6C007C;
	Tue, 21 Mar 2023 09:35:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45FCFC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 09:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A60040A09
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 09:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A60040A09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHflVIljjrAs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 09:35:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED6C5409EE
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED6C5409EE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 09:35:15 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VeMeIRs_1679391310; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VeMeIRs_1679391310) by smtp.aliyun-inc.com;
 Tue, 21 Mar 2023 17:35:10 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v3 05/11] virtio_ring: packed: support premapped
Date: Tue, 21 Mar 2023 17:35:00 +0800
Message-Id: <20230321093506.6546-6-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230321093506.6546-1-xuanzhuo@linux.alibaba.com>
References: <20230321093506.6546-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: fa5bd5b2113c
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

virtio core only supports virtual addresses, dma is completed in virtio
core.

In some scenarios (such as the AF_XDP), the memory is allocated
and DMA mapping is completed in advance, so it is necessary for us to
support passing the DMA address to virtio core.

Drives can use sg->dma_address to pass the mapped dma address to virtio
core. If one sg->dma_address is used then all sgs must use
sg->dma_address, otherwise all must be null when passing it to the APIs
of virtio.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index be2ff96964c3..95209bc61072 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -78,6 +78,7 @@ struct vring_desc_state_packed {
 	struct vring_packed_desc *indir_desc; /* Indirect descriptor, if any. */
 	u16 num;			/* Descriptor list length. */
 	u16 last;			/* The last desc state in a list. */
+	bool map_inter;			/* Do dma map internally. */
 };
 
 struct vring_desc_extra {
@@ -1259,7 +1260,8 @@ static inline u16 packed_last_used(u16 last_used_idx)
 }
 
 static void vring_unmap_extra_packed(const struct vring_virtqueue *vq,
-				     struct vring_desc_extra *extra)
+				     struct vring_desc_extra *extra,
+				     bool map_inter)
 {
 	u16 flags;
 
@@ -1274,6 +1276,9 @@ static void vring_unmap_extra_packed(const struct vring_virtqueue *vq,
 				 (flags & VRING_DESC_F_WRITE) ?
 				 DMA_FROM_DEVICE : DMA_TO_DEVICE);
 	} else {
+		if (!map_inter)
+			return;
+
 		dma_unmap_page(vring_dma_dev(vq),
 			       extra->addr, extra->len,
 			       (flags & VRING_DESC_F_WRITE) ?
@@ -1439,6 +1444,7 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	unsigned int i, n, c, descs_used;
 	__le16 head_flags, flags;
 	u16 head, id, prev, curr;
+	bool map_inter;
 	int err;
 
 	START_USE(vq);
@@ -1484,7 +1490,8 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	id = vq->free_head;
 	BUG_ON(id == vq->packed.vring.num);
 
-	if (virtqueue_map_sgs(vq, sgs, total_sg, out_sgs, in_sgs))
+	map_inter = !sgs[0]->dma_address;
+	if (map_inter && virtqueue_map_sgs(vq, sgs, total_sg, out_sgs, in_sgs))
 		return -ENOMEM;
 
 	curr = id;
@@ -1536,6 +1543,7 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	vq->packed.desc_state[id].data = data;
 	vq->packed.desc_state[id].indir_desc = ctx;
 	vq->packed.desc_state[id].last = prev;
+	vq->packed.desc_state[id].map_inter = map_inter;
 
 	/*
 	 * A driver MUST NOT make the first descriptor in the list
@@ -1621,7 +1629,8 @@ static void detach_buf_packed(struct vring_virtqueue *vq,
 		curr = id;
 		for (i = 0; i < state->num; i++) {
 			vring_unmap_extra_packed(vq,
-						 &vq->packed.desc_extra[curr]);
+						 &vq->packed.desc_extra[curr],
+						 state->map_inter);
 			curr = vq->packed.desc_extra[curr].next;
 		}
 	}
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
