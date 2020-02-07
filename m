Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8D015528E
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 07:47:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DCD7687D7C;
	Fri,  7 Feb 2020 06:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUWUMxXjY-Vy; Fri,  7 Feb 2020 06:47:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4765687D5E;
	Fri,  7 Feb 2020 06:47:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D0C5C013E;
	Fri,  7 Feb 2020 06:47:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B1DCC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 06:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 426E4203A6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 06:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2C0xHfamW7e2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 06:47:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 3A72020363
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 06:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581058019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=xeb4SyG/vUU8Sv/SzPWNGUfZjEEExVnvsi6QA1tOQ7I=;
 b=aRN2vWUyiHFKAHwmGKbhqDMJCBhh11GsSns7lT2psGLbBKBgPP71Sud+EZG+mqrltDQAqr
 587+uiQeXCfNHwN2ki3Hqmb2mdxhb+jIf9H3xr6YEbR4EbPvMZSXKHWcZf/0Qnb1EFf6HD
 W7K9D7Ua3E9fBpRl9AKtUTxtBFr9iHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-tSM7xofLOoKO2VToq70Bbg-1; Fri, 07 Feb 2020 01:46:58 -0500
X-MC-Unique: tSM7xofLOoKO2VToq70Bbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C82B21007270;
 Fri,  7 Feb 2020 06:46:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10F0E790F2;
 Fri,  7 Feb 2020 06:46:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 646931FCD6; Fri,  7 Feb 2020 07:46:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/virtio: fix ring free check
Date: Fri,  7 Feb 2020 07:46:53 +0100
Message-Id: <20200207064653.14403-1-kraxel@redhat.com>
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

If the virtio device supports indirect ring descriptors we need only one
ring entry for the whole command.  Take that into account when checking
whenever the virtqueue has enough free entries for our command.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 1 +
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 3 +++
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 3 +++
 4 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7e69c06e168e..d278c8c50f39 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -193,6 +193,7 @@ struct virtio_gpu_device {
 
 	bool has_virgl_3d;
 	bool has_edid;
+	bool has_indirect;
 
 	struct work_struct config_changed_work;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 5156e6b279db..e27120d512b0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -47,6 +47,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 
 	virtio_add_bool(m, "virgl", vgdev->has_virgl_3d);
 	virtio_add_bool(m, "edid", vgdev->has_edid);
+	virtio_add_bool(m, "indirect", vgdev->has_indirect);
 	virtio_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_add_int(m, "scanouts", vgdev->num_scanouts);
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 2f5773e43557..c1086df49816 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -159,6 +159,9 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
 		vgdev->has_edid = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
+		vgdev->has_indirect = true;
+	}
 
 	DRM_INFO("features: %cvirgl %cedid\n",
 		 vgdev->has_virgl_3d ? '+' : '-',
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 41e475fbd67b..cc02fc4bab2a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -330,6 +330,9 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	bool notify = false;
 	int ret;
 
+	if (vgdev->has_indirect)
+		elemcnt = 1;
+
 again:
 	spin_lock(&vgdev->ctrlq.qlock);
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
