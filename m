Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0AC15DEFD
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 17:06:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 896FA204D1;
	Fri, 14 Feb 2020 16:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfyZ+xzGesL2; Fri, 14 Feb 2020 16:06:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B2BB72049B;
	Fri, 14 Feb 2020 16:06:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AC27C08A4;
	Fri, 14 Feb 2020 16:06:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0949C08A4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB5EF8765E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XC7tfWepv1C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 87A768765A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:54 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g3so11479890wrs.12
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 08:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QZOdeYob0unxBnNaicbQBgm32/JrXg0BrJwyt1f7elc=;
 b=hE7o6GpoP5twPWF3gKHH23ktUStiNlbQBAVgFayAEV72YEEKY6SRWo90uFcpbYe+kC
 6RbWy5ms1zZkbB9VCUseGI/evxbiBmVjK1QmpgMOT+917SK1z6TAn3nnyk/AwiiXXhMb
 Ju3cC7ma+PzAfxt782ZNHMdnCRZYvBKtwMc6IbgNhA8YAav7wgLvKExz4tY6lpGOyNXg
 ePOuQprWiaTOVQG/W0G4gN1qfmLIx8OsjSLs/uXTWDCSko91iQGGnY7iwrfJAAR1PA0s
 BOEM/+H0YT1ukQw7u5irxo8Zi8P0BvZjomyaiZRRIBGjUY9IBtq+ZKIqq3H00OEErZmF
 tquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QZOdeYob0unxBnNaicbQBgm32/JrXg0BrJwyt1f7elc=;
 b=YcjudDrsosv+RlXhnQkGvtBIpT6qmZdqs6k7uGTgX1+wxdZ4uiHEXgSCWa8aR46xCx
 mGZaXlQ7sCiWC6cW+c1nan/dbHhcL7tXw2jcHFnmBWL86j3SAUcMY/ytfQD/lYaEzkTA
 1FEn6VEkKMDI1DJUxpdeNMD2mnQz2EKbG3+bnIBR3nITio8f/LaS3Mgppxs0wpIRFCZX
 YB0gpXCMNBWvUN5yktZfHQOzP6m8/O2oeJ8Quo31R27qUvZ4orBrUrEnhY83D1CfSDtV
 IvVmIscnMpJWuhZDWFd8AJVYG8ek3fNQHn0IPaXlvGiPYjChiJZxWlua9+s+uhrzDB6h
 S/8g==
X-Gm-Message-State: APjAAAU2g+vZ4AFPyX9Y1kxumoIuHYGonNgSEEUsVDIbthJvTi2vpOS+
 SNT6R/3GY4mR811VMCe2dbL8Ig==
X-Google-Smtp-Source: APXvYqztazK/xQKzvZjH67m157XVvrLPuUSe39hdz1bzjgRY06ZpdyvXZn13dt99dLDQvA9pCyj3tw==
X-Received: by 2002:adf:f382:: with SMTP id m2mr4668894wro.163.1581696412999; 
 Fri, 14 Feb 2020 08:06:52 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id s139sm8133213wme.35.2020.02.14.08.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 08:06:51 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org
Subject: [PATCH 0/3] virtio-iommu on non-devicetree platforms
Date: Fri, 14 Feb 2020 17:04:10 +0100
Message-Id: <20200214160413.1475396-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: mst@redhat.com, joro@8bytes.org, eric.auger@redhat.com,
 sebastien.boeuf@intel.com, jacob.jun.pan@intel.com, bhelgaas@google.com
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

Add topology description to the virtio-iommu driver and enable x86
platforms. Since the RFC [1] I've mostly given up on ACPI tables, since
the internal discussions seem to have reached a dead end. The built-in
topology description presented here isn't ideal, but it is simple to
implement and doesn't impose a dependency on ACPI or device-tree, which
can be beneficial to lightweight hypervisors.

The built-in description is an array in the virtio config space. The
driver parses the config space early and postpones endpoint probe until
the virtio-iommu device is ready. Each element in the array describes
either a PCI range or a single MMIO endpoint, and their associated
endpoint IDs:

struct virtio_iommu_topo_pci_range {
	__le16 type;			/* 1: PCI range */
	__le16 hierarchy;		/* PCI domain number */
	__le16 requester_start;		/* First BDF */
	__le16 requester_end;		/* Last BDF */
	__le32 endpoint_start;		/* First endpoint ID */
};

struct virtio_iommu_topo_endpoint {
	__le16 type;			/* 2: Endpoint */
	__le16 reserved;		/* 0 */
	__le32 endpoint;		/* Endpoint ID */
	__le64 address;			/* First MMIO address */
};

You can find the QEMU patches based on Eric's latest device on my
virtio-iommu/devel branch [2]. I test on both x86 q35, and aarch64 virt
machine with edk2.

[1] https://lore.kernel.org/linux-iommu/20191122105000.800410-1-jean-philippe@linaro.org/
[2] https://jpbrucker.net/git/qemu virtio-iommu/devel

Jean-Philippe Brucker (3):
  iommu/virtio: Add topology description to virtio-iommu config space
  PCI: Add DMA configuration for virtual platforms
  iommu/virtio: Enable x86 support

 MAINTAINERS                           |   2 +
 drivers/iommu/Kconfig                 |  13 +-
 drivers/iommu/Makefile                |   1 +
 drivers/iommu/virtio-iommu-topology.c | 343 ++++++++++++++++++++++++++
 drivers/iommu/virtio-iommu.c          |   3 +
 drivers/pci/pci-driver.c              |   5 +
 include/linux/virt_iommu.h            |  19 ++
 include/uapi/linux/virtio_iommu.h     |  26 ++
 8 files changed, 411 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iommu/virtio-iommu-topology.c
 create mode 100644 include/linux/virt_iommu.h

-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
