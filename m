Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E2E1BDDF5
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 15:38:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 41F7D86BE1;
	Wed, 29 Apr 2020 13:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pmp0f2lLmENx; Wed, 29 Apr 2020 13:38:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2489886AE0;
	Wed, 29 Apr 2020 13:38:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1C02C0864;
	Wed, 29 Apr 2020 13:38:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7302DC0172;
 Wed, 29 Apr 2020 13:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6EF5D883E0;
 Wed, 29 Apr 2020 13:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUjv8xEKuW4Q; Wed, 29 Apr 2020 13:37:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ADDD1883F5;
 Wed, 29 Apr 2020 13:37:51 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A12D6EFF; Wed, 29 Apr 2020 15:37:39 +0200 (CEST)
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
Subject: [PATCH v3 23/34] iommu/mediatek-v1 Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:37:01 +0200
Message-Id: <20200429133712.31431-24-joro@8bytes.org>
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

Convert the Mediatek-v1 IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/mtk_iommu_v1.c | 50 +++++++++++++++---------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index a31be05601c9..7bdd74c7cb9f 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -416,14 +416,12 @@ static int mtk_iommu_create_mapping(struct device *dev,
 	return 0;
 }
 
-static int mtk_iommu_add_device(struct device *dev)
+static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct dma_iommu_mapping *mtk_mapping;
 	struct of_phandle_args iommu_spec;
 	struct of_phandle_iterator it;
 	struct mtk_iommu_data *data;
-	struct iommu_group *group;
 	int err;
 
 	of_for_each_phandle(&it, err, dev->of_node, "iommus",
@@ -442,35 +440,28 @@ static int mtk_iommu_add_device(struct device *dev)
 	}
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
-		return -ENODEV; /* Not a iommu client device */
+		return ERR_PTR(-ENODEV); /* Not a iommu client device */
 
-	/*
-	 * This is a short-term bodge because the ARM DMA code doesn't
-	 * understand multi-device groups, but we have to call into it
-	 * successfully (and not just rely on a normal IOMMU API attach
-	 * here) in order to set the correct DMA API ops on @dev.
-	 */
-	group = iommu_group_alloc();
-	if (IS_ERR(group))
-		return PTR_ERR(group);
+	data = dev_iommu_priv_get(dev);
 
-	err = iommu_group_add_device(group, dev);
-	iommu_group_put(group);
-	if (err)
-		return err;
+	return &data->iommu;
+}
 
-	data = dev_iommu_priv_get(dev);
+static void mtk_iommu_probe_finalize(struct device *dev)
+{
+	struct dma_iommu_mapping *mtk_mapping;
+	struct mtk_iommu_data *data;
+	int err;
+
+	data        = dev_iommu_priv_get(dev);
 	mtk_mapping = data->dev->archdata.iommu;
-	err = arm_iommu_attach_device(dev, mtk_mapping);
-	if (err) {
-		iommu_group_remove_device(dev);
-		return err;
-	}
 
-	return iommu_device_link(&data->iommu, dev);
+	err = arm_iommu_attach_device(dev, mtk_mapping);
+	if (err)
+		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
 }
 
-static void mtk_iommu_remove_device(struct device *dev)
+static void mtk_iommu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct mtk_iommu_data *data;
@@ -479,9 +470,6 @@ static void mtk_iommu_remove_device(struct device *dev)
 		return;
 
 	data = dev_iommu_priv_get(dev);
-	iommu_device_unlink(&data->iommu, dev);
-
-	iommu_group_remove_device(dev);
 	iommu_fwspec_free(dev);
 }
 
@@ -534,8 +522,10 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.map		= mtk_iommu_map,
 	.unmap		= mtk_iommu_unmap,
 	.iova_to_phys	= mtk_iommu_iova_to_phys,
-	.add_device	= mtk_iommu_add_device,
-	.remove_device	= mtk_iommu_remove_device,
+	.probe_device	= mtk_iommu_probe_device,
+	.probe_finalize = mtk_iommu_probe_finalize,
+	.release_device	= mtk_iommu_release_device,
+	.device_group	= generic_device_group,
 	.pgsize_bitmap	= ~0UL << MT2701_IOMMU_PAGE_SHIFT,
 };
 
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
