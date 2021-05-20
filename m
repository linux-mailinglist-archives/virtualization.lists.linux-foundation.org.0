Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C4238B174
	for <lists.virtualization@lfdr.de>; Thu, 20 May 2021 16:13:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C260660585;
	Thu, 20 May 2021 14:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ys_lNqEm-Mfw; Thu, 20 May 2021 14:13:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83B1960BD7;
	Thu, 20 May 2021 14:13:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99748C0027;
	Thu, 20 May 2021 14:13:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61001C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 14:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB3683E00
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 14:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZZvpY7B1aWo
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 14:13:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D34B83D81
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621520027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Agfgj5H+O2SpDpdHb5XPypSRzbYVYTbhLYER/UTUmY4=;
 b=A1VzRPiXyCPSIF/csRki/y+JB1FAKQKa5i66BXo9gCgSTolWEJwX6W8OMygNWOblWlRXKT
 5Lr8LwuX7cTClnxw0oKMygKdQRrs5qT2ZWkkPYPuj0/sshZEPHR0NECwvc7d9w90g7RgFJ
 8Yr75Ddk3Gv9NqzjpxuEp75dP7zfQZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-dBeH17zRMVu4AQcmL-Y4Ow-1; Thu, 20 May 2021 10:13:43 -0400
X-MC-Unique: dBeH17zRMVu4AQcmL-Y4Ow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29A1E801B14;
 Thu, 20 May 2021 14:13:42 +0000 (UTC)
Received: from localhost (ovpn-115-223.ams2.redhat.com [10.36.115.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78DBC1037F22;
 Thu, 20 May 2021 14:13:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 2/3] virtio_blk: avoid repeating vblk->vqs[qid]
Date: Thu, 20 May 2021 15:13:04 +0100
Message-Id: <20210520141305.355961-3-stefanha@redhat.com>
In-Reply-To: <20210520141305.355961-1-stefanha@redhat.com>
References: <20210520141305.355961-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christoph Hellwig <hch@lst.de>
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

struct virtio_blk_vq is accessed in many places. Introduce "vbq" local
variables to avoid repeating vblk->vqs[qid] throughout the code. The
patches that follow will add more accesses, making the payoff even
greater.

virtio_commit_rqs() calls the local variable "vq", which is easily
confused with struct virtqueue. Rename to "vbq" for clarity.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 drivers/block/virtio_blk.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index b9fa3ef5b57c..fc0fb1dcd399 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -174,16 +174,16 @@ static inline void virtblk_request_done(struct request *req)
 static void virtblk_done(struct virtqueue *vq)
 {
 	struct virtio_blk *vblk = vq->vdev->priv;
+	struct virtio_blk_vq *vbq = &vblk->vqs[vq->index];
 	bool req_done = false;
-	int qid = vq->index;
 	struct virtblk_req *vbr;
 	unsigned long flags;
 	unsigned int len;
 
-	spin_lock_irqsave(&vblk->vqs[qid].lock, flags);
+	spin_lock_irqsave(&vbq->lock, flags);
 	do {
 		virtqueue_disable_cb(vq);
-		while ((vbr = virtqueue_get_buf(vblk->vqs[qid].vq, &len)) != NULL) {
+		while ((vbr = virtqueue_get_buf(vq, &len)) != NULL) {
 			struct request *req = blk_mq_rq_from_pdu(vbr);
 
 			if (likely(!blk_should_fake_timeout(req->q)))
@@ -197,32 +197,32 @@ static void virtblk_done(struct virtqueue *vq)
 	/* In case queue is stopped waiting for more buffers. */
 	if (req_done)
 		blk_mq_start_stopped_hw_queues(vblk->disk->queue, true);
-	spin_unlock_irqrestore(&vblk->vqs[qid].lock, flags);
+	spin_unlock_irqrestore(&vbq->lock, flags);
 }
 
 static void virtio_commit_rqs(struct blk_mq_hw_ctx *hctx)
 {
 	struct virtio_blk *vblk = hctx->queue->queuedata;
-	struct virtio_blk_vq *vq = &vblk->vqs[hctx->queue_num];
+	struct virtio_blk_vq *vbq = &vblk->vqs[hctx->queue_num];
 	bool kick;
 
-	spin_lock_irq(&vq->lock);
-	kick = virtqueue_kick_prepare(vq->vq);
-	spin_unlock_irq(&vq->lock);
+	spin_lock_irq(&vbq->lock);
+	kick = virtqueue_kick_prepare(vbq->vq);
+	spin_unlock_irq(&vbq->lock);
 
 	if (kick)
-		virtqueue_notify(vq->vq);
+		virtqueue_notify(vbq->vq);
 }
 
 static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
 			   const struct blk_mq_queue_data *bd)
 {
 	struct virtio_blk *vblk = hctx->queue->queuedata;
+	struct virtio_blk_vq *vbq = &vblk->vqs[hctx->queue_num];
 	struct request *req = bd->rq;
 	struct virtblk_req *vbr = blk_mq_rq_to_pdu(req);
 	unsigned long flags;
 	unsigned int num;
-	int qid = hctx->queue_num;
 	int err;
 	bool notify = false;
 	bool unmap = false;
@@ -274,16 +274,16 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
 			vbr->out_hdr.type |= cpu_to_virtio32(vblk->vdev, VIRTIO_BLK_T_IN);
 	}
 
-	spin_lock_irqsave(&vblk->vqs[qid].lock, flags);
-	err = virtblk_add_req(vblk->vqs[qid].vq, vbr, vbr->sg, num);
+	spin_lock_irqsave(&vbq->lock, flags);
+	err = virtblk_add_req(vbq->vq, vbr, vbr->sg, num);
 	if (err) {
-		virtqueue_kick(vblk->vqs[qid].vq);
+		virtqueue_kick(vbq->vq);
 		/* Don't stop the queue if -ENOMEM: we may have failed to
 		 * bounce the buffer due to global resource outage.
 		 */
 		if (err == -ENOSPC)
 			blk_mq_stop_hw_queue(hctx);
-		spin_unlock_irqrestore(&vblk->vqs[qid].lock, flags);
+		spin_unlock_irqrestore(&vbq->lock, flags);
 		switch (err) {
 		case -ENOSPC:
 			return BLK_STS_DEV_RESOURCE;
@@ -294,12 +294,12 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
 		}
 	}
 
-	if (bd->last && virtqueue_kick_prepare(vblk->vqs[qid].vq))
+	if (bd->last && virtqueue_kick_prepare(vbq->vq))
 		notify = true;
-	spin_unlock_irqrestore(&vblk->vqs[qid].lock, flags);
+	spin_unlock_irqrestore(&vbq->lock, flags);
 
 	if (notify)
-		virtqueue_notify(vblk->vqs[qid].vq);
+		virtqueue_notify(vbq->vq);
 	return BLK_STS_OK;
 }
 
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
