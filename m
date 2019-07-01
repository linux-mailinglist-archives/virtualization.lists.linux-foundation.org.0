Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2520CF0
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 18:28:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1F4E1CAD;
	Thu, 16 May 2019 16:27:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D8D14C7C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 16:27:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 05220883
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 16:27:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id ED132AE4E;
	Thu, 16 May 2019 16:27:50 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH 1/2] drm: Add drm_gem_vram_{pin/unpin}_reserved() and convert
	mgag200
Date: Thu, 16 May 2019 18:27:45 +0200
Message-Id: <20190516162746.11636-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516162746.11636-1-tzimmermann@suse.de>
References: <20190516162746.11636-1-tzimmermann@suse.de>
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

The new interfaces drm_gem_vram_{pin/unpin}_reserved() are variants of the
GEM VRAM pin/unpin functions that do not reserve the BO during validation.
The mgag200 driver requires this behavior for its cursor handling. The
patch also converts the driver to use the new interfaces.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c    | 75 ++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 18 +++---
 include/drm/drm_gem_vram_helper.h        |  3 +
 3 files changed, 88 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 8f142b810eb4..a002c03eaf4c 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -254,6 +254,47 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
 }
 EXPORT_SYMBOL(drm_gem_vram_pin);
 
+/**
+ * drm_gem_vram_pin_reserved() - Pins a GEM VRAM object in a region.
+ * @gbo:	the GEM VRAM object
+ * @pl_flag:	a bitmask of possible memory regions
+ *
+ * Pinning a buffer object ensures that it is not evicted from
+ * a memory region. A pinned buffer object has to be unpinned before
+ * it can be pinned to another region.
+ *
+ * This function pins a GEM VRAM object that has already been
+ * reserved. Use drm_gem_vram_pin() if possible.
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_gem_vram_pin_reserved(struct drm_gem_vram_object *gbo,
+			      unsigned long pl_flag)
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
+EXPORT_SYMBOL(drm_gem_vram_pin_reserved);
+
 /**
  * drm_gem_vram_unpin() - Unpins a GEM VRAM object
  * @gbo:	the GEM VRAM object
@@ -285,6 +326,40 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
+/**
+ * drm_gem_vram_unpin_reserved() - Unpins a GEM VRAM object
+ * @gbo:	the GEM VRAM object
+ *
+ * This function unpins a GEM VRAM object that has already been
+ * reserved. Use drm_gem_vram_unpin() if possible.
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_gem_vram_unpin_reserved(struct drm_gem_vram_object *gbo)
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
+EXPORT_SYMBOL(drm_gem_vram_unpin_reserved);
+
 /**
  * drm_gem_vram_push_to_system() - \
 	Unpins a GEM VRAM object and moves it to system memory
diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 6c1a9d724d85..1c4fc85315a0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -23,9 +23,9 @@ static void mga_hide_cursor(struct mga_device *mdev)
 	WREG8(MGA_CURPOSXL, 0);
 	WREG8(MGA_CURPOSXH, 0);
 	if (mdev->cursor.pixels_1->pin_count)
-		drm_gem_vram_unpin(mdev->cursor.pixels_1);
+		drm_gem_vram_unpin_reserved(mdev->cursor.pixels_1);
 	if (mdev->cursor.pixels_2->pin_count)
-		drm_gem_vram_unpin(mdev->cursor.pixels_2);
+		drm_gem_vram_unpin_reserved(mdev->cursor.pixels_2);
 }
 
 int mga_crtc_cursor_set(struct drm_crtc *crtc,
@@ -96,26 +96,28 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 
 	/* Move cursor buffers into VRAM if they aren't already */
 	if (!pixels_1->pin_count) {
-		ret = drm_gem_vram_pin(pixels_1, DRM_GEM_VRAM_PL_FLAG_VRAM);
+		ret = drm_gem_vram_pin_reserved(pixels_1,
+						DRM_GEM_VRAM_PL_FLAG_VRAM);
 		if (ret)
 			goto out1;
 		gpu_addr = drm_gem_vram_offset(pixels_1);
 		if (gpu_addr < 0) {
-			drm_gem_vram_unpin(pixels_1);
+			drm_gem_vram_unpin_reserved(pixels_1);
 			goto out1;
 		}
 		mdev->cursor.pixels_1_gpu_addr = gpu_addr;
 	}
 	if (!pixels_2->pin_count) {
-		ret = drm_gem_vram_pin(pixels_2, DRM_GEM_VRAM_PL_FLAG_VRAM);
+		ret = drm_gem_vram_pin_reserved(pixels_2,
+						DRM_GEM_VRAM_PL_FLAG_VRAM);
 		if (ret) {
-			drm_gem_vram_unpin(pixels_1);
+			drm_gem_vram_unpin_reserved(pixels_1);
 			goto out1;
 		}
 		gpu_addr = drm_gem_vram_offset(pixels_2);
 		if (gpu_addr < 0) {
-			drm_gem_vram_unpin(pixels_1);
-			drm_gem_vram_unpin(pixels_2);
+			drm_gem_vram_unpin_reserved(pixels_1);
+			drm_gem_vram_unpin_reserved(pixels_2);
 			goto out1;
 		}
 		mdev->cursor.pixels_2_gpu_addr = gpu_addr;
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index b056f189ba62..ff1a81761543 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -82,7 +82,10 @@ void drm_gem_vram_unreserve(struct drm_gem_vram_object *gbo);
 u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
+int drm_gem_vram_pin_reserved(struct drm_gem_vram_object *gbo,
+			      unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
+int drm_gem_vram_unpin_reserved(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_push_to_system(struct drm_gem_vram_object *gbo);
 void *drm_gem_vram_kmap_at(struct drm_gem_vram_object *gbo, bool map,
 			   bool *is_iomem, struct ttm_bo_kmap_obj *kmap);
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
