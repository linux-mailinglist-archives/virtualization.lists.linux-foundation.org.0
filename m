Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 900F61BDDE9
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 15:38:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2C7AF86B2A;
	Wed, 29 Apr 2020 13:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7cCa4oMZWDN; Wed, 29 Apr 2020 13:38:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3786B86A36;
	Wed, 29 Apr 2020 13:37:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25B03C0864;
	Wed, 29 Apr 2020 13:37:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 243D0C0172;
 Wed, 29 Apr 2020 13:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 138F3883F5;
 Wed, 29 Apr 2020 13:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3UAc2zAdVVT8; Wed, 29 Apr 2020 13:37:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7EF54883E0;
 Wed, 29 Apr 2020 13:37:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 49DCAEDB; Wed, 29 Apr 2020 15:37:39 +0200 (CEST)
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
Subject: [PATCH v3 21/34] iommu/msm: Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:36:59 +0200
Message-Id: <20200429133712.31431-22-joro@8bytes.org>
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

Convert the MSM IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/msm_iommu.c | 34 +++++++---------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 94a6df1bddd6..10cd4db0710a 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -388,43 +388,23 @@ static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
 	return ret;
 }
 
-static int msm_iommu_add_device(struct device *dev)
+static struct iommu_device *msm_iommu_probe_device(struct device *dev)
 {
 	struct msm_iommu_dev *iommu;
-	struct iommu_group *group;
 	unsigned long flags;
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
 	iommu = find_iommu_for_dev(dev);
 	spin_unlock_irqrestore(&msm_iommu_lock, flags);
 
-	if (iommu)
-		iommu_device_link(&iommu->iommu, dev);
-	else
-		return -ENODEV;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
+	if (!iommu)
+		return ERR_PTR(-ENODEV);
 
-	return 0;
+	return &iommu->iommu;
 }
 
-static void msm_iommu_remove_device(struct device *dev)
+static void msm_iommu_release_device(struct device *dev)
 {
-	struct msm_iommu_dev *iommu;
-	unsigned long flags;
-
-	spin_lock_irqsave(&msm_iommu_lock, flags);
-	iommu = find_iommu_for_dev(dev);
-	spin_unlock_irqrestore(&msm_iommu_lock, flags);
-
-	if (iommu)
-		iommu_device_unlink(&iommu->iommu, dev);
-
-	iommu_group_remove_device(dev);
 }
 
 static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
@@ -708,8 +688,8 @@ static struct iommu_ops msm_iommu_ops = {
 	 */
 	.iotlb_sync = NULL,
 	.iova_to_phys = msm_iommu_iova_to_phys,
-	.add_device = msm_iommu_add_device,
-	.remove_device = msm_iommu_remove_device,
+	.probe_device = msm_iommu_probe_device,
+	.release_device = msm_iommu_release_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
