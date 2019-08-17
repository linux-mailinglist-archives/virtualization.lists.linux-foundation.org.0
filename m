Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1A90C76
	for <lists.virtualization@lfdr.de>; Sat, 17 Aug 2019 05:39:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 38E53C6A;
	Sat, 17 Aug 2019 03:39:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1E02EB2F
	for <virtualization@lists.linux-foundation.org>;
	Sat, 17 Aug 2019 03:39:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
	[202.108.3.165])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 33E0163D
	for <virtualization@lists.linux-foundation.org>;
	Sat, 17 Aug 2019 03:39:29 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.131.78.247])
	by sina.com with ESMTP
	id 5D5776EB00008B47; Sat, 17 Aug 2019 11:39:27 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 426700329115
From: Hillf Danton <hdanton@sina.com>
To: Tom Murphy <murphyt7@tcd.ie>
Subject: Re: [PATCH V5 3/5] iommu/dma-iommu: Handle deferred devices
Date: Sat, 17 Aug 2019 11:39:14 +0800
Message-Id: <20190817033914.4812-1-hdanton@sina.com>
In-Reply-To: <20190815110944.3579-1-murphyt7@tcd.ie>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
	Kukjin Kim <kgene@kernel.org>, Robin Murphy <robin.murphy@arm.com>
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


On Thu, 15 Aug 2019 12:09:41 +0100 Tom Murphy wrote:
> 
> Handle devices which defer their attach to the iommu in the dma-iommu api
> 
> Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
> ---
>  drivers/iommu/dma-iommu.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 2712fbc68b28..906b7fa14d3c 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -22,6 +22,7 @@
>  #include <linux/pci.h>
>  #include <linux/scatterlist.h>
>  #include <linux/vmalloc.h>
> +#include <linux/crash_dump.h>
>  
>  struct iommu_dma_msi_page {
>  	struct list_head	list;
> @@ -351,6 +352,21 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
>  	return iova_reserve_iommu_regions(dev, domain);
>  }
>  
> +static int handle_deferred_device(struct device *dev,
> +	struct iommu_domain *domain)
> +{
> +	const struct iommu_ops *ops = domain->ops;
> +
> +	if (!is_kdump_kernel())
> +		return 0;
> +
> +	if (unlikely(ops->is_attach_deferred &&
> +		ops->is_attach_deferred(domain, dev)))
> +		return iommu_attach_device(domain, dev);
> +
> +	return 0;
> +}
> +
>  /**
>   * dma_info_to_prot - Translate DMA API directions and attributes to IOMMU API
>   *                    page flags.
> @@ -463,6 +479,9 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
>  	size_t iova_off = iova_offset(iovad, phys);
>  	dma_addr_t iova;
>  
> +	if (unlikely(handle_deferred_device(dev, domain)))
> +		return DMA_MAPPING_ERROR;
> +
>  	size = iova_align(iovad, size + iova_off);
>  
>  	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);

iommu_map_atomic() is applied to __iommu_dma_map() in 2/5.
Is it an atomic context currently given the mutex_lock() in
iommu_attach_device()?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
