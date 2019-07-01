Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 832FA1465D
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 10:31:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 66D904530;
	Mon,  6 May 2019 08:28:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BE7A2452A
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:27:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 53F881DE21
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:27:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 466FCAF34;
	Mon,  6 May 2019 08:27:02 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v4 19/19] drm/hisilicon: Convert hibmc-drm driver to VRAM MM
Date: Mon,  6 May 2019 10:26:49 +0200
Message-Id: <20190506082649.942-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506082649.942-1-tzimmermann@suse.de>
References: <20190506082649.942-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The data structure |struct drm_vram_mm| and its helpers replace hibmc's
TTM-based memory manager. It's the same implementation; except for the
type names.

v4:
	* don't select DRM_TTM or DRM_VRAM_MM_HELPER
v3:
	* use drm_gem_vram_mm_funcs
	* convert driver to drm_device-based instance
v2:
	* implement hibmc_mmap() with drm_vram_mm_mmap()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/Kconfig       |   1 -
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   8 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   8 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   | 139 ++----------------
 4 files changed, 12 insertions(+), 144 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
index 04d0bc685560..c36ec03f3d92 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -2,7 +2,6 @@ config DRM_HISI_HIBMC
 	tristate "DRM Support for Hisilicon Hibmc"
 	depends on DRM && PCI && MMU
 	select DRM_KMS_HELPER
-	select DRM_TTM
 	select DRM_VRAM_HELPER
 
 	help
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 7027a1a05768..7243603de261 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -27,14 +27,8 @@
 
 static const struct file_operations hibmc_fops = {
 	.owner		= THIS_MODULE,
-	.open		= drm_open,
-	.release	= drm_release,
-	.unlocked_ioctl	= drm_ioctl,
-	.compat_ioctl	= drm_compat_ioctl,
-	.mmap		= hibmc_mmap,
-	.poll		= drm_poll,
-	.read		= drm_read,
 	.llseek		= no_llseek,
+	DRM_VRAM_MM_FILE_OPERATIONS
 };
 
 static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 6b3430fc5148..3967693ecbdc 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -24,7 +24,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/drm_vram_mm_helper.h>
 
 struct hibmc_framebuffer {
 	struct drm_framebuffer fb;
@@ -49,13 +49,8 @@ struct hibmc_drm_private {
 	struct drm_device  *dev;
 	bool mode_config_initialized;
 
-	/* ttm */
-	struct ttm_bo_device bdev;
-	bool initialized;
-
 	/* fbdev */
 	struct hibmc_fbdev *fbdev;
-	bool mm_inited;
 };
 
 #define to_hibmc_framebuffer(x) container_of(x, struct hibmc_framebuffer, fb)
@@ -81,7 +76,6 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc);
 void hibmc_mm_fini(struct hibmc_drm_private *hibmc);
 int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 		      struct drm_mode_create_dumb *args);
-int hibmc_mmap(struct file *filp, struct vm_area_struct *vma);
 
 extern const struct drm_mode_config_funcs hibmc_mode_funcs;
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index fbf8eb048ebc..52fba8cb8ddd 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -17,157 +17,38 @@
  */
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/ttm/ttm_page_alloc.h>
 
 #include "hibmc_drm_drv.h"
 
