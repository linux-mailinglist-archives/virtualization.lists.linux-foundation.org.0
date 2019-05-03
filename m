Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDAB13256
	for <lists.virtualization@lfdr.de>; Fri,  3 May 2019 18:39:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84EEF3A5B;
	Fri,  3 May 2019 16:39:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B926E3A5B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 16:38:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A85179
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 16:38:29 +0000 (UTC)
Received: from localhost.localdomain (unknown
	[IPv6:2a02:2450:102f:3e0:9052:5862:59e9:e098])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: robertfoss)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 94AD526104F;
	Fri,  3 May 2019 17:38:26 +0100 (BST)
From: Robert Foss <robert.foss@collabora.com>
To: airlied@linux.ie, kraxel@redhat.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH] drm/virtio: Remove redundant return type
Date: Fri,  3 May 2019 18:38:04 +0200
Message-Id: <20190503163804.31922-1-robert.foss@collabora.com>
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
---

This patch was suggested in this email thread:

[PATCH] drm/virtio: allocate fences with GFP_KERNEL
https://www.spinics.net/lists/dri-devel/msg208536.html

 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d577cb76f5ad..9bc56887fbdb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -334,7 +334,7 @@ int virtio_gpu_mmap(struct file *filp, struct vm_area_struct *vma);
 /* virtio_gpu_fence.c */
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(
 	struct virtio_gpu_device *vgdev);
-int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
+void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_ctrl_hdr *cmd_hdr,
 			  struct virtio_gpu_fence *fence);
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 21bd4c4a32d1..e0744ac768cc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -81,7 +81,7 @@ struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
 	return fence;
 }
 
-int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
+void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_ctrl_hdr *cmd_hdr,
 			  struct virtio_gpu_fence *fence)
 {
@@ -96,7 +96,6 @@ int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 
 	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
 	cmd_hdr->fence_id = cpu_to_le64(fence->seq);
-	return 0;
 }
 
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
