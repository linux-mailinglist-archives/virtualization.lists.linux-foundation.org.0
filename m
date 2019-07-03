Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD95DFDB
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 10:33:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 01482102C;
	Wed,  3 Jul 2019 08:33:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B0D3A100B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 08:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1B94387A
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 08:33:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 49929AEA4;
	Wed,  3 Jul 2019 08:33:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
	sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
	yc_chen@aspeedtech.com
Subject: [PATCH 3/5] drm/ast: Replace struct ast_fbdev with generic
	framebuffer emulation
Date: Wed,  3 Jul 2019 10:33:00 +0200
Message-Id: <20190703083302.2609-4-tzimmermann@suse.de>
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

This patch replaces ast's framebuffer console with DRM's generic
implememtation. All respective code is being removed from the driver.

The console is set up with a shadow buffer. The actual buffer object is
not permanently pinned in video ram, but just another buffer object that
the driver moves in and out of vram as necessary. The driver's function
ast_crtc_do_set_base() used to contain special handling for the framebuffer
console. With the new generic framebuffer, the driver does not need this
code an longer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Makefile   |   2 +-
 drivers/gpu/drm/ast/ast_drv.c  |  22 ++-
 drivers/gpu/drm/ast/ast_drv.h  |  17 --
 drivers/gpu/drm/ast/ast_fb.c   | 341 ---------------------------------
 drivers/gpu/drm/ast/ast_main.c |  30 ++-
 drivers/gpu/drm/ast/ast_mode.c |  21 --
 6 files changed, 41 insertions(+), 392 deletions(-)
 delete mode 100644 drivers/gpu/drm/ast/ast_fb.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index b086dae17013..561f7c4199e4 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -3,6 +3,6 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-ast-y := ast_drv.o ast_main.o ast_mode.o ast_fb.o ast_ttm.o ast_post.o ast_dp501.o
+ast-y := ast_drv.o ast_main.o ast_mode.o ast_ttm.o ast_post.o ast_dp501.o
 
 obj-$(CONFIG_DRM_AST) := ast.o
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 3811997e78c4..75f55ac1a218 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -103,25 +103,29 @@ static int ast_drm_freeze(struct drm_device *dev)
 
 	pci_save_state(dev->pdev);
 
