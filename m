Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 401951A3377
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 13:46:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD89D86B16;
	Thu,  9 Apr 2020 11:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6P_n0tmDj7aZ; Thu,  9 Apr 2020 11:46:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ABAA186B31;
	Thu,  9 Apr 2020 11:46:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A679C0177;
	Thu,  9 Apr 2020 11:46:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F178EC0177;
 Thu,  9 Apr 2020 11:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ECA87879A5;
 Thu,  9 Apr 2020 11:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JTNLJWgFvbC; Thu,  9 Apr 2020 11:46:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C36E986101;
 Thu,  9 Apr 2020 11:46:28 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 60A51398; Thu,  9 Apr 2020 13:46:25 +0200 (CEST)
Date: Thu, 9 Apr 2020 13:46:20 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] iommu/exynos: Get rid of 'struct exynos_iommu_owner'
 exynos_iommu_owner
Message-ID: <20200409114620.GA16298@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
 <CGME20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82@eucas1p2.samsung.com>
 <20200407183742.4344-32-joro@8bytes.org>
 <449e7f16-e719-9617-ec92-63b82c0bc33f@samsung.com>
 <f59b0bb3-8c08-9cc9-bb1a-e69b7b226f60@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f59b0bb3-8c08-9cc9-bb1a-e69b7b226f60@samsung.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
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

Hi Marek,

I had some more thoughts and discussions with Robin about how to make
this work with the Exynos driver. The result is the patch below, can you
please test it and report back? Even better if you can fix up any
breakage it might cause :)

From 60a288509baa34df6a0bf437c977925a0a617c72 Mon Sep 17 00:00:00 2001
From: Joerg Roedel <jroedel@suse.de>
Date: Thu, 9 Apr 2020 13:38:18 +0200
Subject: [PATCH] iommu/exynos: Get rid of 'struct exynos_iommu_owner'

Remove 'struct exynos_iommu_owner' and replace it with a single-linked
list of 'struct sysmmu_drvdata'. The first item in the list acts as a
replacement for the previous exynos_iommu_owner structure. The
iommu_device member of the first list item is reported to the IOMMU
core code for the master device.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/exynos-iommu.c | 155 ++++++++++++++++++++---------------
 1 file changed, 88 insertions(+), 67 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 186ff5cc975c..e70eb360093f 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -225,18 +225,6 @@ static const struct sysmmu_fault_info sysmmu_v5_faults[] = {
 	{ 20, REG_V5_FAULT_AW_VA, "AW SECURITY PROTECTION", IOMMU_FAULT_WRITE },
 };
 
-/*
- * This structure is attached to dev.archdata.iommu of the master device
- * on device add, contains a list of SYSMMU controllers defined by device tree,
- * which are bound to given master device. It is usually referenced by 'owner'
- * pointer.
-*/
-struct exynos_iommu_owner {
-	struct list_head controllers;	/* list of sysmmu_drvdata.owner_node */
-	struct iommu_domain *domain;	/* domain this device is attached */
-	struct mutex rpm_lock;		/* for runtime pm of all sysmmus */
-};
-
 /*
  * This structure exynos specific generalization of struct iommu_domain.
  * It contains list of SYSMMU controllers from all master devices, which has
@@ -271,13 +259,23 @@ struct sysmmu_drvdata {
 	bool active;			/* current status */
 	struct exynos_iommu_domain *domain; /* domain we belong to */
 	struct list_head domain_node;	/* node for domain clients list */
-	struct list_head owner_node;	/* node for owner controllers list */
+	struct sysmmu_drvdata *next;	/* Single-linked list to group SMMUs for
+					   one master. NULL means not in any
+					   list, ERR_PTR(-ENODEV) means end of
+					   list */
+	struct mutex rpm_lock;		/* for runtime pm of all sysmmus */
 	phys_addr_t pgtable;		/* assigned page table structure */
 	unsigned int version;		/* our version */
 
 	struct iommu_device iommu;	/* IOMMU core handle */
 };
 
