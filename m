Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7EB1A140A
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 20:38:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58C6E87D96;
	Tue,  7 Apr 2020 18:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCPtWAjxQKS1; Tue,  7 Apr 2020 18:38:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA7DC87D65;
	Tue,  7 Apr 2020 18:38:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2D99C0177;
	Tue,  7 Apr 2020 18:38:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49D0AC0177;
 Tue,  7 Apr 2020 18:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3562287FB0;
 Tue,  7 Apr 2020 18:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8AE0iJVN2Ill; Tue,  7 Apr 2020 18:38:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 79E6D87EBC;
 Tue,  7 Apr 2020 18:38:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3549360C; Tue,  7 Apr 2020 20:37:53 +0200 (CEST)
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
Subject: [RFC PATCH 26/34] iommu/rockchip: Convert to probe/release_device()
 call-backs
Date: Tue,  7 Apr 2020 20:37:34 +0200
Message-Id: <20200407183742.4344-27-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
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

Convert the Rockchip IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/rockchip-iommu.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index b33cdd5aad81..d25c2486ca07 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1054,40 +1054,28 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 	kfree(rk_domain);
 }
 
-static int rk_iommu_add_device(struct device *dev)
+static struct iommu_device *rk_iommu_probe_device(struct device *dev)
 {
-	struct iommu_group *group;
-	struct rk_iommu *iommu;
 	struct rk_iommudata *data;
+	struct rk_iommu *iommu;
 
 	data = dev->archdata.iommu;
 	if (!data)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	iommu = rk_iommu_from_dev(dev);
 
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-	iommu_group_put(group);
-
-	iommu_device_link(&iommu->iommu, dev);
 	data->link = device_link_add(dev, iommu->dev,
 				     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 
-	return 0;
+	return &iommu->iommu;
 }
 
-static void rk_iommu_remove_device(struct device *dev)
+static void rk_iommu_release_device(struct device *dev)
 {
-	struct rk_iommu *iommu;
 	struct rk_iommudata *data = dev->archdata.iommu;
 
-	iommu = rk_iommu_from_dev(dev);
-
 	device_link_del(data->link);
-	iommu_device_unlink(&iommu->iommu, dev);
-	iommu_group_remove_device(dev);
 }
 
 static struct iommu_group *rk_iommu_device_group(struct device *dev)
@@ -1126,8 +1114,8 @@ static const struct iommu_ops rk_iommu_ops = {
 	.detach_dev = rk_iommu_detach_device,
 	.map = rk_iommu_map,
 	.unmap = rk_iommu_unmap,
-	.add_device = rk_iommu_add_device,
-	.remove_device = rk_iommu_remove_device,
+	.probe_device = rk_iommu_probe_device,
+	.release_device = rk_iommu_release_device,
 	.iova_to_phys = rk_iommu_iova_to_phys,
 	.device_group = rk_iommu_device_group,
 	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
