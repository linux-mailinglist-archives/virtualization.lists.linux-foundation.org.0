Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D732447F27
	for <lists.virtualization@lfdr.de>; Mon,  8 Nov 2021 12:50:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE3BE80DCF;
	Mon,  8 Nov 2021 11:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pRDCht1eylLK; Mon,  8 Nov 2021 11:50:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B82F180DE6;
	Mon,  8 Nov 2021 11:50:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87579C0040;
	Mon,  8 Nov 2021 11:49:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EA15C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 11:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58B0740017
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 11:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHj4KpD0XOK3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 11:49:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE85D40180
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 11:49:55 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0Uvb-rcW_1636372192; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Uvb-rcW_1636372192) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 08 Nov 2021 19:49:52 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 2/3] virtio: cache indirect desc for packed
Date: Mon,  8 Nov 2021 19:49:50 +0800
Message-Id: <20211108114951.92862-3-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211108114951.92862-1-xuanzhuo@linux.alibaba.com>
References: <20211108114951.92862-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
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

In the case of using indirect, indirect desc must be allocated and
released each time, which increases a lot of cpu overhead.

Here, a cache is added for indirect. If the number of indirect desc to be
applied for is less than desc_cache_thr, the desc array with
the size of desc_cache_thr is fixed and cached for reuse.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index a4a91c497a83..76a974219ffd 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1092,7 +1092,11 @@ static void vring_unmap_desc_packed(const struct vring_virtqueue *vq,
 	}
 }
 
-static struct vring_packed_desc *alloc_indirect_packed(unsigned int total_sg,
+#define desc_cache_get_packed(vq, n, gfp) \
+	_desc_cache_get(vq, n, gfp, struct vring_packed_desc)
+
+static struct vring_packed_desc *alloc_indirect_packed(struct vring_virtqueue *vq,
+						       unsigned int total_sg,
 						       gfp_t gfp)
 {
 	struct vring_packed_desc *desc;
@@ -1104,7 +1108,7 @@ static struct vring_packed_desc *alloc_indirect_packed(unsigned int total_sg,
 	 */
 	gfp &= ~__GFP_HIGHMEM;
 
-	desc = kmalloc_array(total_sg, sizeof(struct vring_packed_desc), gfp);
+	desc = desc_cache_get_packed(vq, total_sg, gfp);
 
 	return desc;
 }
@@ -1124,7 +1128,7 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 	dma_addr_t addr;
 
 	head = vq->packed.next_avail_idx;
-	desc = alloc_indirect_packed(total_sg, gfp);
+	desc = alloc_indirect_packed(vq, total_sg, gfp);
 
 	if (unlikely(vq->vq.num_free < 1)) {
 		pr_debug("Can't add buf len 1 - avail = 0\n");
@@ -1215,7 +1219,7 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 	for (i = 0; i < err_idx; i++)
 		vring_unmap_desc_packed(vq, &desc[i]);
 
-	kfree(desc);
+	desc_cache_put(vq, desc, total_sg);
 
 	END_USE(vq);
 	return -ENOMEM;
@@ -1440,20 +1444,22 @@ static void detach_buf_packed(struct vring_virtqueue *vq,
 	}
 
 	if (vq->indirect) {
-		u32 len;
+		u32 len, n;
 
 		/* Free the indirect table, if any, now that it's unmapped. */
 		desc = state->indir_desc;
 		if (!desc)
 			return;
 
+		len = vq->packed.desc_extra[id].len;
+		n = len / sizeof(struct vring_packed_desc);
+
 		if (vq->use_dma_api) {
-			len = vq->packed.desc_extra[id].len;
-			for (i = 0; i < len / sizeof(struct vring_packed_desc);
-					i++)
+			for (i = 0; i < n; i++)
 				vring_unmap_desc_packed(vq, &desc[i]);
 		}
-		kfree(desc);
+
+		desc_cache_put(vq, desc, n);
 		state->indir_desc = NULL;
 	} else if (ctx) {
 		*ctx = state->indir_desc;
@@ -1772,6 +1778,8 @@ static struct virtqueue *vring_create_virtqueue_packed(
 		!context;
 	vq->event = virtio_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX);
 
+	desc_cache_init(vq);
+
 	if (virtio_has_feature(vdev, VIRTIO_F_ORDER_PLATFORM))
 		vq->weak_barriers = false;
 
@@ -2391,8 +2399,8 @@ void vring_del_virtqueue(struct virtqueue *_vq)
 	if (!vq->packed_ring) {
 		kfree(vq->split.desc_state);
 		kfree(vq->split.desc_extra);
-		desc_cache_free(vq);
 	}
+	desc_cache_free(vq);
 	kfree(vq);
 }
 EXPORT_SYMBOL_GPL(vring_del_virtqueue);
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
