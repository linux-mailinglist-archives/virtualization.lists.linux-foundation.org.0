Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C2E52D
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 16:47:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6027221EB;
	Mon, 29 Apr 2019 14:46:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C1CD8218C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B962B879
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:43:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 89C82AF95;
	Mon, 29 Apr 2019 14:43:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, Jerry.Zhang@amd.com,
	hdegoede@redhat.com, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH v3 03/19] drm: Add |struct drm_gem_vram_object| callbacks for
	|struct drm_driver|
Date: Mon, 29 Apr 2019 16:43:25 +0200
Message-Id: <20190429144341.12615-4-tzimmermann@suse.de>
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
in |struct drm_driver|.

v2:
	* documentation fixes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 48 +++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     | 10 ++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index fcf6e78d92f7..31bf6c1079b0 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -458,3 +458,51 @@ int drm_gem_vram_bo_driver_verify_access(struct ttm_buffer_object *bo,
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
index 4872edb09fe9..99982590e32a 100644
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
