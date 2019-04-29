Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE73E563
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 16:51:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2FEFC21F9;
	Mon, 29 Apr 2019 14:46:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A5A3521D6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:44:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 81D151DE57
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id DB2DAAF8D;
	Mon, 29 Apr 2019 14:43:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, Jerry.Zhang@amd.com,
	hdegoede@redhat.com, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH v3 17/19] drm/vboxvideo: Convert vboxvideo driver to VRAM MM
Date: Mon, 29 Apr 2019 16:43:39 +0200
Message-Id: <20190429144341.12615-18-tzimmermann@suse.de>
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

The data structure |struct drm_vram_mm| and its helpers replace vboxvideo's
TTM-based memory manager. It's the same implementation; except for the type
names.

v3:
	* use drm_gem_vram_mm_funcs
	* convert driver to drm_device-based instance
v2:
	* implement vbox_mmap() with drm_vram_mm_mmap()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/Kconfig     |   1 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c  |  13 +--
 drivers/gpu/drm/vboxvideo/vbox_drv.h  |  15 +--
 drivers/gpu/drm/vboxvideo/vbox_main.c |  13 +--
 drivers/gpu/drm/vboxvideo/vbox_ttm.c  | 136 ++------------------------
 5 files changed, 14 insertions(+), 164 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/Kconfig b/drivers/gpu/drm/vboxvideo/Kconfig
