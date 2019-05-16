Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEA220CF3
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 18:28:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 698B5CAB;
	Thu, 16 May 2019 16:27:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 22404C7C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 16:27:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 05B5A896
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 16:27:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 5F98FAED4;
	Thu, 16 May 2019 16:27:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH 2/2] drm: Reserve/unreserve GEM VRAM BOs from within pin/unpin
	functions
Date: Thu, 16 May 2019 18:27:46 +0200
Message-Id: <20190516162746.11636-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516162746.11636-1-tzimmermann@suse.de>
References: <20190516162746.11636-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kernel test robot <lkp@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

The original bochs and vbox implementations of pin and unpin functions
automatically reserved BOs during validation. This functionality got lost
while converting the code to a generic implementation. This may result
in validating unlocked TTM BOs.

Adding the reserve and unreserve operations to GEM VRAM's pin and unpin
functions fixes the bochs and vbox drivers. Additionally the patch changes
the mgag200, ast and hibmc drivers to not reserve BOs by themselves.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: a3232987fdbf0bede92a9d7c7e2db99a5084d31b ("drm/bochs: Convert [...]")
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/ast/ast_mode.c                | 24 +--------
 drivers/gpu/drm/drm_gem_vram_helper.c         | 54 ++++++++++++++-----
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  6 ---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c | 17 +-----
 drivers/gpu/drm/mgag200/mgag200_mode.c        | 19 +------
 5 files changed, 45 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 3475591a22c3..9aca9135a5cc 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -539,24 +539,16 @@ static int ast_crtc_do_set_base(struct drm_crtc *crtc,
 		ast_fb = to_ast_framebuffer(fb);
 		obj = ast_fb->obj;
 		gbo = drm_gem_vram_of_gem(obj);
-		ret = drm_gem_vram_reserve(gbo, false);
-		if (ret)
-			return ret;
 		drm_gem_vram_push_to_system(gbo);
-		drm_gem_vram_unreserve(gbo);
 	}
 
 	ast_fb = to_ast_framebuffer(crtc->primary->fb);
 	obj = ast_fb->obj;
 	gbo = drm_gem_vram_of_gem(obj);
 
-	ret = drm_gem_vram_reserve(gbo, false);
-	if (ret)
-		return ret;
-
 	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
 	if (ret)
-		goto err_drm_gem_vram_unreserve;
+		return ret;
 	gpu_addr = drm_gem_vram_offset(gbo);
 	if (gpu_addr < 0) {
 		ret = (int)gpu_addr;
@@ -573,7 +565,6 @@ static int ast_crtc_do_set_base(struct drm_crtc *crtc,
 			ast_fbdev_set_base(ast, gpu_addr);
 		}
 	}
-	drm_gem_vram_unreserve(gbo);
 
 	ast_set_offset_reg(crtc);
 	ast_set_start_address_crt1(crtc, (u32)gpu_addr);
@@ -582,8 +573,6 @@ static int ast_crtc_do_set_base(struct drm_crtc *crtc,
 
 err_drm_gem_vram_unpin:
 	drm_gem_vram_unpin(gbo);
-err_drm_gem_vram_unreserve:
-	drm_gem_vram_unreserve(gbo);
 	return ret;
 }
 
