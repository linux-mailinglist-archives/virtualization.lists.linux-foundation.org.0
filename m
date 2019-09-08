Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1FAD014
	for <lists.virtualization@lfdr.de>; Sun,  8 Sep 2019 18:58:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 75DA3C8F;
	Sun,  8 Sep 2019 16:57:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5A6C9BA9
	for <virtualization@lists.linux-foundation.org>;
	Sun,  8 Sep 2019 16:57:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9DAAE7DB
	for <virtualization@lists.linux-foundation.org>;
	Sun,  8 Sep 2019 16:57:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w22so7644072pfi.9
	for <virtualization@lists.linux-foundation.org>;
	Sun, 08 Sep 2019 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tcd-ie.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qqBnKsIB9FvrIizx3vnTf+e2xcqRVkO5ITKegZodiQ8=;
	b=qlfQ/nENyvMq5BQlx8w1Ytt+TGYZTahOvMh0NnAyvlvOdfR+C+Gl9X1ak/rWpHKsmG
	R+zWaU6dG4XOIgD2/LOrF5Duz19WQ6PbCGlQuzTN8+douwvP8greeUX7H24tj3RL5hsp
	p3hMkL6V3RWSZQ4+L0+shHeD0xI3xnBHKTKpgc08Xw3hMuiqaqUVZrc6AHy9nuwLGu1z
	itErj/j67Jmrn5iln0d+C/NOBpm9nD+G7F/kZIBH6Qk7jW0eIkld+yO6HAEkYLSIuePX
	vbWUTNBixcXali2hX4hVQCa+pDeGwAKlPtAotqFWVkjt4dDj8UraOzUoAJ8Fz8v1s0iR
	0aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qqBnKsIB9FvrIizx3vnTf+e2xcqRVkO5ITKegZodiQ8=;
	b=YvOaPEJ/ghGXQtGaPcKGzKyHeZiT9wbhXYrs0pS7fkIGmNZrZ0HGLkELWDd+3DzVD8
	a01GtW9j9q3gAILd2ZTtql7b8wtJ15t57YgmZ3S8TvDAHOZkFh5hUbGRCirFCI0qkz8n
	ncyGBtRduvPmVr/FbXexhV5TQloMxLfwMrQFb4GUsAz2yoIIstKkxGgaPbIiay/Vm0ww
	y9kF4Xm6tChxquWMRrUAMPQbTK4A7vFIbgyQkQ3qj5nLmQGeUtiavF/sn4IzzGefrgJQ
	xzOzopRLLerhqjeKTmKsZqGXNfsf8q9WUxXrxckyVai8xG0Vno0q3FxFjCMs81YYYnXa
	N/Zw==
X-Gm-Message-State: APjAAAWZBA0vsQlpBt2T4IV03hvI5GgUs3C5DXHdXrzL4Y9UxHoqk+ru
	BqYI6w9bFs2fVN4WYdv3kdWyxQ==
X-Google-Smtp-Source: APXvYqwHotgFS64/0ZR802WbxMlc7Xs0/MoSYcw5A27PwdTbIQjeLsHNiHxJqN1KxjvSQ3c2qoAorg==
X-Received: by 2002:a63:5048:: with SMTP id q8mr17469934pgl.446.1567961830955; 
	Sun, 08 Sep 2019 09:57:10 -0700 (PDT)
Received: from localhost.localdomain ([24.244.23.109])
	by smtp.googlemail.com with ESMTPSA id
	f188sm13834631pfa.170.2019.09.08.09.57.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Sep 2019 09:57:10 -0700 (PDT)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH V6 5/5] iommu/amd: Convert AMD iommu driver to the dma-iommu
	api
Date: Sun,  8 Sep 2019 09:56:41 -0700
Message-Id: <20190908165642.22253-6-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190908165642.22253-1-murphyt7@tcd.ie>
References: <20190908165642.22253-1-murphyt7@tcd.ie>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-samsung-soc@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
	Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Convert the AMD iommu driver to the dma-iommu api. Remove the iova
handling and reserve region code from the AMD iommu driver.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/Kconfig     |   1 +
 drivers/iommu/amd_iommu.c | 677 ++++----------------------------------
 2 files changed, 68 insertions(+), 610 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index e15cdcd8cb3c..437428571512 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -138,6 +138,7 @@ config AMD_IOMMU
 	select PCI_PASID
 	select IOMMU_API
 	select IOMMU_IOVA
