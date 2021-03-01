Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F493279A7
	for <lists.virtualization@lfdr.de>; Mon,  1 Mar 2021 09:46:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E493F4304B;
	Mon,  1 Mar 2021 08:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltUVUv3J3zCt; Mon,  1 Mar 2021 08:46:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06DA74304D;
	Mon,  1 Mar 2021 08:46:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07F50C0015;
	Mon,  1 Mar 2021 08:46:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61213C0001;
 Mon,  1 Mar 2021 08:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4241E43005;
 Mon,  1 Mar 2021 08:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3eh4tgNPa2w; Mon,  1 Mar 2021 08:46:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 883A842D1E;
 Mon,  1 Mar 2021 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=FUBvB1oFLssSNf01jTiPQ4VH1FDFn4nF9Rj9/AXGFMM=; b=GOj5zplUkyr3jyiHbrIzvGGnJT
 +ceunoCl6ww4W/jAmxoYNa9qEBoRdLhncC5Mp6u4hbGgqyU1CiMMmf4tY/iy5iRnENcuB1SsctJUg
 ZQ0DJzR2HhmnhGRxbCzoq5Uw0ki1qERm5Hc1ItkNA0nVXohGOJv728F6MuZ4lWuAp+xj9fTkECyO2
 r3nGZhZ+W7zwsu2z3GmzpabxnXBc0oQyqSYSyju2xODbvNRYeAjHN8tO8R4gIYumivBeWfCeV+Oon
 C3G37eBVr8UkF1Cv8DuxLNr7nBMfx/zmCGe8UWFx2Tgm+EN41RXenWU6xWAKAn1Dy5iGf/6Bgyswf
 iNkW6KgQ==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGeAD-00FUb2-Bk; Mon, 01 Mar 2021 08:44:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 07/17] iommu/fsl_pamu: replace DOMAIN_ATTR_FSL_PAMU_STASH with
 a direct call
Date: Mon,  1 Mar 2021 09:42:47 +0100
Message-Id: <20210301084257.945454-8-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301084257.945454-1-hch@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
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
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
