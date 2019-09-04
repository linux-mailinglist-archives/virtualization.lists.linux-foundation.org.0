Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364FA7AE6
	for <lists.virtualization@lfdr.de>; Wed,  4 Sep 2019 07:48:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8DC43102A;
	Wed,  4 Sep 2019 05:47:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EAA29101A
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 05:47:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7E800709
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 05:47:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 052E030842A8;
	Wed,  4 Sep 2019 05:47:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
	[10.36.117.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8A9019C4F;
	Wed,  4 Sep 2019 05:47:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 060F131EEC; Wed,  4 Sep 2019 07:47:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/vram: fix Kconfig
Date: Wed,  4 Sep 2019 07:47:40 +0200
Message-Id: <20190904054740.20817-8-kraxel@redhat.com>
In-Reply-To: <20190904054740.20817-1-kraxel@redhat.com>
References: <20190904054740.20817-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 04 Sep 2019 05:47:47 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Chen Feng <puck.chen@hisilicon.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Xinliang Liu <z.liuxinliang@hisilicon.com>,
	David Airlie <airlied@linux.ie>,
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

select isn't recursive, so we can't turn on DRM_TTM + DRM_TTM_HELPER
in config DRM_VRAM_HELPER, we have to select them on the vram users
instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/Kconfig                 | 2 --
 drivers/gpu/drm/ast/Kconfig             | 2 ++
 drivers/gpu/drm/bochs/Kconfig           | 2 ++
 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 3 ++-
 drivers/gpu/drm/mgag200/Kconfig         | 2 ++
 drivers/gpu/drm/vboxvideo/Kconfig       | 2 ++
 6 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1be8ad30d8fe..cd11a3bde19c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -168,8 +168,6 @@ config DRM_TTM
 config DRM_VRAM_HELPER
 	tristate
 	depends on DRM
-	select DRM_TTM
-	select DRM_TTM_HELPER
 	help
 	  Helpers for VRAM memory management
 
diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
index 829620d5326c..fbcf2f45cef5 100644
--- a/drivers/gpu/drm/ast/Kconfig
+++ b/drivers/gpu/drm/ast/Kconfig
@@ -4,6 +4,8 @@ config DRM_AST
 	depends on DRM && PCI && MMU
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
 	help
 	 Say yes for experimental AST GPU driver. Do not enable
 	 this driver without having a working -modesetting,
diff --git a/drivers/gpu/drm/bochs/Kconfig b/drivers/gpu/drm/bochs/Kconfig
index 32b043abb668..7bcdf294fed8 100644
--- a/drivers/gpu/drm/bochs/Kconfig
+++ b/drivers/gpu/drm/bochs/Kconfig
@@ -4,6 +4,8 @@ config DRM_BOCHS
 	depends on DRM && PCI && MMU
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
 	help
 	  Choose this option for qemu.
 	  If M is selected the module will be called bochs-drm.
diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
index f20eedf0073a..8ad9a5b12e40 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -4,7 +4,8 @@ config DRM_HISI_HIBMC
 	depends on DRM && PCI && MMU
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
-
+	select DRM_TTM
+	select DRM_TTM_HELPER
 	help
 	  Choose this option if you have a Hisilicon Hibmc soc chipset.
 	  If M is selected the module will be called hibmc-drm.
diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index 76fee0fbdcae..aed11f4f4c55 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -4,6 +4,8 @@ config DRM_MGAG200
 	depends on DRM && PCI && MMU
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
 	help
 	 This is a KMS driver for the MGA G200 server chips, it
          does not support the original MGA G200 or any of the desktop
diff --git a/drivers/gpu/drm/vboxvideo/Kconfig b/drivers/gpu/drm/vboxvideo/Kconfig
index 56ba510f21a2..45fe135d6e43 100644
--- a/drivers/gpu/drm/vboxvideo/Kconfig
+++ b/drivers/gpu/drm/vboxvideo/Kconfig
@@ -4,6 +4,8 @@ config DRM_VBOXVIDEO
 	depends on DRM && X86 && PCI
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
 	select GENERIC_ALLOCATOR
 	help
 	  This is a KMS driver for the virtual Graphics Card used in
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
