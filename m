Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE451BDE11
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 15:38:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E69C986AB5;
	Wed, 29 Apr 2020 13:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyP-YLpMkzg7; Wed, 29 Apr 2020 13:38:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D5EE686B85;
	Wed, 29 Apr 2020 13:38:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBED2C0172;
	Wed, 29 Apr 2020 13:38:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D24EDC0888;
 Wed, 29 Apr 2020 13:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C0AE7878DE;
 Wed, 29 Apr 2020 13:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKjbQUkmGz2G; Wed, 29 Apr 2020 13:37:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2544887914;
 Wed, 29 Apr 2020 13:37:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 180F1E92; Wed, 29 Apr 2020 15:37:38 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 15/34] iommu/amd: Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:36:53 +0200
Message-Id: <20200429133712.31431-16-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

Convert the AMD IOMMU Driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd_iommu.c | 71 ++++++++++++---------------------------
 1 file changed, 22 insertions(+), 49 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 0b4b4faa876d..c30367413683 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -343,21 +343,9 @@ static bool check_device(struct device *dev)
 	return true;
 }
 
-static void init_iommu_group(struct device *dev)
-{
-	struct iommu_group *group;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return;
-
-	iommu_group_put(group);
-}
-
 static int iommu_init_device(struct device *dev)
 {
 	struct iommu_dev_data *dev_data;
-	struct amd_iommu *iommu;
 	int devid;
 
 	if (dev->archdata.iommu)
@@ -367,8 +355,6 @@ static int iommu_init_device(struct device *dev)
 	if (devid < 0)
 		return devid;
 
-	iommu = amd_iommu_rlookup_table[devid];
-
 	dev_data = find_dev_data(devid);
 	if (!dev_data)
 		return -ENOMEM;
@@ -391,8 +377,6 @@ static int iommu_init_device(struct device *dev)
 
 	dev->archdata.iommu = dev_data;
 
-	iommu_device_link(&iommu->iommu, dev);
-
 	return 0;
 }
 
@@ -410,7 +394,7 @@ static void iommu_ignore_device(struct device *dev)
 	setup_aliases(dev);
 }
 
-static void iommu_uninit_device(struct device *dev)
+static void amd_iommu_uninit_device(struct device *dev)
 {
 	struct iommu_dev_data *dev_data;
 	struct amd_iommu *iommu;
@@ -429,13 +413,6 @@ static void iommu_uninit_device(struct device *dev)
 	if (dev_data->domain)
 		detach_device(dev);
 
-	iommu_device_unlink(&iommu->iommu, dev);
-
-	iommu_group_remove_device(dev);
-
-	/* Remove dma-ops */
-	dev->dma_ops = NULL;
-
 	/*
 	 * We keep dev_data around for unplugged devices and reuse it when the
 	 * device is re-plugged - not doing so would introduce a ton of races.
@@ -2152,55 +2129,50 @@ static void detach_device(struct device *dev)
 	spin_unlock_irqrestore(&domain->lock, flags);
 }
 
-static int amd_iommu_add_device(struct device *dev)
+static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 {
-	struct iommu_dev_data *dev_data;
-	struct iommu_domain *domain;
+	struct iommu_device *iommu_dev;
 	struct amd_iommu *iommu;
 	int ret, devid;
 
-	if (get_dev_data(dev))
-		return 0;
-
 	if (!check_device(dev))
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	devid = get_device_id(dev);
 	if (devid < 0)
-		return devid;
+		return ERR_PTR(devid);
 
 	iommu = amd_iommu_rlookup_table[devid];
 
+	if (get_dev_data(dev))
+		return &iommu->iommu;
+
 	ret = iommu_init_device(dev);
 	if (ret) {
 		if (ret != -ENOTSUPP)
 			dev_err(dev, "Failed to initialize - trying to proceed anyway\n");
-
+		iommu_dev = ERR_PTR(ret);
 		iommu_ignore_device(dev);
-		dev->dma_ops = NULL;
-		goto out;
+	} else {
+		iommu_dev = &iommu->iommu;
 	}
-	init_iommu_group(dev);
 
-	dev_data = get_dev_data(dev);
+	iommu_completion_wait(iommu);
 
-	BUG_ON(!dev_data);
+	return iommu_dev;
+}
 
-	if (dev_data->iommu_v2)
-		iommu_request_dm_for_dev(dev);
+static void amd_iommu_probe_finalize(struct device *dev)
+{
+	struct iommu_domain *domain;
 
 	/* Domains are initialized for this device - have a look what we ended up with */
 	domain = iommu_get_domain_for_dev(dev);
 	if (domain->type == IOMMU_DOMAIN_DMA)
 		iommu_setup_dma_ops(dev, IOVA_START_PFN << PAGE_SHIFT, 0);
-
-out:
-	iommu_completion_wait(iommu);
-
-	return 0;
 }
 
-static void amd_iommu_remove_device(struct device *dev)
+static void amd_iommu_release_device(struct device *dev)
 {
 	struct amd_iommu *iommu;
 	int devid;
@@ -2214,7 +2186,7 @@ static void amd_iommu_remove_device(struct device *dev)
 
 	iommu = amd_iommu_rlookup_table[devid];
 
-	iommu_uninit_device(dev);
+	amd_iommu_uninit_device(dev);
 	iommu_completion_wait(iommu);
 }
 
@@ -2687,8 +2659,9 @@ const struct iommu_ops amd_iommu_ops = {
 	.map = amd_iommu_map,
 	.unmap = amd_iommu_unmap,
 	.iova_to_phys = amd_iommu_iova_to_phys,
-	.add_device = amd_iommu_add_device,
-	.remove_device = amd_iommu_remove_device,
+	.probe_device = amd_iommu_probe_device,
+	.release_device = amd_iommu_release_device,
+	.probe_finalize = amd_iommu_probe_finalize,
 	.device_group = amd_iommu_device_group,
 	.domain_get_attr = amd_iommu_domain_get_attr,
 	.get_resv_regions = amd_iommu_get_resv_regions,
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
