Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E963B173B9
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 10:27:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8567EB9;
	Wed,  8 May 2019 08:26:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4618EEB9
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF30C1FB
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id AAD28AE51;
	Wed,  8 May 2019 08:26:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v5 01/20] drm: Add |struct drm_gem_vram_object| and helpers
Date: Wed,  8 May 2019 10:26:11 +0200
Message-Id: <20190508082630.15116-2-tzimmermann@suse.de>
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

The type |struct drm_gem_vram_object| implements a GEM object for simple
framebuffer devices with dedicated video memory. The BO is either located
in VRAM or system memory.

The implementation has been created from the respective code in ast,
bochs and mgag200. These drivers copy their implementation from each
other; except for the names of several data types. The helpers are
currently build with TTM, but this is considered an implementation
detail and may change in future updates.

v5:
	* do WARN_ON_ONCE for pin-count mismatches
	* allocate only 2 entries in placements array
v4:
	* cleanups from checkpatch.pl
	* removed several fixed-size types from interfaces
	* DRM_VRAM_HELPER now selects DRM_TTM
	* remove separate config option for GEM VRAM
v2:
	* rename to |struct drm_gem_vram_object|
	* move drm_is_gem_ttm() to a later patch in the series
	* add drm_gem_vram_kmap_at()
	* return is_iomem from kmap functions
	* redefine TTM placement flags for public interface
	* documentation fixes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-mm.rst             |  15 +
 drivers/gpu/drm/Kconfig                  |   7 +
 drivers/gpu/drm/Makefile                 |   4 +
 drivers/gpu/drm/drm_gem_vram_helper.c    | 412 +++++++++++++++++++++++
 drivers/gpu/drm/drm_vram_helper_common.c |   6 +
 include/drm/drm_gem_vram_helper.h        |  92 +++++
 6 files changed, 536 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_gem_vram_helper.c
 create mode 100644 drivers/gpu/drm/drm_vram_helper_common.c
 create mode 100644 include/drm/drm_gem_vram_helper.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 54a696d961a7..a3b685089512 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -380,6 +380,21 @@ GEM CMA Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_gem_cma_helper.c
    :export:
 
+VRAM Helper Function Reference
+==============================
+
+GEM VRAM Helper Functions Reference
+-----------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gem_vram_helper.c
+   :doc: overview
+
+.. kernel-doc:: include/drm/drm_gem_vram_helper.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_gem_vram_helper.c
+   :export:
+
 VMA Offset Manager
 ==================
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2267e84d5cb4..13d7b321db0d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -160,6 +160,13 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
+config DRM_VRAM_HELPER
+	tristate
+	depends on DRM
+	select DRM_TTM
+	help
+	  Helpers for VRAM memory management
+
 config DRM_GEM_CMA_HELPER
 	bool
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 72f5036d9bfa..ed49b2480766 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -32,6 +32,10 @@ drm-$(CONFIG_AGP) += drm_agpsupport.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
 
