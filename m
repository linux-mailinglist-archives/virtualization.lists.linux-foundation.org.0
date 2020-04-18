Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 445441AEF12
	for <lists.virtualization@lfdr.de>; Sat, 18 Apr 2020 16:43:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF2A488020;
	Sat, 18 Apr 2020 14:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjCgiEwPqSvm; Sat, 18 Apr 2020 14:43:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 275AF8823B;
	Sat, 18 Apr 2020 14:43:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC188C0172;
	Sat, 18 Apr 2020 14:43:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF6F0C0172
 for <virtualization@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 14:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BDAD28823A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 14:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QEqdTziZqXj4
 for <virtualization@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 14:43:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 345F188020
 for <virtualization@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 14:43:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3613222251;
 Sat, 18 Apr 2020 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587221004;
 bh=mPI7dZVIo4iPlgnoF2Ep7DFHWMf+nmIW9xdSfeatkag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FmzAfwVYaOjh/O88VylBa2OfXxOz+svFYVgNHxTBrPM+rvi0NchqXvJSDVsn/UB7j
 DJb+htZ0w6Q2HQ1plcHueaKezxKgglkjeYBJKAr42rASeX7vlqzxu6d+8v6GwaJQQk
 fbClgMoHJONXF8srSs8cP7t+rb9LHXB9MYwXdQtQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 45/47] virtio-blk: improve virtqueue error to
 BLK_STS
Date: Sat, 18 Apr 2020 10:42:25 -0400
Message-Id: <20200418144227.9802-45-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144227.9802-1-sashal@kernel.org>
References: <20200418144227.9802-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, linux-block@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

[ Upstream commit 3d973b2e9a625996ee997c7303cd793b9d197c65 ]

Let's change the mapping between virtqueue_add errors to BLK_STS
statuses, so that -ENOSPC, which indicates virtqueue full is still
mapped to BLK_STS_DEV_RESOURCE, but -ENOMEM which indicates non-device
specific resource outage is mapped to BLK_STS_RESOURCE.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Link: https://lore.kernel.org/r/20200213123728.61216-3-pasic@linux.ibm.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/virtio_blk.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 728c9a9609f0c..9a3c2b14ac378 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -277,9 +277,14 @@ static blk_status_t virtio_queue_rq(struct blk_mq_hw_ctx *hctx,
 		if (err == -ENOSPC)
 			blk_mq_stop_hw_queue(hctx);
 		spin_unlock_irqrestore(&vblk->vqs[qid].lock, flags);
-		if (err == -ENOMEM || err == -ENOSPC)
+		switch (err) {
+		case -ENOSPC:
 			return BLK_STS_DEV_RESOURCE;
-		return BLK_STS_IOERR;
+		case -ENOMEM:
+			return BLK_STS_RESOURCE;
+		default:
+			return BLK_STS_IOERR;
+		}
 	}
 
 	if (bd->last && virtqueue_kick_prepare(vblk->vqs[qid].vq))
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
