Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5743277785B
	for <lists.virtualization@lfdr.de>; Thu, 10 Aug 2023 14:31:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9529760FA2;
	Thu, 10 Aug 2023 12:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9529760FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azPF2oTCFVJ5; Thu, 10 Aug 2023 12:31:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 633EA60BEF;
	Thu, 10 Aug 2023 12:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 633EA60BEF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C185C0DD2;
	Thu, 10 Aug 2023 12:31:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B24FC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D8B9416D1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8B9416D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uzkgs2KmWcpv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:10 +0000 (UTC)
Received: from out30-119.freemail.mail.aliyun.com
 (out30-119.freemail.mail.aliyun.com [115.124.30.119])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B5D0400FC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Aug 2023 12:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B5D0400FC
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VpTpj-6_1691670663; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VpTpj-6_1691670663) by smtp.aliyun-inc.com;
 Thu, 10 Aug 2023 20:31:03 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v13 04/12] virtio_ring: support add premapped buf
Date: Thu, 10 Aug 2023 20:30:49 +0800
Message-Id: <20230810123057.43407-5-xuanzhuo@linux.alibaba.com>
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

If the vq is the premapped mode, use the sg_dma_address() directly.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 8e81b01e0735..f9f772e85a38 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -361,6 +361,11 @@ static struct device *vring_dma_dev(const struct vring_virtqueue *vq)
 static int vring_map_one_sg(const struct vring_virtqueue *vq, struct scatterlist *sg,
 			    enum dma_data_direction direction, dma_addr_t *addr)
 {
+	if (vq->premapped) {
+		*addr = sg_dma_address(sg);
+		return 0;
+	}
+
 	if (!vq->use_dma_api) {
 		/*
 		 * If DMA is not used, KMSAN doesn't know that the scatterlist
@@ -639,8 +644,12 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 		dma_addr_t addr = vring_map_single(
 			vq, desc, total_sg * sizeof(struct vring_desc),
 			DMA_TO_DEVICE);
-		if (vring_mapping_error(vq, addr))
+		if (vring_mapping_error(vq, addr)) {
+			if (vq->premapped)
+				goto free_indirect;
+
 			goto unmap_release;
+		}
 
 		virtqueue_add_desc_split(_vq, vq->split.vring.desc,
 					 head, addr,
@@ -706,6 +715,7 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 			i = vring_unmap_one_split(vq, i);
 	}
 
+free_indirect:
 	if (indirect)
 		kfree(desc);
 
@@ -1307,8 +1317,12 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 	addr = vring_map_single(vq, desc,
 			total_sg * sizeof(struct vring_packed_desc),
 			DMA_TO_DEVICE);
-	if (vring_mapping_error(vq, addr))
+	if (vring_mapping_error(vq, addr)) {
+		if (vq->premapped)
+			goto free_desc;
+
 		goto unmap_release;
+	}
 
 	vq->packed.vring.desc[head].addr = cpu_to_le64(addr);
 	vq->packed.vring.desc[head].len = cpu_to_le32(total_sg *
@@ -1366,6 +1380,7 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 	for (i = 0; i < err_idx; i++)
 		vring_unmap_desc_packed(vq, &desc[i]);
 
+free_desc:
 	kfree(desc);
 
 	END_USE(vq);
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
