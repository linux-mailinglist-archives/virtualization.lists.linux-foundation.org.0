Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3A173E87
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 18:29:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B9FE86EDD;
	Fri, 28 Feb 2020 17:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgxM-JbqHvOZ; Fri, 28 Feb 2020 17:29:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 935B286EEE;
	Fri, 28 Feb 2020 17:29:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D5D0C0177;
	Fri, 28 Feb 2020 17:29:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D3D7C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2CB7D8601E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bhqwKmpegx3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:29:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 54D9286D90
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:29:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so3870484wrn.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 09:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVzPEuR2GzNf0eW4z63MDHB1xQMo/xWUQqLWfLG280k=;
 b=CbMmHBQFWNap3SvvT/pd4tFwlHy/0p/eszdAWT3G2kZuQjh8VT6iBemJ8mEEVvM8DG
 gYzsRDXklS9k3ia0O6auURvqastCyNghO4JhFNgAdpHO53/OjuMAloQqaLoz7KFR/E30
 uDgJYmBBMcMtAEG0IUmBMCkpWifeWcPr3hms0C4RZNN3dchhhB1QDC6I2qyQzjctPZsF
 uxasWOOfceSTO4CZaeNc3l7d5TUOmQ7EmNh6owaXwKVSkJITT19Ny9z5pDLa3fH6FJWE
 OrlY2pz7c1kUntJZ0voKPpcEyk9b6tzY+C4ZLrdSX1aO7Z4vbO9TotUhVgu95nrySL/F
 xT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVzPEuR2GzNf0eW4z63MDHB1xQMo/xWUQqLWfLG280k=;
 b=nSDBO8rC+VcDqQqM38Ka3WgbDJ2ePunJsV884v+hl8EDZxQY5TVV4ILp9+/N8e3HeV
 JGLo2lrtH3DcfwA0inXO0bXyfL3zOMdFafvb7IRg+Gs2x9TeVjG1QpYRvxhR4lpLnlGW
 DLDUoeDqEWenL1EdSucDbWbs/PmMCEaGvf/dQD72XrCkF0VPn7oWRdPeVK9uRTtgnKh+
 K0MOj+mMQrKXuXZDfKgbWEcEzHMu5LJW0kNrdMHHMdFS6ZPihdqrFcnjirsPILUGxm6O
 Esy25g770tpyOEDw70Jz9ytWkPc5hDACHDS5p9xnvkvNWsLSKcQtuv6lbwv7rFpW0lkL
 /xcg==
X-Gm-Message-State: APjAAAVz1Q2wY8retSqcSY68M7s/EA5EW8jXbvUXhDQ2mlWO1+UC4xJV
 XNAgVO8tU8AOTr4F2FupwFWC2g==
X-Google-Smtp-Source: APXvYqwoODJ182W+tU34PDRQU6ZjdWMfRs889Si422AXkoD4YBlI28yghK+V6XaUBNiOO+Pcm+sNDw==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr5505559wrp.378.1582910945709; 
 Fri, 28 Feb 2020 09:29:05 -0800 (PST)
Received: from localhost.localdomain
 ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id m125sm3004795wmf.8.2020.02.28.09.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 09:29:05 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org
Subject: [PATCH v2 2/3] PCI: Add DMA configuration for virtual platforms
Date: Fri, 28 Feb 2020 18:25:37 +0100
Message-Id: <20200228172537.377327-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200228172537.377327-1-jean-philippe@linaro.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 joro@8bytes.org, eric.auger@redhat.com, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, bhelgaas@google.com, robin.murphy@arm.com
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

Hardware platforms usually describe the IOMMU topology using either
device-tree pointers or vendor-specific ACPI tables.  For virtual
platforms that don't provide a device-tree, the virtio-iommu device
contains a description of the endpoints it manages.  That information
allows us to probe endpoints after the IOMMU is probed (possibly as late
as userspace modprobe), provided it is discovered early enough.

Add a hook to pci_dma_configure(), which returns -EPROBE_DEFER if the
endpoint is managed by a vIOMMU that will be loaded later, or 0 in any
other case to avoid disturbing the normal DMA configuration methods.
When CONFIG_VIRTIO_IOMMU_TOPOLOGY isn't selected, the call to
virt_dma_configure() is compiled out.

As long as the information is consistent, platforms can provide both a
device-tree and a built-in topology, and the IOMMU infrastructure is
able to deal with multiple DMA configuration methods.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/pci/pci-driver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 0454ca0e4e3f..69303a814f21 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -18,6 +18,7 @@
 #include <linux/kexec.h>
 #include <linux/of_device.h>
 #include <linux/acpi.h>
+#include <linux/virt_iommu.h>
 #include "pci.h"
 #include "pcie/portdrv.h"
 
@@ -1602,6 +1603,10 @@ static int pci_dma_configure(struct device *dev)
 	struct device *bridge;
 	int ret = 0;
 
+	ret = virt_dma_configure(dev);
+	if (ret)
+		return ret;
+
 	bridge = pci_get_host_bridge_device(to_pci_dev(dev));
 
 	if (IS_ENABLED(CONFIG_OF) && bridge->parent &&
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
