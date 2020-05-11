Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B61CE8AA
	for <lists.virtualization@lfdr.de>; Tue, 12 May 2020 00:59:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7312A86E90;
	Mon, 11 May 2020 22:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljyOUlLr7lFM; Mon, 11 May 2020 22:59:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C78C8703F;
	Mon, 11 May 2020 22:59:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DD23C016F;
	Mon, 11 May 2020 22:59:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0AAAC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 22:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D767A88F5B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 22:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCIE7VE4XMgi
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 22:59:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8247A88E52
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 May 2020 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589237974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RoETek6S0S6LH9/sMqViUHVcCuyps0KXjSVs46mQ2Y=;
 b=bMojWTC91EmGx9m3sc77O6eXNFbyIaONXC3Rfa473QWbWxy6yhe/Snrw8OX1hy80Bz+FR6
 ZUXGwZ8V86/FeTR3t+gtlNEWa204DqH68QGCjX/LQwbPZ9QzdkcWP2i9dBiucllvDq5Mqm
 3AQMpbYVPFHx9+1nUtJzLrYWHVD05ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-eJRemzvXPU6hkdiTSl188w-1; Mon, 11 May 2020 18:59:30 -0400
X-MC-Unique: eJRemzvXPU6hkdiTSl188w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16209460;
 Mon, 11 May 2020 22:59:29 +0000 (UTC)
