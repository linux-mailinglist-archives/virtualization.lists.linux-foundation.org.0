Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C1F1A7C6F
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 15:16:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 31F8187A12;
	Tue, 14 Apr 2020 13:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NydnJ1E2zaL2; Tue, 14 Apr 2020 13:16:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88C0D87AAE;
	Tue, 14 Apr 2020 13:16:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 746D5C0172;
	Tue, 14 Apr 2020 13:16:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37740C1D7D;
 Tue, 14 Apr 2020 13:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2358087D14;
 Tue, 14 Apr 2020 13:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IEpSAQi5PygC; Tue, 14 Apr 2020 13:16:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C690487A00;
 Tue, 14 Apr 2020 13:16:01 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9D76E50C; Tue, 14 Apr 2020 15:15:53 +0200 (CEST)
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
Subject: [PATCH v2 12/33] iommu: Move iommu_group_create_direct_mappings() out
 of iommu_group_add_device()
Date: Tue, 14 Apr 2020 15:15:21 +0200
Message-Id: <20200414131542.25608-13-joro@8bytes.org>
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

After the previous changes the iommu group may not have a default
domain when iommu_group_add_device() is called. With no default domain
iommu_group_create_direct_mappings() will do nothing and no direct
mappings will be created.

Rename iommu_group_create_direct_mappings() to
iommu_create_device_direct_mappings() to better reflect that the
function creates direct mappings only for one device and not for all
devices in the group. Then move the call to the places where a default
domain actually exists.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7de0e29db333..834a45da0ed0 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -89,6 +89,8 @@ static int __iommu_attach_group(struct iommu_domain *domain,
 				struct iommu_group *group);
 static void __iommu_detach_group(struct iommu_domain *domain,
 				 struct iommu_group *group);
+static int iommu_create_device_direct_mappings(struct iommu_group *group,
+					       struct device *dev);
 
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
@@ -243,6 +245,8 @@ static int __iommu_probe_device_helper(struct device *dev)
 	if (group->default_domain)
 		ret = __iommu_attach_device(group->default_domain, dev);
 
+	iommu_create_device_direct_mappings(group, dev);
+
 	iommu_group_put(group);
 
 	if (ret)
@@ -263,6 +267,7 @@ static int __iommu_probe_device_helper(struct device *dev)
 int iommu_probe_device(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
+	struct iommu_group *group;
 	int ret;
 
 	WARN_ON(dev->iommu_group);
@@ -285,6 +290,10 @@ int iommu_probe_device(struct device *dev)
 	if (ret)
 		goto err_module_put;
 
+	group = iommu_group_get(dev);
+	iommu_create_device_direct_mappings(group, dev);
+	iommu_group_put(group);
+
 	if (ops->probe_finalize)
 		ops->probe_finalize(dev);
 
@@ -736,8 +745,8 @@ int iommu_group_set_name(struct iommu_group *group, const char *name)
 }
 EXPORT_SYMBOL_GPL(iommu_group_set_name);
 
-static int iommu_group_create_direct_mappings(struct iommu_group *group,
-					      struct device *dev)
+static int iommu_create_device_direct_mappings(struct iommu_group *group,
+					       struct device *dev)
 {
 	struct iommu_domain *domain = group->default_domain;
 	struct iommu_resv_region *entry;
@@ -841,8 +850,6 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 
 	dev->iommu_group = group;
 
-	iommu_group_create_direct_mappings(group, dev);
-
 	mutex_lock(&group->mutex);
 	list_add_tail(&device->list, &group->devices);
 	if (group->domain)
@@ -1736,6 +1743,7 @@ static void probe_alloc_default_domain(struct bus_type *bus,
 		gtype.type = iommu_def_domain_type;
 
 	iommu_group_alloc_default_domain(bus, group, gtype.type);
+
 }
 
 static int iommu_group_do_dma_attach(struct device *dev, void *data)
@@ -1760,6 +1768,21 @@ static int __iommu_group_dma_attach(struct iommu_group *group)
 					  iommu_group_do_dma_attach);
 }
 
+static int iommu_do_create_direct_mappings(struct device *dev, void *data)
+{
+	struct iommu_group *group = data;
+
+	iommu_create_device_direct_mappings(group, dev);
+
+	return 0;
+}
+
+static int iommu_group_create_direct_mappings(struct iommu_group *group)
+{
+	return __iommu_group_for_each_dev(group, group,
+					  iommu_do_create_direct_mappings);
+}
+
 static int bus_iommu_probe(struct bus_type *bus)
 {
 	const struct iommu_ops *ops = bus->iommu_ops;
@@ -1792,6 +1815,8 @@ static int bus_iommu_probe(struct bus_type *bus)
 				continue;
 			}
 
+			iommu_group_create_direct_mappings(group);
+
 			ret = __iommu_group_dma_attach(group);
 
 			mutex_unlock(&group->mutex);
@@ -2632,7 +2657,7 @@ request_default_domain_for_dev(struct device *dev, unsigned long type)
 		iommu_domain_free(group->default_domain);
 	group->default_domain = domain;
 
-	iommu_group_create_direct_mappings(group, dev);
+	iommu_create_device_direct_mappings(group, dev);
 
 	dev_info(dev, "Using iommu %s mapping\n",
 		 type == IOMMU_DOMAIN_DMA ? "dma" : "direct");
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
