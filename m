Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D348FE548
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 16:49:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AA9AB21DD;
	Mon, 29 Apr 2019 14:46:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0219121D6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id AA5831DDC8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 8C677AFA8;
	Mon, 29 Apr 2019 14:43:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, Jerry.Zhang@amd.com,
	hdegoede@redhat.com, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH v3 14/19] drm/mgag200: Convert mgag200 driver to VRAM MM
Date: Mon, 29 Apr 2019 16:43:36 +0200
Message-Id: <20190429144341.12615-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429144341.12615-1-tzimmermann@suse.de>
References: <20190429144341.12615-1-tzimmermann@suse.de>
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

The data structure |struct drm_vram_mm| and its helpers replace mgag200's
TTM-based memory manager. It's the same implementation; except for the type
names.

v3:
	* use drm_gem_vram_mm_funcs
	* convert driver to drm_device-based instance
v2:
	* implement mgag200_mmap() with drm_vram_mm_mmap()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/Kconfig        |   1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c  |  13 +--
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  11 +-
 drivers/gpu/drm/mgag200/mgag200_main.c |  17 +---
 drivers/gpu/drm/mgag200/mgag200_ttm.c  | 133 ++-----------------------
 5 files changed, 16 insertions(+), 159 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index 52b7c3ee3064..8368fc5f4ca9 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -4,6 +4,7 @@ config DRM_MGAG200
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_GEM_VRAM_HELPER
+	select DRM_VRAM_MM_HELPER
 	help
 	 This is a KMS driver for the MGA G200 server chips, it
          does not support the original MGA G200 or any of the desktop
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 85c3ed7f0385..93bd1589e50e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -59,13 +59,7 @@ static void mga_pci_remove(struct pci_dev *pdev)
 
 static const struct file_operations mgag200_driver_fops = {
 	.owner = THIS_MODULE,
-	.open = drm_open,
-	.release = drm_release,
-	.unlocked_ioctl = drm_ioctl,
-	.mmap = mgag200_mmap,
-	.poll = drm_poll,
-	.compat_ioctl = drm_compat_ioctl,
-	.read = drm_read,
+	DRM_VRAM_MM_FILE_OPERATIONS
 };
 
 static struct drm_driver driver = {
@@ -79,10 +73,7 @@ static struct drm_driver driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-
-	.gem_free_object_unlocked = drm_gem_vram_driver_gem_free_object_unlocked,
-	.dumb_create = mgag200_dumb_create,
-	.dumb_map_offset = drm_gem_vram_driver_dumb_mmap_offset,
+	DRM_GEM_VRAM_DRIVER
 };
 
 static struct pci_driver mgag200_pci_driver = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 86b33e23ab7f..16ce6b338dce 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -17,15 +17,12 @@
 
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_memory.h>
-#include <drm/ttm/ttm_module.h>
 
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
 
+#include <drm/drm_vram_mm_helper.h>
+
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
@@ -212,10 +209,6 @@ struct mga_device {
 
 	int fb_mtrr;
 
-	struct {
-		struct ttm_bo_device bdev;
-	} ttm;
-
 	/* SE model number stored in reg 0x1e24 */
 	u32 unique_rev_id;
 };
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 59a4028a5c6c..f3687fed4075 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -230,10 +230,10 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	}
 
 	/* Make small buffers to store a hardware cursor (double buffered icon updates) */
-	mdev->cursor.pixels_1 = drm_gem_vram_create(dev, &mdev->ttm.bdev,
+	mdev->cursor.pixels_1 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
 						    roundup(48*64, PAGE_SIZE),
 						    0, 0);
