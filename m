Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D23817E1AE7
	for <lists.virtualization@lfdr.de>; Mon,  6 Nov 2023 08:14:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F5A341E31;
	Mon,  6 Nov 2023 07:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F5A341E31
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FDDD+bqu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oPzxuDNE310r; Mon,  6 Nov 2023 07:14:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 03E2F41DE9;
	Mon,  6 Nov 2023 07:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03E2F41DE9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EDD7C008C;
	Mon,  6 Nov 2023 07:14:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96784C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Nov 2023 07:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 720ED61043
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Nov 2023 07:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 720ED61043
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=FDDD+bqu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGFk7Ia9fg3P
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Nov 2023 07:14:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2F0B61038
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Nov 2023 07:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F0B61038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699254849; x=1730790849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AMX3QyiSsHY62hL/1ZifmtDUB3BOUarR8RpIWdZzzu4=;
 b=FDDD+bquOdN9x9TArfJUiGpReYtymTnUV90mF95hYEZLClkSsEVGfJ7N
 PF33sL4AvuZ2olIVqSJVdWzNmwPl+0tkNRV4ZWpBVS5sJJ3rQfcQ/R3kE
 XD4UyKV5PSC22a4W6JzT/iOOi7r9II/JYVS/r3i0OJw8kJoZS1HHjTE0T
 JPhedcIZa6wJgf0v+wqEnF0MLW/YkcgKq+07dqhtm880kVI8f5FqniFpH
 6nKReK6cL8V8/zwUgDVm/sxX81PGBauo+CCZvA8We6UDWopLEK3UaKLZt
 PegyURF0zzxfvNCDUr0Sn80WH+xOTU1S+Iv0WNgXbdOZqmYRJll4YR9jq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="10759069"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="10759069"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 23:14:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1093690901"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="1093690901"
Received: from sqa-gate.sh.intel.com (HELO localhost.localdomain)
 ([10.239.48.212])
 by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2023 23:14:05 -0800
From: Tina Zhang <tina.zhang@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 joro@8bytes.org, will@kernel.org, Yi Liu <yi.l.liu@intel.com>
Subject: [RFC PATCH 4/5] iommu/vt-d: Adapt alloc_pgtable interface to be used
 by others
Date: Mon,  6 Nov 2023 02:12:25 -0500
Message-Id: <20231106071226.9656-5-tina.zhang@intel.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231106071226.9656-1-tina.zhang@intel.com>
References: <20231106071226.9656-1-tina.zhang@intel.com>
MIME-Version: 1.0
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

The generic IO page table framework provides a set of interfaces for
invoking IO page table operations. Other entity (e.g., virtio-iommu
driver) can use the interface to ask VT-d driver to generate a VT-d
format IO page table. This patch adds the support.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/iommu/intel/iommu.c | 69 +++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 80bd1993861c..d714e780a031 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5248,17 +5248,80 @@ static phys_addr_t pgtable_iova_to_phys(struct io_pgtable_ops *ops,
 	return intel_iommu_iova_to_phys(&dmar_domain->domain, iova);
 }
 
+static void __iommu_calculate_cfg(struct io_pgtable_cfg *cfg)
+{
+	unsigned long fl_sagaw, sl_sagaw, sagaw;
+	int agaw, addr_width;
+
+	fl_sagaw = BIT(2) | (cap_fl5lp_support(cfg->vtd_cfg.cap_reg) ? BIT(3) : 0);
+	sl_sagaw = cap_sagaw(cfg->vtd_cfg.cap_reg);
+	sagaw = fl_sagaw & sl_sagaw;
+
+	for (agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH); agaw >= 0; agaw--) {
+		if (test_bit(agaw, &sagaw))
+			break;
+	}
+
+	addr_width = agaw_to_width(agaw);
+	if (cfg->ias > addr_width)
+		cfg->ias = addr_width;
+	if (cfg->oas != addr_width)
+		cfg->oas = addr_width;
+}
+
 static struct io_pgtable *alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 {
-	struct dmar_io_pgtable *pgtable = io_pgtable_cfg_to_dmar_pgtable(cfg);
+	struct dmar_io_pgtable *pgtable;
+	struct dmar_domain *domain;
+	int adjust_width;
+
+	/* Platform must have nested translation support */
+	if (!ecap_nest(cfg->vtd_cfg.ecap_reg))
+		return NULL;
+
+	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return NULL;
+
+	domain->nid = NUMA_NO_NODE;
+	domain->use_first_level = true;
+	domain->has_iotlb_device = false;
+	INIT_LIST_HEAD(&domain->devices);
+	spin_lock_init(&domain->lock);
+	xa_init(&domain->iommu_array);
+
+	/* calculate AGAW */
+	__iommu_calculate_cfg(cfg);
+	domain->gaw = cfg->ias;
+	adjust_width = guestwidth_to_adjustwidth(domain->gaw);
+	domain->agaw = width_to_agaw(adjust_width);
+
+	domain->iommu_coherency = ecap_smpwc(cfg->vtd_cfg.ecap_reg);
+	domain->force_snooping = true;
+	domain->iommu_superpage = cap_fl1gp_support(cfg->vtd_cfg.ecap_reg) ? 2 : 1;
+	domain->max_addr = 0;
+
+	cfg->coherent_walk = domain->iommu_coherency;
+
+	pgtable = &domain->dmar_iop;
 
+	/* always allocate the top pgd */
+	domain->pgd = alloc_pgtable_page(domain->nid, GFP_KERNEL);
+	if (!domain->pgd)
+		goto out_free_domain;
+	domain_flush_cache(domain, domain->pgd, PAGE_SIZE);
+
+	cfg->virt.pgd = virt_to_phys(domain->pgd);
+	cfg->tlb = &flush_ops;
 	pgtable->iop.ops.map_pages = pgtable_map_pages;
 	pgtable->iop.ops.unmap_pages = pgtable_unmap_pages;
 	pgtable->iop.ops.iova_to_phys = pgtable_iova_to_phys;
 
-	cfg->tlb = &flush_ops;
-
 	return &pgtable->iop;
+
+out_free_domain:
+	kfree(domain);
+	return NULL;
 }
 
 struct io_pgtable_init_fns io_pgtable_intel_iommu_init_fns = {
-- 
2.39.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
