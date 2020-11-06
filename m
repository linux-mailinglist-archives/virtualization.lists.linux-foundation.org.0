Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F32A9880
	for <lists.virtualization@lfdr.de>; Fri,  6 Nov 2020 16:26:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB3B8873B2;
	Fri,  6 Nov 2020 15:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLlpUozoCokO; Fri,  6 Nov 2020 15:26:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F3042874CD;
	Fri,  6 Nov 2020 15:26:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0FDCC0889;
	Fri,  6 Nov 2020 15:26:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC9C7C0889
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 15:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CC144868E3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 15:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YVtMT9f1BJY
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 15:26:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 191FC8699F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 15:26:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 848DDABD1;
 Fri,  6 Nov 2020 15:26:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, sean@poorly.run, eric@anholt.net,
 kraxel@redhat.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com
Subject: [PATCH v2 2/2] drm/shmem-helper: Removed
 drm_gem_shmem_create_object_cached()
Date: Fri,  6 Nov 2020 16:26:32 +0100
Message-Id: <20201106152632.26530-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201106152632.26530-1-tzimmermann@suse.de>
References: <20201106152632.26530-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

Cached page mappings are now the default for SHMEM GEM objects. Remove
the obsolete create function for cached mappings.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 26 --------------------------
 drivers/gpu/drm/mgag200/mgag200_drv.c  |  1 -
 drivers/gpu/drm/udl/udl_drv.c          |  2 --
 drivers/gpu/drm/vkms/vkms_drv.c        |  1 -
 include/drm/drm_gem_shmem_helper.h     |  3 ---
 5 files changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index ddec0e190f29..5b4240725e64 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -468,32 +468,6 @@ bool drm_gem_shmem_purge(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_shmem_purge);
 
-/**
- * drm_gem_shmem_create_object_cached - Create a shmem buffer object with
- *                                      cached mappings
- * @dev: DRM device
- * @size: Size of the object to allocate
- *
- * By default, shmem buffer objects use writecombine mappings. This
- * function implements struct drm_driver.gem_create_object for shmem
- * buffer objects with cached mappings.
- *
- * Returns:
- * A struct drm_gem_shmem_object * on success or NULL negative on failure.
- */
-struct drm_gem_object *
-drm_gem_shmem_create_object_cached(struct drm_device *dev, size_t size)
-{
-	struct drm_gem_shmem_object *shmem;
-
-	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
-	if (!shmem)
-		return NULL;
-
-	return &shmem->base;
-}
-EXPORT_SYMBOL(drm_gem_shmem_create_object_cached);
-
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
  * @file: DRM file structure to create the dumb buffer for
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 771b26aeee19..aaf50b6a7372 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -37,7 +37,6 @@ static struct drm_driver mgag200_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-	.gem_create_object = drm_gem_shmem_create_object_cached,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 96d4317a2c1b..a29147799575 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -38,8 +38,6 @@ static struct drm_driver driver = {
 	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 
 	/* GEM hooks */
-	.gem_create_object = drm_gem_shmem_create_object_cached,
-
 	.fops = &udl_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 25faba5aac08..b6cd7f2d941c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -82,7 +82,6 @@ static struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
-	.gem_create_object = drm_gem_shmem_create_object_cached,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 
 	.name			= DRIVER_NAME,
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 268d0284ae02..6bcd2c4d6a51 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -133,9 +133,6 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 				 struct drm_device *dev, size_t size,
 				 uint32_t *handle);
 
-struct drm_gem_object *
-drm_gem_shmem_create_object_cached(struct drm_device *dev, size_t size);
-
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args);
 
-- 
2.29.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
