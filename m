Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 058F318A470
	for <lists.virtualization@lfdr.de>; Wed, 18 Mar 2020 21:54:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A329420026;
	Wed, 18 Mar 2020 20:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQyBjztpcKv6; Wed, 18 Mar 2020 20:54:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE3C32107A;
	Wed, 18 Mar 2020 20:54:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BB3BC013E;
	Wed, 18 Mar 2020 20:54:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02252C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E554F85BE4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sEqN_tc9xtOt
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:54:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7CFDD85B4A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:54:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80F232098B;
 Wed, 18 Mar 2020 20:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584564863;
 bh=AkUXhWTvMH5WqnlJ+9dw58ZG2shO13fuumDz8hrq7iU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j65JHtwu9+zn7xa8U3XFTbm9X8NlSAO0WYhZpusJ9Ww01bRF7xrWUMBAaCGUWKqve
 wV1LIGDAu+1HsSn5AkDfGppNci8ze8tr3eWEUA9rmXzNStPrH/XlfWRLTDIiwicOON
 9PfaoQhwl5r0Il2B1c1MMGTqclQEslakxaZd2h5Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 36/73] virtio_ring: Fix mem leak with
 vring_new_virtqueue()
Date: Wed, 18 Mar 2020 16:53:00 -0400
Message-Id: <20200318205337.16279-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318205337.16279-1-sashal@kernel.org>
References: <20200318205337.16279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Suman Anna <s-anna@ti.com>,
 virtualization@lists.linux-foundation.org,
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

From: Suman Anna <s-anna@ti.com>

[ Upstream commit f13f09a12cbd0c7b776e083c5d008b6c6a9c4e0b ]

The functions vring_new_virtqueue() and __vring_new_virtqueue() are used
with split rings, and any allocations within these functions are managed
outside of the .we_own_ring flag. The commit cbeedb72b97a ("virtio_ring:
allocate desc state for split ring separately") allocates the desc state
within the __vring_new_virtqueue() but frees it only when the .we_own_ring
flag is set. This leads to a memory leak when freeing such allocated
virtqueues with the vring_del_virtqueue() function.

Fix this by moving the desc_state free code outside the flag and only
for split rings. Issue was discovered during testing with remoteproc
and virtio_rpmsg.

Fixes: cbeedb72b97a ("virtio_ring: allocate desc state for split ring separately")
Signed-off-by: Suman Anna <s-anna@ti.com>
Link: https://lore.kernel.org/r/20200224212643.30672-1-s-anna@ti.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/virtio/virtio_ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 867c7ebd3f107..58b96baa8d488 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2203,10 +2203,10 @@ void vring_del_virtqueue(struct virtqueue *_vq)
 					 vq->split.queue_size_in_bytes,
 					 vq->split.vring.desc,
 					 vq->split.queue_dma_addr);
-
-			kfree(vq->split.desc_state);
 		}
 	}
+	if (!vq->packed_ring)
+		kfree(vq->split.desc_state);
 	list_del(&_vq->list);
 	kfree(vq);
 }
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
