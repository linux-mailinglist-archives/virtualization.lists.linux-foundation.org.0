Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62B25DEFC
	for <lists.virtualization@lfdr.de>; Fri,  4 Sep 2020 18:05:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C3A358757B;
	Fri,  4 Sep 2020 16:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQMCXo-7lZBm; Fri,  4 Sep 2020 16:05:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D0FB2873FF;
	Fri,  4 Sep 2020 16:05:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B16E2C0051;
	Fri,  4 Sep 2020 16:05:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83686C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6846487576
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hoQ7egvnZG-r
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:05:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0C8A287579
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:05:48 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-UQ4FL6l0OySj3rA8dqd6Og-1; Fri, 04 Sep 2020 12:05:46 -0400
X-MC-Unique: UQ4FL6l0OySj3rA8dqd6Og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D141005E7C;
 Fri,  4 Sep 2020 16:05:43 +0000 (UTC)
Received: from [10.36.112.51] (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8070B10013BD;
 Fri,  4 Sep 2020 16:05:37 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] iommu/virtio: Support topology description in
 config space
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org,
 virtio-dev@lists.oasis-open.org, linux-pci@vger.kernel.org
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
 <20200821131540.2801801-6-jean-philippe@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a52f8a2e-3453-eadf-9761-fd92a20c20f5@redhat.com>
