Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 318043A2616
	for <lists.virtualization@lfdr.de>; Thu, 10 Jun 2021 10:03:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B729C60A65;
	Thu, 10 Jun 2021 08:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J82GQbskaX_G; Thu, 10 Jun 2021 08:02:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1607560754;
	Thu, 10 Jun 2021 08:02:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBBD4C000E;
	Thu, 10 Jun 2021 08:02:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A51CC0011
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 094D1405BE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onLsd8vnqMDR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:02:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1758405B6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:02:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so5966970wms.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBUsTlyEFlycfvpzBjefLjP5nx83lHp8T/kCIv2x2kU=;
 b=fn0NUjrOwQryIqssH621mJYHvDB8E2+gmmLkrJH+P0bkswZYuaJRZAPh8+D1mhR3Jp
 bC+/4ENRLzvl4+4p1rWaJ4A5UcVYL3iSWCnZpOmz+1XySSde9ac9XVADyGMQ+JKILnNY
 WtmRWkiKFQr1yKyGlZoDOjpfqJAcequZSV33SxuVdLleNTG0b5nbosoi2mHcJz5vPJ64
 b7LrshGPBIruQ4zzyuSqQ/kcPcxP55vnRXSGtSYsbychBIi9iQsZzFx3hYSdclzAcAo4
 HsprwnWC8N082RAJ/GRt0Ft+rqF0t1k/QyDrqGUZneu4PK4Tc/YEIxA3mVYs33vwBaaJ
 mqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBUsTlyEFlycfvpzBjefLjP5nx83lHp8T/kCIv2x2kU=;
 b=iMVuOLbjz+tGoe+Qw++bU9L627fgtxk+p+8kc6GMao0EQeCqFjeSlftAtIMysl2wAZ
 gBn+HhzcX91ot1ntD5FQZBq4aXXz2N4p/kSc1FtC/7LbI4CZ4fj+A/oQ0qJLQyOREI7m
 MfJ3nZvW7TMJQ5d8M99K2WW0DWol+egL71glDDuLGMOMpgMxO9YWupGxL0YX8FZaiaUj
 t9ZYRNYZ24R77SLveYzlghDONHHB1aryhxPKptswPHacQ2eMoKaJoeeT5rpMxwran70H
 xuoipxK+lvLV0dy0RHIJrVmO/ALj/v0t5krnhXcJ29eK+kA5aOKEj7IJ5c23wppvzz1T
 Dtlg==
X-Gm-Message-State: AOAM530V1GWAgcvNGPDwcoyKCmWHbLCA2zX90PrZg3xZ7f7z5vpkPmVn
 aH/m0WuyWLqHvH4moMp75S9n3Q==
X-Google-Smtp-Source: ABdhPJxSOAkRGoq4yxdplHubkWJSeXfgbJlHnJIdAwO5bQSPkD/GYIo6Q1uMR3y5zPdJKsnny8aSMg==
X-Received: by 2002:a05:600c:251:: with SMTP id
 17mr13619627wmj.137.1623312168985; 
 Thu, 10 Jun 2021 01:02:48 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id o3sm2715059wrm.78.2021.06.10.01.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:02:48 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: rjw@rjwysocki.net,
	lenb@kernel.org,
	joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH v4 2/6] ACPI: Move IOMMU setup code out of IORT
Date: Thu, 10 Jun 2021 09:51:29 +0200
Message-Id: <20210610075130.67517-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610075130.67517-1-jean-philippe@linaro.org>
References: <20210610075130.67517-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, lorenzo.pieralisi@arm.com, eric.auger@redhat.com,
 catalin.marinas@arm.com, sudeep.holla@arm.com, robin.murphy@arm.com,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 guohanjun@huawei.com, will@kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, baolu.lu@linux.intel.com
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

