Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E81464D
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 10:29:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9AB5A4535;
	Mon,  6 May 2019 08:27:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 654C34520
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:27:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 41485836
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:26:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id BBA00AC5A;
	Mon,  6 May 2019 08:26:57 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v4 09/19] drm/ast: Convert AST driver to VRAM MM
Date: Mon,  6 May 2019 10:26:39 +0200
Message-Id: <20190506082649.942-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506082649.942-1-tzimmermann@suse.de>
References: <20190506082649.942-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

The data structure |struct drm_vram_mm| and its helpers replace ast's
TTM-based memory manager. It's the same implementation; except for the
type names.

v4:
	* don't select DRM_TTM or DRM_VRAM_MM_HELPER
v3:
	* use drm_gem_vram_mm_funcs
	* convert driver to drm_device-based instance
v2:
	* implement ast_mmap() with drm_vram_mm_mmap()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Kconfig    |   1 -
 drivers/gpu/drm/ast/ast_drv.c  |  14 +---
 drivers/gpu/drm/ast/ast_drv.h  |  18 +----
 drivers/gpu/drm/ast/ast_main.c |  13 +---
 drivers/gpu/drm/ast/ast_ttm.c  | 134 ++-------------------------------
 5 files changed, 13 insertions(+), 167 deletions(-)

diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
index f3737488630b..7c7e7c57911a 100644
--- a/drivers/gpu/drm/ast/Kconfig
+++ b/drivers/gpu/drm/ast/Kconfig
@@ -1,7 +1,6 @@
 config DRM_AST
 	tristate "AST server chips"
 	depends on DRM && PCI && MMU
