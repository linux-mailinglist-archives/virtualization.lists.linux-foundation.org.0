Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18446304F
	for <lists.virtualization@lfdr.de>; Tue, 30 Nov 2021 10:53:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62D2D40018;
	Tue, 30 Nov 2021 09:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRJdb0dyiF0L; Tue, 30 Nov 2021 09:53:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8E22840114;
	Tue, 30 Nov 2021 09:53:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F7D7C000A;
	Tue, 30 Nov 2021 09:53:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E3B7C000A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 09:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D297607B2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 09:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="QLkbib4g";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="2/16KbYs"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GxVOSFnOLu3O
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 09:53:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E572C60687
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 09:53:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 209E41FD54;
 Tue, 30 Nov 2021 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638265979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ATdo/ghYChR2nzsUkdFUSNNSJCq5lsCTh/1wUcMk1xk=;
 b=QLkbib4gt2YyuOVnkjDmCeKlC25ouinmnnILzOCMs6rVTmOJoXMnVyAhE2+a5BQNFCejWB
 0T1QHDLnuSKreFyNb5wew6eoPDKioah2vr1llQsWH8BOgqyOdNXBHO7Gk3fQg5cpR75nNI
 FC9FynZ/esSKl3EHuvNFL7u2Rb/njqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638265979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ATdo/ghYChR2nzsUkdFUSNNSJCq5lsCTh/1wUcMk1xk=;
 b=2/16KbYsKuyDJwpZjyKbCYPA/sQTTDJmX7JatNQieqZu0/OPANIp5erCtAAIwCOodojCEN
 HLXhlIJh/ffvg8Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9414813C98;
 Tue, 30 Nov 2021 09:52:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Bon6Inr0pWHVJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Nov 2021 09:52:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, emma@anholt.net, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, dan.carpenter@oracle.com
Subject: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
Date: Tue, 30 Nov 2021 10:52:55 +0100
Message-Id: <20211130095255.26710-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
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

GEM helper libraries use struct drm_driver.gem_create_object to let
drivers override GEM object allocation. On failure, the call returns
NULL.

Change the semantics to make the calls return a pointer-encoded error.
This aligns the callback with its callers. Fixes the ingenic driver,
which already returns an error pointer.

Also update the callers to handle the involved types more strictly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
There is an alternative patch at [1] that updates the value returned
by ingenics' gem_create_object to NULL. Fixing the interface to return
an errno code is more consistent with the rest of the GEM functions.

[1] https://lore.kernel.org/dri-devel/20211118111522.GD1147@kili/
---
 drivers/gpu/drm/drm_gem_cma_helper.c    | 17 ++++++++++-------
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 17 ++++++++++-------
 drivers/gpu/drm/drm_gem_vram_helper.c   |  4 ++--
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  2 +-
 drivers/gpu/drm/v3d/v3d_bo.c            |  4 ++--
 drivers/gpu/drm/vc4/vc4_bo.c            |  2 +-
 drivers/gpu/drm/vgem/vgem_drv.c         |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  2 +-
 include/drm/drm_drv.h                   |  5 +++--
 10 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 7d4895de9e0d..cefd0cbf9deb 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -67,18 +67,21 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
 	struct drm_gem_object *gem_obj;
 	int ret = 0;

-	if (drm->driver->gem_create_object)
+	if (drm->driver->gem_create_object) {
 		gem_obj = drm->driver->gem_create_object(drm, size);
-	else
-		gem_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
-	if (!gem_obj)
-		return ERR_PTR(-ENOMEM);
+		if (IS_ERR(gem_obj))
+			return ERR_CAST(gem_obj);
+		cma_obj = to_drm_gem_cma_obj(gem_obj);
+	} else {
+		cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
+		if (!cma_obj)
+			return ERR_PTR(-ENOMEM);
+		gem_obj = &cma_obj->base;
+	}

 	if (!gem_obj->funcs)
 		gem_obj->funcs = &drm_gem_cma_default_funcs;