@@ -630,8 +619,6 @@ static int ast_crtc_mode_set(struct drm_crtc *crtc,
 
 static void ast_crtc_disable(struct drm_crtc *crtc)
 {
-	int ret;
-
 	DRM_DEBUG_KMS("\n");
 	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
 	if (crtc->primary->fb) {
@@ -639,11 +626,7 @@ static void ast_crtc_disable(struct drm_crtc *crtc)
 		struct drm_gem_object *obj = ast_fb->obj;
 		struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(obj);
 
-		ret = drm_gem_vram_reserve(gbo, false);
-		if (ret)
-			return;
 		drm_gem_vram_push_to_system(gbo);
-		drm_gem_vram_unreserve(gbo);
 	}
 	crtc->primary->fb = NULL;
 }
@@ -939,12 +922,7 @@ static int ast_cursor_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 	gbo = drm_gem_vram_of_gem(obj);
-	ret = drm_gem_vram_reserve(gbo, false);
-	if (unlikely(ret != 0))
-		goto fail;
-
 	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
-	drm_gem_vram_unreserve(gbo);
 	if (ret)
 		goto fail;
 	gpu_addr = drm_gem_vram_offset(gbo);
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index a002c03eaf4c..bde8237e8021 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -235,10 +235,12 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
 	int i, ret;
 	struct ttm_operation_ctx ctx = { false, false };
 
-	if (gbo->pin_count) {
-		++gbo->pin_count;
-		return 0;
-	}
+	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
+	if (ret < 0)
+		return ret;
+
+	if (gbo->pin_count)
+		goto out;
 
 	drm_gem_vram_placement(gbo, pl_flag);
 	for (i = 0; i < gbo->placement.num_placement; ++i)
@@ -246,11 +248,17 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
 
 	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
 	if (ret < 0)
-		return ret;
+		goto err_ttm_bo_unreserve;
 
-	gbo->pin_count = 1;
+out:
+	++gbo->pin_count;
+	ttm_bo_unreserve(&gbo->bo);
 
 	return 0;
+
+err_ttm_bo_unreserve:
+	ttm_bo_unreserve(&gbo->bo);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_pin);
 
@@ -308,21 +316,32 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 	int i, ret;
 	struct ttm_operation_ctx ctx = { false, false };
 
+	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
+	if (ret < 0)
+		return ret;
+
 	if (WARN_ON_ONCE(!gbo->pin_count))
-		return 0;
+		goto out;
 
 	--gbo->pin_count;
 	if (gbo->pin_count)
-		return 0;
+		goto out;
 
 	for (i = 0; i < gbo->placement.num_placement ; ++i)
 		gbo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
 
 	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
 	if (ret < 0)
-		return ret;
+		goto err_ttm_bo_unreserve;
+
+out:
+	ttm_bo_unreserve(&gbo->bo);
 
 	return 0;
+
+err_ttm_bo_unreserve:
+	ttm_bo_unreserve(&gbo->bo);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
@@ -377,12 +396,16 @@ int drm_gem_vram_push_to_system(struct drm_gem_vram_object *gbo)
 	int i, ret;
 	struct ttm_operation_ctx ctx = { false, false };
 
+	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
+	if (ret < 0)
+		return ret;
+
 	if (WARN_ON_ONCE(!gbo->pin_count))
-		return 0;
+		goto out;
 
 	--gbo->pin_count;
 	if (gbo->pin_count)
-		return 0;
+		goto out;
 
 	if (gbo->kmap.virtual)
 		ttm_bo_kunmap(&gbo->kmap);
@@ -393,9 +416,16 @@ int drm_gem_vram_push_to_system(struct drm_gem_vram_object *gbo)
 
 	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
 	if (ret)
-		return ret;
+		goto err_ttm_bo_unreserve;
+
+out:
+	ttm_bo_unreserve(&gbo->bo);
 
 	return 0;
+
+err_ttm_bo_unreserve:
+	ttm_bo_unreserve(&gbo->bo);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_push_to_system);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index db0dfa57844e..fbdf495779e0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -107,14 +107,8 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 
 	hibmc_fb = to_hibmc_framebuffer(state->fb);
 	gbo = drm_gem_vram_of_gem(hibmc_fb->obj);
-	ret = drm_gem_vram_reserve(gbo, false);
-	if (ret) {
-		DRM_ERROR("failed to reserve BO: %d", ret);
-		return;
-	}
 
 	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
