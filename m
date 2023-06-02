Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D786071FD9D
	for <lists.virtualization@lfdr.de>; Fri,  2 Jun 2023 11:22:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39376615CB;
	Fri,  2 Jun 2023 09:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39376615CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYyjXpOxdOs6; Fri,  2 Jun 2023 09:22:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B41B0615BE;
	Fri,  2 Jun 2023 09:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B41B0615BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C635C0037;
	Fri,  2 Jun 2023 09:22:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17959C0037
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 09:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8655E41777
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 09:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8655E41777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZSvceHCQ__W
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 09:22:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 067E54175E
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 067E54175E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 09:22:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R691e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0Vk9LPA5_1685697732; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vk9LPA5_1685697732) by smtp.aliyun-inc.com;
 Fri, 02 Jun 2023 17:22:13 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v10 05/10] virtio_ring: split-detach: support return dma
 info to driver
Date: Fri,  2 Jun 2023 17:22:01 +0800
Message-Id: <20230602092206.50108-6-xuanzhuo@linux.alibaba.com>
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

Under the premapped mode, the driver needs to unmap the DMA address
after receiving the buffer. The virtio core records the DMA address,
so the driver needs a way to get the dma info from the virtio core.

A straightforward approach is to pass an array to the virtio core when
calling virtqueue_get_buf(). However, it is not feasible when there are
multiple DMA addresses in the descriptor chain, and the array size is
unknown.

To solve this problem, a helper be introduced. After calling
virtqueue_get_buf(), the driver can call the helper to
retrieve a dma info. If the helper function returns -EAGAIN, it means
that there are more DMA addresses to be processed, and the driver should
call the helper function again. To keep track of the current position in
the chain, a cursor must be passed to the helper function, which is
initialized by virtqueue_get_buf().

Some processes are done inside this helper, so this helper MUST be
called under the premapped mode.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 118 ++++++++++++++++++++++++++++++++---
 include/linux/virtio.h       |  11 ++++
 2 files changed, 119 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index dc109fbc05a5..cdc4349f6066 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -754,8 +754,95 @@ static bool virtqueue_kick_prepare_split(struct virtqueue *_vq)
 	return needs_kick;
 }
 
-static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
-			     void **ctx)
+static void detach_cursor_init_split(struct vring_virtqueue *vq,
+				     struct virtqueue_detach_cursor *cursor, u16 head)
+{
+	struct vring_desc_extra *extra;
+
+	extra = &vq->split.desc_extra[head];
+
+	/* Clear data ptr. */
+	vq->split.desc_state[head].data = NULL;
+
+	cursor->head = head;
+	cursor->done = 0;
+
+	if (extra->flags & VRING_DESC_F_INDIRECT) {
+		cursor->num = extra->len / sizeof(struct vring_desc);
+		cursor->indirect = true;
+		cursor->pos = 0;
+
+		vring_unmap_one_split(vq, head);
+
+		extra->next = vq->free_head;
+
+		vq->free_head = head;
+
+		/* Plus final descriptor */
+		vq->vq.num_free++;
+
+	} else {
+		cursor->indirect = false;
+		cursor->pos = head;
+	}
+}
+
+static int virtqueue_detach_split(struct virtqueue *_vq, struct virtqueue_detach_cursor *cursor,
+				  dma_addr_t *addr, u32 *len, enum dma_data_direction *dir)
+{
+	struct vring_virtqueue *vq = to_vvq(_vq);
+	__virtio16 nextflag = cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F_NEXT);
+	int rc = -EAGAIN;
+
+	if (unlikely(cursor->done))
+		return -EINVAL;
+
+	if (!cursor->indirect) {
+		struct vring_desc_extra *extra;
+		unsigned int i;
+
+		i = cursor->pos;
+
+		extra = &vq->split.desc_extra[i];
+
+		if (vq->split.vring.desc[i].flags & nextflag) {
+			cursor->pos = extra->next;
+		} else {
+			extra->next = vq->free_head;
+			vq->free_head = cursor->head;
+			cursor->done = true;
+			rc = 0;
+		}
+
+		*addr = extra->addr;
+		*len = extra->len;
+		*dir = (extra->flags & VRING_DESC_F_WRITE) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+
+		vq->vq.num_free++;
+
+	} else {
+		struct vring_desc *indir_desc, *desc;
+		u16 flags;
+
+		indir_desc = vq->split.desc_state[cursor->head].indir_desc;
+		desc = &indir_desc[cursor->pos];
+
+		flags = virtio16_to_cpu(vq->vq.vdev, desc->flags);
+		*addr = virtio64_to_cpu(vq->vq.vdev, desc->addr);
+		*len = virtio32_to_cpu(vq->vq.vdev, desc->len);
+		*dir = (flags & VRING_DESC_F_WRITE) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+
+		if (++cursor->pos == cursor->num) {
+			kfree(indir_desc);
+			cursor->done = true;
+			return 0;
+		}
+	}
+
+	return rc;
+}
+
+static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head)
 {
 	unsigned int i, j;
 	__virtio16 nextflag = cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F_NEXT);
