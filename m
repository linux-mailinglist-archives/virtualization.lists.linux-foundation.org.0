Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B78E25DFB9
	for <lists.virtualization@lfdr.de>; Fri,  4 Sep 2020 18:22:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B0B5C2E1B9;
	Fri,  4 Sep 2020 16:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJyEGPbxxgJX; Fri,  4 Sep 2020 16:22:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 953FA2E1BB;
	Fri,  4 Sep 2020 16:22:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FC3CC0051;
	Fri,  4 Sep 2020 16:22:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8DB4C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AF9D486E41
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDshEk4SFKRg
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:22:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4B5A886E3C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:22:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-HoCgFCb8OrCFEH8Fj3YbhQ-1; Fri, 04 Sep 2020 12:22:22 -0400
X-MC-Unique: HoCgFCb8OrCFEH8Fj3YbhQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55E8D189E60A;
 Fri,  4 Sep 2020 16:22:20 +0000 (UTC)
Received: from [10.36.112.51] (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91E247E165;
 Fri,  4 Sep 2020 16:22:14 +0000 (UTC)
Subject: Re: [PATCH v3 2/6] iommu/virtio: Add topology helpers
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org,
 virtio-dev@lists.oasis-open.org, linux-pci@vger.kernel.org
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
 <20200821131540.2801801-3-jean-philippe@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <21fce247-4c1c-b7a8-bcac-4d7b649eaeca@redhat.com>
Date: Fri, 4 Sep 2020 18:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200821131540.2801801-3-jean-philippe@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: lorenzo.pieralisi@arm.com, mst@redhat.com, joro@8bytes.org,
 sebastien.boeuf@intel.com, bhelgaas@google.com
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

Hi Jean,

On 8/21/20 3:15 PM, Jean-Philippe Brucker wrote:
> To support topology description from ACPI and from the builtin
> description, add helpers to keep track of I/O topology descriptors.
> 
> To ease re-use of the helpers by other drivers and future ACPI
> extensions, use the "virt_" prefix rather than "virtio_" when naming
> structs and functions.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/Kconfig                   |   3 +
>  drivers/iommu/virtio/Makefile           |   1 +
>  drivers/iommu/virtio/topology-helpers.h |  50 ++++++
>  include/linux/virt_iommu.h              |  15 ++
>  drivers/iommu/virtio/topology-helpers.c | 196 ++++++++++++++++++++++++
>  drivers/iommu/virtio/virtio-iommu.c     |   4 +
>  MAINTAINERS                             |   1 +
>  7 files changed, 270 insertions(+)
>  create mode 100644 drivers/iommu/virtio/topology-helpers.h
>  create mode 100644 include/linux/virt_iommu.h
>  create mode 100644 drivers/iommu/virtio/topology-helpers.c
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index bef5d75e306b..e29ae50f7100 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -391,4 +391,7 @@ config VIRTIO_IOMMU
>  
>  	  Say Y here if you intend to run this kernel as a guest.
>  
> +config VIRTIO_IOMMU_TOPOLOGY_HELPERS
> +	bool
> +
>  endif # IOMMU_SUPPORT
> diff --git a/drivers/iommu/virtio/Makefile b/drivers/iommu/virtio/Makefile
> index 279368fcc074..b42ad47eac7e 100644
> --- a/drivers/iommu/virtio/Makefile
> +++ b/drivers/iommu/virtio/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
> +obj-$(CONFIG_VIRTIO_IOMMU_TOPOLOGY_HELPERS) += topology-helpers.o
> diff --git a/drivers/iommu/virtio/topology-helpers.h b/drivers/iommu/virtio/topology-helpers.h
> new file mode 100644
> index 000000000000..436ca6a900c5
> --- /dev/null
> +++ b/drivers/iommu/virtio/topology-helpers.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef TOPOLOGY_HELPERS_H_
> +#define TOPOLOGY_HELPERS_H_
> +
> +#ifdef CONFIG_VIRTIO_IOMMU_TOPOLOGY_HELPERS
> +
> +/* Identify a device node in the topology */
> +struct virt_topo_dev_id {
> +	unsigned int			type;
> +#define VIRT_TOPO_DEV_TYPE_PCI		1
> +#define VIRT_TOPO_DEV_TYPE_MMIO		2
> +	union {
> +		/* PCI endpoint or range */
> +		struct {
> +			u16		segment;
> +			u16		bdf_start;
> +			u16		bdf_end;
> +		};
> +		/* MMIO region */
> +		u64			base;
> +	};
> +};
> +
> +/* Specification of an IOMMU */
> +struct virt_topo_iommu {
> +	struct virt_topo_dev_id		dev_id;
> +	struct device			*dev; /* transport device */
> +	struct fwnode_handle		*fwnode;
> +	struct iommu_ops		*ops;
> +	struct list_head		list;
> +};
> +
> +/* Specification of an endpoint */
> +struct virt_topo_endpoint {
> +	struct virt_topo_dev_id		dev_id;
> +	u32				endpoint_id;
> +	struct virt_topo_iommu		*viommu;
> +	struct list_head		list;
> +};
> +
> +void virt_topo_add_endpoint(struct virt_topo_endpoint *ep);
> +void virt_topo_add_iommu(struct virt_topo_iommu *viommu);
> +
> +void virt_topo_set_iommu_ops(struct device *dev, struct iommu_ops *ops);
> +
> +#else /* !CONFIG_VIRTIO_IOMMU_TOPOLOGY_HELPERS */
> +static inline void virt_topo_set_iommu_ops(struct device *dev, struct iommu_ops *ops)
> +{ }
> +#endif /* !CONFIG_VIRTIO_IOMMU_TOPOLOGY_HELPERS */
> +#endif /* TOPOLOGY_HELPERS_H_ */
> diff --git a/include/linux/virt_iommu.h b/include/linux/virt_iommu.h
> new file mode 100644
> index 000000000000..17d2bd4732e0
> --- /dev/null
> +++ b/include/linux/virt_iommu.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef VIRT_IOMMU_H_
> +#define VIRT_IOMMU_H_
> +
> +#ifdef CONFIG_VIRTIO_IOMMU_TOPOLOGY_HELPERS
> +int virt_dma_configure(struct device *dev);
> +
> +#else /* !CONFIG_VIRTIO_IOMMU_TOPOLOGY_HELPERS */
> +static inline int virt_dma_configure(struct device *dev)
> +{
> +	/* Don't disturb the normal DMA configuration methods */
> +	return 0;
> +}
> +#endif /* !CONFIG_VIRTIO_IOMMU_TOPOLOGY_HELPERS */
> +#endif /* VIRT_IOMMU_H_ */
> diff --git a/drivers/iommu/virtio/topology-helpers.c b/drivers/iommu/virtio/topology-helpers.c
> new file mode 100644
> index 000000000000..8815e3a5d431
> --- /dev/null
> +++ b/drivers/iommu/virtio/topology-helpers.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/dma-iommu.h>
> +#include <linux/list.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/virt_iommu.h>
> +
> +#include "topology-helpers.h"
> +
> +static LIST_HEAD(viommus);
> +static LIST_HEAD(pci_endpoints);
> +static LIST_HEAD(mmio_endpoints);
> +static DEFINE_MUTEX(viommus_lock);
> +
> +static bool virt_topo_device_match(struct device *dev,
> +				   struct virt_topo_dev_id *id)
> +{
> +	if (id->type == VIRT_TOPO_DEV_TYPE_PCI && dev_is_pci(dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev);
> +		u16 dev_id = pci_dev_id(pdev);
> +
> +		return pci_domain_nr(pdev->bus) == id->segment &&
> +			dev_id >= id->bdf_start &&
> +			dev_id <= id->bdf_end;
> +	} else if (id->type == VIRT_TOPO_DEV_TYPE_MMIO &&
> +		   dev_is_platform(dev)) {
> +		struct platform_device *plat_dev = to_platform_device(dev);
> +		struct resource *mem;
> +
> +		mem = platform_get_resource(plat_dev, IORESOURCE_MEM, 0);
> +		if (!mem)
> +			return false;
> +		return mem->start == id->base;
> +	}
> +	return false;
> +}
> +
> +static const struct iommu_ops *virt_iommu_setup(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct virt_topo_iommu *viommu = NULL;
> +	struct virt_topo_endpoint *ep;
> +	struct pci_dev *pci_dev = NULL;
> +	u32 epid;
> +	int ret;
> +
> +	/* Already translated? */
> +	if (fwspec && fwspec->ops)
> +		return NULL;
> +
> +	mutex_lock(&viommus_lock);
> +	if (dev_is_pci(dev)) {
> +		pci_dev = to_pci_dev(dev);
> +		list_for_each_entry(ep, &pci_endpoints, list) {
> +			if (virt_topo_device_match(dev, &ep->dev_id)) {
> +				epid = pci_dev_id(pci_dev) -
> +					ep->dev_id.bdf_start +
> +					ep->endpoint_id;
> +				viommu = ep->viommu;
> +				break;
> +			}
> +		}
> +	} else if (dev_is_platform(dev)) {
> +		list_for_each_entry(ep, &mmio_endpoints, list) {
> +			if (virt_topo_device_match(dev, &ep->dev_id)) {
> +				epid = ep->endpoint_id;
> +				viommu = ep->viommu;
> +				break;
> +			}
> +		}
> +	}
> +	mutex_unlock(&viommus_lock);
> +	if (!viommu)
> +		return NULL;
> +
> +	/* We're not translating ourselves. */
> +	if (virt_topo_device_match(dev, &viommu->dev_id) ||
> +	    dev == viommu->dev)
> +		return NULL;
> +
> +	/*
> +	 * If we found a PCI range managed by the viommu, we're the one that has
> +	 * to request ACS.
> +	 */
> +	if (pci_dev)
> +		pci_request_acs();
> +
> +	if (!viommu->ops)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	ret = iommu_fwspec_init(dev, viommu->fwnode, viommu->ops);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	iommu_fwspec_add_ids(dev, &epid, 1);
> +
> +	return viommu->ops;
> +}
> +
> +/**
> + * virt_topo_add_endpoint - Register endpoint specification
> + * @ep: the endpoint specification
> + */
> +void virt_topo_add_endpoint(struct virt_topo_endpoint *ep)
> +{
> +	mutex_lock(&viommus_lock);
> +	list_add(&ep->list,
> +		 ep->dev_id.type == VIRT_TOPO_DEV_TYPE_MMIO ?
> +		 &mmio_endpoints : &pci_endpoints);
> +	mutex_unlock(&viommus_lock);
> +}
> +
> +/**
> + * virt_topo_add_iommu - Register IOMMU specification
> + * @viommu: the IOMMU specification
> + */
> +void virt_topo_add_iommu(struct virt_topo_iommu *viommu)
> +{
> +	mutex_lock(&viommus_lock);
> +	list_add(&viommu->list, &viommus);
> +	mutex_unlock(&viommus_lock);
> +}
> +
> +/**
> + * virt_dma_configure - Configure DMA of virtualized devices
> + * @dev: the endpoint
> + *
> + * Setup the DMA and IOMMU ops of a virtual device, for platforms without DT or
> + * ACPI.
> + *
> + * Return: -EPROBE_DEFER if the device is managed by an IOMMU that hasn't been
> + *   probed yet, 0 otherwise
> + */
> +int virt_dma_configure(struct device *dev)
> +{
> +	const struct iommu_ops *iommu_ops;
> +
> +	iommu_ops = virt_iommu_setup(dev);
> +	if (IS_ERR_OR_NULL(iommu_ops)) {
> +		int ret = PTR_ERR(iommu_ops);
> +
> +		if (ret == -EPROBE_DEFER || ret == 0)
> +			return ret;
> +		dev_err(dev, "error %d while setting up virt IOMMU\n", ret);
> +		return 0;
why do we return 0 here?
> +	}
> +
> +	/*
> +	 * If we have reason to believe the IOMMU driver missed the initial
> +	 * add_device callback for dev, replay it to get things in order.
> +	 */
> +	if (dev->bus && !device_iommu_mapped(dev))
> +		iommu_probe_device(dev);
> +
> +	/* Assume coherent, as well as full 64-bit addresses. */
> +#ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
> +	arch_setup_dma_ops(dev, 0, ~0ULL, iommu_ops, true);
> +#else
> +	iommu_setup_dma_ops(dev, 0, ~0ULL);
> +#endif
> +	return 0;
> +}
> +
> +/**
> + * virt_topo_set_iommu_ops - Set the IOMMU ops of a virtual IOMMU device
> + * @dev: the IOMMU device (transport)
> + * @ops: the new IOMMU ops or NULL
> + *
> + * Setup the iommu_ops associated to an IOMMU, once the driver is loaded
> + * and the device probed.
> + */
> +void virt_topo_set_iommu_ops(struct device *dev, struct iommu_ops *ops)
> +{
> +	struct virt_topo_iommu *viommu;
> +
> +	mutex_lock(&viommus_lock);
> +	list_for_each_entry(viommu, &viommus, list) {
> +		/*
> +		 * In case the topology driver didn't have a dev handle when
> +		 * registering the topology, add it now.
> +		 */
> +		if (!viommu->dev &&
> +		    virt_topo_device_match(dev, &viommu->dev_id))
> +			viommu->dev = dev;
> +
> +		if (viommu->dev == dev) {
> +			viommu->ops = ops;
> +			viommu->fwnode = ops ? dev->fwnode : NULL;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&viommus_lock);
> +}
> +EXPORT_SYMBOL_GPL(virt_topo_set_iommu_ops);
> diff --git a/drivers/iommu/virtio/virtio-iommu.c b/drivers/iommu/virtio/virtio-iommu.c
> index b4da396cce60..b371d15f837f 100644
> --- a/drivers/iommu/virtio/virtio-iommu.c
> +++ b/drivers/iommu/virtio/virtio-iommu.c
> @@ -25,6 +25,8 @@
>  
>  #include <uapi/linux/virtio_iommu.h>
>  
> +#include "topology-helpers.h"
> +
>  #define MSI_IOVA_BASE			0x8000000
>  #define MSI_IOVA_LENGTH			0x100000
>  
> @@ -1065,6 +1067,7 @@ static int viommu_probe(struct virtio_device *vdev)
>  	if (ret)
>  		goto err_free_vqs;
>  
> +	virt_topo_set_iommu_ops(dev->parent, &viommu_ops);
>  	iommu_device_set_ops(&viommu->iommu, &viommu_ops);
>  	iommu_device_set_fwnode(&viommu->iommu, parent_dev->fwnode);
>  
> @@ -1111,6 +1114,7 @@ static void viommu_remove(struct virtio_device *vdev)
>  {
>  	struct viommu_dev *viommu = vdev->priv;
>  
> +	virt_topo_set_iommu_ops(vdev->dev.parent, NULL);
>  	iommu_device_sysfs_remove(&viommu->iommu);
>  	iommu_device_unregister(&viommu->iommu);
>  
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3602b223c9b2..8fd53c22a0ab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18452,6 +18452,7 @@ M:	Jean-Philippe Brucker <jean-philippe@linaro.org>
>  L:	virtualization@lists.linux-foundation.org
>  S:	Maintained
>  F:	drivers/iommu/virtio/
> +F:	include/linux/virt_iommu.h
>  F:	include/uapi/linux/virtio_iommu.h
>  
>  VIRTIO MEM DRIVER
> 
Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
