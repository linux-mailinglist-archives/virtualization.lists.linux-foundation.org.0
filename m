Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3255D1B4
	for <lists.virtualization@lfdr.de>; Tue,  2 Jul 2019 16:25:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 013C9199B;
	Tue,  2 Jul 2019 14:22:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5DF3B1835
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 14:19:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id AA6F91DE21
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 14:19:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3563230832C3;
	Tue,  2 Jul 2019 14:19:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
	[10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFC611001E64;
	Tue,  2 Jul 2019 14:19:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 14EEE9D7C; Tue,  2 Jul 2019 16:19:06 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 15/18] drm/virtio: rework virtio_gpu_transfer_to_host_ioctl
	fencing
Date: Tue,  2 Jul 2019 16:19:00 +0200
Message-Id: <20190702141903.1131-16-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-1-kraxel@redhat.com>
References: <20190702141903.1131-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 02 Jul 2019 14:19:25 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
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
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 43 ++++++++++++--------------
 drivers/gpu/drm/virtio/virtgpu_vq.c    |  5 ++-
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 4df760ba018e..b1f63a21abb6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -308,10 +308,10 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
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
index 56182abdbf36..b220918df6a1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -341,47 +341,44 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct drm_virtgpu_3d_transfer_to_host *args = data;
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
 	convert_to_hw_box(&box, &args->box);
 	if (!vgdev->has_virgl_3d) {
 		virtio_gpu_cmd_transfer_to_host_2d
-			(vgdev, qobj, offset,
+			(vgdev, gem_to_virtio_gpu_obj(objs->objs[0]), offset,
 			 box.w, box.h, box.x, box.y, NULL);
+		virtio_gpu_array_put_free(objs);
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
-		reservation_object_add_excl_fence(qobj->base.base.resv,
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
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index bef7036f4508..1c0097de419a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -899,12 +899,13 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
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
@@ -917,6 +918,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
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
