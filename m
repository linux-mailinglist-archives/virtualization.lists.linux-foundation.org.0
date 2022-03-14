Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id C23324D7EB4
	for <lists.virtualization@lfdr.de>; Mon, 14 Mar 2022 10:35:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 501A860EE4;
	Mon, 14 Mar 2022 09:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-Kt4RGn9e6v; Mon, 14 Mar 2022 09:35:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 08E4F60EC6;
	Mon, 14 Mar 2022 09:35:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 786B8C0084;
	Mon, 14 Mar 2022 09:35:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53DBAC0089
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 09:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36419818B5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 09:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4UBBfkMEfv0Y
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 09:35:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F25B83381
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 09:35:10 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R691e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V77y4Jt_1647250507; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V77y4Jt_1647250507) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 14 Mar 2022 17:35:08 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v8 14/16] virtio_ring: packed: extract the logic of vq init
Date: Mon, 14 Mar 2022 17:34:53 +0800
Message-Id: <20220314093455.34707-15-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220314093455.34707-1-xuanzhuo@linux.alibaba.com>
References: <20220314093455.34707-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: d6feaa0fb7e7
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

Separate the logic of initializing vq, and subsequent patches will call
it separately.

The characteristic of this part of the logic is that it does not depend
on the information passed by the upper layer, and can be called
repeatedly.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 69 ++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 31 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index e8d4de25e90b..73abc9e472ce 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1879,6 +1879,43 @@ static void vring_virtqueue_attach_packed(struct vring_virtqueue *vq,
 	vq->packed.desc_extra = vring->desc_extra;
 }
 
+static void vring_virtqueue_init_packed(struct vring_virtqueue *vq,
+					struct virtio_device *vdev)
+{
+	vq->we_own_ring = true;
+	vq->broken = false;
+	vq->last_used_idx = 0;
+	vq->event_triggered = false;
+	vq->num_added = 0;
+	vq->packed_ring = true;
+	vq->use_dma_api = vring_use_dma_api(vdev);
+#ifdef DEBUG
+	vq->in_use = false;
+	vq->last_add_time_valid = false;
+#endif
+
+	vq->event = virtio_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX);
+
+	if (virtio_has_feature(vdev, VIRTIO_F_ORDER_PLATFORM))
+		vq->weak_barriers = false;
+
+	vq->packed.next_avail_idx = 0;
+	vq->packed.avail_wrap_counter = 1;
+	vq->packed.used_wrap_counter = 1;
+	vq->packed.event_flags_shadow = 0;
+	vq->packed.avail_used_flags = 1 << VRING_PACKED_DESC_F_AVAIL;
+
+	/* Put everything in free lists. */
+	vq->free_head = 0;
+
+	/* No callback?  Tell other side not to bother us. */
+	if (!vq->vq.callback) {
+		vq->packed.event_flags_shadow = VRING_PACKED_EVENT_FLAG_DISABLE;
+		vq->packed.vring.driver->flags =
+			cpu_to_le16(vq->packed.event_flags_shadow);
+	}
+}
+
 static struct virtqueue *vring_create_virtqueue_packed(
 	unsigned int index,
 	unsigned int num,
@@ -1906,48 +1943,18 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	vq->vq.vdev = vdev;
 	vq->vq.name = name;
 	vq->vq.index = index;
-	vq->we_own_ring = true;
 	vq->notify = notify;
 	vq->weak_barriers = weak_barriers;
-	vq->broken = false;
-	vq->last_used_idx = 0;
-	vq->event_triggered = false;
-	vq->num_added = 0;
-	vq->packed_ring = true;
-	vq->use_dma_api = vring_use_dma_api(vdev);
-#ifdef DEBUG
-	vq->in_use = false;
-	vq->last_add_time_valid = false;
-#endif
 
 	vq->indirect = virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC) &&
 		!context;
-	vq->event = virtio_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX);
-
-	if (virtio_has_feature(vdev, VIRTIO_F_ORDER_PLATFORM))
-		vq->weak_barriers = false;
-
-	vq->packed.next_avail_idx = 0;
-	vq->packed.avail_wrap_counter = 1;
-	vq->packed.used_wrap_counter = 1;
-	vq->packed.event_flags_shadow = 0;
-	vq->packed.avail_used_flags = 1 << VRING_PACKED_DESC_F_AVAIL;
 
 	err = vring_alloc_state_extra_packed(num, &vring);
 	if (err)
 		goto err_state_extra;
 
 	vring_virtqueue_attach_packed(vq, &vring);
-
-	/* Put everything in free lists. */
-	vq->free_head = 0;
-
-	/* No callback?  Tell other side not to bother us. */
-	if (!callback) {
-		vq->packed.event_flags_shadow = VRING_PACKED_EVENT_FLAG_DISABLE;
-		vq->packed.vring.driver->flags =
-			cpu_to_le16(vq->packed.event_flags_shadow);
-	}
+	vring_virtqueue_init_packed(vq, vdev);
 
 	spin_lock(&vdev->vqs_list_lock);
 	list_add_tail(&vq->vq.list, &vdev->vqs);
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
