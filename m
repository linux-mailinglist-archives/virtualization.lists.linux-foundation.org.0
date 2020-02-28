Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A9173AC8
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 16:08:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD70986EA8;
	Fri, 28 Feb 2020 15:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NUK8o8Y0dteg; Fri, 28 Feb 2020 15:08:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E04186E07;
	Fri, 28 Feb 2020 15:08:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13862C1D89;
	Fri, 28 Feb 2020 15:08:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A7BCC1D89;
 Fri, 28 Feb 2020 15:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 85AE188183;
 Fri, 28 Feb 2020 15:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r6V4Jn9YPnzI; Fri, 28 Feb 2020 15:08:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1FEDA88180;
 Fri, 28 Feb 2020 15:08:35 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 27BC45BC; Fri, 28 Feb 2020 16:08:30 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 09/14] iommu/arm-smmu: Use accessor functions for iommu
 private data
Date: Fri, 28 Feb 2020 16:08:15 +0100
Message-Id: <20200228150820.15340-10-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
References: <20200228150820.15340-1-joro@8bytes.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Hanjun Guo <guohanjun@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
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

Make use of dev_iommu_priv_set/get() functions and simplify the code
where possible with this change.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/arm-smmu.c | 56 +++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 980aae73b45b..8276fff5f7dc 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -98,12 +98,15 @@ struct arm_smmu_master_cfg {
 	s16				smendx[];
 };
 #define INVALID_SMENDX			-1
-#define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
-#define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
-#define fwspec_smendx(fw, i) \
-	(i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
-#define for_each_cfg_sme(fw, i, idx) \
-	for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
+#define __fwspec_cfg(dev) ((struct arm_smmu_master_cfg *)dev_iommu_priv_get(dev))
+#define fwspec_smmu(dev)  (__fwspec_cfg(dev)->smmu)
+#define fwspec_smendx(dev, i)				\
+	(i >= dev_iommu_fwspec_get(dev)->num_ids ?	\
+		INVALID_SMENDX :			\
+		__fwspec_cfg(dev)->smendx[i])
+#define for_each_cfg_sme(dev, i, idx) \
+	for (i = 0; idx = fwspec_smendx(dev, i), \
+	     i < dev_iommu_fwspec_get(dev)->num_ids; ++i)
 
 static bool using_legacy_binding, using_generic_binding;
 
@@ -1061,7 +1064,7 @@ static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
 static int arm_smmu_master_alloc_smes(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
 	struct arm_smmu_device *smmu = cfg->smmu;
 	struct arm_smmu_smr *smrs = smmu->smrs;
 	struct iommu_group *group;
@@ -1069,7 +1072,7 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 
 	mutex_lock(&smmu->stream_map_mutex);
 	/* Figure out a viable stream map entry allocation */
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 		u16 mask = FIELD_GET(ARM_SMMU_SMR_MASK, fwspec->ids[i]);
 
@@ -1100,7 +1103,7 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	iommu_group_put(group);
 
 	/* It worked! Now, poke the actual hardware */
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		arm_smmu_write_sme(smmu, idx);
 		smmu->s2crs[idx].group = group;
 	}
@@ -1117,14 +1120,14 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	return ret;
 }
 
-static void arm_smmu_master_free_smes(struct iommu_fwspec *fwspec)
+static void arm_smmu_master_free_smes(struct device *dev)
 {
-	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
-	struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = fwspec_smmu(dev);
 	int i, idx;
 
 	mutex_lock(&smmu->stream_map_mutex);
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		if (arm_smmu_free_sme(smmu, idx))
 			arm_smmu_write_sme(smmu, idx);
 		cfg->smendx[i] = INVALID_SMENDX;
@@ -1133,7 +1136,7 @@ static void arm_smmu_master_free_smes(struct iommu_fwspec *fwspec)
 }
 
 static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
-				      struct iommu_fwspec *fwspec)
+				      struct device *dev)
 {
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
@@ -1146,7 +1149,7 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	else
 		type = S2CR_TYPE_TRANS;
 
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		if (type == s2cr[idx].type && cbndx == s2cr[idx].cbndx)
 			continue;
 
@@ -1160,10 +1163,10 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
-	int ret;
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct arm_smmu_device *smmu;
-	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	int ret;
 
 	if (!fwspec || fwspec->ops != &arm_smmu_ops) {
 		dev_err(dev, "cannot attach to SMMU, is it on the same bus?\n");
@@ -1177,10 +1180,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	 * domains, just say no (but more politely than by dereferencing NULL).
 	 * This should be at least a WARN_ON once that's sorted.
 	 */
-	if (!fwspec->iommu_priv)
+	if (!dev_iommu_priv_get(dev))
 		return -ENODEV;
 
-	smmu = fwspec_smmu(fwspec);
+	smmu = fwspec_smmu(dev);
 
 	ret = arm_smmu_rpm_get(smmu);
 	if (ret < 0)
@@ -1204,7 +1207,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	}
 
 	/* Looks ok, so add the device to the domain */
-	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
+	ret = arm_smmu_domain_add_master(smmu_domain, dev);
 
 	/*
 	 * Setup an autosuspend delay to avoid bouncing runpm state.
@@ -1429,7 +1432,7 @@ static int arm_smmu_add_device(struct device *dev)
 		goto out_free;
 
 	cfg->smmu = smmu;
-	fwspec->iommu_priv = cfg;
+	dev_iommu_priv_set(dev, cfg);
 	while (i--)
 		cfg->smendx[i] = INVALID_SMENDX;
 
@@ -1467,7 +1470,7 @@ static void arm_smmu_remove_device(struct device *dev)
 	if (!fwspec || fwspec->ops != &arm_smmu_ops)
 		return;
 
-	cfg  = fwspec->iommu_priv;
+	cfg  = dev_iommu_priv_get(dev);
 	smmu = cfg->smmu;
 
 	ret = arm_smmu_rpm_get(smmu);
@@ -1475,23 +1478,22 @@ static void arm_smmu_remove_device(struct device *dev)
 		return;
 
 	iommu_device_unlink(&smmu->iommu, dev);
-	arm_smmu_master_free_smes(fwspec);
+	arm_smmu_master_free_smes(dev);
 
 	arm_smmu_rpm_put(smmu);
 
 	iommu_group_remove_device(dev);
-	kfree(fwspec->iommu_priv);
 	iommu_fwspec_free(dev);
+	kfree(cfg);
 }
 
 static struct iommu_group *arm_smmu_device_group(struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
+	struct arm_smmu_device *smmu = fwspec_smmu(dev);
 	struct iommu_group *group = NULL;
 	int i, idx;
 
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		if (group && smmu->s2crs[idx].group &&
 		    group != smmu->s2crs[idx].group)
 			return ERR_PTR(-EINVAL);
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
