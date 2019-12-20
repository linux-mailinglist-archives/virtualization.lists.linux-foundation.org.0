Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE8127A65
	for <lists.virtualization@lfdr.de>; Fri, 20 Dec 2019 12:59:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D908A880A7;
	Fri, 20 Dec 2019 11:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBDMXvIpz7ye; Fri, 20 Dec 2019 11:59:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 09AFA88093;
	Fri, 20 Dec 2019 11:59:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7EA0C077D;
	Fri, 20 Dec 2019 11:59:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAFD6C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 11:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C75D487F19
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 11:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPifW0sAAErJ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 11:59:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8F27887F08
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576843184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=D5T5J2QDp0MajJleAAG6hZD/7a4+D+/uzfFvnFYb4i8=;
 b=BJhJgLykFNtbosDz5fOXh7jkpvsz40dPRhFC2rxOTMuqjBXn+38u2ajiv55TTwEJpIdpzU
 GXPyMJODuX7p6x42L918Yz+SoneI43ySGc20wyKul5GQaP17q6jlQHGV+8+drquVLBzJym
 jVXORnQjV8BrkGmbZOQgE3qimg79zRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-eCweR4JBNFW6n5qATd_Tug-1; Fri, 20 Dec 2019 06:59:40 -0500
X-MC-Unique: eCweR4JBNFW6n5qATd_Tug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28670801E66;
 Fri, 20 Dec 2019 11:59:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D16D63BAC;
 Fri, 20 Dec 2019 11:59:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C20FA3F13F; Fri, 20 Dec 2019 12:59:35 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/virtio: add drm_driver.release callback.
Date: Fri, 20 Dec 2019 12:59:34 +0100
Message-Id: <20191220115935.15152-4-kraxel@redhat.com>
In-Reply-To: <20191220115935.15152-1-kraxel@redhat.com>
References: <20191220115935.15152-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 8 ++++++--
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7e69c06e168e..227f7c07e61c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -216,6 +216,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
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
index 2f5773e43557..387f05a9cc18 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -237,6 +237,11 @@ void virtio_gpu_deinit(struct drm_device *dev)
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
index 5914e79d3429..619c6108d07e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -319,8 +319,10 @@ static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 	bool notify = false;
 	int ret;
 
-	if (!vgdev->vqs_ready)
+	if (!vgdev->vqs_ready) {
+		free_vbuf(vgdev, vbuf);
 		return notify;
+	}
 
 	sg_init_one(&vcmd, vbuf->buf, vbuf->size);
 	sgs[outcnt + incnt] = &vcmd;
@@ -447,8 +449,10 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
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
