Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF55DFE2
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 10:34:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 697691016;
	Wed,  3 Jul 2019 08:33:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8045B1032
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 08:33:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0B5AF70D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 08:33:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 10B21AF8D;
	Wed,  3 Jul 2019 08:33:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
	sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
	yc_chen@aspeedtech.com
Subject: [PATCH 5/5] drm/mgag200: Replace struct mga_fbdev with generic
	framebuffer emulation
Date: Wed,  3 Jul 2019 10:33:02 +0200
Message-Id: <20190703083302.2609-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703083302.2609-1-tzimmermann@suse.de>
References: <20190703083302.2609-1-tzimmermann@suse.de>
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

This patch replaces mgag200's framebuffer console with DRM's generic
implememtation. All respective code is being removed from the driver.

The console is set up with a shadow buffer. The actual buffer object is
not permanently pinned in video ram, but just another buffer object that
the driver moves in and out of vram as necessary. The driver's function
mga_crtc_do_set_base() used to contain special handling for the framebuffer
console. With the new generic framebuffer, the driver does not need this
code an longer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/Makefile       |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 --
 drivers/gpu/drm/mgag200/mgag200_fb.c   | 309 -------------------------
 drivers/gpu/drm/mgag200/mgag200_main.c |  61 ++---
 drivers/gpu/drm/mgag200/mgag200_mode.c |  27 ---
 5 files changed, 35 insertions(+), 383 deletions(-)
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_fb.c

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index 98d204408bd0..04b281bcf655 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 mgag200-y   := mgag200_main.o mgag200_mode.o mgag200_cursor.o \
-	mgag200_drv.o mgag200_fb.o mgag200_i2c.o mgag200_ttm.o
+	mgag200_drv.o mgag200_i2c.o mgag200_ttm.o
 
 obj-$(CONFIG_DRM_MGAG200) += mgag200.o
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 3ab27f1053c1..1c93f8dc08c7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -99,14 +99,6 @@
 #define to_mga_encoder(x) container_of(x, struct mga_encoder, base)
 #define to_mga_connector(x) container_of(x, struct mga_connector, base)
 
