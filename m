Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFD514652
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 10:29:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 003674552;
	Mon,  6 May 2019 08:27:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 93CA44520
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:27:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EAE98837
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:26:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 4EC64AF26;
	Mon,  6 May 2019 08:26:57 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v4 08/19] drm/ast: Convert AST driver to |struct
	drm_gem_vram_object|
Date: Mon,  6 May 2019 10:26:38 +0200
Message-Id: <20190506082649.942-9-tzimmermann@suse.de>
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

The data structure |struct drm_gem_vram_object| and its helpers replace
|struct ast_bo|. It's the same implementation; except for the type names.

v4:
	* cleanups from checkpatch.pl

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Kconfig    |   2 +-
 drivers/gpu/drm/ast/ast_drv.c  |   5 +-
 drivers/gpu/drm/ast/ast_drv.h  |  52 +---------
 drivers/gpu/drm/ast/ast_fb.c   |  23 +++--
 drivers/gpu/drm/ast/ast_main.c |  74 ++------------
 drivers/gpu/drm/ast/ast_mode.c |  78 +++++++++------
 drivers/gpu/drm/ast/ast_ttm.c  | 172 +--------------------------------
 7 files changed, 75 insertions(+), 331 deletions(-)

diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
index 9647e1f07088..f3737488630b 100644
--- a/drivers/gpu/drm/ast/Kconfig
+++ b/drivers/gpu/drm/ast/Kconfig
@@ -3,7 +3,7 @@ config DRM_AST
 	depends on DRM && PCI && MMU
 	select DRM_TTM
 	select DRM_KMS_HELPER
-	select DRM_TTM
+	select DRM_VRAM_HELPER
 	help
 	 Say yes for experimental AST GPU driver. Do not enable
 	 this driver without having a working -modesetting,
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 3871b39d4dea..7012b17b984f 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -228,9 +228,10 @@ static struct drm_driver driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	.gem_free_object_unlocked = ast_gem_free_object,
+	.gem_free_object_unlocked =
+		drm_gem_vram_driver_gem_free_object_unlocked,
 	.dumb_create = ast_dumb_create,
-	.dumb_map_offset = ast_dumb_mmap_offset,
+	.dumb_map_offset = drm_gem_vram_driver_dumb_mmap_offset,
 
 };
 
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 1cf0c75e411d..712838f725dc 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -38,6 +38,7 @@
 #include <drm/ttm/ttm_module.h>
 
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_vram_helper.h>
 
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
@@ -321,25 +322,6 @@ void ast_fbdev_fini(struct drm_device *dev);
 void ast_fbdev_set_suspend(struct drm_device *dev, int state);
 void ast_fbdev_set_base(struct ast_private *ast, unsigned long gpu_addr);
 
-struct ast_bo {
-	struct ttm_buffer_object bo;
-	struct ttm_placement placement;
-	struct ttm_bo_kmap_obj kmap;
-	struct drm_gem_object gem;
-	struct ttm_place placements[3];
-	int pin_count;
-};
-#define gem_to_ast_bo(gobj) container_of((gobj), struct ast_bo, gem)
-
-static inline struct ast_bo *
-ast_bo(struct ttm_buffer_object *bo)
-{
-	return container_of(bo, struct ast_bo, bo);
-}
-
-
-#define to_ast_obj(x) container_of(x, struct ast_gem_object, base)
-
 #define AST_MM_ALIGN_SHIFT 4
 #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
 
@@ -347,45 +329,13 @@ extern int ast_dumb_create(struct drm_file *file,
 			   struct drm_device *dev,
 			   struct drm_mode_create_dumb *args);
 
-extern void ast_gem_free_object(struct drm_gem_object *obj);
-extern int ast_dumb_mmap_offset(struct drm_file *file,
-				struct drm_device *dev,
-				uint32_t handle,
-				uint64_t *offset);
-
 int ast_mm_init(struct ast_private *ast);
 void ast_mm_fini(struct ast_private *ast);
 
-int ast_bo_create(struct drm_device *dev, int size, int align,
-		  uint32_t flags, struct ast_bo **pastbo);
-
 int ast_gem_create(struct drm_device *dev,
 		   u32 size, bool iskernel,
 		   struct drm_gem_object **obj);
 