+	select IOMMU_DMA
 	depends on X86_64 && PCI && ACPI
 	---help---
 	  With this option you can enable support for AMD IOMMU hardware in
diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 0e53f9bd2be7..eb4801031a99 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -20,6 +20,7 @@
 #include <linux/scatterlist.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-direct.h>
+#include <linux/dma-iommu.h>
 #include <linux/iommu-helper.h>
 #include <linux/iommu.h>
 #include <linux/delay.h>
@@ -89,8 +90,6 @@ const struct iommu_ops amd_iommu_ops;
 static ATOMIC_NOTIFIER_HEAD(ppr_notifier);
 int amd_iommu_max_glx_val = -1;
 
-static const struct dma_map_ops amd_iommu_dma_ops;
-
 /*
  * general struct to manage commands send to an IOMMU
  */
@@ -103,21 +102,6 @@ struct kmem_cache *amd_iommu_irq_cache;
 static void update_domain(struct protection_domain *domain);
 static int protection_domain_init(struct protection_domain *domain);
 static void detach_device(struct device *dev);
-static void iova_domain_flush_tlb(struct iova_domain *iovad);
-
-/*
- * Data container for a dma_ops specific protection domain
- */
-struct dma_ops_domain {
-	/* generic protection domain information */
-	struct protection_domain domain;
-
-	/* IOVA RB-Tree */
-	struct iova_domain iovad;
-};
-
-static struct iova_domain reserved_iova_ranges;
-static struct lock_class_key reserved_rbtree_key;
 
 /****************************************************************************
  *
@@ -188,12 +172,6 @@ static struct protection_domain *to_pdomain(struct iommu_domain *dom)
 	return container_of(dom, struct protection_domain, domain);
 }
 
-static struct dma_ops_domain* to_dma_ops_domain(struct protection_domain *domain)
-{
-	BUG_ON(domain->flags != PD_DMA_OPS_MASK);
-	return container_of(domain, struct dma_ops_domain, domain);
-}
-
 static struct iommu_dev_data *alloc_dev_data(u16 devid)
 {
 	struct iommu_dev_data *dev_data;
@@ -1267,12 +1245,6 @@ static void domain_flush_pages(struct protection_domain *domain,
 	__domain_flush_pages(domain, address, size, 0);
 }
 
-/* Flush the whole IO/TLB for a given protection domain */
-static void domain_flush_tlb(struct protection_domain *domain)
-{
-	__domain_flush_pages(domain, 0, CMD_INV_IOMMU_ALL_PAGES_ADDRESS, 0);
-}
-
 /* Flush the whole IO/TLB for a given protection domain - including PDE */
 static void domain_flush_tlb_pde(struct protection_domain *domain)
 {
@@ -1674,43 +1646,6 @@ static unsigned long iommu_unmap_page(struct protection_domain *dom,
 	return unmapped;
 }
 
-/****************************************************************************
- *
- * The next functions belong to the address allocator for the dma_ops
- * interface functions.
- *
- ****************************************************************************/
-
-
-static unsigned long dma_ops_alloc_iova(struct device *dev,
-					struct dma_ops_domain *dma_dom,
-					unsigned int pages, u64 dma_mask)
-{
-	unsigned long pfn = 0;
-
-	pages = __roundup_pow_of_two(pages);
-
-	if (dma_mask > DMA_BIT_MASK(32))
-		pfn = alloc_iova_fast(&dma_dom->iovad, pages,
-				      IOVA_PFN(DMA_BIT_MASK(32)), false);
-
-	if (!pfn)
-		pfn = alloc_iova_fast(&dma_dom->iovad, pages,
-				      IOVA_PFN(dma_mask), true);
-
-	return (pfn << PAGE_SHIFT);
-}
-
-static void dma_ops_free_iova(struct dma_ops_domain *dma_dom,
-			      unsigned long address,
-			      unsigned int pages)
-{
-	pages = __roundup_pow_of_two(pages);
-	address >>= PAGE_SHIFT;
-
-	free_iova_fast(&dma_dom->iovad, address, pages);
-}
-
 /****************************************************************************
  *
  * The next functions belong to the domain allocation. A domain is
@@ -1787,38 +1722,23 @@ static void free_gcr3_table(struct protection_domain *domain)
 	free_page((unsigned long)domain->gcr3_tbl);
 }
 
-static void dma_ops_domain_flush_tlb(struct dma_ops_domain *dom)
-{
-	domain_flush_tlb(&dom->domain);
-	domain_flush_complete(&dom->domain);
-}
-
-static void iova_domain_flush_tlb(struct iova_domain *iovad)
-{
-	struct dma_ops_domain *dom;
-
-	dom = container_of(iovad, struct dma_ops_domain, iovad);
-
-	dma_ops_domain_flush_tlb(dom);
-}
-
 /*
  * Free a domain, only used if something went wrong in the
  * allocation path and we need to free an already allocated page table
  */
-static void dma_ops_domain_free(struct dma_ops_domain *dom)
+static void dma_ops_domain_free(struct protection_domain *domain)
 {
-	if (!dom)
+	if (!domain)
 		return;
 
-	put_iova_domain(&dom->iovad);
+	iommu_put_dma_cookie(&domain->domain);
 
-	free_pagetable(&dom->domain);
+	free_pagetable(domain);
 
-	if (dom->domain.id)
-		domain_id_free(dom->domain.id);
+	if (domain->id)
+		domain_id_free(domain->id);
 
-	kfree(dom);
+	kfree(domain);
 }
 
 /*
@@ -1826,35 +1746,30 @@ static void dma_ops_domain_free(struct dma_ops_domain *dom)
  * It also initializes the page table and the address allocator data
  * structures required for the dma_ops interface
  */
-static struct dma_ops_domain *dma_ops_domain_alloc(void)
+static struct protection_domain *dma_ops_domain_alloc(void)
 {
-	struct dma_ops_domain *dma_dom;
+	struct protection_domain *domain;
 
-	dma_dom = kzalloc(sizeof(struct dma_ops_domain), GFP_KERNEL);
-	if (!dma_dom)
+	domain = kzalloc(sizeof(struct protection_domain), GFP_KERNEL);
+	if (!domain)
 		return NULL;
 
-	if (protection_domain_init(&dma_dom->domain))
-		goto free_dma_dom;
-
-	dma_dom->domain.mode = PAGE_MODE_3_LEVEL;
-	dma_dom->domain.pt_root = (void *)get_zeroed_page(GFP_KERNEL);
-	dma_dom->domain.flags = PD_DMA_OPS_MASK;
-	if (!dma_dom->domain.pt_root)
-		goto free_dma_dom;
-
-	init_iova_domain(&dma_dom->iovad, PAGE_SIZE, IOVA_START_PFN);
+	if (protection_domain_init(domain))
+		goto free_domain;
 
-	if (init_iova_flush_queue(&dma_dom->iovad, iova_domain_flush_tlb, NULL))
-		goto free_dma_dom;
+	domain->mode = PAGE_MODE_3_LEVEL;
+	domain->pt_root = (void *)get_zeroed_page(GFP_KERNEL);
+	domain->flags = PD_DMA_OPS_MASK;
+	if (!domain->pt_root)
+		goto free_domain;
 
-	/* Initialize reserved ranges */
-	copy_reserved_iova(&reserved_iova_ranges, &dma_dom->iovad);
+	if (iommu_get_dma_cookie(&domain->domain) == -ENOMEM)
+		goto free_domain;
 
-	return dma_dom;
+	return domain;
 
-free_dma_dom:
-	dma_ops_domain_free(dma_dom);
+free_domain:
+	dma_ops_domain_free(domain);
 
 	return NULL;
 }
@@ -2233,8 +2148,8 @@ static int amd_iommu_add_device(struct device *dev)
 	domain = iommu_get_domain_for_dev(dev);
 	if (domain->type == IOMMU_DOMAIN_IDENTITY)
 		dev_data->passthrough = true;
-	else
-		dev->dma_ops = &amd_iommu_dma_ops;
+	else if (domain->type == IOMMU_DOMAIN_DMA)
+		iommu_setup_dma_ops(dev, IOVA_START_PFN << PAGE_SHIFT, 0);
 
 out:
 	iommu_completion_wait(iommu);
@@ -2268,43 +2183,32 @@ static struct iommu_group *amd_iommu_device_group(struct device *dev)
 	return acpihid_device_group(dev);
 }
 
