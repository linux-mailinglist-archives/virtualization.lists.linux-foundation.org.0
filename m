Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA47173CE
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 10:29:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4E7D213AF;
	Wed,  8 May 2019 08:26:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 298E3139A
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 30420831
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 9AD2EAEF6;
	Wed,  8 May 2019 08:26:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v5 11/20] drm/ast: Replace mapping code with
	drm_gem_vram_{kmap/kunmap}()
Date: Wed,  8 May 2019 10:26:21 +0200
Message-Id: <20190508082630.15116-12-tzimmermann@suse.de>
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

The AST driver establishes several memory mappings for frame buffers
and cursors. This patch converts the driver to use the equivalent
drm_gem_vram_kmap() functions. It removes the dependencies on TTM
and cleans up the code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 -
 drivers/gpu/drm/ast/ast_fb.c   | 23 +++++++++------
 drivers/gpu/drm/ast/ast_mode.c | 54 ++++++++++++++++++++++++----------
 3 files changed, 53 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 32096a191aaf..b6cac9511796 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -256,7 +256,6 @@ struct ast_fbdev {
 	struct ast_framebuffer afb;
 	void *sysram;
 	int size;
-	struct ttm_bo_kmap_obj mapping;
 	int x1, y1, x2, y2; /* dirty rect */
 	spinlock_t dirty_lock;
 };
