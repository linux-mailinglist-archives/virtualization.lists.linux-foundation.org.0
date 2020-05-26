Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DAF1BDDEC
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 15:38:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C04C486AA4;
	Wed, 29 Apr 2020 13:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpGCUgUrCzje; Wed, 29 Apr 2020 13:38:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B1F3D86A92;
	Wed, 29 Apr 2020 13:37:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 969D3C0864;
	Wed, 29 Apr 2020 13:37:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D016C0172;
 Wed, 29 Apr 2020 13:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 89453883F5;
 Wed, 29 Apr 2020 13:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TH4EbFL58LSd; Wed, 29 Apr 2020 13:37:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E4ED1883EB;
 Wed, 29 Apr 2020 13:37:49 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1F089ED8; Wed, 29 Apr 2020 15:37:39 +0200 (CEST)
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
Subject: [PATCH v3 20/34] iommu/virtio: Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:36:58 +0200
Message-Id: <20200429133712.31431-21-joro@8bytes.org>
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

Convert the VirtIO IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/virtio-iommu.c | 41 +++++++++---------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index d5cac4f46ca5..bda300c2a438 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -865,24 +865,23 @@ static struct viommu_dev *viommu_get_by_fwnode(struct fwnode_handle *fwnode)
 	return dev ? dev_to_virtio(dev)->priv : NULL;
 }
 
-static int viommu_add_device(struct device *dev)
+static struct iommu_device *viommu_probe_device(struct device *dev)
 {
 	int ret;
-	struct iommu_group *group;
 	struct viommu_endpoint *vdev;
 	struct viommu_dev *viommu = NULL;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 
 	if (!fwspec || fwspec->ops != &viommu_ops)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	viommu = viommu_get_by_fwnode(fwspec->iommu_fwnode);
 	if (!viommu)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
 	if (!vdev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	vdev->dev = dev;
 	vdev->viommu = viommu;
@@ -896,45 +895,25 @@ static int viommu_add_device(struct device *dev)
 			goto err_free_dev;
 	}
 
-	ret = iommu_device_link(&viommu->iommu, dev);
-	if (ret)
-		goto err_free_dev;
+	return &viommu->iommu;
 
-	/*
-	 * Last step creates a default domain and attaches to it. Everything
-	 * must be ready.
-	 */
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group)) {
-		ret = PTR_ERR(group);
-		goto err_unlink_dev;
-	}
-
-	iommu_group_put(group);
-
-	return PTR_ERR_OR_ZERO(group);
-
-err_unlink_dev:
-	iommu_device_unlink(&viommu->iommu, dev);
 err_free_dev:
 	generic_iommu_put_resv_regions(dev, &vdev->resv_regions);
 	kfree(vdev);
 
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static void viommu_remove_device(struct device *dev)
+static void viommu_release_device(struct device *dev)
 {
-	struct viommu_endpoint *vdev;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct viommu_endpoint *vdev;
 
 	if (!fwspec || fwspec->ops != &viommu_ops)
 		return;
 
 	vdev = dev_iommu_priv_get(dev);
 
-	iommu_group_remove_device(dev);
-	iommu_device_unlink(&vdev->viommu->iommu, dev);
 	generic_iommu_put_resv_regions(dev, &vdev->resv_regions);
 	kfree(vdev);
 }
@@ -960,8 +939,8 @@ static struct iommu_ops viommu_ops = {
 	.unmap			= viommu_unmap,
 	.iova_to_phys		= viommu_iova_to_phys,
 	.iotlb_sync		= viommu_iotlb_sync,
-	.add_device		= viommu_add_device,
-	.remove_device		= viommu_remove_device,
+	.probe_device		= viommu_probe_device,
+	.release_device		= viommu_release_device,
 	.device_group		= viommu_device_group,
 	.get_resv_regions	= viommu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
