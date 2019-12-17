Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FB6122854
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 11:08:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1B84185DD8;
	Tue, 17 Dec 2019 10:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgQzatGSVHaa; Tue, 17 Dec 2019 10:08:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67C6D85BFB;
	Tue, 17 Dec 2019 10:08:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49024C077D;
	Tue, 17 Dec 2019 10:08:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83227C077D;
 Tue, 17 Dec 2019 10:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 71DDC877A0;
 Tue, 17 Dec 2019 10:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id if6tcDxsm2Oo; Tue, 17 Dec 2019 10:08:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4099A8777C;
 Tue, 17 Dec 2019 10:08:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AAE48286; Tue, 17 Dec 2019 11:08:51 +0100 (CET)
Date: Tue, 17 Dec 2019 11:08:50 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/5] iommu: Implement iommu_put_resv_regions_simple()
Message-ID: <20191217100850.GI8689@8bytes.org>
References: <20191209145007.2433144-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209145007.2433144-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
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

Hi Thierry

On Mon, Dec 09, 2019 at 03:50:02PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Most IOMMU drivers only need to free the memory allocated for each
> reserved region. Instead of open-coding the loop to do this in each
> driver, extract the code into a common function that can be used by
> all these drivers.
> 
> Changes in v2:
> - change subject prefix to "iommu: virtio: " for virtio-iommu.c driver
> 
> Thierry
> 
> Thierry Reding (5):
>   iommu: Implement iommu_put_resv_regions_simple()
>   iommu: arm: Use iommu_put_resv_regions_simple()
>   iommu: amd: Use iommu_put_resv_regions_simple()
>   iommu: intel: Use iommu_put_resv_regions_simple()
>   iommu: virtio: Use iommu_put_resv_regions_simple()

Thanks, that is a nice consolidation. Just a minor nit, can you please
rename iommu_put_resv_regions_simple to
generic_iommu_put_resv_regsions(). That matches the naming in other
places where we have done similar things.

Thanks,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