-	console_lock();
-	ast_fbdev_set_suspend(dev, 1);
-	console_unlock();
+	if (dev->fb_helper) {
+		console_lock();
+		drm_fb_helper_set_suspend(dev->fb_helper, 1);
+		console_unlock();
+	}
+
 	return 0;
 }
 
 static int ast_drm_thaw(struct drm_device *dev)
 {
-	int error = 0;
-
 	ast_post_gpu(dev);
 
 	drm_mode_config_reset(dev);
 	drm_helper_resume_force_mode(dev);
 
-	console_lock();
-	ast_fbdev_set_suspend(dev, 0);
-	console_unlock();
-	return error;
+	if (dev->fb_helper) {
+		console_lock();
+		drm_fb_helper_set_suspend(dev->fb_helper, 0);
+		console_unlock();
+	}
+
+	return 0;
 }
 
 static int ast_drm_resume(struct drm_device *dev)
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ca794a3fcf8f..907d7480b7ba 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -81,8 +81,6 @@ enum ast_tx_chip {
 #define AST_DRAM_4Gx16   7
 #define AST_DRAM_8Gx16   8
 
-struct ast_fbdev;
-
 struct ast_private {
 	struct drm_device *dev;
 
@@ -96,8 +94,6 @@ struct ast_private {
 	uint32_t mclk;
 	uint32_t vram_size;
 
-	struct ast_fbdev *fbdev;
-
 	int fb_mtrr;
 
 	struct drm_gem_object *cursor_cache;
@@ -239,14 +235,6 @@ struct ast_encoder {
 	struct drm_encoder base;
 };
 
-struct ast_fbdev {
-	struct drm_fb_helper helper; /* must be first */
-	void *sysram;
-	int size;
-	int x1, y1, x2, y2; /* dirty rect */
-	spinlock_t dirty_lock;
-};
-
 #define to_ast_crtc(x) container_of(x, struct ast_crtc, base)
 #define to_ast_connector(x) container_of(x, struct ast_connector, base)
 #define to_ast_encoder(x) container_of(x, struct ast_encoder, base)
@@ -289,11 +277,6 @@ struct ast_vbios_mode_info {
 extern int ast_mode_init(struct drm_device *dev);
 extern void ast_mode_fini(struct drm_device *dev);
 
-int ast_fbdev_init(struct drm_device *dev);
-void ast_fbdev_fini(struct drm_device *dev);
-void ast_fbdev_set_suspend(struct drm_device *dev, int state);
-void ast_fbdev_set_base(struct ast_private *ast, unsigned long gpu_addr);
-
 #define AST_MM_ALIGN_SHIFT 4
 #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
 
diff --git a/drivers/gpu/drm/ast/ast_fb.c b/drivers/gpu/drm/ast/ast_fb.c
deleted file mode 100644
index a849e58b40bc..000000000000
--- a/drivers/gpu/drm/ast/ast_fb.c
+++ /dev/null
@@ -1,341 +0,0 @@
-/*
- * Copyright 2012 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- */
-/*
- * Authors: Dave Airlie <airlied@redhat.com>
- */
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/tty.h>
-#include <linux/sysrq.h>
-#include <linux/delay.h>
-#include <linux/init.h>
-
-
-#include <drm/drmP.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_util.h>
-
-#include "ast_drv.h"
-
-static void ast_dirty_update(struct ast_fbdev *afbdev,
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
-	struct drm_framebuffer *fb = afbdev->helper.fb;
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
-	spin_lock_irqsave(&afbdev->dirty_lock, flags);
-
-	if (afbdev->y1 < y)
-		y = afbdev->y1;
-	if (afbdev->y2 > y2)
-		y2 = afbdev->y2;
-	if (afbdev->x1 < x)
-		x = afbdev->x1;
-	if (afbdev->x2 > x2)
-		x2 = afbdev->x2;
-
-	if (store_for_later) {
-		afbdev->x1 = x;
-		afbdev->x2 = x2;
-		afbdev->y1 = y;
-		afbdev->y2 = y2;
-		spin_unlock_irqrestore(&afbdev->dirty_lock, flags);
-		return;
-	}
-
-	afbdev->x1 = afbdev->y1 = INT_MAX;
-	afbdev->x2 = afbdev->y2 = 0;
-	spin_unlock_irqrestore(&afbdev->dirty_lock, flags);
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
-		memcpy_toio(dst + dst_offset, afbdev->sysram + src_offset,
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
-static void ast_fillrect(struct fb_info *info,
-			 const struct fb_fillrect *rect)
-{
-	struct ast_fbdev *afbdev = info->par;
-	drm_fb_helper_sys_fillrect(info, rect);
-	ast_dirty_update(afbdev, rect->dx, rect->dy, rect->width,
-			 rect->height);
-}
-
-static void ast_copyarea(struct fb_info *info,
-			 const struct fb_copyarea *area)
-{
-	struct ast_fbdev *afbdev = info->par;
-	drm_fb_helper_sys_copyarea(info, area);
-	ast_dirty_update(afbdev, area->dx, area->dy, area->width,
-			 area->height);
-}
-
-static void ast_imageblit(struct fb_info *info,
-			  const struct fb_image *image)
-{
-	struct ast_fbdev *afbdev = info->par;
-	drm_fb_helper_sys_imageblit(info, image);
-	ast_dirty_update(afbdev, image->dx, image->dy, image->width,
-			 image->height);
-}
-
-static struct fb_ops astfb_ops = {
-	.owner = THIS_MODULE,
-	.fb_check_var = drm_fb_helper_check_var,
-	.fb_set_par = drm_fb_helper_set_par,
-	.fb_fillrect = ast_fillrect,
-	.fb_copyarea = ast_copyarea,
-	.fb_imageblit = ast_imageblit,
-	.fb_pan_display = drm_fb_helper_pan_display,
-	.fb_blank = drm_fb_helper_blank,
-	.fb_setcmap = drm_fb_helper_setcmap,
-};
-
-static int astfb_create_object(struct ast_fbdev *afbdev,
-			       const struct drm_mode_fb_cmd2 *mode_cmd,
-			       struct drm_gem_object **gobj_p)
-{
-	struct drm_device *dev = afbdev->helper.dev;
-	u32 size;
-	struct drm_gem_object *gobj;
-	int ret = 0;
-
-	size = mode_cmd->pitches[0] * mode_cmd->height;
-	ret = ast_gem_create(dev, size, true, &gobj);
-	if (ret)
-		return ret;
-
-	*gobj_p = gobj;
-	return ret;
-}
-
-static int astfb_create(struct drm_fb_helper *helper,
-			struct drm_fb_helper_surface_size *sizes)
-{
-	struct ast_fbdev *afbdev =
-		container_of(helper, struct ast_fbdev, helper);
-	struct drm_device *dev = afbdev->helper.dev;
-	struct drm_mode_fb_cmd2 mode_cmd;
-	struct drm_framebuffer *fb;
-	struct fb_info *info;
-	int size, ret;
-	void *sysram;
-	struct drm_gem_object *gobj = NULL;
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pitches[0] = mode_cmd.width * ((sizes->surface_bpp + 7)/8);
-
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
-
-	size = mode_cmd.pitches[0] * mode_cmd.height;
-
-	ret = astfb_create_object(afbdev, &mode_cmd, &gobj);
-	if (ret) {
-		DRM_ERROR("failed to create fbcon backing object %d\n", ret);
-		return ret;
-	}
-
-	sysram = vmalloc(size);
-	if (!sysram)
-		return -ENOMEM;
-
-	info = drm_fb_helper_alloc_fbi(helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto out;
-	}
-	fb = drm_gem_fbdev_fb_create(dev, sizes, 0, gobj, NULL);
-	if (IS_ERR(fb)) {
-		ret = PTR_ERR(fb);
-		goto out;
-	}
-
-	afbdev->sysram = sysram;
-	afbdev->size = size;
-
-	afbdev->helper.fb = fb;
-
-	info->fbops = &astfb_ops;
-
-	info->apertures->ranges[0].base = pci_resource_start(dev->pdev, 0);
-	info->apertures->ranges[0].size = pci_resource_len(dev->pdev, 0);
-
-	drm_fb_helper_fill_info(info, &afbdev->helper, sizes);
-
-	info->screen_base = sysram;
-	info->screen_size = size;
-
-	info->pixmap.flags = FB_PIXMAP_SYSTEM;
-
-	DRM_DEBUG_KMS("allocated %dx%d\n",
-		      fb->width, fb->height);
-
-	return 0;
-
-out:
-	vfree(sysram);
-	return ret;
-}
-
-static const struct drm_fb_helper_funcs ast_fb_helper_funcs = {
-	.fb_probe = astfb_create,
-};
-
-static void ast_fbdev_destroy(struct drm_device *dev,
-			      struct ast_fbdev *afbdev)
-{
-	drm_helper_force_disable_all(dev);
-	drm_fb_helper_unregister_fbi(&afbdev->helper);
-
-	drm_fb_helper_fini(&afbdev->helper);
-	drm_framebuffer_put(afbdev->helper.fb);
-
-	vfree(afbdev->sysram);
-}
-
-int ast_fbdev_init(struct drm_device *dev)
-{
-	struct ast_private *ast = dev->dev_private;
-	struct ast_fbdev *afbdev;
-	int ret;
-
-	afbdev = kzalloc(sizeof(struct ast_fbdev), GFP_KERNEL);
-	if (!afbdev)
-		return -ENOMEM;
-
-	ast->fbdev = afbdev;
-	spin_lock_init(&afbdev->dirty_lock);
-
-	drm_fb_helper_prepare(dev, &afbdev->helper, &ast_fb_helper_funcs);
-
-	ret = drm_fb_helper_init(dev, &afbdev->helper, 1);
-	if (ret)
-		goto free;
-
-	ret = drm_fb_helper_single_add_all_connectors(&afbdev->helper);
-	if (ret)
-		goto fini;
-
-	/* disable all the possible outputs/crtcs before entering KMS mode */
-	drm_helper_disable_unused_functions(dev);
-
-	ret = drm_fb_helper_initial_config(&afbdev->helper, 32);
-	if (ret)
-		goto fini;
-
-	return 0;
-
-fini:
-	drm_fb_helper_fini(&afbdev->helper);
-free:
-	kfree(afbdev);
-	return ret;
-}
-
-void ast_fbdev_fini(struct drm_device *dev)
-{
-	struct ast_private *ast = dev->dev_private;
-
-	if (!ast->fbdev)
-		return;
-
-	ast_fbdev_destroy(dev, ast->fbdev);
-	kfree(ast->fbdev);
-	ast->fbdev = NULL;
-}
-
-void ast_fbdev_set_suspend(struct drm_device *dev, int state)
-{
-	struct ast_private *ast = dev->dev_private;
-
-	if (!ast->fbdev)
-		return;
-
-	drm_fb_helper_set_suspend(&ast->fbdev->helper, state);
-}
-
-void ast_fbdev_set_base(struct ast_private *ast, unsigned long gpu_addr)
-{
-	ast->fbdev->helper.fbdev->fix.smem_start =
-		ast->fbdev->helper.fbdev->apertures->ranges[0].base + gpu_addr;
-	ast->fbdev->helper.fbdev->fix.smem_len = ast->vram_size - gpu_addr;
-}
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 1bd61696e509..78e8e20ff577 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -383,8 +383,33 @@ static int ast_get_dram_info(struct drm_device *dev)
 	return 0;
 }
 
+static int ast_framebuffer_dirtyfb(struct drm_framebuffer *fb,
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
+static const struct drm_framebuffer_funcs ast_framebuffer_funcs = {
+	.destroy	= drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+	.dirty		= ast_framebuffer_dirtyfb,
+};
+
+static struct drm_framebuffer *
+ast_mode_config_fb_create(struct drm_device *dev, struct drm_file *file,
+			  const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
+					    &ast_framebuffer_funcs);
+}
+
 static const struct drm_mode_config_funcs ast_mode_funcs = {
-	.fb_create = drm_gem_fb_create
+	.fb_create = ast_mode_config_fb_create
 };
 
 static u32 ast_get_vram_info(struct drm_device *dev)
@@ -502,7 +527,7 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto out_free;
 
-	ret = ast_fbdev_init(dev);
+	ret = drm_fbdev_generic_setup(dev, 32);
 	if (ret)
 		goto out_free;
 
@@ -520,7 +545,6 @@ void ast_driver_unload(struct drm_device *dev)
 	ast_release_firmware(dev);
 	kfree(ast->dp501_fw_addr);
 	ast_mode_fini(dev);
-	ast_fbdev_fini(dev);
 	drm_mode_config_cleanup(dev);
 
 	ast_mm_fini(ast);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index c48249df758e..3c0716891b29 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -525,18 +525,12 @@ static int ast_crtc_do_set_base(struct drm_crtc *crtc,
 				struct drm_framebuffer *fb,
 				int x, int y, int atomic)
 {
-	struct ast_private *ast = crtc->dev->dev_private;
 	struct drm_gem_vram_object *gbo;
 	int ret;
 	s64 gpu_addr;
-	void *base;
 
 	if (!atomic && fb) {
 		gbo = drm_gem_vram_of_gem(fb->obj[0]);
-
-		/* unmap if console */
-		if (ast->fbdev->helper.fb == fb)
-			drm_gem_vram_kunmap(gbo);
 		drm_gem_vram_unpin(gbo);
 	}
 
@@ -551,17 +545,6 @@ static int ast_crtc_do_set_base(struct drm_crtc *crtc,
 		goto err_drm_gem_vram_unpin;
 	}
 
-	if (ast->fbdev->helper.fb == crtc->primary->fb) {
-		/* if pushing console in kmap it */
-		base = drm_gem_vram_kmap(gbo, true, NULL);
-		if (IS_ERR(base)) {
-			ret = PTR_ERR(base);
-			DRM_ERROR("failed to kmap fbcon\n");
-		} else {
-			ast_fbdev_set_base(ast, gpu_addr);
-		}
-	}
-
 	ast_set_offset_reg(crtc);
 	ast_set_start_address_crt1(crtc, (u32)gpu_addr);
 
@@ -618,14 +601,10 @@ static void ast_crtc_disable(struct drm_crtc *crtc)
 	DRM_DEBUG_KMS("\n");
 	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
 	if (crtc->primary->fb) {
-		struct ast_private *ast = crtc->dev->dev_private;
 		struct drm_framebuffer *fb = crtc->primary->fb;
 		struct drm_gem_vram_object *gbo =
 			drm_gem_vram_of_gem(fb->obj[0]);
 
-		/* unmap if console */
-		if (ast->fbdev->helper.fb == fb)
-			drm_gem_vram_kunmap(gbo);
 		drm_gem_vram_unpin(gbo);
 	}
 	crtc->primary->fb = NULL;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