-	select DRM_TTM
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
 	help
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 7012b17b984f..3811997e78c4 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -205,13 +205,7 @@ static struct pci_driver ast_pci_driver = {
 
 static const struct file_operations ast_fops = {
 	.owner = THIS_MODULE,
-	.open = drm_open,
-	.release = drm_release,
-	.unlocked_ioctl = drm_ioctl,
-	.mmap = ast_mmap,
-	.poll = drm_poll,
-	.compat_ioctl = drm_compat_ioctl,
-	.read = drm_read,
+	DRM_VRAM_MM_FILE_OPERATIONS
 };
 
 static struct drm_driver driver = {
@@ -228,11 +222,7 @@ static struct drm_driver driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	.gem_free_object_unlocked =
-		drm_gem_vram_driver_gem_free_object_unlocked,
-	.dumb_create = ast_dumb_create,
-	.dumb_map_offset = drm_gem_vram_driver_dumb_mmap_offset,
-
+	DRM_GEM_VRAM_DRIVER
 };
 
 static int __init ast_init(void)
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 712838f725dc..32096a191aaf 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -31,15 +31,11 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_memory.h>
-#include <drm/ttm/ttm_module.h>
-
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
 
+#include <drm/drm_vram_mm_helper.h>
+
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
@@ -104,10 +100,6 @@ struct ast_private {
 
 	int fb_mtrr;
 
-	struct {
-		struct ttm_bo_device bdev;
-	} ttm;
-
 	struct drm_gem_object *cursor_cache;
 	uint64_t cursor_cache_gpu_addr;
 	/* Acces to this cache is protected by the crtc->mutex of the only crtc
@@ -325,10 +317,6 @@ void ast_fbdev_set_base(struct ast_private *ast, unsigned long gpu_addr);
 #define AST_MM_ALIGN_SHIFT 4
 #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
 
-extern int ast_dumb_create(struct drm_file *file,
-			   struct drm_device *dev,
-			   struct drm_mode_create_dumb *args);
-
 int ast_mm_init(struct ast_private *ast);
 void ast_mm_fini(struct ast_private *ast);
 
@@ -336,8 +324,6 @@ int ast_gem_create(struct drm_device *dev,
 		   u32 size, bool iskernel,
 		   struct drm_gem_object **obj);
 
-int ast_mmap(struct file *filp, struct vm_area_struct *vma);
-
 /* ast post */
 void ast_enable_vga(struct drm_device *dev);
 void ast_enable_mmio(struct drm_device *dev);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 61fc7b8ea470..4c7e31cb45ff 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -593,7 +593,6 @@ int ast_gem_create(struct drm_device *dev,
 		   u32 size, bool iskernel,
 		   struct drm_gem_object **obj)
 {
-	struct ast_private *ast = dev->dev_private;
 	struct drm_gem_vram_object *gbo;
 	int ret;
 
@@ -603,7 +602,7 @@ int ast_gem_create(struct drm_device *dev,
 	if (size == 0)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(dev, &ast->ttm.bdev, size, 0, false);
+	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0, false);
 	if (IS_ERR(gbo)) {
 		ret = PTR_ERR(gbo);
 		if (ret != -ERESTARTSYS)
@@ -613,13 +612,3 @@ int ast_gem_create(struct drm_device *dev,
 	*obj = &gbo->gem;
 	return 0;
 }
-
-int ast_dumb_create(struct drm_file *file,
-		    struct drm_device *dev,
-		    struct drm_mode_create_dumb *args)
-{
-	struct ast_private *ast = dev->dev_private;
-
-	return drm_gem_vram_fill_create_dumb(file, dev, &ast->ttm.bdev, 0,
-					     false, args);
-}
diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_ttm.c
index 794ebb755a5d..779c53efee8e 100644
--- a/drivers/gpu/drm/ast/ast_ttm.c
+++ b/drivers/gpu/drm/ast/ast_ttm.c
@@ -26,131 +26,21 @@
  * Authors: Dave Airlie <airlied@redhat.com>
  */
 #include <drm/drmP.h>
-#include <drm/ttm/ttm_page_alloc.h>
 
 #include "ast_drv.h"
 
-static inline struct ast_private *
-ast_bdev(struct ttm_bo_device *bd)
-{
-	return container_of(bd, struct ast_private, ttm.bdev);
-}
-
-static int
-ast_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
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
-static int ast_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-				  struct ttm_mem_reg *mem)
-{
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
-	struct ast_private *ast = ast_bdev(bdev);
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
-		mem->bus.base = pci_resource_start(ast->dev->pdev, 0);
-		mem->bus.is_iomem = true;
-		break;
-	default:
-		return -EINVAL;
-		break;
-	}
-	return 0;
-}
-
-static void ast_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
-{
-}
-
-static void ast_ttm_backend_destroy(struct ttm_tt *tt)
-{
-	ttm_tt_fini(tt);
-	kfree(tt);
-}
-
-static struct ttm_backend_func ast_tt_backend_func = {
-	.destroy = &ast_ttm_backend_destroy,
-};
-
-
-static struct ttm_tt *ast_ttm_tt_create(struct ttm_buffer_object *bo,
-					uint32_t page_flags)
-{
-	struct ttm_tt *tt;
-
-	tt = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
-	if (tt == NULL)
-		return NULL;
-	tt->func = &ast_tt_backend_func;
-	if (ttm_tt_init(tt, bo, page_flags)) {
-		kfree(tt);
-		return NULL;
-	}
-	return tt;
-}
-
-struct ttm_bo_driver ast_bo_driver = {
-	.ttm_tt_create = ast_ttm_tt_create,
-	.init_mem_type = ast_bo_init_mem_type,
-	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = drm_gem_vram_bo_driver_evict_flags,
-	.move = NULL,
-	.verify_access = drm_gem_vram_bo_driver_verify_access,
-	.io_mem_reserve = &ast_ttm_io_mem_reserve,
-	.io_mem_free = &ast_ttm_io_mem_free,
-};
-
 int ast_mm_init(struct ast_private *ast)
 {
+	struct drm_vram_mm *vmm;
 	int ret;
 	struct drm_device *dev = ast->dev;
-	struct ttm_bo_device *bdev = &ast->ttm.bdev;
-
-	ret = ttm_bo_device_init(&ast->ttm.bdev,
-				 &ast_bo_driver,
-				 dev->anon_inode->i_mapping,
-				 true);
-	if (ret) {
-		DRM_ERROR("Error initialising bo driver; %d\n", ret);
-		return ret;
-	}
 
-	ret = ttm_bo_init_mm(bdev, TTM_PL_VRAM,
-			     ast->vram_size >> PAGE_SHIFT);
-	if (ret) {
-		DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
+	vmm = drm_vram_helper_alloc_mm(
+		dev, pci_resource_start(dev->pdev, 0),
+		ast->vram_size, &drm_gem_vram_mm_funcs);
+	if (IS_ERR(vmm)) {
+		ret = PTR_ERR(vmm);
+		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
 		return ret;
 	}
 
@@ -166,17 +56,9 @@ void ast_mm_fini(struct ast_private *ast)
 {
 	struct drm_device *dev = ast->dev;
 
-	ttm_bo_device_release(&ast->ttm.bdev);
+	drm_vram_helper_release_mm(dev);
 
 	arch_phys_wc_del(ast->fb_mtrr);
 	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
 				pci_resource_len(dev->pdev, 0));
 }
-
-int ast_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct ast_private *ast = file_priv->minor->dev->dev_private;
-
-	return ttm_bo_mmap(filp, vma, &ast->ttm.bdev);
-}
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
