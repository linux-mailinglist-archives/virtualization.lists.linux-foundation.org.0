Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CA00D15E8D7
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 18:03:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6C240876BE;
	Fri, 14 Feb 2020 17:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vme6Hmowq7X9; Fri, 14 Feb 2020 17:03:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF1E1876BF;
	Fri, 14 Feb 2020 17:03:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78763C1D92;
	Fri, 14 Feb 2020 17:03:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D494C0177;
 Fri, 14 Feb 2020 17:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7BD4486886;
 Fri, 14 Feb 2020 17:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiPj_y5lFy28; Fri, 14 Feb 2020 17:03:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8A67D86892;
 Fri, 14 Feb 2020 17:03:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABC8B328;
 Fri, 14 Feb 2020 09:03:18 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 683133F68E;
 Fri, 14 Feb 2020 09:03:17 -0800 (PST)
Subject: Re: [PATCH 2/3] PCI: Add DMA configuration for virtual platforms
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org,
 linux-pci@vger.kernel.org
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
 <20200214160413.1475396-3-jean-philippe@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <393cce27-dbed-f075-2a67-9882bed801e7@arm.com>
Date: Fri, 14 Feb 2020 17:03:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200214160413.1475396-3-jean-philippe@linaro.org>
Content-Language: en-GB
Cc: mst@redhat.com, sebastien.boeuf@intel.com, jacob.jun.pan@intel.com,
 bhelgaas@google.com
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

On 14/02/2020 4:04 pm, Jean-Philippe Brucker wrote:
> Hardware platforms usually describe the IOMMU topology using either
> device-tree pointers or vendor-specific ACPI tables.  For virtual
> platforms that don't provide a device-tree, the virtio-iommu device
> contains a description of the endpoints it manages.  That information
> allows us to probe endpoints after the IOMMU is probed (possibly as late
> as userspace modprobe), provided it is discovered early enough.
> 
> Add a hook to pci_dma_configure(), which returns -EPROBE_DEFER if the
> endpoint is managed by a vIOMMU that will be loaded later, or 0 in any
> other case to avoid disturbing the normal DMA configuration methods.
> When CONFIG_VIRTIO_IOMMU_TOPOLOGY isn't selected, the call to
> virt_dma_configure() is compiled out.
> 
> As long as the information is consistent, platforms can provide both a
> device-tree and a built-in topology, and the IOMMU infrastructure is
> able to deal with multiple DMA configuration methods.

Urgh, it's already been established[1] that having IOMMU setup tied to 
DMA configuration at driver probe time is not just conceptually wrong 
but actually broken, so the concept here worries me a bit. In a world 
where of_iommu_configure() and friends are being called much earlier 
around iommu_probe_device() time, how badly will this fall apart?

Robin.

[1] 
https://lore.kernel.org/linux-iommu/9625faf4-48ef-2dd3-d82f-931d9cf26976@huawei.com/

> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   drivers/pci/pci-driver.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 0454ca0e4e3f..69303a814f21 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -18,6 +18,7 @@
>   #include <linux/kexec.h>
>   #include <linux/of_device.h>
>   #include <linux/acpi.h>
> +#include <linux/virt_iommu.h>
>   #include "pci.h"
>   #include "pcie/portdrv.h"
>   
> @@ -1602,6 +1603,10 @@ static int pci_dma_configure(struct device *dev)
>   	struct device *bridge;
>   	int ret = 0;
>   
> +	ret = virt_dma_configure(dev);
> +	if (ret)
> +		return ret;
> +
>   	bridge = pci_get_host_bridge_device(to_pci_dev(dev));
>   
>   	if (IS_ENABLED(CONFIG_OF) && bridge->parent &&
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