-	cma_obj = container_of(gem_obj, struct drm_gem_cma_object, base);
-
 	if (private) {
 		drm_gem_private_object_init(drm, gem_obj, size);

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 0eeda1012364..7915047cb041 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -56,14 +56,17 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)

 	size = PAGE_ALIGN(size);

-	if (dev->driver->gem_create_object)
+	if (dev->driver->gem_create_object) {
 		obj = dev->driver->gem_create_object(dev, size);
-	else
-		obj = kzalloc(sizeof(*shmem), GFP_KERNEL);
-	if (!obj)
-		return ERR_PTR(-ENOMEM);
-
-	shmem = to_drm_gem_shmem_obj(obj);
+		if (IS_ERR(obj))
+			return ERR_CAST(obj);
+		shmem = to_drm_gem_shmem_obj(obj);
+	} else {
+		shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+		if (!shmem)
+			return ERR_PTR(-ENOMEM);
+		obj = &shmem->base;
+	}

 	if (!obj->funcs)
 		obj->funcs = &drm_gem_shmem_funcs;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index bfa386b98134..3f00192215d1 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -197,8 +197,8 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,

 	if (dev->driver->gem_create_object) {
 		gem = dev->driver->gem_create_object(dev, size);
-		if (!gem)
-			return ERR_PTR(-ENOMEM);
+		if (IS_ERR(gem))
+			return ERR_CAST(gem);
 		gbo = drm_gem_vram_of_gem(gem);
 	} else {
 		gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 2723d333c608..f9a9198ef198 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -221,7 +221,7 @@ struct drm_gem_object *lima_gem_create_object(struct drm_device *dev, size_t siz

 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
-		return NULL;
+		return ERR_PTR(-ENOMEM);

 	mutex_init(&bo->lock);
 	INIT_LIST_HEAD(&bo->va);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 6d9bdb9180cb..ead65f5fa2bc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -223,7 +223,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t

 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
 	if (!obj)
-		return NULL;
+		return ERR_PTR(-ENOMEM);

 	INIT_LIST_HEAD(&obj->mappings.list);
 	mutex_init(&obj->mappings.lock);
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 0d9af62f69ad..6e3113f419f4 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -70,11 +70,11 @@ struct drm_gem_object *v3d_create_object(struct drm_device *dev, size_t size)
 	struct drm_gem_object *obj;

 	if (size == 0)
-		return NULL;
+		return ERR_PTR(-EINVAL);

 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	obj = &bo->base.base;

 	obj->funcs = &v3d_gem_funcs;
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 8520e440dbd1..6d1281a343e9 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -391,7 +391,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)

 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
-		return NULL;
+		return ERR_PTR(-ENOMEM);

 	bo->madv = VC4_MADV_WILLNEED;
 	refcount_set(&bo->usecnt, 0);
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index a87eafa89e9f..c5e3e5457737 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -97,7 +97,7 @@ static struct drm_gem_object *vgem_gem_create_object(struct drm_device *dev, siz

 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
 	if (!obj)
-		return NULL;
+		return ERR_PTR(-ENOMEM);

 	/*
 	 * vgem doesn't have any begin/end cpu access ioctls, therefore must use
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 187e10da2f17..baef2c5f2aaf 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -139,7 +139,7 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,

 	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
 	if (!shmem)
-		return NULL;
+		return ERR_PTR(-ENOMEM);

 	dshmem = &shmem->base.base;
 	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index da0c836fe8e1..f6159acb8856 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -291,8 +291,9 @@ struct drm_driver {
 	/**
 	 * @gem_create_object: constructor for gem objects
 	 *
-	 * Hook for allocating the GEM object struct, for use by the CMA and
-	 * SHMEM GEM helpers.
+	 * Hook for allocating the GEM object struct, for use by the CMA
+	 * and SHMEM GEM helpers. Returns a GEM object on success, or an
+	 * ERR_PTR()-encoded error code otherwise.
 	 */
 	struct drm_gem_object *(*gem_create_object)(struct drm_device *dev,
 						    size_t size);
--
2.34.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
