Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7814741
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 11:12:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 544C4454E;
	Mon,  6 May 2019 09:11:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 234344546
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 09:11:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6680F836
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 09:11:02 +0000 (UTC)
Received: from localhost.localdomain (unknown
	[IPv6:2a02:2450:102f:3e0:95da:b269:747c:91b3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: robertfoss)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9A482261136;
	Mon,  6 May 2019 10:10:57 +0100 (BST)
From: Robert Foss <robert.foss@collabora.com>
To: airlied@linux.ie, kraxel@redhat.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v2] drm/virtio: Remove redundant return type
Date: Mon,  6 May 2019 11:10:34 +0200
Message-Id: <20190506091034.30289-1-robert.foss@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Robert Foss <robert.foss@collabora.com>,
	Emil Velikov <emil.velikov@collabora.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

virtio_gpu_fence_emit() always returns 0, since it
has no error paths.

Consequently no calls for virtio_gpu_fence_emit()
use the return value, and it can be removed.

Signed-off-by: Robert Foss <robert.foss@collabora.com>
Suggested-by: Emil Velikov <emil.velikov@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---

This patch was suggested in this email thread:

[PATCH] drm/virtio: allocate fences with GFP_KERNEL
https://www.spinics.net/lists/dri-devel/msg208536.html

Changes since v1:
 - Rebased on drm-misc-next
 - Added r-b from Chia-I Wu


 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 90461feeafdb..2d3e5b1debb3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -355,7 +355,7 @@ int virtio_gpu_mmap(struct file *filp, struct vm_area_struct *vma);
 bool virtio_fence_signaled(struct dma_fence *f);
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(
 	struct virtio_gpu_device *vgdev);
-int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
+void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_ctrl_hdr *cmd_hdr,
 			  struct virtio_gpu_fence *fence);
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 8aecc36a0417..70d6c4329778 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -85,7 +85,7 @@ struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
 	return fence;
 }
 
-int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
+void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_ctrl_hdr *cmd_hdr,
 			  struct virtio_gpu_fence *fence)
 {
@@ -102,7 +102,6 @@ int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 
 	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
 	cmd_hdr->fence_id = cpu_to_le64(fence->f.seqno);
-	return 0;
 }
 
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