-struct mga_fbdev {
-	struct drm_fb_helper helper; /* must be first */
-	void *sysram;
-	int size;
-	int x1, y1, x2, y2; /* dirty rect */
-	spinlock_t dirty_lock;
-};
-
 struct mga_crtc {
 	struct drm_crtc base;
 	u8 lut_r[256], lut_g[256], lut_b[256];
@@ -180,7 +172,6 @@ struct mga_device {
 	struct mga_mc			mc;
 	struct mga_mode_info		mode_info;
 
-	struct mga_fbdev *mfbdev;
 	struct mga_cursor cursor;
 
 	bool				suspended;
@@ -201,19 +192,9 @@ struct mga_device {
 int mgag200_modeset_init(struct mga_device *mdev);
 void mgag200_modeset_fini(struct mga_device *mdev);
 
-				/* mgag200_fb.c */
-int mgag200_fbdev_init(struct mga_device *mdev);
-void mgag200_fbdev_fini(struct mga_device *mdev);
-
 				/* mgag200_main.c */
 int mgag200_driver_load(struct drm_device *dev, unsigned long flags);
 void mgag200_driver_unload(struct drm_device *dev);
-int mgag200_gem_create(struct drm_device *dev,
-		   u32 size, bool iskernel,
-		       struct drm_gem_object **obj);
-int mgag200_dumb_create(struct drm_file *file,
-			struct drm_device *dev,
-			struct drm_mode_create_dumb *args);
 
 				/* mgag200_i2c.c */
 struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
diff --git a/drivers/gpu/drm/mgag200/mgag200_fb.c b/drivers/gpu/drm/mgag200/mgag200_fb.c
deleted file mode 100644
index c77cf1b34c98..000000000000
--- a/drivers/gpu/drm/mgag200/mgag200_fb.c
+++ /dev/null
@@ -1,309 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright 2010 Matt Turner.
- * Copyright 2012 Red Hat
- *
- * Authors: Matthew Garrett
- *          Matt Turner
- *          Dave Airlie
- */
-
-#include <linux/module.h>
-#include <linux/vmalloc.h>
-
-#include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
-#include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_util.h>
-
-#include "mgag200_drv.h"
-
-static void mga_dirty_update(struct mga_fbdev *mfbdev,
-			     int x, int y, int width, int height)
-{
-	int i;
-	struct drm_gem_vram_object *gbo;
-	int src_offset, dst_offset;
-	int ret;
-	u8 *dst;
-	bool unmap = false;
-	bool store_for_later = false;
-	int x2, y2;
-	unsigned long flags;
-	struct drm_framebuffer *fb = mfbdev->helper.fb;
-	int bpp = fb->format->cpp[0];
-
-	gbo = drm_gem_vram_of_gem(fb->obj[0]);
-
-	if (drm_can_sleep()) {
-		/* We pin the BO so it won't be moved during the
-		 * update. The actual location, video RAM or system
-		 * memory, is not important.
-		 */
-		ret = drm_gem_vram_pin(gbo, 0);
-		if (ret) {
-			if (ret != -EBUSY)
-				return;
-			store_for_later = true;
-		}
-	} else {
-		store_for_later = true;
-	}
-
-	x2 = x + width - 1;
-	y2 = y + height - 1;
-	spin_lock_irqsave(&mfbdev->dirty_lock, flags);
-
-	if (mfbdev->y1 < y)
-		y = mfbdev->y1;
-	if (mfbdev->y2 > y2)
-		y2 = mfbdev->y2;
-	if (mfbdev->x1 < x)
-		x = mfbdev->x1;
-	if (mfbdev->x2 > x2)
-		x2 = mfbdev->x2;
-
-	if (store_for_later) {
-		mfbdev->x1 = x;
-		mfbdev->x2 = x2;
-		mfbdev->y1 = y;
-		mfbdev->y2 = y2;
-		spin_unlock_irqrestore(&mfbdev->dirty_lock, flags);
-		return;
-	}
-
-	mfbdev->x1 = mfbdev->y1 = INT_MAX;
-	mfbdev->x2 = mfbdev->y2 = 0;
-	spin_unlock_irqrestore(&mfbdev->dirty_lock, flags);
-
-	dst = drm_gem_vram_kmap(gbo, false, NULL);
-	if (IS_ERR(dst)) {
-		DRM_ERROR("failed to kmap fb updates\n");
-		goto out;
-	} else if (!dst) {
-		dst = drm_gem_vram_kmap(gbo, true, NULL);
-		if (IS_ERR(dst)) {
-			DRM_ERROR("failed to kmap fb updates\n");
-			goto out;
-		}
-		unmap = true;
-	}
-
-	for (i = y; i <= y2; i++) {
-		/* assume equal stride for now */
-		src_offset = dst_offset = i * fb->pitches[0] + (x * bpp);
-		memcpy_toio(dst + dst_offset, mfbdev->sysram + src_offset,
-			    (x2 - x + 1) * bpp);
-	}
-
-	if (unmap)
-		drm_gem_vram_kunmap(gbo);
-
-out:
-	drm_gem_vram_unpin(gbo);
-}
-
-static void mga_fillrect(struct fb_info *info,
-			 const struct fb_fillrect *rect)
-{
-	struct mga_fbdev *mfbdev = info->par;
-	drm_fb_helper_sys_fillrect(info, rect);
-	mga_dirty_update(mfbdev, rect->dx, rect->dy, rect->width,
-			 rect->height);
-}
-
-static void mga_copyarea(struct fb_info *info,
-			 const struct fb_copyarea *area)
-{
-	struct mga_fbdev *mfbdev = info->par;
-	drm_fb_helper_sys_copyarea(info, area);
-	mga_dirty_update(mfbdev, area->dx, area->dy, area->width,
-			 area->height);
-}
-
-static void mga_imageblit(struct fb_info *info,
-			  const struct fb_image *image)
-{
-	struct mga_fbdev *mfbdev = info->par;
-	drm_fb_helper_sys_imageblit(info, image);
-	mga_dirty_update(mfbdev, image->dx, image->dy, image->width,
-			 image->height);
-}
-
-
-static struct fb_ops mgag200fb_ops = {
-	.owner = THIS_MODULE,
-	.fb_check_var = drm_fb_helper_check_var,
-	.fb_set_par = drm_fb_helper_set_par,
-	.fb_fillrect = mga_fillrect,
-	.fb_copyarea = mga_copyarea,
-	.fb_imageblit = mga_imageblit,
-	.fb_pan_display = drm_fb_helper_pan_display,
-	.fb_blank = drm_fb_helper_blank,
-	.fb_setcmap = drm_fb_helper_setcmap,
-};
-
-static int mgag200fb_create_object(struct mga_fbdev *afbdev,
-				   const struct drm_mode_fb_cmd2 *mode_cmd,
-				   struct drm_gem_object **gobj_p)
-{
-	struct drm_device *dev = afbdev->helper.dev;
-	u32 size;
-	struct drm_gem_object *gobj;
-	int ret = 0;
-
-	size = mode_cmd->pitches[0] * mode_cmd->height;
-	ret = mgag200_gem_create(dev, size, true, &gobj);
-	if (ret)
-		return ret;
-
-	*gobj_p = gobj;
-	return ret;
-}
-
-static int mgag200fb_create(struct drm_fb_helper *helper,
-			   struct drm_fb_helper_surface_size *sizes)
-{
-	struct mga_fbdev *mfbdev =
-		container_of(helper, struct mga_fbdev, helper);
-	struct drm_device *dev = mfbdev->helper.dev;
-	struct drm_mode_fb_cmd2 mode_cmd;
-	struct mga_device *mdev = dev->dev_private;
-	struct fb_info *info;
-	struct drm_framebuffer *fb;
-	struct drm_gem_object *gobj = NULL;
-	int ret;
-	void *sysram;
-	int size;
-
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pitches[0] = mode_cmd.width * ((sizes->surface_bpp + 7) / 8);
-
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
-	size = mode_cmd.pitches[0] * mode_cmd.height;
-
-	ret = mgag200fb_create_object(mfbdev, &mode_cmd, &gobj);
-	if (ret) {
-		DRM_ERROR("failed to create fbcon backing object %d\n", ret);
-		return ret;
-	}
-
-	sysram = vmalloc(size);
-	if (!sysram) {
-		ret = -ENOMEM;
-		goto err_drm_gem_object_put_unlocked;
-	}
-
-	info = drm_fb_helper_alloc_fbi(helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto err_vfree;
-	}
-
-	fb = drm_gem_fbdev_fb_create(dev, sizes, 0, gobj, NULL);
-	if (IS_ERR(fb)) {
-		ret = PTR_ERR(fb);
-		goto err_vfree;
-	}
-
-	mfbdev->sysram = sysram;
-	mfbdev->size = size;
-
-	/* setup helper */
-	mfbdev->helper.fb = fb;
-
-	info->fbops = &mgag200fb_ops;
-
-	/* setup aperture base/size for vesafb takeover */
-	info->apertures->ranges[0].base = mdev->dev->mode_config.fb_base;
-	info->apertures->ranges[0].size = mdev->mc.vram_size;
-
-	drm_fb_helper_fill_info(info, &mfbdev->helper, sizes);
-
-	info->screen_base = sysram;
-	info->screen_size = size;
-	info->pixmap.flags = FB_PIXMAP_SYSTEM;
-
-	DRM_DEBUG_KMS("allocated %dx%d\n",
-		      fb->width, fb->height);
-
-	return 0;
-
-err_vfree:
-	vfree(sysram);
-err_drm_gem_object_put_unlocked:
-	drm_gem_object_put_unlocked(gobj);
-	return ret;
-}
-
-static int mga_fbdev_destroy(struct drm_device *dev,
-				struct mga_fbdev *mfbdev)
-{
-	drm_fb_helper_unregister_fbi(&mfbdev->helper);
-	drm_fb_helper_fini(&mfbdev->helper);
-	drm_framebuffer_put(mfbdev->helper.fb);
-
-	vfree(mfbdev->sysram);
-
-	return 0;
-}
-
-static const struct drm_fb_helper_funcs mga_fb_helper_funcs = {
-	.fb_probe = mgag200fb_create,
-};
-
-int mgag200_fbdev_init(struct mga_device *mdev)
-{
-	struct mga_fbdev *mfbdev;
-	int ret;
-	int bpp_sel = 32;
-
-	/* prefer 16bpp on low end gpus with limited VRAM */
-	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
-		bpp_sel = 16;
-
-	mfbdev = devm_kzalloc(mdev->dev->dev, sizeof(struct mga_fbdev), GFP_KERNEL);
-	if (!mfbdev)
-		return -ENOMEM;
-
-	mdev->mfbdev = mfbdev;
-	spin_lock_init(&mfbdev->dirty_lock);
-
-	drm_fb_helper_prepare(mdev->dev, &mfbdev->helper, &mga_fb_helper_funcs);
-
-	ret = drm_fb_helper_init(mdev->dev, &mfbdev->helper,
-				 MGAG200FB_CONN_LIMIT);
-	if (ret)
-		goto err_fb_helper;
-
-	ret = drm_fb_helper_single_add_all_connectors(&mfbdev->helper);
-	if (ret)
-		goto err_fb_setup;
-
-	/* disable all the possible outputs/crtcs before entering KMS mode */
-	drm_helper_disable_unused_functions(mdev->dev);
-
-	ret = drm_fb_helper_initial_config(&mfbdev->helper, bpp_sel);
-	if (ret)
-		goto err_fb_setup;
-
-	return 0;
-
-err_fb_setup:
-	drm_fb_helper_fini(&mfbdev->helper);
-err_fb_helper:
-	mdev->mfbdev = NULL;
-
-	return ret;
-}
-
-void mgag200_fbdev_fini(struct mga_device *mdev)
-{
-	if (!mdev->mfbdev)
-		return;
-
-	mga_fbdev_destroy(mdev->dev, mdev->mfbdev);
-}
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index b10f7265b5c4..6d943a008752 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -14,8 +14,33 @@
 
 #include "mgag200_drv.h"
 
+static int mga_framebuffer_dirtyfb(struct drm_framebuffer *fb,
+				   struct drm_file *file_priv,
+				   unsigned int flags,
+				   unsigned int color,
+				   struct drm_clip_rect *clips,
+				   unsigned int num_clips)
+{
+	/* empty placeholder function to enable fbcon shadow buffer */
+	return 0;
+}
+
+static const struct drm_framebuffer_funcs mga_framebuffer_funcs = {
+	.destroy	= drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+	.dirty		= mga_framebuffer_dirtyfb,
+};
+
+static struct drm_framebuffer *
+mga_mode_config_funcs_fb_create(struct drm_device *dev, struct drm_file *file,
+				const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
+					    &mga_framebuffer_funcs);
+}
+
 static const struct drm_mode_config_funcs mga_mode_funcs = {
-	.fb_create = drm_gem_fb_create
+	.fb_create = mga_mode_config_funcs_fb_create
 };
 
 static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)
@@ -162,7 +187,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
 		dev->mode_config.preferred_depth = 16;
 	else
-		dev->mode_config.preferred_depth = 24;
+		dev->mode_config.preferred_depth = 32;
 	dev->mode_config.prefer_shadow = 1;
 
 	r = mgag200_modeset_init(mdev);
@@ -186,6 +211,13 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	}
 	mdev->cursor.pixels_current = NULL;
 