Received: from w520.home (ovpn-113-111.phx2.redhat.com [10.3.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 245415D782;
 Mon, 11 May 2020 22:59:28 +0000 (UTC)
Date: Mon, 11 May 2020 16:59:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [PATCH for QEMU v2] hw/vfio: Add VMD Passthrough Quirk
Message-ID: <20200511165927.27b41d65@w520.home>
In-Reply-To: <20200511190129.9313-2-jonathan.derrick@intel.com>
References: <20200511190129.9313-1-jonathan.derrick@intel.com>
 <20200511190129.9313-2-jonathan.derrick@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>
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

On Mon, 11 May 2020 15:01:27 -0400
Jon Derrick <jonathan.derrick@intel.com> wrote:

> The VMD endpoint provides a real PCIe domain to the guest, including

Please define VMD.  I'm sure this is obvious to many, but I've had to
do some research.  The best TL;DR summary I've found is Keith's
original commit 185a383ada2e adding the controller to Linux.  If there's
something better, please let me know.

> bridges and endpoints. Because the VMD domain is enumerated by the guest
> kernel, the guest kernel will assign Guest Physical Addresses to the
> downstream endpoint BARs and bridge windows.
>
> When the guest kernel performs MMIO to VMD sub-devices, IOMMU will
> translate from the guest address space to the physical address space.
> Because the bridges have been programmed with guest addresses, the
> bridges will reject the transaction containing physical addresses.

I'm lost, what IOMMU is involved in CPU access to MMIO space?  My guess
is that since all MMIO of this domain is mapped behind the host
endpoint BARs 2 & 4 that QEMU simply accesses it via mapping of those
BARs into the VM, so it's the MMU, not the IOMMU performing those GPA
to HPA translations.  But then presumably the bridges within the domain
are scrambled because their apertures are programmed with ranges that
don't map into the VMD endpoint BARs.  Is that remotely correct?  Some
/proc/iomem output and/or lspci listing from the host to see how this
works would be useful.

> VMD device 28C0 natively assists passthrough by providing the Host
> Physical Address in shadow registers accessible to the guest for bridge
> window assignment. The shadow registers are valid if bit 1 is set in VMD
> VMLOCK config register 0x70. Future VMDs will also support this feature.
> Existing VMDs have config register 0x70 reserved, and will return 0 on
> reads.

So these shadow registers are simply exposing the host BAR2 & BAR4
addresses into the guest, so the quirk is dependent on reading those
values from the device before anyone has written to them and the BAR
emulation in the kernel kicks in (not a problem, just an observation).

Does the VMD controller code then use these bases addresses to program
the bridges/endpoint within the domain?  What does the same /proc/iomem
or lspci look like inside the guest then?  It seems like we'd see the
VMD endpoint with GPA BARs, but the devices within the domain using
HPAs.  If that's remotely true, and we're not forcing an identity
mapping of this HPA range into the GPA, does the vmd controller driver
impose a TRA function on these MMIO addresses in the guest?

Sorry if I'm way off, I'm piecing things together from scant
information here.  Please Cc me on future vfio related patches.  Thanks,

Alex

 
> In order to support existing VMDs, this quirk emulates the VMLOCK and
> HPA shadow registers for all VMD device ids which don't natively assist
> with passthrough. The Linux VMD driver is updated to allow existing VMD
> devices to query VMLOCK for passthrough support.
> 
> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> ---
>  hw/vfio/pci-quirks.c | 103 +++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/pci.c        |   7 +++
>  hw/vfio/pci.h        |   2 +
>  hw/vfio/trace-events |   3 ++
>  4 files changed, 115 insertions(+)
> 
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index 2d348f8237..4060a6a95d 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -1709,3 +1709,106 @@ free_exit:
>  
>      return ret;
>  }
> +
> +/*
> + * The VMD endpoint provides a real PCIe domain to the guest and the guest
> + * kernel performs enumeration of the VMD sub-device domain. Guest transactions
> + * to VMD sub-devices go through IOMMU translation from guest addresses to
> + * physical addresses. When MMIO goes to an endpoint after being translated to
> + * physical addresses, the bridge rejects the transaction because the window
> + * has been programmed with guest addresses.
> + *
> + * VMD can use the Host Physical Address in order to correctly program the
> + * bridge windows in its PCIe domain. VMD device 28C0 has HPA shadow registers
> + * located at offset 0x2000 in MEMBAR2 (BAR 4). The shadow registers are valid
> + * if bit 1 is set in the VMD VMLOCK config register 0x70. VMD devices without
> + * this native assistance can have these registers safely emulated as these
> + * registers are reserved.
> + */
> +typedef struct VFIOVMDQuirk {
> +    VFIOPCIDevice *vdev;
> +    uint64_t membar_phys[2];
> +} VFIOVMDQuirk;
> +
> +static uint64_t vfio_vmd_quirk_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    VFIOVMDQuirk *data = opaque;
> +    uint64_t val = 0;
> +
> +    memcpy(&val, (void *)data->membar_phys + addr, size);
> +    return val;
> +}
> +
> +static const MemoryRegionOps vfio_vmd_quirk = {
> +    .read = vfio_vmd_quirk_read,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +#define VMD_VMLOCK  0x70
> +#define VMD_SHADOW  0x2000
> +#define VMD_MEMBAR2 4
> +
> +static int vfio_vmd_emulate_shadow_registers(VFIOPCIDevice *vdev)
> +{
> +    VFIOQuirk *quirk;
> +    VFIOVMDQuirk *data;
> +    PCIDevice *pdev = &vdev->pdev;
> +    int ret;
> +
> +    data = g_malloc0(sizeof(*data));
> +    ret = pread(vdev->vbasedev.fd, data->membar_phys, 16,
> +                vdev->config_offset + PCI_BASE_ADDRESS_2);
> +    if (ret != 16) {
> +        error_report("VMD %s cannot read MEMBARs (%d)",
> +                     vdev->vbasedev.name, ret);
> +        g_free(data);
> +        return -EFAULT;
> +    }
> +
> +    quirk = vfio_quirk_alloc(1);
> +    quirk->data = data;
> +    data->vdev = vdev;
> +
> +    /* Emulate Shadow Registers */
> +    memory_region_init_io(quirk->mem, OBJECT(vdev), &vfio_vmd_quirk, data,
> +                          "vfio-vmd-quirk", sizeof(data->membar_phys));
> +    memory_region_add_subregion_overlap(vdev->bars[VMD_MEMBAR2].region.mem,
> +                                        VMD_SHADOW, quirk->mem, 1);
> +    memory_region_set_readonly(quirk->mem, true);
> +    memory_region_set_enabled(quirk->mem, true);
> +
> +    QLIST_INSERT_HEAD(&vdev->bars[VMD_MEMBAR2].quirks, quirk, next);
> +
> +    trace_vfio_pci_vmd_quirk_shadow_regs(vdev->vbasedev.name,
> +                                         data->membar_phys[0],
> +                                         data->membar_phys[1]);
> +
> +    /* Advertise Shadow Register support */
> +    pci_byte_test_and_set_mask(pdev->config + VMD_VMLOCK, 0x2);
> +    pci_set_byte(pdev->wmask + VMD_VMLOCK, 0);
> +    pci_set_byte(vdev->emulated_config_bits + VMD_VMLOCK, 0x2);
> +
> +    trace_vfio_pci_vmd_quirk_vmlock(vdev->vbasedev.name,
> +                                    pci_get_byte(pdev->config + VMD_VMLOCK));
> +
> +    return 0;
> +}
> +
> +int vfio_pci_vmd_init(VFIOPCIDevice *vdev)
> +{
> +    int ret = 0;
> +
> +    switch (vdev->device_id) {
> +    case 0x28C0: /* Native passthrough support */
> +        break;
> +    /* Emulates Native passthrough support */
> +    case 0x201D:
> +    case 0x467F:
> +    case 0x4C3D:
> +    case 0x9A0B:
> +        ret = vfio_vmd_emulate_shadow_registers(vdev);
> +        break;
> +    }
> +
> +    return ret;
> +}
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 5e75a95129..85425a1a6f 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3024,6 +3024,13 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>          }
>      }
>  
> +    if (vdev->vendor_id == PCI_VENDOR_ID_INTEL) {
> +        ret = vfio_pci_vmd_init(vdev);
> +        if (ret) {
> +            error_report("Failed to setup VMD");
> +        }
> +    }
> +
>      vfio_register_err_notifier(vdev);
>      vfio_register_req_notifier(vdev);
>      vfio_setup_resetfn_quirk(vdev);
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 0da7a20a7e..e8632d806b 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -217,6 +217,8 @@ int vfio_pci_igd_opregion_init(VFIOPCIDevice *vdev,
>  int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp);
>  int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp);
>  
> +int vfio_pci_vmd_init(VFIOPCIDevice *vdev);
> +
>  void vfio_display_reset(VFIOPCIDevice *vdev);
>  int vfio_display_probe(VFIOPCIDevice *vdev, Error **errp);
>  void vfio_display_finalize(VFIOPCIDevice *vdev);
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index b1ef55a33f..ed64e477db 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -90,6 +90,9 @@ vfio_pci_nvidia_gpu_setup_quirk(const char *name, uint64_t tgt, uint64_t size) "
>  vfio_pci_nvlink2_setup_quirk_ssatgt(const char *name, uint64_t tgt, uint64_t size) "%s tgt=0x%"PRIx64" size=0x%"PRIx64
>  vfio_pci_nvlink2_setup_quirk_lnkspd(const char *name, uint32_t link_speed) "%s link_speed=0x%x"
>  
> +vfio_pci_vmd_quirk_shadow_regs(const char *name, uint64_t mb1, uint64_t mb2) "%s membar1_phys=0x%"PRIx64" membar2_phys=0x%"PRIx64
> +vfio_pci_vmd_quirk_vmlock(const char *name, uint8_t vmlock) "%s vmlock=0x%x"
> +
>  # common.c
>  vfio_region_write(const char *name, int index, uint64_t addr, uint64_t data, unsigned size) " (%s:region%d+0x%"PRIx64", 0x%"PRIx64 ", %d)"
>  vfio_region_read(char *name, int index, uint64_t addr, unsigned size, uint64_t data) " (%s:region%d+0x%"PRIx64", %d) = 0x%"PRIx64

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
