Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F618A4A5
	for <lists.virtualization@lfdr.de>; Wed, 18 Mar 2020 21:55:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3CFD225E8F;
	Wed, 18 Mar 2020 20:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBE2S8ghzh11; Wed, 18 Mar 2020 20:55:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 317A125B01;
	Wed, 18 Mar 2020 20:55:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C55FC013E;
	Wed, 18 Mar 2020 20:55:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 148DDC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0136987D11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Vv48aWvvQCH
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:55:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8CBCA8789B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:55:37 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D8C1208FE;
 Wed, 18 Mar 2020 20:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584564937;
 bh=/oFbRhzX1PU/IalooWt4ApsEVuoQyc21nlRUzz8UngA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o6lnyre0w2UUUrxIaOltqrdzpQpupj1FoTmsOdx8vMhZrqbAfDTMpxH9Taf9iOWod
 lMgw6ScySFbGLwBylL29z3dybKz1AGF/DfZIqRDFJ1ns8q8uL6RQAwes5KzHuaz8KF
 BvCRC5irEPjf30U9pZ7NorCjIVF+a34HiEcDm1OA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 23/37] virtio-blk: fix hw_queue stopped on
 arbitrary error
Date: Wed, 18 Mar 2020 16:54:55 -0400
Message-Id: <20200318205509.17053-23-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318205509.17053-1-sashal@kernel.org>
References: <20200318205509.17053-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 linux-block@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>
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

From: Halil Pasic <pasic@linux.ibm.com>

[ Upstream commit f5f6b95c72f7f8bb46eace8c5306c752d0133daa ]

Since nobody else is going to restart our hw_queue for us, the
blk_mq_start_stopped_hw_queues() is in virtblk_done() is not sufficient
necessarily sufficient to ensure that the queue will get started again.
In case of global resource outage (-ENOMEM because mapping failure,
because of swiotlb full) our virtqueue may be empty and we can get
stuck with a stopped hw_queue.

Let us not stop the queue on arbitrary errors, but only on -EONSPC which
indicates a full virtqueue, where the hw_queue is guaranteed to get
started by virtblk_done() before when it makes sense to carry on
submitting requests. Let us also remove a stale comment.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Cc: Jens Axboe <axboe@kernel.dk>
Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping fails")
Link: https://lore.kernel.org/r/20200213123728.61216-2-pasic@linux.ibm.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/virtio_blk.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index dd64f586679e1..728c9a9609f0c 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -271,10 +271,12 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
 		err = virtblk_add_req(vblk->vqs[qid].vq, vbr, vbr->sg, num);
 	if (err) {
 		virtqueue_kick(vblk->vqs[qid].vq);
-		blk_mq_stop_hw_queue(hctx);
+		/* Don't stop the queue if -ENOMEM: we may have failed to
+		 * bounce the buffer due to global resource outage.
+		 */
+		if (err == -ENOSPC)
+			blk_mq_stop_hw_queue(hctx);
 		spin_unlock_irqrestore(&vblk->vqs[qid].lock, flags);
-		/* Out of mem doesn't actually happen, since we fall back
-		 * to direct descriptors */
 		if (err == -ENOMEM || err == -ENOSPC)
 			return BLK_STS_DEV_RESOURCE;
 		return BLK_STS_IOERR;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
