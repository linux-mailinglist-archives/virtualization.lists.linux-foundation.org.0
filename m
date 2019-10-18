Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E6DC4AB
	for <lists.virtualization@lfdr.de>; Fri, 18 Oct 2019 14:24:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A846F116E;
	Fri, 18 Oct 2019 12:23:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C3AC4115E
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 12:23:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5195D70D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 12:23:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47EAA307C656;
	Fri, 18 Oct 2019 12:23:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6200060BF1;
	Fri, 18 Oct 2019 12:23:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5739616E08; Fri, 18 Oct 2019 14:23:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: move byteorder handling into
	virtio_gpu_cmd_transfer_to_host_2d function
Date: Fri, 18 Oct 2019 14:23:52 +0200
Message-Id: <20191018122352.17019-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 18 Oct 2019 12:23:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, "open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Be consistent with the rest of the code base.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_plane.c | 12 ++++++------
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 12 ++++++------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 314e02f94d9c..0b56ba005e25 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -267,8 +267,8 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
-					__le32 width, __le32 height,
-					__le32 x, __le32 y,
+					uint32_t width, uint32_t height,
+					uint32_t x, uint32_t y,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index f4b7360282ce..390524143139 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -132,10 +132,10 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 			virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
 			virtio_gpu_cmd_transfer_to_host_2d
 				(vgdev, 0,
-				 cpu_to_le32(plane->state->src_w >> 16),
-				 cpu_to_le32(plane->state->src_h >> 16),
-				 cpu_to_le32(plane->state->src_x >> 16),
-				 cpu_to_le32(plane->state->src_y >> 16),
+				 plane->state->src_w >> 16,
+				 plane->state->src_h >> 16,
+				 plane->state->src_x >> 16,
+				 plane->state->src_y >> 16,
 				 objs, NULL);
 		}
 	} else {
@@ -234,8 +234,8 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, 0,
-			 cpu_to_le32(plane->state->crtc_w),
-			 cpu_to_le32(plane->state->crtc_h),
+			 plane->state->crtc_w,
+			 plane->state->crtc_h,
 			 0, 0, objs, vgfb->fence);
 		dma_fence_wait(&vgfb->fence->f, true);
 		dma_fence_put(&vgfb->fence->f);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 80176f379ad5..74ad3bc3ebe8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -549,8 +549,8 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
-					__le32 width, __le32 height,
-					__le32 x, __le32 y,
+					uint32_t width, uint32_t height,
+					uint32_t x, uint32_t y,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence)
 {
@@ -571,10 +571,10 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	cmd_p->offset = cpu_to_le64(offset);
-	cmd_p->r.width = width;
-	cmd_p->r.height = height;
-	cmd_p->r.x = x;
-	cmd_p->r.y = y;
+	cmd_p->r.width = cpu_to_le32(width);
+	cmd_p->r.height = cpu_to_le32(height);
+	cmd_p->r.x = cpu_to_le32(x);
+	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
 }
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
