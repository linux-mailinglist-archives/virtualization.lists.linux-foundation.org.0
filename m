Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B9A1638
	for <lists.virtualization@lfdr.de>; Thu, 29 Aug 2019 12:34:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC9E246CD;
	Thu, 29 Aug 2019 10:33:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5637646C5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 10:33:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DDDBD3D0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 663A03086211;
	Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02AB7100194E;
	Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8D69A31F26; Thu, 29 Aug 2019 12:33:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 15/18] drm/virtio: remove virtio_gpu_alloc_object
Date: Thu, 29 Aug 2019 12:32:58 +0200
Message-Id: <20190829103301.3539-16-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
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

Thin wrapper around virtio_gpu_object_create(),
but calling that directly works equally well.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  4 ----
 drivers/gpu/drm/virtio/virtgpu_gem.c   | 23 ++++-------------------
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  6 +++---
 3 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index b67d23ef2b11..3e5b2d1db42d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -229,10 +229,6 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 			       struct drm_file *file);
 void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 				 struct drm_file *file);
-struct virtio_gpu_object*
-virtio_gpu_alloc_object(struct drm_device *dev,
-			struct virtio_gpu_object_params *params,
-			struct virtio_gpu_fence *fence);
 int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 				struct drm_device *dev,
 				struct drm_mode_create_dumb *args);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index fb957e3183b6..b812094ae916 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -28,35 +28,20 @@
 
 #include "virtgpu_drv.h"
 
-struct virtio_gpu_object*
-virtio_gpu_alloc_object(struct drm_device *dev,
-			struct virtio_gpu_object_params *params,
-			struct virtio_gpu_fence *fence)
-{
-	struct virtio_gpu_device *vgdev = dev->dev_private;
-	struct virtio_gpu_object *obj;
-	int ret;
-
-	ret = virtio_gpu_object_create(vgdev, params, &obj, fence);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return obj;
-}
-
 int virtio_gpu_gem_create(struct drm_file *file,
 			  struct drm_device *dev,
 			  struct virtio_gpu_object_params *params,
 			  struct drm_gem_object **obj_p,
 			  uint32_t *handle_p)
 {
+	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_object *obj;
 	int ret;
 	u32 handle;
 
-	obj = virtio_gpu_alloc_object(dev, params, NULL);
-	if (IS_ERR(obj))
-		return PTR_ERR(obj);
+	ret = virtio_gpu_object_create(vgdev, params, &obj, NULL);
+	if (ret < 0)
+		return ret;
 
 	ret = drm_gem_handle_create(file, &obj->base.base, &handle);
 	if (ret) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 588a4ba1e7a4..f5083c538f9c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -256,10 +256,10 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	fence = virtio_gpu_fence_alloc(vgdev);
 	if (!fence)
 		return -ENOMEM;
-	qobj = virtio_gpu_alloc_object(dev, &params, fence);
+	ret = virtio_gpu_object_create(vgdev, &params, &qobj, fence);
 	dma_fence_put(&fence->f);
-	if (IS_ERR(qobj))
-		return PTR_ERR(qobj);
+	if (ret < 0)
+		return ret;
 	obj = &qobj->base.base;
 
 	ret = drm_gem_handle_create(file_priv, obj, &handle);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
