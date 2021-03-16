Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA3633D807
	for <lists.virtualization@lfdr.de>; Tue, 16 Mar 2021 16:48:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F0D56F65F;
	Tue, 16 Mar 2021 15:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHk-cGkhU2CW; Tue, 16 Mar 2021 15:48:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C4A26F665;
	Tue, 16 Mar 2021 15:48:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DDD4C0014;
	Tue, 16 Mar 2021 15:48:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCF3BC000A;
 Tue, 16 Mar 2021 15:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C84CD43003;
 Tue, 16 Mar 2021 15:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gBJK8yPSnqc; Tue, 16 Mar 2021 15:48:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D9BB42FC0;
 Tue, 16 Mar 2021 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LLNJmtrL5+kpO2dQE+ielS+d0lLhdfp+H3xCSPPpVb0=; b=NQH+p75+UkY+Slklsw50TsSal8
 XmuMW4yOAath99mfZ3smBVpp3g2VkCLIjlsIqxkpAAE+GVrQ1n2Ev2dcdfyXxAvQTGl2NAaxJSrPu
 d2j5jiVWGEUh5JXSnqfj4PBVnj8gX8LCd26iBJTG0NWbhq/dhjy3tSoPJiT4l4rbQj4XwWtUzeDCk
 usv40e+yv2Zi9vhNdat+B0O2M0lKFGrBWFKptnMSYw4JYUppqnBFeyEHVyqN/7zCqK9scgw46fqUj
 x8e2cTmH8cfv4vOtF8RG8pLdy3kpjaffkS/E5Kl338LbBJ1S0+1nCr48pn/2yN7Il2/CiM6DKSotX
 2JmXQOgA==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMBuw-000G67-Mp; Tue, 16 Mar 2021 15:47:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 03/18] iommu/fsl_pamu: remove support for setting
 DOMAIN_ATTR_GEOMETRY
Date: Tue, 16 Mar 2021 16:38:09 +0100
Message-Id: <20210316153825.135976-4-hch@lst.de>
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

The default geometry is the same as the one set by qman_port given
that FSL_PAMU depends on having 64-bit physical and thus DMA addresses.