+/* Helper to iterate over all SYSMMUs for a given platform device */
+#define for_each_sysmmu(dev, drvdata)			\
+	for (drvdata = (dev)->archdata.iommu;		\
+	     drvdata != ERR_PTR(-ENODEV);		\
+	     drvdata = drvdata->next)
+
 static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
 {
 	return container_of(dom, struct exynos_iommu_domain, domain);
@@ -624,6 +622,8 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	data->sysmmu = dev;
 	spin_lock_init(&data->lock);
+	data->next = NULL;
+	mutex_init(&data->rpm_lock);
 
 	ret = iommu_device_sysfs_add(&data->iommu, &pdev->dev, NULL,
 				     dev_name(data->sysmmu));
@@ -668,17 +668,20 @@ static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
 {
 	struct sysmmu_drvdata *data = dev_get_drvdata(dev);
 	struct device *master = data->master;
+	struct sysmmu_drvdata *master_data;
 
-	if (master) {
-		struct exynos_iommu_owner *owner = master->archdata.iommu;
+	if (!master)
+		return 0;
 
-		mutex_lock(&owner->rpm_lock);
-		if (data->domain) {
-			dev_dbg(data->sysmmu, "saving state\n");
-			__sysmmu_disable(data);
-		}
-		mutex_unlock(&owner->rpm_lock);
+	master_data = master->archdata.iommu;
+
+	mutex_lock(&master_data->rpm_lock);
+	if (data->domain) {
+		dev_dbg(data->sysmmu, "saving state\n");
+		__sysmmu_disable(data);
 	}
+	mutex_unlock(&master_data->rpm_lock);
+
 	return 0;
 }
 
@@ -686,17 +689,20 @@ static int __maybe_unused exynos_sysmmu_resume(struct device *dev)
 {
 	struct sysmmu_drvdata *data = dev_get_drvdata(dev);
 	struct device *master = data->master;
+	struct sysmmu_drvdata *master_data;
 
-	if (master) {
-		struct exynos_iommu_owner *owner = master->archdata.iommu;
+	if (!master)
+		return 0;
 
-		mutex_lock(&owner->rpm_lock);
-		if (data->domain) {
-			dev_dbg(data->sysmmu, "restoring state\n");
-			__sysmmu_enable(data);
-		}
-		mutex_unlock(&owner->rpm_lock);
+	master_data = master->archdata.iommu;
+
+	mutex_lock(&master_data->rpm_lock);
+	if (data->domain) {
+		dev_dbg(data->sysmmu, "restoring state\n");
+		__sysmmu_enable(data);
 	}
+	mutex_unlock(&master_data->rpm_lock);
+
 	return 0;
 }
 
@@ -834,21 +840,21 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
 	kfree(domain);
 }
 
-static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
-				    struct device *dev)
+static void __exynos_iommu_detach_device(struct exynos_iommu_domain *domain,
+					 struct device *dev)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
-	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
 	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
-	struct sysmmu_drvdata *data, *next;
+	struct sysmmu_drvdata *dev_data, *data, *next;
 	unsigned long flags;
 
-	if (!has_sysmmu(dev) || owner->domain != iommu_domain)
+	dev_data = dev->archdata.iommu;
+
+	if (!has_sysmmu(dev) || dev_data->domain != domain)
 		return;
 
-	mutex_lock(&owner->rpm_lock);
+	mutex_lock(&dev_data->rpm_lock);
 
-	list_for_each_entry(data, &owner->controllers, owner_node) {
+	for_each_sysmmu(dev, data) {
 		pm_runtime_get_noresume(data->sysmmu);
 		if (pm_runtime_active(data->sysmmu))
 			__sysmmu_disable(data);
@@ -863,51 +869,59 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
 		list_del_init(&data->domain_node);
 		spin_unlock(&data->lock);
 	}
-	owner->domain = NULL;
 	spin_unlock_irqrestore(&domain->lock, flags);
 
-	mutex_unlock(&owner->rpm_lock);
+	mutex_unlock(&dev_data->rpm_lock);
 
 	dev_dbg(dev, "%s: Detached IOMMU with pgtable %pa\n", __func__,
 		&pagetable);
 }
 
+static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
+				       struct device *dev)
+{
+	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
+
+	__exynos_iommu_detach_device(domain, dev);
+}
+
 static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
 				   struct device *dev)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
-	struct sysmmu_drvdata *data;
+	struct sysmmu_drvdata *dev_data, *data;
 	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
 	unsigned long flags;
 
 	if (!has_sysmmu(dev))
 		return -ENODEV;
 
-	if (owner->domain)
-		exynos_iommu_detach_device(owner->domain, dev);
+	dev_data = dev->archdata.iommu;
 
-	mutex_lock(&owner->rpm_lock);
+	if (dev_data->domain)
+		__exynos_iommu_detach_device(dev_data->domain, dev);
+
+	mutex_lock(&dev_data->rpm_lock);
 
 	spin_lock_irqsave(&domain->lock, flags);
