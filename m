Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0463F54BC
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 02:55:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B152260818;
	Tue, 24 Aug 2021 00:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drrMUkUy3VDh; Tue, 24 Aug 2021 00:55:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 708D06075F;
	Tue, 24 Aug 2021 00:55:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EEBDC000E;
	Tue, 24 Aug 2021 00:55:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F763C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 415594038E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kb9WGEfJCkhl
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:55:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62D5340392
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 00:55:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5954A6154B;
 Tue, 24 Aug 2021 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766541;
 bh=abhwVH7jxZvJC/QUmFVQU1Z3zBylCv/M+6tQw5EQd+I=;
 h=From:To:Cc:Subject:Date:From;
 b=jCInE6RiTLJS2TuexDftke6meOtkJV9KDII7AKEaiNz+/uhMRZscASNyClyw+W5aG
 U1uLieF92EfL+Pjc09RqZSdqViy0R9lObVYKnCjJ6KsEM+7Q/nVMmMkj2P1fQRDyLh
 CMdJGmO7FCNAGjuLH15Xu3nJC2dD6EtSJC/WvC0RcW5QX3YLUsFEkBEm9RNw0p6G9e
 nz9mNc/DKKX1lwcRtaUuDWEVoHsOL4JvLQgX1UZ8cjxF9U0hvKEuukveS7DsDF8F4/
 VMoTPsbo+po3C2RNSaAvplgGxxmgQ9iQ5Vll0Tz5f3SXSAbMk6gcPuCa4P52pgasEy
 EFZa11gTm5tiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 1/3] virtio: Improve vq->broken access to avoid
 any compiler optimization
Date: Mon, 23 Aug 2021 20:55:37 -0400
Message-Id: <20210824005539.631820-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, virtualization@lists.linux-foundation.org,
 "Michael S . Tsirkin" <mst@redhat.com>
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

From: Parav Pandit <parav@nvidia.com>

[ Upstream commit 60f0779862e4ab943810187752c462e85f5fa371 ]

Currently vq->broken field is read by virtqueue_is_broken() in busy
loop in one context by virtnet_send_command().

vq->broken is set to true in other process context by
virtio_break_device(). Reader and writer are accessing it without any
synchronization. This may lead to a compiler optimization which may
result to optimize reading vq->broken only once.

Hence, force reading vq->broken on each invocation of
virtqueue_is_broken() and also force writing it so that such
update is visible to the readers.

It is a theoretical fix that isn't yet encountered in the field.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Link: https://lore.kernel.org/r/20210721142648.1525924-2-parav@nvidia.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/virtio/virtio_ring.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 5cad9f41c238..cf7eccfe3469 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1150,7 +1150,7 @@ bool virtqueue_is_broken(struct virtqueue *_vq)
 {
 	struct vring_virtqueue *vq = to_vvq(_vq);
 
-	return vq->broken;
+	return READ_ONCE(vq->broken);
 }
 EXPORT_SYMBOL_GPL(virtqueue_is_broken);
 
@@ -1164,7 +1164,9 @@ void virtio_break_device(struct virtio_device *dev)
 
 	list_for_each_entry(_vq, &dev->vqs, list) {
 		struct vring_virtqueue *vq = to_vvq(_vq);
-		vq->broken = true;
+
+		/* Pairs with READ_ONCE() in virtqueue_is_broken(). */
+		WRITE_ONCE(vq->broken, true);
 	}
 }
 EXPORT_SYMBOL_GPL(virtio_break_device);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
