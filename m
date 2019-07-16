Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F8B6B145
	for <lists.virtualization@lfdr.de>; Tue, 16 Jul 2019 23:42:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7B342B7A;
	Tue, 16 Jul 2019 21:42:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1184CB7A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 21:42:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 34A3D88E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 21:42:41 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id i8so10060117pgm.13
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+natRHZ6L0BuGx+W5tA7MTs43222M5gkM31utxxbCOU=;
	b=kN3NUoT12UjsD2xyZpN8e4MYUo58H5FkPsDaw8dzZE/ejR28e9veipDZu1ue9cFGNJ
	C9ZB5Ngpuq+di+buJJ/Y47TVf7fsGqHj2vxwz+U3KoDhMp3U07imodBdSnwCXjDsRyKy
	TVLJsb4D6EpfgBYl20dhWfgQiN4IuioGmF3wHHQZJOPVoT3bwtxGrlqOj6NTIzGPXb3O
	p3mszmW7RuMgdxXOfE/D3ASRGoZH71QWpyjfEHflYR5LADDR5ggU+8ZzdiCMyypEoFPP
	vBTopgbzZ2VpMO56qkbzYjBr59Ev6sZ/AffvJvMX6yIH49JK9TZh2AAKuy/8oJCspGrY
	Yn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+natRHZ6L0BuGx+W5tA7MTs43222M5gkM31utxxbCOU=;
	b=FSLk7jCu1bJ+rBbrBWIkm7jobXTYCHoak238Q3GZg6VndkSIyTBrIGwoikRXACmmmO
	pRVDTNbTXjbBBHd7iAtofHlIi12JFAFndQpOXps2Jmwx6hUp69BgSWXYDjHZDhFrZtK+
	njLpT3Ry7CbNsxHng3sMTvj2rsV0zzUK3Edqhbnxqwc1Auj5H2BLmWYQC9LHY5cAg/cw
	s2dErnWGQQWphEmwc+A/Tfd/K9pSL+B1y2/cbqwnmK4elYPDo9b40+sxFcs5vcKFBRz2
	zFBa7PRyGSzjW0D8FwuozJVZH8+YvvPyJMnF4/VNLTNMabkZlRRR8/N+rwwFYLuoWJKp
	PtXg==
X-Gm-Message-State: APjAAAUXGuS5ZShc+ufB8TyUlbZOsOfBETHPVvmmE5A6cPM3mvwtNFtq
	LMUar3U7pgFT+B6aSbUqxWI=
X-Google-Smtp-Source: APXvYqzfz/S5WZIpSAuwm3Dywv2EHXSbMUU2QF7mDGE4cV/Oh7IH2/0lpwu3uOVqyg5xVISogAbcDA==
X-Received: by 2002:a63:1658:: with SMTP id 24mr37706389pgw.167.1563313360593; 
	Tue, 16 Jul 2019 14:42:40 -0700 (PDT)
Received: from localhost ([100.118.89.203]) by smtp.gmail.com with ESMTPSA id
	q22sm18809095pgh.49.2019.07.16.14.42.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 14:42:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm: plumb attaching dev thru to prime_pin/unpin
Date: Tue, 16 Jul 2019 14:37:41 -0700
Message-Id: <20190716213746.4670-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190716213746.4670-1-robdclark@gmail.com>
References: <20190716213746.4670-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Eric Biggers <ebiggers@google.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	nouveau@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>, Eric Anholt <eric@anholt.net>,
	Emil Velikov <emil.velikov@collabora.com>,
	Rob Clark <robdclark@chromium.org>,
	"David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
	amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	Ben Skeggs <bskeggs@redhat.com>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Dave Airlie <airlied@redhat.com>, Deepak Sharma <deepak.sharma@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	etnaviv@lists.freedesktop.org,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	spice-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Lucas Stach <l.stach@pengutronix.de>
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

From: Rob Clark <robdclark@chromium.org>

Needed in the following patch for cache operations.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v3: rebased on drm-tip

 drivers/gpu/drm/drm_gem.c                   | 8 ++++----
 drivers/gpu/drm/drm_internal.h              | 4 ++--
 drivers/gpu/drm/drm_prime.c                 | 4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 4 ++--
 drivers/gpu/drm/msm/msm_drv.h               | 4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c         | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_gem.h       | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_prime.c     | 4 ++--
 drivers/gpu/drm/qxl/qxl_prime.c             | 4 ++--
 drivers/gpu/drm/radeon/radeon_prime.c       | 4 ++--
 drivers/gpu/drm/vgem/vgem_drv.c             | 4 ++--
 include/drm/drm_drv.h                       | 5 ++---
 12 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 84689ccae885..af2549c45027 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1215,22 +1215,22 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 		obj->dev->driver->gem_print_info(p, indent, obj);
 }
 
-int drm_gem_pin(struct drm_gem_object *obj)
+int drm_gem_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (obj->funcs && obj->funcs->pin)
 		return obj->funcs->pin(obj);
 	else if (obj->dev->driver->gem_prime_pin)
-		return obj->dev->driver->gem_prime_pin(obj);
+		return obj->dev->driver->gem_prime_pin(obj, dev);
 	else
 		return 0;
 }
 
-void drm_gem_unpin(struct drm_gem_object *obj)
+void drm_gem_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (obj->funcs && obj->funcs->unpin)
 		obj->funcs->unpin(obj);
 	else if (obj->dev->driver->gem_prime_unpin)
-		obj->dev->driver->gem_prime_unpin(obj);
+		obj->dev->driver->gem_prime_unpin(obj, dev);
 }
 
 void *drm_gem_vmap(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 51a2055c8f18..e64090373e3a 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -133,8 +133,8 @@ void drm_gem_release(struct drm_device *dev, struct drm_file *file_private);
 void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 			const struct drm_gem_object *obj);
 
