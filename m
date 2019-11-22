Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C0106D49
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:59:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0AA1868CE;
	Fri, 22 Nov 2019 10:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kl8NC6vDuLpS; Fri, 22 Nov 2019 10:59:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 35209868D9;
	Fri, 22 Nov 2019 10:59:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 181C8C18DA;
	Fri, 22 Nov 2019 10:59:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EDFBC18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3D479868CE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqT-2rdW1cMJ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:58:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8326785F83
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:58:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so4653968wrl.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lDs5y1/lUK+eWeeJx//ERXKdVvxWdj4EMLwCwstQME4=;
 b=tZrmxDqsZ1RxyI07RNeundpwyg3krx2pcdHCNpZvL3eVD3KsQ239cK0WPxnijQt1Sx
 Fs/hoURodhjYShc3UsRO8wvWP3TJghstOvwU0hqvTLFGlHfjPbK+N8DC9RWKjJr0OSfG
 U8/SeO0cY0wZsBiqU23iCYDvR8R/mftguKFjWVo1gq4EDGNowS6VNXbBbPpDaZ6ANKju
 QvHqIx0HkGQc9XfDWtkRsWeWzQvhDGRGubK/9H01T5zo/uIfdNyzFvyaivP26qcnRGV1
 2W+UM6kD51rYLCCVA698kX5jZc+fgUZ9zv8aIXlsnfVKBPQMWGC6BGoWZw80BqSyjx13
 75PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lDs5y1/lUK+eWeeJx//ERXKdVvxWdj4EMLwCwstQME4=;
 b=lUJZRtvHAj15e07FLgxQUPP4ntGfi3CXG7JXw/6OfI6NWPrrpTC6ucTkQiYhAX2aMP
 i/56JqH0uOHM42i9Q6htxw/KRY/DlHDCOmHWAsgFYYNUZac4YC2QYZPAThmagfv/t0/Q
 U+fnBvResg2MeCzd4wpVzuzHRWYD7GSvJa7S2l+xbtLMrgvDDNHhU1lClUxUOBxHYPYh
 YUkgZcLaZ23IHCXurXPgNIZV/sI0mJukQ1xph2NzzRqDSnSoLauy59kQaVqMcxNwSe/k
 UD6st1P+scIYkAJgnfrkquxwKhuZRgfPNpkM8TGN6ox+2Qul3cUF393uFr7UatzmnPzM
 3aUQ==
X-Gm-Message-State: APjAAAX6UeFcNgOkNGyE2u+GYmsmoH5Hr3LMyVBC/UXG14klQSVoa7TS
 YkG0+IXuKcQNGEZQEELbB+D6Y3bmsTg=
X-Google-Smtp-Source: APXvYqz63MumbBUd6GIRd7d2nXdQzJtqYQvwS0Q1xjmH0yv+JY/99rcdr1f7XN3ibul7iFA5Jzo61w==
X-Received: by 2002:adf:9f43:: with SMTP id f3mr17102828wrg.76.1574419864067; 
 Fri, 22 Nov 2019 02:51:04 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:51:03 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 10/13] iommu/virtio: Update IORT fwnode
Date: Fri, 22 Nov 2019 11:49:57 +0100
Message-Id: <20191122105000.800410-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191122105000.800410-1-jean-philippe@linaro.org>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
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

When the virtio-iommu uses the PCI transport and the topology is
described with IORT, register the PCI fwnode with IORT.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/virtio-iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 8efa368134c0..9847552faecc 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/acpi_iort.h>
 #include <linux/amba/bus.h>
 #include <linux/delay.h>
 #include <linux/dma-iommu.h>
@@ -989,6 +990,8 @@ static int viommu_set_fwnode(struct viommu_dev *viommu)
 		set_primary_fwnode(dev, fwnode);
 	}
 
+	/* Tell IORT about a PCI device's fwnode */
+	iort_iommu_update_fwnode(dev, dev->fwnode);
 	iommu_device_set_fwnode(&viommu->iommu, dev->fwnode);
 	return 0;
 }
@@ -1000,6 +1003,8 @@ static void viommu_clear_fwnode(struct viommu_dev *viommu)
 	if (!dev->fwnode)
 		return;
 
+	iort_iommu_update_fwnode(dev, NULL);
+
 	if (is_software_node(dev->fwnode)) {
 		struct fwnode_handle *fwnode = dev->fwnode;
 
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