+static int amd_iommu_domain_get_attr(struct iommu_domain *domain,
+		enum iommu_attr attr, void *data)
+{
+	switch (domain->type) {
+	case IOMMU_DOMAIN_UNMANAGED:
+		return -ENODEV;
+	case IOMMU_DOMAIN_DMA:
+		switch (attr) {
+		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
+			*(int *)data = !amd_iommu_unmap_flush;
+			return 0;
+		default:
+			return -ENODEV;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+}
+
 /*****************************************************************************
  *
  * The next functions belong to the dma_ops mapping/unmapping code.
  *
  *****************************************************************************/
 
-/*
- * In the dma_ops path we only have the struct device. This function
- * finds the corresponding IOMMU, the protection domain and the
- * requestor id for a given device.
- * If the device is not yet associated with a domain this is also done
- * in this function.
- */
-static struct protection_domain *get_domain(struct device *dev)
-{
-	struct protection_domain *domain;
-	struct iommu_domain *io_domain;
-
-	if (!check_device(dev))
-		return ERR_PTR(-EINVAL);
-
-	domain = get_dev_data(dev)->domain;
-	if (domain == NULL && get_dev_data(dev)->defer_attach) {
-		get_dev_data(dev)->defer_attach = false;
-		io_domain = iommu_get_domain_for_dev(dev);
-		domain = to_pdomain(io_domain);
-		attach_device(dev, domain);
-	}
-	if (domain == NULL)
-		return ERR_PTR(-EBUSY);
-
-	if (!dma_ops_domain(domain))
-		return ERR_PTR(-EBUSY);
-
-	return domain;
-}
-
 static void update_device_table(struct protection_domain *domain)
 {
 	struct iommu_dev_data *dev_data;
@@ -2335,447 +2239,6 @@ static void update_domain(struct protection_domain *domain)
 	domain->updated = false;
 }
 
-static int dir2prot(enum dma_data_direction direction)
-{
-	if (direction == DMA_TO_DEVICE)
-		return IOMMU_PROT_IR;
-	else if (direction == DMA_FROM_DEVICE)
-		return IOMMU_PROT_IW;
-	else if (direction == DMA_BIDIRECTIONAL)
-		return IOMMU_PROT_IW | IOMMU_PROT_IR;
-	else
-		return 0;
-}
-
-/*
- * This function contains common code for mapping of a physically
- * contiguous memory region into DMA address space. It is used by all
- * mapping functions provided with this IOMMU driver.
- * Must be called with the domain lock held.
- */
-static dma_addr_t __map_single(struct device *dev,
-			       struct dma_ops_domain *dma_dom,
-			       phys_addr_t paddr,
-			       size_t size,
-			       enum dma_data_direction direction,
-			       u64 dma_mask)
-{
-	dma_addr_t offset = paddr & ~PAGE_MASK;
-	dma_addr_t address, start, ret;
-	unsigned int pages;
-	int prot = 0;
-	int i;
-
-	pages = iommu_num_pages(paddr, size, PAGE_SIZE);
-	paddr &= PAGE_MASK;
-
-	address = dma_ops_alloc_iova(dev, dma_dom, pages, dma_mask);
-	if (!address)
-		goto out;
-
-	prot = dir2prot(direction);
-
-	start = address;
-	for (i = 0; i < pages; ++i) {
-		ret = iommu_map_page(&dma_dom->domain, start, paddr,
-				     PAGE_SIZE, prot, GFP_ATOMIC);
-		if (ret)
-			goto out_unmap;
-
-		paddr += PAGE_SIZE;
-		start += PAGE_SIZE;
-	}
-	address += offset;
-
-	domain_flush_np_cache(&dma_dom->domain, address, size);
-
-out:
-	return address;
-
-out_unmap:
-
-	for (--i; i >= 0; --i) {
-		start -= PAGE_SIZE;
-		iommu_unmap_page(&dma_dom->domain, start, PAGE_SIZE);
-	}
-
-	domain_flush_tlb(&dma_dom->domain);
-	domain_flush_complete(&dma_dom->domain);
-
-	dma_ops_free_iova(dma_dom, address, pages);
-
-	return DMA_MAPPING_ERROR;
-}
-
-/*
- * Does the reverse of the __map_single function. Must be called with
- * the domain lock held too
- */
-static void __unmap_single(struct dma_ops_domain *dma_dom,
-			   dma_addr_t dma_addr,
-			   size_t size,
-			   int dir)
-{
-	dma_addr_t i, start;
-	unsigned int pages;
-
-	pages = iommu_num_pages(dma_addr, size, PAGE_SIZE);
-	dma_addr &= PAGE_MASK;
-	start = dma_addr;
-
-	for (i = 0; i < pages; ++i) {
-		iommu_unmap_page(&dma_dom->domain, start, PAGE_SIZE);
-		start += PAGE_SIZE;
-	}
-
-	if (amd_iommu_unmap_flush) {
-		domain_flush_tlb(&dma_dom->domain);
-		domain_flush_complete(&dma_dom->domain);
-		dma_ops_free_iova(dma_dom, dma_addr, pages);
-	} else {
-		pages = __roundup_pow_of_two(pages);
-		queue_iova(&dma_dom->iovad, dma_addr >> PAGE_SHIFT, pages, 0);
-	}
-}
-
-/*
- * The exported map_single function for dma_ops.
- */
-static dma_addr_t map_page(struct device *dev, struct page *page,
-			   unsigned long offset, size_t size,
-			   enum dma_data_direction dir,
-			   unsigned long attrs)
-{
-	phys_addr_t paddr = page_to_phys(page) + offset;
-	struct protection_domain *domain;
-	struct dma_ops_domain *dma_dom;
-	u64 dma_mask;
-
-	domain = get_domain(dev);
-	if (PTR_ERR(domain) == -EINVAL)
-		return (dma_addr_t)paddr;
-	else if (IS_ERR(domain))
-		return DMA_MAPPING_ERROR;
-
-	dma_mask = *dev->dma_mask;
-	dma_dom = to_dma_ops_domain(domain);
-
-	return __map_single(dev, dma_dom, paddr, size, dir, dma_mask);
-}
-
-/*
- * The exported unmap_single function for dma_ops.
- */
-static void unmap_page(struct device *dev, dma_addr_t dma_addr, size_t size,
-		       enum dma_data_direction dir, unsigned long attrs)
-{
-	struct protection_domain *domain;
-	struct dma_ops_domain *dma_dom;
-
-	domain = get_domain(dev);
-	if (IS_ERR(domain))
-		return;
-
-	dma_dom = to_dma_ops_domain(domain);
-
-	__unmap_single(dma_dom, dma_addr, size, dir);
-}
-
-static int sg_num_pages(struct device *dev,
-			struct scatterlist *sglist,
-			int nelems)
-{
-	unsigned long mask, boundary_size;
-	struct scatterlist *s;
-	int i, npages = 0;
-
-	mask          = dma_get_seg_boundary(dev);
-	boundary_size = mask + 1 ? ALIGN(mask + 1, PAGE_SIZE) >> PAGE_SHIFT :
-				   1UL << (BITS_PER_LONG - PAGE_SHIFT);
-
-	for_each_sg(sglist, s, nelems, i) {
-		int p, n;
-
-		s->dma_address = npages << PAGE_SHIFT;
-		p = npages % boundary_size;
-		n = iommu_num_pages(sg_phys(s), s->length, PAGE_SIZE);
-		if (p + n > boundary_size)
-			npages += boundary_size - p;
-		npages += n;
-	}
-
-	return npages;
-}
-
-/*
- * The exported map_sg function for dma_ops (handles scatter-gather
- * lists).
- */
-static int map_sg(struct device *dev, struct scatterlist *sglist,
-		  int nelems, enum dma_data_direction direction,
-		  unsigned long attrs)
-{
-	int mapped_pages = 0, npages = 0, prot = 0, i;
-	struct protection_domain *domain;
-	struct dma_ops_domain *dma_dom;
-	struct scatterlist *s;
-	unsigned long address;
-	u64 dma_mask;
-	int ret;
-
-	domain = get_domain(dev);
-	if (IS_ERR(domain))
-		return 0;
-
-	dma_dom  = to_dma_ops_domain(domain);
-	dma_mask = *dev->dma_mask;
-
-	npages = sg_num_pages(dev, sglist, nelems);
-
-	address = dma_ops_alloc_iova(dev, dma_dom, npages, dma_mask);
-	if (!address)
-		goto out_err;
-
-	prot = dir2prot(direction);
-
-	/* Map all sg entries */
-	for_each_sg(sglist, s, nelems, i) {
-		int j, pages = iommu_num_pages(sg_phys(s), s->length, PAGE_SIZE);
-
-		for (j = 0; j < pages; ++j) {
-			unsigned long bus_addr, phys_addr;
-
-			bus_addr  = address + s->dma_address + (j << PAGE_SHIFT);
-			phys_addr = (sg_phys(s) & PAGE_MASK) + (j << PAGE_SHIFT);
-			ret = iommu_map_page(domain, bus_addr, phys_addr, PAGE_SIZE, prot, GFP_ATOMIC);
-			if (ret)
-				goto out_unmap;
-
-			mapped_pages += 1;
-		}
-	}
-
-	/* Everything is mapped - write the right values into s->dma_address */
-	for_each_sg(sglist, s, nelems, i) {
-		/*
-		 * Add in the remaining piece of the scatter-gather offset that
-		 * was masked out when we were determining the physical address
-		 * via (sg_phys(s) & PAGE_MASK) earlier.
-		 */
-		s->dma_address += address + (s->offset & ~PAGE_MASK);
-		s->dma_length   = s->length;
-	}
-
-	if (s)
-		domain_flush_np_cache(domain, s->dma_address, s->dma_length);
-
-	return nelems;
-
-out_unmap:
-	dev_err(dev, "IOMMU mapping error in map_sg (io-pages: %d reason: %d)\n",
-		npages, ret);
-
-	for_each_sg(sglist, s, nelems, i) {
-		int j, pages = iommu_num_pages(sg_phys(s), s->length, PAGE_SIZE);
-
-		for (j = 0; j < pages; ++j) {
-			unsigned long bus_addr;
-
-			bus_addr  = address + s->dma_address + (j << PAGE_SHIFT);
-			iommu_unmap_page(domain, bus_addr, PAGE_SIZE);
-
-			if (--mapped_pages == 0)
-				goto out_free_iova;
-		}
-	}
-
-out_free_iova:
-	free_iova_fast(&dma_dom->iovad, address >> PAGE_SHIFT, npages);
-
-out_err:
-	return 0;
-}
-
-/*
- * The exported map_sg function for dma_ops (handles scatter-gather
- * lists).
- */
-static void unmap_sg(struct device *dev, struct scatterlist *sglist,
-		     int nelems, enum dma_data_direction dir,
-		     unsigned long attrs)
-{
-	struct protection_domain *domain;
-	struct dma_ops_domain *dma_dom;
-	unsigned long startaddr;
-	int npages;
-
-	domain = get_domain(dev);
-	if (IS_ERR(domain))
-		return;
-
-	startaddr = sg_dma_address(sglist) & PAGE_MASK;
-	dma_dom   = to_dma_ops_domain(domain);
-	npages    = sg_num_pages(dev, sglist, nelems);
-
-	__unmap_single(dma_dom, startaddr, npages << PAGE_SHIFT, dir);
-}
-
-/*
- * The exported alloc_coherent function for dma_ops.
- */
-static void *alloc_coherent(struct device *dev, size_t size,
-			    dma_addr_t *dma_addr, gfp_t flag,
-			    unsigned long attrs)
-{
-	u64 dma_mask = dev->coherent_dma_mask;
-	struct protection_domain *domain;
-	struct dma_ops_domain *dma_dom;
-	struct page *page;
-
-	domain = get_domain(dev);
-	if (PTR_ERR(domain) == -EINVAL) {
-		page = alloc_pages(flag, get_order(size));
-		*dma_addr = page_to_phys(page);
-		return page_address(page);
-	} else if (IS_ERR(domain))
-		return NULL;
-
-	dma_dom   = to_dma_ops_domain(domain);
-	size	  = PAGE_ALIGN(size);
-	dma_mask  = dev->coherent_dma_mask;
-	flag     &= ~(__GFP_DMA | __GFP_HIGHMEM | __GFP_DMA32);
-	flag     |= __GFP_ZERO;
-
-	page = alloc_pages(flag | __GFP_NOWARN,  get_order(size));
-	if (!page) {
-		if (!gfpflags_allow_blocking(flag))
-			return NULL;
-
-		page = dma_alloc_from_contiguous(dev, size >> PAGE_SHIFT,
-					get_order(size), flag & __GFP_NOWARN);
-		if (!page)
-			return NULL;
-	}
-
-	if (!dma_mask)
-		dma_mask = *dev->dma_mask;
-
-	*dma_addr = __map_single(dev, dma_dom, page_to_phys(page),
-				 size, DMA_BIDIRECTIONAL, dma_mask);
-
-	if (*dma_addr == DMA_MAPPING_ERROR)
-		goto out_free;
-
-	return page_address(page);
-
-out_free:
-
-	if (!dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT))
-		__free_pages(page, get_order(size));
-
-	return NULL;
-}
-
-/*
- * The exported free_coherent function for dma_ops.
- */
-static void free_coherent(struct device *dev, size_t size,
-			  void *virt_addr, dma_addr_t dma_addr,
-			  unsigned long attrs)
-{
-	struct protection_domain *domain;
-	struct dma_ops_domain *dma_dom;
-	struct page *page;
-
-	page = virt_to_page(virt_addr);
-	size = PAGE_ALIGN(size);
-
-	domain = get_domain(dev);
-	if (IS_ERR(domain))
-		goto free_mem;
-
-	dma_dom = to_dma_ops_domain(domain);
-
-	__unmap_single(dma_dom, dma_addr, size, DMA_BIDIRECTIONAL);
-
-free_mem:
-	if (!dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT))
-		__free_pages(page, get_order(size));
-}
-
-/*
- * This function is called by the DMA layer to find out if we can handle a
- * particular device. It is part of the dma_ops.
- */
-static int amd_iommu_dma_supported(struct device *dev, u64 mask)
-{
-	if (!dma_direct_supported(dev, mask))
-		return 0;
-	return check_device(dev);
-}
-
-static const struct dma_map_ops amd_iommu_dma_ops = {
-	.alloc		= alloc_coherent,
-	.free		= free_coherent,
-	.map_page	= map_page,
-	.unmap_page	= unmap_page,
-	.map_sg		= map_sg,
-	.unmap_sg	= unmap_sg,
-	.dma_supported	= amd_iommu_dma_supported,
-};
-
-static int init_reserved_iova_ranges(void)
-{
-	struct pci_dev *pdev = NULL;
-	struct iova *val;
-
-	init_iova_domain(&reserved_iova_ranges, PAGE_SIZE, IOVA_START_PFN);
-
-	lockdep_set_class(&reserved_iova_ranges.iova_rbtree_lock,
-			  &reserved_rbtree_key);
-
-	/* MSI memory range */
-	val = reserve_iova(&reserved_iova_ranges,
-			   IOVA_PFN(MSI_RANGE_START), IOVA_PFN(MSI_RANGE_END));
-	if (!val) {
-		pr_err("Reserving MSI range failed\n");
-		return -ENOMEM;
-	}
-
-	/* HT memory range */
-	val = reserve_iova(&reserved_iova_ranges,
-			   IOVA_PFN(HT_RANGE_START), IOVA_PFN(HT_RANGE_END));
-	if (!val) {
-		pr_err("Reserving HT range failed\n");
-		return -ENOMEM;
-	}
-
-	/*
-	 * Memory used for PCI resources
-	 * FIXME: Check whether we can reserve the PCI-hole completly
-	 */
-	for_each_pci_dev(pdev) {
-		int i;
-
-		for (i = 0; i < PCI_NUM_RESOURCES; ++i) {
-			struct resource *r = &pdev->resource[i];
-
-			if (!(r->flags & IORESOURCE_MEM))
-				continue;
-
-			val = reserve_iova(&reserved_iova_ranges,
-					   IOVA_PFN(r->start),
-					   IOVA_PFN(r->end));
-			if (!val) {
-				pci_err(pdev, "Reserve pci-resource range %pR failed\n", r);
-				return -ENOMEM;
-			}
-		}
-	}
-
-	return 0;
-}
-
 int __init amd_iommu_init_api(void)
 {
 	int ret, err = 0;
@@ -2784,10 +2247,6 @@ int __init amd_iommu_init_api(void)
 	if (ret)
 		return ret;
 
-	ret = init_reserved_iova_ranges();
-	if (ret)
-		return ret;
-
 	err = bus_set_iommu(&pci_bus_type, &amd_iommu_ops);
 	if (err)
 		return err;
@@ -2888,7 +2347,6 @@ static struct protection_domain *protection_domain_alloc(void)
 static struct iommu_domain *amd_iommu_domain_alloc(unsigned type)
 {
 	struct protection_domain *pdomain;
-	struct dma_ops_domain *dma_domain;
 
 	switch (type) {
 	case IOMMU_DOMAIN_UNMANAGED:
@@ -2909,12 +2367,11 @@ static struct iommu_domain *amd_iommu_domain_alloc(unsigned type)
 
 		break;
 	case IOMMU_DOMAIN_DMA:
-		dma_domain = dma_ops_domain_alloc();
-		if (!dma_domain) {
+		pdomain = dma_ops_domain_alloc();
+		if (!pdomain) {
 			pr_err("Failed to allocate\n");
 			return NULL;
 		}
-		pdomain = &dma_domain->domain;
 		break;
 	case IOMMU_DOMAIN_IDENTITY:
 		pdomain = protection_domain_alloc();
@@ -2933,7 +2390,6 @@ static struct iommu_domain *amd_iommu_domain_alloc(unsigned type)
 static void amd_iommu_domain_free(struct iommu_domain *dom)
 {
 	struct protection_domain *domain;
-	struct dma_ops_domain *dma_dom;
 
 	domain = to_pdomain(dom);
 
@@ -2948,8 +2404,7 @@ static void amd_iommu_domain_free(struct iommu_domain *dom)
 	switch (dom->type) {
 	case IOMMU_DOMAIN_DMA:
 		/* Now release the domain */
-		dma_dom = to_dma_ops_domain(domain);
-		dma_ops_domain_free(dma_dom);
+		dma_ops_domain_free(domain);
 		break;
 	default:
 		if (domain->mode != PAGE_MODE_NONE)
@@ -3005,6 +2460,7 @@ static int amd_iommu_attach_device(struct iommu_domain *dom,
 		return -EINVAL;
 
 	dev_data = dev->archdata.iommu;
+	dev_data->defer_attach = false;
 
 	iommu = amd_iommu_rlookup_table[dev_data->devid];
 	if (!iommu)
@@ -3161,19 +2617,6 @@ static void amd_iommu_put_resv_regions(struct device *dev,
 		kfree(entry);
 }
 
-static void amd_iommu_apply_resv_region(struct device *dev,
-				      struct iommu_domain *domain,
-				      struct iommu_resv_region *region)
-{
-	struct dma_ops_domain *dma_dom = to_dma_ops_domain(to_pdomain(domain));
-	unsigned long start, end;
-
-	start = IOVA_PFN(region->start);
-	end   = IOVA_PFN(region->start + region->length - 1);
-
-	WARN_ON_ONCE(reserve_iova(&dma_dom->iovad, start, end) == NULL);
-}
-
 static bool amd_iommu_is_attach_deferred(struct iommu_domain *domain,
 					 struct device *dev)
 {
@@ -3206,9 +2649,9 @@ const struct iommu_ops amd_iommu_ops = {
 	.add_device = amd_iommu_add_device,
 	.remove_device = amd_iommu_remove_device,
 	.device_group = amd_iommu_device_group,
+	.domain_get_attr = amd_iommu_domain_get_attr,
 	.get_resv_regions = amd_iommu_get_resv_regions,
 	.put_resv_regions = amd_iommu_put_resv_regions,
-	.apply_resv_region = amd_iommu_apply_resv_region,
 	.is_attach_deferred = amd_iommu_is_attach_deferred,
 	.pgsize_bitmap	= AMD_IOMMU_PGSIZES,
 	.flush_iotlb_all = amd_iommu_flush_iotlb_all,
@@ -3523,9 +2966,23 @@ EXPORT_SYMBOL(amd_iommu_complete_ppr);
 struct iommu_domain *amd_iommu_get_v2_domain(struct pci_dev *pdev)
 {
 	struct protection_domain *pdomain;
+	struct iommu_domain *io_domain;
+	struct device *dev = &pdev->dev;
+
+	if (!check_device(dev))
+		return NULL;
+
+	pdomain = get_dev_data(dev)->domain;
+	if (pdomain == NULL && get_dev_data(dev)->defer_attach) {
+		get_dev_data(dev)->defer_attach = false;
+		io_domain = iommu_get_domain_for_dev(dev);
+		pdomain = to_pdomain(io_domain);
+		attach_device(dev, pdomain);
+	}
+	if (pdomain == NULL)
+		return NULL;
 
-	pdomain = get_domain(&pdev->dev);
-	if (IS_ERR(pdomain))
+	if (!dma_ops_domain(pdomain))
 		return NULL;
 
 	/* Only return IOMMUv2 domains */
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
