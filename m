Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BCBA1645
	for <lists.virtualization@lfdr.de>; Thu, 29 Aug 2019 12:35:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0853846C5;
	Thu, 29 Aug 2019 10:33:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CD77546C8
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 10:33:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3111E8B0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 10:33:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B25073695F;
	Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AEEC1001B07;
	Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id BB64631F04; Thu, 29 Aug 2019 12:33:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 12/18] drm/virtio: rework virtio_gpu_cmd_context_{attach,
	detach}_resource
Date: Thu, 29 Aug 2019 12:32:55 +0200
Message-Id: <20190829103301.3539-13-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
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
 drivers/gpu/drm/virtio/virtgpu_drv.h |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_gem.c | 24 +++++++++++-------------
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 12 ++++++++----
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 4f54bf7c02af..d5ef2514d2bd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -313,10 +313,10 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 				    uint32_t id);
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
-					    uint32_t resource_id);
+					    struct virtio_gpu_object_array *objs);
 void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
-					    uint32_t resource_id);
+					    struct virtio_gpu_object_array *objs);
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 			   void *data, uint32_t data_size,
 			   uint32_t ctx_id,
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index fd60b45aabd2..fd4eeeedaf75 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -136,19 +136,18 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 {
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
-	struct virtio_gpu_object *qobj = gem_to_virtio_gpu_obj(obj);
-	int r;
+	struct virtio_gpu_object_array *objs;
 
 	if (!vgdev->has_virgl_3d)
 		return 0;
 
-	r = virtio_gpu_object_reserve(qobj);
-	if (r)
-		return r;
+	objs = virtio_gpu_array_alloc(1);
+	if (!objs)
+		return -ENOMEM;
+	virtio_gpu_array_add_obj(objs, obj);
 
 	virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
-					       qobj->hw_res_handle);
-	virtio_gpu_object_unreserve(qobj);
+					       objs);
 	return 0;
 }
 
@@ -157,19 +156,18 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 {
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
-	struct virtio_gpu_object *qobj = gem_to_virtio_gpu_obj(obj);
-	int r;
+	struct virtio_gpu_object_array *objs;
 
 	if (!vgdev->has_virgl_3d)
 		return;
 
-	r = virtio_gpu_object_reserve(qobj);
-	if (r)
+	objs = virtio_gpu_array_alloc(1);
+	if (!objs)
 		return;
+	virtio_gpu_array_add_obj(objs, obj);
 
 	virtio_gpu_cmd_context_detach_resource(vgdev, vfpriv->ctx_id,
-						qobj->hw_res_handle);
-	virtio_gpu_object_unreserve(qobj);
+					       objs);
 }
 
 struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 20714094dddc..d00439ce0ef7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -838,34 +838,38 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
-					    uint32_t resource_id)
+					    struct virtio_gpu_object_array *objs)
 {
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_ctx_resource *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
+	vbuf->objs = objs;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_ATTACH_RESOURCE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
-	cmd_p->resource_id = cpu_to_le32(resource_id);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 
 }
 
 void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
-					    uint32_t resource_id)
+					    struct virtio_gpu_object_array *objs)
 {
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_ctx_resource *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
+	vbuf->objs = objs;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DETACH_RESOURCE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
-	cmd_p->resource_id = cpu_to_le32(resource_id);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
