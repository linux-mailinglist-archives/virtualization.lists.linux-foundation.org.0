Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B63015DB79
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 16:49:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B64CF8810B;
	Fri, 14 Feb 2020 15:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPWVYYQCV8ev; Fri, 14 Feb 2020 15:49:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 01A9A880B3;
	Fri, 14 Feb 2020 15:49:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2684C0177;
	Fri, 14 Feb 2020 15:49:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C41CAC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 15:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B10ED8475F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 15:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id REwzibsSHvMk
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 15:49:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D51FD84627
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 15:49:02 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D75D22467D;
 Fri, 14 Feb 2020 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695342;
 bh=LoGvoCiSwR3JH5U7wIqySCdnVjdTGHmGcOe0AU87k4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VDsu4/9ghICoHWW/RC1M0RQlTc+DZKSW0Skseg9WkI2xgh53ecYG53YYvrql3GRWf
 rnFl0g5YmEvHHIP82hHG+ukmYmVFPhLGhmAcWQs8zYmqL/CY5pn9SuU5lLoQis2Yco
 srUvEGrupaPUK4edvIov7P5Hs97A5gZ8uHmKII5g=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 006/542] drm/virtio: fix byteorder handling in
 virtio_gpu_cmd_transfer_{from, to}_host_3d functions
Date: Fri, 14 Feb 2020 10:39:58 -0500
Message-Id: <20200214154854.6746-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>
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

From: Gerd Hoffmann <kraxel@redhat.com>

[ Upstream commit 1dc3485247170d3b88a21cadee7f7da1f0433495 ]

Be consistent with the rest of the code base.
No functional change.

v2:
 - fix sparse warnings for virtio_gpu_cmd_transfer_to_host_2d call.
 - move convert_to_hw_box helper function.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Link: http://patchwork.freedesktop.org/patch/msgid/20191023062539.11728-2-kraxel@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  5 +++--
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 22 +++-------------------
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 19 +++++++++++++++----
 3 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0b56ba005e253..eedae2a7b532d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -38,6 +38,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/virtgpu_drm.h>
 
 #define DRIVER_NAME "virtio_gpu"
 #define DRIVER_DESC "virtio GPU"
@@ -312,13 +313,13 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  uint32_t ctx_id,
 					  uint64_t offset, uint32_t level,
-					  struct virtio_gpu_box *box,
+					  struct drm_virtgpu_3d_box *box,
 					  struct virtio_gpu_object_array *objs,
 					  struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
-					struct virtio_gpu_box *box,
+					struct drm_virtgpu_3d_box *box,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence);
 void
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 9af1ec62434f2..205ec4abae2b9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -33,17 +33,6 @@
 
 #include "virtgpu_drv.h"
 
-static void convert_to_hw_box(struct virtio_gpu_box *dst,
-			      const struct drm_virtgpu_3d_box *src)
-{
-	dst->x = cpu_to_le32(src->x);
-	dst->y = cpu_to_le32(src->y);
-	dst->z = cpu_to_le32(src->z);
-	dst->w = cpu_to_le32(src->w);
-	dst->h = cpu_to_le32(src->h);
-	dst->d = cpu_to_le32(src->d);
-}
-
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_priv)
 {
@@ -304,7 +293,6 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	struct virtio_gpu_fence *fence;
 	int ret;
 	u32 offset = args->offset;
-	struct virtio_gpu_box box;
 
 	if (vgdev->has_virgl_3d == false)
 		return -ENOSYS;
@@ -317,8 +305,6 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (ret != 0)
 		goto err_put_free;
 
-	convert_to_hw_box(&box, &args->box);
-
 	fence = virtio_gpu_fence_alloc(vgdev);
 	if (!fence) {
 		ret = -ENOMEM;
@@ -326,7 +312,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	}
 	virtio_gpu_cmd_transfer_from_host_3d
 		(vgdev, vfpriv->ctx_id, offset, args->level,
-		 &box, objs, fence);
+		 &args->box, objs, fence);
 	dma_fence_put(&fence->f);
 	return 0;
 
@@ -345,7 +331,6 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	struct drm_virtgpu_3d_transfer_to_host *args = data;
 	struct virtio_gpu_object_array *objs;
 	struct virtio_gpu_fence *fence;
-	struct virtio_gpu_box box;
 	int ret;
 	u32 offset = args->offset;
 
@@ -353,11 +338,10 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	if (objs == NULL)
 		return -ENOENT;
 
-	convert_to_hw_box(&box, &args->box);
 	if (!vgdev->has_virgl_3d) {
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, offset,
-			 box.w, box.h, box.x, box.y,
+			 args->box.w, args->box.h, args->box.x, args->box.y,
 			 objs, NULL);
 	} else {
 		ret = virtio_gpu_array_lock_resv(objs);
@@ -372,7 +356,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		virtio_gpu_cmd_transfer_to_host_3d
 			(vgdev,
 			 vfpriv ? vfpriv->ctx_id : 0, offset,
-			 args->level, &box, objs, fence);
+			 args->level, &args->box, objs, fence);
 		dma_fence_put(&fence->f);
 	}
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 74ad3bc3ebe83..9274c4063c701 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -40,6 +40,17 @@
 			       + MAX_INLINE_CMD_SIZE		 \
 			       + MAX_INLINE_RESP_SIZE)
 
+static void convert_to_hw_box(struct virtio_gpu_box *dst,
+			      const struct drm_virtgpu_3d_box *src)
+{
+	dst->x = cpu_to_le32(src->x);
+	dst->y = cpu_to_le32(src->y);
+	dst->z = cpu_to_le32(src->z);
+	dst->w = cpu_to_le32(src->w);
+	dst->h = cpu_to_le32(src->h);
+	dst->d = cpu_to_le32(src->d);
+}
+
 void virtio_gpu_ctrl_ack(struct virtqueue *vq)
 {
 	struct drm_device *dev = vq->vdev->priv;
@@ -965,7 +976,7 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
-					struct virtio_gpu_box *box,
+					struct drm_virtgpu_3d_box *box,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence)
 {
@@ -987,7 +998,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
-	cmd_p->box = *box;
+	convert_to_hw_box(&cmd_p->box, box);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
 
@@ -997,7 +1008,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  uint32_t ctx_id,
 					  uint64_t offset, uint32_t level,
-					  struct virtio_gpu_box *box,
+					  struct drm_virtgpu_3d_box *box,
 					  struct virtio_gpu_object_array *objs,
 					  struct virtio_gpu_fence *fence)
 {
@@ -1013,7 +1024,7 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
-	cmd_p->box = *box;
+	convert_to_hw_box(&cmd_p->box, box);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
