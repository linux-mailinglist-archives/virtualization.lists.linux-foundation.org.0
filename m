Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E082C244E
	for <lists.virtualization@lfdr.de>; Tue, 24 Nov 2020 12:38:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F90285D44;
	Tue, 24 Nov 2020 11:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PIim4MDmNvg; Tue, 24 Nov 2020 11:38:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4DF185D54;
	Tue, 24 Nov 2020 11:38:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2E02C0052;
	Tue, 24 Nov 2020 11:38:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 375C0C163C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 11:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 263EC87293
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 11:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GScYLxLn3-P
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 11:38:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A289A87291
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 11:38:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28410AD8C;
 Tue, 24 Nov 2020 11:38:28 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 06/15] drm/hibmc: Remove references to struct drm_device.pdev
Date: Tue, 24 Nov 2020 12:38:15 +0100
Message-Id: <20201124113824.19994-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124113824.19994-1-tzimmermann@suse.de>
References: <20201124113824.19994-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Xinliang Liu <xinliang.liu@linaro.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 John Stultz <john.stultz@linaro.org>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Chen Feng <puck.chen@hisilicon.com>
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

Using struct drm_device.pdev is deprecated. Convert hibmc to struct
drm_device.dev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao  <tiantao6@hisilicon.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++++-----
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c     |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index d845657fd99c..ac5868343d0c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -203,7 +203,7 @@ static void hibmc_hw_config(struct hibmc_drm_private *priv)
 static int hibmc_hw_map(struct hibmc_drm_private *priv)
 {
 	struct drm_device *dev = priv->dev;
-	struct pci_dev *pdev = dev->pdev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	resource_size_t addr, size, ioaddr, iosize;
 
 	ioaddr = pci_resource_start(pdev, 1);
@@ -249,7 +249,7 @@ static int hibmc_unload(struct drm_device *dev)
 	if (dev->irq_enabled)
 		drm_irq_uninstall(dev);
 
-	pci_disable_msi(dev->pdev);
+	pci_disable_msi(to_pci_dev(dev->dev));
 	hibmc_kms_fini(priv);
 	hibmc_mm_fini(priv);
 	dev->dev_private = NULL;
@@ -258,6 +258,7 @@ static int hibmc_unload(struct drm_device *dev)
 
 static int hibmc_load(struct drm_device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct hibmc_drm_private *priv;
 	int ret;
 
@@ -287,11 +288,11 @@ static int hibmc_load(struct drm_device *dev)
 		goto err;
 	}
 
-	ret = pci_enable_msi(dev->pdev);
+	ret = pci_enable_msi(pdev);
 	if (ret) {
 		drm_warn(dev, "enabling MSI failed: %d\n", ret);
 	} else {
-		ret = drm_irq_install(dev, dev->pdev->irq);
+		ret = drm_irq_install(dev, pdev->irq);
 		if (ret)
 			drm_warn(dev, "install irq failed: %d\n", ret);
 	}
@@ -324,7 +325,6 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 		return PTR_ERR(dev);
 	}
 
-	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
 	ret = pci_enable_device(pdev);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
index 86d712090d87..410bd019bb35 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
@@ -83,7 +83,7 @@ int hibmc_ddc_create(struct drm_device *drm_dev,
 	connector->adapter.owner = THIS_MODULE;
 	connector->adapter.class = I2C_CLASS_DDC;
 	snprintf(connector->adapter.name, I2C_NAME_SIZE, "HIS i2c bit bus");
-	connector->adapter.dev.parent = &drm_dev->pdev->dev;
+	connector->adapter.dev.parent = drm_dev->dev;
 	i2c_set_adapdata(&connector->adapter, connector);
 	connector->adapter.algo_data = &connector->bit_data;
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 602ece11bb4a..77f075075db2 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -26,9 +26,9 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc)
 	struct drm_vram_mm *vmm;
 	int ret;
 	struct drm_device *dev = hibmc->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	vmm = drm_vram_helper_alloc_mm(dev,
-				       pci_resource_start(dev->pdev, 0),
+	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(pdev, 0),
 				       hibmc->fb_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
