Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A3106CED
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:56:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E6D3387388;
	Fri, 22 Nov 2019 10:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfDNufYGRiRM; Fri, 22 Nov 2019 10:56:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 377F28737F;
	Fri, 22 Nov 2019 10:56:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B5A0C18DA;
	Fri, 22 Nov 2019 10:56:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4B0BC18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9F46F881BF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHwwX3873jY5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 30EA2881BA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:26 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id i7so1227412edt.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TVZC8O5GuUsgdVDCzcN2CqTy4L8wnnx0IKWd5NiFgCs=;
 b=Q3aBSYS6L0keHFMg9s3YF/O/MS0ZbpfYzXYluOwOpxXbstgAIVmQmrUo3jmGNcrDMZ
 RRPRqees28PfvdT26W0bPHIpTF934vMZ1mdXqlDToqWtyVfmuX00leXURFV5dfkQ02NJ
 g8MLLi84nyK+BFemsn5DmX+bFGOhLRD0eyOqDxu7lLUZ9cyS3bFHai1Fg75a75rR5dmc
 HAtSQb2nq4jX33aT5hVPbjbJphW0npRYuRLSvtGKiec4rx5bJjM/h3+QM3a2GsLsz6Wf
 aE1lZ/Wt3JEJzcp0sPuMjwjNU7ZJsgm+knGVpf9Ib7BC1bjVvZmANR5bEwTu8vWj9Clx
 OrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TVZC8O5GuUsgdVDCzcN2CqTy4L8wnnx0IKWd5NiFgCs=;
 b=qakJkAY7YPayScj4X03D59aPpP0TDQmPS9QSaYZbGWl1aMEISrwFxJLJ5zTJi3C4ii
 Pl7Zwz7WzQ3OOF994mWwRjy5cpWduMGEZlzvdqbB+nLFZdIUkttpCvYXMLdpA8RUF/FU
 daIHjdgCLWsbMA6IwzrAQ6nr592WJJdntQMhtx2bQYBarZGpN9Ds4iWIeZfRTSgDc7/i
 TAN46dwT2877R8nBKlfCHwc+h0vlrO6dm3V6dEZvJVkDsX8FSQZMsrXAnjoQobL/dpUn
 lSgC6TnJpEKaoVnyQu3GnhhvVWDwiSM91Uj/scbYDanQVXMJ5Fbugqg1U1sZRVg7D20o
 7K3w==
X-Gm-Message-State: APjAAAUdb7glhMImzAIYJpEC+pvMFwgeMia5l/oBGjMQ3M30dZ0phgJW
 6u+Chpx/gvr2EkC0HvkWDczccQ1Mv5c=
X-Google-Smtp-Source: APXvYqwBWCyLPkUhZBo6K0fMA3vA5VrmhXM4U/1z4Br0F1oFeGiiIWprIEctPIwsTs5r8FDOo3DDYA==
X-Received: by 2002:adf:f688:: with SMTP id v8mr174600wrp.147.1574419850990;
 Fri, 22 Nov 2019 02:50:50 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:50:50 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 00/13] virtio-iommu on non-devicetree platforms
Date: Fri, 22 Nov 2019 11:49:47 +0100
Message-Id: <20191122105000.800410-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: lorenzo.pieralisi@arm.com, mst@redhat.com, gregkh@linuxfoundation.org,
 joro@8bytes.org, sudeep.holla@arm.com, rjw@rjwysocki.net,
 eric.auger@redhat.com, sebastien.boeuf@intel.com, jacob.jun.pan@intel.com,
 guohanjun@huawei.com, bhelgaas@google.com, lenb@kernel.org
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

I'm seeking feedback on multi-platform support for virtio-iommu. At the
moment only devicetree (DT) is supported and we don't have a pleasant
solution for other platforms. Once we figure out the topology
description, x86 support is trivial.

Since the IOMMU manages memory accesses from other devices, the guest
kernel needs to initialize the IOMMU before endpoints start issuing DMA.
It's a solved problem: firmware or hypervisor describes through DT or
ACPI tables the device dependencies, and probe of endpoints is deferred
until the IOMMU is probed. But:

(1) ACPI has one table per vendor (DMAR for Intel, IVRS for AMD and IORT
    for Arm). From my point of view IORT is easier to extend, since we
    just need to introduce a new node type. There are no dependencies to
    Arm in the Linux IORT driver, so it works well with CONFIG_X86.

    However, there are concerns about other OS vendors feeling obligated
    to implement this new node, so Arm proposed introducing another ACPI
    table, that can wrap any of DMAR, IVRS and IORT to extend it with
    new virtual nodes. A draft of this VIOT table specification is
    available at http://jpbrucker.net/virtio-iommu/viot/viot-v5.pdf

    I'm afraid this could increase fragmentation as guests would need to
    implement or modify their support for all of DMAR, IVRS and IORT. If
    we end up doing VIOT, I suggest limiting it to IORT.