-	list_for_each_entry(data, &owner->controllers, owner_node) {
+	for_each_sysmmu(dev, data) {
 		spin_lock(&data->lock);
 		data->pgtable = pagetable;
 		data->domain = domain;
 		list_add_tail(&data->domain_node, &domain->clients);
 		spin_unlock(&data->lock);
 	}
-	owner->domain = iommu_domain;
 	spin_unlock_irqrestore(&domain->lock, flags);
 
-	list_for_each_entry(data, &owner->controllers, owner_node) {
+
+	for_each_sysmmu(dev, data) {
 		pm_runtime_get_noresume(data->sysmmu);
 		if (pm_runtime_active(data->sysmmu))
 			__sysmmu_enable(data);
 		pm_runtime_put(data->sysmmu);
 	}
 
-	mutex_unlock(&owner->rpm_lock);
+	mutex_unlock(&dev_data->rpm_lock);
 
 	dev_dbg(dev, "%s: Attached IOMMU with pgtable %pa\n", __func__,
 		&pagetable);
@@ -1237,7 +1251,6 @@ static phys_addr_t exynos_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 
 static int exynos_iommu_add_device(struct device *dev)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct sysmmu_drvdata *data;
 	struct iommu_group *group;
 
@@ -1249,7 +1262,7 @@ static int exynos_iommu_add_device(struct device *dev)
 	if (IS_ERR(group))
 		return PTR_ERR(group);
 
-	list_for_each_entry(data, &owner->controllers, owner_node) {
+	for_each_sysmmu(dev, data) {
 		/*
 		 * SYSMMU will be runtime activated via device link
 		 * (dependency) to its master device, so there are no
@@ -1261,37 +1274,39 @@ static int exynos_iommu_add_device(struct device *dev)
 	}
 	iommu_group_put(group);
 
+	data = dev->archdata.iommu;
+	iommu_device_link(&data->iommu, dev);
+
 	return 0;
 }
 
 static void exynos_iommu_remove_device(struct device *dev)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
-	struct sysmmu_drvdata *data;
+	struct sysmmu_drvdata *data = dev->archdata.iommu;
 
 	if (!has_sysmmu(dev))
 		return;
 
-	if (owner->domain) {
+	if (data->domain) {
 		struct iommu_group *group = iommu_group_get(dev);
 
 		if (group) {
-			WARN_ON(owner->domain !=
+			WARN_ON(&data->domain->domain !=
 				iommu_group_default_domain(group));
-			exynos_iommu_detach_device(owner->domain, dev);
+			__exynos_iommu_detach_device(data->domain, dev);
 			iommu_group_put(group);
 		}
 	}
+	iommu_device_unlink(&data->iommu, dev);
 	iommu_group_remove_device(dev);
 
-	list_for_each_entry(data, &owner->controllers, owner_node)
+	for_each_sysmmu(dev, data)
 		device_link_del(data->link);
 }
 
 static int exynos_iommu_of_xlate(struct device *dev,
 				 struct of_phandle_args *spec)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct platform_device *sysmmu = of_find_device_by_node(spec->np);
 	struct sysmmu_drvdata *data, *entry;
 
@@ -1302,22 +1317,28 @@ static int exynos_iommu_of_xlate(struct device *dev,
 	if (!data)
 		return -ENODEV;
 
-	if (!owner) {
-		owner = kzalloc(sizeof(*owner), GFP_KERNEL);
-		if (!owner)
-			return -ENOMEM;
+	data->master = dev;
 
-		INIT_LIST_HEAD(&owner->controllers);
-		mutex_init(&owner->rpm_lock);
-		dev->archdata.iommu = owner;
+	if (!dev->archdata.iommu) {
+		WARN_ON(data->next != NULL);
+
+		/* SYSMMU list is empty - add drvdata and return */
+		data->next = ERR_PTR(-ENODEV);
+		dev->archdata.iommu = data;
+
+		return 0;
 	}
 
-	list_for_each_entry(entry, &owner->controllers, owner_node)
+	/* Check if SYSMMU is already in the list */
+	for_each_sysmmu(dev, entry)
 		if (entry == data)
 			return 0;
 
-	list_add_tail(&data->owner_node, &owner->controllers);
-	data->master = dev;
+	/* Not in the list yet */
+	WARN_ON(data->next != NULL);
+	entry = dev->archdata.iommu;
+	data->next  = entry->next;
+	entry->next = data;
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
