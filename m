Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 344F4173CA
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 10:28:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 881AF13A2;
	Wed,  8 May 2019 08:26:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 935971108
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 46D4D837
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 449DCAECB;
	Wed,  8 May 2019 08:26:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v5 08/20] drm: Integrate VRAM MM into struct drm_device
Date: Wed,  8 May 2019 10:26:18 +0200
Message-Id: <20190508082630.15116-9-tzimmermann@suse.de>
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

There's now a pointer to struct drm_vram_mm stored in struct drm_device.
DRM drivers that use VRAM MM should use this field to refer to their
instance of the data structure. Appropriate helpers are now provided as
well.

Adding struct drm_vram_mm to struct drm_device further avoids wrappers
and boilerplate code in drivers. This patch implements default functions
for callbacks in struct drm_driver and struct file_operations that use
the struct drm_vram_mm stored in struct drm_device. Drivers that need to
provide their own implementations can still do so.

The patch also adds documentation for the VRAM helper library in general.

v5:
	* set .llseek to no_llseek() from DRM_VRAM_MM_FILE_OPERATIONS
v4:
	* cleanups from checkpatch.pl
	* document VRAM helper library

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-mm.rst             |  6 ++
 drivers/gpu/drm/drm_gem_vram_helper.c    | 28 ++++++++
 drivers/gpu/drm/drm_vram_helper_common.c | 92 ++++++++++++++++++++++++
 drivers/gpu/drm/drm_vram_mm_helper.c     | 85 ++++++++++++++++++++++
 include/drm/drm_device.h                 |  4 ++
 include/drm/drm_gem_vram_helper.h        | 19 ++++-
 include/drm/drm_vram_mm_helper.h         | 33 +++++++++
 7 files changed, 266 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index eba50afbda42..c8ebd4f66a6a 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -382,6 +382,12 @@ GEM CMA Helper Functions Reference
 VRAM Helper Function Reference
 ==============================
 
+.. kernel-doc:: drivers/gpu/drm/drm_vram_helper_common.c
+   :doc: overview
+
+.. kernel-doc:: include/drm/drm_gem_vram_helper.h
+   :internal:
+
 GEM VRAM Helper Functions Reference
 -----------------------------------
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index c21b1f920e0a..8f142b810eb4 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_device.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_vram_mm_helper.h>
@@ -555,6 +556,33 @@ void drm_gem_vram_driver_gem_free_object_unlocked(struct drm_gem_object *gem)
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_gem_free_object_unlocked);
 
+/**
+ * drm_gem_vram_driver_create_dumb() - \
+	Implements &struct drm_driver.dumb_create
+ * @file:		the DRM file
+ * @dev:		the DRM device
+ * @args:		the arguments as provided to \
+				&struct drm_driver.dumb_create
+ *
+ * This function requires the driver to use @drm_device.vram_mm for its
+ * instance of VRAM MM.
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_gem_vram_driver_dumb_create(struct drm_file *file,
+				    struct drm_device *dev,
+				    struct drm_mode_create_dumb *args)
+{
+	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
+		return -EINVAL;
+
+	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev, 0,
+					     false, args);
+}
+EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
+
 /**
  * drm_gem_vram_driver_dumb_mmap_offset() - \
 	Implements &struct drm_driver.dumb_mmap_offset
diff --git a/drivers/gpu/drm/drm_vram_helper_common.c b/drivers/gpu/drm/drm_vram_helper_common.c
index 7c25daca18d0..3b47f7002115 100644
--- a/drivers/gpu/drm/drm_vram_helper_common.c
+++ b/drivers/gpu/drm/drm_vram_helper_common.c
@@ -2,5 +2,97 @@
 
 #include <linux/module.h>
 
+/**
+ * DOC: overview
+ *
+ * This library provides &struct drm_gem_vram_object (GEM VRAM), a GEM
+ * buffer object that is backed by video RAM. It can be used for
+ * framebuffer devices with dedicated memory. The video RAM can be
+ * managed with &struct drm_vram_mm (VRAM MM). Both data structures are
+ * supposed to be used together, but can also be used individually.
+ *
+ * With the GEM interface userspace applications create, manage and destroy
+ * graphics buffers, such as an on-screen framebuffer. GEM does not provide
+ * an implementation of these interfaces. It's up to the DRM driver to
+ * provide an implementation that suits the hardware. If the hardware device
+ * contains dedicated video memory, the DRM driver can use the VRAM helper
+ * library. Each active buffer object is stored in video RAM. Active
+ * buffer are used for drawing the current frame, typically something like
+ * the frame's scanout buffer or the cursor image. If there's no more space
+ * left in VRAM, inactive GEM objects can be moved to system memory.
+ *
+ * The easiest way to use the VRAM helper library is to call
+ * drm_vram_helper_alloc_mm(). The function allocates and initializes an
+ * instance of &struct drm_vram_mm in &struct drm_device.vram_mm . Use
+ * &DRM_GEM_VRAM_DRIVER to initialize &struct drm_driver and
+ * &DRM_VRAM_MM_FILE_OPERATIONS to initialize &struct file_operations;
+ * as illustrated below.
+ *
+ * .. code-block:: c
+ *
+ *	struct file_operations fops ={
+ *		.owner = THIS_MODULE,
+ *		DRM_VRAM_MM_FILE_OPERATION
+ *	};
+ *	struct drm_driver drv = {
+ *		.driver_feature = DRM_ ... ,
+ *		.fops = &fops,
+ *		DRM_GEM_VRAM_DRIVER
+ *	};
+ *
+ *	int init_drm_driver()
+ *	{
+ *		struct drm_device *dev;
+ *		uint64_t vram_base;
+ *		unsigned long vram_size;
+ *		int ret;
+ *
+ *		// setup device, vram base and size
+ *		// ...
+ *
+ *		ret = drm_vram_helper_alloc_mm(dev, vram_base, vram_size,
+ *					       &drm_gem_vram_mm_funcs);
+ *		if (ret)
+ *			return ret;
+ *		return 0;
+ *	}
+ *
+ * This creates an instance of &struct drm_vram_mm, exports DRM userspace
+ * interfaces for GEM buffer management and initializes file operations to
+ * allow for accessing created GEM buffers. With this setup, the DRM driver
+ * manages an area of video RAM with VRAM MM and provides GEM VRAM objects
+ * to userspace.
+ *
+ * To clean up the VRAM memory management, call drm_vram_helper_release_mm()
+ * in the driver's clean-up code.
+ *
+ * .. code-block:: c
+ *
+ *	void fini_drm_driver()
+ *	{
+ *		struct drm_device *dev = ...;
+ *
+ *		drm_vram_helper_release_mm(dev);
+ *	}
+ *
+ * For drawing or scanout operations, buffer object have to be pinned in video
+ * RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
+ * &DRM_GEM_VRAM_PL_FLAG_SYSTEM to pin a buffer object in video RAM or system
+ * memory. Call drm_gem_vram_unpin() to release the pinned object afterwards.
+ * If you have to evict a buffer object from video RAM (e.g., for freeing up
+ * memory), unpin the buffer and call drm_gem_vram_push_to_system().
+ *
+ * A buffer object that is pinned in video RAM has a fixed address within that
+ * memory region. Call drm_gem_vram_offset() to retrieve this value. Typically
+ * it's used to program the hardware's scanout engine for framebuffers, set
+ * the cursor overlay's image for a mouse cursor, or use it as input to the
+ * hardware's draing engine.
+ *
+ * To access a buffer object's memory from the DRM driver, call
+ * drm_gem_vram_kmap(). It (optionally) maps the buffer into kernel address
+ * space and returns the memory address. Use drm_gem_vram_kunmap() to
+ * release the mapping.
+ */
+
 MODULE_DESCRIPTION("DRM VRAM memory-management helpers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/drm_vram_mm_helper.c b/drivers/gpu/drm/drm_vram_mm_helper.c
index d17c5169b018..c94a6dc5ade7 100644
--- a/drivers/gpu/drm/drm_vram_mm_helper.c
+++ b/drivers/gpu/drm/drm_vram_mm_helper.c
@@ -208,3 +208,88 @@ int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
 	return ttm_bo_mmap(filp, vma, &vmm->bdev);
 }
 EXPORT_SYMBOL(drm_vram_mm_mmap);
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
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 7f9ef709b2b6..1acfc3bbd3fb 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -17,6 +17,7 @@ struct drm_vblank_crtc;
 struct drm_sg_mem;
 struct drm_local_map;
 struct drm_vma_offset_manager;
