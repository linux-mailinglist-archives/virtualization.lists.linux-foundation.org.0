Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 806554C2A1A
	for <lists.virtualization@lfdr.de>; Thu, 24 Feb 2022 12:04:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC0660B15;
	Thu, 24 Feb 2022 11:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlGIDHYBg9SN; Thu, 24 Feb 2022 11:04:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CEB7060B45;
	Thu, 24 Feb 2022 11:04:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A55D8C0011;
	Thu, 24 Feb 2022 11:04:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C02B3C0011
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 11:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5A340482
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 11:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YO_p3KsCMk9j
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 11:04:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11869404DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 11:04:07 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R621e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V5Nr1qt_1645700643; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V5Nr1qt_1645700643) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 24 Feb 2022 19:04:04 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 1/9] virtio_ring: rename vring_unmap_state_packed() to
 vring_unmap_extra_packed()
Date: Thu, 24 Feb 2022 19:03:54 +0800
Message-Id: <20220224110402.108161-2-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220224110402.108161-1-xuanzhuo@linux.alibaba.com>
References: <20220224110402.108161-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: d02e086a8668
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

The actual parameter handled by vring_unmap_state_packed() is that
vring_desc_extra, so this function should use "extra" instead of "state".

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 962f1477b1fa..7cf3ae057833 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -984,24 +984,24 @@ static struct virtqueue *vring_create_virtqueue_split(
  * Packed ring specific functions - *_packed().
  */
 
-static void vring_unmap_state_packed(const struct vring_virtqueue *vq,
-				     struct vring_desc_extra *state)
+static void vring_unmap_extra_packed(const struct vring_virtqueue *vq,
+				     struct vring_desc_extra *extra)
 {
 	u16 flags;
 
 	if (!vq->use_dma_api)
 		return;
 
-	flags = state->flags;
+	flags = extra->flags;
 
 	if (flags & VRING_DESC_F_INDIRECT) {
 		dma_unmap_single(vring_dma_dev(vq),
-				 state->addr, state->len,
+				 extra->addr, extra->len,
 				 (flags & VRING_DESC_F_WRITE) ?
 				 DMA_FROM_DEVICE : DMA_TO_DEVICE);
 	} else {
 		dma_unmap_page(vring_dma_dev(vq),
-			       state->addr, state->len,
+			       extra->addr, extra->len,
 			       (flags & VRING_DESC_F_WRITE) ?
 			       DMA_FROM_DEVICE : DMA_TO_DEVICE);
 	}
@@ -1303,8 +1303,7 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 	for (n = 0; n < total_sg; n++) {
 		if (i == err_idx)
 			break;
-		vring_unmap_state_packed(vq,
-					 &vq->packed.desc_extra[curr]);
+		vring_unmap_extra_packed(vq, &vq->packed.desc_extra[curr]);
 		curr = vq->packed.desc_extra[curr].next;
 		i++;
 		if (i >= vq->packed.vring.num)
@@ -1383,8 +1382,8 @@ static void detach_buf_packed(struct vring_virtqueue *vq,
 	if (unlikely(vq->use_dma_api)) {
 		curr = id;
 		for (i = 0; i < state->num; i++) {
-			vring_unmap_state_packed(vq,
-				&vq->packed.desc_extra[curr]);
+			vring_unmap_extra_packed(vq,
+						 &vq->packed.desc_extra[curr]);
 			curr = vq->packed.desc_extra[curr].next;
 		}
 	}
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
