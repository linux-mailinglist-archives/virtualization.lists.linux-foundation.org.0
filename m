Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 719B9832C4
	for <lists.virtualization@lfdr.de>; Tue,  6 Aug 2019 15:35:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0B971E1E;
	Tue,  6 Aug 2019 13:35:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EBAA4C11
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 13:35:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 72260829
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 13:35:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E586F629C0;
	Tue,  6 Aug 2019 13:34:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
	[10.36.116.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 291F61A269;
	Tue,  6 Aug 2019 13:34:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3773117473; Tue,  6 Aug 2019 15:34:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/qxl: switch qxl to use the new ttm helpers.
Date: Tue,  6 Aug 2019 15:34:54 +0200
Message-Id: <20190806133454.8254-4-kraxel@redhat.com>
In-Reply-To: <20190806133454.8254-1-kraxel@redhat.com>
References: <20190806133454.8254-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 06 Aug 2019 13:35:00 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_drv.h    |  4 +---
 drivers/gpu/drm/qxl/qxl_object.h |  5 -----
 drivers/gpu/drm/qxl/qxl_drv.c    |  2 +-
 drivers/gpu/drm/qxl/qxl_dumb.c   | 17 -----------------
 drivers/gpu/drm/qxl/qxl_ioctl.c  |  5 +++--
 drivers/gpu/drm/qxl/Kconfig      |  1 +
 6 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 9e034c5fa87d..82efbe76062a 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -38,6 +38,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_gem.h>
 #include <drm/qxl_drm.h>
@@ -347,9 +348,6 @@ int qxl_bo_kmap(struct qxl_bo *bo, void **ptr);
 int qxl_mode_dumb_create(struct drm_file *file_priv,
 			 struct drm_device *dev,
 			 struct drm_mode_create_dumb *args);
-int qxl_mode_dumb_mmap(struct drm_file *filp,
-		       struct drm_device *dev,
-		       uint32_t handle, uint64_t *offset_p);
 
 /* qxl ttm */
 int qxl_ttm_init(struct qxl_device *qdev);
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 8ae54ba7857c..1f0316ebcfd0 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -58,11 +58,6 @@ static inline unsigned long qxl_bo_size(struct qxl_bo *bo)
 	return bo->tbo.num_pages << PAGE_SHIFT;
 }
 
-static inline u64 qxl_bo_mmap_offset(struct qxl_bo *bo)
-{
-	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
-}
-
 static inline int qxl_bo_wait(struct qxl_bo *bo, u32 *mem_type,
 			      bool no_wait)
 {
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index c1802e01d9f6..18249110aa56 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -252,7 +252,7 @@ static struct drm_driver qxl_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 
 	.dumb_create = qxl_mode_dumb_create,
-	.dumb_map_offset = qxl_mode_dumb_mmap,
+	.dumb_map_offset = drm_gem_ttm_driver_dumb_mmap_offset,
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = qxl_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/qxl/qxl_dumb.c b/drivers/gpu/drm/qxl/qxl_dumb.c
index 272d19b677d8..bd3b16a701a6 100644
--- a/drivers/gpu/drm/qxl/qxl_dumb.c
+++ b/drivers/gpu/drm/qxl/qxl_dumb.c
@@ -69,20 +69,3 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 	args->handle = handle;
 	return 0;
 }
-
-int qxl_mode_dumb_mmap(struct drm_file *file_priv,
-		       struct drm_device *dev,
-		       uint32_t handle, uint64_t *offset_p)
-{
-	struct drm_gem_object *gobj;
-	struct qxl_bo *qobj;
-
-	BUG_ON(!offset_p);
-	gobj = drm_gem_object_lookup(file_priv, handle);
-	if (gobj == NULL)
-		return -ENOENT;
-	qobj = gem_to_qxl_bo(gobj);
-	*offset_p = qxl_bo_mmap_offset(qobj);
-	drm_gem_object_put_unlocked(gobj);
-	return 0;
-}
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 8117a45b3610..b1cc38ed0ed4 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -67,8 +67,9 @@ static int qxl_map_ioctl(struct drm_device *dev, void *data,
 	struct qxl_device *qdev = dev->dev_private;
 	struct drm_qxl_map *qxl_map = data;
 
-	return qxl_mode_dumb_mmap(file_priv, &qdev->ddev, qxl_map->handle,
-				  &qxl_map->offset);
+	return drm_gem_ttm_driver_dumb_mmap_offset(file_priv, &qdev->ddev,
+						   qxl_map->handle,
+						   &qxl_map->offset);
 }
 
 struct qxl_reloc_info {
diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
index d0d691b31f4a..bfe90c7d17b2 100644
--- a/drivers/gpu/drm/qxl/Kconfig
+++ b/drivers/gpu/drm/qxl/Kconfig
@@ -3,6 +3,7 @@ config DRM_QXL
 	tristate "QXL virtual GPU"
 	depends on DRM && PCI && MMU
 	select DRM_KMS_HELPER
+	select DRM_TTM_HELPER
 	select DRM_TTM
 	select CRC32
 	help
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
