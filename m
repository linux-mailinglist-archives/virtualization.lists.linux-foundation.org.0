Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA93B84B3
	for <lists.virtualization@lfdr.de>; Wed, 30 Jun 2021 16:07:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7978415B7;
	Wed, 30 Jun 2021 14:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3ymmoajeFOc; Wed, 30 Jun 2021 14:07:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B2DBC41582;
	Wed, 30 Jun 2021 14:07:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE6C0C0022;
	Wed, 30 Jun 2021 14:07:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE7A7C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 14:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B349440486
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 14:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="AwPI60cW";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="OJUUJ0yL"; dkim=pass (1024-bit key)
 header.d=suse.de header.b="AwPI60cW"; dkim=neutral
 reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="OJUUJ0yL"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPGdE-m4mjZi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 14:07:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C231740164
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 14:07:03 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4DD332273D;
 Wed, 30 Jun 2021 14:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625062021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+95KXLUsqDvI+v6Sw1TvND2xc5gOMsCbTYtq8G56f3s=;
 b=AwPI60cWtnuHfqET4kjq8Ge0yWbmtr14iFxLTic5V7mJzzh6vvqJhoQe2g+ZC6znf0A6QV
 KJq3odIgK2uUTJp9vYoJbo33d81GHCPi4tI0on6ucMq4rIroUzCj4rIsz766OVRoriHvR8
 7ZxQr4ZIFVuVFdRYCtcDPQIVn2xTKiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625062021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+95KXLUsqDvI+v6Sw1TvND2xc5gOMsCbTYtq8G56f3s=;
 b=OJUUJ0yLVExqtnZBB4ymgTWscVarNP3j4tLsvNkRqeBYOLmTezS5vSFpUBFCgNvc3hvxtY
 EgoFcDAhcvBoFxCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 02BF1118DD;
 Wed, 30 Jun 2021 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625062021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+95KXLUsqDvI+v6Sw1TvND2xc5gOMsCbTYtq8G56f3s=;
 b=AwPI60cWtnuHfqET4kjq8Ge0yWbmtr14iFxLTic5V7mJzzh6vvqJhoQe2g+ZC6znf0A6QV
 KJq3odIgK2uUTJp9vYoJbo33d81GHCPi4tI0on6ucMq4rIroUzCj4rIsz766OVRoriHvR8
 7ZxQr4ZIFVuVFdRYCtcDPQIVn2xTKiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625062021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+95KXLUsqDvI+v6Sw1TvND2xc5gOMsCbTYtq8G56f3s=;
 b=OJUUJ0yLVExqtnZBB4ymgTWscVarNP3j4tLsvNkRqeBYOLmTezS5vSFpUBFCgNvc3hvxtY
 EgoFcDAhcvBoFxCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id kKhyO4R63GBNDQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Jun 2021 14:07:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/3] drm/bochs: Move to tiny/
Date: Wed, 30 Jun 2021 16:06:57 +0200
Message-Id: <20210630140659.17623-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210630140659.17623-1-tzimmermann@suse.de>
References: <20210630140659.17623-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
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

The bochs driver is only ~600 lines of code. Putting it into tiny/
cleans up the DRM directory slightly. Some style problems were fixed
and unneeded include statements were removed. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 MAINTAINERS                       |   2 +-
 drivers/gpu/drm/Kconfig           |   2 -
 drivers/gpu/drm/Makefile          |   1 -
 drivers/gpu/drm/bochs/Kconfig     |  11 -
 drivers/gpu/drm/bochs/Makefile    |   4 -
 drivers/gpu/drm/bochs/bochs.h     |  98 ----
 drivers/gpu/drm/bochs/bochs_drv.c | 205 --------
 drivers/gpu/drm/bochs/bochs_hw.c  | 323 -------------
 drivers/gpu/drm/bochs/bochs_kms.c | 178 -------
 drivers/gpu/drm/bochs/bochs_mm.c  |  24 -
 drivers/gpu/drm/tiny/Kconfig      |  13 +
 drivers/gpu/drm/tiny/Makefile     |   1 +
 drivers/gpu/drm/tiny/bochs.c      | 768 ++++++++++++++++++++++++++++++
 13 files changed, 783 insertions(+), 847 deletions(-)
 delete mode 100644 drivers/gpu/drm/bochs/Kconfig
 delete mode 100644 drivers/gpu/drm/bochs/Makefile
 delete mode 100644 drivers/gpu/drm/bochs/bochs.h
 delete mode 100644 drivers/gpu/drm/bochs/bochs_drv.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_hw.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_kms.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_mm.c
 create mode 100644 drivers/gpu/drm/tiny/bochs.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dcb5f0d32303..95bad8d45200 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5680,7 +5680,7 @@ M:	Gerd Hoffmann <kraxel@redhat.com>
 L:	virtualization@lists.linux-foundation.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	drivers/gpu/drm/bochs/
+F:	drivers/gpu/drm/tiny/bochs.c
 
 DRM DRIVER FOR BOE HIMAX8279D PANELS
 M:	Jerry Han <hanxu5@huaqin.corp-partner.google.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1366d8d4610a..0d372354c2d0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -322,8 +322,6 @@ source "drivers/gpu/drm/tilcdc/Kconfig"
 
 source "drivers/gpu/drm/qxl/Kconfig"
 
-source "drivers/gpu/drm/bochs/Kconfig"
-
 source "drivers/gpu/drm/virtio/Kconfig"
 
 source "drivers/gpu/drm/msm/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 12e6f4e485ed..ad1112154898 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -98,7 +98,6 @@ obj-y			+= omapdrm/
 obj-$(CONFIG_DRM_SUN4I) += sun4i/
 obj-y			+= tilcdc/
 obj-$(CONFIG_DRM_QXL) += qxl/
-obj-$(CONFIG_DRM_BOCHS) += bochs/
 obj-$(CONFIG_DRM_VIRTIO_GPU) += virtio/
 obj-$(CONFIG_DRM_MSM) += msm/
 obj-$(CONFIG_DRM_TEGRA) += tegra/
