Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F34425DFBF
	for <lists.virtualization@lfdr.de>; Fri,  4 Sep 2020 18:24:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3597A86C56;
	Fri,  4 Sep 2020 16:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xw8WZmMNTdeF; Fri,  4 Sep 2020 16:24:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E07086CD2;
	Fri,  4 Sep 2020 16:24:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B94AC0051;
	Fri,  4 Sep 2020 16:24:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 122A3C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EA0CD2E0F8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKJFikY9Is5U
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:24:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 4FF9820349
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 16:24:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-GkkRB8BMPW6-a29cxkLlZA-1; Fri, 04 Sep 2020 12:24:20 -0400
X-MC-Unique: GkkRB8BMPW6-a29cxkLlZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E057F801AB7;
 Fri,  4 Sep 2020 16:24:18 +0000 (UTC)
Received: from [10.36.112.51] (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76CB07E161;
 Fri,  4 Sep 2020 16:24:13 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] Add virtio-iommu built-in topology
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org,
 virtio-dev@lists.oasis-open.org, linux-pci@vger.kernel.org
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ab2a1668-e40c-c8f0-b77b-abadeceb4b82@redhat.com>
Date: Fri, 4 Sep 2020 18:24:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200821131540.2801801-1-jean-philippe@linaro.org>
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

Hi,

On 8/21/20 3:15 PM, Jean-Philippe Brucker wrote:
> Add a topology description to the virtio-iommu driver and enable x86
> platforms.
> 
> Since [v2] we have made some progress on adding ACPI support for
> virtio-iommu, which is the preferred boot method on x86. It will be a
> new vendor-agnostic table describing para-virtual topologies in a
> minimal format. However some platforms don't use either ACPI or DT for
> booting (for example microvm), and will need the alternative topology
> description method proposed here. In addition, since the process to get
> a new ACPI table will take a long time, this provides a boot method even
> to ACPI-based platforms, if only temporarily for testing and
> development.
> 
> v3:
> * Add patch 1 that moves virtio-iommu to a subfolder.
> * Split the rest:
>   * Patch 2 adds topology-helper.c, which will be shared with the ACPI
>     support.
>   * Patch 4 adds definitions.
>   * Patch 5 adds parser in topology.c.
> * Address other comments.
> 
> Linux and QEMU patches available at:
> https://jpbrucker.net/git/linux virtio-iommu/devel
> https://jpbrucker.net/git/qemu virtio-iommu/devel
I have tested that series with above QEMU branch on ARM with virtio-net
and virtio-blk translated devices in non DT mode.

It works for me:
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> 
> [spec] https://lists.oasis-open.org/archives/virtio-dev/202008/msg00067.html
> [v2] https://lore.kernel.org/linux-iommu/20200228172537.377327-1-jean-philippe@linaro.org/
> [v1] https://lore.kernel.org/linux-iommu/20200214160413.1475396-1-jean-philippe@linaro.org/
> [rfc] https://lore.kernel.org/linux-iommu/20191122105000.800410-1-jean-philippe@linaro.org/
> 
> Jean-Philippe Brucker (6):
>   iommu/virtio: Move to drivers/iommu/virtio/
>   iommu/virtio: Add topology helpers
>   PCI: Add DMA configuration for virtual platforms
>   iommu/virtio: Add topology definitions
>   iommu/virtio: Support topology description in config space
>   iommu/virtio: Enable x86 support
> 
>  drivers/iommu/Kconfig                     |  18 +-
>  drivers/iommu/Makefile                    |   3 +-
>  drivers/iommu/virtio/Makefile             |   4 +
>  drivers/iommu/virtio/topology-helpers.h   |  50 +++++
>  include/linux/virt_iommu.h                |  15 ++
>  include/uapi/linux/virtio_iommu.h         |  44 ++++
>  drivers/iommu/virtio/topology-helpers.c   | 196 ++++++++++++++++
>  drivers/iommu/virtio/topology.c           | 259 ++++++++++++++++++++++
>  drivers/iommu/{ => virtio}/virtio-iommu.c |   4 +
>  drivers/pci/pci-driver.c                  |   5 +
>  MAINTAINERS                               |   3 +-
>  11 files changed, 597 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/iommu/virtio/Makefile
>  create mode 100644 drivers/iommu/virtio/topology-helpers.h
>  create mode 100644 include/linux/virt_iommu.h
>  create mode 100644 drivers/iommu/virtio/topology-helpers.c
>  create mode 100644 drivers/iommu/virtio/topology.c
>  rename drivers/iommu/{ => virtio}/virtio-iommu.c (99%)
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