Extract the code that sets up the IOMMU infrastructure from IORT, since
it can be reused by VIOT. Move it one level up into a new
acpi_iommu_configure_id() function, which calls the IORT parsing
function which in turn calls the acpi_iommu_fwspec_init() helper.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/acpi/acpi_bus.h   |  3 ++
 include/linux/acpi_iort.h |  8 ++---
 drivers/acpi/arm64/iort.c | 75 +++++----------------------------------
 drivers/acpi/scan.c       | 73 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 87 insertions(+), 72 deletions(-)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 3a82faac5767..41f092a269f6 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -588,6 +588,9 @@ struct acpi_pci_root {
 
 bool acpi_dma_supported(struct acpi_device *adev);
 enum dev_dma_attr acpi_get_dma_attr(struct acpi_device *adev);
+int acpi_iommu_fwspec_init(struct device *dev, u32 id,
+			   struct fwnode_handle *fwnode,
+			   const struct iommu_ops *ops);
 int acpi_dma_get_range(struct device *dev, u64 *dma_addr, u64 *offset,
 		       u64 *size);
 int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
index f7f054833afd..f1f0842a2cb2 100644
--- a/include/linux/acpi_iort.h
+++ b/include/linux/acpi_iort.h
@@ -35,8 +35,7 @@ void acpi_configure_pmsi_domain(struct device *dev);
 int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id);
 /* IOMMU interface */
 int iort_dma_get_ranges(struct device *dev, u64 *size);
-const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
-						const u32 *id_in);
+int iort_iommu_configure_id(struct device *dev, const u32 *id_in);
 int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
 phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
 #else
@@ -50,9 +49,8 @@ static inline void acpi_configure_pmsi_domain(struct device *dev) { }
 /* IOMMU interface */
 static inline int iort_dma_get_ranges(struct device *dev, u64 *size)
 { return -ENODEV; }
-static inline const struct iommu_ops *iort_iommu_configure_id(
-				      struct device *dev, const u32 *id_in)
-{ return NULL; }
+static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
+{ return -ENODEV; }
 static inline
 int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 { return 0; }
diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index a940be1cf2af..b5b021e064b6 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -806,23 +806,6 @@ static struct acpi_iort_node *iort_get_msi_resv_iommu(struct device *dev)
 	return NULL;
 }
 
-static inline const struct iommu_ops *iort_fwspec_iommu_ops(struct device *dev)
-{
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-
-	return (fwspec && fwspec->ops) ? fwspec->ops : NULL;
-}
-
-static inline int iort_add_device_replay(struct device *dev)
-{
-	int err = 0;
-
-	if (dev->bus && !device_iommu_mapped(dev))
-		err = iommu_probe_device(dev);
-
-	return err;
-}
-
 /**
  * iort_iommu_msi_get_resv_regions - Reserved region driver helper
  * @dev: Device from iommu_get_resv_regions()
@@ -900,18 +883,6 @@ static inline bool iort_iommu_driver_enabled(u8 type)
 	}
 }
 
-static int arm_smmu_iort_xlate(struct device *dev, u32 streamid,
-			       struct fwnode_handle *fwnode,
-			       const struct iommu_ops *ops)
-{
-	int ret = iommu_fwspec_init(dev, fwnode, ops);
-
-	if (!ret)
-		ret = iommu_fwspec_add_ids(dev, &streamid, 1);
-
-	return ret;
-}
-
 static bool iort_pci_rc_supports_ats(struct acpi_iort_node *node)
 {
 	struct acpi_iort_root_complex *pci_rc;
@@ -946,7 +917,7 @@ static int iort_iommu_xlate(struct device *dev, struct acpi_iort_node *node,
 		return iort_iommu_driver_enabled(node->type) ?
 		       -EPROBE_DEFER : -ENODEV;
 
-	return arm_smmu_iort_xlate(dev, streamid, iort_fwnode, ops);
+	return acpi_iommu_fwspec_init(dev, streamid, iort_fwnode, ops);
 }
 
 struct iort_pci_alias_info {
@@ -1020,24 +991,14 @@ static int iort_nc_iommu_map_id(struct device *dev,
  * @dev: device to configure
  * @id_in: optional input id const value pointer
  *
- * Returns: iommu_ops pointer on configuration success
- *          NULL on configuration failure
+ * Returns: 0 on success, <0 on failure
  */
