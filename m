Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D66A34E7C5
	for <lists.virtualization@lfdr.de>; Tue, 30 Mar 2021 14:47:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D902D60720;
	Tue, 30 Mar 2021 12:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_XWBj4PSGw7; Tue, 30 Mar 2021 12:47:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 983DC60799;
	Tue, 30 Mar 2021 12:47:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5094C0017;
	Tue, 30 Mar 2021 12:47:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EBD5C000A;
 Tue, 30 Mar 2021 12:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7532660799;
 Tue, 30 Mar 2021 12:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H43rWAxX-jeB; Tue, 30 Mar 2021 12:46:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D97A660720;
 Tue, 30 Mar 2021 12:46:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3199619B1;
 Tue, 30 Mar 2021 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617108417;
 bh=Gp7K5d/9JkaqMV3qnVlhi8uY18tBiGcqTqq9JQwzkk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpwoXfzSTI3OVxxT2qtuhI8DBVsGK1w2yo1XJO96Mcl6Cf7j98u0D7WhigRHOVp76
 jDVKAszVft1N//apcCn6FfTFty159qo7bzFF1FayYDictlQn2pRCLv717rqFyesXh6
 g/qwrAId2++/WokGRt8nGZEDGbvdPTeM6c+yqRQokfC3Qr+akdDdbTY7EJdRxABvTD
 356fURN2pLtcawXNYFkMj/4iVtdUrMed1IC/yAYXh7FliEQtMGcEDxYEIh/YHATK5l
 0cbhI80eGEGy6vBu0Pz0nymgiC2g+OQuCq7/dYQEV4VJ4nIDFcytvB+5jrYD5CldVL
 VUbbcLl88d4eQ==
Date: Tue, 30 Mar 2021 13:46:51 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/18] iommu/fsl_pamu: merge pamu_set_liodn and map_liodn
Message-ID: <20210330124651.GH5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-9-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
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

On Tue, Mar 16, 2021 at 04:38:14PM +0100, Christoph Hellwig wrote:
> Merge the two fuctions that configure the ppaace into a single coherent
> function.  I somehow doubt we need the two pamu_config_ppaace calls,
> but keep the existing behavior just to be on the safe side.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 65 +++++++++------------------------
>  1 file changed, 17 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> index 40eff4b7bc5d42..4a4944332674f7 100644
> --- a/drivers/iommu/fsl_pamu_domain.c
> +++ b/drivers/iommu/fsl_pamu_domain.c
> @@ -54,25 +54,6 @@ static int __init iommu_init_mempool(void)
>  	return 0;
>  }
>  
> -/* Map the DMA window corresponding to the LIODN */
> -static int map_liodn(int liodn, struct fsl_dma_domain *dma_domain)
> -{
> -	int ret;
> -	struct iommu_domain_geometry *geom = &dma_domain->iommu_domain.geometry;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&iommu_lock, flags);
> -	ret = pamu_config_ppaace(liodn, geom->aperture_start,
> -				 geom->aperture_end - 1, ~(u32)0,
> -				 0, dma_domain->snoop_id, dma_domain->stash_id,
> -				 PAACE_AP_PERMS_QUERY | PAACE_AP_PERMS_UPDATE);
> -	spin_unlock_irqrestore(&iommu_lock, flags);
> -	if (ret)
> -		pr_debug("PAACE configuration failed for liodn %d\n", liodn);
> -
> -	return ret;
> -}
> -
>  static int update_liodn_stash(int liodn, struct fsl_dma_domain *dma_domain,
>  			      u32 val)
>  {
> @@ -94,11 +75,11 @@ static int update_liodn_stash(int liodn, struct fsl_dma_domain *dma_domain,
>  }
>  
>  /* Set the geometry parameters for a LIODN */
> -static int pamu_set_liodn(int liodn, struct device *dev,
> -			  struct fsl_dma_domain *dma_domain,
> -			  struct iommu_domain_geometry *geom_attr)
> +static int pamu_set_liodn(struct fsl_dma_domain *dma_domain, struct device *dev,
> +			  int liodn)
>  {
> -	phys_addr_t window_addr, window_size;
> +	struct iommu_domain *domain = &dma_domain->iommu_domain;
> +	struct iommu_domain_geometry *geom = &domain->geometry;
>  	u32 omi_index = ~(u32)0;
>  	unsigned long flags;
>  	int ret;
> @@ -110,22 +91,25 @@ static int pamu_set_liodn(int liodn, struct device *dev,
>  	 */
>  	get_ome_index(&omi_index, dev);
>  
> -	window_addr = geom_attr->aperture_start;
> -	window_size = geom_attr->aperture_end + 1;
> -
>  	spin_lock_irqsave(&iommu_lock, flags);
>  	ret = pamu_disable_liodn(liodn);
> -	if (!ret)
> -		ret = pamu_config_ppaace(liodn, window_addr, window_size, omi_index,
> -					 0, dma_domain->snoop_id,
> -					 dma_domain->stash_id, 0);
> +	if (ret)
> +		goto out_unlock;
> +	ret = pamu_config_ppaace(liodn, geom->aperture_start,
> +				 geom->aperture_end - 1, omi_index, 0,
> +				 dma_domain->snoop_id, dma_domain->stash_id, 0);
> +	if (ret)
> +		goto out_unlock;
> +	ret = pamu_config_ppaace(liodn, geom->aperture_start,
> +				 geom->aperture_end - 1, ~(u32)0,
> +				 0, dma_domain->snoop_id, dma_domain->stash_id,
> +				 PAACE_AP_PERMS_QUERY | PAACE_AP_PERMS_UPDATE);

There's more '+1' / '-1' confusion here with aperture_end which I'm not
managing to follow. What am I missing?

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
