Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D52661BC4EF
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 18:18:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 657A586C0E;
	Tue, 28 Apr 2020 16:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RN0iL9VP13an; Tue, 28 Apr 2020 16:18:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E3F6686DC1;
	Tue, 28 Apr 2020 16:18:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFD7AC0864;
	Tue, 28 Apr 2020 16:18:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97744C0864
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 873828542A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZjKxDjBrwug
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:18:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6E67A84542
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588090687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WrTkpt0zQjIGoVsJ+cH+Nc4pSRf/M9dJE/GUuAEad3Y=;
 b=cU8sMDSIz8g7kjAyFuSLzNlOTCuxZXxRlWVNJUasOsl91lARqGppHHv4xezfaakhI2DZqE
 RxJBw0a81wBhcHcVUan2JxvSFEsa6665IMo1f9siC2SKMjfFyeo3I2wgXeEZ7V7T3f6zzl
 CQqwGpCkhP/75pH9mH1//zIOZyb2ZC8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-i9hCISDLMqG-a_ihKnK6Ow-1; Tue, 28 Apr 2020 12:18:02 -0400
X-MC-Unique: i9hCISDLMqG-a_ihKnK6Ow-1
Received: by mail-wm1-f72.google.com with SMTP id l21so1305457wmh.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 09:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WrTkpt0zQjIGoVsJ+cH+Nc4pSRf/M9dJE/GUuAEad3Y=;
 b=mIhCJjaFAf9O1FLvLbvHorV+avUfinrwy/gsM/TEYXszcGdZVtGNZaPQU5Jx4CCI/N
 5nDc8Heue7IAPzWnzqdOrpJTsmxc4xVZ4xjJ8z2oBcg2Jv7N/m8fPjZw1E6+RJFQNYRe
 5cz7+MrZkBhH14QIE9Z3KY1zS9YFqp8oNyhpTZrGSG1s1Fj28WKOxKkt0u2HcuR4VB+e
 3jJhvSmcpcvP3L3sMkyuIVq1uCiWdUhZziWQge1YHy+CeeWy5zKMgmvG0NcJUfNg8QPj
 oqfVHPxp3aBiNxo53YjJFdF6u9ae0VJOyrULGH2qfvpXhpCOqABiva2aAxqE3goenM7o
 At0Q==
X-Gm-Message-State: AGi0PuYfD5nLZloWn2kQt089qPKSQmAFaqw1pcLUrTe0EVpDDJD/NEs6
 Yf4WuzGc5SlN3Nbqmx4uRMwTPGTYQHgO+38S0G3sh3n9zxLnV3hwCjDMCfnu7xLFLSpstYFMN03
 AoKI36vccBxGESOEMgQPuRUwPcHfraZ27hhrM8Kg/zg==
X-Received: by 2002:adf:9441:: with SMTP id 59mr33416035wrq.211.1588090681445; 
 Tue, 28 Apr 2020 09:18:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypIYoDCVusGqXtqrxbuMJvf1/RoAUchaevs0E3usDHiJ5r5Npmen3zHgzU45luq3zqE5unsUSA==
X-Received: by 2002:adf:9441:: with SMTP id 59mr33416017wrq.211.1588090681194; 
 Tue, 28 Apr 2020 09:18:01 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 n7sm3878146wmd.11.2020.04.28.09.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:18:00 -0700 (PDT)
Date: Tue, 28 Apr 2020 12:17:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200428121232-mutt-send-email-mst@kernel.org>
References: <1588073958-1793-1-git-send-email-vatsa@codeaurora.org>
 <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, will@kernel.org, linux-kernel@vger.kernel.org,
 pratikp@codeaurora.org
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

On Tue, Apr 28, 2020 at 05:09:18PM +0530, Srivatsa Vaddagiri wrote:
> For better security, its desirable that a guest VM's memory is
> not accessible to any entity that executes outside the context of
> guest VM. In case of virtio, backend drivers execute outside the
> context of guest VM and in general will need access to complete
> guest VM memory.  One option to restrict the access provided to
> backend driver is to make use of a bounce buffer. The bounce
> buffer is accessible to both backend and frontend drivers. All IO
> buffers that are in private space of guest VM are bounced to be
> accessible to backend.
> 
> This patch proposes a new memory pool to be used for this bounce
> purpose, rather than the default swiotlb memory pool. That will
> avoid any conflicts that may arise in situations where a VM needs
> to use swiotlb pool for driving any pass-through devices (in
> which case swiotlb memory needs not be shared with another VM) as
> well as virtio devices (which will require swiotlb memory to be
> shared with backend VM). As a possible extension to this patch,
> we can provide an option for virtio to make use of default
> swiotlb memory pool itself, where no such conflicts may exist in
> a given deployment.
> 
> Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>


