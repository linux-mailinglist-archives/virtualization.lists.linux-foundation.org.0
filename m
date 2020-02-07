Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 349FD155779
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 13:14:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D5B09220E5;
	Fri,  7 Feb 2020 12:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EY5rxIAnjhDv; Fri,  7 Feb 2020 12:14:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AEA20220DA;
	Fri,  7 Feb 2020 12:14:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94DE0C013E;
	Fri,  7 Feb 2020 12:14:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69AA1C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 58EE883559
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0QGH0E2xFid
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:14:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B94E18354A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581077669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=qgdKn4lgo+b2XQi8bs8ab6gIv/l1YpMtN0ktSmN9xDI=;
 b=jLeOu4ok03INMm/LcJ0NssDbB+cd9/hf4i1077CjxuRKrG0Iy2IsLZoPKc+Yfdg1+Du6kl
 JU3+s/aC7UzDcmYcMJ5H2l+Qzy2xLrMbufrONtK9mvgwKhj14AbEpBZL9jh9Q8abz0xjM6
 6/KP7/dSAbVM7VS6xWMgeqUKYoDhDRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-1VVY6-LjOZmoqGo5Q-hRBg-1; Fri, 07 Feb 2020 07:14:25 -0500
X-MC-Unique: 1VVY6-LjOZmoqGo5Q-hRBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3E4D1088387;
 Fri,  7 Feb 2020 12:14:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB513790D8;
 Fri,  7 Feb 2020 12:14:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 470731747D; Fri,  7 Feb 2020 13:14:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: add drm_driver.release callback.
Date: Fri,  7 Feb 2020 13:14:20 +0100
Message-Id: <20200207121420.26222-1-kraxel@redhat.com>
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
virtio_gpu_release().  Also free vbufs in case we can't queue them.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c | 4 ++++
 drivers/gpu/drm/virtio/virtgpu_kms.c | 5 +++++
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 9 ++++++++-
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d278c8c50f39..09a485b001e7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -217,6 +217,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 /* virtio_kms.c */
 int virtio_gpu_init(struct drm_device *dev);
 void virtio_gpu_deinit(struct drm_device *dev);
+void virtio_gpu_release(struct drm_device *dev);
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
 void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 8cf27af3ad53..664a741a3b0b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -31,6 +31,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 
@@ -136,6 +137,7 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
 	struct drm_device *dev = vdev->priv;
 
 	drm_dev_unregister(dev);
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
index c1086df49816..b45d12e3db2a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -240,6 +240,11 @@ void virtio_gpu_deinit(struct drm_device *dev)
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
index cc02fc4bab2a..cc674b45f904 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -330,6 +330,11 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	bool notify = false;
 	int ret;
 
+	if (!vgdev->vqs_ready) {
+		free_vbuf(vgdev, vbuf);
+		return;
+	}
+
 	if (vgdev->has_indirect)
 		elemcnt = 1;
 
@@ -462,8 +467,10 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 	int ret;
 	int outcnt;
 
-	if (!vgdev->vqs_ready)
+	if (!vgdev->vqs_ready) {
+		free_vbuf(vgdev, vbuf);
 		return;
+	}
 
 	sg_init_one(&ccmd, vbuf->buf, vbuf->size);
 	sgs[0] = &ccmd;
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