-int drm_gem_pin(struct drm_gem_object *obj);
-void drm_gem_unpin(struct drm_gem_object *obj);
+int drm_gem_pin(struct drm_gem_object *obj, struct device *dev);
+void drm_gem_unpin(struct drm_gem_object *obj, struct device *dev);
 void *drm_gem_vmap(struct drm_gem_object *obj);
 void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 189d980402ad..126860432ff9 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -575,7 +575,7 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	return drm_gem_pin(obj);
+	return drm_gem_pin(obj, attach->dev);
 }
 EXPORT_SYMBOL(drm_gem_map_attach);
 
@@ -593,7 +593,7 @@ void drm_gem_map_detach(struct dma_buf *dma_buf,
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_unpin(obj);
+	drm_gem_unpin(obj, attach->dev);
 }
 EXPORT_SYMBOL(drm_gem_map_detach);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index a05292e8ed6f..67e69a5f00f2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -43,7 +43,7 @@ int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
 	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
 }
 
-int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
+int etnaviv_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (!obj->import_attach) {
 		struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
@@ -55,7 +55,7 @@ int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
 	return 0;
 }
 
-void etnaviv_gem_prime_unpin(struct drm_gem_object *obj)
+void etnaviv_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (!obj->import_attach) {
 		struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ee7b512dc158..0eea68618b68 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -288,8 +288,8 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
-int msm_gem_prime_pin(struct drm_gem_object *obj);
-void msm_gem_prime_unpin(struct drm_gem_object *obj);
+int msm_gem_prime_pin(struct drm_gem_object *obj, struct device *dev);
+void msm_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev);
 void *msm_gem_get_vaddr(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
 void msm_gem_put_vaddr(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 5d64e0671f7a..cc07bf94e206 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -47,14 +47,14 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
-int msm_gem_prime_pin(struct drm_gem_object *obj)
+int msm_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (!obj->import_attach)
 		msm_gem_get_pages(obj);
 	return 0;
 }
 
-void msm_gem_prime_unpin(struct drm_gem_object *obj)
+void msm_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (!obj->import_attach)
 		msm_gem_put_pages(obj);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
index fe39998f65cc..91dcf89138f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
@@ -32,9 +32,9 @@ extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
 extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 				  struct drm_file *);
 
-extern int nouveau_gem_prime_pin(struct drm_gem_object *);
+extern int nouveau_gem_prime_pin(struct drm_gem_object *, struct device *);
 struct reservation_object *nouveau_gem_prime_res_obj(struct drm_gem_object *);
-extern void nouveau_gem_prime_unpin(struct drm_gem_object *);
+extern void nouveau_gem_prime_unpin(struct drm_gem_object *, struct device *);
 extern struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *);
 extern struct drm_gem_object *nouveau_gem_prime_import_sg_table(
 	struct drm_device *, struct dma_buf_attachment *, struct sg_table *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 1fefc93af1d7..dec2d5e37b34 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -88,7 +88,7 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 	return &nvbo->gem;
 }
 
-int nouveau_gem_prime_pin(struct drm_gem_object *obj)
+int nouveau_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
 	int ret;
@@ -101,7 +101,7 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
 	return 0;
 }
 
-void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
+void nouveau_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
 
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 7d3816fca5a8..21e9b44eb2e4 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -28,14 +28,14 @@
 /* Empty Implementations as there should not be any other driver for a virtual
  * device that might share buffers with qxl */
 
-int qxl_gem_prime_pin(struct drm_gem_object *obj)
+int qxl_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 
 	return qxl_bo_pin(bo);
 }
 
-void qxl_gem_prime_unpin(struct drm_gem_object *obj)
+void qxl_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index deaffce50a2e..f3442bd860f6 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -83,7 +83,7 @@ struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_device *dev,
 	return &bo->gem_base;
 }
 
-int radeon_gem_prime_pin(struct drm_gem_object *obj)
+int radeon_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
 	int ret = 0;
@@ -101,7 +101,7 @@ int radeon_gem_prime_pin(struct drm_gem_object *obj)
 	return ret;
 }
 
-void radeon_gem_prime_unpin(struct drm_gem_object *obj)
+void radeon_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
 	int ret = 0;
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 76d95b5e289c..e7d12e93b1f0 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -307,7 +307,7 @@ static void vgem_unpin_pages(struct drm_vgem_gem_object *bo)
 	mutex_unlock(&bo->pages_lock);
 }
 
-static int vgem_prime_pin(struct drm_gem_object *obj)
+static int vgem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
 	long n_pages = obj->size >> PAGE_SHIFT;
@@ -325,7 +325,7 @@ static int vgem_prime_pin(struct drm_gem_object *obj)
 	return 0;
 }
 
-static void vgem_prime_unpin(struct drm_gem_object *obj)
+static void vgem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b33f2cee2099..2b3d79bde6e1 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -592,20 +592,19 @@ struct drm_driver {
 	 */
 	struct drm_gem_object * (*gem_prime_import)(struct drm_device *dev,
 				struct dma_buf *dma_buf);
-
 	/**
 	 * @gem_prime_pin:
 	 *
 	 * Deprecated hook in favour of &drm_gem_object_funcs.pin.
 	 */
-	int (*gem_prime_pin)(struct drm_gem_object *obj);
+	int (*gem_prime_pin)(struct drm_gem_object *obj, struct device *dev);
 
 	/**
 	 * @gem_prime_unpin:
 	 *
 	 * Deprecated hook in favour of &drm_gem_object_funcs.unpin.
 	 */
-	void (*gem_prime_unpin)(struct drm_gem_object *obj);
+	void (*gem_prime_unpin)(struct drm_gem_object *obj, struct device *dev);
 
 
 	/**
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
