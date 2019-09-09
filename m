Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C72CAD9A5
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 15:05:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A80C1064;
	Mon,  9 Sep 2019 13:05:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D12DC1084
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 13:05:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B82A2832
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 13:04:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id C4641AC2C;
	Mon,  9 Sep 2019 13:04:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie, corbet@lwn.net,
	z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
	hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH 1/4] drm/vram: Move VRAM memory manager to GEM VRAM
	implementation
Date: Mon,  9 Sep 2019 15:04:50 +0200
Message-Id: <20190909130453.6718-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190909130453.6718-1-tzimmermann@suse.de>
References: <20190909130453.6718-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
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

The separation between GEM VRAM objects and and the memory manager
is artificial, as they are only used with each other. Copying both
implementations into the same file is a first step to simplifying
the code.

This patch only moves code without functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-mm.rst                  |  12 -
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/ast/ast_drv.c                 |   1 -
 drivers/gpu/drm/ast/ast_main.c                |   1 -
 drivers/gpu/drm/ast/ast_ttm.c                 |   1 -
 drivers/gpu/drm/bochs/bochs.h                 |   1 -
 drivers/gpu/drm/drm_gem_vram_helper.c         | 303 +++++++++++++++++
 drivers/gpu/drm/drm_vram_mm_helper.c          | 309 ------------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   |   1 -
 drivers/gpu/drm/mgag200/mgag200_drv.h         |   1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.h          |   2 -
 include/drm/drm_gem_vram_helper.h             |  85 +++++
 include/drm/drm_vram_mm_helper.h              |  76 -----
 14 files changed, 389 insertions(+), 408 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_vram_mm_helper.c

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index b664f054c259..9e61fef3cf5b 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -400,18 +400,6 @@ GEM VRAM Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_gem_vram_helper.c
    :export:
 
-VRAM MM Helper Functions Reference
-----------------------------------
-
-.. kernel-doc:: drivers/gpu/drm/drm_vram_mm_helper.c
-   :doc: overview
-
-.. kernel-doc:: include/drm/drm_vram_mm_helper.h
-   :internal:
-
-.. kernel-doc:: drivers/gpu/drm/drm_vram_mm_helper.c
-   :export:
-
 VMA Offset Manager
 ==================
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 82ff826b33cc..bb8cf02a604b 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -33,8 +33,7 @@ drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
 
 drm_vram_helper-y := drm_gem_vram_helper.o \
-		     drm_vram_helper_common.o \
-		     drm_vram_mm_helper.o
+		     drm_vram_helper_common.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
 drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_dsc.o drm_probe_helper.o \
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6ed6ff49efc0..e0e8770462bc 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -35,7 +35,6 @@
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_pci.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vram_mm_helper.h>
 
 #include "ast_drv.h"
 
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 50de8e47659c..21715d6a9b56 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -33,7 +33,6 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
-#include <drm/drm_vram_mm_helper.h>
 
 #include "ast_drv.h"
 
diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_ttm.c
index c52d92294171..08ba0a917593 100644
--- a/drivers/gpu/drm/ast/ast_ttm.c
+++ b/drivers/gpu/drm/ast/ast_ttm.c
@@ -30,7 +30,6 @@
 
 #include <drm/drm_print.h>
 #include <drm/drm_gem_vram_helper.h>
-#include <drm/drm_vram_mm_helper.h>
 
 #include "ast_drv.h"
 
diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index 68483a2fc12c..917767173ee6 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -10,7 +10,6 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/drm_vram_mm_helper.h>
 
 /* ---------------------------------------------------------------------- */
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 0990f0e03213..202f74453580 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -2,6 +2,7 @@
 
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_device.h>
+#include <drm/drm_file.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_vram_mm_helper.h>
@@ -14,6 +15,11 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  *
  * This library provides a GEM buffer object that is backed by video RAM
  * (VRAM). It can be used for framebuffer devices with dedicated memory.
