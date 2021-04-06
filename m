Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D96354EA4
	for <lists.virtualization@lfdr.de>; Tue,  6 Apr 2021 10:29:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C05C340EE6;
	Tue,  6 Apr 2021 08:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzVZHixIpLyk; Tue,  6 Apr 2021 08:29:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2735540E76;
	Tue,  6 Apr 2021 08:29:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D86A3C0018;
	Tue,  6 Apr 2021 08:29:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC06FC000A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 08:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2BFD40E6A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 08:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enNoJGaq-ZGK
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 08:29:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C7BC40E74
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 08:29:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EBB41B12F;
 Tue,  6 Apr 2021 08:29:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, bskeggs@redhat.com, kraxel@redhat.com
Subject: [PATCH 2/4] drm/vram-helper: Use drm_gem_ttm_dumb_map_offset()
Date: Tue,  6 Apr 2021 10:29:40 +0200
Message-Id: <20210406082942.24049-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406082942.24049-1-tzimmermann@suse.de>
References: <20210406082942.24049-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

VRAM helpers now use drm_gem_ttm_dumb_map_offset() to implement
struct drm_driver.dumb_map_offset.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 48 ---------------------------
 include/drm/drm_gem_vram_helper.h     |  7 ++--
 2 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 2b7c3a07956d..797200315854 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -245,22 +245,6 @@ void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_put);
 
-/**
- * drm_gem_vram_mmap_offset() - Returns a GEM VRAM object's mmap offset
- * @gbo:	the GEM VRAM object
- *
- * See drm_vma_node_offset_addr() for more information.
- *
- * Returns:
- * The buffer object's offset for userspace mappings on success, or
- * 0 if no offset is allocated.
- */
-u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
-{
-	return drm_vma_node_offset_addr(&gbo->bo.base.vma_node);
-}
-EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
-
 static u64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
 {
 	/* Keep TTM behavior for now, remove when drivers are audited */
@@ -638,38 +622,6 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
 
-/**
- * drm_gem_vram_driver_dumb_mmap_offset() - \
-	Implements &struct drm_driver.dumb_mmap_offset
- * @file:	DRM file pointer.
- * @dev:	DRM device.
- * @handle:	GEM handle
- * @offset:	Returns the mapping's memory offset on success
- *
- * Returns:
- * 0 on success, or
- * a negative errno code otherwise.
- */
-int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
-					 struct drm_device *dev,
-					 uint32_t handle, uint64_t *offset)
-{
-	struct drm_gem_object *gem;
-	struct drm_gem_vram_object *gbo;
-
-	gem = drm_gem_object_lookup(file, handle);
-	if (!gem)
-		return -ENOENT;
-
-	gbo = drm_gem_vram_of_gem(gem);
-	*offset = drm_gem_vram_mmap_offset(gbo);
-
-	drm_gem_object_put(gem);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_gem_vram_driver_dumb_mmap_offset);
-
 /*
  * Helpers for struct drm_plane_helper_funcs
  */
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 288055d397d9..27ed7e9243b9 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -5,6 +5,7 @@
 
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_modes.h>
 #include <drm/ttm/ttm_bo_api.h>
@@ -93,7 +94,6 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						size_t size,
 						unsigned long pg_align);
 void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
-u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
@@ -113,9 +113,6 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 				    struct drm_device *dev,
 				    struct drm_mode_create_dumb *args);
-int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
-					 struct drm_device *dev,
-					 uint32_t handle, uint64_t *offset);
 
 /*
  * Helpers for struct drm_plane_helper_funcs
@@ -149,7 +146,7 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
 #define DRM_GEM_VRAM_DRIVER \
 	.debugfs_init             = drm_vram_mm_debugfs_init, \
 	.dumb_create		  = drm_gem_vram_driver_dumb_create, \
-	.dumb_map_offset	  = drm_gem_vram_driver_dumb_mmap_offset, \
+	.dumb_map_offset	  = drm_gem_ttm_dumb_map_offset, \
 	.gem_prime_mmap		  = drm_gem_prime_mmap
 
 /*
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
