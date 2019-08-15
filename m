Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D67ED8E9CF
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 13:11:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0B97010B5;
	Thu, 15 Aug 2019 11:10:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E3F7D48
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:10:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C74B18A0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:10:48 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n4so1182187pgv.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 04:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tcd-ie.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Rq9oE/+ABrAqTFJN5so5jGPiSZbG95oHkV+cKhmZyPI=;
	b=v0n9o//BaoQ1ESwTpE6LtJwM0UMlZU6SHT31oFerAYe/9QP4IZ43sL++jjJ0lO7I0r
	33cFC5OPDHrUbaK1kRyeDxXqJw2kxWv1QBDKSRUAQYrFStgCOFm5F+WNNMG+odjGyiZr
	/nlAC34vY56gV4YH0EknAGiSIPRMu5D4jUi++DxYjMgJWJcvn7Trmg3g8cjHIW/PoZht
	I/MzH4/h0Y00wXwjjED/qhh151NQx8hzpG2BjjF6k/JBGMhtwrhWIiYFTHUGgQ31Zgu3
	3jTVnlzHTiNwLqrywAN5HiEUhVZ8Pcr9uu/E3P1MS3NDkKTzXbAxW83+7o1w3VSOxUBu
	pqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Rq9oE/+ABrAqTFJN5so5jGPiSZbG95oHkV+cKhmZyPI=;
	b=qP6OiIvzuyrUYDJaAY7lJYXMA4dwn9DN2c4eSUgCRIGRF+c6wdpw+W2ceY7RbeFUuT
	c5b07mFYiwzh9ZUSKyrPCVxYbBWjbyC5vQF+jc6F6LOzcLliTNx7S7ez5ADVvA4zdLAK
	vR3qHjxTqJv+LaDPfMsRg9jzNpoTRgbYiNB7PsFf2so0PLxB5MIx1L/J07zYU1eO203k
	8OIpgIY/56SSUF35w4Q3s20rrZShgmFLVFhGM4hFwdplCRCNRhaBSdVbQYaAMNGCTpeZ
	fUAov1PsW+ND2QeEFpN7EHky/7xMzupWDF1XTOLjTe3l6k5OwVDLOQzg1/2drGv07rJa
	5BRA==
X-Gm-Message-State: APjAAAXZ7eE1/rqnVn+6mOLUcgCE5M9i/JbMHABozxr8VtqOXtfR/IQg
	odGhCAwmTXQqnbmeYGlefC6uOQ==
X-Google-Smtp-Source: APXvYqy/ZF1W56BYZyMWgqSYtJ5QoXnk2Q5jOdJW84PVtYVDa3GxlwLtVVqiFXWVLJYqEOcXHYdi2Q==
X-Received: by 2002:a65:6546:: with SMTP id a6mr3208852pgw.220.1565867448258; 
	Thu, 15 Aug 2019 04:10:48 -0700 (PDT)
Received: from localhost.localdomain
	([2404:e801:200e:19c4:6c3f:b548:3a9c:7867])
	by smtp.googlemail.com with ESMTPSA id
	z13sm1042678pjn.32.2019.08.15.04.10.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 15 Aug 2019 04:10:47 -0700 (PDT)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH V5 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
Date: Thu, 15 Aug 2019 12:09:42 +0100
Message-Id: <20190815110944.3579-5-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815110944.3579-1-murphyt7@tcd.ie>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
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

Use the dev->coherent_dma_mask when allocating in the dma-iommu ops api.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/dma-iommu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 906b7fa14d3c..b9a3ab02434b 100644
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
