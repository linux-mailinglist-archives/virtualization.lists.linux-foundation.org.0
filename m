Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5EC4914CA
	for <lists.virtualization@lfdr.de>; Tue, 18 Jan 2022 03:24:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12715813CA;
	Tue, 18 Jan 2022 02:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiqEfHcCkXiy; Tue, 18 Jan 2022 02:24:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A2F4F813CC;
	Tue, 18 Jan 2022 02:24:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CEA0C0077;
	Tue, 18 Jan 2022 02:24:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A90CC002F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 02:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F4177404C5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 02:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4r94jN6kWcdT
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 02:24:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6127A40329
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Jan 2022 02:24:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62E7FB8124B;
 Tue, 18 Jan 2022 02:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DB8C36AE3;
 Tue, 18 Jan 2022 02:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472655;
 bh=XqqZhZVVlX5olFQFKA/GsYEKRETBxCwomFV/uenBILs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BGVFh2tySH9nEeZYyR+9KsagDxtV+Bd0Q5DPS5eCkZb1EAw960+t7uGZ06cX+p+G+
 RCBchiiu0fyZ/av6QV8Jso1PPlDfJFQj93IsYxN5vu0pqvWH9oAcYdNv7vVfKyFtDJ
 e2Zlxd4XsdQ56z1Wgg6rE5oq17vxcHD3YCF2VMVactKQcRBfuU1LXugR1BdWxJRatb
 ckdGSBltqeJq/866CJ5LGzVuyAvVm1EQkYskzX7G1SmDNfO89EZk+hnIbXTnx+encc
 Oy4+0yoccVGyCNdL2b0uQBBlR12Xi1oL+hH8eJW73j1O6RhlSRWHMSykILk5xUfssw
 dq5R5qOJwnqCw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 088/217] drm: Return error codes from struct
 drm_driver.gem_create_object
Date: Mon, 17 Jan 2022 21:17:31 -0500
Message-Id: <20220118021940.1942199-88-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, robh@kernel.org, daniel@ffwll.ch,
 tomeu.vizoso@collabora.com, emma@anholt.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, Steven Price <steven.price@arm.com>,
 lima@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org, lee.jones@linaro.org,
 yuq825@gmail.com
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

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 4ff22f487f8c26b99cbe1678344595734c001a39 ]

GEM helper libraries use struct drm_driver.gem_create_object to let
drivers override GEM object allocation. On failure, the call returns
NULL.

Change the semantics to make the calls return a pointer-encoded error.
This aligns the callback with its callers. Fixes the ingenic driver,
which already returns an error pointer.

Also update the callers to handle the involved types more strictly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Steven Price <steven.price@arm.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20211130095255.26710-1-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_gem_cma_helper.c    | 17 ++++++++++-------
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 17 ++++++++++-------
 drivers/gpu/drm/drm_gem_vram_helper.c   |  4 ++--
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  2 +-
 drivers/gpu/drm/v3d/v3d_bo.c            |  4 ++--
 drivers/gpu/drm/vgem/vgem_drv.c         |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  2 +-
 include/drm/drm_drv.h                   |  5 +++--
 9 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 9d05674550a4f..1e7e8cd64cb58 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -62,18 +62,21 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
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
index bca0de92802ef..fe157bf278347 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -51,14 +51,17 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 
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
index bfa386b981346..3f00192215d11 100644
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
index 640acc060467c..54823bd701a4b 100644
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
index 23377481f4e31..39ac031548954 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -221,7 +221,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
 	if (!obj)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&obj->mappings.list);
 	mutex_init(&obj->mappings.lock);
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 6a8731ab9d7d0..9a1a92782524c 100644
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
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index a87eafa89e9f4..c5e3e54577377 100644
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
index f648b0e24447b..4749c9303de05 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -140,7 +140,7 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 
 	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
 	if (!shmem)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	dshmem = &shmem->base.base;
 	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 0cd95953cdf55..96c264c4be4fe 100644
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
2.34.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
