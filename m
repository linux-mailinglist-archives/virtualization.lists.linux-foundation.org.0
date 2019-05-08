Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E2975173B5
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 10:27:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 575241389;
	Wed,  8 May 2019 08:26:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D54E61108
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 02B7C875
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 666E5AE9A;
	Wed,  8 May 2019 08:26:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v5 04/20] drm: Add drm_gem_vram_fill_create_dumb() to create
	dumb buffers
Date: Wed,  8 May 2019 10:26:14 +0200
Message-Id: <20190508082630.15116-5-tzimmermann@suse.de>
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

The helper function drm_gem_vram_fill_create_dumb() implements most of
struct drm_driver.dumb_create() for GEM-VRAM buffer objects. It's not a
full implementation of the callback, as several driver-specific parameters
are still required.

v4:
	* cleanups from checkpatch.pl
v2:
	* documentation fixes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 62 +++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     |  8 ++++
 2 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 264028374336..aba073279ca2 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_mode.h>
 #include <drm/ttm/ttm_page_alloc.h>
 
 /**
@@ -411,6 +412,67 @@ void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_kunmap);
 
+/**
+ * drm_gem_vram_fill_create_dumb() - \
+	Helper for implementing &struct drm_driver.dumb_create
+ * @file:		the DRM file
+ * @dev:		the DRM device
+ * @bdev:		the TTM BO device managing the buffer object
+ * @pg_align:		the buffer's alignment in multiples of the page size
+ * @interruptible:	sleep interruptible if waiting for memory
+ * @args:		the arguments as provided to \
+				&struct drm_driver.dumb_create
+ *
+ * This helper function fills &struct drm_mode_create_dumb, which is used
+ * by &struct drm_driver.dumb_create. Implementations of this interface
+ * should forwards their arguments to this helper, plus the driver-specific
+ * parameters.
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative error code otherwise.
+ */
+int drm_gem_vram_fill_create_dumb(struct drm_file *file,
+				  struct drm_device *dev,
+				  struct ttm_bo_device *bdev,
+				  unsigned long pg_align,
+				  bool interruptible,
+				  struct drm_mode_create_dumb *args)
+{
+	size_t pitch, size;
+	struct drm_gem_vram_object *gbo;
+	int ret;
+	u32 handle;
+
+	pitch = args->width * ((args->bpp + 7) / 8);
+	size = pitch * args->height;
+
+	size = roundup(size, PAGE_SIZE);
+	if (!size)
+		return -EINVAL;
+
+	gbo = drm_gem_vram_create(dev, bdev, size, pg_align, interruptible);
+	if (IS_ERR(gbo))
+		return PTR_ERR(gbo);
+
+	ret = drm_gem_handle_create(file, &gbo->gem, &handle);
+	if (ret)
+		goto err_drm_gem_object_put_unlocked;
+
+	drm_gem_object_put_unlocked(&gbo->gem);
+
+	args->pitch = pitch;
+	args->size = size;
+	args->handle = handle;
+
+	return 0;
+
+err_drm_gem_object_put_unlocked:
+	drm_gem_object_put_unlocked(&gbo->gem);
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_vram_fill_create_dumb);
+
 /*
  * Helpers for struct ttm_bo_driver
  */
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index b87cb2e9d9da..8e54f721c9f8 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -8,6 +8,7 @@
 #include <drm/ttm/ttm_placement.h>
 #include <linux/kernel.h> /* for container_of() */
 
+struct drm_mode_create_dumb;
 struct filp;
 
 #define DRM_GEM_VRAM_PL_FLAG_VRAM	TTM_PL_FLAG_VRAM
@@ -89,6 +90,13 @@ void drm_gem_vram_kunmap_at(struct drm_gem_vram_object *gbo,
 			    struct ttm_bo_kmap_obj *kmap);
 void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo);
 
+int drm_gem_vram_fill_create_dumb(struct drm_file *file,
+				  struct drm_device *dev,
+				  struct ttm_bo_device *bdev,
+				  unsigned long pg_align,
+				  bool interruptible,
+				  struct drm_mode_create_dumb *args);
+
 /*
  * Helpers for struct ttm_bo_driver
  */
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
