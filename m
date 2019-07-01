Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7194C43F08
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 17:54:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0EE2E40;
	Thu, 13 Jun 2019 15:54:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D1BE5E40;
	Thu, 13 Jun 2019 15:54:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3C1F963D;
	Thu, 13 Jun 2019 15:54:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5F033086204;
	Thu, 13 Jun 2019 15:54:24 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7664E6061E;
	Thu, 13 Jun 2019 15:54:15 +0000 (UTC)
Subject: Re: [PATCH v8 0/7] Add virtio-iommu driver
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, joro@8bytes.org,
	mst@redhat.com
References: <20190530170929.19366-1-jean-philippe.brucker@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <42408240-81a1-fe25-72da-5a93c9e1cb89@redhat.com>
Date: Thu, 13 Jun 2019 17:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190530170929.19366-1-jean-philippe.brucker@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 13 Jun 2019 15:54:28 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, virtio-dev@lists.oasis-open.org,
	Lorenzo.Pieralisi@arm.com, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, robh+dt@kernel.org,
	Tomasz Nowicki <tn@semihalf.com>, bhelgaas@google.com,
	robin.murphy@arm.com, kvmarm@lists.cs.columbia.edu
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

Hi,

On 5/30/19 7:09 PM, Jean-Philippe Brucker wrote:
> Implement the virtio-iommu driver, following specification v0.12 [1].
> Since last version [2] we've worked on improving the specification,
> which resulted in the following changes to the interface:
> * Remove the EXEC flag.
> * Add feature bit for the MMIO flag.
> * Change domain_bits to domain_range.
> 
> Given that there were small changes to patch 5/7, I removed the review
> and test tags. Please find the code at [3].
> 
> [1] Virtio-iommu specification v0.12, sources and pdf
>     git://linux-arm.org/virtio-iommu.git virtio-iommu/v0.12
>     http://jpbrucker.net/virtio-iommu/spec/v0.12/virtio-iommu-v0.12.pdf
>     http://jpbrucker.net/virtio-iommu/spec/diffs/virtio-iommu-dev-diff-v0.11-v0.12.pdf
> 
> [2] [PATCH v7 0/7] Add virtio-iommu driver
>     https://lore.kernel.org/linux-pci/0ba215f5-e856-bf31-8dd9-a85710714a7a@arm.com/T/
> 
> [3] git://linux-arm.org/linux-jpb.git virtio-iommu/v0.12
>     git://linux-arm.org/kvmtool-jpb.git virtio-iommu/v0.12

SERIES
Tested-by: Eric Auger <eric.auger@redhat.com>

with QEMU branch:
https://github.com/eauger/qemu/tree/v4.0-virtio-iommu-v0.12

and kernel branch:
https://github.com/eauger/linux/tree/virtio-iommu-v0.12
(where I just added the rebased iort patches on top of Jean-Philippe's
virtio-iommu/v0.12 branch). So I also tested the ACPI boot.

I will formally submit the QEMU series ASAP.

Thanks

Eric

> 
> Jean-Philippe Brucker (7):
>   dt-bindings: virtio-mmio: Add IOMMU description
>   dt-bindings: virtio: Add virtio-pci-iommu node
>   of: Allow the iommu-map property to omit untranslated devices
>   PCI: OF: Initialize dev->fwnode appropriately
>   iommu: Add virtio-iommu driver
>   iommu/virtio: Add probe request
>   iommu/virtio: Add event queue
> 
>  .../devicetree/bindings/virtio/iommu.txt      |   66 +
>  .../devicetree/bindings/virtio/mmio.txt       |   30 +
>  MAINTAINERS                                   |    7 +
>  drivers/iommu/Kconfig                         |   11 +
>  drivers/iommu/Makefile                        |    1 +
>  drivers/iommu/virtio-iommu.c                  | 1176 +++++++++++++++++
>  drivers/of/base.c                             |   10 +-
>  drivers/pci/of.c                              |    6 +
>  include/uapi/linux/virtio_ids.h               |    1 +
>  include/uapi/linux/virtio_iommu.h             |  165 +++
>  10 files changed, 1470 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/virtio/iommu.txt
>  create mode 100644 drivers/iommu/virtio-iommu.c
>  create mode 100644 include/uapi/linux/virtio_iommu.h
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
