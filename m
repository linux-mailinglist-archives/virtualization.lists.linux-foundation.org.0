Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C981465F
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 10:31:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 469DE456D;
	Mon,  6 May 2019 08:28:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3F64452A
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:27:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id CE4511DD99
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:27:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id ED669AEEC;
	Mon,  6 May 2019 08:27:01 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v4 16/19] drm/vboxvideo: Convert vboxvideo driver to |struct
	drm_gem_vram_object|
Date: Mon,  6 May 2019 10:26:46 +0200
Message-Id: <20190506082649.942-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506082649.942-1-tzimmermann@suse.de>
References: <20190506082649.942-1-tzimmermann@suse.de>
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

This patch replaces |struct vbox_bo| and its helpers with the generic
implementation of |struct drm_gem_vram_object|. The only change in
semantics is that &ttm_bo_driver.verify_access() now does the actual
verification.

v4:
	* select config option DRM_VRAM_HELPER
v3:
	* remove forward declaration of struct vbox_gem_object
v2:
	nothing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/Kconfig     |   1 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c  |   5 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h  |  60 +------
 drivers/gpu/drm/vboxvideo/vbox_fb.c   |  22 +--
 drivers/gpu/drm/vboxvideo/vbox_main.c |  70 +-------
 drivers/gpu/drm/vboxvideo/vbox_mode.c |  36 +++--
 drivers/gpu/drm/vboxvideo/vbox_ttm.c  | 223 +-------------------------
 7 files changed, 45 insertions(+), 372 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/Kconfig b/drivers/gpu/drm/vboxvideo/Kconfig
index 1f4182e2e980..f8f689c55e94 100644
--- a/drivers/gpu/drm/vboxvideo/Kconfig
+++ b/drivers/gpu/drm/vboxvideo/Kconfig
@@ -3,6 +3,7 @@ config DRM_VBOXVIDEO
 	depends on DRM && X86 && PCI
 	select DRM_KMS_HELPER
 	select DRM_TTM
+	select DRM_VRAM_HELPER
 	select GENERIC_ALLOCATOR
 	help
 	  This is a KMS driver for the virtual Graphics Card used in
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index fb6a0f0b8167..336a8e03e151 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -215,9 +215,10 @@ static struct drm_driver driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	.gem_free_object_unlocked = vbox_gem_free_object,
+	.gem_free_object_unlocked =
+		drm_gem_vram_driver_gem_free_object_unlocked,
 	.dumb_create = vbox_dumb_create,
