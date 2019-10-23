Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 576D6E121E
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 08:26:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6AA9ABBC;
	Wed, 23 Oct 2019 06:25:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2DD2FB6D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 06:25:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 766BE14D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 06:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571811948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=e5qrmu4lA/33yMhhY8eqqHcwG1Y/E2lbnUfcnug30Pk=;
	b=cMnqqgrjv9LFZBrJoA3Qw/k+mUbcB4zqcRWQy7/n1am+ltGS0L/YbZzLjL2axGiaUCD2iv
	MTWB1B3q98+0wOyWW8HI5Qm4zzOvfqSxTecXpziYNb86nFH50WqkGYzNgrhpxYjWnfx3HV
	hjutIbkbyCn3iCFTbvTrz73QMXWjvQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-154-HaOHJZxdM5u-YLv4NgN0Ag-1; Wed, 23 Oct 2019 02:25:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B19BC800D54;
	Wed, 23 Oct 2019 06:25:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9B335C240;
	Wed, 23 Oct 2019 06:25:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id EB4A19D72; Wed, 23 Oct 2019 08:25:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/virtio: fix byteorder handling in
	virtio_gpu_cmd_transfer_{from, to}_host_3d functions
Date: Wed, 23 Oct 2019 08:25:37 +0200
Message-Id: <20191023062539.11728-2-kraxel@redhat.com>
In-Reply-To: <20191023062539.11728-1-kraxel@redhat.com>
References: <20191023062539.11728-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: HaOHJZxdM5u-YLv4NgN0Ag-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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
No functional change.

v2:
 - fix sparse warnings for virtio_gpu_cmd_transfer_to_host_2d call.
 - move convert_to_hw_box helper function.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  5 +++--
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 22 +++-------------------
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 19 +++++++++++++++----
 3 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0b56ba005e25..eedae2a7b532 100644
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
index 9af1ec62434f..205ec4abae2b 100644
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
index 74ad3bc3ebe8..9274c4063c70 100644
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
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
