Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FA67D461B
	for <lists.virtualization@lfdr.de>; Tue, 24 Oct 2023 05:49:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 460256F5BE;
	Tue, 24 Oct 2023 03:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460256F5BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXupLUPwBFM4; Tue, 24 Oct 2023 03:49:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1F51D6F5C8;
	Tue, 24 Oct 2023 03:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F51D6F5C8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE32DC0032;
	Tue, 24 Oct 2023 03:49:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B354C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Oct 2023 03:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA9B183E23
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Oct 2023 03:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9B183E23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndwzf1iDjHIF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Oct 2023 03:49:10 +0000 (UTC)
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72CCF83E27
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Oct 2023 03:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72CCF83E27
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R501e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0Vuonqpx_1698119343; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vuonqpx_1698119343) by smtp.aliyun-inc.com;
 Tue, 24 Oct 2023 11:49:04 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost 2/2] virtio: set broken when re-enabling vq fails
Date: Tue, 24 Oct 2023 11:49:01 +0800
Message-Id: <20231024034901.29839-3-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20231024034901.29839-1-xuanzhuo@linux.alibaba.com>
References: <20231024034901.29839-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 9ea33e687370
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

In vp_modern_enable_vq_after_reset, we will do some checks to ensure
that the vq is ready to re-enable. If that fails, the vq is good.

If the vq_active_vp() fails, that means the vq is broken.
The driver can not use that vq, this commit sets the vq to broken.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_pci_modern.c |  6 +++---
 drivers/virtio/virtio_ring.c       | 11 ++++++++---
 include/linux/virtio_config.h      |  2 ++
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index ee6a386d250b..56a4075ca5fb 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -286,16 +286,16 @@ static int vp_modern_enable_vq_after_reset(struct virtqueue *vq)
 	int err;
 
 	if (!vq->reset)
-		return -EBUSY;
+		return -EINVAL;
 
 	index = vq->index;
 	info = vp_dev->vqs[index];
 
 	if (vp_modern_get_queue_reset(mdev, index))
-		return -EBUSY;
+		return -EINVAL;
 
 	if (vp_modern_get_queue_enable(mdev, index))
-		return -EBUSY;
+		return -EINVAL;
 
 	err = vp_active_vq(vq, info->msix_vector);
 	if (err)
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index af310418e66e..91e63c57c112 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2183,11 +2183,16 @@ static int virtqueue_enable_after_reset(struct virtqueue *_vq)
 {
 	struct vring_virtqueue *vq = to_vvq(_vq);
 	struct virtio_device *vdev = vq->vq.vdev;
+	int err;
+
+	err = vdev->config->enable_vq_after_reset(_vq);
+	if (err == -EINVAL || !err)
+		return err;
 
-	if (vdev->config->enable_vq_after_reset(_vq))
-		return -EBUSY;
+	dev_warn(&vdev->dev, "Fail to re-enable the vq.%u error:%d\n", _vq->index, err);
+	__virtqueue_unbreak(_vq);
 
-	return 0;
+	return err;
 }
 
 /*
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 2b3438de2c4d..f96bebf9b632 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -91,6 +91,8 @@ typedef void vq_callback_t(struct virtqueue *);
  * @enable_vq_after_reset: enable a reset queue
  *	vq: the virtqueue
  *	Returns 0 on success or error status
+ *	-EINVAL: the vq is not in the reset status or is not ready to enable.
+ *	Other error: enabling vq fails. The vq is in broken status.
  *	If disable_vq_and_reset is set, then enable_vq_after_reset must also be
  *	set.
  */
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
