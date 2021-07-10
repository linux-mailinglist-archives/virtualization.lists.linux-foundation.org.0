Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2063C383B
	for <lists.virtualization@lfdr.de>; Sun, 11 Jul 2021 01:51:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4AE83AB7;
	Sat, 10 Jul 2021 23:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3m86g1RzAaWu; Sat, 10 Jul 2021 23:51:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2EBF783ACA;
	Sat, 10 Jul 2021 23:51:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C367BC000E;
	Sat, 10 Jul 2021 23:51:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52DE7C000E
 for <virtualization@lists.linux-foundation.org>;
 Sat, 10 Jul 2021 23:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34EE983AC6
 for <virtualization@lists.linux-foundation.org>;
 Sat, 10 Jul 2021 23:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53KONEwiiKq1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 10 Jul 2021 23:51:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BB6A83AB7
 for <virtualization@lists.linux-foundation.org>;
 Sat, 10 Jul 2021 23:51:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F7C5613F9;
 Sat, 10 Jul 2021 23:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625961099;
 bh=Kbh2t3UhUwFykH6852mSxWLXEXKjB4hI7B6a9yxTSOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o0w9WX7ikdVmJZ2CYe+GAF15zWDzgRtRKLl4z0HIzdtHS4o/n/PbpsXt7cssU4RWX
 kzlp+qVd+508TOBTs2V+I7GkLVtxTOxsWlXf2kczMKH/I7GN3pjSCj8kp2n+w2JgE1
 ecA0UcoueOUGHwhrtBzkaFTxnQPuzKdGSWe2nNly8O59vLaUgazIW5b+yAaSQkHCo1
 YqriV+vn6ooq1HCEqylU26bjjCi7vbeLX3lfYYpcZevbJFRg53pytJy3ydgbbJw+Wj
 Zma7YVWz/M/k/WIZZAWDy5OjmovM1WKwZs++tLE81K4Q4POXXlYVz6OOjXw1Et3n/R
 nuA+Ujq0aT0vQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 25/28] virtio-blk: Fix memory leak among
 suspend/resume procedure
Date: Sat, 10 Jul 2021 19:51:04 -0400
Message-Id: <20210710235107.3221840-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710235107.3221840-1-sashal@kernel.org>
References: <20210710235107.3221840-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Xie Yongji <xieyongji@bytedance.com>
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

From: Xie Yongji <xieyongji@bytedance.com>

[ Upstream commit b71ba22e7c6c6b279c66f53ee7818709774efa1f ]

The vblk->vqs should be freed before we call init_vqs()
in virtblk_restore().

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Link: https://lore.kernel.org/r/20210517084332.280-1-xieyongji@bytedance.com
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/virtio_blk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 2eeb2bcb488d..816eb2db7308 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1057,6 +1057,8 @@ static int virtblk_freeze(struct virtio_device *vdev)
 	blk_mq_quiesce_queue(vblk->disk->queue);
 
 	vdev->config->del_vqs(vdev);
+	kfree(vblk->vqs);
+
 	return 0;
 }
 
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
