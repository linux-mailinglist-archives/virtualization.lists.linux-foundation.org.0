Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 640FD33D94B
	for <lists.virtualization@lfdr.de>; Tue, 16 Mar 2021 17:24:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 513384ECBD;
	Tue, 16 Mar 2021 16:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wj7hEPVe8Av; Tue, 16 Mar 2021 16:24:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id A67624ECF0;
	Tue, 16 Mar 2021 16:24:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4111C0014;
	Tue, 16 Mar 2021 16:24:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6929C000A;
 Tue, 16 Mar 2021 16:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C01E8431A0;
 Tue, 16 Mar 2021 16:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcWIjl2AlqJO; Tue, 16 Mar 2021 16:24:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1893E43003;
 Tue, 16 Mar 2021 16:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nmzQgJQP6/DetTH6ZnA1qw8ORAxBI+pbM/MkV+zmkmM=; b=a9NlqK95hTbckfpKvpR6egtslo
 D5Cs2CPLERcnJMpuvBKT6+Fk9+YpL/guhrXme3vHDBoSsqUDEAH65xtcz9BCAiG/0FFzklTz1vkn8
 /I38qdA9QrRTBss/rIBIYuO832voCNt/UzkX8SwtEFkwKxCzseejM9GPWwHpmshqTNl/O4VzUBTMa
 Se2ssSHLo7rOnuausx/YzYs+UJmnpCYrJoXg3c+kIA7uVwe3V1sCuq6KuPYaIZi4vmGmqdM686sAc
 MuRWyTE65hBd/dO7BGLtvXs+fAbNq6+YI1TNHLmyJHNoqVY0tv1YWgPasuYqJ7ATRO4H0JQwViRw2
 28OvVVwA==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMCTa-000J9w-2k; Tue, 16 Mar 2021 16:23:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 18/18] iommu: remove iommu_domain_{get,set}_attr
Date: Tue, 16 Mar 2021 16:38:24 +0100
Message-Id: <20210316153825.135976-19-hch@lst.de>
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

Remove the now unused iommu attr infrastructure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/iommu.c | 26 --------------------------
 include/linux/iommu.h | 36 ------------------------------------
 2 files changed, 62 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index afd21b37e319ee..d8df26d13c7371 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2662,32 +2662,6 @@ static int __init iommu_init(void)
 }
 core_initcall(iommu_init);
 
-int iommu_domain_get_attr(struct iommu_domain *domain,
-			  enum iommu_attr attr, void *data)
-{
-	if (!domain->ops->domain_get_attr)
-		return -EINVAL;
-	return domain->ops->domain_get_attr(domain, attr, data);
-}
-EXPORT_SYMBOL_GPL(iommu_domain_get_attr);
-
-int iommu_domain_set_attr(struct iommu_domain *domain,
-			  enum iommu_attr attr, void *data)
-{
-	int ret = 0;
-
-	switch (attr) {
-	default:
-		if (domain->ops->domain_set_attr == NULL)
-			return -EINVAL;
-
-		ret = domain->ops->domain_set_attr(domain, attr, data);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(iommu_domain_set_attr);
-
 int iommu_enable_nesting(struct iommu_domain *domain)
 {
 	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index a53d74f2007b14..9319333ca0b827 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -96,20 +96,6 @@ enum iommu_cap {
 	IOMMU_CAP_NOEXEC,		/* IOMMU_NOEXEC flag */
 };
 
-/*
- * Following constraints are specifc to FSL_PAMUV1:
- *  -aperture must be power of 2, and naturally aligned
- *  -number of windows must be power of 2, and address space size
- *   of each window is determined by aperture size / # of windows
- *  -the actual size of the mapped region of a window must be power
- *   of 2 starting with 4KB and physical address must be naturally
- *   aligned.
- */
-
-enum iommu_attr {
-	DOMAIN_ATTR_MAX,
-};
-
 /* These are the possible reserved region types */
 enum iommu_resv_type {
 	/* Memory regions which must be mapped 1:1 at all times */
@@ -191,8 +177,6 @@ struct iommu_iotlb_gather {
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
  *                  group and attached to the groups domain
  * @device_group: find iommu group for a particular device
- * @domain_get_attr: Query domain attributes
- * @domain_set_attr: Change domain attributes
  * @enable_nesting: Enable nesting
  * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
  * @get_resv_regions: Request list of reserved regions for a device
@@ -243,10 +227,6 @@ struct iommu_ops {
 	void (*release_device)(struct device *dev);
 	void (*probe_finalize)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
-	int (*domain_get_attr)(struct iommu_domain *domain,
-			       enum iommu_attr attr, void *data);
-	int (*domain_set_attr)(struct iommu_domain *domain,
-			       enum iommu_attr attr, void *data);
 	int (*enable_nesting)(struct iommu_domain *domain);
 	int (*set_pgtable_quirks)(struct iommu_domain *domain,
 				  unsigned long quirks);
@@ -493,10 +473,6 @@ extern int iommu_page_response(struct device *dev,
 extern int iommu_group_id(struct iommu_group *group);
 extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
 
-extern int iommu_domain_get_attr(struct iommu_domain *domain, enum iommu_attr,
-				 void *data);
-extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
-				 void *data);
 int iommu_enable_nesting(struct iommu_domain *domain);
 int iommu_set_pgtable_quirks(struct iommu_domain *domain,
 		unsigned long quirks);
@@ -869,18 +845,6 @@ static inline int iommu_group_id(struct iommu_group *group)
 	return -ENODEV;
 }
 
-static inline int iommu_domain_get_attr(struct iommu_domain *domain,
-					enum iommu_attr attr, void *data)
-{
-	return -EINVAL;
-}
-
-static inline int iommu_domain_set_attr(struct iommu_domain *domain,
-					enum iommu_attr attr, void *data)
-{
-	return -EINVAL;
-}
-
 static inline int iommu_set_pgtable_quirks(struct iommu_domain *domain,
 		unsigned long quirks)
 {
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
