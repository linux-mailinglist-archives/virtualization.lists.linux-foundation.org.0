Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E90743279B9
	for <lists.virtualization@lfdr.de>; Mon,  1 Mar 2021 09:47:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B094F092;
	Mon,  1 Mar 2021 08:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bAgzC4F3Cbfy; Mon,  1 Mar 2021 08:47:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9D5B4F11B;
	Mon,  1 Mar 2021 08:47:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07843C0015;
	Mon,  1 Mar 2021 08:47:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9A31C0001;
 Mon,  1 Mar 2021 08:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 996EB43021;
 Mon,  1 Mar 2021 08:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAfGnpIL36OJ; Mon,  1 Mar 2021 08:47:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E647D42D1E;
 Mon,  1 Mar 2021 08:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xW3e/be0EWhcIVogSADJb6O7B/1UPJRMXZ1DHw7XToM=; b=DRyzqUvjLicdwyE1oaGJikVtBy
 aQDPW4RFib9iRVgCqH8O0asS8IXpzN1MHH3K1Lvt8ETu7k4NVb5fAeiqi+A1+q+gYgPxLjm2YcMEf
 zT+89mwG7MzZM59zy8lUpzNOFJBMeeXnAThdQsqWq1PfoWdcKEvQtvDb3zYowx/cXkI88HzFrnsX5
 b8tsOZx/4tAadAZuCY2pz9vC4gXg8gxRwyD72KPNVew+ScbpQxFgXIoEJSS+mVPMOmOBIxWnXQ7RQ
 tHCO/aZYKICm7c98vq7zV0y9eNRU0OKizoSsJUb1IYcwhG26q0Vb6JO70tamcp1BQHo5CYNqQtZcG
 kknH2w5g==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGeBL-00FUjk-Ir; Mon, 01 Mar 2021 08:45:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 09/17] iommu/fsl_pamu: merge handle_attach_device into
 fsl_pamu_attach_device
Date: Mon,  1 Mar 2021 09:42:49 +0100
Message-Id: <20210301084257.945454-10-hch@lst.de>
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

No good reason to split this functionality over two functions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/fsl_pamu_domain.c | 59 +++++++++++----------------------
 1 file changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 4a4944332674f7..962cdc1a4a1924 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -240,45 +240,13 @@ static int update_domain_stash(struct fsl_dma_domain *dma_domain, u32 val)
 	return ret;
 }
 
-/*
- * Attach the LIODN to the DMA domain and configure the geometry
- * and window mappings.
- */
-static int handle_attach_device(struct fsl_dma_domain *dma_domain,
-				struct device *dev, const u32 *liodn,
-				int num)
-{
-	unsigned long flags;
-	int ret = 0;
-	int i;
-
-	spin_lock_irqsave(&dma_domain->domain_lock, flags);
-	for (i = 0; i < num; i++) {
-		/* Ensure that LIODN value is valid */
-		if (liodn[i] >= PAACE_NUMBER_ENTRIES) {
-			pr_debug("Invalid liodn %d, attach device failed for %pOF\n",
-				 liodn[i], dev->of_node);
-			ret = -EINVAL;
-			break;
-		}
-
-		attach_device(dma_domain, liodn[i], dev);
-		ret = pamu_set_liodn(dma_domain, dev, liodn[i]);
-		if (ret)
-			break;
-	}
-	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-
-	return ret;
-}
-
 static int fsl_pamu_attach_device(struct iommu_domain *domain,
 				  struct device *dev)
 {
 	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
+	unsigned long flags;
+	int len, ret = 0, i;
 	const u32 *liodn;
-	u32 liodn_cnt;
-	int len, ret = 0;
 	struct pci_dev *pdev = NULL;
 	struct pci_controller *pci_ctl;
 
@@ -298,14 +266,27 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
 	}
 
 	liodn = of_get_property(dev->of_node, "fsl,liodn", &len);
-	if (liodn) {
-		liodn_cnt = len / sizeof(u32);
-		ret = handle_attach_device(dma_domain, dev, liodn, liodn_cnt);
-	} else {
+	if (!liodn) {
 		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
-		ret = -EINVAL;
+		return -EINVAL;
 	}
 
+	spin_lock_irqsave(&dma_domain->domain_lock, flags);
+	for (i = 0; i < len / sizeof(u32); i++) {
+		/* Ensure that LIODN value is valid */
+		if (liodn[i] >= PAACE_NUMBER_ENTRIES) {
+			pr_debug("Invalid liodn %d, attach device failed for %pOF\n",
+				 liodn[i], dev->of_node);
+			ret = -EINVAL;
+			break;
+		}
+
+		attach_device(dma_domain, liodn[i], dev);
+		ret = pamu_set_liodn(dma_domain, dev, liodn[i]);
+		if (ret)
+			break;
+	}
+	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
 	return ret;
 }
 
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
