Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FFA1465E
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 10:31:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D893125FF;
	Mon,  6 May 2019 08:28:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 61544452A
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:27:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 9F6FE1DE27
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:27:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id B6469AEFF;
	Mon,  6 May 2019 08:27:02 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v4 15/19] drm/mgag200: Replace mapping code with
	drm_gem_vram_{kmap/kunmap}()
Date: Mon,  6 May 2019 10:26:45 +0200
Message-Id: <20190506082649.942-16-tzimmermann@suse.de>
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

The mgag200 driver establishes several memory mappings for frame buffers
and cursors. This patch converts the driver to use the equivalent
drm_gem_vram_kmap() functions. It removes the dependencies on TTM
and cleans up the code.

v4:
	* cleanups from checkpatch.pl

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 35 +++++++++++-------------
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  1 -
 drivers/gpu/drm/mgag200/mgag200_fb.c     | 24 ++++++++++------
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  9 ++++--
 4 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index cca3922f9f67..6c1a9d724d85 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -43,6 +43,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	struct drm_gem_object *obj;
 	struct drm_gem_vram_object *gbo = NULL;
 	int ret = 0;
+	u8 *src, *dst;
 	unsigned int i, row, col;
 	uint32_t colour_set[16];
 	uint32_t *next_space = &colour_set[0];
@@ -126,18 +127,17 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 		dev_err(&dev->pdev->dev, "failed to reserve user bo\n");
 		goto out1;
 	}
-	if (!gbo->kmap.virtual) {
-		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
-		if (ret) {
-			dev_err(&dev->pdev->dev, "failed to kmap user buffer updates\n");
-			goto out2;
-		}
+	src = drm_gem_vram_kmap(gbo, true, NULL);
+	if (IS_ERR(src)) {
+		ret = PTR_ERR(src);
+		dev_err(&dev->pdev->dev, "failed to kmap user buffer updates\n");
+		goto out2;
 	}
 
 	memset(&colour_set[0], 0, sizeof(uint32_t)*16);
 	/* width*height*4 = 16384 */
 	for (i = 0; i < 16384; i += 4) {
-		this_colour = ioread32(gbo->kmap.virtual + i);
+		this_colour = ioread32(src + i);
 		/* No transparency */
 		if (this_colour>>24 != 0xff &&
 			this_colour>>24 != 0x0) {
@@ -189,21 +189,18 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	}
 
 	/* Map up-coming buffer to write colour indices */
-	if (!pixels_prev->kmap.virtual) {
-		ret = ttm_bo_kmap(&pixels_prev->bo, 0,
-				  pixels_prev->bo.num_pages,
-				  &pixels_prev->kmap);
-		if (ret) {
-			dev_err(&dev->pdev->dev, "failed to kmap cursor updates\n");
-			goto out3;
-		}
+	dst = drm_gem_vram_kmap(pixels_prev, true, NULL);
+	if (IS_ERR(dst)) {
+		ret = PTR_ERR(dst);
+		dev_err(&dev->pdev->dev, "failed to kmap cursor updates\n");
+		goto out3;
 	}
 
 	/* now write colour indices into hardware cursor buffer */
 	for (row = 0; row < 64; row++) {
 		memset(&this_row[0], 0, 48);
 		for (col = 0; col < 64; col++) {
-			this_colour = ioread32(gbo->kmap.virtual + 4*(col + 64*row));
+			this_colour = ioread32(src + 4*(col + 64*row));
 			/* write transparent pixels */
 			if (this_colour>>24 == 0x0) {
 				this_row[47 - col/8] |= 0x80>>(col%8);
@@ -221,7 +218,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 				}
 			}
 		}
-		memcpy_toio(pixels_prev->kmap.virtual + row*48, &this_row[0], 48);
+		memcpy_toio(dst + row*48, &this_row[0], 48);
 	}
 
 	/* Program gpu address of cursor buffer */
@@ -247,9 +244,9 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	}
 	ret = 0;
 
-	ttm_bo_kunmap(&pixels_prev->kmap);
+	drm_gem_vram_kunmap(pixels_prev);
  out3:
-	ttm_bo_kunmap(&gbo->kmap);
+	drm_gem_vram_kunmap(gbo);
  out2:
 	drm_gem_vram_unreserve(gbo);
  out1:
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 16ce6b338dce..6180acbca7ca 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -115,7 +115,6 @@ struct mga_fbdev {
 	struct mga_framebuffer mfb;
 	void *sysram;
 	int size;
-	struct ttm_bo_kmap_obj mapping;
 	int x1, y1, x2, y2; /* dirty rect */
 	spinlock_t dirty_lock;
 };
diff --git a/drivers/gpu/drm/mgag200/mgag200_fb.c b/drivers/gpu/drm/mgag200/mgag200_fb.c
index 1bcf0d65868d..87217bdce9f8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_fb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_fb.c
@@ -27,6 +27,7 @@ static void mga_dirty_update(struct mga_fbdev *mfbdev,
 	int src_offset, dst_offset;
 	int bpp = mfbdev->mfb.base.format->cpp[0];
 	int ret = -EBUSY;
+	u8 *dst;
 	bool unmap = false;
 	bool store_for_later = false;
 	int x2, y2;
@@ -75,26 +76,31 @@ static void mga_dirty_update(struct mga_fbdev *mfbdev,
 	mfbdev->x2 = mfbdev->y2 = 0;
 	spin_unlock_irqrestore(&mfbdev->dirty_lock, flags);
 
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
 			i * mfbdev->mfb.base.pitches[0] + (x * bpp);
-		memcpy_toio(gbo->kmap.virtual + src_offset,
-			    mfbdev->sysram + dst_offset, (x2 - x + 1) * bpp);
-
+		memcpy_toio(dst + dst_offset, mfbdev->sysram + src_offset,
+			    (x2 - x + 1) * bpp);
 	}
+
 	if (unmap)
-		ttm_bo_kunmap(&gbo->kmap);
+		drm_gem_vram_kunmap(gbo);
 
+out:
 	drm_gem_vram_unreserve(gbo);
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 26baae5eeb9b..3098bf5c1744 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -870,6 +870,7 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 	struct drm_gem_vram_object *gbo;
 	int ret;
 	s64 gpu_addr;
+	void *base;
 
 	/* push the previous fb to system ram */
 	if (!atomic && fb) {
@@ -902,11 +903,13 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
 
 	if (&mdev->mfbdev->mfb == mga_fb) {
 		/* if pushing console in kmap it */
-		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
-		if (ret)
+		base = drm_gem_vram_kmap(gbo, true, NULL);
+		if (IS_ERR(base)) {
+			ret = PTR_ERR(base);
 			DRM_ERROR("failed to kmap fbcon\n");
-
+		}
 	}
+
 	drm_gem_vram_unreserve(gbo);
 
 	mga_set_start_address(crtc, (u32)gpu_addr);
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
