Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5997E86397
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 15:45:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2C56DF3E;
	Thu,  8 Aug 2019 13:44:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 39566FF7
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 13:44:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6E4958A3
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 13:44:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8CF669089;
	Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
	[10.36.116.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63CBE5D70D;
	Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7AAAF9CA9; Thu,  8 Aug 2019 15:44:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 12/17] drm: drop DRM_VRAM_MM_FILE_OPERATIONS
Date: Thu,  8 Aug 2019 15:44:12 +0200
Message-Id: <20190808134417.10610-13-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
References: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 08 Aug 2019 13:44:25 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, tzimmermann@suse.de,
	David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Xinliang Liu <z.liuxinliang@hisilicon.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rongrong Zou <zourongrong@gmail.com>,
	Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
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

Not needed any more because we don't have vram specific functions any
more.  DEFINE_DRM_GEM_FOPS() can be used instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/drm/drm_vram_mm_helper.h                | 17 -----------------
 drivers/gpu/drm/ast/ast_drv.c                   |  5 +----
 drivers/gpu/drm/bochs/bochs_drv.c               |  5 +----
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  5 +----
 drivers/gpu/drm/mgag200/mgag200_drv.c           |  5 +----
 drivers/gpu/drm/vboxvideo/vbox_drv.c            |  5 +----
 6 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram_mm_helper.h
index f272adc8ad37..59a8a7657a5b 100644
--- a/include/drm/drm_vram_mm_helper.h
+++ b/include/drm/drm_vram_mm_helper.h
@@ -74,21 +74,4 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
 	const struct drm_vram_mm_funcs *funcs);
 void drm_vram_helper_release_mm(struct drm_device *dev);
 
-/**
- * define DRM_VRAM_MM_FILE_OPERATIONS - default callback functions for \
-	&struct file_operations
- *
- * Drivers that use VRAM MM can use this macro to initialize
- * &struct file_operations with default functions.
- */
-#define DRM_VRAM_MM_FILE_OPERATIONS \
-	.llseek		= no_llseek, \
-	.read		= drm_read, \
-	.poll		= drm_poll, \
-	.unlocked_ioctl = drm_ioctl, \
-	.compat_ioctl	= drm_compat_ioctl, \
-	.mmap		= drm_gem_mmap, \
-	.open		= drm_open, \
-	.release	= drm_release \
-
 #endif
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6ed6ff49efc0..358d2a34b4e6 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -201,10 +201,7 @@ static struct pci_driver ast_pci_driver = {
 	.driver.pm = &ast_pm_ops,
 };
 
-static const struct file_operations ast_fops = {
-	.owner = THIS_MODULE,
-	DRM_VRAM_MM_FILE_OPERATIONS
-};
+DEFINE_DRM_GEM_FOPS(ast_fops);
 
 static struct drm_driver driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM,
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index 770e1625d05e..d7e09af0832a 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -58,10 +58,7 @@ static int bochs_load(struct drm_device *dev)
 	return ret;
 }
 
-static const struct file_operations bochs_fops = {
-	.owner		= THIS_MODULE,
-	DRM_VRAM_MM_FILE_OPERATIONS
-};
+DEFINE_DRM_GEM_FOPS(bochs_fops);
 
 static struct drm_driver bochs_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 6386c67e086b..b3b1275ebf51 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -27,10 +27,7 @@
 #include "hibmc_drm_drv.h"
 #include "hibmc_drm_regs.h"
 
-static const struct file_operations hibmc_fops = {
-	.owner		= THIS_MODULE,
-	DRM_VRAM_MM_FILE_OPERATIONS
-};
+DEFINE_DRM_GEM_FOPS(hibmc_fops);
 
 static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
 {
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index afd9119b6cf1..684a324990d9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -58,10 +58,7 @@ static void mga_pci_remove(struct pci_dev *pdev)
 	drm_put_dev(dev);
 }
 
-static const struct file_operations mgag200_driver_fops = {
-	.owner = THIS_MODULE,
-	DRM_VRAM_MM_FILE_OPERATIONS
-};
+DEFINE_DRM_GEM_FOPS(mgag200_driver_fops);
 
 static struct drm_driver driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 6189ea89bb71..f70360081ef1 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -189,10 +189,7 @@ static struct pci_driver vbox_pci_driver = {
 #endif
 };
 
-static const struct file_operations vbox_fops = {
-	.owner = THIS_MODULE,
-	DRM_VRAM_MM_FILE_OPERATIONS
-};
+DEFINE_DRM_GEM_FOPS(vbox_fops);
 
 static struct drm_driver driver = {
 	.driver_features =
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
