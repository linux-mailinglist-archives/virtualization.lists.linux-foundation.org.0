Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 923121A7C78
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 15:16:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 30FB620788;
	Tue, 14 Apr 2020 13:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHNFlh0p7oZ7; Tue, 14 Apr 2020 13:16:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C5568214D2;
	Tue, 14 Apr 2020 13:16:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B069CC0172;
	Tue, 14 Apr 2020 13:16:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 167D8C0172;
 Tue, 14 Apr 2020 13:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F1B652076B;
 Tue, 14 Apr 2020 13:16:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Dp-6pihdReD; Tue, 14 Apr 2020 13:16:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 7125E20774;
 Tue, 14 Apr 2020 13:16:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C5CC776D; Tue, 14 Apr 2020 15:15:56 +0200 (CEST)
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
Subject: [PATCH v2 28/33] iommu/omap: Remove orphan_dev tracking
Date: Tue, 14 Apr 2020 15:15:37 +0200
Message-Id: <20200414131542.25608-29-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414131542.25608-1-joro@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
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

Remove the tracking of device which could not be probed because
their IOMMU is not probed yet. Replace it with a call to
bus_iommu_probe() when a new IOMMU is probed.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/omap-iommu.c | 54 +++-----------------------------------
 1 file changed, 4 insertions(+), 50 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 887fefcb03b4..ecc9d0829a91 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -35,15 +35,6 @@
 
 static const struct iommu_ops omap_iommu_ops;
 
-struct orphan_dev {
-	struct device *dev;
-	struct list_head node;
-};
-
-static LIST_HEAD(orphan_dev_list);
-
-static DEFINE_SPINLOCK(orphan_lock);
-
 #define to_iommu(dev)	((struct omap_iommu *)dev_get_drvdata(dev))
 
 /* bitmap of the page sizes currently supported */
@@ -62,8 +53,6 @@ static DEFINE_SPINLOCK(orphan_lock);
 static struct platform_driver omap_iommu_driver;
 static struct kmem_cache *iopte_cachep;
 
-static int _omap_iommu_add_device(struct device *dev);
-
 /**
  * to_omap_domain - Get struct omap_iommu_domain from generic iommu_domain
  * @dom:	generic iommu domain handle
@@ -1177,7 +1166,6 @@ static int omap_iommu_probe(struct platform_device *pdev)
 	struct omap_iommu *obj;
 	struct resource *res;
 	struct device_node *of = pdev->dev.of_node;
-	struct orphan_dev *orphan_dev, *tmp;
 
 	if (!of) {
 		pr_err("%s: only DT-based devices are supported\n", __func__);
@@ -1260,13 +1248,8 @@ static int omap_iommu_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "%s registered\n", obj->name);
 
-	list_for_each_entry_safe(orphan_dev, tmp, &orphan_dev_list, node) {
-		err = _omap_iommu_add_device(orphan_dev->dev);
-		if (!err) {
-			list_del(&orphan_dev->node);
-			kfree(orphan_dev);
-		}
-	}
+	/* Re-probe bus to probe device attached to this IOMMU */
+	bus_iommu_probe(&platform_bus_type);
 
 	return 0;
 
@@ -1657,7 +1640,7 @@ static phys_addr_t omap_iommu_iova_to_phys(struct iommu_domain *domain,
 	return ret;
 }
 
-static int _omap_iommu_add_device(struct device *dev)
+static int omap_iommu_add_device(struct device *dev)
 {
 	struct omap_iommu_arch_data *arch_data, *tmp;
 	struct omap_iommu *oiommu;
@@ -1666,8 +1649,6 @@ static int _omap_iommu_add_device(struct device *dev)
 	struct platform_device *pdev;
 	int num_iommus, i;
 	int ret;
-	struct orphan_dev *orphan_dev;
-	unsigned long flags;
 
 	/*
 	 * Allocate the archdata iommu structure for DT-based devices.
@@ -1702,23 +1683,7 @@ static int _omap_iommu_add_device(struct device *dev)
 		if (!pdev) {
 			of_node_put(np);
 			kfree(arch_data);
-			spin_lock_irqsave(&orphan_lock, flags);
-			list_for_each_entry(orphan_dev, &orphan_dev_list,
-					    node) {
-				if (orphan_dev->dev == dev)
-					break;
-			}
-			spin_unlock_irqrestore(&orphan_lock, flags);
-
-			if (orphan_dev && orphan_dev->dev == dev)
-				return -EPROBE_DEFER;
-
-			orphan_dev = kzalloc(sizeof(*orphan_dev), GFP_KERNEL);
-			orphan_dev->dev = dev;
-			spin_lock_irqsave(&orphan_lock, flags);
-			list_add(&orphan_dev->node, &orphan_dev_list);
-			spin_unlock_irqrestore(&orphan_lock, flags);
-			return -EPROBE_DEFER;
+			return -ENODEV;
 		}
 
 		oiommu = platform_get_drvdata(pdev);
@@ -1764,17 +1729,6 @@ static int _omap_iommu_add_device(struct device *dev)
 	return 0;
 }
 
-static int omap_iommu_add_device(struct device *dev)
-{
-	int ret;
-
-	ret = _omap_iommu_add_device(dev);
-	if (ret == -EPROBE_DEFER)
-		return 0;
-
-	return ret;
-}
-
 static void omap_iommu_remove_device(struct device *dev)
 {
 	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