diff --git a/drivers/gpu/drm/bochs/Kconfig b/drivers/gpu/drm/bochs/Kconfig
deleted file mode 100644
index 7bcdf294fed8..000000000000
--- a/drivers/gpu/drm/bochs/Kconfig
+++ /dev/null
@@ -1,11 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-config DRM_BOCHS
-	tristate "DRM Support for bochs dispi vga interface (qemu stdvga)"
-	depends on DRM && PCI && MMU
-	select DRM_KMS_HELPER
-	select DRM_VRAM_HELPER
-	select DRM_TTM
-	select DRM_TTM_HELPER
-	help
-	  Choose this option for qemu.
-	  If M is selected the module will be called bochs-drm.
diff --git a/drivers/gpu/drm/bochs/Makefile b/drivers/gpu/drm/bochs/Makefile
deleted file mode 100644
index 55473371300f..000000000000
--- a/drivers/gpu/drm/bochs/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-bochs-drm-y := bochs_drv.o bochs_mm.o bochs_kms.o bochs_hw.o
-
-obj-$(CONFIG_DRM_BOCHS)	+= bochs-drm.o
diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
deleted file mode 100644
index e9645c612aff..000000000000
--- a/drivers/gpu/drm/bochs/bochs.h
+++ /dev/null
@@ -1,98 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#include <linux/io.h>
-#include <linux/console.h>
-
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
-#include <drm/drm_encoder.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_vram_helper.h>
-#include <drm/drm_simple_kms_helper.h>
-
-/* ---------------------------------------------------------------------- */
-
-#define VBE_DISPI_IOPORT_INDEX           0x01CE
-#define VBE_DISPI_IOPORT_DATA            0x01CF
-
-#define VBE_DISPI_INDEX_ID               0x0
-#define VBE_DISPI_INDEX_XRES             0x1
-#define VBE_DISPI_INDEX_YRES             0x2
-#define VBE_DISPI_INDEX_BPP              0x3
-#define VBE_DISPI_INDEX_ENABLE           0x4
-#define VBE_DISPI_INDEX_BANK             0x5
-#define VBE_DISPI_INDEX_VIRT_WIDTH       0x6
-#define VBE_DISPI_INDEX_VIRT_HEIGHT      0x7
-#define VBE_DISPI_INDEX_X_OFFSET         0x8
-#define VBE_DISPI_INDEX_Y_OFFSET         0x9
-#define VBE_DISPI_INDEX_VIDEO_MEMORY_64K 0xa
-
-#define VBE_DISPI_ID0                    0xB0C0
-#define VBE_DISPI_ID1                    0xB0C1
-#define VBE_DISPI_ID2                    0xB0C2
-#define VBE_DISPI_ID3                    0xB0C3
-#define VBE_DISPI_ID4                    0xB0C4
-#define VBE_DISPI_ID5                    0xB0C5
-
-#define VBE_DISPI_DISABLED               0x00
-#define VBE_DISPI_ENABLED                0x01
-#define VBE_DISPI_GETCAPS                0x02
-#define VBE_DISPI_8BIT_DAC               0x20
-#define VBE_DISPI_LFB_ENABLED            0x40
-#define VBE_DISPI_NOCLEARMEM             0x80
-
-/* ---------------------------------------------------------------------- */
-
-enum bochs_types {
-	BOCHS_QEMU_STDVGA,
-	BOCHS_UNKNOWN,
-};
-
-struct bochs_device {
-	/* hw */
-	void __iomem   *mmio;
-	int            ioports;
-	void __iomem   *fb_map;
-	unsigned long  fb_base;
-	unsigned long  fb_size;
-	unsigned long  qext_size;
-
-	/* mode */
-	u16 xres;
-	u16 yres;
-	u16 yres_virtual;
-	u32 stride;
-	u32 bpp;
-	struct edid *edid;
-
-	/* drm */
-	struct drm_device *dev;
-	struct drm_simple_display_pipe pipe;
-	struct drm_connector connector;
-};
-
-/* ---------------------------------------------------------------------- */
-
-/* bochs_hw.c */
-int bochs_hw_init(struct drm_device *dev);
-void bochs_hw_fini(struct drm_device *dev);
-
-void bochs_hw_blank(struct bochs_device *bochs, bool blank);
-void bochs_hw_setmode(struct bochs_device *bochs,
-		      struct drm_display_mode *mode);
-void bochs_hw_setformat(struct bochs_device *bochs,
-			const struct drm_format_info *format);
-void bochs_hw_setbase(struct bochs_device *bochs,
-		      int x, int y, int stride, u64 addr);
-int bochs_hw_load_edid(struct bochs_device *bochs);
-
-/* bochs_mm.c */
-int bochs_mm_init(struct bochs_device *bochs);
-void bochs_mm_fini(struct bochs_device *bochs);
-
-/* bochs_kms.c */
-int bochs_kms_init(struct bochs_device *bochs);
-
-/* bochs_fbdev.c */
-extern const struct drm_mode_config_funcs bochs_mode_funcs;
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
deleted file mode 100644
index c828cadbabff..000000000000
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ /dev/null
@@ -1,205 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
-
-#include <linux/module.h>
-#include <linux/pci.h>
-
-#include <drm/drm_drv.h>
-#include <drm/drm_aperture.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_managed.h>
-
-#include "bochs.h"
-
-static int bochs_modeset = -1;
-module_param_named(modeset, bochs_modeset, int, 0444);
-MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
-
-/* ---------------------------------------------------------------------- */
-/* drm interface                                                          */
-
-static void bochs_unload(struct drm_device *dev)
-{
-	struct bochs_device *bochs = dev->dev_private;
-
-	bochs_mm_fini(bochs);
-}
-
-static int bochs_load(struct drm_device *dev)
-{
-	struct bochs_device *bochs;
-	int ret;
-
-	bochs = drmm_kzalloc(dev, sizeof(*bochs), GFP_KERNEL);
-	if (bochs == NULL)
-		return -ENOMEM;
-	dev->dev_private = bochs;
-	bochs->dev = dev;
-
-	ret = bochs_hw_init(dev);
-	if (ret)
-		goto err;
-
-	ret = bochs_mm_init(bochs);
-	if (ret)
-		goto err;
-
-	ret = bochs_kms_init(bochs);
-	if (ret)
-		goto err;
-
-	return 0;
-
-err:
-	bochs_unload(dev);
-	return ret;
-}
-
-DEFINE_DRM_GEM_FOPS(bochs_fops);
-
-static const struct drm_driver bochs_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.fops			= &bochs_fops,
-	.name			= "bochs-drm",
-	.desc			= "bochs dispi vga interface (qemu stdvga)",
-	.date			= "20130925",
-	.major			= 1,
-	.minor			= 0,
-	DRM_GEM_VRAM_DRIVER,
-	.release                = bochs_unload,
-};
-
-/* ---------------------------------------------------------------------- */
-/* pm interface                                                           */
-
-#ifdef CONFIG_PM_SLEEP
-static int bochs_pm_suspend(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_suspend(drm_dev);
-}
-
-static int bochs_pm_resume(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_resume(drm_dev);
-}
-#endif
-
-static const struct dev_pm_ops bochs_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(bochs_pm_suspend,
-				bochs_pm_resume)
-};
-
-/* ---------------------------------------------------------------------- */
-/* pci interface                                                          */
-
-static int bochs_pci_probe(struct pci_dev *pdev,
-			   const struct pci_device_id *ent)
-{
-	struct drm_device *dev;
-	unsigned long fbsize;
-	int ret;
-
-	fbsize = pci_resource_len(pdev, 0);
-	if (fbsize < 4 * 1024 * 1024) {
-		DRM_ERROR("less than 4 MB video memory, ignoring device\n");
-		return -ENOMEM;
-	}
-
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "bochsdrmfb");
-	if (ret)
-		return ret;
-
-	dev = drm_dev_alloc(&bochs_driver, &pdev->dev);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
-
-	ret = pci_enable_device(pdev);
-	if (ret)
-		goto err_free_dev;
-
-	pci_set_drvdata(pdev, dev);
-
-	ret = bochs_load(dev);
-	if (ret)
-		goto err_free_dev;
-
-	ret = drm_dev_register(dev, 0);
-	if (ret)
-		goto err_unload;
-
-	drm_fbdev_generic_setup(dev, 32);
-	return ret;
-
-err_unload:
-	bochs_unload(dev);
-err_free_dev:
-	drm_dev_put(dev);
-	return ret;
-}
-
-static void bochs_pci_remove(struct pci_dev *pdev)
-{
-	struct drm_device *dev = pci_get_drvdata(pdev);
-
-	drm_dev_unplug(dev);
-	drm_atomic_helper_shutdown(dev);
-	bochs_hw_fini(dev);
-	drm_dev_put(dev);
-}
-
-static const struct pci_device_id bochs_pci_tbl[] = {
-	{
-		.vendor      = 0x1234,
-		.device      = 0x1111,
-		.subvendor   = PCI_SUBVENDOR_ID_REDHAT_QUMRANET,
-		.subdevice   = PCI_SUBDEVICE_ID_QEMU,
-		.driver_data = BOCHS_QEMU_STDVGA,
-	},
-	{
-		.vendor      = 0x1234,
-		.device      = 0x1111,
-		.subvendor   = PCI_ANY_ID,
-		.subdevice   = PCI_ANY_ID,
-		.driver_data = BOCHS_UNKNOWN,
-	},
-	{ /* end of list */ }
-};
-
-static struct pci_driver bochs_pci_driver = {
-	.name =		"bochs-drm",
-	.id_table =	bochs_pci_tbl,
-	.probe =	bochs_pci_probe,
-	.remove =	bochs_pci_remove,
-	.driver.pm =    &bochs_pm_ops,
-};
-
-/* ---------------------------------------------------------------------- */
-/* module init/exit                                                       */
-
-static int __init bochs_init(void)
-{
-	if (vgacon_text_force() && bochs_modeset == -1)
-		return -EINVAL;
-
-	if (bochs_modeset == 0)
-		return -EINVAL;
-
-	return pci_register_driver(&bochs_pci_driver);
-}
-
-static void __exit bochs_exit(void)
-{
-	pci_unregister_driver(&bochs_pci_driver);
-}
-
-module_init(bochs_init);
-module_exit(bochs_exit);
-
-MODULE_DEVICE_TABLE(pci, bochs_pci_tbl);
-MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
-MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
deleted file mode 100644
index 7d3426d8cc69..000000000000
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ /dev/null
@@ -1,323 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
-
-#include <linux/pci.h>
-
-#include <drm/drm_drv.h>
-#include <drm/drm_fourcc.h>
-
-#include <video/vga.h>
-#include "bochs.h"
-
-/* ---------------------------------------------------------------------- */
-
-static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 val)
-{
-	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
-		return;
-
-	if (bochs->mmio) {
-		int offset = ioport - 0x3c0 + 0x400;
-		writeb(val, bochs->mmio + offset);
-	} else {
-		outb(val, ioport);
-	}
-}
-
-static u8 bochs_vga_readb(struct bochs_device *bochs, u16 ioport)
-{
-	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
-		return 0xff;
-
-	if (bochs->mmio) {
-		int offset = ioport - 0x3c0 + 0x400;
-		return readb(bochs->mmio + offset);
-	} else {
-		return inb(ioport);
-	}
-}
-
-static u16 bochs_dispi_read(struct bochs_device *bochs, u16 reg)
-{
-	u16 ret = 0;
-
-	if (bochs->mmio) {
-		int offset = 0x500 + (reg << 1);
-		ret = readw(bochs->mmio + offset);
-	} else {
-		outw(reg, VBE_DISPI_IOPORT_INDEX);
-		ret = inw(VBE_DISPI_IOPORT_DATA);
-	}
-	return ret;
-}
-
-static void bochs_dispi_write(struct bochs_device *bochs, u16 reg, u16 val)
-{
-	if (bochs->mmio) {
-		int offset = 0x500 + (reg << 1);
-		writew(val, bochs->mmio + offset);
-	} else {
-		outw(reg, VBE_DISPI_IOPORT_INDEX);
-		outw(val, VBE_DISPI_IOPORT_DATA);
-	}
-}
-
-static void bochs_hw_set_big_endian(struct bochs_device *bochs)
-{
-	if (bochs->qext_size < 8)
-		return;
-
-	writel(0xbebebebe, bochs->mmio + 0x604);
-}
-
-static void bochs_hw_set_little_endian(struct bochs_device *bochs)
-{
-	if (bochs->qext_size < 8)
-		return;
-
-	writel(0x1e1e1e1e, bochs->mmio + 0x604);
-}
-
-#ifdef __BIG_ENDIAN
-#define bochs_hw_set_native_endian(_b) bochs_hw_set_big_endian(_b)
-#else
-#define bochs_hw_set_native_endian(_b) bochs_hw_set_little_endian(_b)
-#endif
-
-static int bochs_get_edid_block(void *data, u8 *buf,
-				unsigned int block, size_t len)
-{
-	struct bochs_device *bochs = data;
-	size_t i, start = block * EDID_LENGTH;
-
-	if (start + len > 0x400 /* vga register offset */)
-		return -1;
-
-	for (i = 0; i < len; i++) {
-		buf[i] = readb(bochs->mmio + start + i);
-	}
-	return 0;
-}
-
-int bochs_hw_load_edid(struct bochs_device *bochs)
-{
-	u8 header[8];
-
-	if (!bochs->mmio)
-		return -1;
-
-	/* check header to detect whenever edid support is enabled in qemu */
-	bochs_get_edid_block(bochs, header, 0, ARRAY_SIZE(header));
-	if (drm_edid_header_is_valid(header) != 8)
-		return -1;
-
-	kfree(bochs->edid);
-	bochs->edid = drm_do_get_edid(&bochs->connector,
-				      bochs_get_edid_block, bochs);
-	if (bochs->edid == NULL)
-		return -1;
-
-	return 0;
-}
-
-int bochs_hw_init(struct drm_device *dev)
-{
-	struct bochs_device *bochs = dev->dev_private;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	unsigned long addr, size, mem, ioaddr, iosize;
-	u16 id;
-
-	if (pdev->resource[2].flags & IORESOURCE_MEM) {
-		/* mmio bar with vga and bochs registers present */
-		if (pci_request_region(pdev, 2, "bochs-drm") != 0) {
-			DRM_ERROR("Cannot request mmio region\n");
-			return -EBUSY;
-		}
-		ioaddr = pci_resource_start(pdev, 2);
-		iosize = pci_resource_len(pdev, 2);
-		bochs->mmio = ioremap(ioaddr, iosize);
-		if (bochs->mmio == NULL) {
-			DRM_ERROR("Cannot map mmio region\n");
-			return -ENOMEM;
-		}
-	} else {
-		ioaddr = VBE_DISPI_IOPORT_INDEX;
-		iosize = 2;
-		if (!request_region(ioaddr, iosize, "bochs-drm")) {
-			DRM_ERROR("Cannot request ioports\n");
-			return -EBUSY;
-		}
-		bochs->ioports = 1;
-	}
-
-	id = bochs_dispi_read(bochs, VBE_DISPI_INDEX_ID);
-	mem = bochs_dispi_read(bochs, VBE_DISPI_INDEX_VIDEO_MEMORY_64K)
-		* 64 * 1024;
-	if ((id & 0xfff0) != VBE_DISPI_ID0) {
-		DRM_ERROR("ID mismatch\n");
-		return -ENODEV;
-	}
-
-	if ((pdev->resource[0].flags & IORESOURCE_MEM) == 0)
-		return -ENODEV;
-	addr = pci_resource_start(pdev, 0);
-	size = pci_resource_len(pdev, 0);
-	if (addr == 0)
-		return -ENODEV;
-	if (size != mem) {
-		DRM_ERROR("Size mismatch: pci=%ld, bochs=%ld\n",
-			size, mem);
-		size = min(size, mem);
-	}
-
-	if (pci_request_region(pdev, 0, "bochs-drm") != 0)
-		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
-
-	bochs->fb_map = ioremap(addr, size);
-	if (bochs->fb_map == NULL) {
-		DRM_ERROR("Cannot map framebuffer\n");
-		return -ENOMEM;
-	}
-	bochs->fb_base = addr;
-	bochs->fb_size = size;
-
-	DRM_INFO("Found bochs VGA, ID 0x%x.\n", id);
-	DRM_INFO("Framebuffer size %ld kB @ 0x%lx, %s @ 0x%lx.\n",
-		 size / 1024, addr,
-		 bochs->ioports ? "ioports" : "mmio",
-		 ioaddr);
-
-	if (bochs->mmio && pdev->revision >= 2) {
-		bochs->qext_size = readl(bochs->mmio + 0x600);
-		if (bochs->qext_size < 4 || bochs->qext_size > iosize) {
-			bochs->qext_size = 0;
-			goto noext;
-		}
-		DRM_DEBUG("Found qemu ext regs, size %ld\n",
-			  bochs->qext_size);
-		bochs_hw_set_native_endian(bochs);
-	}
-
-noext:
-	return 0;
-}
-
-void bochs_hw_fini(struct drm_device *dev)
-{
-	struct bochs_device *bochs = dev->dev_private;
-
-	/* TODO: shot down existing vram mappings */
-
-	if (bochs->mmio)
-		iounmap(bochs->mmio);
-	if (bochs->ioports)
-		release_region(VBE_DISPI_IOPORT_INDEX, 2);
-	if (bochs->fb_map)
-		iounmap(bochs->fb_map);
-	pci_release_regions(to_pci_dev(dev->dev));
-	kfree(bochs->edid);
-}
-
-void bochs_hw_blank(struct bochs_device *bochs, bool blank)
-{
-	DRM_DEBUG_DRIVER("hw_blank %d\n", blank);
-	/* discard ar_flip_flop */
-	(void)bochs_vga_readb(bochs, VGA_IS1_RC);
-	/* blank or unblank; we need only update index and set 0x20 */
-	bochs_vga_writeb(bochs, VGA_ATT_W, blank ? 0 : 0x20);
-}
-
-void bochs_hw_setmode(struct bochs_device *bochs,
-		      struct drm_display_mode *mode)
-{
-	int idx;
-
-	if (!drm_dev_enter(bochs->dev, &idx))
-		return;
-
-	bochs->xres = mode->hdisplay;
-	bochs->yres = mode->vdisplay;
-	bochs->bpp = 32;
-	bochs->stride = mode->hdisplay * (bochs->bpp / 8);
-	bochs->yres_virtual = bochs->fb_size / bochs->stride;
-
-	DRM_DEBUG_DRIVER("%dx%d @ %d bpp, vy %d\n",
-			 bochs->xres, bochs->yres, bochs->bpp,
-			 bochs->yres_virtual);
-
-	bochs_hw_blank(bochs, false);
-
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_XRES,        bochs->xres);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_YRES,        bochs->yres);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BANK,        0);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH,  bochs->xres);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_HEIGHT,
-			  bochs->yres_virtual);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET,    0);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET,    0);
-
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,
-			  VBE_DISPI_ENABLED | VBE_DISPI_LFB_ENABLED);
-
-	drm_dev_exit(idx);
-}
-
-void bochs_hw_setformat(struct bochs_device *bochs,
-			const struct drm_format_info *format)
-{
-	int idx;
-
-	if (!drm_dev_enter(bochs->dev, &idx))
-		return;
-
-	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
-			 (format->format >>  0) & 0xff,
-			 (format->format >>  8) & 0xff,
-			 (format->format >> 16) & 0xff,
-			 (format->format >> 24) & 0xff);
-
-	switch (format->format) {
-	case DRM_FORMAT_XRGB8888:
-		bochs_hw_set_little_endian(bochs);
-		break;
-	case DRM_FORMAT_BGRX8888:
-		bochs_hw_set_big_endian(bochs);
-		break;
-	default:
-		/* should not happen */
-		DRM_ERROR("%s: Huh? Got framebuffer format 0x%x",
-			  __func__, format->format);
-		break;
-	}
-
-	drm_dev_exit(idx);
-}
-
-void bochs_hw_setbase(struct bochs_device *bochs,
-		      int x, int y, int stride, u64 addr)
-{
-	unsigned long offset;
-	unsigned int vx, vy, vwidth, idx;
-
-	if (!drm_dev_enter(bochs->dev, &idx))
-		return;
-
-	bochs->stride = stride;
-	offset = (unsigned long)addr +
-		y * bochs->stride +
-		x * (bochs->bpp / 8);
-	vy = offset / bochs->stride;
-	vx = (offset % bochs->stride) * 8 / bochs->bpp;
-	vwidth = stride * 8 / bochs->bpp;
-
-	DRM_DEBUG_DRIVER("x %d, y %d, addr %llx -> offset %lx, vx %d, vy %d\n",
-			 x, y, addr, offset, vx, vy);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH, vwidth);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET, vx);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET, vy);
-
-	drm_dev_exit(idx);
-}
diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
deleted file mode 100644
index 99410e77d51a..000000000000
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ /dev/null
@@ -1,178 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
-
-#include <linux/moduleparam.h>
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_probe_helper.h>
-
-#include "bochs.h"
-
-static int defx = 1024;
-static int defy = 768;
-
-module_param(defx, int, 0444);
-module_param(defy, int, 0444);
-MODULE_PARM_DESC(defx, "default x resolution");
-MODULE_PARM_DESC(defy, "default y resolution");
-
-/* ---------------------------------------------------------------------- */
-
-static const uint32_t bochs_formats[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_BGRX8888,
-};
-
-static void bochs_plane_update(struct bochs_device *bochs,
-			       struct drm_plane_state *state)
-{
-	struct drm_gem_vram_object *gbo;
-	s64 gpu_addr;
-
-	if (!state->fb || !bochs->stride)
-		return;
-
-	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
-	gpu_addr = drm_gem_vram_offset(gbo);
-	if (WARN_ON_ONCE(gpu_addr < 0))
-		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
-
-	bochs_hw_setbase(bochs,
-			 state->crtc_x,
-			 state->crtc_y,
-			 state->fb->pitches[0],
-			 state->fb->offsets[0] + gpu_addr);
-	bochs_hw_setformat(bochs, state->fb->format);
-}
-
-static void bochs_pipe_enable(struct drm_simple_display_pipe *pipe,
-			      struct drm_crtc_state *crtc_state,
-			      struct drm_plane_state *plane_state)
-{
-	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
-
-	bochs_hw_setmode(bochs, &crtc_state->mode);
-	bochs_plane_update(bochs, plane_state);
-}
-
-static void bochs_pipe_disable(struct drm_simple_display_pipe *pipe)
-{
-	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
-
-	bochs_hw_blank(bochs, true);
-}
-
-static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
-			      struct drm_plane_state *old_state)
-{
-	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
-
-	bochs_plane_update(bochs, pipe->plane.state);
-}
-
-static const struct drm_simple_display_pipe_funcs bochs_pipe_funcs = {
-	.enable	    = bochs_pipe_enable,
-	.disable    = bochs_pipe_disable,
-	.update	    = bochs_pipe_update,
-	.prepare_fb = drm_gem_vram_simple_display_pipe_prepare_fb,
-	.cleanup_fb = drm_gem_vram_simple_display_pipe_cleanup_fb,
-};
-
-static int bochs_connector_get_modes(struct drm_connector *connector)
-{
-	struct bochs_device *bochs =
-		container_of(connector, struct bochs_device, connector);
-	int count = 0;
-
-	if (bochs->edid)
-		count = drm_add_edid_modes(connector, bochs->edid);
-
-	if (!count) {
-		count = drm_add_modes_noedid(connector, 8192, 8192);
-		drm_set_preferred_mode(connector, defx, defy);
-	}
-	return count;
-}
-
-static const struct drm_connector_helper_funcs bochs_connector_connector_helper_funcs = {
-	.get_modes = bochs_connector_get_modes,
-};
-
-static const struct drm_connector_funcs bochs_connector_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static void bochs_connector_init(struct drm_device *dev)
-{
-	struct bochs_device *bochs = dev->dev_private;
-	struct drm_connector *connector = &bochs->connector;
-
-	drm_connector_init(dev, connector, &bochs_connector_connector_funcs,
-			   DRM_MODE_CONNECTOR_VIRTUAL);
-	drm_connector_helper_add(connector,
-				 &bochs_connector_connector_helper_funcs);
-
-	bochs_hw_load_edid(bochs);
-	if (bochs->edid) {
-		DRM_INFO("Found EDID data blob.\n");
-		drm_connector_attach_edid_property(connector);
-		drm_connector_update_edid_property(connector, bochs->edid);
-	}
-}
-
-static struct drm_framebuffer *
-bochs_gem_fb_create(struct drm_device *dev, struct drm_file *file,
-		    const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	if (mode_cmd->pixel_format != DRM_FORMAT_XRGB8888 &&
-	    mode_cmd->pixel_format != DRM_FORMAT_BGRX8888)
-		return ERR_PTR(-EINVAL);
-
-	return drm_gem_fb_create(dev, file, mode_cmd);
-}
-
-const struct drm_mode_config_funcs bochs_mode_funcs = {
-	.fb_create = bochs_gem_fb_create,
-	.mode_valid = drm_vram_helper_mode_valid,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
-};
-
-int bochs_kms_init(struct bochs_device *bochs)
-{
-	int ret;
-
-	ret = drmm_mode_config_init(bochs->dev);
-	if (ret)
-		return ret;
-
-	bochs->dev->mode_config.max_width = 8192;
-	bochs->dev->mode_config.max_height = 8192;
-
-	bochs->dev->mode_config.fb_base = bochs->fb_base;
-	bochs->dev->mode_config.preferred_depth = 24;
-	bochs->dev->mode_config.prefer_shadow = 0;
-	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
-	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
-
-	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
-
-	bochs_connector_init(bochs->dev);
-	drm_simple_display_pipe_init(bochs->dev,
-				     &bochs->pipe,
-				     &bochs_pipe_funcs,
-				     bochs_formats,
-				     ARRAY_SIZE(bochs_formats),
-				     NULL,
-				     &bochs->connector);
-
-	drm_mode_config_reset(bochs->dev);
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/bochs/bochs_mm.c b/drivers/gpu/drm/bochs/bochs_mm.c
deleted file mode 100644
index 1b74f530b07c..000000000000
--- a/drivers/gpu/drm/bochs/bochs_mm.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
-
-#include "bochs.h"
-
-/* ---------------------------------------------------------------------- */
-
-int bochs_mm_init(struct bochs_device *bochs)
-{
-	struct drm_vram_mm *vmm;
-
-	vmm = drm_vram_helper_alloc_mm(bochs->dev, bochs->fb_base,
-				       bochs->fb_size);
-	return PTR_ERR_OR_ZERO(vmm);
-}
-
-void bochs_mm_fini(struct bochs_device *bochs)
-{
-	if (!bochs->dev->vram_mm)
-		return;
-
-	drm_vram_helper_release_mm(bochs->dev);
-}
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index d46f95d9196d..5593128eeff9 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -10,6 +10,19 @@ config DRM_ARCPGU
 
 	  If M is selected the module will be called arcpgu.
 
+config DRM_BOCHS
+	tristate "DRM Support for bochs dispi vga interface (qemu stdvga)"
+	depends on DRM && PCI && MMU
+	select DRM_KMS_HELPER
+	select DRM_VRAM_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
+	help
+	  This is a KMS driver for qemu's stdvga output. Choose this option
+	  for qemu.
+
+	  If M is selected the module will be called bochs.
+
 config DRM_CIRRUS_QEMU
 	tristate "Cirrus driver for QEMU emulated device"
 	depends on DRM && PCI && MMU
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 9cc847e756da..e09942895c77 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
+obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_DRM_SIMPLEDRM)		+= simpledrm.o
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
new file mode 100644
index 000000000000..edcd31db5b9c
--- /dev/null
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -0,0 +1,768 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/console.h>
+#include <linux/pci.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include <video/vga.h>
+
+/* ---------------------------------------------------------------------- */
+
+#define VBE_DISPI_IOPORT_INDEX           0x01CE
+#define VBE_DISPI_IOPORT_DATA            0x01CF
+
+#define VBE_DISPI_INDEX_ID               0x0
+#define VBE_DISPI_INDEX_XRES             0x1
+#define VBE_DISPI_INDEX_YRES             0x2
+#define VBE_DISPI_INDEX_BPP              0x3
+#define VBE_DISPI_INDEX_ENABLE           0x4
+#define VBE_DISPI_INDEX_BANK             0x5
+#define VBE_DISPI_INDEX_VIRT_WIDTH       0x6
+#define VBE_DISPI_INDEX_VIRT_HEIGHT      0x7
+#define VBE_DISPI_INDEX_X_OFFSET         0x8
+#define VBE_DISPI_INDEX_Y_OFFSET         0x9
+#define VBE_DISPI_INDEX_VIDEO_MEMORY_64K 0xa
+
+#define VBE_DISPI_ID0                    0xB0C0
+#define VBE_DISPI_ID1                    0xB0C1
+#define VBE_DISPI_ID2                    0xB0C2
+#define VBE_DISPI_ID3                    0xB0C3
+#define VBE_DISPI_ID4                    0xB0C4
+#define VBE_DISPI_ID5                    0xB0C5
+
+#define VBE_DISPI_DISABLED               0x00
+#define VBE_DISPI_ENABLED                0x01
+#define VBE_DISPI_GETCAPS                0x02
+#define VBE_DISPI_8BIT_DAC               0x20
+#define VBE_DISPI_LFB_ENABLED            0x40
+#define VBE_DISPI_NOCLEARMEM             0x80
+
+static int bochs_modeset = -1;
+static int defx = 1024;
+static int defy = 768;
+
+module_param_named(modeset, bochs_modeset, int, 0444);
+MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
+
+module_param(defx, int, 0444);
+module_param(defy, int, 0444);
+MODULE_PARM_DESC(defx, "default x resolution");
+MODULE_PARM_DESC(defy, "default y resolution");
+
+/* ---------------------------------------------------------------------- */
+
+enum bochs_types {
+	BOCHS_QEMU_STDVGA,
+	BOCHS_UNKNOWN,
+};
+
+struct bochs_device {
+	/* hw */
+	void __iomem   *mmio;
+	int            ioports;
+	void __iomem   *fb_map;
+	unsigned long  fb_base;
+	unsigned long  fb_size;
+	unsigned long  qext_size;
+
+	/* mode */
+	u16 xres;
+	u16 yres;
+	u16 yres_virtual;
+	u32 stride;
+	u32 bpp;
+	struct edid *edid;
+
+	/* drm */
+	struct drm_device *dev;
+	struct drm_simple_display_pipe pipe;
+	struct drm_connector connector;
+};
+
+/* ---------------------------------------------------------------------- */
+
+static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 val)
+{
+	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
+		return;
+
+	if (bochs->mmio) {
+		int offset = ioport - 0x3c0 + 0x400;
+
+		writeb(val, bochs->mmio + offset);
+	} else {
+		outb(val, ioport);
+	}
+}
+
+static u8 bochs_vga_readb(struct bochs_device *bochs, u16 ioport)
+{
+	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
+		return 0xff;
+
+	if (bochs->mmio) {
+		int offset = ioport - 0x3c0 + 0x400;
+
+		return readb(bochs->mmio + offset);
+	} else {
+		return inb(ioport);
+	}
+}
+
+static u16 bochs_dispi_read(struct bochs_device *bochs, u16 reg)
+{
+	u16 ret = 0;
+
+	if (bochs->mmio) {
+		int offset = 0x500 + (reg << 1);
+
+		ret = readw(bochs->mmio + offset);
+	} else {
+		outw(reg, VBE_DISPI_IOPORT_INDEX);
+		ret = inw(VBE_DISPI_IOPORT_DATA);
+	}
+	return ret;
+}
+
+static void bochs_dispi_write(struct bochs_device *bochs, u16 reg, u16 val)
+{
+	if (bochs->mmio) {
+		int offset = 0x500 + (reg << 1);
+
+		writew(val, bochs->mmio + offset);
+	} else {
+		outw(reg, VBE_DISPI_IOPORT_INDEX);
+		outw(val, VBE_DISPI_IOPORT_DATA);
+	}
+}
+
+static void bochs_hw_set_big_endian(struct bochs_device *bochs)
+{
+	if (bochs->qext_size < 8)
+		return;
+
+	writel(0xbebebebe, bochs->mmio + 0x604);
+}
+
+static void bochs_hw_set_little_endian(struct bochs_device *bochs)
+{
+	if (bochs->qext_size < 8)
+		return;
+
+	writel(0x1e1e1e1e, bochs->mmio + 0x604);
+}
+
+#ifdef __BIG_ENDIAN
+#define bochs_hw_set_native_endian(_b) bochs_hw_set_big_endian(_b)
+#else
+#define bochs_hw_set_native_endian(_b) bochs_hw_set_little_endian(_b)
+#endif
+
+static int bochs_get_edid_block(void *data, u8 *buf,
+				unsigned int block, size_t len)
+{
+	struct bochs_device *bochs = data;
+	size_t i, start = block * EDID_LENGTH;
+
+	if (start + len > 0x400 /* vga register offset */)
+		return -1;
+
+	for (i = 0; i < len; i++)
+		buf[i] = readb(bochs->mmio + start + i);
+
+	return 0;
+}
+
+static int bochs_hw_load_edid(struct bochs_device *bochs)
+{
+	u8 header[8];
+
+	if (!bochs->mmio)
+		return -1;
+
+	/* check header to detect whenever edid support is enabled in qemu */
+	bochs_get_edid_block(bochs, header, 0, ARRAY_SIZE(header));
+	if (drm_edid_header_is_valid(header) != 8)
+		return -1;
+
+	kfree(bochs->edid);
+	bochs->edid = drm_do_get_edid(&bochs->connector,
+				      bochs_get_edid_block, bochs);
+	if (bochs->edid == NULL)
+		return -1;
+
+	return 0;
+}
+
+static int bochs_hw_init(struct drm_device *dev)
+{
+	struct bochs_device *bochs = dev->dev_private;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	unsigned long addr, size, mem, ioaddr, iosize;
+	u16 id;
+
+	if (pdev->resource[2].flags & IORESOURCE_MEM) {
+		/* mmio bar with vga and bochs registers present */
+		if (pci_request_region(pdev, 2, "bochs-drm") != 0) {
+			DRM_ERROR("Cannot request mmio region\n");
+			return -EBUSY;
+		}
+		ioaddr = pci_resource_start(pdev, 2);
+		iosize = pci_resource_len(pdev, 2);
+		bochs->mmio = ioremap(ioaddr, iosize);
+		if (bochs->mmio == NULL) {
+			DRM_ERROR("Cannot map mmio region\n");
+			return -ENOMEM;
+		}
+	} else {
+		ioaddr = VBE_DISPI_IOPORT_INDEX;
+		iosize = 2;
+		if (!request_region(ioaddr, iosize, "bochs-drm")) {
+			DRM_ERROR("Cannot request ioports\n");
+			return -EBUSY;
+		}
+		bochs->ioports = 1;
+	}
+
+	id = bochs_dispi_read(bochs, VBE_DISPI_INDEX_ID);
+	mem = bochs_dispi_read(bochs, VBE_DISPI_INDEX_VIDEO_MEMORY_64K)
+		* 64 * 1024;
+	if ((id & 0xfff0) != VBE_DISPI_ID0) {
+		DRM_ERROR("ID mismatch\n");
+		return -ENODEV;
+	}
+
+	if ((pdev->resource[0].flags & IORESOURCE_MEM) == 0)
+		return -ENODEV;
+	addr = pci_resource_start(pdev, 0);
+	size = pci_resource_len(pdev, 0);
+	if (addr == 0)
+		return -ENODEV;
+	if (size != mem) {
+		DRM_ERROR("Size mismatch: pci=%ld, bochs=%ld\n",
+			size, mem);
+		size = min(size, mem);
+	}
+
+	if (pci_request_region(pdev, 0, "bochs-drm") != 0)
+		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
+
+	bochs->fb_map = ioremap(addr, size);
+	if (bochs->fb_map == NULL) {
+		DRM_ERROR("Cannot map framebuffer\n");
+		return -ENOMEM;
+	}
+	bochs->fb_base = addr;
+	bochs->fb_size = size;
+
+	DRM_INFO("Found bochs VGA, ID 0x%x.\n", id);
+	DRM_INFO("Framebuffer size %ld kB @ 0x%lx, %s @ 0x%lx.\n",
+		 size / 1024, addr,
+		 bochs->ioports ? "ioports" : "mmio",
+		 ioaddr);
+
+	if (bochs->mmio && pdev->revision >= 2) {
+		bochs->qext_size = readl(bochs->mmio + 0x600);
+		if (bochs->qext_size < 4 || bochs->qext_size > iosize) {
+			bochs->qext_size = 0;
+			goto noext;
+		}
+		DRM_DEBUG("Found qemu ext regs, size %ld\n",
+			  bochs->qext_size);
+		bochs_hw_set_native_endian(bochs);
+	}
+
+noext:
+	return 0;
+}
+
+static void bochs_hw_fini(struct drm_device *dev)
+{
+	struct bochs_device *bochs = dev->dev_private;
+
+	/* TODO: shot down existing vram mappings */
+
+	if (bochs->mmio)
+		iounmap(bochs->mmio);
+	if (bochs->ioports)
+		release_region(VBE_DISPI_IOPORT_INDEX, 2);
+	if (bochs->fb_map)
+		iounmap(bochs->fb_map);
+	pci_release_regions(to_pci_dev(dev->dev));
+	kfree(bochs->edid);
+}
+
+static void bochs_hw_blank(struct bochs_device *bochs, bool blank)
+{
+	DRM_DEBUG_DRIVER("hw_blank %d\n", blank);
+	/* discard ar_flip_flop */
+	(void)bochs_vga_readb(bochs, VGA_IS1_RC);
+	/* blank or unblank; we need only update index and set 0x20 */
+	bochs_vga_writeb(bochs, VGA_ATT_W, blank ? 0 : 0x20);
+}
+
+static void bochs_hw_setmode(struct bochs_device *bochs, struct drm_display_mode *mode)
+{
+	int idx;
+
+	if (!drm_dev_enter(bochs->dev, &idx))
+		return;
+
+	bochs->xres = mode->hdisplay;
+	bochs->yres = mode->vdisplay;
+	bochs->bpp = 32;
+	bochs->stride = mode->hdisplay * (bochs->bpp / 8);
+	bochs->yres_virtual = bochs->fb_size / bochs->stride;
+
+	DRM_DEBUG_DRIVER("%dx%d @ %d bpp, vy %d\n",
+			 bochs->xres, bochs->yres, bochs->bpp,
+			 bochs->yres_virtual);
+
+	bochs_hw_blank(bochs, false);
+
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_XRES,        bochs->xres);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_YRES,        bochs->yres);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BANK,        0);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH,  bochs->xres);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_HEIGHT,
+			  bochs->yres_virtual);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET,    0);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET,    0);
+
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,
+			  VBE_DISPI_ENABLED | VBE_DISPI_LFB_ENABLED);
+
+	drm_dev_exit(idx);
+}
+
+static void bochs_hw_setformat(struct bochs_device *bochs, const struct drm_format_info *format)
+{
+	int idx;
+
+	if (!drm_dev_enter(bochs->dev, &idx))
+		return;
+
+	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
+			 (format->format >>  0) & 0xff,
+			 (format->format >>  8) & 0xff,
+			 (format->format >> 16) & 0xff,
+			 (format->format >> 24) & 0xff);
+
+	switch (format->format) {
+	case DRM_FORMAT_XRGB8888:
+		bochs_hw_set_little_endian(bochs);
+		break;
+	case DRM_FORMAT_BGRX8888:
+		bochs_hw_set_big_endian(bochs);
+		break;
+	default:
+		/* should not happen */
+		DRM_ERROR("%s: Huh? Got framebuffer format 0x%x",
+			  __func__, format->format);
+		break;
+	}
+
+	drm_dev_exit(idx);
+}
+
+static void bochs_hw_setbase(struct bochs_device *bochs, int x, int y, int stride, u64 addr)
+{
+	unsigned long offset;
+	unsigned int vx, vy, vwidth, idx;
+
+	if (!drm_dev_enter(bochs->dev, &idx))
+		return;
+
+	bochs->stride = stride;
+	offset = (unsigned long)addr +
+		y * bochs->stride +
+		x * (bochs->bpp / 8);
+	vy = offset / bochs->stride;
+	vx = (offset % bochs->stride) * 8 / bochs->bpp;
+	vwidth = stride * 8 / bochs->bpp;
+
+	DRM_DEBUG_DRIVER("x %d, y %d, addr %llx -> offset %lx, vx %d, vy %d\n",
+			 x, y, addr, offset, vx, vy);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH, vwidth);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET, vx);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET, vy);
+
+	drm_dev_exit(idx);
+}
+
+/* ---------------------------------------------------------------------- */
+
+static int bochs_mm_init(struct bochs_device *bochs)
+{
+	struct drm_vram_mm *vmm;
+
+	vmm = drm_vram_helper_alloc_mm(bochs->dev, bochs->fb_base,
+				       bochs->fb_size);
+	return PTR_ERR_OR_ZERO(vmm);
+}
+
+static void bochs_mm_fini(struct bochs_device *bochs)
+{
+	if (!bochs->dev->vram_mm)
+		return;
+
+	drm_vram_helper_release_mm(bochs->dev);
+}
+
+/* ---------------------------------------------------------------------- */
+
+static const uint32_t bochs_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_BGRX8888,
+};
+
+static void bochs_plane_update(struct bochs_device *bochs,
+			       struct drm_plane_state *state)
+{
+	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;
+
+	if (!state->fb || !bochs->stride)
+		return;
+
+	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (WARN_ON_ONCE(gpu_addr < 0))
+		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
+
+	bochs_hw_setbase(bochs,
+			 state->crtc_x,
+			 state->crtc_y,
+			 state->fb->pitches[0],
+			 state->fb->offsets[0] + gpu_addr);
+	bochs_hw_setformat(bochs, state->fb->format);
+}
+
+static void bochs_pipe_enable(struct drm_simple_display_pipe *pipe,
+			      struct drm_crtc_state *crtc_state,
+			      struct drm_plane_state *plane_state)
+{
+	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+
+	bochs_hw_setmode(bochs, &crtc_state->mode);
+	bochs_plane_update(bochs, plane_state);
+}
+
+static void bochs_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+
+	bochs_hw_blank(bochs, true);
+}
+
+static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
+			      struct drm_plane_state *old_state)
+{
+	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+
+	bochs_plane_update(bochs, pipe->plane.state);
+}
+
+static const struct drm_simple_display_pipe_funcs bochs_pipe_funcs = {
+	.enable	    = bochs_pipe_enable,
+	.disable    = bochs_pipe_disable,
+	.update	    = bochs_pipe_update,
+	.prepare_fb = drm_gem_vram_simple_display_pipe_prepare_fb,
+	.cleanup_fb = drm_gem_vram_simple_display_pipe_cleanup_fb,
+};
+
+static int bochs_connector_get_modes(struct drm_connector *connector)
+{
+	struct bochs_device *bochs =
+		container_of(connector, struct bochs_device, connector);
+	int count = 0;
+
+	if (bochs->edid)
+		count = drm_add_edid_modes(connector, bochs->edid);
+
+	if (!count) {
+		count = drm_add_modes_noedid(connector, 8192, 8192);
+		drm_set_preferred_mode(connector, defx, defy);
+	}
+	return count;
+}
+
+static const struct drm_connector_helper_funcs bochs_connector_connector_helper_funcs = {
+	.get_modes = bochs_connector_get_modes,
+};
+
+static const struct drm_connector_funcs bochs_connector_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static void bochs_connector_init(struct drm_device *dev)
+{
+	struct bochs_device *bochs = dev->dev_private;
+	struct drm_connector *connector = &bochs->connector;
+
+	drm_connector_init(dev, connector, &bochs_connector_connector_funcs,
+			   DRM_MODE_CONNECTOR_VIRTUAL);
+	drm_connector_helper_add(connector, &bochs_connector_connector_helper_funcs);
+
+	bochs_hw_load_edid(bochs);
+	if (bochs->edid) {
+		DRM_INFO("Found EDID data blob.\n");
+		drm_connector_attach_edid_property(connector);
+		drm_connector_update_edid_property(connector, bochs->edid);
+	}
+}
+
+static struct drm_framebuffer *
+bochs_gem_fb_create(struct drm_device *dev, struct drm_file *file,
+		    const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	if (mode_cmd->pixel_format != DRM_FORMAT_XRGB8888 &&
+	    mode_cmd->pixel_format != DRM_FORMAT_BGRX8888)
+		return ERR_PTR(-EINVAL);
+
+	return drm_gem_fb_create(dev, file, mode_cmd);
+}
+
+const struct drm_mode_config_funcs bochs_mode_funcs = {
+	.fb_create = bochs_gem_fb_create,
+	.mode_valid = drm_vram_helper_mode_valid,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int bochs_kms_init(struct bochs_device *bochs)
+{
+	int ret;
+
+	ret = drmm_mode_config_init(bochs->dev);
+	if (ret)
+		return ret;
+
+	bochs->dev->mode_config.max_width = 8192;
+	bochs->dev->mode_config.max_height = 8192;
+
+	bochs->dev->mode_config.fb_base = bochs->fb_base;
+	bochs->dev->mode_config.preferred_depth = 24;
+	bochs->dev->mode_config.prefer_shadow = 0;
+	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
+	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
+
+	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
+
+	bochs_connector_init(bochs->dev);
+	drm_simple_display_pipe_init(bochs->dev,
+				     &bochs->pipe,
+				     &bochs_pipe_funcs,
+				     bochs_formats,
+				     ARRAY_SIZE(bochs_formats),
+				     NULL,
+				     &bochs->connector);
+
+	drm_mode_config_reset(bochs->dev);
+
+	return 0;
+}
+
+/* ---------------------------------------------------------------------- */
+/* drm interface                                                          */
+
+static void bochs_unload(struct drm_device *dev)
+{
+	struct bochs_device *bochs = dev->dev_private;
+
+	bochs_mm_fini(bochs);
+}
+
+static int bochs_load(struct drm_device *dev)
+{
+	struct bochs_device *bochs;
+	int ret;
+
+	bochs = drmm_kzalloc(dev, sizeof(*bochs), GFP_KERNEL);
+	if (bochs == NULL)
+		return -ENOMEM;
+	dev->dev_private = bochs;
+	bochs->dev = dev;
+
+	ret = bochs_hw_init(dev);
+	if (ret)
+		goto err;
+
+	ret = bochs_mm_init(bochs);
+	if (ret)
+		goto err;
+
+	ret = bochs_kms_init(bochs);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	bochs_unload(dev);
+	return ret;
+}
+
+DEFINE_DRM_GEM_FOPS(bochs_fops);
+
+static const struct drm_driver bochs_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &bochs_fops,
+	.name			= "bochs-drm",
+	.desc			= "bochs dispi vga interface (qemu stdvga)",
+	.date			= "20130925",
+	.major			= 1,
+	.minor			= 0,
+	DRM_GEM_VRAM_DRIVER,
+	.release                = bochs_unload,
+};
+
+/* ---------------------------------------------------------------------- */
+/* pm interface                                                           */
+
+#ifdef CONFIG_PM_SLEEP
+static int bochs_pm_suspend(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_suspend(drm_dev);
+}
+
+static int bochs_pm_resume(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_resume(drm_dev);
+}
+#endif
+
+static const struct dev_pm_ops bochs_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(bochs_pm_suspend,
+				bochs_pm_resume)
+};
+
+/* ---------------------------------------------------------------------- */
+/* pci interface                                                          */
+
+static int bochs_pci_probe(struct pci_dev *pdev,
+			   const struct pci_device_id *ent)
+{
+	struct drm_device *dev;
+	unsigned long fbsize;
+	int ret;
+
+	fbsize = pci_resource_len(pdev, 0);
+	if (fbsize < 4 * 1024 * 1024) {
+		DRM_ERROR("less than 4 MB video memory, ignoring device\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "bochsdrmfb");
+	if (ret)
+		return ret;
+
+	dev = drm_dev_alloc(&bochs_driver, &pdev->dev);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		goto err_free_dev;
+
+	pci_set_drvdata(pdev, dev);
+
+	ret = bochs_load(dev);
+	if (ret)
+		goto err_free_dev;
+
+	ret = drm_dev_register(dev, 0);
+	if (ret)
+		goto err_unload;
+
+	drm_fbdev_generic_setup(dev, 32);
+	return ret;
+
+err_unload:
+	bochs_unload(dev);
+err_free_dev:
+	drm_dev_put(dev);
+	return ret;
+}
+
+static void bochs_pci_remove(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+
+	drm_dev_unplug(dev);
+	drm_atomic_helper_shutdown(dev);
+	bochs_hw_fini(dev);
+	drm_dev_put(dev);
+}
+
+static const struct pci_device_id bochs_pci_tbl[] = {
+	{
+		.vendor      = 0x1234,
+		.device      = 0x1111,
+		.subvendor   = PCI_SUBVENDOR_ID_REDHAT_QUMRANET,
+		.subdevice   = PCI_SUBDEVICE_ID_QEMU,
+		.driver_data = BOCHS_QEMU_STDVGA,
+	},
+	{
+		.vendor      = 0x1234,
+		.device      = 0x1111,
+		.subvendor   = PCI_ANY_ID,
+		.subdevice   = PCI_ANY_ID,
+		.driver_data = BOCHS_UNKNOWN,
+	},
+	{ /* end of list */ }
+};
+
+static struct pci_driver bochs_pci_driver = {
+	.name =		"bochs-drm",
+	.id_table =	bochs_pci_tbl,
+	.probe =	bochs_pci_probe,
+	.remove =	bochs_pci_remove,
+	.driver.pm =    &bochs_pm_ops,
+};
+
+/* ---------------------------------------------------------------------- */
+/* module init/exit                                                       */
+
+static int __init bochs_init(void)
+{
+	if (vgacon_text_force() && bochs_modeset == -1)
+		return -EINVAL;
+
+	if (bochs_modeset == 0)
+		return -EINVAL;
+
+	return pci_register_driver(&bochs_pci_driver);
+}
+
+static void __exit bochs_exit(void)
+{
+	pci_unregister_driver(&bochs_pci_driver);
+}
+
+module_init(bochs_init);
+module_exit(bochs_exit);
+
+MODULE_DEVICE_TABLE(pci, bochs_pci_tbl);
+MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
+MODULE_LICENSE("GPL");
-- 
2.32.0


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
