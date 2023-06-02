Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D18DF71FD9B
	for <lists.virtualization@lfdr.de>; Fri,  2 Jun 2023 11:22:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 616D74175C;
	Fri,  2 Jun 2023 09:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 616D74175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SS_IPdN3zHz2; Fri,  2 Jun 2023 09:22:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 26C534175E;
	Fri,  2 Jun 2023 09:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26C534175E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F9C8C0029;
	Fri,  2 Jun 2023 09:22:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C4A0C008A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 09:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2782B41767
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 09:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2782B41767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZqcyfNRT3wN
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 09:22:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEDAB4175C
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEDAB4175C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 09:22:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0Vk9OIhx_1685697731; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vk9OIhx_1685697731) by smtp.aliyun-inc.com;
 Fri, 02 Jun 2023 17:22:12 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v10 04/10] virtio_ring: packed: support add premapped buf
Date: Fri,  2 Jun 2023 17:22:00 +0800
Message-Id: <20230602092206.50108-5-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230602092206.50108-1-xuanzhuo@linux.alibaba.com>
References: <20230602092206.50108-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 3bf1b1dbeb8a
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
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

If the vq is the premapped mode, use the sg_dma_address() directly.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 18212c3e056b..dc109fbc05a5 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1299,9 +1299,13 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 
 	for (n = 0; n < out_sgs + in_sgs; n++) {
 		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
-			if (vring_map_one_sg(vq, sg, n < out_sgs ?
-					     DMA_TO_DEVICE : DMA_FROM_DEVICE, &addr))
-				goto unmap_release;
+			if (vq->premapped) {
+				addr = sg_dma_address(sg);
+			} else {
+				if (vring_map_one_sg(vq, sg, n < out_sgs ?
+						     DMA_TO_DEVICE : DMA_FROM_DEVICE, &addr))
+					goto unmap_release;
+			}
 
 			desc[i].flags = cpu_to_le16(n < out_sgs ?
 						0 : VRING_DESC_F_WRITE);
@@ -1369,10 +1373,12 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 	return 0;
 
 unmap_release:
-	err_idx = i;
+	if (!vq->premapped) {
+		err_idx = i;
 
-	for (i = 0; i < err_idx; i++)
-		vring_unmap_desc_packed(vq, &desc[i]);
+		for (i = 0; i < err_idx; i++)
+			vring_unmap_desc_packed(vq, &desc[i]);
+	}
 
 	kfree(desc);
 
@@ -1447,9 +1453,13 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
 			dma_addr_t addr;
 
-			if (vring_map_one_sg(vq, sg, n < out_sgs ?
-					     DMA_TO_DEVICE : DMA_FROM_DEVICE, &addr))
-				goto unmap_release;
+			if (vq->premapped) {
+				addr = sg_dma_address(sg);
+			} else {
+				if (vring_map_one_sg(vq, sg, n < out_sgs ?
+						     DMA_TO_DEVICE : DMA_FROM_DEVICE, &addr))
+					goto unmap_release;
+			}
 
 			flags = cpu_to_le16(vq->packed.avail_used_flags |
 				    (++c == total_sg ? 0 : VRING_DESC_F_NEXT) |
@@ -1512,11 +1522,17 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	return 0;
 
 unmap_release:
+	vq->packed.avail_used_flags = avail_used_flags;
+
+	if (vq->premapped) {
+		END_USE(vq);
+		return -EIO;
+	}
+
 	err_idx = i;
 	i = head;
 	curr = vq->free_head;
 
-	vq->packed.avail_used_flags = avail_used_flags;
 
 	for (n = 0; n < total_sg; n++) {
 		if (i == err_idx)
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