+	r = drm_fbdev_generic_setup(mdev->dev, 0);
+	if (r) {
+		dev_err(&dev->pdev->dev,
+			"drm_fbdev_generic_setup failed: %d\n", r);
+		goto err_modeset;
+	}
+
 	return 0;
 
 err_modeset:
@@ -204,32 +236,7 @@ void mgag200_driver_unload(struct drm_device *dev)
 	if (mdev == NULL)
 		return;
 	mgag200_modeset_fini(mdev);
-	mgag200_fbdev_fini(mdev);
 	drm_mode_config_cleanup(dev);
 	mgag200_mm_fini(mdev);
 	dev->dev_private = NULL;
 }
-
-int mgag200_gem_create(struct drm_device *dev,
-		   u32 size, bool iskernel,
-		   struct drm_gem_object **obj)
-{
-	struct drm_gem_vram_object *gbo;
-	int ret;
-
-	*obj = NULL;
-
-	size = roundup(size, PAGE_SIZE);
-	if (size == 0)
-		return -EINVAL;
-
-	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0, false);
-	if (IS_ERR(gbo)) {
-		ret = PTR_ERR(gbo);
-		if (ret != -ERESTARTSYS)
-			DRM_ERROR("failed to allocate GEM object\n");
-		return ret;
-	}
-	*obj = &gbo->gem;
-	return 0;
-}
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index a7cef78d426f..822f2a13748f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -860,18 +860,12 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 				struct drm_framebuffer *fb,
 				int x, int y, int atomic)
 {
-	struct mga_device *mdev = crtc->dev->dev_private;
 	struct drm_gem_vram_object *gbo;
 	int ret;
 	s64 gpu_addr;
-	void *base;
 
 	if (!atomic && fb) {
 		gbo = drm_gem_vram_of_gem(fb->obj[0]);
-
-		/* unmap if console */
-		if (mdev->mfbdev->helper.fb == fb)
-			drm_gem_vram_kunmap(gbo);
 		drm_gem_vram_unpin(gbo);
 	}
 
@@ -886,15 +880,6 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 		goto err_drm_gem_vram_unpin;
 	}
 
