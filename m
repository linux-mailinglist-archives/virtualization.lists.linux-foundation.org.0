Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB215DF12
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 17:07:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1B3886113;
	Fri, 14 Feb 2020 16:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeaIVogQCNGM; Fri, 14 Feb 2020 16:07:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B5C8785EF2;
	Fri, 14 Feb 2020 16:07:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 964A0C0177;
	Fri, 14 Feb 2020 16:07:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 982BDC1D8D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BB6B885EA2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZKovfNBvaxX
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:07:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C007086758
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m16so11473171wrx.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 08:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVzPEuR2GzNf0eW4z63MDHB1xQMo/xWUQqLWfLG280k=;
 b=LbVawefNsNK5xsQXVpuxbuZa6Q+Ro2kzDz5awpUdiaWEStonew9PvGMhKaKJ2Ns56E
 GHBltfS0JO1bH3rvxRs0ik9VxMLOWSC9H78CCjyiF+3H4GppER2KXTcfLY/2Ei0nK0zo
 xlgfFHbDonykWeMD0XdrWkGaKQL88ln53/He0ztGVQkCB+2jU0Jt8LDDRPuvXHYN013s
 v7GD03hJziZWYTmgPVJmAVsjQ525ArtHfowBSTDXGS2Uw4nKNmBd6IvlhvbbQn63eKIm
 P4+xILLOxik7iDZ1DeJM71g2yMpvy4fSd+x90a6aHvBA6JatnpRedSF0Y7zyMQ8sOznM
 nDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVzPEuR2GzNf0eW4z63MDHB1xQMo/xWUQqLWfLG280k=;
 b=KQF0YvR3w9EAgLBdFUsxTcrrXPIw8tg7Y7sYEP3XFIN6gf82Hzr2VkpJ4H1vBty0rv
 zDQ1cF6+VSVCgiixIWToQiJ10TRio3ijnd/+v2QL7wrftbzahEp1uxL/tWn8dEdDsoFv
 4Uko1X8JQerxnuuENFN6pkVqaCqPxpGEhOoRru6zDXf3rq01PIlupPy07ezOOHfOdxGg
 wSCP4C7glxRUkvqr6C9Is2xPlpb5kE3GYGfwkCDf31olK/t8EKihX60FvMWp6EAoaf/N
 l5q9xnCR6C1DPneSvUOSclHG1/tF6N7ove5fmQOBBG9VXNhTdUpMEOxwc9faOvjYjltq
 bSSQ==
X-Gm-Message-State: APjAAAX7iWl0MUNpXNyWaU0LyTvFmZ8VYi7YvL8DMyUvPE9nGHFWoftb
 QCjP9+pD+Y3KefxctokRqrTbMg==
X-Google-Smtp-Source: APXvYqzS8V0tCvCvdw2/7KXFxuSe/ELDiODN+rviauMsHmG64mtrXiNxZ6zFV4elx5ANfP9abZnOaQ==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr5070480wre.58.1581696415173; 
 Fri, 14 Feb 2020 08:06:55 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id s139sm8133213wme.35.2020.02.14.08.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 08:06:54 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org
Subject: [PATCH 2/3] PCI: Add DMA configuration for virtual platforms
Date: Fri, 14 Feb 2020 17:04:12 +0100
Message-Id: <20200214160413.1475396-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214160413.1475396-1-jean-philippe@linaro.org>
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
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