-static inline struct hibmc_drm_private *
-hibmc_bdev(struct ttm_bo_device *bd)
-{
-	return container_of(bd, struct hibmc_drm_private, bdev);
-}
-
-static int
-hibmc_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
-		       struct ttm_mem_type_manager *man)
-{
-	switch (type) {
-	case TTM_PL_SYSTEM:
-		man->flags = TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_MASK_CACHING;
-		man->default_caching = TTM_PL_FLAG_CACHED;
-		break;
-	case TTM_PL_VRAM:
-		man->func = &ttm_bo_manager_func;
-		man->flags = TTM_MEMTYPE_FLAG_FIXED |
-			TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_FLAG_UNCACHED |
-			TTM_PL_FLAG_WC;
-		man->default_caching = TTM_PL_FLAG_WC;
-		break;
-	default:
-		DRM_ERROR("unsupported memory type %u\n", type);
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static int hibmc_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-				    struct ttm_mem_reg *mem)
-{
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
-	struct hibmc_drm_private *hibmc = hibmc_bdev(bdev);
-
-	mem->bus.addr = NULL;
-	mem->bus.offset = 0;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
-	mem->bus.base = 0;
-	mem->bus.is_iomem = false;
-	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
-		return -EINVAL;
-	switch (mem->mem_type) {
-	case TTM_PL_SYSTEM:
-		/* system memory */
-		return 0;
-	case TTM_PL_VRAM:
-		mem->bus.offset = mem->start << PAGE_SHIFT;
-		mem->bus.base = pci_resource_start(hibmc->dev->pdev, 0);
-		mem->bus.is_iomem = true;
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static void hibmc_ttm_backend_destroy(struct ttm_tt *tt)
-{
-	ttm_tt_fini(tt);
-	kfree(tt);
-}
-
-static struct ttm_backend_func hibmc_tt_backend_func = {
-	.destroy = &hibmc_ttm_backend_destroy,
-};
-
-static struct ttm_tt *hibmc_ttm_tt_create(struct ttm_buffer_object *bo,
-					  u32 page_flags)
-{
-	struct ttm_tt *tt;
-	int ret;
-
-	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
-	if (!tt) {
-		DRM_ERROR("failed to allocate ttm_tt\n");
-		return NULL;
-	}
-	tt->func = &hibmc_tt_backend_func;
-	ret = ttm_tt_init(tt, bo, page_flags);
-	if (ret) {
-		DRM_ERROR("failed to initialize ttm_tt: %d\n", ret);
-		kfree(tt);
-		return NULL;
-	}
-	return tt;
-}
-
-struct ttm_bo_driver hibmc_bo_driver = {
-	.ttm_tt_create		= hibmc_ttm_tt_create,
-	.init_mem_type		= hibmc_bo_init_mem_type,
-	.evict_flags		= drm_gem_vram_bo_driver_evict_flags,
-	.move			= NULL,
-	.verify_access		= drm_gem_vram_bo_driver_verify_access,
-	.io_mem_reserve		= &hibmc_ttm_io_mem_reserve,
-	.io_mem_free		= NULL,
-};
-
 int hibmc_mm_init(struct hibmc_drm_private *hibmc)
 {
+	struct drm_vram_mm *vmm;
 	int ret;
 	struct drm_device *dev = hibmc->dev;
-	struct ttm_bo_device *bdev = &hibmc->bdev;
-
-	ret = ttm_bo_device_init(&hibmc->bdev,
-				 &hibmc_bo_driver,
-				 dev->anon_inode->i_mapping,
-				 true);
-	if (ret) {
-		DRM_ERROR("error initializing bo driver: %d\n", ret);
-		return ret;
-	}
 
-	ret = ttm_bo_init_mm(bdev, TTM_PL_VRAM,
-			     hibmc->fb_size >> PAGE_SHIFT);
-	if (ret) {
-		DRM_ERROR("failed ttm VRAM init: %d\n", ret);
+	vmm = drm_vram_helper_alloc_mm(dev,
+				       pci_resource_start(dev->pdev, 0),
+				       hibmc->fb_size, &drm_gem_vram_mm_funcs);
+	if (IS_ERR(vmm)) {
+		ret = PTR_ERR(vmm);
+		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
 		return ret;
 	}
 
-	hibmc->mm_inited = true;
 	return 0;
 }
 
 void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
 {
-	if (!hibmc->mm_inited)
+	if (!hibmc->dev->vram_mm)
 		return;
 
-	ttm_bo_device_release(&hibmc->bdev);
-	hibmc->mm_inited = false;
-}
-
-int hibmc_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct hibmc_drm_private *hibmc = file_priv->minor->dev->dev_private;
-
-	return ttm_bo_mmap(filp, vma, &hibmc->bdev);
+	drm_vram_helper_release_mm(hibmc->dev);
 }
 
 int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
 		     struct drm_gem_object **obj)
 {
-	struct hibmc_drm_private *hibmc = dev->dev_private;
 	struct drm_gem_vram_object *gbo;
 	int ret;
 
@@ -177,7 +58,7 @@ int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
 	if (size == 0)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(dev, &hibmc->bdev, size, 0, false);
+	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0, false);
 	if (IS_ERR(gbo)) {
 		ret = PTR_ERR(gbo);
 		if (ret != -ERESTARTSYS)
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