+struct drm_vram_mm;
 struct drm_fb_helper;
 
 struct inode;
@@ -286,6 +287,9 @@ struct drm_device {
 	/** @vma_offset_manager: GEM information */
 	struct drm_vma_offset_manager *vma_offset_manager;
 
+	/** @vram_mm: VRAM MM memory manager */
+	struct drm_vram_mm *vram_mm;
+
 	/**
 	 * @switch_power_state:
 	 *
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 7971656afe87..b056f189ba62 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -11,6 +11,7 @@
 struct drm_mode_create_dumb;
 struct drm_vram_mm_funcs;
 struct filp;
+struct vm_area_struct;
 
 #define DRM_GEM_VRAM_PL_FLAG_VRAM	TTM_PL_FLAG_VRAM
 #define DRM_GEM_VRAM_PL_FLAG_SYSTEM	TTM_PL_FLAG_SYSTEM
@@ -115,10 +116,26 @@ extern const struct drm_vram_mm_funcs drm_gem_vram_mm_funcs;
  */
 
 void drm_gem_vram_driver_gem_free_object_unlocked(struct drm_gem_object *gem);
-
+int drm_gem_vram_driver_dumb_create(struct drm_file *file,
+				    struct drm_device *dev,
+				    struct drm_mode_create_dumb *args);
 int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
 					 struct drm_device *dev,
 					 uint32_t handle, uint64_t *offset);
+
+/**
+ * define DRM_GEM_VRAM_DRIVER - default callback functions for \
+	&struct drm_driver
+ *
+ * Drivers that use VRAM MM and GEM VRAM can use this macro to initialize
+ * &struct drm_driver with default functions.
+ */
+#define DRM_GEM_VRAM_DRIVER \
+	.gem_free_object_unlocked = \
+		drm_gem_vram_driver_gem_free_object_unlocked, \
+	.dumb_create		  = drm_gem_vram_driver_dumb_create, \
+	.dumb_map_offset	  = drm_gem_vram_driver_dumb_mmap_offset
+
 /*
  * PRIME helpers for struct drm_driver
  */
diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram_mm_helper.h
index 5d45c6447fa4..a8ffd8599b08 100644
--- a/include/drm/drm_vram_mm_helper.h
+++ b/include/drm/drm_vram_mm_helper.h
@@ -66,4 +66,37 @@ void drm_vram_mm_cleanup(struct drm_vram_mm *vmm);
 int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
 		     struct drm_vram_mm *vmm);
 
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
 #endif
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
