Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DC6173C3
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 10:28:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 30C43137E;
	Wed,  8 May 2019 08:26:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5EF051108
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3D9221FB
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 4F15DAEC3;
	Wed,  8 May 2019 08:26:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v5 06/20] drm: Add VRAM MM,
	a simple memory manager for dedicated VRAM
Date: Wed,  8 May 2019 10:26:16 +0200
Message-Id: <20190508082630.15116-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508082630.15116-1-tzimmermann@suse.de>
References: <20190508082630.15116-1-tzimmermann@suse.de>
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

The VRAM MM memory manager is a helper library that manages dedicated video
memory of simple framebuffer devices. It is supported to be used with
struct drm_gem_vram_object, but does not depend on it.

The implementation is based on the respective code from ast, bochs, and
mgag200. These drivers share the exact same implementation except for type
names. The helpers are currently build with TTM. This may change in future
revisions.

v4:
	* cleanups from checkpatch.pl
v2:
	* renamed to struct drm_vram_mm
	* add drm_vram_mm_mmap() helper
	* documentation fixes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-mm.rst         |  13 +-
 drivers/gpu/drm/Makefile             |   3 +-
 drivers/gpu/drm/drm_vram_mm_helper.c | 210 +++++++++++++++++++++++++++
 include/drm/drm_vram_mm_helper.h     |  69 +++++++++
 4 files changed, 293 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_vram_mm_helper.c
 create mode 100644 include/drm/drm_vram_mm_helper.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index a3b685089512..eba50afbda42 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -79,7 +79,6 @@ count for the TTM, which will call your initialization function.
 
 See the radeon_ttm.c file for an example of usage.
 
-
 The Graphics Execution Manager (GEM)
 ====================================
 
@@ -395,6 +394,18 @@ GEM VRAM Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_gem_vram_helper.c
    :export:
 
+VRAM MM Helper Functions Reference
+----------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_vram_mm_helper.c
+   :doc: overview
+
+.. kernel-doc:: include/drm/drm_vram_mm_helper.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_vram_mm_helper.c
+   :export:
+
 VMA Offset Manager
 ==================
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ed49b2480766..4c3dc4268b65 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -33,7 +33,8 @@ drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
 
 drm_vram_helper-y := drm_gem_vram_helper.o \
-		     drm_vram_helper_common.o
+		     drm_vram_helper_common.o \
+		     drm_vram_mm_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
 drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_dsc.o drm_probe_helper.o \
diff --git a/drivers/gpu/drm/drm_vram_mm_helper.c b/drivers/gpu/drm/drm_vram_mm_helper.c
new file mode 100644
index 000000000000..d17c5169b018
--- /dev/null
+++ b/drivers/gpu/drm/drm_vram_mm_helper.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <drm/drm_vram_mm_helper.h>
+#include <drm/drmP.h>
+#include <drm/ttm/ttm_page_alloc.h>
+
+/**
+ * DOC: overview
+ *
+ * The data structure &struct drm_vram_mm and its helpers implement a memory
+ * manager for simple framebuffer devices with dedicated video memory. Buffer
+ * objects are either placed in video RAM or evicted to system memory. These
+ * helper functions work well with &struct drm_gem_vram_object.
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
diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram_mm_helper.h
new file mode 100644
index 000000000000..5d45c6447fa4
--- /dev/null
+++ b/include/drm/drm_vram_mm_helper.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef DRM_VRAM_MM_HELPER_H
+#define DRM_VRAM_MM_HELPER_H
+
+#include <drm/ttm/ttm_bo_driver.h>
+
+struct drm_device;
+
+/**
+ * struct drm_vram_mm_funcs - Callback functions for &struct drm_vram_mm
+ * @evict_flags:	Provides an implementation for struct \
+	&ttm_bo_driver.evict_flags
+ * @verify_access:	Provides an implementation for \
+	struct &ttm_bo_driver.verify_access
+ *
+ * These callback function integrate VRAM MM with TTM buffer objects. New
+ * functions can be added if necessary.
+ */
+struct drm_vram_mm_funcs {
+	void (*evict_flags)(struct ttm_buffer_object *bo,
+			    struct ttm_placement *placement);
+	int (*verify_access)(struct ttm_buffer_object *bo, struct file *filp);
+};
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
+#endif
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