diff --git a/drivers/gpu/drm/ast/ast_fb.c b/drivers/gpu/drm/ast/ast_fb.c
index 778423fcf352..505e602855c0 100644
--- a/drivers/gpu/drm/ast/ast_fb.c
+++ b/drivers/gpu/drm/ast/ast_fb.c
@@ -53,6 +53,7 @@ static void ast_dirty_update(struct ast_fbdev *afbdev,
 	int src_offset, dst_offset;
 	int bpp = afbdev->afb.base.format->cpp[0];
 	int ret = -EBUSY;
+	u8 *dst;
 	bool unmap = false;
 	bool store_for_later = false;
 	int x2, y2;
@@ -101,27 +102,31 @@ static void ast_dirty_update(struct ast_fbdev *afbdev,
 	afbdev->x2 = afbdev->y2 = 0;
 	spin_unlock_irqrestore(&afbdev->dirty_lock, flags);
 
-	if (!gbo->kmap.virtual) {
-		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
-		if (ret) {
+	dst = drm_gem_vram_kmap(gbo, false, NULL);
+	if (IS_ERR(dst)) {
+		DRM_ERROR("failed to kmap fb updates\n");
+		goto out;
+	} else if (!dst) {
+		dst = drm_gem_vram_kmap(gbo, true, NULL);
+		if (IS_ERR(dst)) {
 			DRM_ERROR("failed to kmap fb updates\n");
-			drm_gem_vram_unreserve(gbo);
-			return;
+			goto out;
 		}
 		unmap = true;
 	}
+
 	for (i = y; i <= y2; i++) {
 		/* assume equal stride for now */
 		src_offset = dst_offset =
 			i * afbdev->afb.base.pitches[0] + (x * bpp);
-		memcpy_toio(gbo->kmap.virtual + src_offset,
-			    afbdev->sysram + dst_offset,
+		memcpy_toio(dst + dst_offset, afbdev->sysram + src_offset,
 			    (x2 - x + 1) * bpp);
-
 	}
+
 	if (unmap)
-		ttm_bo_kunmap(&gbo->kmap);
+		drm_gem_vram_kunmap(gbo);
 
+out:
 	drm_gem_vram_unreserve(gbo);
 }
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index b75ed3816642..3475591a22c3 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -532,6 +532,7 @@ static int ast_crtc_do_set_base(struct drm_crtc *crtc,
 	struct drm_gem_vram_object *gbo;
 	int ret;
 	s64 gpu_addr;
+	void *base;
 
 	/* push the previous fb to system ram */
 	if (!atomic && fb) {
@@ -564,11 +565,13 @@ static int ast_crtc_do_set_base(struct drm_crtc *crtc,
 
 	if (&ast->fbdev->afb == ast_fb) {
 		/* if pushing console in kmap it */
-		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
-		if (ret)
+		base = drm_gem_vram_kmap(gbo, true, NULL);
+		if (IS_ERR(base)) {
+			ret = PTR_ERR(base);
 			DRM_ERROR("failed to kmap fbcon\n");
-		else
+		} else {
 			ast_fbdev_set_base(ast, gpu_addr);
+		}
 	}
 	drm_gem_vram_unreserve(gbo);
 
@@ -928,6 +931,7 @@ static int ast_cursor_init(struct drm_device *dev)
 	struct drm_gem_object *obj;
 	struct drm_gem_vram_object *gbo;
 	s64 gpu_addr;
+	void *base;
 
 	size = (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE) * AST_DEFAULT_HWC_NUM;
 
@@ -951,9 +955,11 @@ static int ast_cursor_init(struct drm_device *dev)
 	}
 
 	/* kmap the object */
-	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &ast->cache_kmap);
-	if (ret)
+	base = drm_gem_vram_kmap_at(gbo, true, NULL, &ast->cache_kmap);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
 		goto fail;
+	}
 
 	ast->cursor_cache = obj;
 	ast->cursor_cache_gpu_addr = gpu_addr;
@@ -966,7 +972,9 @@ static int ast_cursor_init(struct drm_device *dev)
 static void ast_cursor_fini(struct drm_device *dev)
 {
 	struct ast_private *ast = dev->dev_private;
-	ttm_bo_kunmap(&ast->cache_kmap);
+	struct drm_gem_vram_object *gbo =
+		drm_gem_vram_of_gem(ast->cursor_cache);
+	drm_gem_vram_kunmap_at(gbo, &ast->cache_kmap);
 	drm_gem_object_put_unlocked(ast->cursor_cache);
 }
 
@@ -1213,13 +1221,21 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 	if (ret)
 		goto fail;
 
-	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &uobj_map);
-
-	src = ttm_kmap_obj_virtual(&uobj_map, &src_isiomem);
-	dst = ttm_kmap_obj_virtual(&ast->cache_kmap, &dst_isiomem);
-
+	memset(&uobj_map, 0, sizeof(uobj_map));
+	src = drm_gem_vram_kmap_at(gbo, true, &src_isiomem, &uobj_map);
+	if (IS_ERR(src)) {
+		ret = PTR_ERR(src);
+		goto fail_unreserve;
+	}
 	if (src_isiomem == true)
 		DRM_ERROR("src cursor bo should be in main memory\n");
+
+	dst = drm_gem_vram_kmap_at(drm_gem_vram_of_gem(ast->cursor_cache),
+				   false, &dst_isiomem, &ast->cache_kmap);
+	if (IS_ERR(dst)) {
+		ret = PTR_ERR(dst);
+		goto fail_unreserve;
+	}
 	if (dst_isiomem == false)
 		DRM_ERROR("dst bo should be in VRAM\n");
 
@@ -1228,11 +1244,14 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 	/* do data transfer to cursor cache */
 	csum = copy_cursor_image(src, dst, width, height);
 
-	/* write checksum + signature */
-	ttm_bo_kunmap(&uobj_map);
+	drm_gem_vram_kunmap_at(gbo, &uobj_map);
 	drm_gem_vram_unreserve(gbo);
+
+	/* write checksum + signature */
 	{
-		u8 *dst = (u8 *)ast->cache_kmap.virtual + (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor + AST_HWC_SIZE;
+		u8 *dst = drm_gem_vram_kmap_at(drm_gem_vram_of_gem(ast->cursor_cache),
+					       false, NULL, &ast->cache_kmap);
+		dst += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor + AST_HWC_SIZE;
 		writel(csum, dst);
 		writel(width, dst + AST_HWC_SIGNATURE_SizeX);
 		writel(height, dst + AST_HWC_SIGNATURE_SizeY);
@@ -1258,6 +1277,9 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 
 	drm_gem_object_put_unlocked(obj);
 	return 0;
+
+fail_unreserve:
+	drm_gem_vram_unreserve(gbo);
 fail:
 	drm_gem_object_put_unlocked(obj);
 	return ret;
@@ -1271,7 +1293,9 @@ static int ast_cursor_move(struct drm_crtc *crtc,
 	int x_offset, y_offset;
 	u8 *sig;
 
-	sig = (u8 *)ast->cache_kmap.virtual + (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor + AST_HWC_SIZE;
+	sig = drm_gem_vram_kmap_at(drm_gem_vram_of_gem(ast->cursor_cache),
+				   false, NULL, &ast->cache_kmap);
+	sig += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor + AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