-int ast_bo_pin(struct ast_bo *bo, u32 pl_flag, u64 *gpu_addr);
-int ast_bo_unpin(struct ast_bo *bo);
-
-static inline int ast_bo_reserve(struct ast_bo *bo, bool no_wait)
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
-static inline void ast_bo_unreserve(struct ast_bo *bo)
-{
-	ttm_bo_unreserve(&bo->bo);
-}
-
-void ast_ttm_placement(struct ast_bo *bo, int domain);
-int ast_bo_push_sysram(struct ast_bo *bo);
 int ast_mmap(struct file *filp, struct vm_area_struct *vma);
 
 /* ast post */
diff --git a/drivers/gpu/drm/ast/ast_fb.c b/drivers/gpu/drm/ast/ast_fb.c
index e718d0f60d6b..778423fcf352 100644
--- a/drivers/gpu/drm/ast/ast_fb.c
+++ b/drivers/gpu/drm/ast/ast_fb.c
@@ -49,7 +49,7 @@ static void ast_dirty_update(struct ast_fbdev *afbdev,
 {
 	int i;
 	struct drm_gem_object *obj;
-	struct ast_bo *bo;
+	struct drm_gem_vram_object *gbo;
 	int src_offset, dst_offset;
 	int bpp = afbdev->afb.base.format->cpp[0];
 	int ret = -EBUSY;
@@ -59,7 +59,7 @@ static void ast_dirty_update(struct ast_fbdev *afbdev,
 	unsigned long flags;
 
 	obj = afbdev->afb.obj;
-	bo = gem_to_ast_bo(obj);
+	gbo = drm_gem_vram_of_gem(obj);
 
 	/*
 	 * try and reserve the BO, if we fail with busy
@@ -67,7 +67,7 @@ static void ast_dirty_update(struct ast_fbdev *afbdev,
 	 * store up the damage until later.
 	 */
 	if (drm_can_sleep())
-		ret = ast_bo_reserve(bo, true);
+		ret = drm_gem_vram_reserve(gbo, true);
 	if (ret) {
 		if (ret != -EBUSY)
 			return;
@@ -101,25 +101,28 @@ static void ast_dirty_update(struct ast_fbdev *afbdev,
 	afbdev->x2 = afbdev->y2 = 0;
 	spin_unlock_irqrestore(&afbdev->dirty_lock, flags);
 
-	if (!bo->kmap.virtual) {
-		ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->kmap);
+	if (!gbo->kmap.virtual) {
+		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
 		if (ret) {
 			DRM_ERROR("failed to kmap fb updates\n");
-			ast_bo_unreserve(bo);
+			drm_gem_vram_unreserve(gbo);
 			return;
 		}
 		unmap = true;
 	}
 	for (i = y; i <= y2; i++) {
 		/* assume equal stride for now */
-		src_offset = dst_offset = i * afbdev->afb.base.pitches[0] + (x * bpp);
-		memcpy_toio(bo->kmap.virtual + src_offset, afbdev->sysram + src_offset, (x2 - x + 1) * bpp);
+		src_offset = dst_offset =
+			i * afbdev->afb.base.pitches[0] + (x * bpp);
+		memcpy_toio(gbo->kmap.virtual + src_offset,
+			    afbdev->sysram + dst_offset,
+			    (x2 - x + 1) * bpp);
 
 	}
 	if (unmap)
-		ttm_bo_kunmap(&bo->kmap);
+		ttm_bo_kunmap(&gbo->kmap);
 
-	ast_bo_unreserve(bo);
+	drm_gem_vram_unreserve(gbo);
 }
 
 static void ast_fillrect(struct fb_info *info,
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 2854399856ba..61fc7b8ea470 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -593,7 +593,8 @@ int ast_gem_create(struct drm_device *dev,
 		   u32 size, bool iskernel,
 		   struct drm_gem_object **obj)
 {
-	struct ast_bo *astbo;
+	struct ast_private *ast = dev->dev_private;
+	struct drm_gem_vram_object *gbo;
 	int ret;
 
 	*obj = NULL;
@@ -602,13 +603,14 @@ int ast_gem_create(struct drm_device *dev,
 	if (size == 0)
 		return -EINVAL;
 
-	ret = ast_bo_create(dev, size, 0, 0, &astbo);
-	if (ret) {
+	gbo = drm_gem_vram_create(dev, &ast->ttm.bdev, size, 0, false);
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
 
@@ -616,66 +618,8 @@ int ast_dumb_create(struct drm_file *file,
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
-	ret = ast_gem_create(dev, args->size, false,
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
-static void ast_bo_unref(struct ast_bo **bo)
-{
-	if ((*bo) == NULL)
-		return;
-	ttm_bo_put(&((*bo)->bo));
-	*bo = NULL;
-}
-
-void ast_gem_free_object(struct drm_gem_object *obj)
-{
-	struct ast_bo *ast_bo = gem_to_ast_bo(obj);
-
-	ast_bo_unref(&ast_bo);
-}
-
-
-static inline u64 ast_bo_mmap_offset(struct ast_bo *bo)
-{
-	return drm_vma_node_offset_addr(&bo->bo.vma_node);
-}
-int
-ast_dumb_mmap_offset(struct drm_file *file,
-		     struct drm_device *dev,
-		     uint32_t handle,
-		     uint64_t *offset)
-{
-	struct drm_gem_object *obj;
-	struct ast_bo *bo;
-
-	obj = drm_gem_object_lookup(file, handle);
-	if (obj == NULL)
-		return -ENOENT;
-
-	bo = gem_to_ast_bo(obj);
-	*offset = ast_bo_mmap_offset(bo);
-
-	drm_gem_object_put_unlocked(obj);
-
-	return 0;
+	struct ast_private *ast = dev->dev_private;
 
+	return drm_gem_vram_fill_create_dumb(file, dev, &ast->ttm.bdev, 0,
+					     false, args);
 }
-
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 97fed0627d1c..b75ed3816642 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -529,50 +529,59 @@ static int ast_crtc_do_set_base(struct drm_crtc *crtc,
 	struct ast_private *ast = crtc->dev->dev_private;
 	struct drm_gem_object *obj;
 	struct ast_framebuffer *ast_fb;
-	struct ast_bo *bo;
+	struct drm_gem_vram_object *gbo;
 	int ret;
-	u64 gpu_addr;
+	s64 gpu_addr;
 
 	/* push the previous fb to system ram */
 	if (!atomic && fb) {
 		ast_fb = to_ast_framebuffer(fb);
 		obj = ast_fb->obj;
-		bo = gem_to_ast_bo(obj);
-		ret = ast_bo_reserve(bo, false);
+		gbo = drm_gem_vram_of_gem(obj);
+		ret = drm_gem_vram_reserve(gbo, false);
 		if (ret)
 			return ret;
-		ast_bo_push_sysram(bo);
-		ast_bo_unreserve(bo);
+		drm_gem_vram_push_to_system(gbo);
+		drm_gem_vram_unreserve(gbo);
 	}
 
 	ast_fb = to_ast_framebuffer(crtc->primary->fb);
 	obj = ast_fb->obj;
-	bo = gem_to_ast_bo(obj);
+	gbo = drm_gem_vram_of_gem(obj);
 
-	ret = ast_bo_reserve(bo, false);
+	ret = drm_gem_vram_reserve(gbo, false);
 	if (ret)
 		return ret;
 
-	ret = ast_bo_pin(bo, TTM_PL_FLAG_VRAM, &gpu_addr);
-	if (ret) {
-		ast_bo_unreserve(bo);
-		return ret;
+	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
+	if (ret)
+		goto err_drm_gem_vram_unreserve;
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (gpu_addr < 0) {
+		ret = (int)gpu_addr;
+		goto err_drm_gem_vram_unpin;
 	}
 
 	if (&ast->fbdev->afb == ast_fb) {
 		/* if pushing console in kmap it */
-		ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->kmap);
+		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
 		if (ret)
 			DRM_ERROR("failed to kmap fbcon\n");
 		else
 			ast_fbdev_set_base(ast, gpu_addr);
 	}
-	ast_bo_unreserve(bo);
+	drm_gem_vram_unreserve(gbo);
 
 	ast_set_offset_reg(crtc);
 	ast_set_start_address_crt1(crtc, (u32)gpu_addr);
 
 	return 0;
+
+err_drm_gem_vram_unpin:
+	drm_gem_vram_unpin(gbo);
+err_drm_gem_vram_unreserve:
+	drm_gem_vram_unreserve(gbo);
+	return ret;
 }
 
 static int ast_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
@@ -625,14 +634,13 @@ static void ast_crtc_disable(struct drm_crtc *crtc)
 	if (crtc->primary->fb) {
 		struct ast_framebuffer *ast_fb = to_ast_framebuffer(crtc->primary->fb);
 		struct drm_gem_object *obj = ast_fb->obj;
-		struct ast_bo *bo = gem_to_ast_bo(obj);
+		struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(obj);
 
-		ret = ast_bo_reserve(bo, false);
+		ret = drm_gem_vram_reserve(gbo, false);
 		if (ret)
 			return;
-
-		ast_bo_push_sysram(bo);
-		ast_bo_unreserve(bo);
+		drm_gem_vram_push_to_system(gbo);
+		drm_gem_vram_unreserve(gbo);
 	}
 	crtc->primary->fb = NULL;
 }
@@ -918,26 +926,32 @@ static int ast_cursor_init(struct drm_device *dev)
 	int size;
 	int ret;
 	struct drm_gem_object *obj;
-	struct ast_bo *bo;
-	uint64_t gpu_addr;
+	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;
 
 	size = (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE) * AST_DEFAULT_HWC_NUM;
 
 	ret = ast_gem_create(dev, size, true, &obj);
 	if (ret)
 		return ret;
-	bo = gem_to_ast_bo(obj);
-	ret = ast_bo_reserve(bo, false);
+	gbo = drm_gem_vram_of_gem(obj);
+	ret = drm_gem_vram_reserve(gbo, false);
 	if (unlikely(ret != 0))
 		goto fail;
 
-	ret = ast_bo_pin(bo, TTM_PL_FLAG_VRAM, &gpu_addr);
-	ast_bo_unreserve(bo);
+	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
+	drm_gem_vram_unreserve(gbo);
 	if (ret)
 		goto fail;
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (gpu_addr < 0) {
+		drm_gem_vram_unpin(gbo);
+		ret = (int)gpu_addr;
+		goto fail;
+	}
 
 	/* kmap the object */
-	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &ast->cache_kmap);
+	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &ast->cache_kmap);
 	if (ret)
 		goto fail;
 
@@ -1173,8 +1187,8 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 	struct ast_private *ast = crtc->dev->dev_private;
 	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
 	struct drm_gem_object *obj;
-	struct ast_bo *bo;
-	uint64_t gpu_addr;
+	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;
 	u32 csum;
 	int ret;
 	struct ttm_bo_kmap_obj uobj_map;
@@ -1193,13 +1207,13 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 		DRM_ERROR("Cannot find cursor object %x for crtc\n", handle);
 		return -ENOENT;
 	}
-	bo = gem_to_ast_bo(obj);
+	gbo = drm_gem_vram_of_gem(obj);
 
-	ret = ast_bo_reserve(bo, false);
+	ret = drm_gem_vram_reserve(gbo, false);
 	if (ret)
 		goto fail;
 
-	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &uobj_map);
+	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &uobj_map);
 
 	src = ttm_kmap_obj_virtual(&uobj_map, &src_isiomem);
 	dst = ttm_kmap_obj_virtual(&ast->cache_kmap, &dst_isiomem);
@@ -1216,7 +1230,7 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 
 	/* write checksum + signature */
 	ttm_bo_kunmap(&uobj_map);
-	ast_bo_unreserve(bo);
+	drm_gem_vram_unreserve(gbo);
 	{
 		u8 *dst = (u8 *)ast->cache_kmap.virtual + (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor + AST_HWC_SIZE;
 		writel(csum, dst);
diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_ttm.c
index 75d477b37854..794ebb755a5d 100644
--- a/drivers/gpu/drm/ast/ast_ttm.c
+++ b/drivers/gpu/drm/ast/ast_ttm.c
@@ -36,23 +36,6 @@ ast_bdev(struct ttm_bo_device *bd)
 	return container_of(bd, struct ast_private, ttm.bdev);
 }
 
-static void ast_bo_ttm_destroy(struct ttm_buffer_object *tbo)
-{
-	struct ast_bo *bo;
-
-	bo = container_of(tbo, struct ast_bo, bo);
-
-	drm_gem_object_release(&bo->gem);
-	kfree(bo);
-}
-
-static bool ast_ttm_bo_is_ast_bo(struct ttm_buffer_object *bo)
-{
-	if (bo->destroy == &ast_bo_ttm_destroy)
-		return true;
-	return false;
-}
-
 static int
 ast_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 		     struct ttm_mem_type_manager *man)
@@ -78,26 +61,6 @@ ast_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	return 0;
 }
 
-static void
-ast_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
-{
-	struct ast_bo *astbo = ast_bo(bo);
-
-	if (!ast_ttm_bo_is_ast_bo(bo))
-		return;
-
-	ast_ttm_placement(astbo, TTM_PL_FLAG_SYSTEM);
-	*pl = astbo->placement;
-}
-
-static int ast_bo_verify_access(struct ttm_buffer_object *bo, struct file *filp)
-{
-	struct ast_bo *astbo = ast_bo(bo);
-
-	return drm_vma_node_verify_access(&astbo->gem.vma_node,
-					  filp->private_data);
-}
-
 static int ast_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
 				  struct ttm_mem_reg *mem)
 {
@@ -162,9 +125,9 @@ struct ttm_bo_driver ast_bo_driver = {
 	.ttm_tt_create = ast_ttm_tt_create,
 	.init_mem_type = ast_bo_init_mem_type,
 	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = ast_bo_evict_flags,
+	.evict_flags = drm_gem_vram_bo_driver_evict_flags,
 	.move = NULL,
-	.verify_access = ast_bo_verify_access,
+	.verify_access = drm_gem_vram_bo_driver_verify_access,
 	.io_mem_reserve = &ast_ttm_io_mem_reserve,
 	.io_mem_free = &ast_ttm_io_mem_free,
 };
@@ -210,137 +173,6 @@ void ast_mm_fini(struct ast_private *ast)
 				pci_resource_len(dev->pdev, 0));
 }
 
-void ast_ttm_placement(struct ast_bo *bo, int domain)
-{
-	u32 c = 0;
-	unsigned i;
-
-	bo->placement.placement = bo->placements;
-	bo->placement.busy_placement = bo->placements;
-	if (domain & TTM_PL_FLAG_VRAM)
-		bo->placements[c++].flags = TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_VRAM;
-	if (domain & TTM_PL_FLAG_SYSTEM)
-		bo->placements[c++].flags = TTM_PL_FLAG_CACHED | TTM_PL_FLAG_SYSTEM;
-	if (!c)
-		bo->placements[c++].flags = TTM_PL_FLAG_CACHED | TTM_PL_FLAG_SYSTEM;
-	bo->placement.num_placement = c;
-	bo->placement.num_busy_placement = c;
-	for (i = 0; i < c; ++i) {
-		bo->placements[i].fpfn = 0;
-		bo->placements[i].lpfn = 0;
-	}
-}
-
-int ast_bo_create(struct drm_device *dev, int size, int align,
-		  uint32_t flags, struct ast_bo **pastbo)
-{
-	struct ast_private *ast = dev->dev_private;
-	struct ast_bo *astbo;
-	size_t acc_size;
-	int ret;
-
-	astbo = kzalloc(sizeof(struct ast_bo), GFP_KERNEL);
-	if (!astbo)
-		return -ENOMEM;
-
-	ret = drm_gem_object_init(dev, &astbo->gem, size);
-	if (ret)
-		goto error;
-
-	astbo->bo.bdev = &ast->ttm.bdev;
-
-	ast_ttm_placement(astbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
-
-	acc_size = ttm_bo_dma_acc_size(&ast->ttm.bdev, size,
-				       sizeof(struct ast_bo));
-
-	ret = ttm_bo_init(&ast->ttm.bdev, &astbo->bo, size,
-			  ttm_bo_type_device, &astbo->placement,
-			  align >> PAGE_SHIFT, false, acc_size,
-			  NULL, NULL, ast_bo_ttm_destroy);
-	if (ret)
-		goto error;
-
-	*pastbo = astbo;
-	return 0;
-error:
-	kfree(astbo);
-	return ret;
-}
-
-static inline u64 ast_bo_gpu_offset(struct ast_bo *bo)
-{
-	return bo->bo.offset;
-}
-
-int ast_bo_pin(struct ast_bo *bo, u32 pl_flag, u64 *gpu_addr)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-
-	if (bo->pin_count) {
-		bo->pin_count++;
-		if (gpu_addr)
-			*gpu_addr = ast_bo_gpu_offset(bo);
-	}
-
-	ast_ttm_placement(bo, pl_flag);
-	for (i = 0; i < bo->placement.num_placement; i++)
-		bo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
-	ret = ttm_bo_validate(&bo->bo, &bo->placement, &ctx);
-	if (ret)
-		return ret;
-
-	bo->pin_count = 1;
-	if (gpu_addr)
-		*gpu_addr = ast_bo_gpu_offset(bo);
-	return 0;
-}
-
-int ast_bo_unpin(struct ast_bo *bo)
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
-int ast_bo_push_sysram(struct ast_bo *bo)
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
-	ast_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
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
 int ast_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *file_priv = filp->private_data;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
