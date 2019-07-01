Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02CE549
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 16:49:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 398562197;
	Mon, 29 Apr 2019 14:46:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 58CCE21D6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id A9D591DD62
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id ABCC9AFA7;
	Mon, 29 Apr 2019 14:43:50 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, Jerry.Zhang@amd.com,
	hdegoede@redhat.com, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH v3 12/19] drm/bochs: Convert bochs driver to VRAM MM
Date: Mon, 29 Apr 2019 16:43:34 +0200
Message-Id: <20190429144341.12615-13-tzimmermann@suse.de>
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

The data structure |struct drm_vram_mm| and its helpers replace bochs'
TTM-based memory manager. It's the same implementation; except for the
type names.

v3:
	* use drm_gem_vram_mm_funcs
	* convert driver to drm_device-based instance
v2:
	* implement bochs_mmap() with drm_vram_mm_mmap()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/bochs/Kconfig     |   1 +
 drivers/gpu/drm/bochs/bochs.h     |  13 +--
 drivers/gpu/drm/bochs/bochs_drv.c |  13 +--
 drivers/gpu/drm/bochs/bochs_mm.c  | 148 ++----------------------------
 4 files changed, 13 insertions(+), 162 deletions(-)

diff --git a/drivers/gpu/drm/bochs/Kconfig b/drivers/gpu/drm/bochs/Kconfig
index c04f8041a2b9..7ad1cfe47b38 100644
--- a/drivers/gpu/drm/bochs/Kconfig
+++ b/drivers/gpu/drm/bochs/Kconfig
@@ -4,6 +4,7 @@ config DRM_BOCHS
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_GEM_VRAM_HELPER
+	select DRM_VRAM_MM_HELPER
 	help
 	  Choose this option for qemu.
 	  If M is selected the module will be called bochs-drm.
diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index 4ccf82e1ca68..323dcca256a3 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -12,8 +12,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
 
-#include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_page_alloc.h>
+#include <drm/drm_vram_mm_helper.h>
 
 /* ---------------------------------------------------------------------- */
 
@@ -74,12 +73,6 @@ struct bochs_device {
 	struct drm_device *dev;
 	struct drm_simple_display_pipe pipe;
 	struct drm_connector connector;
-
-	/* ttm */
-	struct {
-		struct ttm_bo_device bdev;
-		bool initialized;
-	} ttm;
 };
 
 /* ---------------------------------------------------------------------- */
@@ -99,10 +92,6 @@ int bochs_hw_load_edid(struct bochs_device *bochs);
 /* bochs_mm.c */
 int bochs_mm_init(struct bochs_device *bochs);
 void bochs_mm_fini(struct bochs_device *bochs);