-	mdev->cursor.pixels_2 = drm_gem_vram_create(dev, &mdev->ttm.bdev,
+	mdev->cursor.pixels_2 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
 						    roundup(48*64, PAGE_SIZE),
 						    0, 0);
 	if (IS_ERR(mdev->cursor.pixels_2) || IS_ERR(mdev->cursor.pixels_1)) {
@@ -274,7 +274,6 @@ int mgag200_gem_create(struct drm_device *dev,
 		   u32 size, bool iskernel,
 		   struct drm_gem_object **obj)
 {
-	struct mga_device *mdev = dev->dev_private;
 	struct drm_gem_vram_object *gbo;
 	int ret;
 
@@ -284,7 +283,7 @@ int mgag200_gem_create(struct drm_device *dev,
 	if (size == 0)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(dev, &mdev->ttm.bdev, size, 0, false);
+	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0, false);
 	if (IS_ERR(gbo)) {
 		ret = PTR_ERR(gbo);
 		if (ret != -ERESTARTSYS)
@@ -294,13 +293,3 @@ int mgag200_gem_create(struct drm_device *dev,
 	*obj = &gbo->gem;
 	return 0;
 }
-
-int mgag200_dumb_create(struct drm_file *file,
-		    struct drm_device *dev,
-		    struct drm_mode_create_dumb *args)
-{
-	struct mga_device *mdev = dev->dev_private;
-
-	return drm_gem_vram_fill_create_dumb(file, dev, &mdev->ttm.bdev, 0,
-					    false, args);
-}
diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/mgag200/mgag200_ttm.c
index 2c0249086bf9..59294c0fd24a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ttm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ttm.c
@@ -26,130 +26,21 @@
  * Authors: Dave Airlie <airlied@redhat.com>
  */
 #include <drm/drmP.h>
-#include <drm/ttm/ttm_page_alloc.h>
 
 #include "mgag200_drv.h"
 
-static inline struct mga_device *
-mgag200_bdev(struct ttm_bo_device *bd)
-{
-	return container_of(bd, struct mga_device, ttm.bdev);
-}
-
-static int
-mgag200_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
-		     struct ttm_mem_type_manager *man)
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
-		DRM_ERROR("Unsupported memory type %u\n", (unsigned)type);
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static int mgag200_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-				  struct ttm_mem_reg *mem)
-{
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
-	struct mga_device *mdev = mgag200_bdev(bdev);
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
-		mem->bus.base = pci_resource_start(mdev->dev->pdev, 0);
-		mem->bus.is_iomem = true;
-		break;
-	default:
-		return -EINVAL;
-		break;
-	}
-	return 0;
-}
-
-static void mgag200_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
-{
-}
-
-static void mgag200_ttm_backend_destroy(struct ttm_tt *tt)
-{
-	ttm_tt_fini(tt);
-	kfree(tt);
-}
-
-static struct ttm_backend_func mgag200_tt_backend_func = {
-	.destroy = &mgag200_ttm_backend_destroy,
-};
-
-
-static struct ttm_tt *mgag200_ttm_tt_create(struct ttm_buffer_object *bo,
-					    uint32_t page_flags)
-{
-	struct ttm_tt *tt;
-
-	tt = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
-	if (tt == NULL)
-		return NULL;
-	tt->func = &mgag200_tt_backend_func;
-	if (ttm_tt_init(tt, bo, page_flags)) {
-		kfree(tt);
-		return NULL;
-	}
-	return tt;
-}
-
-struct ttm_bo_driver mgag200_bo_driver = {
-	.ttm_tt_create = mgag200_ttm_tt_create,
-	.init_mem_type = mgag200_bo_init_mem_type,
-	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = drm_gem_vram_bo_driver_evict_flags,
-	.move = NULL,
-	.verify_access = drm_gem_vram_bo_driver_verify_access,
-	.io_mem_reserve = &mgag200_ttm_io_mem_reserve,
-	.io_mem_free = &mgag200_ttm_io_mem_free,
-};
-
 int mgag200_mm_init(struct mga_device *mdev)
 {
+	struct drm_vram_mm *vmm;
 	int ret;
 	struct drm_device *dev = mdev->dev;
-	struct ttm_bo_device *bdev = &mdev->ttm.bdev;
-
-	ret = ttm_bo_device_init(&mdev->ttm.bdev,
-				 &mgag200_bo_driver,
-				 dev->anon_inode->i_mapping,
-				 true);
-	if (ret) {
-		DRM_ERROR("Error initialising bo driver; %d\n", ret);
-		return ret;
-	}
 
-	ret = ttm_bo_init_mm(bdev, TTM_PL_VRAM, mdev->mc.vram_size >> PAGE_SHIFT);
-	if (ret) {
-		DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
+	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
+				       mdev->mc.vram_size,
+				       &drm_gem_vram_mm_funcs);
+	if (IS_ERR(vmm)) {
+		ret = PTR_ERR(vmm);
+		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
 		return ret;
 	}
 
@@ -166,18 +57,10 @@ void mgag200_mm_fini(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
 
-	ttm_bo_device_release(&mdev->ttm.bdev);
+	drm_vram_helper_release_mm(dev);
 
 	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
 				pci_resource_len(dev->pdev, 0));
 	arch_phys_wc_del(mdev->fb_mtrr);
 	mdev->fb_mtrr = 0;
 }
-
-int mgag200_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct mga_device *mdev = file_priv->minor->dev->dev_private;
-
-	return ttm_bo_mmap(filp, vma, &mdev->ttm.bdev);
-}
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
