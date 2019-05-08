Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 111B6173C2
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 10:28:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B2FEC138D;
	Wed,  8 May 2019 08:26:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0B95B137D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3D95B831
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id D2E2EAEBD;
	Wed,  8 May 2019 08:26:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v5 05/20] drm: Add simple PRIME helpers for GEM VRAM
Date: Wed,  8 May 2019 10:26:15 +0200
Message-Id: <20190508082630.15116-6-tzimmermann@suse.de>
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

These basic helper functions for GEM VRAM allow for pinning and mapping
GEM VRAM objects via the PRIME interfaces. It's not a full implementation,
but complete enough for generic fbcon.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 98 +++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     | 20 ++++++
 2 files changed, 118 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index aba073279ca2..15c6193e4985 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -2,6 +2,7 @@
 
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_prime.h>
 #include <drm/ttm/ttm_page_alloc.h>
 
 /**
@@ -571,3 +572,100 @@ int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
 	return 0;
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_dumb_mmap_offset);
+
+/*
+ * PRIME helpers for struct drm_driver
+ */
+
+/**
+ * drm_gem_vram_driver_gem_prime_pin() - \
+	Implements &struct drm_driver.gem_prime_pin
+ * @gem:	The GEM object to pin
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative errno code otherwise.
+ */
+int drm_gem_vram_driver_gem_prime_pin(struct drm_gem_object *gem)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
+
+	return drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
+}
+EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_pin);
+
+/**
+ * drm_gem_vram_driver_gem_prime_unpin() - \
+	Implements &struct drm_driver.gem_prime_unpin
+ * @gem:	The GEM object to unpin
+ */
+void drm_gem_vram_driver_gem_prime_unpin(struct drm_gem_object *gem)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
+
+	drm_gem_vram_unpin(gbo);
+}
+EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_unpin);
+
+/**
+ * drm_gem_vram_driver_gem_prime_vmap() - \
+	Implements &struct drm_driver.gem_prime_vmap
+ * @gem:	The GEM object to map
+ *
+ * Returns:
+ * The buffers virtual address on success, or
+ * NULL otherwise.
+ */
+void *drm_gem_vram_driver_gem_prime_vmap(struct drm_gem_object *gem)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
+	int ret;
+	void *base;
+
+	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
+	if (ret)
+		return NULL;
+	base = drm_gem_vram_kmap(gbo, true, NULL);
+	if (IS_ERR(base)) {
+		drm_gem_vram_unpin(gbo);
+		return NULL;
+	}
+	return base;
+}
+EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_vmap);
+
+/**
+ * drm_gem_vram_driver_gem_prime_vunmap() - \
+	Implements &struct drm_driver.gem_prime_vunmap
+ * @gem:	The GEM object to unmap
+ * @vaddr:	The mapping's base address
+ */
+void drm_gem_vram_driver_gem_prime_vunmap(struct drm_gem_object *gem,
+					  void *vaddr)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
+
+	drm_gem_vram_kunmap(gbo);
+	drm_gem_vram_unpin(gbo);
+}
+EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_vunmap);
+
+/**
+ * drm_gem_vram_driver_gem_prime_mmap() - \
+	Implements &struct drm_driver.gem_prime_mmap
+ * @gem:	The GEM object to map
+ * @vma:	The VMA describing the mapping
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative errno code otherwise.
+ */
+int drm_gem_vram_driver_gem_prime_mmap(struct drm_gem_object *gem,
+				       struct vm_area_struct *vma)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
+
+	gbo->gem.vma_node.vm_node.start = gbo->bo.vma_node.vm_node.start;
+	return drm_gem_prime_mmap(gem, vma);
+}
+EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_mmap);
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 8e54f721c9f8..9a8bd98b623f 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -116,5 +116,25 @@ void drm_gem_vram_driver_gem_free_object_unlocked(struct drm_gem_object *gem);
 int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
 					 struct drm_device *dev,
 					 uint32_t handle, uint64_t *offset);
+/*
+ * PRIME helpers for struct drm_driver
+ */
+
+int drm_gem_vram_driver_gem_prime_pin(struct drm_gem_object *obj);
+void drm_gem_vram_driver_gem_prime_unpin(struct drm_gem_object *obj);
+void *drm_gem_vram_driver_gem_prime_vmap(struct drm_gem_object *obj);
+void drm_gem_vram_driver_gem_prime_vunmap(struct drm_gem_object *obj,
+					  void *vaddr);
+int drm_gem_vram_driver_gem_prime_mmap(struct drm_gem_object *obj,
+				       struct vm_area_struct *vma);
+
+#define DRM_GEM_VRAM_DRIVER_PRIME \
+	.gem_prime_export = drm_gem_prime_export, \
+	.gem_prime_import = drm_gem_prime_import, \
+	.gem_prime_pin	  = drm_gem_vram_driver_gem_prime_pin, \
+	.gem_prime_unpin  = drm_gem_vram_driver_gem_prime_unpin, \
+	.gem_prime_vmap	  = drm_gem_vram_driver_gem_prime_vmap, \
+	.gem_prime_vunmap = drm_gem_vram_driver_gem_prime_vunmap, \
+	.gem_prime_mmap	  = drm_gem_vram_driver_gem_prime_mmap
 
 #endif
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