Date: Fri, 4 Sep 2020 18:05:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200821131540.2801801-6-jean-philippe@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
> Platforms without device-tree nor ACPI can provide a topology
> description embedded into the virtio config space. Parse it.
> 
> Use PCI FIXUP to probe the config space early, because we need to
> discover the topology before any DMA configuration takes place, and the
> virtio driver may be loaded much later. Since we discover the topology
> description when probing the PCI hierarchy, the virtual IOMMU cannot
> manage other platform devices discovered earlier.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/Kconfig           |  12 ++
>  drivers/iommu/virtio/Makefile   |   1 +
>  drivers/iommu/virtio/topology.c | 259 ++++++++++++++++++++++++++++++++
>  3 files changed, 272 insertions(+)
>  create mode 100644 drivers/iommu/virtio/topology.c
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index e29ae50f7100..98d28fdbc19a 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -394,4 +394,16 @@ config VIRTIO_IOMMU
>  config VIRTIO_IOMMU_TOPOLOGY_HELPERS
>  	bool
>  
> +config VIRTIO_IOMMU_TOPOLOGY
> +	bool "Handle topology properties from the virtio-iommu"
> +	depends on VIRTIO_IOMMU
> +	depends on PCI
> +	default y
> +	select VIRTIO_IOMMU_TOPOLOGY_HELPERS
> +	help
> +	  Enable early probing of virtio-iommu devices to detect the built-in
> +	  topology description.
> +
> +	  Say Y here if you intend to run this kernel as a guest.
> +
>  endif # IOMMU_SUPPORT
> diff --git a/drivers/iommu/virtio/Makefile b/drivers/iommu/virtio/Makefile
> index b42ad47eac7e..1eda8ca1cbbf 100644
> --- a/drivers/iommu/virtio/Makefile
> +++ b/drivers/iommu/virtio/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
> +obj-$(CONFIG_VIRTIO_IOMMU_TOPOLOGY) += topology.o
>  obj-$(CONFIG_VIRTIO_IOMMU_TOPOLOGY_HELPERS) += topology-helpers.o
> diff --git a/drivers/iommu/virtio/topology.c b/drivers/iommu/virtio/topology.c
> new file mode 100644
> index 000000000000..4923eec618b9
> --- /dev/null
> +++ b/drivers/iommu/virtio/topology.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/io-64-nonatomic-hi-lo.h>
> +#include <linux/iopoll.h>
> +#include <linux/list.h>
> +#include <linux/pci.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_pci.h>
> +#include <uapi/linux/virtio_config.h>
> +#include <uapi/linux/virtio_iommu.h>
> +
> +#include "topology-helpers.h"
> +
> +struct viommu_cap_config {
> +	u8 bar;
> +	u32 length; /* structure size */
> +	u32 offset; /* structure offset within the bar */
> +};
> +
> +struct viommu_topo_header {
> +	u8 type;
> +	u8 reserved;
> +	u16 length;
> +};
> +
> +static struct virt_topo_endpoint *
> +viommu_parse_node(void __iomem *buf, size_t len)
> +{
> +	int ret = -EINVAL;
> +	union {
> +		struct viommu_topo_header hdr;
> +		struct virtio_iommu_topo_pci_range pci;
> +		struct virtio_iommu_topo_mmio mmio;
> +	} __iomem *cfg = buf;
> +	struct virt_topo_endpoint *spec;
> +
> +	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
> +	if (!spec)
> +		return ERR_PTR(-ENOMEM);
> +
> +	switch (ioread8(&cfg->hdr.type)) {
> +	case VIRTIO_IOMMU_TOPO_PCI_RANGE:
> +		if (len < sizeof(cfg->pci))
> +			goto err_free;
> +
> +		spec->dev_id.type = VIRT_TOPO_DEV_TYPE_PCI;
> +		spec->dev_id.segment = ioread16(&cfg->pci.segment);
> +		spec->dev_id.bdf_start = ioread16(&cfg->pci.bdf_start);
> +		spec->dev_id.bdf_end = ioread16(&cfg->pci.bdf_end);
> +		spec->endpoint_id = ioread32(&cfg->pci.endpoint_start);
> +		break;
> +	case VIRTIO_IOMMU_TOPO_MMIO:
> +		if (len < sizeof(cfg->mmio))
> +			goto err_free;
> +
> +		spec->dev_id.type = VIRT_TOPO_DEV_TYPE_MMIO;
> +		spec->dev_id.base = ioread64(&cfg->mmio.address);
> +		spec->endpoint_id = ioread32(&cfg->mmio.endpoint);
> +		break;
> +	default:
> +		pr_warn("unhandled format 0x%x\n", ioread8(&cfg->hdr.type));
> +		ret = 0;
> +		goto err_free;
> +	}
> +	return spec;
> +
> +err_free:
> +	kfree(spec);
> +	return ERR_PTR(ret);
> +}
> +
> +static int viommu_parse_topology(struct device *dev,
> +				 struct virtio_iommu_config __iomem *cfg,
> +				 size_t max_len)
> +{
> +	int ret;
> +	u16 len;
> +	size_t i;
> +	LIST_HEAD(endpoints);
> +	size_t offset, count;
> +	struct virt_topo_iommu *viommu;
> +	struct virt_topo_endpoint *ep, *next;
> +	struct viommu_topo_header __iomem *cur;
> +
> +	offset = ioread16(&cfg->topo_config.offset);
> +	count = ioread16(&cfg->topo_config.count);
> +	if (!offset || !count)
> +		return 0;
> +
> +	viommu = kzalloc(sizeof(*viommu), GFP_KERNEL);
> +	if (!viommu)
> +		return -ENOMEM;
> +
> +	viommu->dev = dev;
> +
> +	for (i = 0; i < count; i++, offset += len) {
> +		if (offset + sizeof(*cur) > max_len) {
> +			ret = -EOVERFLOW;
> +			goto err_free;
> +		}
> +
> +		cur = (void __iomem *)cfg + offset;
> +		len = ioread16(&cur->length);
> +		if (offset + len > max_len) {
> +			ret = -EOVERFLOW;
> +			goto err_free;
> +		}
> +
> +		ep = viommu_parse_node((void __iomem *)cur, len);
> +		if (!ep) {
> +			continue;
> +		} else if (IS_ERR(ep)) {
> +			ret = PTR_ERR(ep);
> +			goto err_free;
> +		}
> +
> +		ep->viommu = viommu;
> +		list_add(&ep->list, &endpoints);
> +	}
> +
> +	list_for_each_entry_safe(ep, next, &endpoints, list)
> +		/* Moves ep to the helpers list */
> +		virt_topo_add_endpoint(ep);
> +	virt_topo_add_iommu(viommu);
> +
> +	return 0;
> +err_free:
> +	list_for_each_entry_safe(ep, next, &endpoints, list)
> +		kfree(ep);
> +	kfree(viommu);
> +	return ret;
> +}
> +
> +#define VPCI_FIELD(field) offsetof(struct virtio_pci_cap, field)
> +
> +static inline int viommu_pci_find_capability(struct pci_dev *dev, u8 cfg_type,
> +					     struct viommu_cap_config *cap)
not sure the inline is useful here
> +{
> +	int pos;
> +	u8 bar;
> +
> +	for (pos = pci_find_capability(dev, PCI_CAP_ID_VNDR);
> +	     pos > 0;
> +	     pos = pci_find_next_capability(dev, pos, PCI_CAP_ID_VNDR)) {
> +		u8 type;
> +
> +		pci_read_config_byte(dev, pos + VPCI_FIELD(cfg_type), &type);
> +		if (type != cfg_type)
> +			continue;
> +
> +		pci_read_config_byte(dev, pos + VPCI_FIELD(bar), &bar);
> +
> +		/* Ignore structures with reserved BAR values */
> +		if (type != VIRTIO_PCI_CAP_PCI_CFG && bar > 0x5)
> +			continue;
> +
> +		cap->bar = bar;
> +		pci_read_config_dword(dev, pos + VPCI_FIELD(length),
> +				      &cap->length);
> +		pci_read_config_dword(dev, pos + VPCI_FIELD(offset),
> +				      &cap->offset);
> +
> +		return pos;
> +	}
> +	return 0;
> +}
> +
> +static int viommu_pci_reset(struct virtio_pci_common_cfg __iomem *cfg)
> +{
> +	u8 status;
> +	ktime_t timeout = ktime_add_ms(ktime_get(), 100);
> +
> +	iowrite8(0, &cfg->device_status);
> +	while ((status = ioread8(&cfg->device_status)) != 0 &&
> +	       ktime_before(ktime_get(), timeout))
> +		msleep(1);
> +
> +	return status ? -ETIMEDOUT : 0;
> +}
> +
> +static void viommu_pci_parse_topology(struct pci_dev *dev)
> +{
> +	int ret;
> +	u32 features;
> +	void __iomem *regs, *common_regs;
> +	struct viommu_cap_config cap = {0};
> +	struct virtio_pci_common_cfg __iomem *common_cfg;
> +
> +	/*
> +	 * The virtio infrastructure might not be loaded at this point. We need
> +	 * to access the BARs ourselves.
> +	 */
> +	ret = viommu_pci_find_capability(dev, VIRTIO_PCI_CAP_COMMON_CFG, &cap);
> +	if (!ret) {
> +		pci_warn(dev, "common capability not found\n");
> +		return;
> +	}
> +
> +	if (pci_enable_device_mem(dev))
> +		return;
> +
> +	common_regs = pci_iomap(dev, cap.bar, 0);
> +	if (!common_regs)
> +		return;
> +
> +	common_cfg = common_regs + cap.offset;
> +
> +	/* Perform the init sequence before we can read the config */
> +	ret = viommu_pci_reset(common_cfg);
> +	if (ret < 0) {
> +		pci_warn(dev, "unable to reset device\n");
> +		goto out_unmap_common;
> +	}
> +
> +	iowrite8(VIRTIO_CONFIG_S_ACKNOWLEDGE, &common_cfg->device_status);
> +	iowrite8(VIRTIO_CONFIG_S_ACKNOWLEDGE | VIRTIO_CONFIG_S_DRIVER,
> +		 &common_cfg->device_status);
> +
> +	/* Find out if the device supports topology description */
> +	iowrite32(0, &common_cfg->device_feature_select);
> +	features = ioread32(&common_cfg->device_feature);
> +
> +	if (!(features & BIT(VIRTIO_IOMMU_F_TOPOLOGY))) {
> +		pci_dbg(dev, "device doesn't have topology description");
> +		goto out_reset;
> +	}
> +
> +	ret = viommu_pci_find_capability(dev, VIRTIO_PCI_CAP_DEVICE_CFG, &cap);
> +	if (!ret) {
> +		pci_warn(dev, "device config capability not found\n");
> +		goto out_reset;
> +	}
> +
> +	regs = pci_iomap(dev, cap.bar, 0);
> +	if (!regs)
> +		goto out_reset;
> +
> +	pci_info(dev, "parsing virtio-iommu topology\n");
> +	ret = viommu_parse_topology(&dev->dev, regs + cap.offset,
> +				    pci_resource_len(dev, 0) - cap.offset);
> +	if (ret)
> +		pci_warn(dev, "failed to parse topology: %d\n", ret);
> +
> +	pci_iounmap(dev, regs);
> +out_reset:
> +	ret = viommu_pci_reset(common_cfg);
> +	if (ret)
> +		pci_warn(dev, "unable to reset device\n");
> +out_unmap_common:
> +	pci_iounmap(dev, common_regs);
> +}
> +
> +/*
> + * Catch a PCI virtio-iommu implementation early to get the topology description
> + * before we start probing other endpoints.
> + */
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT_QUMRANET, 0x1040 + VIRTIO_ID_IOMMU,
> +			viommu_pci_parse_topology);
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