+ *
+ * The data structure &struct drm_vram_mm and its helpers implement a memory
+ * manager for simple framebuffer devices with dedicated video memory. Buffer
+ * objects are either placed in video RAM or evicted to system memory. The rsp.
+ * buffer object is provided by &struct drm_gem_vram_object.
  */
 
 /*
@@ -734,3 +740,300 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
 	.vmap	= drm_gem_vram_object_vmap,
 	.vunmap	= drm_gem_vram_object_vunmap
 };
+
+/*
+ * VRAM memory manager
+ */
+
+/*
+ * TTM TT
+ */
+
+static void backend_func_destroy(struct ttm_tt *tt)
+{
+	ttm_tt_fini(tt);
+	kfree(tt);
+}
+
+static struct ttm_backend_func backend_func = {
+	.destroy = backend_func_destroy
+};
+
+/*
+ * TTM BO device
+ */
+
+static struct ttm_tt *bo_driver_ttm_tt_create(struct ttm_buffer_object *bo,
+					      uint32_t page_flags)
+{
+	struct ttm_tt *tt;
+	int ret;
+
+	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
+	if (!tt)
+		return NULL;
+
+	tt->func = &backend_func;
+
+	ret = ttm_tt_init(tt, bo, page_flags);
+	if (ret < 0)
+		goto err_ttm_tt_init;
+
+	return tt;
+
+err_ttm_tt_init:
+	kfree(tt);
+	return NULL;
+}
+
+static int bo_driver_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
+				   struct ttm_mem_type_manager *man)
+{
+	switch (type) {
+	case TTM_PL_SYSTEM:
+		man->flags = TTM_MEMTYPE_FLAG_MAPPABLE;
+		man->available_caching = TTM_PL_MASK_CACHING;
+		man->default_caching = TTM_PL_FLAG_CACHED;
+		break;
+	case TTM_PL_VRAM:
+		man->func = &ttm_bo_manager_func;
+		man->flags = TTM_MEMTYPE_FLAG_FIXED |
+			     TTM_MEMTYPE_FLAG_MAPPABLE;
+		man->available_caching = TTM_PL_FLAG_UNCACHED |
+					 TTM_PL_FLAG_WC;
+		man->default_caching = TTM_PL_FLAG_WC;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static void bo_driver_evict_flags(struct ttm_buffer_object *bo,
+				  struct ttm_placement *placement)
+{
+	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bo->bdev);
+
+	if (vmm->funcs && vmm->funcs->evict_flags)
+		vmm->funcs->evict_flags(bo, placement);
+}
+
+static int bo_driver_verify_access(struct ttm_buffer_object *bo,
+				   struct file *filp)
+{
+	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bo->bdev);
+
+	if (!vmm->funcs || !vmm->funcs->verify_access)
+		return 0;
+	return vmm->funcs->verify_access(bo, filp);
+}
+
+static void bo_driver_move_notify(struct ttm_buffer_object *bo,
+				  bool evict,
+				  struct ttm_mem_reg *new_mem)
+{
+	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bo->bdev);
+
+	if (!vmm->funcs || !vmm->funcs->move_notify)
+		return;
+	vmm->funcs->move_notify(bo, evict, new_mem);
+}
+
+static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
+				    struct ttm_mem_reg *mem)
+{
+	struct ttm_mem_type_manager *man = bdev->man + mem->mem_type;
+	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bdev);
+
+	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
+		return -EINVAL;
+
+	mem->bus.addr = NULL;
+	mem->bus.size = mem->num_pages << PAGE_SHIFT;
+
+	switch (mem->mem_type) {
+	case TTM_PL_SYSTEM:	/* nothing to do */
+		mem->bus.offset = 0;
+		mem->bus.base = 0;
+		mem->bus.is_iomem = false;
+		break;
+	case TTM_PL_VRAM:
+		mem->bus.offset = mem->start << PAGE_SHIFT;
+		mem->bus.base = vmm->vram_base;
+		mem->bus.is_iomem = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void bo_driver_io_mem_free(struct ttm_bo_device *bdev,
+				  struct ttm_mem_reg *mem)
+{ }
+
+static struct ttm_bo_driver bo_driver = {
+	.ttm_tt_create = bo_driver_ttm_tt_create,
+	.ttm_tt_populate = ttm_pool_populate,
+	.ttm_tt_unpopulate = ttm_pool_unpopulate,
+	.init_mem_type = bo_driver_init_mem_type,
+	.eviction_valuable = ttm_bo_eviction_valuable,
+	.evict_flags = bo_driver_evict_flags,
+	.verify_access = bo_driver_verify_access,
+	.move_notify = bo_driver_move_notify,
+	.io_mem_reserve = bo_driver_io_mem_reserve,
+	.io_mem_free = bo_driver_io_mem_free,
+};
+
+/*
+ * struct drm_vram_mm
+ */
+
+/**
+ * drm_vram_mm_init() - Initialize an instance of VRAM MM.
+ * @vmm:	the VRAM MM instance to initialize
+ * @dev:	the DRM device
+ * @vram_base:	the base address of the video memory
+ * @vram_size:	the size of the video memory in bytes
+ * @funcs:	callback functions for buffer objects
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
+		     uint64_t vram_base, size_t vram_size,
+		     const struct drm_vram_mm_funcs *funcs)
+{
+	int ret;
+
+	vmm->vram_base = vram_base;
+	vmm->vram_size = vram_size;
+	vmm->funcs = funcs;
+
+	ret = ttm_bo_device_init(&vmm->bdev, &bo_driver,
+				 dev->anon_inode->i_mapping,
+				 true);
+	if (ret)
+		return ret;
+
+	ret = ttm_bo_init_mm(&vmm->bdev, TTM_PL_VRAM, vram_size >> PAGE_SHIFT);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_vram_mm_init);
+
+/**
+ * drm_vram_mm_cleanup() - Cleans up an initialized instance of VRAM MM.
+ * @vmm:	the VRAM MM instance to clean up
+ */
+void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
+{
+	ttm_bo_device_release(&vmm->bdev);
+}
+EXPORT_SYMBOL(drm_vram_mm_cleanup);
+
+/**
+ * drm_vram_mm_mmap() - Helper for implementing &struct file_operations.mmap()
+ * @filp:	the mapping's file structure
+ * @vma:	the mapping's memory area
+ * @vmm:	the VRAM MM instance
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
+		     struct drm_vram_mm *vmm)
+{
+	return ttm_bo_mmap(filp, vma, &vmm->bdev);
+}
+EXPORT_SYMBOL(drm_vram_mm_mmap);
+
+/*
+ * Helpers for integration with struct drm_device
+ */
+
+/**
+ * drm_vram_helper_alloc_mm - Allocates a device's instance of \
+	&struct drm_vram_mm
+ * @dev:	the DRM device
+ * @vram_base:	the base address of the video memory
+ * @vram_size:	the size of the video memory in bytes
+ * @funcs:	callback functions for buffer objects
+ *
+ * Returns:
+ * The new instance of &struct drm_vram_mm on success, or
+ * an ERR_PTR()-encoded errno code otherwise.
+ */
+struct drm_vram_mm *drm_vram_helper_alloc_mm(
+	struct drm_device *dev, uint64_t vram_base, size_t vram_size,
+	const struct drm_vram_mm_funcs *funcs)
+{
+	int ret;
+
+	if (WARN_ON(dev->vram_mm))
+		return dev->vram_mm;
+
+	dev->vram_mm = kzalloc(sizeof(*dev->vram_mm), GFP_KERNEL);
+	if (!dev->vram_mm)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_vram_mm_init(dev->vram_mm, dev, vram_base, vram_size, funcs);
+	if (ret)
+		goto err_kfree;
+
+	return dev->vram_mm;
+
+err_kfree:
+	kfree(dev->vram_mm);
+	dev->vram_mm = NULL;
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(drm_vram_helper_alloc_mm);
+
+/**
+ * drm_vram_helper_release_mm - Releases a device's instance of \
+	&struct drm_vram_mm
+ * @dev:	the DRM device
+ */
+void drm_vram_helper_release_mm(struct drm_device *dev)
+{
+	if (!dev->vram_mm)
+		return;
+
+	drm_vram_mm_cleanup(dev->vram_mm);
+	kfree(dev->vram_mm);
+	dev->vram_mm = NULL;
+}
+EXPORT_SYMBOL(drm_vram_helper_release_mm);
+
+/*
+ * Helpers for &struct file_operations
+ */
+
+/**
+ * drm_vram_mm_file_operations_mmap() - \
+	Implements &struct file_operations.mmap()
+ * @filp:	the mapping's file structure
+ * @vma:	the mapping's memory area
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_vram_mm_file_operations_mmap(
+	struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_file *file_priv = filp->private_data;
+	struct drm_device *dev = file_priv->minor->dev;
+
+	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
+		return -EINVAL;
+
+	return drm_vram_mm_mmap(filp, vma, dev->vram_mm);
+}
+EXPORT_SYMBOL(drm_vram_mm_file_operations_mmap);
diff --git a/drivers/gpu/drm/drm_vram_mm_helper.c b/drivers/gpu/drm/drm_vram_mm_helper.c
deleted file mode 100644
index 31984690d5f3..000000000000
--- a/drivers/gpu/drm/drm_vram_mm_helper.c
+++ /dev/null
@@ -1,309 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-
-#include <drm/drm_device.h>
-#include <drm/drm_file.h>
-#include <drm/drm_vram_mm_helper.h>
-
-#include <drm/ttm/ttm_page_alloc.h>
-
-/**
- * DOC: overview
- *
- * The data structure &struct drm_vram_mm and its helpers implement a memory
- * manager for simple framebuffer devices with dedicated video memory. Buffer
- * objects are either placed in video RAM or evicted to system memory. These
- * helper functions work well with &struct drm_gem_vram_object.
- */
-
-/*
- * TTM TT
- */
-
-static void backend_func_destroy(struct ttm_tt *tt)
-{
-	ttm_tt_fini(tt);
-	kfree(tt);
-}
-
-static struct ttm_backend_func backend_func = {
-	.destroy = backend_func_destroy
-};
-
-/*
- * TTM BO device
- */
-
-static struct ttm_tt *bo_driver_ttm_tt_create(struct ttm_buffer_object *bo,
-					      uint32_t page_flags)
-{
-	struct ttm_tt *tt;
-	int ret;
-
-	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
-	if (!tt)
-		return NULL;
-
-	tt->func = &backend_func;
-
-	ret = ttm_tt_init(tt, bo, page_flags);
-	if (ret < 0)
-		goto err_ttm_tt_init;
-
-	return tt;
-
-err_ttm_tt_init:
-	kfree(tt);
-	return NULL;
-}
-
-static int bo_driver_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
-				   struct ttm_mem_type_manager *man)
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
-			     TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_FLAG_UNCACHED |
-					 TTM_PL_FLAG_WC;
-		man->default_caching = TTM_PL_FLAG_WC;
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static void bo_driver_evict_flags(struct ttm_buffer_object *bo,
-				  struct ttm_placement *placement)
-{
-	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bo->bdev);
-
-	if (vmm->funcs && vmm->funcs->evict_flags)
-		vmm->funcs->evict_flags(bo, placement);
-}
-
-static int bo_driver_verify_access(struct ttm_buffer_object *bo,
-				   struct file *filp)
-{
-	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bo->bdev);
-
-	if (!vmm->funcs || !vmm->funcs->verify_access)
-		return 0;
-	return vmm->funcs->verify_access(bo, filp);
-}
-
-static void bo_driver_move_notify(struct ttm_buffer_object *bo,
-				  bool evict,
-				  struct ttm_mem_reg *new_mem)
-{
-	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bo->bdev);
-
-	if (!vmm->funcs || !vmm->funcs->move_notify)
-		return;
-	vmm->funcs->move_notify(bo, evict, new_mem);
-}
-
-static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
-				    struct ttm_mem_reg *mem)
-{
-	struct ttm_mem_type_manager *man = bdev->man + mem->mem_type;
-	struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bdev);
-
-	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
-		return -EINVAL;
-
-	mem->bus.addr = NULL;
-	mem->bus.size = mem->num_pages << PAGE_SHIFT;
-
-	switch (mem->mem_type) {
-	case TTM_PL_SYSTEM:	/* nothing to do */
-		mem->bus.offset = 0;
-		mem->bus.base = 0;
-		mem->bus.is_iomem = false;
-		break;
-	case TTM_PL_VRAM:
-		mem->bus.offset = mem->start << PAGE_SHIFT;
-		mem->bus.base = vmm->vram_base;
-		mem->bus.is_iomem = true;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static void bo_driver_io_mem_free(struct ttm_bo_device *bdev,
-				  struct ttm_mem_reg *mem)
-{ }
-
-static struct ttm_bo_driver bo_driver = {
-	.ttm_tt_create = bo_driver_ttm_tt_create,
-	.ttm_tt_populate = ttm_pool_populate,
-	.ttm_tt_unpopulate = ttm_pool_unpopulate,
-	.init_mem_type = bo_driver_init_mem_type,
-	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = bo_driver_evict_flags,
-	.verify_access = bo_driver_verify_access,
-	.move_notify = bo_driver_move_notify,
-	.io_mem_reserve = bo_driver_io_mem_reserve,
-	.io_mem_free = bo_driver_io_mem_free,
-};
-
-/*
- * struct drm_vram_mm
- */
-
-/**
- * drm_vram_mm_init() - Initialize an instance of VRAM MM.
- * @vmm:	the VRAM MM instance to initialize
- * @dev:	the DRM device
- * @vram_base:	the base address of the video memory
- * @vram_size:	the size of the video memory in bytes
- * @funcs:	callback functions for buffer objects
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
-		     uint64_t vram_base, size_t vram_size,
-		     const struct drm_vram_mm_funcs *funcs)
-{
-	int ret;
-
-	vmm->vram_base = vram_base;
-	vmm->vram_size = vram_size;
-	vmm->funcs = funcs;
-
-	ret = ttm_bo_device_init(&vmm->bdev, &bo_driver,
-				 dev->anon_inode->i_mapping,
-				 true);
-	if (ret)
-		return ret;
-
-	ret = ttm_bo_init_mm(&vmm->bdev, TTM_PL_VRAM, vram_size >> PAGE_SHIFT);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_vram_mm_init);
-
-/**
- * drm_vram_mm_cleanup() - Cleans up an initialized instance of VRAM MM.
- * @vmm:	the VRAM MM instance to clean up
- */
-void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
-{
-	ttm_bo_device_release(&vmm->bdev);
-}
-EXPORT_SYMBOL(drm_vram_mm_cleanup);
-
-/**
- * drm_vram_mm_mmap() - Helper for implementing &struct file_operations.mmap()
- * @filp:	the mapping's file structure
- * @vma:	the mapping's memory area
- * @vmm:	the VRAM MM instance
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
-		     struct drm_vram_mm *vmm)
-{
-	return ttm_bo_mmap(filp, vma, &vmm->bdev);
-}
-EXPORT_SYMBOL(drm_vram_mm_mmap);
-
-/*
- * Helpers for integration with struct drm_device
- */
-
-/**
- * drm_vram_helper_alloc_mm - Allocates a device's instance of \
-	&struct drm_vram_mm
- * @dev:	the DRM device
- * @vram_base:	the base address of the video memory
- * @vram_size:	the size of the video memory in bytes
- * @funcs:	callback functions for buffer objects
- *
- * Returns:
- * The new instance of &struct drm_vram_mm on success, or
- * an ERR_PTR()-encoded errno code otherwise.
- */
-struct drm_vram_mm *drm_vram_helper_alloc_mm(
-	struct drm_device *dev, uint64_t vram_base, size_t vram_size,
-	const struct drm_vram_mm_funcs *funcs)
-{
-	int ret;
-
-	if (WARN_ON(dev->vram_mm))
-		return dev->vram_mm;
-
-	dev->vram_mm = kzalloc(sizeof(*dev->vram_mm), GFP_KERNEL);
-	if (!dev->vram_mm)
-		return ERR_PTR(-ENOMEM);
-
-	ret = drm_vram_mm_init(dev->vram_mm, dev, vram_base, vram_size, funcs);
-	if (ret)
-		goto err_kfree;
-
-	return dev->vram_mm;
-
-err_kfree:
-	kfree(dev->vram_mm);
-	dev->vram_mm = NULL;
-	return ERR_PTR(ret);
-}
-EXPORT_SYMBOL(drm_vram_helper_alloc_mm);
-
-/**
- * drm_vram_helper_release_mm - Releases a device's instance of \
-	&struct drm_vram_mm
- * @dev:	the DRM device
- */
-void drm_vram_helper_release_mm(struct drm_device *dev)
-{
-	if (!dev->vram_mm)
-		return;
-
-	drm_vram_mm_cleanup(dev->vram_mm);
-	kfree(dev->vram_mm);
-	dev->vram_mm = NULL;
-}
-EXPORT_SYMBOL(drm_vram_helper_release_mm);
-
-/*
- * Helpers for &struct file_operations
- */
-
-/**
- * drm_vram_mm_file_operations_mmap() - \
-	Implements &struct file_operations.mmap()
- * @filp:	the mapping's file structure
- * @vma:	the mapping's memory area
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_vram_mm_file_operations_mmap(
-	struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct drm_device *dev = file_priv->minor->dev;
-
-	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
-		return -EINVAL;
-
-	return drm_vram_mm_mmap(filp, vma, dev->vram_mm);
-}
-EXPORT_SYMBOL(drm_vram_mm_file_operations_mmap);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index c103005b0a33..4f52c83b9b4c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -22,7 +22,6 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_vram_mm_helper.h>
 
 #include "hibmc_drm_drv.h"
 #include "hibmc_drm_regs.h"
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 9f6e473e6295..5d52cd748603 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -17,7 +17,6 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_print.h>
-#include <drm/drm_vram_mm_helper.h>
 
 #include "hibmc_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 1c93f8dc08c7..37c003ed57c0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -19,7 +19,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
-#include <drm/drm_vram_mm_helper.h>
 
 #include "mgag200_reg.h"
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
index e8cb9efc6088..fb436ec760ea 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
@@ -20,8 +20,6 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
 
-#include <drm/drm_vram_mm_helper.h>
-
 #include "vboxvideo_guest.h"
 #include "vboxvideo_vbe.h"
 #include "hgsmi_ch_setup.h"
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index b47c46516466..af7450851c09 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -3,9 +3,13 @@
 #ifndef DRM_GEM_VRAM_HELPER_H
 #define DRM_GEM_VRAM_HELPER_H
 
+#include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
 #include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+
 #include <linux/kernel.h> /* for container_of() */
 
 struct drm_mode_create_dumb;
@@ -144,4 +148,85 @@ int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
 	.dumb_map_offset	  = drm_gem_vram_driver_dumb_mmap_offset, \
 	.gem_prime_mmap		  = drm_gem_prime_mmap
 
+/*
+ *  VRAM memory manager
+ */
+
+/**
+ * struct drm_vram_mm - An instance of VRAM MM
+ * @vram_base:	Base address of the managed video memory
+ * @vram_size:	Size of the managed video memory in bytes
+ * @bdev:	The TTM BO device.
+ * @funcs:	TTM BO functions
+ *
+ * The fields &struct drm_vram_mm.vram_base and
+ * &struct drm_vram_mm.vrm_size are managed by VRAM MM, but are
+ * available for public read access. Use the field
+ * &struct drm_vram_mm.bdev to access the TTM BO device.
+ */
+struct drm_vram_mm {
+	uint64_t vram_base;
+	size_t vram_size;
+
+	struct ttm_bo_device bdev;
+
+	const struct drm_vram_mm_funcs *funcs;
+};
+
+/**
+ * drm_vram_mm_of_bdev() - \
+	Returns the container of type &struct ttm_bo_device for field bdev.
+ * @bdev:	the TTM BO device
+ *
+ * Returns:
+ * The containing instance of &struct drm_vram_mm
+ */
+static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
+	struct ttm_bo_device *bdev)
+{
+	return container_of(bdev, struct drm_vram_mm, bdev);
+}
+
+int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
+		     uint64_t vram_base, size_t vram_size,
+		     const struct drm_vram_mm_funcs *funcs);
+void drm_vram_mm_cleanup(struct drm_vram_mm *vmm);
+
+int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
+		     struct drm_vram_mm *vmm);
+
+/*
+ * Helpers for integration with struct drm_device
+ */
+
+struct drm_vram_mm *drm_vram_helper_alloc_mm(
+	struct drm_device *dev, uint64_t vram_base, size_t vram_size,
+	const struct drm_vram_mm_funcs *funcs);
+void drm_vram_helper_release_mm(struct drm_device *dev);
+
+/*
+ * Helpers for &struct file_operations
+ */
+
+int drm_vram_mm_file_operations_mmap(
+	struct file *filp, struct vm_area_struct *vma);
+
+/**
+ * define DRM_VRAM_MM_FILE_OPERATIONS - default callback functions for \
+	&struct file_operations
+ *
+ * Drivers that use VRAM MM can use this macro to initialize
+ * &struct file_operations with default functions.
+ */
+#define DRM_VRAM_MM_FILE_OPERATIONS \
+	.llseek		= no_llseek, \
+	.read		= drm_read, \
+	.poll		= drm_poll, \
+	.unlocked_ioctl = drm_ioctl, \
+	.compat_ioctl	= drm_compat_ioctl, \
+	.mmap		= drm_vram_mm_file_operations_mmap, \
+	.open		= drm_open, \
+	.release	= drm_release \
+
+
 #endif
diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram_mm_helper.h
index 7fb8700f45fe..e3b79e13e106 100644
--- a/include/drm/drm_vram_mm_helper.h
+++ b/include/drm/drm_vram_mm_helper.h
@@ -29,80 +29,4 @@ struct drm_vram_mm_funcs {
 			    struct ttm_mem_reg *new_mem);
 };
 
-/**
- * struct drm_vram_mm - An instance of VRAM MM
- * @vram_base:	Base address of the managed video memory
- * @vram_size:	Size of the managed video memory in bytes
- * @bdev:	The TTM BO device.
- * @funcs:	TTM BO functions
- *
- * The fields &struct drm_vram_mm.vram_base and
- * &struct drm_vram_mm.vrm_size are managed by VRAM MM, but are
- * available for public read access. Use the field
- * &struct drm_vram_mm.bdev to access the TTM BO device.
- */
-struct drm_vram_mm {
-	uint64_t vram_base;
-	size_t vram_size;
-
-	struct ttm_bo_device bdev;
-
-	const struct drm_vram_mm_funcs *funcs;
-};
-
-/**
- * drm_vram_mm_of_bdev() - \
-	Returns the container of type &struct ttm_bo_device for field bdev.
- * @bdev:	the TTM BO device
- *
- * Returns:
- * The containing instance of &struct drm_vram_mm
- */
-static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
-	struct ttm_bo_device *bdev)
-{
-	return container_of(bdev, struct drm_vram_mm, bdev);
-}
-
-int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
-		     uint64_t vram_base, size_t vram_size,
-		     const struct drm_vram_mm_funcs *funcs);
-void drm_vram_mm_cleanup(struct drm_vram_mm *vmm);
-
-int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
-		     struct drm_vram_mm *vmm);
-
-/*
- * Helpers for integration with struct drm_device
- */
-
-struct drm_vram_mm *drm_vram_helper_alloc_mm(
-	struct drm_device *dev, uint64_t vram_base, size_t vram_size,
-	const struct drm_vram_mm_funcs *funcs);
-void drm_vram_helper_release_mm(struct drm_device *dev);
-
-/*
- * Helpers for &struct file_operations
- */
-
-int drm_vram_mm_file_operations_mmap(
-	struct file *filp, struct vm_area_struct *vma);
-
-/**
- * define DRM_VRAM_MM_FILE_OPERATIONS - default callback functions for \
-	&struct file_operations
- *
- * Drivers that use VRAM MM can use this macro to initialize
- * &struct file_operations with default functions.
- */
-#define DRM_VRAM_MM_FILE_OPERATIONS \
-	.llseek		= no_llseek, \
-	.read		= drm_read, \
-	.poll		= drm_poll, \
-	.unlocked_ioctl = drm_ioctl, \
-	.compat_ioctl	= drm_compat_ioctl, \
-	.mmap		= drm_vram_mm_file_operations_mmap, \
-	.open		= drm_open, \
-	.release	= drm_release \
-
 #endif
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