-	.dumb_map_offset = vbox_dumb_mmap_offset,
+	.dumb_map_offset = drm_gem_vram_driver_dumb_mmap_offset,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_export = drm_gem_prime_export,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
index ece31f395540..12e47392b2f9 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
@@ -18,6 +18,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_vram_helper.h>
 
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -96,8 +97,6 @@ struct vbox_private {
 #undef CURSOR_PIXEL_COUNT
 #undef CURSOR_DATA_SIZE
 
-struct vbox_gem_object;
-
 struct vbox_connector {
 	struct drm_connector base;
 	char name[32];
@@ -170,73 +169,16 @@ int vboxfb_create(struct drm_fb_helper *helper,
 		  struct drm_fb_helper_surface_size *sizes);
 void vbox_fbdev_fini(struct vbox_private *vbox);
 
-struct vbox_bo {
-	struct ttm_buffer_object bo;
-	struct ttm_placement placement;
-	struct ttm_bo_kmap_obj kmap;
-	struct drm_gem_object gem;
-	struct ttm_place placements[3];
-	int pin_count;
-};
-
-#define gem_to_vbox_bo(gobj) container_of((gobj), struct vbox_bo, gem)
-
-static inline struct vbox_bo *vbox_bo(struct ttm_buffer_object *bo)
-{
-	return container_of(bo, struct vbox_bo, bo);
-}
-
-#define to_vbox_obj(x) container_of(x, struct vbox_gem_object, base)
-
-static inline u64 vbox_bo_gpu_offset(struct vbox_bo *bo)
-{
-	return bo->bo.offset;
-}
-
 int vbox_dumb_create(struct drm_file *file,
 		     struct drm_device *dev,
 		     struct drm_mode_create_dumb *args);
 
-void vbox_gem_free_object(struct drm_gem_object *obj);
-int vbox_dumb_mmap_offset(struct drm_file *file,
-			  struct drm_device *dev,
-			  u32 handle, u64 *offset);
-
 int vbox_mm_init(struct vbox_private *vbox);
 void vbox_mm_fini(struct vbox_private *vbox);
 
-int vbox_bo_create(struct vbox_private *vbox, int size, int align,
-		   u32 flags, struct vbox_bo **pvboxbo);
-
 int vbox_gem_create(struct vbox_private *vbox,
 		    u32 size, bool iskernel, struct drm_gem_object **obj);
-
-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag);
-int vbox_bo_unpin(struct vbox_bo *bo);
-
-static inline int vbox_bo_reserve(struct vbox_bo *bo, bool no_wait)
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
-static inline void vbox_bo_unreserve(struct vbox_bo *bo)
-{
-	ttm_bo_unreserve(&bo->bo);
-}
-
-void vbox_ttm_placement(struct vbox_bo *bo, int domain);
-int vbox_bo_push_sysram(struct vbox_bo *bo);
 int vbox_mmap(struct file *filp, struct vm_area_struct *vma);
-void *vbox_bo_kmap(struct vbox_bo *bo);
-void vbox_bo_kunmap(struct vbox_bo *bo);
 
 /* vbox_prime.c */
 int vbox_gem_prime_pin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/vboxvideo/vbox_fb.c b/drivers/gpu/drm/vboxvideo/vbox_fb.c
index b724fe7c0c30..8f74bcffc034 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_fb.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_fb.c
@@ -51,9 +51,9 @@ int vboxfb_create(struct drm_fb_helper *helper,
 	struct drm_framebuffer *fb;
 	struct fb_info *info;
 	struct drm_gem_object *gobj;
-	struct vbox_bo *bo;
+	struct drm_gem_vram_object *gbo;
 	int size, ret;
-	u64 gpu_addr;
+	s64 gpu_addr;
 	u32 pitch;
 
 	mode_cmd.width = sizes->surface_width;
@@ -75,9 +75,9 @@ int vboxfb_create(struct drm_fb_helper *helper,
 	if (ret)
 		return ret;
 
-	bo = gem_to_vbox_bo(gobj);
+	gbo = drm_gem_vram_of_gem(gobj);
 
-	ret = vbox_bo_pin(bo, TTM_PL_FLAG_VRAM);
+	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
 	if (ret)
 		return ret;
 
@@ -86,7 +86,7 @@ int vboxfb_create(struct drm_fb_helper *helper,
 		return PTR_ERR(info);
 
 	info->screen_size = size;
-	info->screen_base = (char __iomem *)vbox_bo_kmap(bo);
+	info->screen_base = (char __iomem *)drm_gem_vram_kmap(gbo, true, NULL);
 	if (IS_ERR(info->screen_base))
 		return PTR_ERR(info->screen_base);
 
@@ -104,7 +104,9 @@ int vboxfb_create(struct drm_fb_helper *helper,
 
 	drm_fb_helper_fill_info(info, helper, sizes);
 
-	gpu_addr = vbox_bo_gpu_offset(bo);
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (gpu_addr < 0)
+		return (int)gpu_addr;
 	info->fix.smem_start = info->apertures->ranges[0].base + gpu_addr;
 	info->fix.smem_len = vbox->available_vram_size - gpu_addr;
 
@@ -132,12 +134,10 @@ void vbox_fbdev_fini(struct vbox_private *vbox)
 	drm_fb_helper_unregister_fbi(&vbox->fb_helper);
 
 	if (afb->obj) {
-		struct vbox_bo *bo = gem_to_vbox_bo(afb->obj);
+		struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(afb->obj);
 
-		vbox_bo_kunmap(bo);
-
-		if (bo->pin_count)
-			vbox_bo_unpin(bo);
+		drm_gem_vram_kunmap(gbo);
+		drm_gem_vram_unpin(gbo);
 
 		drm_gem_object_put_unlocked(afb->obj);
 		afb->obj = NULL;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index f4d02de5518a..525e9fd63f4d 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -274,7 +274,7 @@ void vbox_hw_fini(struct vbox_private *vbox)
 int vbox_gem_create(struct vbox_private *vbox,
 		    u32 size, bool iskernel, struct drm_gem_object **obj)
 {
-	struct vbox_bo *vboxbo;
+	struct drm_gem_vram_object *gbo;
 	int ret;
 
 	*obj = NULL;
@@ -283,14 +283,15 @@ int vbox_gem_create(struct vbox_private *vbox,
 	if (size == 0)
 		return -EINVAL;
 
-	ret = vbox_bo_create(vbox, size, 0, 0, &vboxbo);
-	if (ret) {
+	gbo = drm_gem_vram_create(&vbox->ddev, &vbox->ttm.bdev, size, 0, false);
+	if (IS_ERR(gbo)) {
+		ret = PTR_ERR(gbo);
 		if (ret != -ERESTARTSYS)
 			DRM_ERROR("failed to allocate GEM object\n");
 		return ret;
 	}
 
-	*obj = &vboxbo->gem;
+	*obj = &gbo->gem;
 
 	return 0;
 }
@@ -298,64 +299,9 @@ int vbox_gem_create(struct vbox_private *vbox,
 int vbox_dumb_create(struct drm_file *file,
 		     struct drm_device *dev, struct drm_mode_create_dumb *args)
 {
-	struct vbox_private *vbox =
-		container_of(dev, struct vbox_private, ddev);
-	struct drm_gem_object *gobj;
-	u32 handle;
-	int ret;
-
-	args->pitch = args->width * ((args->bpp + 7) / 8);
-	args->size = args->pitch * args->height;
-
-	ret = vbox_gem_create(vbox, args->size, false, &gobj);
-	if (ret)
-		return ret;
-
-	ret = drm_gem_handle_create(file, gobj, &handle);
-	drm_gem_object_put_unlocked(gobj);
-	if (ret)
-		return ret;
+	struct vbox_private *vbox = dev->dev_private;
 
-	args->handle = handle;
-
-	return 0;
-}
-
-void vbox_gem_free_object(struct drm_gem_object *obj)
-{
-	struct vbox_bo *vbox_bo = gem_to_vbox_bo(obj);
+	return drm_gem_vram_fill_create_dumb(file, dev, &vbox->ttm.bdev, 0,
+					    false, args);
 
-	ttm_bo_put(&vbox_bo->bo);
-}
-
-static inline u64 vbox_bo_mmap_offset(struct vbox_bo *bo)
-{
-	return drm_vma_node_offset_addr(&bo->bo.vma_node);
-}
-
-int
-vbox_dumb_mmap_offset(struct drm_file *file,
-		      struct drm_device *dev,
-		      u32 handle, u64 *offset)
-{
-	struct drm_gem_object *obj;
-	int ret;
-	struct vbox_bo *bo;
-
-	mutex_lock(&dev->struct_mutex);
-	obj = drm_gem_object_lookup(file, handle);
-	if (!obj) {
-		ret = -ENOENT;
-		goto out_unlock;
-	}
-
-	bo = gem_to_vbox_bo(obj);
-	*offset = vbox_bo_mmap_offset(bo);
-
-	drm_gem_object_put(obj);
-	ret = 0;
-
-out_unlock:
-	mutex_unlock(&dev->struct_mutex);
-	return ret;
 }
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 620a6e38f71f..9432c3ceec7c 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -173,7 +173,8 @@ static void vbox_crtc_set_base_and_mode(struct drm_crtc *crtc,
 					struct drm_framebuffer *fb,
 					int x, int y)
 {
-	struct vbox_bo *bo = gem_to_vbox_bo(to_vbox_framebuffer(fb)->obj);
+	struct drm_gem_vram_object *gbo =
+		drm_gem_vram_of_gem(to_vbox_framebuffer(fb)->obj);
 	struct vbox_private *vbox = crtc->dev->dev_private;
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
 	bool needs_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
@@ -187,7 +188,7 @@ static void vbox_crtc_set_base_and_mode(struct drm_crtc *crtc,
 
 	vbox_crtc->x = x;
 	vbox_crtc->y = y;
-	vbox_crtc->fb_offset = vbox_bo_gpu_offset(bo);
+	vbox_crtc->fb_offset = drm_gem_vram_offset(gbo);
 
 	/* vbox_do_modeset() checks vbox->single_framebuffer so update it now */
 	if (needs_modeset && vbox_set_up_input_mapping(vbox)) {
@@ -303,14 +304,14 @@ static void vbox_primary_atomic_disable(struct drm_plane *plane,
 static int vbox_primary_prepare_fb(struct drm_plane *plane,
 				   struct drm_plane_state *new_state)
 {
-	struct vbox_bo *bo;
+	struct drm_gem_vram_object *gbo;
 	int ret;
 
 	if (!new_state->fb)
 		return 0;
 
-	bo = gem_to_vbox_bo(to_vbox_framebuffer(new_state->fb)->obj);
-	ret = vbox_bo_pin(bo, TTM_PL_FLAG_VRAM);
+	gbo = drm_gem_vram_of_gem(to_vbox_framebuffer(new_state->fb)->obj);
+	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
 	if (ret)
 		DRM_WARN("Error %d pinning new fb, out of video mem?\n", ret);
 
@@ -320,13 +321,13 @@ static int vbox_primary_prepare_fb(struct drm_plane *plane,
 static void vbox_primary_cleanup_fb(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
-	struct vbox_bo *bo;
+	struct drm_gem_vram_object *gbo;
 
 	if (!old_state->fb)
 		return;
 
-	bo = gem_to_vbox_bo(to_vbox_framebuffer(old_state->fb)->obj);
-	vbox_bo_unpin(bo);
+	gbo = drm_gem_vram_of_gem(to_vbox_framebuffer(old_state->fb)->obj);
+	drm_gem_vram_unpin(gbo);
 }
 
 static int vbox_cursor_atomic_check(struct drm_plane *plane,
@@ -386,7 +387,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 		container_of(plane->dev, struct vbox_private, ddev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct vbox_bo *bo = gem_to_vbox_bo(to_vbox_framebuffer(fb)->obj);
+	struct drm_gem_vram_object *gbo =
+		drm_gem_vram_of_gem(to_vbox_framebuffer(fb)->obj);
 	u32 width = plane->state->crtc_w;
 	u32 height = plane->state->crtc_h;
 	size_t data_size, mask_size;
@@ -405,7 +407,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	vbox_crtc->cursor_enabled = true;
 
 	/* pinning is done in prepare/cleanup framebuffer */
-	src = vbox_bo_kmap(bo);
+	src = drm_gem_vram_kmap(gbo, true, NULL);
 	if (IS_ERR(src)) {
 		mutex_unlock(&vbox->hw_mutex);
 		DRM_WARN("Could not kmap cursor bo, skipping update\n");
@@ -421,7 +423,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	data_size = width * height * 4 + mask_size;
 
 	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
-	vbox_bo_kunmap(bo);
+	drm_gem_vram_kunmap(gbo);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
@@ -461,25 +463,25 @@ static void vbox_cursor_atomic_disable(struct drm_plane *plane,
 static int vbox_cursor_prepare_fb(struct drm_plane *plane,
 				  struct drm_plane_state *new_state)
 {
-	struct vbox_bo *bo;
+	struct drm_gem_vram_object *gbo;
 
 	if (!new_state->fb)
 		return 0;
 
-	bo = gem_to_vbox_bo(to_vbox_framebuffer(new_state->fb)->obj);
-	return vbox_bo_pin(bo, TTM_PL_FLAG_SYSTEM);
+	gbo = drm_gem_vram_of_gem(to_vbox_framebuffer(new_state->fb)->obj);
+	return drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_SYSTEM);
 }
 
 static void vbox_cursor_cleanup_fb(struct drm_plane *plane,
 				   struct drm_plane_state *old_state)
 {
-	struct vbox_bo *bo;
+	struct drm_gem_vram_object *gbo;
 
 	if (!plane->state->fb)
 		return;
 
-	bo = gem_to_vbox_bo(to_vbox_framebuffer(plane->state->fb)->obj);
-	vbox_bo_unpin(bo);
+	gbo = drm_gem_vram_of_gem(to_vbox_framebuffer(plane->state->fb)->obj);
+	drm_gem_vram_unpin(gbo);
 }
 
 static const u32 vbox_cursor_plane_formats[] = {
diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
index 9d78438c2877..0989d656eed6 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
@@ -16,24 +16,6 @@ static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *bd)
 	return container_of(bd, struct vbox_private, ttm.bdev);
 }
 
-static void vbox_bo_ttm_destroy(struct ttm_buffer_object *tbo)
-{
-	struct vbox_bo *bo;
-
-	bo = container_of(tbo, struct vbox_bo, bo);
-
-	drm_gem_object_release(&bo->gem);
-	kfree(bo);
-}
-
-static bool vbox_ttm_bo_is_vbox_bo(struct ttm_buffer_object *bo)
-{
-	if (bo->destroy == &vbox_bo_ttm_destroy)
-		return true;
-
-	return false;
-}
-
 static int
 vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
 		      struct ttm_mem_type_manager *man)
@@ -58,24 +40,6 @@ vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
 	return 0;
 }
 
-static void
-vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
-{
-	struct vbox_bo *vboxbo = vbox_bo(bo);
-
-	if (!vbox_ttm_bo_is_vbox_bo(bo))
-		return;
-
-	vbox_ttm_placement(vboxbo, TTM_PL_FLAG_SYSTEM);
-	*pl = vboxbo->placement;
-}
-
-static int vbox_bo_verify_access(struct ttm_buffer_object *bo,
-				 struct file *filp)
-{
-	return 0;
-}
-
 static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
 				   struct ttm_mem_reg *mem)
 {
@@ -141,8 +105,8 @@ static struct ttm_bo_driver vbox_bo_driver = {
 	.ttm_tt_create = vbox_ttm_tt_create,
 	.init_mem_type = vbox_bo_init_mem_type,
 	.eviction_valuable = ttm_bo_eviction_valuable,
-	.evict_flags = vbox_bo_evict_flags,
-	.verify_access = vbox_bo_verify_access,
+	.evict_flags = drm_gem_vram_bo_driver_evict_flags,
+	.verify_access = drm_gem_vram_bo_driver_verify_access,
 	.io_mem_reserve = &vbox_ttm_io_mem_reserve,
 	.io_mem_free = &vbox_ttm_io_mem_free,
 };
@@ -196,165 +160,6 @@ void vbox_mm_fini(struct vbox_private *vbox)
 	ttm_bo_device_release(&vbox->ttm.bdev);
 }
 
-void vbox_ttm_placement(struct vbox_bo *bo, int domain)
-{
-	unsigned int i;
-	u32 c = 0;
-
-	bo->placement.placement = bo->placements;
-	bo->placement.busy_placement = bo->placements;
-
-	if (domain & TTM_PL_FLAG_VRAM)
-		bo->placements[c++].flags =
-		    TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_VRAM;
-	if (domain & TTM_PL_FLAG_SYSTEM)
-		bo->placements[c++].flags =
-		    TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
-	if (!c)
-		bo->placements[c++].flags =
-		    TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
-
-	bo->placement.num_placement = c;
-	bo->placement.num_busy_placement = c;
-
-	for (i = 0; i < c; ++i) {
-		bo->placements[i].fpfn = 0;
-		bo->placements[i].lpfn = 0;
-	}
-}
-
-int vbox_bo_create(struct vbox_private *vbox, int size, int align,
-		   u32 flags, struct vbox_bo **pvboxbo)
-{
-	struct vbox_bo *vboxbo;
-	size_t acc_size;
-	int ret;
-
-	vboxbo = kzalloc(sizeof(*vboxbo), GFP_KERNEL);
-	if (!vboxbo)
-		return -ENOMEM;
-
-	ret = drm_gem_object_init(&vbox->ddev, &vboxbo->gem, size);
-	if (ret)
-		goto err_free_vboxbo;
-
-	vboxbo->bo.bdev = &vbox->ttm.bdev;
-
-	vbox_ttm_placement(vboxbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
-
-	acc_size = ttm_bo_dma_acc_size(&vbox->ttm.bdev, size,
-				       sizeof(struct vbox_bo));
-
-	ret = ttm_bo_init(&vbox->ttm.bdev, &vboxbo->bo, size,
-			  ttm_bo_type_device, &vboxbo->placement,
-			  align >> PAGE_SHIFT, false, acc_size,
-			  NULL, NULL, vbox_bo_ttm_destroy);
-	if (ret)
-		goto err_free_vboxbo;
-
-	*pvboxbo = vboxbo;
-
-	return 0;
-
-err_free_vboxbo:
-	kfree(vboxbo);
-	return ret;
-}
-
-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-
-	if (bo->pin_count) {
-		bo->pin_count++;
-		return 0;
-	}
-
-	ret = vbox_bo_reserve(bo, false);
-	if (ret)
-		return ret;
-
-	vbox_ttm_placement(bo, pl_flag);
-
-	for (i = 0; i < bo->placement.num_placement; i++)
-		bo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
-
-	ret = ttm_bo_validate(&bo->bo, &bo->placement, &ctx);
-	if (ret == 0)
-		bo->pin_count = 1;
-
-	vbox_bo_unreserve(bo);
-
-	return ret;
-}
-
-int vbox_bo_unpin(struct vbox_bo *bo)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-
-	if (!bo->pin_count) {
-		DRM_ERROR("unpin bad %p\n", bo);
-		return 0;
-	}
-	bo->pin_count--;
-	if (bo->pin_count)
-		return 0;
-
-	ret = vbox_bo_reserve(bo, false);
-	if (ret) {
-		DRM_ERROR("Error %d reserving bo, leaving it pinned\n", ret);
-		return ret;
-	}
-
-	for (i = 0; i < bo->placement.num_placement; i++)
-		bo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
-
-	ret = ttm_bo_validate(&bo->bo, &bo->placement, &ctx);
-
-	vbox_bo_unreserve(bo);
-
-	return ret;
-}
-
-/*
- * Move a vbox-owned buffer object to system memory if no one else has it
- * pinned.  The caller must have pinned it previously, and this call will
- * release the caller's pin.
- */
-int vbox_bo_push_sysram(struct vbox_bo *bo)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-
-	if (!bo->pin_count) {
-		DRM_ERROR("unpin bad %p\n", bo);
-		return 0;
-	}
-	bo->pin_count--;
-	if (bo->pin_count)
-		return 0;
-
-	if (bo->kmap.virtual) {
-		ttm_bo_kunmap(&bo->kmap);
-		bo->kmap.virtual = NULL;
-	}
-
-	vbox_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
-
-	for (i = 0; i < bo->placement.num_placement; i++)
-		bo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
-
-	ret = ttm_bo_validate(&bo->bo, &bo->placement, &ctx);
-	if (ret) {
-		DRM_ERROR("pushing to VRAM failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 int vbox_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *file_priv = filp->private_data;
@@ -362,27 +167,3 @@ int vbox_mmap(struct file *filp, struct vm_area_struct *vma)
 
 	return ttm_bo_mmap(filp, vma, &vbox->ttm.bdev);
 }
-
-void *vbox_bo_kmap(struct vbox_bo *bo)
-{
-	int ret;
-
-	if (bo->kmap.virtual)
-		return bo->kmap.virtual;
-
-	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->kmap);
-	if (ret) {
-		DRM_ERROR("Error kmapping bo: %d\n", ret);
-		return NULL;
-	}
-
-	return bo->kmap.virtual;
-}
-
-void vbox_bo_kunmap(struct vbox_bo *bo)
-{
-	if (bo->kmap.virtual) {
-		ttm_bo_kunmap(&bo->kmap);
-		bo->kmap.virtual = NULL;
-	}
-}
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
