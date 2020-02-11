Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DF092158CD5
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 11:39:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7355E8367E;
	Tue, 11 Feb 2020 10:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfOkT0EKj1Ca; Tue, 11 Feb 2020 10:38:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D749A85552;
	Tue, 11 Feb 2020 10:38:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5BCDC07FE;
	Tue, 11 Feb 2020 10:38:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06E28C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E9369875B2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z+K505+2DM5o
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:38:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9E82587527
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581417535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=WRsorsLNWt5CKXnyeD76de0tKez7QGeyMkKNMQ9fWpw=;
 b=B35vPnEzBfVy3uU7JFCJdIwpDenmpYMcqvZ970xLhIvcGFz0s4+kKurAjUKdA13QwirSHI
 ulLSfE6iulLO5XG/XieBvBg23FrD+v06aJFGrc2MhZJ8fXKi4CfU0D+mGsoQB3tos8DAsD
 DK0/GRRpYvQSUjjvyeqY2m3gnnG1x+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-FgVyUUfEOouDKTsC4KwoQw-1; Tue, 11 Feb 2020 05:38:51 -0500
X-MC-Unique: FgVyUUfEOouDKTsC4KwoQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45BD4106BC3C;
 Tue, 11 Feb 2020 10:38:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E7655C120;
 Tue, 11 Feb 2020 10:38:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3F88816E2D; Tue, 11 Feb 2020 11:38:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/virtio: add drm_driver.release callback.
Date: Tue, 11 Feb 2020 11:38:46 +0100
Message-Id: <20200211103846.22183-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
 olvaffe@gmail.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Split virtio_gpu_deinit(), move the drm shutdown and release to
virtio_gpu_release().  Drop vqs_ready variable, instead use
drm_dev_{enter,exit,unplug} to avoid touching hardware after
device removal.  Tidy up here and there.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  3 ++-
 drivers/gpu/drm/virtio/virtgpu_display.c |  1 -
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  6 +++++-
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  7 ++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 27 +++++++++++++-----------
 5 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7fd8361e1c9e..af9403e1cf78 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -32,6 +32,7 @@
 #include <linux/virtio_gpu.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
@@ -177,7 +178,6 @@ struct virtio_gpu_device {
 	struct virtio_gpu_queue ctrlq;
 	struct virtio_gpu_queue cursorq;
 	struct kmem_cache *vbufs;
-	bool vqs_ready;
 
 	bool disable_notify;
 	bool pending_notify;
@@ -219,6 +219,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 /* virtio_kms.c */
 int virtio_gpu_init(struct drm_device *dev);
 void virtio_gpu_deinit(struct drm_device *dev);
+void virtio_gpu_release(struct drm_device *dev);
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
 void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 7b0f0643bb2d..af953db4a0c9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -368,6 +368,5 @@ void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
 
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		kfree(vgdev->outputs[i].edid);
-	drm_atomic_helper_shutdown(vgdev->ddev);
 	drm_mode_config_cleanup(vgdev->ddev);
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 8cf27af3ad53..ab4bed78e656 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -31,6 +31,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 
@@ -135,7 +136,8 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
 {
 	struct drm_device *dev = vdev->priv;
 
-	drm_dev_unregister(dev);
+	drm_dev_unplug(dev);
+	drm_atomic_helper_shutdown(dev);
 	virtio_gpu_deinit(dev);
 	drm_dev_put(dev);
 }
@@ -214,4 +216,6 @@ static struct drm_driver driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+
+	.release = virtio_gpu_release,
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index c1086df49816..4009c2f97d08 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -199,7 +199,6 @@ int virtio_gpu_init(struct drm_device *dev)
 	virtio_gpu_modeset_init(vgdev);
 
 	virtio_device_ready(vgdev->vdev);
-	vgdev->vqs_ready = true;
 
 	if (num_capsets)
 		virtio_gpu_get_capsets(vgdev, num_capsets);
@@ -234,12 +233,16 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 
 	flush_work(&vgdev->obj_free_work);
-	vgdev->vqs_ready = false;
 	flush_work(&vgdev->ctrlq.dequeue_work);
 	flush_work(&vgdev->cursorq.dequeue_work);
 	flush_work(&vgdev->config_changed_work);
 	vgdev->vdev->config->reset(vgdev->vdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
+}
+
+void virtio_gpu_release(struct drm_device *dev)
+{
+	struct virtio_gpu_device *vgdev = dev->dev_private;
 
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index a682c2fcbe9a..cfe9c54f87a3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -330,7 +330,14 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	bool notify = false;
-	int ret;
+	int ret, idx;
+
+	if (!drm_dev_enter(vgdev->ddev, &idx)) {
+		if (fence && vbuf->objs)
+			virtio_gpu_array_unlock_resv(vbuf->objs);
+		free_vbuf(vgdev, vbuf);
+		return;
+	}
 
 	if (vgdev->has_indirect)
 		elemcnt = 1;
@@ -338,14 +345,6 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 again:
 	spin_lock(&vgdev->ctrlq.qlock);
 
-	if (!vgdev->vqs_ready) {
-		spin_unlock(&vgdev->ctrlq.qlock);
-
-		if (fence && vbuf->objs)
-			virtio_gpu_array_unlock_resv(vbuf->objs);
-		return;
-	}
-
 	if (vq->num_free < elemcnt) {
 		spin_unlock(&vgdev->ctrlq.qlock);
 		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
@@ -379,6 +378,7 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 		else
 			virtqueue_notify(vq);
 	}
+	drm_dev_exit(idx);
 }
 
 static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
@@ -460,12 +460,13 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 {
 	struct virtqueue *vq = vgdev->cursorq.vq;
 	struct scatterlist *sgs[1], ccmd;
+	int idx, ret, outcnt;
 	bool notify;
-	int ret;
-	int outcnt;
 
-	if (!vgdev->vqs_ready)
+	if (!drm_dev_enter(vgdev->ddev, &idx)) {
+		free_vbuf(vgdev, vbuf);
 		return;
+	}
 
 	sg_init_one(&ccmd, vbuf->buf, vbuf->size);
 	sgs[0] = &ccmd;
@@ -490,6 +491,8 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 
 	if (notify)
 		virtqueue_notify(vq);
+
+	drm_dev_exit(idx);
 }
 
 /* just create gem objects for userspace and long lived objects,
-- 
2.18.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