-const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
-						const u32 *id_in)
+int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
 {
 	struct acpi_iort_node *node;
-	const struct iommu_ops *ops;
+	const struct iommu_ops *ops = NULL;
 	int err = -ENODEV;
 
-	/*
-	 * If we already translated the fwspec there
-	 * is nothing left to do, return the iommu_ops.
-	 */
-	ops = iort_fwspec_iommu_ops(dev);
-	if (ops)
-		return ops;
-
 	if (dev_is_pci(dev)) {
 		struct iommu_fwspec *fwspec;
 		struct pci_bus *bus = to_pci_dev(dev)->bus;
@@ -1046,7 +1007,7 @@ const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
 		node = iort_scan_node(ACPI_IORT_NODE_PCI_ROOT_COMPLEX,
 				      iort_match_node_callback, &bus->dev);
 		if (!node)
-			return NULL;
+			return -ENODEV;
 
 		info.node = node;
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
@@ -1059,7 +1020,7 @@ const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
 		node = iort_scan_node(ACPI_IORT_NODE_NAMED_COMPONENT,
 				      iort_match_node_callback, dev);
 		if (!node)
-			return NULL;
+			return -ENODEV;
 
 		err = id_in ? iort_nc_iommu_map_id(dev, node, id_in) :
 			      iort_nc_iommu_map(dev, node);
@@ -1068,32 +1029,14 @@ const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
 			iort_named_component_init(dev, node);
 	}
 
-	/*
-	 * If we have reason to believe the IOMMU driver missed the initial
-	 * add_device callback for dev, replay it to get things in order.
-	 */
-	if (!err) {
-		ops = iort_fwspec_iommu_ops(dev);
-		err = iort_add_device_replay(dev);
-	}
-
-	/* Ignore all other errors apart from EPROBE_DEFER */
-	if (err == -EPROBE_DEFER) {
-		ops = ERR_PTR(err);
-	} else if (err) {
-		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
-		ops = NULL;
-	}
-
-	return ops;
+	return err;
 }
 
 #else
 int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 { return 0; }
-const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
-						const u32 *input_id)
-{ return NULL; }
+int iort_iommu_configure_id(struct device *dev, const u32 *input_id)
+{ return -ENODEV; }
 #endif
 
 static int nc_dma_get_range(struct device *dev, u64 *size)
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index ea613df8f913..0c53c8533300 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/iommu.h>
 #include <linux/signal.h>
 #include <linux/kthread.h>
 #include <linux/dmi.h>
@@ -1520,6 +1521,76 @@ int acpi_dma_get_range(struct device *dev, u64 *dma_addr, u64 *offset,
 	return ret >= 0 ? 0 : ret;
 }
 
+#ifdef CONFIG_IOMMU_API
+int acpi_iommu_fwspec_init(struct device *dev, u32 id,
+			   struct fwnode_handle *fwnode,
+			   const struct iommu_ops *ops)
+{
+	int ret = iommu_fwspec_init(dev, fwnode, ops);
+
+	if (!ret)
+		ret = iommu_fwspec_add_ids(dev, &id, 1);
+
+	return ret;
+}
+
+static inline const struct iommu_ops *acpi_iommu_fwspec_ops(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+	return fwspec ? fwspec->ops : NULL;
+}
+
+static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
+						       const u32 *id_in)
+{
+	int err;
+	const struct iommu_ops *ops;
+
+	/*
+	 * If we already translated the fwspec there is nothing left to do,
+	 * return the iommu_ops.
+	 */
+	ops = acpi_iommu_fwspec_ops(dev);
+	if (ops)
+		return ops;
+
+	err = iort_iommu_configure_id(dev, id_in);
+
+	/*
+	 * If we have reason to believe the IOMMU driver missed the initial
+	 * add_device callback for dev, replay it to get things in order.
+	 */
+	if (!err && dev->bus && !device_iommu_mapped(dev))
+		err = iommu_probe_device(dev);
+
+	/* Ignore all other errors apart from EPROBE_DEFER */
+	if (err == -EPROBE_DEFER) {
+		return ERR_PTR(err);
+	} else if (err) {
+		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
+		return NULL;
+	}
+	return acpi_iommu_fwspec_ops(dev);
+}
+
+#else /* !CONFIG_IOMMU_API */
+
+int acpi_iommu_fwspec_init(struct device *dev, u32 id,
+			   struct fwnode_handle *fwnode,
+			   const struct iommu_ops *ops)
+{
+	return -ENODEV;
+}
+
+static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
+						       const u32 *id_in)
+{
+	return NULL;
+}
+
+#endif /* !CONFIG_IOMMU_API */
+
 /**
  * acpi_dma_configure_id - Set-up DMA configuration for the device.
  * @dev: The pointer to the device
@@ -1539,7 +1610,7 @@ int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
 
 	acpi_arch_dma_setup(dev, &dma_addr, &size);
 
-	iommu = iort_iommu_configure_id(dev, input_id);
+	iommu = acpi_iommu_configure_id(dev, input_id);
 	if (PTR_ERR(iommu) == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
