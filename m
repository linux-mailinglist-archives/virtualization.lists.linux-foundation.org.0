Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C62C9F65
	for <lists.virtualization@lfdr.de>; Tue,  1 Dec 2020 11:36:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2B10C87523;
	Tue,  1 Dec 2020 10:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIP47LTg6bjR; Tue,  1 Dec 2020 10:36:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B73287527;
	Tue,  1 Dec 2020 10:36:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85CA6C0052;
	Tue,  1 Dec 2020 10:36:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71D72C0052
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 61A1F86AAA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4aV2xrcB3YE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 715B286B66
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:35:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15B2EAD77;
 Tue,  1 Dec 2020 10:35:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 12/20] drm/mgag200: Remove references to struct
 drm_device.pdev
Date: Tue,  1 Dec 2020 11:35:34 +0100
Message-Id: <20201201103542.2182-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201103542.2182-1-tzimmermann@suse.de>
References: <20201201103542.2182-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
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

Using struct drm_device.pdev is deprecated. Convert mgag200 to struct
drm_device.dev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 20 +++++++++++---------
 drivers/gpu/drm/mgag200/mgag200_i2c.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mm.c  | 10 ++++++----
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index a977c9f49719..4e4c105f9a50 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -47,10 +47,11 @@ static const struct drm_driver mgag200_driver = {
 static bool mgag200_has_sgram(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u32 option;
 	int ret;
 
-	ret = pci_read_config_dword(dev->pdev, PCI_MGA_OPTION, &option);
+	ret = pci_read_config_dword(pdev, PCI_MGA_OPTION, &option);
 	if (drm_WARN(dev, ret, "failed to read PCI config dword: %d\n", ret))
 		return false;
 
@@ -60,6 +61,7 @@ static bool mgag200_has_sgram(struct mga_device *mdev)
 static int mgag200_regs_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u32 option, option2;
 	u8 crtcext3;
 
@@ -99,13 +101,13 @@ static int mgag200_regs_init(struct mga_device *mdev)
 	}
 
 	if (option)
-		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION, option);
+		pci_write_config_dword(pdev, PCI_MGA_OPTION, option);
 	if (option2)
-		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION2, option2);
+		pci_write_config_dword(pdev, PCI_MGA_OPTION2, option2);
 
 	/* BAR 1 contains registers */
-	mdev->rmmio_base = pci_resource_start(dev->pdev, 1);
-	mdev->rmmio_size = pci_resource_len(dev->pdev, 1);
+	mdev->rmmio_base = pci_resource_start(pdev, 1);
+	mdev->rmmio_size = pci_resource_len(pdev, 1);
 
 	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
 				     mdev->rmmio_size, "mgadrmfb_mmio")) {
@@ -113,7 +115,7 @@ static int mgag200_regs_init(struct mga_device *mdev)
 		return -ENOMEM;
 	}
 
-	mdev->rmmio = pcim_iomap(dev->pdev, 1, 0);
+	mdev->rmmio = pcim_iomap(pdev, 1, 0);
 	if (mdev->rmmio == NULL)
 		return -ENOMEM;
 
@@ -218,6 +220,7 @@ static void mgag200_g200_interpret_bios(struct mga_device *mdev,
 static void mgag200_g200_init_refclk(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned char __iomem *rom;
 	unsigned char *bios;
 	size_t size;
@@ -226,7 +229,7 @@ static void mgag200_g200_init_refclk(struct mga_device *mdev)
 	mdev->model.g200.pclk_max = 230000;
 	mdev->model.g200.ref_clk = 27050;
 
-	rom = pci_map_rom(dev->pdev, &size);
+	rom = pci_map_rom(pdev, &size);
 	if (!rom)
 		return;
 
@@ -244,7 +247,7 @@ static void mgag200_g200_init_refclk(struct mga_device *mdev)
 
 	vfree(bios);
 out:
-	pci_unmap_rom(dev->pdev, rom);
+	pci_unmap_rom(pdev, rom);
 }
 
 static void mgag200_g200se_init_unique_id(struct mga_device *mdev)
@@ -301,7 +304,6 @@ mgag200_device_create(struct pci_dev *pdev, unsigned long flags)
 		return mdev;
 	dev = &mdev->base;
 
-	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
 	ret = mgag200_device_init(mdev, flags);
diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 09731e614e46..ac8e34eef513 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -126,7 +126,7 @@ struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
 	i2c->clock = clock;
 	i2c->adapter.owner = THIS_MODULE;
 	i2c->adapter.class = I2C_CLASS_DDC;
-	i2c->adapter.dev.parent = &dev->pdev->dev;
+	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);
 	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name), "mga i2c");
diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index 641f1aa992be..b667371b69a4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -78,11 +78,12 @@ static size_t mgag200_probe_vram(struct mga_device *mdev, void __iomem *mem,
 static void mgag200_mm_release(struct drm_device *dev, void *ptr)
 {
 	struct mga_device *mdev = to_mga_device(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	mdev->vram_fb_available = 0;
 	iounmap(mdev->vram);
-	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
-				pci_resource_len(dev->pdev, 0));
+	arch_io_free_memtype_wc(pci_resource_start(pdev, 0),
+				pci_resource_len(pdev, 0));
 	arch_phys_wc_del(mdev->fb_mtrr);
 	mdev->fb_mtrr = 0;
 }
@@ -90,6 +91,7 @@ static void mgag200_mm_release(struct drm_device *dev, void *ptr)
 int mgag200_mm_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u8 misc;
 	resource_size_t start, len;
 	int ret;
@@ -102,8 +104,8 @@ int mgag200_mm_init(struct mga_device *mdev)
 	WREG8(MGA_MISC_OUT, misc);
 
 	/* BAR 0 is VRAM */
-	start = pci_resource_start(dev->pdev, 0);
-	len = pci_resource_len(dev->pdev, 0);
+	start = pci_resource_start(pdev, 0);
+	len = pci_resource_len(pdev, 0);
 
 	if (!devm_request_mem_region(dev->dev, start, len, "mgadrmfb_vram")) {
 		drm_err(dev, "can't reserve VRAM\n");
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
