Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A09E3C3885
	for <lists.virtualization@lfdr.de>; Sun, 11 Jul 2021 01:52:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 169DB4039E;
	Sat, 10 Jul 2021 23:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnHT012g-Ax6; Sat, 10 Jul 2021 23:52:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 87971400CB;
	Sat, 10 Jul 2021 23:52:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68B1FC0022;
	Sat, 10 Jul 2021 23:52:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F3DBC000E
 for <virtualization@lists.linux-foundation.org>;
 Sat, 10 Jul 2021 23:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC11840503
 for <virtualization@lists.linux-foundation.org>;
 Sat, 10 Jul 2021 23:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83zq3He5d5yR
 for <virtualization@lists.linux-foundation.org>;
 Sat, 10 Jul 2021 23:52:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10FA8404EF
 for <virtualization@lists.linux-foundation.org>;
 Sat, 10 Jul 2021 23:52:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDF076141E;
 Sat, 10 Jul 2021 23:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625961158;
 bh=zTRVc9r2u+aj1HVr78CitjoH2EHWc/GHm1GJ0PMYVvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PWNENnAo1urka7fwXeF+NeMvaYyD8UVaiH9QpghcrbsiM1yguAsC1YhxjfzlaLgQD
 UhKWSPCH0MDsOqiZqF7yFTf48oIyXZctZWIp0gC4QNpEv+T19VDvJbSznF+pMvcFyp
 ni1UxCMQ3A/yfp71KiFs4y40OSmoDm/w5ViT7vu8PthQY7NCx8sgXAJRfFZa0BQRaQ
 3kLoDTsErHK4+fNPmJKvrs76+bHKui6RTPw2x28SEGQmxV0+p1i79dM6HYHctsCRei
 8xJDw0q9HV8/rKmBnKO67c1N9Rxb0Dvz999EtOlJslFU6tJ373J09Hcm331f6tYxVR
 IPh3lyA6vLflw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 20/21] virtio_net: Fix error handling in
 virtnet_restore()
Date: Sat, 10 Jul 2021 19:52:11 -0400
Message-Id: <20210710235212.3222375-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710235212.3222375-1-sashal@kernel.org>
References: <20210710235212.3222375-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
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

[ Upstream commit 3f2869cace829fb4b80fc53b3ddaa7f4ba9acbf1 ]

Do some cleanups in virtnet_restore() when virtnet_cpu_notif_add() failed.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Link: https://lore.kernel.org/r/20210517084516.332-1-xieyongji@bytedance.com
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/virtio_net.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 2d2a307c0231..dbc944c5759e 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2765,8 +2765,11 @@ static __maybe_unused int virtnet_restore(struct virtio_device *vdev)
 	virtnet_set_queues(vi, vi->curr_queue_pairs);
 
 	err = virtnet_cpu_notif_add(vi);
-	if (err)
+	if (err) {
+		virtnet_freeze_down(vdev);
+		remove_vq_common(vi);
 		return err;
+	}
 
 	return 0;
 }
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
