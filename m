Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52010AD00E
	for <lists.virtualization@lfdr.de>; Sun,  8 Sep 2019 18:58:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1D7B1C90;
	Sun,  8 Sep 2019 16:57:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50B32BE4
	for <virtualization@lists.linux-foundation.org>;
	Sun,  8 Sep 2019 16:57:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E4A777DB
	for <virtualization@lists.linux-foundation.org>;
	Sun,  8 Sep 2019 16:57:08 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 4so5455837pld.10
	for <virtualization@lists.linux-foundation.org>;
	Sun, 08 Sep 2019 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tcd-ie.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fAJIaeMy2eQobkqze5gpyoS/QeZKT96RyPc/Fq8itMQ=;
	b=gIzGX1RTmcudGCJKOn/C+BiFyjNYhfDmzcWXTYF+GB+qYZsgO8XgeYRVyeQwPkY9H9
	wfcau0BPSQZIc6VAMovCcu1x8zDws3CiXhc1r6OYf4EtX2tQYvlMR3BEakgC4F6WP7Op
	79lex3NN6lZ+6TqnODebKT25rPq9q2Ad7p3Ut4sP8GPNT+7DIHZ19pOA0zDuRx4Ve3NY
	wp5WrvVtMXdljRkCSQiTIk2IaQjfmdoveQnUnhEIELuxE8lz6PcBZTU/HM4WKB4UxloM
	qPm0/gAXG7FBDBK6aDWzi9nPMPolJ3ZyPfs2DEfSVL2fVvMhQ8jDgmTtmLFwp7IOmIWY
	n7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fAJIaeMy2eQobkqze5gpyoS/QeZKT96RyPc/Fq8itMQ=;
	b=SGIypjAm4uqV2M82N4xEaWWTiQaBE4bf2ZA6qleMYRCxxA7tMwF0GIgtfUSM5RrLxp
	5YukVLAXiSvr1vnr5todVk6ljYXoZ2ShWl3LsJIHqs7uZbM3c/QuEzCUfrQjSSWObyo8
	+g8wFLyKMbyMQKEnZwPRCK/Wivn0vL3r49zj/dWfCDgunNXmGrQeRUZUpBhenhBIJHcp
	Ic823WPIzek+NgooZCxYBC0IM9RSWyzKCEO/ge9uMAFO0cfljMbl7QJxS5D1gKNp4O8F
	J6z6WtiBFbkLYq658SPjc5+dxoT1x+JyVKxhJdw/TlLUbzOEouNERkoBJc7d8eKvFpDg
	fkMQ==
X-Gm-Message-State: APjAAAXmnfeS30z25fQiyb76ii1aceKXgucb3Fpa/GzWTya2S3ZHTIv6
	E9TH8BqQqCLUqJjMSi7PgA5cNQ==
X-Google-Smtp-Source: APXvYqzPhfrkAZBGVLAMVQJgc4sTyV+jrwe7GCElyOlS0MKLQHm4nHnT+K5O7UwOhB9dVwQiBTXNrw==
X-Received: by 2002:a17:902:8486:: with SMTP id
	c6mr1779387plo.341.1567961828443; 
	Sun, 08 Sep 2019 09:57:08 -0700 (PDT)
Received: from localhost.localdomain ([24.244.23.109])
	by smtp.googlemail.com with ESMTPSA id
	f188sm13834631pfa.170.2019.09.08.09.57.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Sep 2019 09:57:07 -0700 (PDT)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH V6 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
Date: Sun,  8 Sep 2019 09:56:40 -0700
Message-Id: <20190908165642.22253-5-murphyt7@tcd.ie>
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
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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

Use the dev->coherent_dma_mask when allocating in the dma-iommu ops api.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index bd09b6b31c4e..0cf52fae1471 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -471,7 +471,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
-		size_t size, int prot)
+		size_t size, int prot, dma_addr_t dma_mask)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -484,7 +484,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 
 	size = iova_align(iovad, size + iova_off);
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	iova = iommu_dma_alloc_iova(domain, size, dma_mask, dev);
 	if (!iova)
 		return DMA_MAPPING_ERROR;
 
@@ -735,7 +735,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 	dma_addr_t dma_handle;
 
-	dma_handle = __iommu_dma_map(dev, phys, size, prot);
+	dma_handle = __iommu_dma_map(dev, phys, size, prot, dma_get_mask(dev));
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(dev, phys, size, dir);
@@ -938,7 +938,8 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	return __iommu_dma_map(dev, phys, size,
-			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO);
+			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
+			dma_get_mask(dev));
 }
 
 static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
@@ -1041,7 +1042,8 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	if (!cpu_addr)
 		return NULL;
 
-	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot);
+	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
+			dev->coherent_dma_mask);
 	if (*handle == DMA_MAPPING_ERROR) {
 		__iommu_dma_free(dev, size, cpu_addr);
 		return NULL;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
