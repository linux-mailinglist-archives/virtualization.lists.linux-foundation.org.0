Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1BC98EBB
	for <lists.virtualization@lfdr.de>; Thu, 22 Aug 2019 11:07:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 27848F10;
	Thu, 22 Aug 2019 09:06:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7D7D9D93
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 09:06:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6ADD189B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 09:06:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80D073082141;
	Thu, 22 Aug 2019 09:06:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF8945D9D3;
	Thu, 22 Aug 2019 09:06:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 640299AF5; Thu, 22 Aug 2019 11:06:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm: drop resource_id parameter from
	drm_fb_helper_remove_conflicting_pci_framebuffers
Date: Thu, 22 Aug 2019 11:06:44 +0200
Message-Id: <20190822090645.25410-3-kraxel@redhat.com>
In-Reply-To: <20190822090645.25410-1-kraxel@redhat.com>
References: <20190822090645.25410-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 22 Aug 2019 09:06:51 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Maxime Ripard <maxime.ripard@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Not needed any more for remove_conflicting_pci_framebuffers calls.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/drm/drm_fb_helper.h             | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
 drivers/gpu/drm/bochs/bochs_drv.c       | 2 +-
 drivers/gpu/drm/cirrus/cirrus.c         | 2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c   | 2 +-
 drivers/gpu/drm/qxl/qxl_drv.c           | 2 +-
 drivers/gpu/drm/radeon/radeon_drv.c     | 2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c    | 1 -
 8 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 5a5f4b1d8241..8dcc012ccbc8 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -539,18 +539,16 @@ drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
 /**
  * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
  * @pdev: PCI device
- * @resource_id: index of PCI BAR configuring framebuffer memory
  * @name: requesting driver name
  *
  * This function removes framebuffer devices (eg. initialized by firmware)
- * using memory range configured for @pdev's BAR @resource_id.
+ * using memory range configured for any of @pdev's memory bars.
  *
  * The function assumes that PCI device with shadowed ROM drives a primary
  * display and so kicks out vga16fb.
  */
 static inline int
 drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
-						  int resource_id,
 						  const char *name)
 {
 	int ret = 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 98df55534a6d..6b96a5738e57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1031,7 +1031,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	}
 
 	/* Get rid of things like offb */
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "amdgpudrmfb");
+	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "amdgpudrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index 770e1625d05e..3b9b0d9bbc14 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -114,7 +114,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 	}
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "bochsdrmfb");
+	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "bochsdrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
index 36a69aec8a4b..89d9e6fdeb8c 100644
--- a/drivers/gpu/drm/cirrus/cirrus.c
+++ b/drivers/gpu/drm/cirrus/cirrus.c
@@ -532,7 +532,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 	struct cirrus_device *cirrus;
 	int ret;
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "cirrusdrmfb");
+	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "cirrusdrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index afd9119b6cf1..4f9df3b93598 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -46,7 +46,7 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
-	drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "mgag200drmfb");
+	drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "mgag200drmfb");
 
 	return drm_get_pci_dev(pdev, ent, &driver);
 }
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index c1802e01d9f6..2b726a51a302 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -83,7 +83,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto free_dev;
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "qxl");
+	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "qxl");
 	if (ret)
 		goto disable_pci;
 
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index a4a78dfdef37..624aa580d418 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -329,7 +329,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 		return -EPROBE_DEFER;
 
 	/* Get rid of things like offb */
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "radeondrmfb");
+	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "radeondrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 0fc32fa0b3c0..3d24181636e1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -56,7 +56,6 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev, struct virtio_device *vd
 	dev->pdev = pdev;
 	if (vga)
 		drm_fb_helper_remove_conflicting_pci_framebuffers(pdev,
-								  0,
 								  "virtiodrmfb");
 
 	/*
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