@@ -799,8 +886,6 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
 
 		kfree(indir_desc);
 		vq->split.desc_state[head].indir_desc = NULL;
-	} else if (ctx) {
-		*ctx = vq->split.desc_state[head].indir_desc;
 	}
 }
 
@@ -812,7 +897,8 @@ static bool more_used_split(const struct vring_virtqueue *vq)
 
 static void *virtqueue_get_buf_ctx_split(struct virtqueue *_vq,
 					 unsigned int *len,
-					 void **ctx)
+					 void **ctx,
+					 struct virtqueue_detach_cursor *cursor)
 {
 	struct vring_virtqueue *vq = to_vvq(_vq);
 	void *ret;
@@ -852,7 +938,15 @@ static void *virtqueue_get_buf_ctx_split(struct virtqueue *_vq,
 
 	/* detach_buf_split clears data, so grab it now. */
 	ret = vq->split.desc_state[i].data;
-	detach_buf_split(vq, i, ctx);
+
+	if (!vq->indirect && ctx)
+		*ctx = vq->split.desc_state[i].indir_desc;
+
+	if (vq->premapped)
+		detach_cursor_init_split(vq, cursor, i);
+	else
+		detach_buf_split(vq, i);
+
 	vq->last_used_idx++;
 	/* If we expect an interrupt for the next entry, tell host
 	 * by writing event index and flush out the write before
@@ -961,7 +1055,8 @@ static bool virtqueue_enable_cb_delayed_split(struct virtqueue *_vq)
 	return true;
 }
 
-static void *virtqueue_detach_unused_buf_split(struct virtqueue *_vq)
+static void *virtqueue_detach_unused_buf_split(struct virtqueue *_vq,
+					       struct virtqueue_detach_cursor *cursor)
 {
 	struct vring_virtqueue *vq = to_vvq(_vq);
 	unsigned int i;
@@ -974,7 +1069,10 @@ static void *virtqueue_detach_unused_buf_split(struct virtqueue *_vq)
 			continue;
 		/* detach_buf_split clears data, so grab it now. */
 		buf = vq->split.desc_state[i].data;
-		detach_buf_split(vq, i, NULL);
+		if (vq->premapped)
+			detach_cursor_init_split(vq, cursor, i);
+		else
+			detach_buf_split(vq, i);
 		vq->split.avail_idx_shadow--;
 		vq->split.vring.avail->idx = cpu_to_virtio16(_vq->vdev,
 				vq->split.avail_idx_shadow);
@@ -2361,7 +2459,7 @@ void *virtqueue_get_buf_ctx(struct virtqueue *_vq, unsigned int *len,
 	struct vring_virtqueue *vq = to_vvq(_vq);
 
 	return vq->packed_ring ? virtqueue_get_buf_ctx_packed(_vq, len, ctx) :
-				 virtqueue_get_buf_ctx_split(_vq, len, ctx);
+				 virtqueue_get_buf_ctx_split(_vq, len, ctx, NULL);
 }
 EXPORT_SYMBOL_GPL(virtqueue_get_buf_ctx);
 
@@ -2493,7 +2591,7 @@ void *virtqueue_detach_unused_buf(struct virtqueue *_vq)
 	struct vring_virtqueue *vq = to_vvq(_vq);
 
 	return vq->packed_ring ? virtqueue_detach_unused_buf_packed(_vq) :
-				 virtqueue_detach_unused_buf_split(_vq);
+				 virtqueue_detach_unused_buf_split(_vq, NULL);
 }
 EXPORT_SYMBOL_GPL(virtqueue_detach_unused_buf);
 
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 1fc0e1023bd4..eb4a4e4329aa 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -38,6 +38,17 @@ struct virtqueue {
 	void *priv;
 };
 
+struct virtqueue_detach_cursor {
+	unsigned indirect:1;
+	unsigned done:1;
+	unsigned hole:14;
+
+	/* for split head */
+	unsigned head:16;
+	unsigned num:16;
+	unsigned pos:16;
+};
+
 int virtqueue_add_outbuf(struct virtqueue *vq,
 			 struct scatterlist sg[], unsigned int num,
 			 void *data,
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
