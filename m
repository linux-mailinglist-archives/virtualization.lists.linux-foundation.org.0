Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5539433D8A2
	for <lists.virtualization@lfdr.de>; Tue, 16 Mar 2021 17:05:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B7D6F60D;
	Tue, 16 Mar 2021 16:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfVca8l778wl; Tue, 16 Mar 2021 16:05:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85C196F65F;
	Tue, 16 Mar 2021 16:05:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9934C0014;
	Tue, 16 Mar 2021 16:05:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DAAFC000A;
 Tue, 16 Mar 2021 16:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AC364ED98;
 Tue, 16 Mar 2021 16:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrnKTuxdCst0; Tue, 16 Mar 2021 16:05:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76D984ED99;
 Tue, 16 Mar 2021 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ChWs1Pv1M4w34bREM9yV5oYIS/hBxPZ6ahPsYOMn6KE=; b=GiqE948WxG9Y25eOFNvp4ScWT8
 HKJ5ed+E+Vc2FVohBanksLlMTVTMz2VC/MM13YG8GNew9J7z4hetwf5m4BhZj8uW+hJbaoYqTCPXj
 zxaSmmgV9pxLd5xun5QeJr3pRnvHimaX+iltsC7oB/T4iUH52kiCH/3y8z57qHk5l45o7NkxJ1aq1
 WsI/a4i/7P8dWHzoblAUwkn2zI+U9OaE6pX7KrgFNJLCScFfgn/mf9ZPHxg0qf3sM3qTCHImsYSQ/
 F+p7DrESZAwppU4jlZ79hMHP4IFgK2vyz7S9zMWl1ZL0Zwf8VS/jBCLgny3TLqHfdcNyXoQLjTtA3
 E2LS+GbQ==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMCBJ-000HNL-FY; Tue, 16 Mar 2021 16:04:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 10/18] iommu/fsl_pamu: enable the liodn when attaching a device
Date: Tue, 16 Mar 2021 16:38:16 +0100
Message-Id: <20210316153825.135976-11-hch@lst.de>
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

Instead of a separate call to enable all devices from the list, just
enablde the liodn one the device is attached to the iommu domain.

This also remove the DOMAIN_ATTR_FSL_PAMU_ENABLE iommu_attr.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/iommu/fsl_pamu_domain.c     | 47 ++---------------------------
 drivers/iommu/fsl_pamu_domain.h     | 10 ------
 drivers/soc/fsl/qbman/qman_portal.c | 11 -------
 include/linux/iommu.h               |  1 -
 4 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 962cdc1a4a1924..21c6d9e79eddf9 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -195,9 +195,6 @@ static void fsl_pamu_domain_free(struct iommu_domain *domain)
 
 	/* remove all the devices from the device list */
 	detach_device(NULL, dma_domain);
-
-	dma_domain->enabled = 0;
-
 	kmem_cache_free(fsl_pamu_domain_cache, dma_domain);
 }
 
@@ -285,6 +282,9 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
 		ret = pamu_set_liodn(dma_domain, dev, liodn[i]);
 		if (ret)
 			break;
+		ret = pamu_enable_liodn(liodn[i]);
+		if (ret)
+			break;
 	}
 	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
 	return ret;
@@ -341,46 +341,6 @@ int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
 	return ret;
 }
 
-/* Configure domain dma state i.e. enable/disable DMA */
-static int configure_domain_dma_state(struct fsl_dma_domain *dma_domain, bool enable)
-{
-	struct device_domain_info *info;
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&dma_domain->domain_lock, flags);
-	dma_domain->enabled = enable;
-	list_for_each_entry(info, &dma_domain->devices, link) {
-		ret = (enable) ? pamu_enable_liodn(info->liodn) :
-			pamu_disable_liodn(info->liodn);
-		if (ret)
-			pr_debug("Unable to set dma state for liodn %d",
-				 info->liodn);
-	}
-	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-
-	return 0;
-}
-
-static int fsl_pamu_set_domain_attr(struct iommu_domain *domain,
-				    enum iommu_attr attr_type, void *data)
-{
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
-	int ret = 0;
-
-	switch (attr_type) {
-	case DOMAIN_ATTR_FSL_PAMU_ENABLE:
-		ret = configure_domain_dma_state(dma_domain, *(int *)data);
-		break;
-	default:
-		pr_debug("Unsupported attribute type\n");
-		ret = -EINVAL;
-		break;
-	}
-
-	return ret;
-}
-
 static struct iommu_group *get_device_iommu_group(struct device *dev)
 {
 	struct iommu_group *group;
@@ -505,7 +465,6 @@ static const struct iommu_ops fsl_pamu_ops = {
 	.attach_dev	= fsl_pamu_attach_device,
 	.detach_dev	= fsl_pamu_detach_device,
 	.iova_to_phys	= fsl_pamu_iova_to_phys,
-	.domain_set_attr = fsl_pamu_set_domain_attr,
 	.probe_device	= fsl_pamu_probe_device,
 	.release_device	= fsl_pamu_release_device,
 	.device_group   = fsl_pamu_device_group,
diff --git a/drivers/iommu/fsl_pamu_domain.h b/drivers/iommu/fsl_pamu_domain.h
index cd488004acd1b3..5f4ed253f61b31 100644
--- a/drivers/iommu/fsl_pamu_domain.h
+++ b/drivers/iommu/fsl_pamu_domain.h
@@ -12,16 +12,6 @@
 struct fsl_dma_domain {
 	/* list of devices associated with the domain */
 	struct list_head		devices;
-	/* dma_domain states:
-	 * enabled - DMA has been enabled for the given
-	 * domain. This translates to setting of the
-	 * valid bit for the primary PAACE in the PAMU
-	 * PAACT table. Domain geometry should be set and
-	 * it must have a valid mapping before DMA can be
-	 * enabled for it.
-	 *
-	 */
-	int				enabled;
 	u32				stash_id;
 	u32				snoop_id;
 	struct iommu_domain		iommu_domain;
diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index 798b3a1ffd0b9c..bf38eb0042ed52 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -46,7 +46,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 {
 #ifdef CONFIG_FSL_PAMU
 	struct device *dev = pcfg->dev;
-	int window_count = 1;
 	int ret;
 
 	pcfg->iommu_domain = iommu_domain_alloc(&platform_bus_type);
@@ -66,14 +65,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 			ret);
 		goto out_domain_free;
 	}
-	ret = iommu_domain_set_attr(pcfg->iommu_domain,
-				    DOMAIN_ATTR_FSL_PAMU_ENABLE,
-				    &window_count);
-	if (ret < 0) {
-		dev_err(dev, "%s(): iommu_domain_set_attr() = %d", __func__,
-			ret);
-		goto out_detach_device;
-	}
 
 no_iommu:
 #endif
@@ -82,8 +73,6 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
 	return;
 
 #ifdef CONFIG_FSL_PAMU
-out_detach_device:
-	iommu_detach_device(pcfg->iommu_domain, NULL);
 out_domain_free:
 	iommu_domain_free(pcfg->iommu_domain);
 	pcfg->iommu_domain = NULL;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 208e570e8d99e7..840864844027dc 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -109,7 +109,6 @@ enum iommu_cap {
 enum iommu_attr {
 	DOMAIN_ATTR_GEOMETRY,
 	DOMAIN_ATTR_PAGING,
-	DOMAIN_ATTR_FSL_PAMU_ENABLE,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
 	DOMAIN_ATTR_IO_PGTABLE_CFG,
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