Remove the support to update the geometry and remove the now pointless
geom_size field.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/iommu/fsl_pamu_domain.c     | 55 +++--------------------------
 drivers/iommu/fsl_pamu_domain.h     |  6 ----
 drivers/soc/fsl/qbman/qman_portal.c | 12 -------
 3 files changed, 5 insertions(+), 68 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index e587ec43f7e750..7bd08ddad07779 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -62,7 +62,7 @@ static phys_addr_t get_phys_addr(struct fsl_dma_domain *dma_domain, dma_addr_t i
 
 	geom = &dma_domain->iommu_domain.geometry;
 
-	if (!win_cnt || !dma_domain->geom_size) {
+	if (!win_cnt) {
 		pr_debug("Number of windows/geometry not configured for the domain\n");
 		return 0;
 	}
@@ -72,7 +72,7 @@ static phys_addr_t get_phys_addr(struct fsl_dma_domain *dma_domain, dma_addr_t i
 		dma_addr_t subwin_iova;
 		u32 wnd;
 
-		subwin_size = dma_domain->geom_size >> ilog2(win_cnt);
+		subwin_size = (geom->aperture_end + 1) >> ilog2(win_cnt);
 		subwin_iova = iova & ~(subwin_size - 1);
 		wnd = (subwin_iova - geom->aperture_start) >> ilog2(subwin_size);
 		win_ptr = &dma_domain->win_arr[wnd];
@@ -234,7 +234,7 @@ static int pamu_set_liodn(int liodn, struct device *dev,
 	get_ome_index(&omi_index, dev);
 
 	window_addr = geom_attr->aperture_start;
-	window_size = dma_domain->geom_size;
+	window_size = geom_attr->aperture_end + 1;
 
 	spin_lock_irqsave(&iommu_lock, flags);
 	ret = pamu_disable_liodn(liodn);
@@ -303,7 +303,6 @@ static struct fsl_dma_domain *iommu_alloc_dma_domain(void)
 	domain->stash_id = ~(u32)0;
 	domain->snoop_id = ~(u32)0;
 	domain->win_cnt = pamu_get_max_subwin_cnt();
-	domain->geom_size = 0;
 
 	INIT_LIST_HEAD(&domain->devices);
 
@@ -502,7 +501,8 @@ static int fsl_pamu_window_enable(struct iommu_domain *domain, u32 wnd_nr,
 		return -EINVAL;
 	}
 
-	win_size = dma_domain->geom_size >> ilog2(dma_domain->win_cnt);
+	win_size = (domain->geometry.aperture_end + 1) >>
+			ilog2(dma_domain->win_cnt);
 	if (size > win_size) {
 		pr_debug("Invalid window size\n");
 		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
@@ -665,41 +665,6 @@ static void fsl_pamu_detach_device(struct iommu_domain *domain,
 		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
 }
 
-static  int configure_domain_geometry(struct iommu_domain *domain, void *data)
-{
-	struct iommu_domain_geometry *geom_attr = data;
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
-	dma_addr_t geom_size;
-	unsigned long flags;
-
-	geom_size = geom_attr->aperture_end - geom_attr->aperture_start + 1;
-	/*
-	 * Sanity check the geometry size. Also, we do not support
-	 * DMA outside of the geometry.
-	 */
-	if (check_size(geom_size, geom_attr->aperture_start) ||
-	    !geom_attr->force_aperture) {
-		pr_debug("Invalid PAMU geometry attributes\n");
-		return -EINVAL;
-	}
-
-	spin_lock_irqsave(&dma_domain->domain_lock, flags);
-	if (dma_domain->enabled) {
-		pr_debug("Can't set geometry attributes as domain is active\n");
-		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-		return  -EBUSY;
-	}
-
-	/* Copy the domain geometry information */
-	memcpy(&domain->geometry, geom_attr,
-	       sizeof(struct iommu_domain_geometry));
-	dma_domain->geom_size = geom_size;
-
-	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-
-	return 0;
-}
-
 /* Set the domain stash attribute */
 static int configure_domain_stash(struct fsl_dma_domain *dma_domain, void *data)
 {
@@ -769,13 +734,6 @@ static int fsl_pamu_set_windows(struct iommu_domain *domain, u32 w_count)
 		return  -EBUSY;
 	}
 
-	/* Ensure that the geometry has been set for the domain */
-	if (!dma_domain->geom_size) {
-		pr_debug("Please configure geometry before setting the number of windows\n");
-		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-		return -EINVAL;
-	}
-
 	/*
 	 * Ensure we have valid window count i.e. it should be less than
 	 * maximum permissible limit and should be a power of two.
@@ -811,9 +769,6 @@ static int fsl_pamu_set_domain_attr(struct iommu_domain *domain,
 	int ret = 0;
 
 	switch (attr_type) {
-	case DOMAIN_ATTR_GEOMETRY:
-		ret = configure_domain_geometry(domain, data);
-		break;
 	case DOMAIN_ATTR_FSL_PAMU_STASH:
 		ret = configure_domain_stash(dma_domain, data);
 		break;
diff --git a/drivers/iommu/fsl_pamu_domain.h b/drivers/iommu/fsl_pamu_domain.h
index 2865d42782e802..53d359d66fe577 100644
--- a/drivers/iommu/fsl_pamu_domain.h
+++ b/drivers/iommu/fsl_pamu_domain.h
@@ -17,12 +17,6 @@ struct dma_window {
 };
 
 struct fsl_dma_domain {
-	/*
-	 * Indicates the geometry size for the domain.
-	 * This would be set when the geometry is
-	 * configured for the domain.
-	 */
-	dma_addr_t			geom_size;
 	/*
 	 * Number of windows assocaited with this domain.
 	 * During domain initialization, it is set to the
diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index 5685b67068931a..c958e6310d3094 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -47,7 +47,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 #ifdef CONFIG_FSL_PAMU
 	struct device *dev = pcfg->dev;
 	int window_count = 1;
-	struct iommu_domain_geometry geom_attr;
 	struct pamu_stash_attribute stash_attr;
 	int ret;
 
@@ -56,17 +55,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 		dev_err(dev, "%s(): iommu_domain_alloc() failed", __func__);
 		goto no_iommu;
 	}
-	geom_attr.aperture_start = 0;
-	geom_attr.aperture_end =
-		((dma_addr_t)1 << min(8 * sizeof(dma_addr_t), (size_t)36)) - 1;
-	geom_attr.force_aperture = true;
-	ret = iommu_domain_set_attr(pcfg->iommu_domain, DOMAIN_ATTR_GEOMETRY,
-				    &geom_attr);
-	if (ret < 0) {
-		dev_err(dev, "%s(): iommu_domain_set_attr() = %d", __func__,
-			ret);
-		goto out_domain_free;
-	}
 	ret = iommu_domain_set_attr(pcfg->iommu_domain, DOMAIN_ATTR_WINDOWS,
 				    &window_count);
 	if (ret < 0) {
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
