Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 061B4173D7
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 10:30:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7536B13CB;
	Wed,  8 May 2019 08:26:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 996B31393
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id D94621DE55
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 03830AF0C;
	Wed,  8 May 2019 08:26:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v5 14/20] drm/mgag200: Convert mgag200 driver to |struct
	drm_gem_vram_object|
Date: Wed,  8 May 2019 10:26:24 +0200
Message-Id: <20190508082630.15116-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508082630.15116-1-tzimmermann@suse.de>
References: <20190508082630.15116-1-tzimmermann@suse.de>
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

The data structure |struct drm_gem_vram_object| and its helpers replace
|struct mgag200_bo|. It's the same implementation; except for the type
names.

v4:
	* cleanups from checkpatch.pl
	* select config option DRM_VRAM_HELPER

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/Kconfig          |   1 +
 drivers/gpu/drm/mgag200/mgag200_cursor.c |  63 +++++----
 drivers/gpu/drm/mgag200/mgag200_drv.c    |   5 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  62 ++------
 drivers/gpu/drm/mgag200/mgag200_fb.c     |  22 +--
 drivers/gpu/drm/mgag200/mgag200_main.c   |  84 +++--------
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  46 +++---
 drivers/gpu/drm/mgag200/mgag200_ttm.c    | 172 +----------------------
 8 files changed, 107 insertions(+), 348 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index db58578719d2..907bb2162228 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -3,6 +3,7 @@ config DRM_MGAG200
 	depends on DRM && PCI && MMU
 	select DRM_KMS_HELPER
 	select DRM_TTM
+	select DRM_VRAM_HELPER
 	help
 	 This is a KMS driver for the MGA G200 server chips, it
          does not support the original MGA G200 or any of the desktop
diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 968e20379d54..cca3922f9f67 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -23,9 +23,9 @@ static void mga_hide_cursor(struct mga_device *mdev)
 	WREG8(MGA_CURPOSXL, 0);
 	WREG8(MGA_CURPOSXH, 0);
 	if (mdev->cursor.pixels_1->pin_count)
-		mgag200_bo_unpin(mdev->cursor.pixels_1);
+		drm_gem_vram_unpin(mdev->cursor.pixels_1);
 	if (mdev->cursor.pixels_2->pin_count)
