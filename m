Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8667374E
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:06:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D3D1E14E4;
	Wed, 24 Jul 2019 18:59:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0C1D8EB9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 22:39:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 563B6775
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 22:39:33 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id w13so519657eds.4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tcd-ie.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VIfV1OsDOCOIqv6MGdwh5qyRNpWkUFsV6JcVvbdsKMU=;
	b=JTF8mvZhJ/EJnKSb2g8yYVwCI7gY6AOBJvHEmxI98vcIdBtLCHSGqNBLdR66ae+p3N
	Gz0InBZJxBwcsA2tjrxO7l/2SbOW9EC/J1NpN0q7ctUvhDyiy6gcYSquuay1uuRjHT0l
	YMCpGS8YP90uVBR7O2fFjUN4fpSk/Um0odBXe4DqJz7/xdmuiw3TAlj0hxdMDoWq/uEX
	RG3tSMQSl86NA27lig6IIG+QyQL9PoQFyZu2igpH5UvBqmMPLOASs5VkPg6T4OTwrWrD
	sx/2LKFbOUyC2/QeLMuD34t20k1dyG1V73h2F+lWe0JPXWsoQ86NzkR4a3bo6x0/xWPW
	M2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VIfV1OsDOCOIqv6MGdwh5qyRNpWkUFsV6JcVvbdsKMU=;
	b=Fq0jgIOmUOGDVlp+diyCY1eQMZsyZuo+sx0cfNob2e2dApW5/CF9SBeimofQ2GUinF
	9pxDWomLZXHkVTQ7vnvmvpiUMpFnS1WiAbUZ1NLMYmblYNvUtNUZCuWi6TPRr7bNQewO
	p10gWRoHtPlGvxMdnpEHVrrflL1u603AW74QRXZ9YjGYyMXJPaR1DULkl13uCKkpYIU/
	X1wp3eTqd8gQY5gbXqG9jEzFojY7phxPPKZJRceybUhEn5m6+BIsXBl8Z4xn4UQzxS4K
	9W4PaYdVgbEMXB8eju5x72bt+zZumIPITMz+lNW/kdwJuxfE6OaUAdE/P8wYVyb2uzW9
	1v2A==
X-Gm-Message-State: APjAAAU1b4kb30dWZPpAX3ush/mh1ezr7QsSuGp3mU77LahU8Od7g64b
	ZAxJW67Hs9yJDnwAiLZPlDMu4w==
X-Google-Smtp-Source: APXvYqztuOfR2YM2Du1Zdlax7/DpXIkbSCgn46ot/nG+g0htY0BBU7yj7/Fpx5Lf97ZANT/nGWWzUg==
X-Received: by 2002:a50:a941:: with SMTP id m1mr99843943edc.157.1560465571973; 
	Thu, 13 Jun 2019 15:39:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:8042:d435:a754:1f22])
	by smtp.googlemail.com with ESMTPSA id
	s16sm216522eji.27.2019.06.13.15.39.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 13 Jun 2019 15:39:31 -0700 (PDT)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v4 3/5] iommu/dma-iommu: Handle deferred devices
Date: Thu, 13 Jun 2019 23:38:58 +0100
Message-Id: <20190613223901.9523-4-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613223901.9523-1-murphyt7@tcd.ie>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, Will Deacon <will.deacon@arm.com>,
	virtualization@lists.linux-foundation.org,
	David Brown <david.brown@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
	Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>
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

Handle devices which defer their attach to the iommu in the dma-iommu api

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/dma-iommu.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index e64dbbcde63c..f303bbe20e51 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/vmalloc.h>
+#include <linux/crash_dump.h>
 
 struct iommu_dma_msi_page {
 	struct list_head	list;
@@ -351,6 +352,21 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	return iova_reserve_iommu_regions(dev, domain);
 }
 
+static int handle_deferred_device(struct device *dev,
+	struct iommu_domain *domain)
+{
+	const struct iommu_ops *ops = domain->ops;
+
+	if (!is_kdump_kernel())
+		return 0;
+
+	if (unlikely(ops->is_attach_deferred &&
+		ops->is_attach_deferred(domain, dev)))
+		return iommu_attach_device(domain, dev);
+
+	return 0;
+}
+
 /**
  * dma_info_to_prot - Translate DMA API directions and attributes to IOMMU API
  *                    page flags.
@@ -462,6 +478,9 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 	size_t iova_off = 0;
 	dma_addr_t iova;
 
+	if (unlikely(handle_deferred_device(dev, domain)))
+		return DMA_MAPPING_ERROR;
+
 	if (cookie->type == IOMMU_DMA_IOVA_COOKIE) {
 		iova_off = iova_offset(&cookie->iovad, phys);
 		size = iova_align(&cookie->iovad, size + iova_off);
@@ -583,6 +602,9 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 
 	*dma_handle = DMA_MAPPING_ERROR;
 
+	if (unlikely(handle_deferred_device(dev, domain)))
+		return NULL;
+
 	min_size = alloc_sizes & -alloc_sizes;
 	if (min_size < PAGE_SIZE) {
 		min_size = PAGE_SIZE;
@@ -715,7 +737,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 	dma_addr_t dma_handle;
 
-	dma_handle =__iommu_dma_map(dev, phys, size, prot);
+	dma_handle = __iommu_dma_map(dev, phys, size, prot);
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(dev, phys, size, dir);
@@ -825,6 +847,9 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	unsigned long mask = dma_get_seg_boundary(dev);
 	int i;
 
+	if (unlikely(handle_deferred_device(dev, domain)))
+		return 0;
+
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
