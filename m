Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E23931739F
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 10:26:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A57AE1385;
	Wed,  8 May 2019 08:26:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7D454EB9
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BFAE4837
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 08:26:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 06402AE5D;
	Wed,  8 May 2019 08:26:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v5 03/20] drm: Add |struct drm_gem_vram_object| callbacks for
	|struct drm_driver|
Date: Wed,  8 May 2019 10:26:13 +0200
Message-Id: <20190508082630.15116-4-tzimmermann@suse.de>
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

The provided helpers can be used for the respective callback functions
in |struct drm_driver|.

v4:
	* cleanups from checkpatch.pl
v2:
	* documentation fixes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 49 +++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     | 10 ++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index d6c4e0d0a1c5..264028374336 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -460,3 +460,52 @@ int drm_gem_vram_bo_driver_verify_access(struct ttm_buffer_object *bo,
 					  filp->private_data);
 }
 EXPORT_SYMBOL(drm_gem_vram_bo_driver_verify_access);
+
+/*
+ * Helpers for struct drm_driver
+ */
+
+/**
+ * drm_gem_vram_driver_gem_free_object_unlocked() - \
+	Implements &struct drm_driver.gem_free_object_unlocked
+ * @gem:	GEM object. Refers to &struct drm_gem_vram_object.gem
+ */
+void drm_gem_vram_driver_gem_free_object_unlocked(struct drm_gem_object *gem)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
+
+	drm_gem_vram_put(gbo);
+}
+EXPORT_SYMBOL(drm_gem_vram_driver_gem_free_object_unlocked);
+
+/**
+ * drm_gem_vram_driver_dumb_mmap_offset() - \
+	Implements &struct drm_driver.dumb_mmap_offset
+ * @file:	DRM file pointer.
+ * @dev:	DRM device.
+ * @handle:	GEM handle
+ * @offset:	Returns the mapping's memory offset on success
+ *
+ * Returns:
+ * 0 on success, or
+ * a negative errno code otherwise.
+ */
+int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
+					 struct drm_device *dev,
+					 uint32_t handle, uint64_t *offset)
+{
+	struct drm_gem_object *gem;
+	struct drm_gem_vram_object *gbo;
+
+	gem = drm_gem_object_lookup(file, handle);
+	if (!gem)
+		return -ENOENT;
+
+	gbo = drm_gem_vram_of_gem(gem);
+	*offset = drm_gem_vram_mmap_offset(gbo);
+
+	drm_gem_object_put_unlocked(gem);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_gem_vram_driver_dumb_mmap_offset);
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 1915d3958304..b87cb2e9d9da 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -99,4 +99,14 @@ void drm_gem_vram_bo_driver_evict_flags(struct ttm_buffer_object *bo,
 int drm_gem_vram_bo_driver_verify_access(struct ttm_buffer_object *bo,
 					 struct file *filp);
 
+/*
+ * Helpers for struct drm_driver
+ */
+
+void drm_gem_vram_driver_gem_free_object_unlocked(struct drm_gem_object *gem);
+
+int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
+					 struct drm_device *dev,
+					 uint32_t handle, uint64_t *offset);
+
 #endif
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