+drm_vram_helper-y := drm_gem_vram_helper.o \
+		     drm_vram_helper_common.o
+obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
+
 drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_dsc.o drm_probe_helper.o \
 		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o \
 		drm_kms_helper_common.o drm_dp_dual_mode_helper.o \
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
new file mode 100644
index 000000000000..761a546412f8
--- /dev/null
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -0,0 +1,412 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/ttm/ttm_page_alloc.h>
+
+/**
+ * DOC: overview
+ *
+ * This library provides a GEM buffer object that is backed by video RAM
+ * (VRAM). It can be used for framebuffer devices with dedicated memory.
+ */
+
+/*
+ * Buffer-objects helpers
+ */
+
+static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
+{
+	/* We got here via ttm_bo_put(), which means that the
+	 * TTM buffer object in 'bo' has already been cleaned
+	 * up; only release the GEM object.
+	 */
+	drm_gem_object_release(&gbo->gem);
+}
+
+static void drm_gem_vram_destroy(struct drm_gem_vram_object *gbo)
+{
+	drm_gem_vram_cleanup(gbo);
+	kfree(gbo);
+}
+
+static void ttm_buffer_object_destroy(struct ttm_buffer_object *bo)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_bo(bo);
+
+	drm_gem_vram_destroy(gbo);
+}
+
+static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
+				   unsigned long pl_flag)
+{
+	unsigned int i;
+	unsigned int c = 0;
+
+	gbo->placement.placement = gbo->placements;
+	gbo->placement.busy_placement = gbo->placements;
+
+	if (pl_flag & TTM_PL_FLAG_VRAM)
+		gbo->placements[c++].flags = TTM_PL_FLAG_WC |
+					     TTM_PL_FLAG_UNCACHED |
+					     TTM_PL_FLAG_VRAM;
+
+	if (pl_flag & TTM_PL_FLAG_SYSTEM)
+		gbo->placements[c++].flags = TTM_PL_MASK_CACHING |
+					     TTM_PL_FLAG_SYSTEM;
+
+	if (!c)
+		gbo->placements[c++].flags = TTM_PL_MASK_CACHING |
+					     TTM_PL_FLAG_SYSTEM;
+
+	gbo->placement.num_placement = c;
+	gbo->placement.num_busy_placement = c;
+
+	for (i = 0; i < c; ++i) {
+		gbo->placements[i].fpfn = 0;
+		gbo->placements[i].lpfn = 0;
+	}
+}
+
+static int drm_gem_vram_init(struct drm_device *dev,
+			     struct ttm_bo_device *bdev,
+			     struct drm_gem_vram_object *gbo,
+			     size_t size, unsigned long pg_align,
+			     bool interruptible)
+{
+	int ret;
+	size_t acc_size;
+
+	ret = drm_gem_object_init(dev, &gbo->gem, size);
+	if (ret)
+		return ret;
+
+	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
+
+	gbo->bo.bdev = bdev;
+	drm_gem_vram_placement(gbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
+
+	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
+			  &gbo->placement, pg_align, interruptible, acc_size,
+			  NULL, NULL, ttm_buffer_object_destroy);
+	if (ret)
+		goto err_drm_gem_object_release;
+
+	return 0;
+
+err_drm_gem_object_release:
+	drm_gem_object_release(&gbo->gem);
+	return ret;
+}
+
+/**
+ * drm_gem_vram_create() - Creates a VRAM-backed GEM object
+ * @dev:		the DRM device
+ * @bdev:		the TTM BO device backing the object
+ * @size:		the buffer size in bytes
+ * @pg_align:		the buffer's alignment in multiples of the page size
+ * @interruptible:	sleep interruptible if waiting for memory
+ *
+ * Returns:
+ * A new instance of &struct drm_gem_vram_object on success, or
+ * an ERR_PTR()-encoded error code otherwise.
+ */
+struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
+						struct ttm_bo_device *bdev,
+						size_t size,
+						unsigned long pg_align,
+						bool interruptible)
+{
+	struct drm_gem_vram_object *gbo;
+	int ret;
+
+	gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
+	if (!gbo)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_gem_vram_init(dev, bdev, gbo, size, pg_align, interruptible);
+	if (ret < 0)
+		goto err_kfree;
+
+	return gbo;
+
+err_kfree:
+	kfree(gbo);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(drm_gem_vram_create);
+
+/**
+ * drm_gem_vram_put() - Releases a reference to a VRAM-backed GEM object
+ * @gbo:	the GEM VRAM object
+ *
+ * See ttm_bo_put() for more information.
+ */
+void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
+{
+	ttm_bo_put(&gbo->bo);
+}
+EXPORT_SYMBOL(drm_gem_vram_put);
+
+/**
+ * drm_gem_vram_reserve() - Reserves a VRAM-backed GEM object
+ * @gbo:	the GEM VRAM object
+ * @no_wait:	don't wait for buffer object to become available
+ *
+ * See ttm_bo_reserve() for more information.
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise
+ */
+int drm_gem_vram_reserve(struct drm_gem_vram_object *gbo, bool no_wait)
+{
+	return ttm_bo_reserve(&gbo->bo, true, no_wait, NULL);
+}
+EXPORT_SYMBOL(drm_gem_vram_reserve);
+
+/**
+ * drm_gem_vram_unreserve() - \
+	Release a reservation acquired by drm_gem_vram_reserve()
+ * @gbo:	the GEM VRAM object
+ *
+ * See ttm_bo_unreserve() for more information.
+ */
+void drm_gem_vram_unreserve(struct drm_gem_vram_object *gbo)
+{
+	ttm_bo_unreserve(&gbo->bo);
+}
+EXPORT_SYMBOL(drm_gem_vram_unreserve);
+
+/**
+ * drm_gem_vram_mmap_offset() - Returns a GEM VRAM object's mmap offset
+ * @gbo:	the GEM VRAM object
+ *
+ * See drm_vma_node_offset_addr() for more information.
+ *
+ * Returns:
+ * The buffer object's offset for userspace mappings on success, or
+ * 0 if no offset is allocated.
+ */
+u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
+{
+	return drm_vma_node_offset_addr(&gbo->bo.vma_node);
+}
+EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
+
+/**
+ * drm_gem_vram_offset() - \
+	Returns a GEM VRAM object's offset in video memory
+ * @gbo:	the GEM VRAM object
+ *
+ * This function returns the buffer object's offset in the device's video
+ * memory. The buffer object has to be pinned to %TTM_PL_VRAM.
+ *
+ * Returns:
+ * The buffer object's offset in video memory on success, or
+ * a negative errno code otherwise.
+ */
+s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
+{
+	if (WARN_ON_ONCE(!gbo->pin_count))
+		return (s64)-ENODEV;
+	return gbo->bo.offset;
+}
+EXPORT_SYMBOL(drm_gem_vram_offset);
+
+/**
+ * drm_gem_vram_pin() - Pins a GEM VRAM object in a region.
+ * @gbo:	the GEM VRAM object
+ * @pl_flag:	a bitmask of possible memory regions
+ *
+ * Pinning a buffer object ensures that it is not evicted from
+ * a memory region. A pinned buffer object has to be unpinned before
+ * it can be pinned to another region.
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
+{
+	int i, ret;
+	struct ttm_operation_ctx ctx = { false, false };
+
+	if (gbo->pin_count) {
+		++gbo->pin_count;
+		return 0;
+	}
+
+	drm_gem_vram_placement(gbo, pl_flag);
+	for (i = 0; i < gbo->placement.num_placement; ++i)
+		gbo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
+
+	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
+	if (ret < 0)
+		return ret;
+
+	gbo->pin_count = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_gem_vram_pin);
+
+/**
+ * drm_gem_vram_unpin() - Unpins a GEM VRAM object
+ * @gbo:	the GEM VRAM object
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
+{
+	int i, ret;
+	struct ttm_operation_ctx ctx = { false, false };
+
+	if (WARN_ON_ONCE(!gbo->pin_count))
+		return 0;
+
+	--gbo->pin_count;
+	if (gbo->pin_count)
+		return 0;
+
+	for (i = 0; i < gbo->placement.num_placement ; ++i)
+		gbo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
+
+	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_gem_vram_unpin);
+
+/**
+ * drm_gem_vram_push_to_system() - \
+	Unpins a GEM VRAM object and moves it to system memory
+ * @gbo:	the GEM VRAM object
+ *
+ * This operation only works if the caller holds the final pin on the
+ * buffer object.
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_gem_vram_push_to_system(struct drm_gem_vram_object *gbo)
+{
+	int i, ret;
+	struct ttm_operation_ctx ctx = { false, false };
+
+	if (WARN_ON_ONCE(!gbo->pin_count))
+		return 0;
+
+	--gbo->pin_count;
+	if (gbo->pin_count)
+		return 0;
+
+	if (gbo->kmap.virtual)
+		ttm_bo_kunmap(&gbo->kmap);
+
+	drm_gem_vram_placement(gbo, TTM_PL_FLAG_SYSTEM);
+	for (i = 0; i < gbo->placement.num_placement ; ++i)
+		gbo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
+
+	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_gem_vram_push_to_system);
+
+/**
+ * drm_gem_vram_kmap_at() - Maps a GEM VRAM object into kernel address space
+ * @gbo:	the GEM VRAM object
+ * @map:	establish a mapping if necessary
+ * @is_iomem:	returns true if the mapped memory is I/O memory, or false \
+	otherwise; can be NULL
+ * @kmap:	the mapping's kmap object
+ *
+ * This function maps the buffer object into the kernel's address space
+ * or returns the current mapping. If the parameter map is false, the
+ * function only queries the current mapping, but does not establish a
+ * new one.
+ *
+ * Returns:
+ * The buffers virtual address if mapped, or
+ * NULL if not mapped, or
+ * an ERR_PTR()-encoded error code otherwise.
+ */
+void *drm_gem_vram_kmap_at(struct drm_gem_vram_object *gbo, bool map,
+			   bool *is_iomem, struct ttm_bo_kmap_obj *kmap)
+{
+	int ret;
+
+	if (kmap->virtual || !map)
+		goto out;
+
+	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
+	if (ret)
+		return ERR_PTR(ret);
+
+out:
+	if (!is_iomem)
+		return kmap->virtual;
+	if (!kmap->virtual) {
+		*is_iomem = false;
+		return NULL;
+	}
+	return ttm_kmap_obj_virtual(kmap, is_iomem);
+}
+EXPORT_SYMBOL(drm_gem_vram_kmap_at);
+
+/**
+ * drm_gem_vram_kmap() - Maps a GEM VRAM object into kernel address space
+ * @gbo:	the GEM VRAM object
+ * @map:	establish a mapping if necessary
+ * @is_iomem:	returns true if the mapped memory is I/O memory, or false \
+	otherwise; can be NULL
+ *
+ * This function maps the buffer object into the kernel's address space
+ * or returns the current mapping. If the parameter map is false, the
+ * function only queries the current mapping, but does not establish a
+ * new one.
+ *
+ * Returns:
+ * The buffers virtual address if mapped, or
+ * NULL if not mapped, or
+ * an ERR_PTR()-encoded error code otherwise.
+ */
+void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
+			bool *is_iomem)
+{
+	return drm_gem_vram_kmap_at(gbo, map, is_iomem, &gbo->kmap);
+}
+EXPORT_SYMBOL(drm_gem_vram_kmap);
+
+/**
+ * drm_gem_vram_kunmap_at() - Unmaps a GEM VRAM object
+ * @gbo:	the GEM VRAM object
+ * @kmap:	the mapping's kmap object
+ */
+void drm_gem_vram_kunmap_at(struct drm_gem_vram_object *gbo,
+			    struct ttm_bo_kmap_obj *kmap)
+{
+	if (!kmap->virtual)
+		return;
+
+	ttm_bo_kunmap(kmap);
+	kmap->virtual = NULL;
+}
+EXPORT_SYMBOL(drm_gem_vram_kunmap_at);
+
+/**
+ * drm_gem_vram_kunmap() - Unmaps a GEM VRAM object
+ * @gbo:	the GEM VRAM object
+ */
+void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo)
+{
+	drm_gem_vram_kunmap_at(gbo, &gbo->kmap);
+}
+EXPORT_SYMBOL(drm_gem_vram_kunmap);
diff --git a/drivers/gpu/drm/drm_vram_helper_common.c b/drivers/gpu/drm/drm_vram_helper_common.c
new file mode 100644
index 000000000000..7c25daca18d0
--- /dev/null
+++ b/drivers/gpu/drm/drm_vram_helper_common.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/module.h>
+
+MODULE_DESCRIPTION("DRM VRAM memory-management helpers");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
new file mode 100644
index 000000000000..5802dd694939
--- /dev/null
+++ b/include/drm/drm_gem_vram_helper.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef DRM_GEM_VRAM_HELPER_H
+#define DRM_GEM_VRAM_HELPER_H
+
+#include <drm/drm_gem.h>
+#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_placement.h>
+#include <linux/kernel.h> /* for container_of() */
+
+struct filp;
+
+#define DRM_GEM_VRAM_PL_FLAG_VRAM	TTM_PL_FLAG_VRAM
+#define DRM_GEM_VRAM_PL_FLAG_SYSTEM	TTM_PL_FLAG_SYSTEM
+
+/*
+ * Buffer-object helpers
+ */
+
+/**
+ * struct drm_gem_vram_object - GEM object backed by VRAM
+ * @gem:	GEM object
+ * @bo:		TTM buffer object
+ * @kmap:	Mapping information for @bo
+ * @placement:	TTM placement information. Supported placements are \
+	%TTM_PL_VRAM and %TTM_PL_SYSTEM
+ * @placements:	TTM placement information.
+ * @pin_count:	Pin counter
+ *
+ * The type struct drm_gem_vram_object represents a GEM object that is
+ * backed by VRAM. It can be used for simple framebuffer devices with
+ * dedicated memory. The buffer object can be evicted to system memory if
+ * video memory becomes scarce.
+ */
+struct drm_gem_vram_object {
+	struct drm_gem_object gem;
+	struct ttm_buffer_object bo;
+	struct ttm_bo_kmap_obj kmap;
+
+	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
+	struct ttm_placement placement;
+	struct ttm_place placements[2];
+
+	int pin_count;
+};
+
+/**
+ * Returns the container of type &struct drm_gem_vram_object
+ * for field bo.
+ * @bo:		the VRAM buffer object
+ * Returns:	The containing GEM VRAM object
+ */
+static inline struct drm_gem_vram_object *drm_gem_vram_of_bo(
+	struct ttm_buffer_object *bo)
+{
+	return container_of(bo, struct drm_gem_vram_object, bo);
+}
+
+/**
+ * Returns the container of type &struct drm_gem_vram_object
+ * for field gem.
+ * @gem:	the GEM object
+ * Returns:	The containing GEM VRAM object
+ */
+static inline struct drm_gem_vram_object *drm_gem_vram_of_gem(
+	struct drm_gem_object *gem)
+{
+	return container_of(gem, struct drm_gem_vram_object, gem);
+}
+
+struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
+						struct ttm_bo_device *bdev,
+						size_t size,
+						unsigned long pg_align,
+						bool interruptible);
+void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
+int drm_gem_vram_reserve(struct drm_gem_vram_object *gbo, bool no_wait);
+void drm_gem_vram_unreserve(struct drm_gem_vram_object *gbo);
+u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
+s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
+int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
+int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
+int drm_gem_vram_push_to_system(struct drm_gem_vram_object *gbo);
+void *drm_gem_vram_kmap_at(struct drm_gem_vram_object *gbo, bool map,
+			   bool *is_iomem, struct ttm_bo_kmap_obj *kmap);
+void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
+			bool *is_iomem);
+void drm_gem_vram_kunmap_at(struct drm_gem_vram_object *gbo,
+			    struct ttm_bo_kmap_obj *kmap);
+void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo);
+
+#endif
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
