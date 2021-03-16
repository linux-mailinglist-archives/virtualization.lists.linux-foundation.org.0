Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6433D873
	for <lists.virtualization@lfdr.de>; Tue, 16 Mar 2021 16:58:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 196A14ED55;
	Tue, 16 Mar 2021 15:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vW9xuqtWBHPE; Tue, 16 Mar 2021 15:58:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3B34EDA7;
	Tue, 16 Mar 2021 15:58:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64B5CC0014;
	Tue, 16 Mar 2021 15:58:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A013EC000A;
 Tue, 16 Mar 2021 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7774A4ECBD;
 Tue, 16 Mar 2021 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOkHFX51Xglt; Tue, 16 Mar 2021 15:58:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FE844EBF4;
 Tue, 16 Mar 2021 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=WykN97GFoYaI2/MNA4ANW/KKbuSWwl6XkcooSZ4pRxM=; b=ug/gIiUIdX7+osJlZWh40YMcX/
 iQ0UYO2hhiK7BwVQk2EZ8ad58VmwHLJzs3vzESCoAIdpgvGCMNuKwSgB5KWxIB1C1yzqN+kNpimO2
 ouTBP/LImpHpKur0We4Db8DzESP/eSbznq9b8bhETivR6F4MgKD90rToD7X3vpc7bS5Y/BcytnT8V
 9Ej5sCS+0uOQVzR8xF1JdJM3YHVfxKiYrew0mC7C7PxkvqJqqTGZxrBLs20G7a5t7XrbCmGKYRrs8
 g1OXJbA1J+zO0LXTFPrv1e19hGjCTTDNKpJQjBKS5K5RMaHrgDqFIMNfinXjga7cT5hxp61YQrb4n
 2AkN1gHg==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMC4Z-000Gov-Oc; Tue, 16 Mar 2021 15:57:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 07/18] iommu/fsl_pamu: replace DOMAIN_ATTR_FSL_PAMU_STASH with
 a direct call
Date: Tue, 16 Mar 2021 16:38:13 +0100
Message-Id: <20210316153825.135976-8-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316153825.135976-1-hch@lst.de>
References: <20210316153825.135976-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
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

Add a fsl_pamu_configure_l1_stash API that qman_portal can call directly
instead of indirecting through the iommu attr API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 arch/powerpc/include/asm/fsl_pamu_stash.h | 12 +++---------
 drivers/iommu/fsl_pamu_domain.c           | 16 +++-------------
 drivers/iommu/fsl_pamu_domain.h           |  2 --
 drivers/soc/fsl/qbman/qman_portal.c       | 18 +++---------------
 include/linux/iommu.h                     |  1 -
 5 files changed, 9 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/include/asm/fsl_pamu_stash.h b/arch/powerpc/include/asm/fsl_pamu_stash.h
index 30a31ad2123d86..c0fbadb70b5dad 100644
--- a/arch/powerpc/include/asm/fsl_pamu_stash.h
+++ b/arch/powerpc/include/asm/fsl_pamu_stash.h
@@ -7,6 +7,8 @@
 #ifndef __FSL_PAMU_STASH_H
 #define __FSL_PAMU_STASH_H
 
+struct iommu_domain;
+
 /* cache stash targets */
 enum pamu_stash_target {
 	PAMU_ATTR_CACHE_L1 = 1,
@@ -14,14 +16,6 @@ enum pamu_stash_target {
 	PAMU_ATTR_CACHE_L3,
 };
 
-/*
- * This attribute allows configuring stashig specific parameters
- * in the PAMU hardware.
- */
-
-struct pamu_stash_attribute {
-	u32	cpu;	/* cpu number */
-	u32	cache;	/* cache to stash to: L1,L2,L3 */
-};
+int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu);
 
 #endif  /* __FSL_PAMU_STASH_H */
diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index fd2bc88b690465..40eff4b7bc5d42 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -372,27 +372,20 @@ static void fsl_pamu_detach_device(struct iommu_domain *domain,
 }
 
 /* Set the domain stash attribute */