-		mgag200_bo_unpin(mdev->cursor.pixels_2);
+		drm_gem_vram_unpin(mdev->cursor.pixels_2);
 }
 
 int mga_crtc_cursor_set(struct drm_crtc *crtc,
@@ -36,12 +36,12 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = (struct mga_device *)dev->dev_private;
-	struct mgag200_bo *pixels_1 = mdev->cursor.pixels_1;
-	struct mgag200_bo *pixels_2 = mdev->cursor.pixels_2;
-	struct mgag200_bo *pixels_current = mdev->cursor.pixels_current;
-	struct mgag200_bo *pixels_prev = mdev->cursor.pixels_prev;
+	struct drm_gem_vram_object *pixels_1 = mdev->cursor.pixels_1;
+	struct drm_gem_vram_object *pixels_2 = mdev->cursor.pixels_2;
+	struct drm_gem_vram_object *pixels_current = mdev->cursor.pixels_current;
+	struct drm_gem_vram_object *pixels_prev = mdev->cursor.pixels_prev;
 	struct drm_gem_object *obj;
-	struct mgag200_bo *bo = NULL;
+	struct drm_gem_vram_object *gbo = NULL;
 	int ret = 0;
 	unsigned int i, row, col;
 	uint32_t colour_set[16];
@@ -50,7 +50,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	uint32_t this_colour;
 	bool found = false;
 	int colour_count = 0;
-	u64 gpu_addr;
+	s64 gpu_addr;
 	u8 reg_index;
 	u8 this_row[48];
 
@@ -79,44 +79,55 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	if (!obj)
 		return -ENOENT;
 
-	ret = mgag200_bo_reserve(pixels_1, true);
+	ret = drm_gem_vram_reserve(pixels_1, true);
 	if (ret) {
 		WREG8(MGA_CURPOSXL, 0);
 		WREG8(MGA_CURPOSXH, 0);
 		goto out_unref;
 	}
-	ret = mgag200_bo_reserve(pixels_2, true);
+	ret = drm_gem_vram_reserve(pixels_2, true);
 	if (ret) {
 		WREG8(MGA_CURPOSXL, 0);
 		WREG8(MGA_CURPOSXH, 0);
-		mgag200_bo_unreserve(pixels_1);
+		drm_gem_vram_unreserve(pixels_1);
 		goto out_unreserve1;
 	}
 
 	/* Move cursor buffers into VRAM if they aren't already */
 	if (!pixels_1->pin_count) {
-		ret = mgag200_bo_pin(pixels_1, TTM_PL_FLAG_VRAM,
-				     &mdev->cursor.pixels_1_gpu_addr);
+		ret = drm_gem_vram_pin(pixels_1, DRM_GEM_VRAM_PL_FLAG_VRAM);
 		if (ret)
 			goto out1;
+		gpu_addr = drm_gem_vram_offset(pixels_1);
+		if (gpu_addr < 0) {
+			drm_gem_vram_unpin(pixels_1);
+			goto out1;
+		}
+		mdev->cursor.pixels_1_gpu_addr = gpu_addr;
 	}
 	if (!pixels_2->pin_count) {
-		ret = mgag200_bo_pin(pixels_2, TTM_PL_FLAG_VRAM,
-				     &mdev->cursor.pixels_2_gpu_addr);
+		ret = drm_gem_vram_pin(pixels_2, DRM_GEM_VRAM_PL_FLAG_VRAM);
 		if (ret) {
-			mgag200_bo_unpin(pixels_1);
+			drm_gem_vram_unpin(pixels_1);
+			goto out1;
+		}
+		gpu_addr = drm_gem_vram_offset(pixels_2);
+		if (gpu_addr < 0) {
+			drm_gem_vram_unpin(pixels_1);
+			drm_gem_vram_unpin(pixels_2);
 			goto out1;
 		}
+		mdev->cursor.pixels_2_gpu_addr = gpu_addr;
 	}
 
-	bo = gem_to_mga_bo(obj);
-	ret = mgag200_bo_reserve(bo, true);
+	gbo = drm_gem_vram_of_gem(obj);
+	ret = drm_gem_vram_reserve(gbo, true);
 	if (ret) {
 		dev_err(&dev->pdev->dev, "failed to reserve user bo\n");
 		goto out1;
 	}
-	if (!bo->kmap.virtual) {
-		ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->kmap);
+	if (!gbo->kmap.virtual) {
+		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
 		if (ret) {
 			dev_err(&dev->pdev->dev, "failed to kmap user buffer updates\n");
 			goto out2;
@@ -126,7 +137,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	memset(&colour_set[0], 0, sizeof(uint32_t)*16);
 	/* width*height*4 = 16384 */
 	for (i = 0; i < 16384; i += 4) {
-		this_colour = ioread32(bo->kmap.virtual + i);
+		this_colour = ioread32(gbo->kmap.virtual + i);
 		/* No transparency */
 		if (this_colour>>24 != 0xff &&
 			this_colour>>24 != 0x0) {
@@ -192,7 +203,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	for (row = 0; row < 64; row++) {
 		memset(&this_row[0], 0, 48);
 		for (col = 0; col < 64; col++) {
-			this_colour = ioread32(bo->kmap.virtual + 4*(col + 64*row));
+			this_colour = ioread32(gbo->kmap.virtual + 4*(col + 64*row));
 			/* write transparent pixels */
 			if (this_colour>>24 == 0x0) {
 				this_row[47 - col/8] |= 0x80>>(col%8);
@@ -238,15 +249,15 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 
 	ttm_bo_kunmap(&pixels_prev->kmap);
  out3:
-	ttm_bo_kunmap(&bo->kmap);
+	ttm_bo_kunmap(&gbo->kmap);
  out2:
-	mgag200_bo_unreserve(bo);
+	drm_gem_vram_unreserve(gbo);
  out1:
 	if (ret)
 		mga_hide_cursor(mdev);
-	mgag200_bo_unreserve(pixels_1);
+	drm_gem_vram_unreserve(pixels_1);
 out_unreserve1:
-	mgag200_bo_unreserve(pixels_2);
+	drm_gem_vram_unreserve(pixels_2);
 out_unref:
 	drm_gem_object_put_unlocked(obj);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index ac6af4bd9df6..1f2a034d5a9b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -80,9 +80,10 @@ static struct drm_driver driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	.gem_free_object_unlocked = mgag200_gem_free_object,
+	.gem_free_object_unlocked =
+		drm_gem_vram_driver_gem_free_object_unlocked,
 	.dumb_create = mgag200_dumb_create,
-	.dumb_map_offset = mgag200_dumb_mmap_offset,
+	.dumb_map_offset = drm_gem_vram_driver_dumb_mmap_offset,
 };
 
 static struct pci_driver mgag200_pci_driver = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 8c31e4422cae..86b33e23ab7f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -1,6 +1,6 @@
 /*
  * Copyright 2010 Matt Turner.
- * Copyright 2012 Red Hat 
+ * Copyright 2012 Red Hat
  *
  * This file is subject to the terms and conditions of the GNU General
  * Public License version 2. See the file COPYING in the main
@@ -24,6 +24,7 @@
 #include <drm/ttm/ttm_module.h>
 
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_vram_helper.h>
 
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
@@ -159,13 +160,13 @@ struct mga_cursor {
 	   If either of these is NULL, then don't do hardware cursors, and
 	   fall back to software.
 	*/
-	struct mgag200_bo *pixels_1;
-	struct mgag200_bo *pixels_2;
+	struct drm_gem_vram_object *pixels_1;
+	struct drm_gem_vram_object *pixels_2;
 	u64 pixels_1_gpu_addr, pixels_2_gpu_addr;
 	/* The currently displayed icon, this points to one of pixels_1, or pixels_2 */
-	struct mgag200_bo *pixels_current;
+	struct drm_gem_vram_object *pixels_current;
 	/* The previously displayed icon */
-	struct mgag200_bo *pixels_prev;
+	struct drm_gem_vram_object *pixels_prev;
 };
 
 struct mga_mc {
@@ -219,23 +220,6 @@ struct mga_device {
 	u32 unique_rev_id;
 };
 
-
-struct mgag200_bo {
-	struct ttm_buffer_object bo;
-	struct ttm_placement placement;
-	struct ttm_bo_kmap_obj kmap;
-	struct drm_gem_object gem;
-	struct ttm_place placements[3];
-	int pin_count;
-};
-#define gem_to_mga_bo(gobj) container_of((gobj), struct mgag200_bo, gem)
-
-static inline struct mgag200_bo *
-mgag200_bo(struct ttm_buffer_object *bo)
-{
-	return container_of(bo, struct mgag200_bo, bo);
-}
-
 				/* mgag200_mode.c */
 int mgag200_modeset_init(struct mga_device *mdev);
 void mgag200_modeset_fini(struct mga_device *mdev);
@@ -259,45 +243,15 @@ int mgag200_gem_create(struct drm_device *dev,
 int mgag200_dumb_create(struct drm_file *file,
 			struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
-void mgag200_gem_free_object(struct drm_gem_object *obj);
-int
-mgag200_dumb_mmap_offset(struct drm_file *file,
-			 struct drm_device *dev,
-			 uint32_t handle,
-			 uint64_t *offset);
+
 				/* mgag200_i2c.c */
 struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
 void mgag200_i2c_destroy(struct mga_i2c_chan *i2c);
 
-void mgag200_ttm_placement(struct mgag200_bo *bo, int domain);
-
-static inline int mgag200_bo_reserve(struct mgag200_bo *bo, bool no_wait)
-{
-	int ret;
-
-	ret = ttm_bo_reserve(&bo->bo, true, no_wait, NULL);
-	if (ret) {
-		if (ret != -ERESTARTSYS && ret != -EBUSY)
-			DRM_ERROR("reserve failed %p\n", bo);
-		return ret;
-	}
-	return 0;
-}
-
-static inline void mgag200_bo_unreserve(struct mgag200_bo *bo)
-{
-	ttm_bo_unreserve(&bo->bo);
-}
-
-int mgag200_bo_create(struct drm_device *dev, int size, int align,
-		      uint32_t flags, struct mgag200_bo **pastbo);
 int mgag200_mm_init(struct mga_device *mdev);
 void mgag200_mm_fini(struct mga_device *mdev);
 int mgag200_mmap(struct file *filp, struct vm_area_struct *vma);
-int mgag200_bo_pin(struct mgag200_bo *bo, u32 pl_flag, u64 *gpu_addr);
-int mgag200_bo_unpin(struct mgag200_bo *bo);
-int mgag200_bo_push_sysram(struct mgag200_bo *bo);
-			   /* mgag200_cursor.c */
+
 int mga_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 						uint32_t handle, uint32_t width, uint32_t height);
 int mga_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
diff --git a/drivers/gpu/drm/mgag200/mgag200_fb.c b/drivers/gpu/drm/mgag200/mgag200_fb.c
index 5b7e64cac004..1bcf0d65868d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_fb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_fb.c
@@ -23,7 +23,7 @@ static void mga_dirty_update(struct mga_fbdev *mfbdev,
 {
 	int i;
 	struct drm_gem_object *obj;
-	struct mgag200_bo *bo;
+	struct drm_gem_vram_object *gbo;
 	int src_offset, dst_offset;
 	int bpp = mfbdev->mfb.base.format->cpp[0];
 	int ret = -EBUSY;
@@ -33,7 +33,7 @@ static void mga_dirty_update(struct mga_fbdev *mfbdev,
 	unsigned long flags;
 
 	obj = mfbdev->mfb.obj;
-	bo = gem_to_mga_bo(obj);
+	gbo = drm_gem_vram_of_gem(obj);
 
 	/*
 	 * try and reserve the BO, if we fail with busy
@@ -41,7 +41,7 @@ static void mga_dirty_update(struct mga_fbdev *mfbdev,
 	 * store up the damage until later.
 	 */
 	if (drm_can_sleep())
-		ret = mgag200_bo_reserve(bo, true);
+		ret = drm_gem_vram_reserve(gbo, true);
 	if (ret) {
 		if (ret != -EBUSY)
 			return;
@@ -75,25 +75,27 @@ static void mga_dirty_update(struct mga_fbdev *mfbdev,
 	mfbdev->x2 = mfbdev->y2 = 0;
 	spin_unlock_irqrestore(&mfbdev->dirty_lock, flags);
 
-	if (!bo->kmap.virtual) {
-		ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->kmap);
+	if (!gbo->kmap.virtual) {
+		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
 		if (ret) {
 			DRM_ERROR("failed to kmap fb updates\n");
-			mgag200_bo_unreserve(bo);
+			drm_gem_vram_unreserve(gbo);
 			return;
 		}
 		unmap = true;
 	}
 	for (i = y; i <= y2; i++) {
 		/* assume equal stride for now */
-		src_offset = dst_offset = i * mfbdev->mfb.base.pitches[0] + (x * bpp);
-		memcpy_toio(bo->kmap.virtual + src_offset, mfbdev->sysram + src_offset, (x2 - x + 1) * bpp);
+		src_offset = dst_offset =
+			i * mfbdev->mfb.base.pitches[0] + (x * bpp);
+		memcpy_toio(gbo->kmap.virtual + src_offset,
+			    mfbdev->sysram + dst_offset, (x2 - x + 1) * bpp);
 
 	}
 	if (unmap)
-		ttm_bo_kunmap(&bo->kmap);
+		ttm_bo_kunmap(&gbo->kmap);
 
-	mgag200_bo_unreserve(bo);
+	drm_gem_vram_unreserve(gbo);
 }
 
 static void mga_fillrect(struct fb_info *info,
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 163255099779..59a4028a5c6c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -230,11 +230,13 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	}
 
 	/* Make small buffers to store a hardware cursor (double buffered icon updates) */
-	mgag200_bo_create(dev, roundup(48*64, PAGE_SIZE), 0, 0,
-					  &mdev->cursor.pixels_1);
-	mgag200_bo_create(dev, roundup(48*64, PAGE_SIZE), 0, 0,
-					  &mdev->cursor.pixels_2);
-	if (!mdev->cursor.pixels_2 || !mdev->cursor.pixels_1) {
+	mdev->cursor.pixels_1 = drm_gem_vram_create(dev, &mdev->ttm.bdev,
+						    roundup(48*64, PAGE_SIZE),
+						    0, 0);
+	mdev->cursor.pixels_2 = drm_gem_vram_create(dev, &mdev->ttm.bdev,
+						    roundup(48*64, PAGE_SIZE),
+						    0, 0);
+	if (IS_ERR(mdev->cursor.pixels_2) || IS_ERR(mdev->cursor.pixels_1)) {
 		mdev->cursor.pixels_1 = NULL;
 		mdev->cursor.pixels_2 = NULL;
 		dev_warn(&dev->pdev->dev,
@@ -272,7 +274,8 @@ int mgag200_gem_create(struct drm_device *dev,
 		   u32 size, bool iskernel,
 		   struct drm_gem_object **obj)
 {
-	struct mgag200_bo *astbo;
+	struct mga_device *mdev = dev->dev_private;
+	struct drm_gem_vram_object *gbo;
 	int ret;
 
 	*obj = NULL;
@@ -281,13 +284,14 @@ int mgag200_gem_create(struct drm_device *dev,
 	if (size == 0)
 		return -EINVAL;
 
-	ret = mgag200_bo_create(dev, size, 0, 0, &astbo);
-	if (ret) {
+	gbo = drm_gem_vram_create(dev, &mdev->ttm.bdev, size, 0, false);
+	if (IS_ERR(gbo)) {
+		ret = PTR_ERR(gbo);
 		if (ret != -ERESTARTSYS)
 			DRM_ERROR("failed to allocate GEM object\n");
 		return ret;
 	}
-	*obj = &astbo->gem;
+	*obj = &gbo->gem;
 	return 0;
 }
 
@@ -295,64 +299,8 @@ int mgag200_dumb_create(struct drm_file *file,
 		    struct drm_device *dev,
 		    struct drm_mode_create_dumb *args)
 {
-	int ret;
-	struct drm_gem_object *gobj;
-	u32 handle;
-
-	args->pitch = args->width * ((args->bpp + 7) / 8);
-	args->size = args->pitch * args->height;
-
-	ret = mgag200_gem_create(dev, args->size, false,
-			     &gobj);
-	if (ret)
-		return ret;
-
-	ret = drm_gem_handle_create(file, gobj, &handle);
-	drm_gem_object_put_unlocked(gobj);
-	if (ret)
-		return ret;
-
-	args->handle = handle;
-	return 0;
-}
-
-static void mgag200_bo_unref(struct mgag200_bo **bo)
-{
-	if ((*bo) == NULL)
-		return;
-	ttm_bo_put(&((*bo)->bo));
-	*bo = NULL;
-}
-
-void mgag200_gem_free_object(struct drm_gem_object *obj)
-{
-	struct mgag200_bo *mgag200_bo = gem_to_mga_bo(obj);
-
-	mgag200_bo_unref(&mgag200_bo);
-}
-
-
-static inline u64 mgag200_bo_mmap_offset(struct mgag200_bo *bo)
-{
-	return drm_vma_node_offset_addr(&bo->bo.vma_node);
-}
-
-int
-mgag200_dumb_mmap_offset(struct drm_file *file,
-		     struct drm_device *dev,
-		     uint32_t handle,
-		     uint64_t *offset)
-{
-	struct drm_gem_object *obj;
-	struct mgag200_bo *bo;
-
-	obj = drm_gem_object_lookup(file, handle);
-	if (obj == NULL)
-		return -ENOENT;
-
-	bo = gem_to_mga_bo(obj);
-	*offset = mgag200_bo_mmap_offset(bo);
+	struct mga_device *mdev = dev->dev_private;
 
-	drm_gem_object_put_unlocked(obj);
-	return 0;
+	return drm_gem_vram_fill_create_dumb(file, dev, &mdev->ttm.bdev, 0,
+					    false, args);
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 7481a3d556ad..26baae5eeb9b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -867,48 +867,57 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 	struct mga_device *mdev = crtc->dev->dev_private;
 	struct drm_gem_object *obj;
 	struct mga_framebuffer *mga_fb;
-	struct mgag200_bo *bo;
+	struct drm_gem_vram_object *gbo;
 	int ret;
-	u64 gpu_addr;
+	s64 gpu_addr;
 
 	/* push the previous fb to system ram */
 	if (!atomic && fb) {
 		mga_fb = to_mga_framebuffer(fb);
 		obj = mga_fb->obj;
-		bo = gem_to_mga_bo(obj);
-		ret = mgag200_bo_reserve(bo, false);
+		gbo = drm_gem_vram_of_gem(obj);
+		ret = drm_gem_vram_reserve(gbo, false);
 		if (ret)
 			return ret;
-		mgag200_bo_push_sysram(bo);
-		mgag200_bo_unreserve(bo);
+		drm_gem_vram_push_to_system(gbo);
+		drm_gem_vram_unreserve(gbo);
 	}
 
 	mga_fb = to_mga_framebuffer(crtc->primary->fb);
 	obj = mga_fb->obj;
-	bo = gem_to_mga_bo(obj);
+	gbo = drm_gem_vram_of_gem(obj);
 
-	ret = mgag200_bo_reserve(bo, false);
+	ret = drm_gem_vram_reserve(gbo, false);
 	if (ret)
 		return ret;
 
-	ret = mgag200_bo_pin(bo, TTM_PL_FLAG_VRAM, &gpu_addr);
-	if (ret) {
-		mgag200_bo_unreserve(bo);
-		return ret;
+	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
+	if (ret)
+		goto err_drm_gem_vram_unreserve;
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (gpu_addr < 0) {
+		ret = (int)gpu_addr;
+		goto err_drm_gem_vram_unpin;
 	}
 
 	if (&mdev->mfbdev->mfb == mga_fb) {
 		/* if pushing console in kmap it */
-		ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->kmap);
+		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
 		if (ret)
 			DRM_ERROR("failed to kmap fbcon\n");
 
 	}
-	mgag200_bo_unreserve(bo);
+	drm_gem_vram_unreserve(gbo);
 
 	mga_set_start_address(crtc, (u32)gpu_addr);
 
 	return 0;
+
+err_drm_gem_vram_unpin:
+	drm_gem_vram_unpin(gbo);
+err_drm_gem_vram_unreserve:
+	drm_gem_vram_unreserve(gbo);
+	return ret;
 }
 
 static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
@@ -1428,12 +1437,13 @@ static void mga_crtc_disable(struct drm_crtc *crtc)
 	if (crtc->primary->fb) {
 		struct mga_framebuffer *mga_fb = to_mga_framebuffer(crtc->primary->fb);
 		struct drm_gem_object *obj = mga_fb->obj;
-		struct mgag200_bo *bo = gem_to_mga_bo(obj);
-		ret = mgag200_bo_reserve(bo, false);
+		struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(obj);
+
+		ret = drm_gem_vram_reserve(gbo, false);
 		if (ret)
 			return;
-		mgag200_bo_push_sysram(bo);
-		mgag200_bo_unreserve(bo);
+		drm_gem_vram_push_to_system(gbo);
+		drm_gem_vram_unreserve(gbo);
 	}
 	crtc->primary->fb = NULL;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/mgag200/mgag200_ttm.c
index bd42365a8aa8..2c0249086bf9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ttm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ttm.c
@@ -36,23 +36,6 @@ mgag200_bdev(struct ttm_bo_device *bd)
 	return container_of(bd, struct mga_device, ttm.bdev);
 }
 
-static void mgag200_bo_ttm_destroy(struct ttm_buffer_object *tbo)
-{
-	struct mgag200_bo *bo;
-
-	bo = container_of(tbo, struct mgag200_bo, bo);
-
-	drm_gem_object_release(&bo->gem);
-	kfree(bo);
-}
-
-static bool mgag200_ttm_bo_is_mgag200_bo(struct ttm_buffer_object *bo)
-{
-	if (bo->destroy == &mgag200_bo_ttm_destroy)
-		return true;
-	return false;
-}
-
 static int
 mgag200_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 		     struct ttm_mem_type_manager *man)
@@ -78,26 +61,6 @@ mgag200_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	return 0;
 }
 
-static void
-mgag200_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
-{
-	struct mgag200_bo *mgabo = mgag200_bo(bo);
-
-	if (!mgag200_ttm_bo_is_mgag200_bo(bo))
-		return;
-
-	mgag200_ttm_placement(mgabo, TTM_PL_FLAG_SYSTEM);
-	*pl = mgabo->placement;
-}
-
-static int mgag200_bo_verify_access(struct ttm_buffer_object *bo, struct file *filp)
-{
-	struct mgag200_bo *mgabo = mgag200_bo(bo);
-
-	return drm_vma_node_verify_access(&mgabo->gem.vma_node,
-					  filp->private_data);
-}
-
 static int mgag200_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
 				  struct ttm_mem_reg *mem)
 {
@@ -162,9 +125,9 @@ struct ttm_bo_driver mgag200_bo_driver = {
 	.ttm_tt_create = mgag200_ttm_tt_create,
 	.init_mem_type = mgag200_bo_init_mem_type,
 	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = mgag200_bo_evict_flags,
+	.evict_flags = drm_gem_vram_bo_driver_evict_flags,
 	.move = NULL,
-	.verify_access = mgag200_bo_verify_access,
+	.verify_access = drm_gem_vram_bo_driver_verify_access,
 	.io_mem_reserve = &mgag200_ttm_io_mem_reserve,
 	.io_mem_free = &mgag200_ttm_io_mem_free,
 };
@@ -211,137 +174,6 @@ void mgag200_mm_fini(struct mga_device *mdev)
 	mdev->fb_mtrr = 0;
 }
 
-void mgag200_ttm_placement(struct mgag200_bo *bo, int domain)
-{
-	u32 c = 0;
-	unsigned i;
-
-	bo->placement.placement = bo->placements;
-	bo->placement.busy_placement = bo->placements;
-	if (domain & TTM_PL_FLAG_VRAM)
-		bo->placements[c++].flags = TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_VRAM;
-	if (domain & TTM_PL_FLAG_SYSTEM)
-		bo->placements[c++].flags = TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
-	if (!c)
-		bo->placements[c++].flags = TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
-	bo->placement.num_placement = c;
-	bo->placement.num_busy_placement = c;
-	for (i = 0; i < c; ++i) {
-		bo->placements[i].fpfn = 0;
-		bo->placements[i].lpfn = 0;
-	}
-}
-
-int mgag200_bo_create(struct drm_device *dev, int size, int align,
-		  uint32_t flags, struct mgag200_bo **pmgabo)
-{
-	struct mga_device *mdev = dev->dev_private;
-	struct mgag200_bo *mgabo;
-	size_t acc_size;
-	int ret;
-
-	mgabo = kzalloc(sizeof(struct mgag200_bo), GFP_KERNEL);
-	if (!mgabo)
-		return -ENOMEM;
-
-	ret = drm_gem_object_init(dev, &mgabo->gem, size);
-	if (ret) {
-		kfree(mgabo);
-		return ret;
-	}
-
-	mgabo->bo.bdev = &mdev->ttm.bdev;
-
-	mgag200_ttm_placement(mgabo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
-
-	acc_size = ttm_bo_dma_acc_size(&mdev->ttm.bdev, size,
-				       sizeof(struct mgag200_bo));
-
-	ret = ttm_bo_init(&mdev->ttm.bdev, &mgabo->bo, size,
-			  ttm_bo_type_device, &mgabo->placement,
-			  align >> PAGE_SHIFT, false, acc_size,
-			  NULL, NULL, mgag200_bo_ttm_destroy);
-	if (ret)
-		return ret;
-
-	*pmgabo = mgabo;
-	return 0;
-}
-
-static inline u64 mgag200_bo_gpu_offset(struct mgag200_bo *bo)
-{
-	return bo->bo.offset;
-}
-
-int mgag200_bo_pin(struct mgag200_bo *bo, u32 pl_flag, u64 *gpu_addr)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-
-	if (bo->pin_count) {
-		bo->pin_count++;
-		if (gpu_addr)
-			*gpu_addr = mgag200_bo_gpu_offset(bo);
-		return 0;
-	}
-
-	mgag200_ttm_placement(bo, pl_flag);
-	for (i = 0; i < bo->placement.num_placement; i++)
-		bo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
-	ret = ttm_bo_validate(&bo->bo, &bo->placement, &ctx);
-	if (ret)
-		return ret;
-
-	bo->pin_count = 1;
-	if (gpu_addr)
-		*gpu_addr = mgag200_bo_gpu_offset(bo);
-	return 0;
-}
-
-int mgag200_bo_unpin(struct mgag200_bo *bo)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	int i;
-	if (!bo->pin_count) {
-		DRM_ERROR("unpin bad %p\n", bo);
-		return 0;
-	}
-	bo->pin_count--;
-	if (bo->pin_count)
-		return 0;
-
-	for (i = 0; i < bo->placement.num_placement ; i++)
-		bo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
-	return ttm_bo_validate(&bo->bo, &bo->placement, &ctx);
-}
-
-int mgag200_bo_push_sysram(struct mgag200_bo *bo)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-	if (!bo->pin_count) {
-		DRM_ERROR("unpin bad %p\n", bo);
-		return 0;
-	}
-	bo->pin_count--;
-	if (bo->pin_count)
-		return 0;
-
-	if (bo->kmap.virtual)
-		ttm_bo_kunmap(&bo->kmap);
-
-	mgag200_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
-	for (i = 0; i < bo->placement.num_placement ; i++)
-		bo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
-
-	ret = ttm_bo_validate(&bo->bo, &bo->placement, &ctx);
-	if (ret) {
-		DRM_ERROR("pushing to VRAM failed\n");
-		return ret;
-	}
-	return 0;
-}
-
 int mgag200_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *file_priv = filp->private_data;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