index 96c794a39c56..485b665a9fa4 100644
--- a/drivers/gpu/drm/vboxvideo/Kconfig
+++ b/drivers/gpu/drm/vboxvideo/Kconfig
@@ -4,6 +4,7 @@ config DRM_VBOXVIDEO
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_GEM_VRAM_HELPER
+	select DRM_VRAM_MM_HELPER
 	select GENERIC_ALLOCATOR
 	help
 	  This is a KMS driver for the virtual Graphics Card used in
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 336a8e03e151..02537ab9cc08 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -191,13 +191,7 @@ static struct pci_driver vbox_pci_driver = {
 
 static const struct file_operations vbox_fops = {
 	.owner = THIS_MODULE,
-	.open = drm_open,
-	.release = drm_release,
-	.unlocked_ioctl = drm_ioctl,
-	.compat_ioctl = drm_compat_ioctl,
-	.mmap = vbox_mmap,
-	.poll = drm_poll,
-	.read = drm_read,
+	DRM_VRAM_MM_FILE_OPERATIONS
 };
 
 static struct drm_driver driver = {
@@ -215,10 +209,7 @@ static struct drm_driver driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	.gem_free_object_unlocked =
-		drm_gem_vram_driver_gem_free_object_unlocked,
-	.dumb_create = vbox_dumb_create,
-	.dumb_map_offset = drm_gem_vram_driver_dumb_mmap_offset,
+	DRM_GEM_VRAM_DRIVER,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_export = drm_gem_prime_export,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
index 12e47392b2f9..9028f946bc06 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
@@ -20,11 +20,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
 
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_memory.h>
-#include <drm/ttm/ttm_module.h>
+#include <drm/drm_vram_mm_helper.h>
 
 #include "vboxvideo_guest.h"
 #include "vboxvideo_vbe.h"
@@ -78,10 +74,6 @@ struct vbox_private {
 
 	int fb_mtrr;
 
-	struct {
-		struct ttm_bo_device bdev;
-	} ttm;
-
 	struct mutex hw_mutex; /* protects modeset and accel/vbva accesses */
 	struct work_struct hotplug_work;
 	u32 input_mapping_width;
@@ -169,16 +161,11 @@ int vboxfb_create(struct drm_fb_helper *helper,
 		  struct drm_fb_helper_surface_size *sizes);
 void vbox_fbdev_fini(struct vbox_private *vbox);
 
-int vbox_dumb_create(struct drm_file *file,
-		     struct drm_device *dev,
-		     struct drm_mode_create_dumb *args);
-
 int vbox_mm_init(struct vbox_private *vbox);
 void vbox_mm_fini(struct vbox_private *vbox);
 
 int vbox_gem_create(struct vbox_private *vbox,
 		    u32 size, bool iskernel, struct drm_gem_object **obj);
-int vbox_mmap(struct file *filp, struct vm_area_struct *vma);
 
 /* vbox_prime.c */
 int vbox_gem_prime_pin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index 525e9fd63f4d..18693e2bf72a 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -283,7 +283,8 @@ int vbox_gem_create(struct vbox_private *vbox,
 	if (size == 0)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(&vbox->ddev, &vbox->ttm.bdev, size, 0, false);
+	gbo = drm_gem_vram_create(&vbox->ddev, &vbox->ddev.vram_mm->bdev,
+				  size, 0, false);
 	if (IS_ERR(gbo)) {
 		ret = PTR_ERR(gbo);
 		if (ret != -ERESTARTSYS)
@@ -295,13 +296,3 @@ int vbox_gem_create(struct vbox_private *vbox,
 
 	return 0;
 }
-
-int vbox_dumb_create(struct drm_file *file,
-		     struct drm_device *dev, struct drm_mode_create_dumb *args)
-{
-	struct vbox_private *vbox = dev->dev_private;
-
-	return drm_gem_vram_fill_create_dumb(file, dev, &vbox->ttm.bdev, 0,
-					    false, args);
-
-}
diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
index 0989d656eed6..b82595a9ed0f 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
@@ -8,131 +8,23 @@
  */
 #include <linux/pci.h>
 #include <drm/drm_file.h>
-#include <drm/ttm/ttm_page_alloc.h>
 #include "vbox_drv.h"
 
-static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *bd)
-{
-	return container_of(bd, struct vbox_private, ttm.bdev);
-}
-
-static int
-vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
-		      struct ttm_mem_type_manager *man)
-{
-	switch (type) {
-	case TTM_PL_SYSTEM:
-		man->flags = TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_MASK_CACHING;
-		man->default_caching = TTM_PL_FLAG_CACHED;
-		break;
-	case TTM_PL_VRAM:
-		man->func = &ttm_bo_manager_func;
-		man->flags = TTM_MEMTYPE_FLAG_FIXED | TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
-		man->default_caching = TTM_PL_FLAG_WC;
-		break;
-	default:
-		DRM_ERROR("Unsupported memory type %u\n", (unsigned int)type);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-				   struct ttm_mem_reg *mem)
-{
-	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
-	struct vbox_private *vbox = vbox_bdev(bdev);
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
-		mem->bus.base = pci_resource_start(vbox->ddev.pdev, 0);
-		mem->bus.is_iomem = true;
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
-				 struct ttm_mem_reg *mem)
-{
-}
-
-static void vbox_ttm_backend_destroy(struct ttm_tt *tt)
-{
-	ttm_tt_fini(tt);
-	kfree(tt);
-}
-
-static struct ttm_backend_func vbox_tt_backend_func = {
-	.destroy = &vbox_ttm_backend_destroy,
-};
-
-static struct ttm_tt *vbox_ttm_tt_create(struct ttm_buffer_object *bo,
-					 u32 page_flags)
-{
-	struct ttm_tt *tt;
-
-	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
-	if (!tt)
-		return NULL;
-
-	tt->func = &vbox_tt_backend_func;
-	if (ttm_tt_init(tt, bo, page_flags)) {
-		kfree(tt);
-		return NULL;
-	}
-
-	return tt;
-}
-
-static struct ttm_bo_driver vbox_bo_driver = {
-	.ttm_tt_create = vbox_ttm_tt_create,
-	.init_mem_type = vbox_bo_init_mem_type,
-	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = drm_gem_vram_bo_driver_evict_flags,
-	.verify_access = drm_gem_vram_bo_driver_verify_access,
-	.io_mem_reserve = &vbox_ttm_io_mem_reserve,
-	.io_mem_free = &vbox_ttm_io_mem_free,
-};
-
 int vbox_mm_init(struct vbox_private *vbox)
 {
+	struct drm_vram_mm *vmm;
 	int ret;
 	struct drm_device *dev = &vbox->ddev;
-	struct ttm_bo_device *bdev = &vbox->ttm.bdev;
 
-	ret = ttm_bo_device_init(&vbox->ttm.bdev,
-				 &vbox_bo_driver,
-				 dev->anon_inode->i_mapping,
-				 true);
-	if (ret) {
-		DRM_ERROR("Error initialising bo driver; %d\n", ret);
+	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
+				       vbox->available_vram_size,
+				       &drm_gem_vram_mm_funcs);
+	if (IS_ERR(vmm)) {
+		ret = PTR_ERR(vmm);
+		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
 		return ret;
 	}
 
-	ret = ttm_bo_init_mm(bdev, TTM_PL_VRAM,
-			     vbox->available_vram_size >> PAGE_SHIFT);
-	if (ret) {
-		DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
-		goto err_device_release;
-	}
-
 #ifdef DRM_MTRR_WC
 	vbox->fb_mtrr = drm_mtrr_add(pci_resource_start(dev->pdev, 0),
 				     pci_resource_len(dev->pdev, 0),
@@ -142,10 +34,6 @@ int vbox_mm_init(struct vbox_private *vbox)
 					 pci_resource_len(dev->pdev, 0));
 #endif
 	return 0;
-
-err_device_release:
-	ttm_bo_device_release(&vbox->ttm.bdev);
-	return ret;
 }
 
 void vbox_mm_fini(struct vbox_private *vbox)
@@ -157,13 +45,5 @@ void vbox_mm_fini(struct vbox_private *vbox)
 #else
 	arch_phys_wc_del(vbox->fb_mtrr);
 #endif
-	ttm_bo_device_release(&vbox->ttm.bdev);
-}
-
-int vbox_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct vbox_private *vbox = file_priv->minor->dev->dev_private;
-
-	return ttm_bo_mmap(filp, vma, &vbox->ttm.bdev);
+	drm_vram_helper_release_mm(&vbox->ddev);
 }
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
