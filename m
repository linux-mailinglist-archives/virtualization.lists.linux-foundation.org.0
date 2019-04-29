Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A38E525
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 16:46:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E6C7E21E5;
	Mon, 29 Apr 2019 14:46:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AECC91E70
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 91D56756
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 6C5C0AF61;
	Mon, 29 Apr 2019 14:43:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, Jerry.Zhang@amd.com,
	hdegoede@redhat.com, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH v3 02/19] drm: Add |struct drm_gem_vram_object| callbacks for
	|struct ttm_bo_driver|
Date: Mon, 29 Apr 2019 16:43:24 +0200
Message-Id: <20190429144341.12615-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429144341.12615-1-tzimmermann@suse.de>
References: <20190429144341.12615-1-tzimmermann@suse.de>
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

The provided helpers can be used for the respective callback functions
in |struct ttm_bo_driver|.

v2:
	* drm_is_gem_vram() is now a private function
	* documentation fixes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 50 +++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     | 10 ++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index d39d8a5f36df..fcf6e78d92f7 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -408,3 +408,53 @@ void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo)
 	drm_gem_vram_kunmap_at(gbo, &gbo->kmap);
 }
 EXPORT_SYMBOL(drm_gem_vram_kunmap);
+
+/*
+ * Helpers for struct ttm_bo_driver
+ */
+
+static bool drm_is_gem_vram(struct ttm_buffer_object *bo)
+{
+	return (bo->destroy == ttm_buffer_object_destroy);
+}
+
+/**
+ * drm_gem_vram_bo_driver_evict_flags() - \
+	Implements &struct ttm_bo_driver.evict_flags
+ * @bo:	TTM buffer object. Refers to &struct drm_gem_vram_object.bo
+ * @pl:	TTM placement information.
+ */
+void drm_gem_vram_bo_driver_evict_flags(struct ttm_buffer_object *bo,
+					struct ttm_placement *pl)
+{
+	struct drm_gem_vram_object *gbo;
+
+	/* TTM may pass BOs that are not GEM VRAM BOs. */
+	if (!drm_is_gem_vram(bo))
+		return;
+
+	gbo = drm_gem_vram_of_bo(bo);
+	drm_gem_vram_placement(gbo, TTM_PL_FLAG_SYSTEM);
+	*pl = gbo->placement;
+}
+EXPORT_SYMBOL(drm_gem_vram_bo_driver_evict_flags);
+
+/**
+ * drm_gem_vram_bo_driver_verify_access() - \
+	Implements &struct ttm_bo_driver.verify_access
+ * @bo:		TTM buffer object. Refers to &struct drm_gem_vram_object.bo
+ * @filp:	File pointer.
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative errno code otherwise.
+ */
+int drm_gem_vram_bo_driver_verify_access(struct ttm_buffer_object *bo,
+					 struct file *filp)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_bo(bo);
+
+	return drm_vma_node_verify_access(&gbo->gem.vma_node,
+					  filp->private_data);
+}
+EXPORT_SYMBOL(drm_gem_vram_bo_driver_verify_access);
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 167616f552e5..4872edb09fe9 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -89,4 +89,14 @@ void drm_gem_vram_kunmap_at(struct drm_gem_vram_object *gbo,
 			    struct ttm_bo_kmap_obj *kmap);
 void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo);
 
+/*
+ * Helpers for struct ttm_bo_driver
+ */
+
+void drm_gem_vram_bo_driver_evict_flags(struct ttm_buffer_object *bo,
+					struct ttm_placement *pl);
+
+int drm_gem_vram_bo_driver_verify_access(struct ttm_buffer_object *bo,
+					 struct file *filp);
+
 #endif
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
