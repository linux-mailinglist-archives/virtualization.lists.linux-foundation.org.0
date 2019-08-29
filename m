Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B5024A1642
	for <lists.virtualization@lfdr.de>; Thu, 29 Aug 2019 12:35:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4BC5A46FC;
	Thu, 29 Aug 2019 10:33:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6F06E46C8
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 10:33:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8C9958AF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E422875222;
	Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 863E91001938;
	Thu, 29 Aug 2019 10:33:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9192431F03; Thu, 29 Aug 2019 12:33:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 11/18] drm/virtio: rework virtio_gpu_transfer_to_host_ioctl
	fencing
Date: Thu, 29 Aug 2019 12:32:54 +0200
Message-Id: <20190829103301.3539-12-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
	olvaffe@gmail.com
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

Switch to the virtio_gpu_array_* helper workflow.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  4 +--
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 50 +++++++++++---------------
 drivers/gpu/drm/virtio/virtgpu_plane.c | 21 ++++++++---
 drivers/gpu/drm/virtio/virtgpu_vq.c    |  9 +++--
 4 files changed, 47 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index fa568cbfdddc..4f54bf7c02af 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -279,10 +279,10 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
-					struct virtio_gpu_object *bo,
 					uint64_t offset,
 					__le32 width, __le32 height,
 					__le32 x, __le32 y,
+					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
@@ -329,10 +329,10 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  struct virtio_gpu_object_array *objs,
 					  struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
-					struct virtio_gpu_object *bo,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
 					struct virtio_gpu_box *box,
+					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence);
 void
 virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index f2133d371aaa..677d844d88bc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -383,52 +383,44 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct drm_virtgpu_3d_transfer_to_host *args = data;
-	struct ttm_operation_ctx ctx = { true, false };
-	struct drm_gem_object *gobj = NULL;
-	struct virtio_gpu_object *qobj = NULL;
+	struct virtio_gpu_object_array *objs;
 	struct virtio_gpu_fence *fence;
 	struct virtio_gpu_box box;
 	int ret;
 	u32 offset = args->offset;
 
-	gobj = drm_gem_object_lookup(file, args->bo_handle);
-	if (gobj == NULL)
+	objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
+	if (objs == NULL)
 		return -ENOENT;
 
-	qobj = gem_to_virtio_gpu_obj(gobj);
-
-	ret = virtio_gpu_object_reserve(qobj);
-	if (ret)
-		goto out;
-
-	ret = ttm_bo_validate(&qobj->tbo, &qobj->placement, &ctx);
-	if (unlikely(ret))
-		goto out_unres;
-
 	convert_to_hw_box(&box, &args->box);
 	if (!vgdev->has_virgl_3d) {
 		virtio_gpu_cmd_transfer_to_host_2d
-			(vgdev, qobj, offset,
-			 box.w, box.h, box.x, box.y, NULL);
+			(vgdev, offset,
+			 box.w, box.h, box.x, box.y,
+			 objs, NULL);
 	} else {
+		ret = virtio_gpu_array_lock_resv(objs);
+		if (ret != 0)
+			goto err_put_free;
+
+		ret = -ENOMEM;
 		fence = virtio_gpu_fence_alloc(vgdev);
-		if (!fence) {
-			ret = -ENOMEM;
-			goto out_unres;
-		}
+		if (!fence)
+			goto err_unlock;
+
 		virtio_gpu_cmd_transfer_to_host_3d
-			(vgdev, qobj,
+			(vgdev,
 			 vfpriv ? vfpriv->ctx_id : 0, offset,
-			 args->level, &box, fence);
-		dma_resv_add_excl_fence(qobj->tbo.base.resv,
-						  &fence->f);
+			 args->level, &box, objs, fence);
 		dma_fence_put(&fence->f);
 	}
+	return 0;
 
-out_unres:
-	virtio_gpu_object_unreserve(qobj);
-out:
-	drm_gem_object_put_unlocked(gobj);
+err_unlock:
+	virtio_gpu_array_unlock_resv(objs);
+err_put_free:
+	virtio_gpu_array_put_free(objs);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index f23622b12629..f4b7360282ce 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -124,12 +124,19 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 		bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
 		handle = bo->hw_res_handle;
 		if (bo->dumb) {
+			struct virtio_gpu_object_array *objs;
+
+			objs = virtio_gpu_array_alloc(1);
+			if (!objs)
+				return;
+			virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
 			virtio_gpu_cmd_transfer_to_host_2d
-				(vgdev, bo, 0,
+				(vgdev, 0,
 				 cpu_to_le32(plane->state->src_w >> 16),
 				 cpu_to_le32(plane->state->src_h >> 16),
 				 cpu_to_le32(plane->state->src_x >> 16),
-				 cpu_to_le32(plane->state->src_y >> 16), NULL);
+				 cpu_to_le32(plane->state->src_y >> 16),
+				 objs, NULL);
 		}
 	} else {
 		handle = 0;
@@ -219,11 +226,17 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 
 	if (bo && bo->dumb && (plane->state->fb != old_state->fb)) {
 		/* new cursor -- update & wait */
+		struct virtio_gpu_object_array *objs;
+
+		objs = virtio_gpu_array_alloc(1);
+		if (!objs)
+			return;
+		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
 		virtio_gpu_cmd_transfer_to_host_2d
-			(vgdev, bo, 0,
+			(vgdev, 0,
 			 cpu_to_le32(plane->state->crtc_w),
 			 cpu_to_le32(plane->state->crtc_h),
-			 0, 0, vgfb->fence);
+			 0, 0, objs, vgfb->fence);
 		dma_fence_wait(&vgfb->fence->f, true);
 		dma_fence_put(&vgfb->fence->f);
 		vgfb->fence = NULL;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index a8f1dbf10206..20714094dddc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -491,12 +491,13 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 }
 
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
-					struct virtio_gpu_object *bo,
 					uint64_t offset,
 					__le32 width, __le32 height,
 					__le32 x, __le32 y,
+					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence)
 {
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_transfer_to_host_2d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
@@ -508,6 +509,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
+	vbuf->objs = objs;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
@@ -900,12 +902,13 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 }
 
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
-					struct virtio_gpu_object *bo,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
 					struct virtio_gpu_box *box,
+					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence)
 {
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
@@ -918,6 +921,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
+	vbuf->objs = objs;
+
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