-	drm_gem_vram_unreserve(gbo);
 	if (ret) {
 		DRM_ERROR("failed to pin bo: %d", ret);
 		return;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
index 9d2025fa16f8..bd5fbb23973a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
@@ -63,7 +63,6 @@ static int hibmc_drm_fb_create(struct drm_fb_helper *helper,
 	struct drm_mode_fb_cmd2 mode_cmd;
 	struct drm_gem_object *gobj = NULL;
 	int ret = 0;
-	int ret1;
 	size_t size;
 	unsigned int bytes_per_pixel;
 	struct drm_gem_vram_object *gbo = NULL;
@@ -91,16 +90,10 @@ static int hibmc_drm_fb_create(struct drm_fb_helper *helper,
 
 	gbo = drm_gem_vram_of_gem(gobj);
 
-	ret = drm_gem_vram_reserve(gbo, false);
-	if (ret) {
-		DRM_ERROR("failed to reserve bo: %d\n", ret);
-		goto out_unref_gem;
-	}
-
 	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
 	if (ret) {
 		DRM_ERROR("failed to pin fbcon: %d\n", ret);
-		goto out_unreserve_ttm_bo;
+		goto out_unref_gem;
 	}
 
 	base = drm_gem_vram_kmap(gbo, true, NULL);
@@ -109,7 +102,6 @@ static int hibmc_drm_fb_create(struct drm_fb_helper *helper,
 		DRM_ERROR("failed to kmap fbcon: %d\n", ret);
 		goto out_unpin_bo;
 	}
-	drm_gem_vram_unreserve(gbo);
 
 	info = drm_fb_helper_alloc_fbi(helper);
 	if (IS_ERR(info)) {
@@ -141,16 +133,9 @@ static int hibmc_drm_fb_create(struct drm_fb_helper *helper,
 	return 0;
 
 out_release_fbi:
-	ret1 = drm_gem_vram_reserve(gbo, false);
-	if (ret1) {
-		DRM_ERROR("failed to rsv ttm_bo when release fbi: %d\n", ret1);
-		goto out_unref_gem;
-	}
 	drm_gem_vram_kunmap(gbo);
 out_unpin_bo:
 	drm_gem_vram_unpin(gbo);
-out_unreserve_ttm_bo:
-	drm_gem_vram_unreserve(gbo);
 out_unref_gem:
 	drm_gem_object_put_unlocked(gobj);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 3098bf5c1744..e79872c968bf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -877,24 +877,16 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 		mga_fb = to_mga_framebuffer(fb);
 		obj = mga_fb->obj;
 		gbo = drm_gem_vram_of_gem(obj);
-		ret = drm_gem_vram_reserve(gbo, false);
-		if (ret)
-			return ret;
 		drm_gem_vram_push_to_system(gbo);
-		drm_gem_vram_unreserve(gbo);
 	}
 
 	mga_fb = to_mga_framebuffer(crtc->primary->fb);
 	obj = mga_fb->obj;
 	gbo = drm_gem_vram_of_gem(obj);
 
-	ret = drm_gem_vram_reserve(gbo, false);
-	if (ret)
-		return ret;
-
 	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
 	if (ret)
-		goto err_drm_gem_vram_unreserve;
+		return ret;
 	gpu_addr = drm_gem_vram_offset(gbo);
 	if (gpu_addr < 0) {
 		ret = (int)gpu_addr;
@@ -910,16 +902,12 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 		}
 	}
 
-	drm_gem_vram_unreserve(gbo);
-
 	mga_set_start_address(crtc, (u32)gpu_addr);
 
 	return 0;
 
 err_drm_gem_vram_unpin:
 	drm_gem_vram_unpin(gbo);
-err_drm_gem_vram_unreserve:
-	drm_gem_vram_unreserve(gbo);
 	return ret;
 }
 
@@ -1434,7 +1422,6 @@ static void mga_crtc_destroy(struct drm_crtc *crtc)
 
 static void mga_crtc_disable(struct drm_crtc *crtc)
 {
-	int ret;
 	DRM_DEBUG_KMS("\n");
 	mga_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
 	if (crtc->primary->fb) {
@@ -1442,11 +1429,7 @@ static void mga_crtc_disable(struct drm_crtc *crtc)
 		struct drm_gem_object *obj = mga_fb->obj;
 		struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(obj);
 
-		ret = drm_gem_vram_reserve(gbo, false);
-		if (ret)
-			return;
 		drm_gem_vram_push_to_system(gbo);
-		drm_gem_vram_unreserve(gbo);
 	}
 	crtc->primary->fb = NULL;
 }
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