Okay, but how is all this virtio specific?  For example, why not allow
separate swiotlbs for any type of device?
For example, this might make sense if a given device is from a
different, less trusted vendor.
All this can then maybe be hidden behind the DMA API.



> ---
>  drivers/virtio/Makefile        |   2 +-
>  drivers/virtio/virtio.c        |   2 +
>  drivers/virtio/virtio_bounce.c | 150 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/virtio.h         |   4 ++
>  4 files changed, 157 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/virtio/virtio_bounce.c
> 
> diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> index 29a1386e..3fd3515 100644
> --- a/drivers/virtio/Makefile
> +++ b/drivers/virtio/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_bounce.o
>  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
>  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
>  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index a977e32..bc2f779 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -329,6 +329,7 @@ int register_virtio_device(struct virtio_device *dev)
>  
>  	dev->index = err;
>  	dev_set_name(&dev->dev, "virtio%u", dev->index);
> +	virtio_bounce_set_dma_ops(dev);
>  
>  	spin_lock_init(&dev->config_lock);
>  	dev->config_enabled = false;
> @@ -431,6 +432,7 @@ EXPORT_SYMBOL_GPL(virtio_device_restore);
>  
>  static int virtio_init(void)
>  {
> +	virtio_map_bounce_buffer();
>  	if (bus_register(&virtio_bus) != 0)
>  		panic("virtio bus registration failed");
>  	return 0;
> diff --git a/drivers/virtio/virtio_bounce.c b/drivers/virtio/virtio_bounce.c
> new file mode 100644
> index 0000000..3de8e0e
> --- /dev/null
> +++ b/drivers/virtio/virtio_bounce.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Virtio DMA ops to bounce buffers
> + *
> + *  Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + *
> + * This module allows bouncing of IO buffers to a region which will be
> + * accessible to backend drivers.
> + */
> +
> +#include <linux/virtio.h>
> +#include <linux/io.h>
> +#include <linux/swiotlb.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +
> +static phys_addr_t bounce_buf_paddr;
> +static void *bounce_buf_vaddr;
> +static size_t bounce_buf_size;
> +struct swiotlb_pool *virtio_pool;
> +
> +#define VIRTIO_MAX_BOUNCE_SIZE	(16*4096)
> +
> +static void *virtio_alloc_coherent(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, gfp_t gfp_flags, unsigned long attrs)
> +{
> +	phys_addr_t addr;
> +
> +	if (!virtio_pool)
> +		return NULL;
> +
> +	addr = swiotlb_alloc(virtio_pool, size, bounce_buf_paddr, ULONG_MAX);
> +	if (addr == DMA_MAPPING_ERROR)
> +		return NULL;
> +
> +	*dma_handle = (addr - bounce_buf_paddr);
> +
> +	return bounce_buf_vaddr + (addr - bounce_buf_paddr);
> +}
> +
> +static void virtio_free_coherent(struct device *dev, size_t size, void *vaddr,
> +		dma_addr_t dma_handle, unsigned long attrs)
> +{
> +	phys_addr_t addr = (dma_handle + bounce_buf_paddr);
> +
> +	swiotlb_free(virtio_pool, addr, size);
> +}
> +
> +static dma_addr_t virtio_map_page(struct device *dev, struct page *page,
> +		unsigned long offset, size_t size,
> +		enum dma_data_direction dir, unsigned long attrs)
> +{
> +	void *ptr = page_address(page) + offset;
> +	phys_addr_t paddr = virt_to_phys(ptr);
> +	dma_addr_t handle;
> +
> +	if (!virtio_pool)
> +		return DMA_MAPPING_ERROR;
> +
> +	handle = _swiotlb_tbl_map_single(virtio_pool, dev, bounce_buf_paddr,
> +					 paddr, size, size, dir, attrs);
> +	if (handle == (phys_addr_t)DMA_MAPPING_ERROR)
> +		return DMA_MAPPING_ERROR;
> +
> +	return handle - bounce_buf_paddr;
> +}
> +
> +static void virtio_unmap_page(struct device *dev, dma_addr_t dev_addr,
> +		size_t size, enum dma_data_direction dir, unsigned long attrs)
> +{
> +	phys_addr_t addr = dev_addr + bounce_buf_paddr;
> +
> +	_swiotlb_tbl_unmap_single(virtio_pool, dev, addr, size,
> +					size, dir, attrs);
> +}
> +
> +size_t virtio_max_mapping_size(struct device *dev)
> +{
> +	return VIRTIO_MAX_BOUNCE_SIZE;
> +}
> +
> +static const struct dma_map_ops virtio_dma_ops = {
> +	.alloc			= virtio_alloc_coherent,
> +	.free			= virtio_free_coherent,
> +	.map_page		= virtio_map_page,
> +	.unmap_page		= virtio_unmap_page,
> +	.max_mapping_size	= virtio_max_mapping_size,
> +};
> +
> +void virtio_bounce_set_dma_ops(struct virtio_device *vdev)
> +{
> +	if (!bounce_buf_paddr)
> +		return;
> +
> +	set_dma_ops(vdev->dev.parent, &virtio_dma_ops);


I don't think DMA API maintainers will be happy with new users
of set_dma_ops.

> +}
> +
> +int virtio_map_bounce_buffer(void)
> +{
> +	int ret;
> +
> +	if (!bounce_buf_paddr)
> +		return 0;
> +
> +	/*
> +	 * Map region as 'cacheable' memory. This will reduce access latency for
> +	 * backend.
> +	 */
> +	bounce_buf_vaddr = memremap(bounce_buf_paddr,
> +				bounce_buf_size, MEMREMAP_WB);
> +	if (!bounce_buf_vaddr)
> +		return -ENOMEM;
> +
> +	memset(bounce_buf_vaddr, 0, bounce_buf_size);
> +	virtio_pool = swiotlb_register_pool("virtio_swiotlb", bounce_buf_paddr,
> +				bounce_buf_vaddr, bounce_buf_size);
> +	if (IS_ERR(virtio_pool)) {
> +		ret = PTR_ERR(virtio_pool);
> +		virtio_pool = NULL;
> +		memunmap(bounce_buf_vaddr);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int virtio_register_bounce_buffer(phys_addr_t base, size_t size)
> +{
> +	if (bounce_buf_paddr || !base || size < PAGE_SIZE)
> +		return -EINVAL;
> +
> +	bounce_buf_paddr = base;
> +	bounce_buf_size = size;
> +
> +	return 0;
> +}
> +
> +static int __init virtio_bounce_setup(struct reserved_mem *rmem)
> +{
> +	unsigned long node = rmem->fdt_node;
> +
> +	if (!of_get_flat_dt_prop(node, "no-map", NULL))
> +		return -EINVAL;
> +
> +	return virtio_register_bounce_buffer(rmem->base, rmem->size);
> +}
> +
> +RESERVEDMEM_OF_DECLARE(virtio, "virtio_bounce_pool", virtio_bounce_setup);
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index a493eac..c4970c5 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -134,12 +134,16 @@ void virtio_config_changed(struct virtio_device *dev);
>  void virtio_config_disable(struct virtio_device *dev);
>  void virtio_config_enable(struct virtio_device *dev);
>  int virtio_finalize_features(struct virtio_device *dev);
> +int virtio_register_bounce_buffer(phys_addr_t base, size_t size);
> +
>  #ifdef CONFIG_PM_SLEEP
>  int virtio_device_freeze(struct virtio_device *dev);
>  int virtio_device_restore(struct virtio_device *dev);
>  #endif
>  
>  size_t virtio_max_dma_size(struct virtio_device *vdev);
> +extern int virtio_map_bounce_buffer(void);
> +extern void virtio_bounce_set_dma_ops(struct virtio_device *dev);
>  
>  #define virtio_device_for_each_vq(vdev, vq) \
>  	list_for_each_entry(vq, &vdev->vqs, list)
> -- 
> 2.7.4
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
