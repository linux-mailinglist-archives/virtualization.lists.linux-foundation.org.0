Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB31A9485
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 09:41:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76C9986ECA;
	Wed, 15 Apr 2020 07:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qi+lHpLyGJxQ; Wed, 15 Apr 2020 07:41:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A647B86E82;
	Wed, 15 Apr 2020 07:41:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90EC0C1D7F;
	Wed, 15 Apr 2020 07:41:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74264C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6416786E49
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNB10AMMUfQZ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 487E286E68
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z6so17719471wml.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2H30jIEDD11qSxQxpCleB9uk8qmGhVe/WOieJFi7LTw=;
 b=OFvhQt+wzABIdksPxx9xVuNqEN7IekHKj8l+0SlgB7+6jRXeGJ4/RisMZm6OoXpo5i
 3cQIQEE/s8jQ6SkV2mkouXky8Usy7J/6XIOYM6VOvA56lHjXrHMhJIt6mTGUxaC49h2w
 uT5KJkz9EkyxQeNn+GPZzUH2Wo75tVoztazDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2H30jIEDD11qSxQxpCleB9uk8qmGhVe/WOieJFi7LTw=;
 b=sHiyCLZOGa91dbjff1kOr+bS43JuDzlGMFb6M+6kiXO9/uyyZf0P/zcvgim2qSSciZ
 YQGdEID1tMmfMdlRWiHZzWwX9G5iRk5LUTlZHZb1TjeybKgQhHXnEhNLNH22S+rLSi7V
 FAaXYgS9rx9fBsDntlqMcrFGSiVna7ERXAaI5UOcoEGp1Jik++IeifRyPJbUNoxYP39W
 Z0N5kitv7adPWPc57/Q3nWKG1xzI4AiRhvoh4ixTzfmOSCoh4Uru/lsLI6XzE824kEe6
 kR5cjsIf27oko640Rym1Okpkz7SSiClPguUOO37IFyOPq1KZVIG013i7HcdXdPhk+Qe6
 UCCQ==
X-Gm-Message-State: AGi0PuYY/wcvl+pk+mXiRAmoGF2syfZQqGLVySZMSryf5EyhVsIToXsQ
 wjR/ZAP6hTV92OAS3I6sbOIpMA==
X-Google-Smtp-Source: APiQypLs5r80mVEEP1uzMzAmmqWiKQSAQy7ew3+iWYVMq92xN6QC2hhYFiEZMck6gWVDyQtJdrs+QA==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr3597690wmn.81.1586936479698; 
 Wed, 15 Apr 2020 00:41:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 37/59] drm/cirrus: Move to drm/tiny
Date: Wed, 15 Apr 2020 09:40:12 +0200
Message-Id: <20200415074034.175360-38-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
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

Because it is. Huge congrats to everyone who made this kind of
refactoring happen!

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 MAINTAINERS                               |  2 +-
 drivers/gpu/drm/Kconfig                   |  2 --
 drivers/gpu/drm/Makefile                  |  1 -
 drivers/gpu/drm/cirrus/Kconfig            | 19 -------------------
 drivers/gpu/drm/cirrus/Makefile           |  2 --
 drivers/gpu/drm/tiny/Kconfig              | 19 +++++++++++++++++++
 drivers/gpu/drm/tiny/Makefile             |  1 +
 drivers/gpu/drm/{cirrus => tiny}/cirrus.c |  0
 8 files changed, 21 insertions(+), 25 deletions(-)
 delete mode 100644 drivers/gpu/drm/cirrus/Kconfig
 delete mode 100644 drivers/gpu/drm/cirrus/Makefile
 rename drivers/gpu/drm/{cirrus => tiny}/cirrus.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b3255d96d1d..0a5cf105ee37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5397,7 +5397,7 @@ L:	virtualization@lists.linux-foundation.org
 S:	Obsolete
 W:	https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	drivers/gpu/drm/cirrus/
+F:	drivers/gpu/drm/tiny/cirrus.c
 
 DRM DRIVER FOR QXL VIRTUAL GPU
 M:	Dave Airlie <airlied@redhat.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 43594978958e..4f4e7fa001c1 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -310,8 +310,6 @@ source "drivers/gpu/drm/ast/Kconfig"
 
 source "drivers/gpu/drm/mgag200/Kconfig"
 
-source "drivers/gpu/drm/cirrus/Kconfig"
-
 source "drivers/gpu/drm/armada/Kconfig"
 
 source "drivers/gpu/drm/atmel-hlcdc/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f34d08c83485..2c0e5a7e5953 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -74,7 +74,6 @@ obj-$(CONFIG_DRM_I915)	+= i915/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
 obj-$(CONFIG_DRM_V3D)  += v3d/
 obj-$(CONFIG_DRM_VC4)  += vc4/
-obj-$(CONFIG_DRM_CIRRUS_QEMU) += cirrus/
 obj-$(CONFIG_DRM_SIS)   += sis/
 obj-$(CONFIG_DRM_SAVAGE)+= savage/
 obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
diff --git a/drivers/gpu/drm/cirrus/Kconfig b/drivers/gpu/drm/cirrus/Kconfig
deleted file mode 100644
index c6bbd988b0e5..000000000000
--- a/drivers/gpu/drm/cirrus/Kconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-config DRM_CIRRUS_QEMU
-	tristate "Cirrus driver for QEMU emulated device"
-	depends on DRM && PCI && MMU
-	select DRM_KMS_HELPER
-	select DRM_GEM_SHMEM_HELPER
-	help
-	 This is a KMS driver for emulated cirrus device in qemu.
-	 It is *NOT* intended for real cirrus devices. This requires
-	 the modesetting userspace X.org driver.
-
-	 Cirrus is obsolete, the hardware was designed in the 90ies
-	 and can't keep up with todays needs.  More background:
-	 https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
-
-	 Better alternatives are:
-	   - stdvga (DRM_BOCHS, qemu -vga std, default in qemu 2.2+)
-	   - qxl (DRM_QXL, qemu -vga qxl, works best with spice)
-	   - virtio (DRM_VIRTIO_GPU), qemu -vga virtio)
diff --git a/drivers/gpu/drm/cirrus/Makefile b/drivers/gpu/drm/cirrus/Makefile
deleted file mode 100644
index 0c1ed3f99725..000000000000
--- a/drivers/gpu/drm/cirrus/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_DRM_CIRRUS_QEMU) += cirrus.o
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 4160e74e4751..2b6414f0fa75 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -1,5 +1,24 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+config DRM_CIRRUS_QEMU
+	tristate "Cirrus driver for QEMU emulated device"
+	depends on DRM && PCI && MMU
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	help
+	 This is a KMS driver for emulated cirrus device in qemu.
+	 It is *NOT* intended for real cirrus devices. This requires
+	 the modesetting userspace X.org driver.
+
+	 Cirrus is obsolete, the hardware was designed in the 90ies
+	 and can't keep up with todays needs.  More background:
+	 https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
+
+	 Better alternatives are:
+	   - stdvga (DRM_BOCHS, qemu -vga std, default in qemu 2.2+)
+	   - qxl (DRM_QXL, qemu -vga qxl, works best with spice)
+	   - virtio (DRM_VIRTIO_GPU), qemu -vga virtio)
+
 config DRM_GM12U320
 	tristate "GM12U320 driver for USB projectors"
 	depends on DRM && USB
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index c96ceee71453..6ae4e9e5a35f 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
similarity index 100%
rename from drivers/gpu/drm/cirrus/cirrus.c
rename to drivers/gpu/drm/tiny/cirrus.c
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