(2) In addition, there are some concerns about having virtio depend on
    ACPI or DT. Some hypervisors (Firecracker, QEMU microvm, kvmtool x86
    [1]) don't currently implement those methods.

    It was suggested to embed the topology description into the device.
    It can work, as demonstrated at the end of this RFC, with the
    following limitations:

    - The topology description must be read before any endpoint managed
      by the IOMMU is probed, and even before the virtio module is
      loaded. This RFC uses a PCI quirk to manually parse the virtio
      configuration. It assumes that all endpoints managed by the IOMMU
      are under this same PCI host.

    - I don't have a solution for the virtio-mmio transport at the
      moment, because I haven't had time to modify a host to test it. I
      think it could either use a notifier on the platform bus, or
      better, a new 'iommu' command-line argument to the virtio-mmio
      driver. So the current prototype doesn't work for firecracker and
      microvm, which rely on virtio-mmio.

    - For Arm, if the platform has an ITS, the hypervisor needs IORT or
      DT to describe it anyway. More generally, not using either ACPI or
      DT might prevent from supporting other features as well. I suspect
      the above users will have to implement a standard method sooner or
      later.

    - Even when reusing as much existing code as possible, guest support
      is still going to be around a few hundred lines since we can't
      rely on the normal virtio infrastructure to be loaded at that
      point. As you can see below, the diffstat for the incomplete
      topology implementation is already bigger than the exhaustive IORT
      support, even when jumping through the VIOT hoop.

    So it's a lightweight solution for very specific use-cases, and we
    should still support ACPI for the general case. Multi-platform
    guests such as Linux will then need to support three topology
    descriptions instead of two.

In this RFC I present both solutions, but I'd rather not keep all of it.
Please see the individual patches for details:

(1) Patches 1, 3-10 add support for virtio-iommu to the Linux IORT
    driver and patches 2, 11 add the VIOT glue.

(2) Patch 12 adds the built-in topology description to the virtio-iommu
    specification. Patch 13 is a partial implementation for the Linux
    virtio-iommu driver. It only supports PCI, not platform devices.

You can find Linux and QEMU code on my virtio-iommu/devel branches at
http://jpbrucker.net/git/linux and http://jpbrucker.net/git/qemu


I split the diffstat since there are two independent features. The first
one is for patches 1-11, and the second one for patch 13.

Jean-Philippe Brucker (11):
  ACPI/IORT: Move IORT to the ACPI folder
  ACPI: Add VIOT definitions
  ACPI/IORT: Allow registration of external tables
  ACPI/IORT: Add node categories
  ACPI/IORT: Support VIOT virtio-mmio node
  ACPI/IORT: Support VIOT virtio-pci node
  ACPI/IORT: Defer probe until virtio-iommu-pci has registered a fwnode
  ACPI/IORT: Add callback to update a device's fwnode
  iommu/virtio: Create fwnode if necessary
  iommu/virtio: Update IORT fwnode
  ACPI: Add VIOT table

 MAINTAINERS                     |   9 +
 drivers/acpi/Kconfig            |   7 +
 drivers/acpi/Makefile           |   2 +
 drivers/acpi/arm64/Kconfig      |   3 -
 drivers/acpi/arm64/Makefile     |   1 -
 drivers/acpi/bus.c              |   2 +
 drivers/acpi/{arm64 => }/iort.c | 317 ++++++++++++++++++++++++++------
 drivers/acpi/tables.c           |   2 +-
 drivers/acpi/viot.c             |  44 +++++
 drivers/iommu/Kconfig           |   1 +
 drivers/iommu/virtio-iommu.c    |  61 +++++-
 include/acpi/actbl2.h           |  31 ++++
 include/linux/acpi_iort.h       |  14 ++
 include/linux/acpi_viot.h       |  20 ++
 14 files changed, 448 insertions(+), 66 deletions(-)
 rename drivers/acpi/{arm64 => }/iort.c (86%)
 create mode 100644 drivers/acpi/viot.c
 create mode 100644 include/linux/acpi_viot.h

Jean-Philippe Brucker (1):
  iommu/virtio: Add topology description to virtio-iommu config space

 drivers/base/platform.c               |   3 +
 drivers/iommu/Kconfig                 |   9 +
 drivers/iommu/Makefile                |   1 +
 drivers/iommu/virtio-iommu-topology.c | 410 ++++++++++++++++++++++++++
 drivers/iommu/virtio-iommu.c          |   3 +
 drivers/pci/pci-driver.c              |   3 +
 include/linux/virtio_iommu.h          |  18 ++
 include/uapi/linux/virtio_iommu.h     |  26 ++
 8 files changed, 473 insertions(+)
 create mode 100644 drivers/iommu/virtio-iommu-topology.c
 create mode 100644 include/linux/virtio_iommu.h


[1] firecracker: https://github.com/firecracker-microvm/firecracker
    microvm: https://github.com/qemu/qemu/blob/master/docs/microvm.rst
    kvmtool: https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
