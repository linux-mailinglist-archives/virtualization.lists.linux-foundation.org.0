Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA03404E0
	for <lists.virtualization@lfdr.de>; Thu, 18 Mar 2021 12:43:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18D684261;
	Thu, 18 Mar 2021 11:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lCUXtXxv2mH; Thu, 18 Mar 2021 11:43:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D8828427E;
	Thu, 18 Mar 2021 11:43:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16B51C0010;
	Thu, 18 Mar 2021 11:43:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47EB7C0001;
 Thu, 18 Mar 2021 11:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25CE74EC25;
 Thu, 18 Mar 2021 11:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5nW4drxCz7U; Thu, 18 Mar 2021 11:43:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38CA64E22C;
 Thu, 18 Mar 2021 11:43:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E89FED1;
 Thu, 18 Mar 2021 04:43:47 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3F013F792;
 Thu, 18 Mar 2021 04:43:44 -0700 (PDT)
Subject: Re: [PATCH 3/3] iommu/virtio: Enable x86 support
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, rjw@rjwysocki.net,
 lenb@kernel.org, joro@8bytes.org, mst@redhat.com
References: <20210316191652.3401335-1-jean-philippe@linaro.org>
 <20210316191652.3401335-4-jean-philippe@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2d57860b-8a1c-f345-1105-62680c003fb5@arm.com>
Date: Thu, 18 Mar 2021 11:43:38 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316191652.3401335-4-jean-philippe@linaro.org>
Content-Language: en-GB
Cc: lorenzo.pieralisi@arm.com, eric.auger@redhat.com,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com, will@kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 2021-03-16 19:16, Jean-Philippe Brucker wrote:
> With the VIOT support in place, x86 platforms can now use the
> virtio-iommu.
> 
> The arm64 Kconfig selects IOMMU_DMA, while x86 IOMMU drivers select it
> themselves.

Actually, now that both AMD and Intel are converted over, maybe it's 
finally time to punt that to x86 arch code to match arm64?

Robin.

> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   drivers/iommu/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 2819b5c8ec30..ccca83ef2f06 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -400,8 +400,9 @@ config HYPERV_IOMMU
>   config VIRTIO_IOMMU
>   	tristate "Virtio IOMMU driver"
>   	depends on VIRTIO
> -	depends on ARM64
> +	depends on (ARM64 || X86)
>   	select IOMMU_API
> +	select IOMMU_DMA if X86
>   	select INTERVAL_TREE
>   	select ACPI_VIOT if ACPI
>   	help
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
