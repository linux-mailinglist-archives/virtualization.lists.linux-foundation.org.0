Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E2143B32B
	for <lists.virtualization@lfdr.de>; Tue, 26 Oct 2021 15:31:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07299403FB;
	Tue, 26 Oct 2021 13:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CsrYzL5Ahp4K; Tue, 26 Oct 2021 13:31:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CA4934041D;
	Tue, 26 Oct 2021 13:31:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BD61C000E;
	Tue, 26 Oct 2021 13:31:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7514C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 13:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83E60403E6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 13:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Wch9xU4UqEa
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 13:31:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1846403EA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1635255072;
 x=1666791072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gkSOykQ017HN5drBxdrfHBInMC214kQ3rsTxq8LMJzk=;
 b=VvnjZqKHI3gOcjkC53HP8QCavkQ56bMbBsQkfhGVOBl7pHagEsVP2y3N
 HBa45lCQE/bP37HsJpInZn8unmGsnBtLmczK4SGwT3qGdQVRUWOg5Pzdx
 CDFShVwlxe06WDUoMXa+3fN39r0X2w1gPyGXo8CZIphg7GYPMBPwhxnRQ
 1VOubkTyT1FI9sskcQ7yq4AouLETKp6I2w0qVEaTwTl1fU/qGT0LbBjfS
 e6j/zhjXr05OT6sM6WqveCmIclaYvEtZS/S8RXLpmZOsQXF250UnuMp7j
 6YmOfP5iHYF5tH+Ez3n3KdxqNzF9Y/Gs55JgfWgw/i0ZxWIToMQbryubK Q==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH] virtio-ring: fix DMA metadata flags
Date: Tue, 26 Oct 2021 15:31:00 +0200
Message-ID: <20211026133100.17541-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Vincent Whitchurch <vincent.whitchurch@axis.com>, kernel@axis.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

The flags are currently overwritten, leading to the wrong direction
being passed to the DMA unmap functions.

Fixes: 72b5e8958738aaa4 ("virtio-ring: store DMA metadata in desc_extra for split virtqueue")
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/virtio/virtio_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index dd95dfd85e98..3035bb6f5458 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -576,7 +576,7 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 	/* Last one doesn't continue. */
 	desc[prev].flags &= cpu_to_virtio16(_vq->vdev, ~VRING_DESC_F_NEXT);
 	if (!indirect && vq->use_dma_api)
-		vq->split.desc_extra[prev & (vq->split.vring.num - 1)].flags =
+		vq->split.desc_extra[prev & (vq->split.vring.num - 1)].flags &=
 			~VRING_DESC_F_NEXT;
 
 	if (indirect) {
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