-int bochs_mmap(struct file *filp, struct vm_area_struct *vma);
-
-int bochs_dumb_create(struct drm_file *file, struct drm_device *dev,
-		      struct drm_mode_create_dumb *args);
 
 int bochs_gem_prime_pin(struct drm_gem_object *obj);
 void bochs_gem_prime_unpin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index 4f269f464e6d..f3bb5fba30bf 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -63,14 +63,8 @@ static int bochs_load(struct drm_device *dev)
 
 static const struct file_operations bochs_fops = {
 	.owner		= THIS_MODULE,
-	.open		= drm_open,
-	.release	= drm_release,
-	.unlocked_ioctl	= drm_ioctl,
-	.compat_ioctl	= drm_compat_ioctl,
-	.poll		= drm_poll,
-	.read		= drm_read,
 	.llseek		= no_llseek,
-	.mmap           = bochs_mmap,
+	DRM_VRAM_MM_FILE_OPERATIONS
 };
 
 static struct drm_driver bochs_driver = {
@@ -82,9 +76,8 @@ static struct drm_driver bochs_driver = {
 	.date			= "20130925",
 	.major			= 1,
 	.minor			= 0,
-	.gem_free_object_unlocked = drm_gem_vram_driver_gem_free_object_unlocked,
-	.dumb_create            = bochs_dumb_create,
-	.dumb_map_offset        = drm_gem_vram_driver_dumb_mmap_offset,
+
+	DRM_GEM_VRAM_DRIVER,
 
 	.gem_prime_export = drm_gem_prime_export,
 	.gem_prime_import = drm_gem_prime_import,
diff --git a/drivers/gpu/drm/bochs/bochs_mm.c b/drivers/gpu/drm/bochs/bochs_mm.c
index 5837adc6ae17..9675d83fde37 100644
--- a/drivers/gpu/drm/bochs/bochs_mm.c
+++ b/drivers/gpu/drm/bochs/bochs_mm.c
@@ -9,157 +9,25 @@
 
 /* ---------------------------------------------------------------------- */
 
-static inline struct bochs_device *bochs_bdev(struct ttm_bo_device *bd)
-{
-	return container_of(bd, struct bochs_device, ttm.bdev);
-}
-
-static int bochs_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
-				  struct ttm_mem_type_manager *man)
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
-static int bochs_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-				    struct ttm_mem_reg *mem)
-{
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
-	struct bochs_device *bochs = bochs_bdev(bdev);
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
-		mem->bus.base = bochs->fb_base;
-		mem->bus.is_iomem = true;
-		break;
-	default:
-		return -EINVAL;
-		break;
-	}
-	return 0;
-}
-
-static void bochs_ttm_io_mem_free(struct ttm_bo_device *bdev,
-				  struct ttm_mem_reg *mem)
-{
-}
-
-static void bochs_ttm_backend_destroy(struct ttm_tt *tt)
-{
-	ttm_tt_fini(tt);
-	kfree(tt);
-}
-
-static struct ttm_backend_func bochs_tt_backend_func = {
-	.destroy = &bochs_ttm_backend_destroy,
-};
-
-static struct ttm_tt *bochs_ttm_tt_create(struct ttm_buffer_object *bo,
-					  uint32_t page_flags)
-{
-	struct ttm_tt *tt;
-
-	tt = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
-	if (tt == NULL)
-		return NULL;
-	tt->func = &bochs_tt_backend_func;
-	if (ttm_tt_init(tt, bo, page_flags)) {
-		kfree(tt);
-		return NULL;
-	}
-	return tt;
-}
-
-static struct ttm_bo_driver bochs_bo_driver = {
-	.ttm_tt_create = bochs_ttm_tt_create,
-	.init_mem_type = bochs_bo_init_mem_type,
-	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = drm_gem_vram_bo_driver_evict_flags,
-	.move = NULL,
-	.verify_access = drm_gem_vram_bo_driver_verify_access,
-	.io_mem_reserve = &bochs_ttm_io_mem_reserve,
-	.io_mem_free = &bochs_ttm_io_mem_free,
-};
-
 int bochs_mm_init(struct bochs_device *bochs)
 {
-	struct ttm_bo_device *bdev = &bochs->ttm.bdev;
-	int ret;
+	struct drm_vram_mm *vmm;
 
-	ret = ttm_bo_device_init(&bochs->ttm.bdev,
-				 &bochs_bo_driver,
-				 bochs->dev->anon_inode->i_mapping,
-				 true);
-	if (ret) {
-		DRM_ERROR("Error initialising bo driver; %d\n", ret);
-		return ret;
-	}
-
-	ret = ttm_bo_init_mm(bdev, TTM_PL_VRAM,
-			     bochs->fb_size >> PAGE_SHIFT);
-	if (ret) {
-		DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
-		return ret;
-	}
+	vmm = drm_vram_helper_alloc_mm(bochs->dev, bochs->fb_base,
+				       bochs->fb_size,
+				       &drm_gem_vram_mm_funcs);
+	if (IS_ERR(vmm))
+		return PTR_ERR(vmm);
 
-	bochs->ttm.initialized = true;
 	return 0;
 }
 
 void bochs_mm_fini(struct bochs_device *bochs)
 {
-	if (!bochs->ttm.initialized)
+	if (!bochs->dev->vram_mm)
 		return;
 
-	ttm_bo_device_release(&bochs->ttm.bdev);
-	bochs->ttm.initialized = false;
-}
-
-int bochs_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct bochs_device *bochs = file_priv->minor->dev->dev_private;
-
-	return ttm_bo_mmap(filp, vma, &bochs->ttm.bdev);
-}
-
-/* ---------------------------------------------------------------------- */
-
-int bochs_dumb_create(struct drm_file *file, struct drm_device *dev,
-		      struct drm_mode_create_dumb *args)
-{
-	struct bochs_device *bochs = dev->dev_private;
-
-	return drm_gem_vram_fill_create_dumb(file, dev, &bochs->ttm.bdev, 0,
-					     false, args);
+	drm_vram_helper_release_mm(bochs->dev);
 }
 
 /* ---------------------------------------------------------------------- */
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