-static int configure_domain_stash(struct fsl_dma_domain *dma_domain, void *data)
+int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
 {
-	struct pamu_stash_attribute *stash_attr = data;
+	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
 	unsigned long flags;
 	int ret;
 
 	spin_lock_irqsave(&dma_domain->domain_lock, flags);
-
-	memcpy(&dma_domain->dma_stash, stash_attr,
-	       sizeof(struct pamu_stash_attribute));
-
-	dma_domain->stash_id = get_stash_id(stash_attr->cache,
-					    stash_attr->cpu);
+	dma_domain->stash_id = get_stash_id(PAMU_ATTR_CACHE_L1, cpu);
 	if (dma_domain->stash_id == ~(u32)0) {
 		pr_debug("Invalid stash attributes\n");
 		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
 		return -EINVAL;
 	}
-
 	ret = update_domain_stash(dma_domain, dma_domain->stash_id);
-
 	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
 
 	return ret;
@@ -426,9 +419,6 @@ static int fsl_pamu_set_domain_attr(struct iommu_domain *domain,
 	int ret = 0;
 
 	switch (attr_type) {
-	case DOMAIN_ATTR_FSL_PAMU_STASH:
-		ret = configure_domain_stash(dma_domain, data);
-		break;
 	case DOMAIN_ATTR_FSL_PAMU_ENABLE:
 		ret = configure_domain_dma_state(dma_domain, *(int *)data);
 		break;
diff --git a/drivers/iommu/fsl_pamu_domain.h b/drivers/iommu/fsl_pamu_domain.h
index 13ee06e0ef0136..cd488004acd1b3 100644
--- a/drivers/iommu/fsl_pamu_domain.h
+++ b/drivers/iommu/fsl_pamu_domain.h
@@ -22,9 +22,7 @@ struct fsl_dma_domain {
 	 *
 	 */
 	int				enabled;
-	/* stash_id obtained from the stash attribute details */
 	u32				stash_id;
-	struct pamu_stash_attribute	dma_stash;
 	u32				snoop_id;
 	struct iommu_domain		iommu_domain;
 	spinlock_t			domain_lock;
diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index 9ee1663f422cbf..798b3a1ffd0b9c 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -47,7 +47,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 #ifdef CONFIG_FSL_PAMU
 	struct device *dev = pcfg->dev;
 	int window_count = 1;
-	struct pamu_stash_attribute stash_attr;
 	int ret;
 
 	pcfg->iommu_domain = iommu_domain_alloc(&platform_bus_type);
@@ -55,13 +54,9 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 		dev_err(dev, "%s(): iommu_domain_alloc() failed", __func__);
 		goto no_iommu;
 	}
-	stash_attr.cpu = cpu;
-	stash_attr.cache = PAMU_ATTR_CACHE_L1;
-	ret = iommu_domain_set_attr(pcfg->iommu_domain,
-				    DOMAIN_ATTR_FSL_PAMU_STASH,
-				    &stash_attr);
+	ret = fsl_pamu_configure_l1_stash(pcfg->iommu_domain, cpu);
 	if (ret < 0) {
-		dev_err(dev, "%s(): iommu_domain_set_attr() = %d",
+		dev_err(dev, "%s(): fsl_pamu_configure_l1_stash() = %d",
 			__func__, ret);
 		goto out_domain_free;
 	}
@@ -143,15 +138,8 @@ static void qman_portal_update_sdest(const struct qm_portal_config *pcfg,
 							unsigned int cpu)
 {
 #ifdef CONFIG_FSL_PAMU /* TODO */
-	struct pamu_stash_attribute stash_attr;
-	int ret;
-
 	if (pcfg->iommu_domain) {
-		stash_attr.cpu = cpu;
-		stash_attr.cache = PAMU_ATTR_CACHE_L1;
-		ret = iommu_domain_set_attr(pcfg->iommu_domain,
-				DOMAIN_ATTR_FSL_PAMU_STASH, &stash_attr);
-		if (ret < 0) {
+		if (fsl_pamu_configure_l1_stash(pcfg->iommu_domain, cpu) < 0) {
 			dev_err(pcfg->dev,
 				"Failed to update pamu stash setting\n");
 			return;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index f7baa81887a8bc..208e570e8d99e7 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -109,7 +109,6 @@ enum iommu_cap {
 enum iommu_attr {
 	DOMAIN_ATTR_GEOMETRY,
 	DOMAIN_ATTR_PAGING,
-	DOMAIN_ATTR_FSL_PAMU_STASH,
 	DOMAIN_ATTR_FSL_PAMU_ENABLE,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