-	if (mdev->mfbdev->helper.fb == crtc->primary->fb) {
-		/* if pushing console in kmap it */
-		base = drm_gem_vram_kmap(gbo, true, NULL);
-		if (IS_ERR(base)) {
-			ret = PTR_ERR(base);
-			DRM_ERROR("failed to kmap fbcon\n");
-		}
-	}
-
 	mga_set_start_address(crtc, (u32)gpu_addr);
 
 	return 0;
@@ -1418,14 +1403,9 @@ static void mga_crtc_disable(struct drm_crtc *crtc)
 	DRM_DEBUG_KMS("\n");
 	mga_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
 	if (crtc->primary->fb) {
-		struct mga_device *mdev = crtc->dev->dev_private;
 		struct drm_framebuffer *fb = crtc->primary->fb;
 		struct drm_gem_vram_object *gbo =
 			drm_gem_vram_of_gem(fb->obj[0]);
-
-		/* unmap if console */
-		if (mdev->mfbdev->helper.fb == fb)
-			drm_gem_vram_kunmap(gbo);
 		drm_gem_vram_unpin(gbo);
 	}
 	crtc->primary->fb = NULL;
@@ -1718,7 +1698,6 @@ int mgag200_modeset_init(struct mga_device *mdev)
 {
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
-	int ret;
 
 	mdev->mode_info.mode_config_initialized = true;
 
@@ -1743,12 +1722,6 @@ int mgag200_modeset_init(struct mga_device *mdev)
 
 	drm_connector_attach_encoder(connector, encoder);
 
-	ret = mgag200_fbdev_init(mdev);
-	if (ret) {
-		DRM_ERROR("mga_fbdev_init failed\n");
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
