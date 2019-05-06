Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C8314646
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 10:28:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 66D8E4526;
	Mon,  6 May 2019 08:27:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 155234520
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:26:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 97194836
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 08:26:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 68265AEFF;
	Mon,  6 May 2019 08:26:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
	christian.koenig@amd.com, ray.huang@amd.com, hdegoede@redhat.com,
	noralf@tronnes.org, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
	zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
	puck.chen@hisilicon.com
Subject: [PATCH v4 06/19] drm: Add default instance for VRAM MM callback
	functions
Date: Mon,  6 May 2019 10:26:36 +0200
Message-Id: <20190506082649.942-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506082649.942-1-tzimmermann@suse.de>
References: <20190506082649.942-1-tzimmermann@suse.de>
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

VRAM MM is most likely be used with GEM VRAM. The latter now provides the
required instance of struct drm_vram_mm_funcs for drivers to use.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 14 ++++++++++++++
 include/drm/drm_gem_vram_helper.h     |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 461ed20b779b..33321291475a 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -2,6 +2,7 @@
 
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_vram_mm_helper.h>
 #include <drm/ttm/ttm_page_alloc.h>
 
 /**
@@ -523,6 +524,19 @@ int drm_gem_vram_bo_driver_verify_access(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(drm_gem_vram_bo_driver_verify_access);
 
+/**
+ * drm_gem_vram_mm_funcs - Functions for &struct drm_vram_mm
+ *
+ * Most users of @struct drm_gem_vram_object will also use
+ * @struct drm_vram_mm. This instance of &struct drm_vram_mm_funcs
+ * can be used to connect both.
+ */
+const struct drm_vram_mm_funcs drm_gem_vram_mm_funcs = {
+	.evict_flags = drm_gem_vram_bo_driver_evict_flags,
+	.verify_access = drm_gem_vram_bo_driver_verify_access
+};
+EXPORT_SYMBOL(drm_gem_vram_mm_funcs);
+
 /*
  * Helpers for struct drm_driver
  */
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 68edb28d4508..f09f1594b4f8 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -9,6 +9,7 @@
 #include <linux/kernel.h> /* for container_of() */
 
 struct drm_mode_create_dumb;
+struct drm_vram_mm_funcs;
 struct filp;
 
 #define DRM_GEM_VRAM_PL_FLAG_VRAM	TTM_PL_FLAG_VRAM
@@ -107,6 +108,8 @@ void drm_gem_vram_bo_driver_evict_flags(struct ttm_buffer_object *bo,
 int drm_gem_vram_bo_driver_verify_access(struct ttm_buffer_object *bo,
 					 struct file *filp);
 
+extern const struct drm_vram_mm_funcs drm_gem_vram_mm_funcs;
+
 /*
  * Helpers for struct drm_driver
  */
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
