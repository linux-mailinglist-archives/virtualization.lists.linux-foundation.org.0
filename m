Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A0449C471
	for <lists.virtualization@lfdr.de>; Wed, 26 Jan 2022 08:35:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2825C415F9;
	Wed, 26 Jan 2022 07:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nd8O9XRtEOmx; Wed, 26 Jan 2022 07:35:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A13DB415E6;
	Wed, 26 Jan 2022 07:35:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 088B8C002D;
	Wed, 26 Jan 2022 07:35:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAEA8C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jan 2022 07:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB58F60ED9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jan 2022 07:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62ebF85r2N2e
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jan 2022 07:35:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15FC060EDB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Jan 2022 07:35:45 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V2ubkkL_1643182540; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V2ubkkL_1643182540) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 26 Jan 2022 15:35:41 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: [PATCH v3 07/17] virtio_ring: queue_reset: split: support enable
 reset queue
Date: Wed, 26 Jan 2022 15:35:23 +0800
Message-Id: <20220126073533.44994-8-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220126073533.44994-1-xuanzhuo@linux.alibaba.com>
References: <20220126073533.44994-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
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

The purpose of this patch is to make vring split support re-enable reset
vq.

The core idea is that when calling vring_create_virtqueue_split, use the
existing vq instead of re-allocating vq. vq is passed in through
function parameters.

Modify vring_create_virtqueue() to vring_setup_virtqueue(), and add a
new parameter vq. At the same time, add a new inline function, the
definition of the function is exactly the same as the original
vring_create_virtqueue().

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 41 ++++++++++++++++++++++++++----------
 include/linux/virtio.h       |  1 +
 include/linux/virtio_ring.h  | 37 +++++++++++++++++++++++---------
 3 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 4e1d345b0557..a93a677008ba 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -198,6 +198,15 @@ struct vring_virtqueue {
 #endif
 };
 
+static int __vring_init_virtqueue(struct virtqueue *_vq,
+				  unsigned int index,
+				  struct vring vring,
+				  struct virtio_device *vdev,
+				  bool weak_barriers,
+				  bool context,
+				  bool (*notify)(struct virtqueue *),
+				  void (*callback)(struct virtqueue *),
+				  const char *name);
 
 /*
  * Helpers.
@@ -925,9 +934,9 @@ static struct virtqueue *vring_create_virtqueue_split(
 	bool context,
 	bool (*notify)(struct virtqueue *),
 	void (*callback)(struct virtqueue *),
-	const char *name)
+	const char *name,
+	struct virtqueue *vq)
 {
-	struct virtqueue *vq;
 	void *queue = NULL;
 	dma_addr_t dma_addr;
 	size_t queue_size_in_bytes;
@@ -964,12 +973,17 @@ static struct virtqueue *vring_create_virtqueue_split(
 	queue_size_in_bytes = vring_size(num, vring_align);
 	vring_init(&vring, num, queue, vring_align);
 
-	vq = __vring_new_virtqueue(index, vring, vdev, weak_barriers, context,
-				   notify, callback, name);
 	if (!vq) {
-		vring_free_queue(vdev, queue_size_in_bytes, queue,
-				 dma_addr);
-		return NULL;
+		vq = __vring_new_virtqueue(index, vring, vdev, weak_barriers,
+					   context, notify, callback, name);
+		if (!vq)
+			goto err;
+
+	} else {
+		if (__vring_init_virtqueue(vq, index, vring, vdev,
+					   weak_barriers, context, notify,
+					   callback, name))
+			goto err;
 	}
 
 	to_vvq(vq)->split.queue_dma_addr = dma_addr;
@@ -977,6 +991,9 @@ static struct virtqueue *vring_create_virtqueue_split(
 	to_vvq(vq)->we_own_ring = true;
 
 	return vq;
+err:
+	vring_free_queue(vdev, queue_size_in_bytes, queue, dma_addr);
+	return NULL;
 }
 
 
@@ -2185,6 +2202,7 @@ static int __vring_init_virtqueue(struct virtqueue *_vq,
 	vq->vq.name = name;
 	vq->vq.num_free = vring.num;
 	vq->vq.index = index;
+	vq->vq.reset = false;
 	vq->we_own_ring = false;
 	vq->notify = notify;
 	vq->weak_barriers = weak_barriers;
@@ -2276,7 +2294,7 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
 }
 EXPORT_SYMBOL_GPL(__vring_new_virtqueue);
 
-struct virtqueue *vring_create_virtqueue(
+struct virtqueue *vring_setup_virtqueue(
 	unsigned int index,
 	unsigned int num,
 	unsigned int vring_align,
@@ -2286,7 +2304,8 @@ struct virtqueue *vring_create_virtqueue(
 	bool context,
 	bool (*notify)(struct virtqueue *),
 	void (*callback)(struct virtqueue *),
-	const char *name)
+	const char *name,
+	struct virtqueue *vq)
 {
 
 	if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED))
@@ -2296,9 +2315,9 @@ struct virtqueue *vring_create_virtqueue(
 
 	return vring_create_virtqueue_split(index, num, vring_align,
 			vdev, weak_barriers, may_reduce_num,
-			context, notify, callback, name);
+			context, notify, callback, name, vq);
 }
-EXPORT_SYMBOL_GPL(vring_create_virtqueue);
+EXPORT_SYMBOL_GPL(vring_setup_virtqueue);
 
 /* Only available for split ring */
 struct virtqueue *vring_new_virtqueue(unsigned int index,
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 41edbc01ffa4..98c89cbeafa1 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -32,6 +32,7 @@ struct virtqueue {
 	unsigned int index;
 	unsigned int num_free;
 	void *priv;
+	bool reset;
 };
 
 int virtqueue_add_outbuf(struct virtqueue *vq,
diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index b485b13fa50b..e90323fce4bf 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -65,16 +65,33 @@ struct virtqueue;
  * expected.  The caller should query virtqueue_get_vring_size to learn
  * the actual size of the ring.
  */
-struct virtqueue *vring_create_virtqueue(unsigned int index,
-					 unsigned int num,
-					 unsigned int vring_align,
-					 struct virtio_device *vdev,
-					 bool weak_barriers,
-					 bool may_reduce_num,
-					 bool ctx,
-					 bool (*notify)(struct virtqueue *vq),
-					 void (*callback)(struct virtqueue *vq),
-					 const char *name);
+struct virtqueue *vring_setup_virtqueue(unsigned int index,
+					unsigned int num,
+					unsigned int vring_align,
+					struct virtio_device *vdev,
+					bool weak_barriers,
+					bool may_reduce_num,
+					bool ctx,
+					bool (*notify)(struct virtqueue *vq),
+					void (*callback)(struct virtqueue *vq),
+					const char *name,
+					struct virtqueue *vq);
+
+static inline struct virtqueue *vring_create_virtqueue(unsigned int index,
+						       unsigned int num,
+						       unsigned int vring_align,
+						       struct virtio_device *vdev,
+						       bool weak_barriers,
+						       bool may_reduce_num,
+						       bool ctx,
+						       bool (*notify)(struct virtqueue *vq),
+						       void (*callback)(struct virtqueue *vq),
+						       const char *name)
+{
+	return vring_setup_virtqueue(index, num, vring_align, vdev,
+				     weak_barriers, may_reduce_num, ctx,
+				     notify, callback, name, NULL);
+}
 
 /* Creates a virtqueue with a custom layout. */
 struct virtqueue *__vring_new_virtqueue(unsigned int index,
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
