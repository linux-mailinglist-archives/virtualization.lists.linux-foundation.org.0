Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B73419293
	for <lists.virtualization@lfdr.de>; Mon, 27 Sep 2021 12:54:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A675040256;
	Mon, 27 Sep 2021 10:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cK9Hv2H9HPim; Mon, 27 Sep 2021 10:54:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5B4124048F;
	Mon, 27 Sep 2021 10:54:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD464C0022;
	Mon, 27 Sep 2021 10:54:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00584C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 10:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E33604035B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 10:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s9YZ-hDvcDKN
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 10:54:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C91C940256
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 10:54:26 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R341e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0Upn7Jkm_1632740053; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Upn7Jkm_1632740053) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 27 Sep 2021 18:54:13 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2 2/2] virtio_ring: check desc == NULL when packed and
 indirect
Date: Mon, 27 Sep 2021 18:54:12 +0800
Message-Id: <20210927105412.18579-3-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210927105412.18579-1-xuanzhuo@linux.alibaba.com>
References: <20210927105412.18579-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Cc: "David S. Miller" <davem@davemloft.net>, Tiwei Bie <tiwei.bie@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

In the case of packed, use indirect desc, since desc is allocated by
kmalloc_array(), we should check whether its return value is NULL.

This patch alloc desc inside virtqueue_add_packe(), if desc == NULL,
fall back to not using indirect.

Fixes: 1ce9e6055fa ("virtio_ring: introduce packed ring support")
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 91a46c4da87d..62323c27bfe4 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1051,20 +1051,19 @@ static struct vring_packed_desc *alloc_indirect_packed(unsigned int total_sg,
 
 static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 					 struct scatterlist *sgs[],
+					 struct vring_packed_desc *desc,
 					 unsigned int total_sg,
 					 unsigned int out_sgs,
 					 unsigned int in_sgs,
 					 void *data,
 					 gfp_t gfp)
 {
-	struct vring_packed_desc *desc;
 	struct scatterlist *sg;
 	unsigned int i, n, err_idx;
 	u16 head, id;
 	dma_addr_t addr;
 
 	head = vq->packed.next_avail_idx;
-	desc = alloc_indirect_packed(total_sg, gfp);
 
 	if (unlikely(vq->vq.num_free < 1)) {
 		pr_debug("Can't add buf len 1 - avail = 0\n");
@@ -1191,9 +1190,14 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 
 	BUG_ON(total_sg == 0);
 
-	if (virtqueue_use_indirect(_vq, total_sg))
-		return virtqueue_add_indirect_packed(vq, sgs, total_sg,
-				out_sgs, in_sgs, data, gfp);
+	if (virtqueue_use_indirect(_vq, total_sg)) {
+		desc = alloc_indirect_packed(total_sg, gfp);
+		if (desc)
+			return virtqueue_add_indirect_packed(vq, sgs, desc,
+							     total_sg,
+							     out_sgs, in_sgs,
+							     data, gfp);
+	}
 
 	head = vq->packed.next_avail_idx;
 	avail_used_flags = vq->packed.avail_used_flags;
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
