Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E463E106C39
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:51:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED5D9881D2;
	Fri, 22 Nov 2019 10:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvDHbI0naua2; Fri, 22 Nov 2019 10:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1DF31881B8;
	Fri, 22 Nov 2019 10:51:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5C21C1DE4;
	Fri, 22 Nov 2019 10:51:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5606C1DDE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B154B88197
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZkQs0pNZE80
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7EE8188184
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:00 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u18so6931225wmc.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1h5FjHSoFWza4c7kQCG4diNrL6ym0OIuM4Ss4lynM4=;
 b=bAqX72LIDtPtMJeGcUhtez0KLSm3flrmYHny6W5WMhZW2tBjcEjLpecXs8daLtPL+u
 gIyq0KG407aqOZvr8HCFfx2NxejbVRv+DXKSXLx1CmdcZvWAq2wuqlUIJFsCWwnqVj0z
 FNPNz0je2zOTjhgcT7Rskv72VmKDs3V7INAXyNn62BSM84iWNxGhohaR8+szZkJBwjXz
 gdfG/SnuAB8CMKbpfQ2N8du37PEiZ833hhE67RGgFzExhMx9eL1NmwtFVa7X0wbDMWv4
 I3LJsTClmFHCo6nmwPzWtZwPa8AoFWIvUaQZg04i4FPj5mGi2bRHYO6iQf1hiWBEEDVY
 8C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1h5FjHSoFWza4c7kQCG4diNrL6ym0OIuM4Ss4lynM4=;
 b=Wyjw8cHADZyG+CqWPgzYtRqg/c2IZLOoHt4YJEq2QrrIap6YQo4u/uIBUxitJzTkGf
 vzhT3JaF6rtVtIeRoBGKEWCGCCNdz7GGqrYGcbihTnOBbjZTvspUIGjHJ0O+KTDkJ/MK
 iGL8JsbHPY6LhJlaBd0BYOWYQyK7ivoDwcG6mCYF5TpzI061yvSThm62LhHehSHfNLzP
 OdETsT2ikI57VVBMyV/K+FO9+pSbOa+YnYrDj7DLNx1ZJWjzzi0GSDbYrEzN4uSGb6vp
 CioTolK+qf9wc99L6KWeJSdb7Fy5EoN9E0qETIFe2mh0W58ebqbld/F+aexQcx2RTZmH
 U7Qg==
X-Gm-Message-State: APjAAAVoX65YjlJMHSmn0XbgyJKeuRlQB+xr2EUZV9SATx+Msj6pvhAO
 8K1Fd0U30pD7+FTW6gFvKJhq/Q==
X-Google-Smtp-Source: APXvYqxlTuwGUmkspUqjVuJ7P7Gpo4B2+3ScBVHak+J+rgbXQroDE7A0jT8JY1RDm1JiUtrUxVmxiQ==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr15475854wma.71.1574419858922; 
 Fri, 22 Nov 2019 02:50:58 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:50:58 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 06/13] ACPI/IORT: Support VIOT virtio-pci node
Date: Fri, 22 Nov 2019 11:49:53 +0100
Message-Id: <20191122105000.800410-7-jean-philippe@linaro.org>
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

When virtio-iommu uses the PCI transport, IORT doesn't instantiate the
device and doesn't create a fwnode. They will be created later by the
PCI subsystem. Store the information needed to identify the IOMMU in
iort_fwnode_list.

Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
---
 drivers/acpi/iort.c | 117 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 93 insertions(+), 24 deletions(-)

diff --git a/drivers/acpi/iort.c b/drivers/acpi/iort.c
index adc5953fffa5..b517aa4e83ba 100644
--- a/drivers/acpi/iort.c
+++ b/drivers/acpi/iort.c
@@ -30,10 +30,17 @@ struct iort_its_msi_chip {
 	u32			translation_id;
 };
 
+struct iort_pci_devid {
+	u16 segment;
+	u8 bus;
+	u8 devfn;
+};
+
 struct iort_fwnode {
 	struct list_head list;
 	struct acpi_iort_node *iort_node;
 	struct fwnode_handle *fwnode;
+	struct iort_pci_devid *pci_devid;
 };
 static LIST_HEAD(iort_fwnode_list);
 static DEFINE_SPINLOCK(iort_fwnode_lock);
@@ -44,7 +51,8 @@ static bool iort_type_matches(u8 type, enum iort_node_category category)
 	case IORT_IOMMU_TYPE:
 		return type == ACPI_IORT_NODE_SMMU ||
 		       type == ACPI_IORT_NODE_SMMU_V3 ||
-		       type == ACPI_VIOT_IORT_NODE_VIRTIO_MMIO_IOMMU;
+		       type == ACPI_VIOT_IORT_NODE_VIRTIO_MMIO_IOMMU ||
+		       type == ACPI_VIOT_IORT_NODE_VIRTIO_PCI_IOMMU;
 	case IORT_MSI_TYPE:
 		return type == ACPI_IORT_NODE_ITS_GROUP;
 	default:
@@ -59,12 +67,14 @@ static bool iort_type_matches(u8 type, enum iort_node_category category)
  *
  * @node: IORT table node associated with the IOMMU
  * @fwnode: fwnode associated with the IORT node
+ * @pci_devid: pci device ID associated with the IORT node, may be NULL
  *
  * Returns: 0 on success
  *          <0 on failure
  */
 static inline int iort_set_fwnode(struct acpi_iort_node *iort_node,
-				  struct fwnode_handle *fwnode)
+				  struct fwnode_handle *fwnode,
+				  struct iort_pci_devid *pci_devid)
 {
 	struct iort_fwnode *np;
 
@@ -76,6 +86,7 @@ static inline int iort_set_fwnode(struct acpi_iort_node *iort_node,
 	INIT_LIST_HEAD(&np->list);
 	np->iort_node = iort_node;
 	np->fwnode = fwnode;
+	np->pci_devid = pci_devid;
 
 	spin_lock(&iort_fwnode_lock);
 	list_add_tail(&np->list, &iort_fwnode_list);
@@ -121,6 +132,7 @@ static inline void iort_delete_fwnode(struct acpi_iort_node *node)
 	spin_lock(&iort_fwnode_lock);
 	list_for_each_entry_safe(curr, tmp, &iort_fwnode_list, list) {
 		if (curr->iort_node == node) {
+			kfree(curr->pci_devid);
 			list_del(&curr->list);
 			kfree(curr);
 			break;
@@ -870,6 +882,7 @@ static inline bool iort_iommu_driver_enabled(u8 type)
 	case ACPI_IORT_NODE_SMMU:
 		return IS_BUILTIN(CONFIG_ARM_SMMU);
 	case ACPI_VIOT_IORT_NODE_VIRTIO_MMIO_IOMMU:
+	case ACPI_VIOT_IORT_NODE_VIRTIO_PCI_IOMMU:
 		return IS_ENABLED(CONFIG_VIRTIO_IOMMU);
 	default:
 		pr_warn("IORT node type %u does not describe an IOMMU\n", type);
@@ -1451,6 +1464,28 @@ static void __init viommu_mmio_dma_configure(struct device *dev,
 	acpi_dma_configure(dev, attr);
 }
 
+static __init struct iort_pci_devid *
+viommu_pci_get_devid(struct acpi_iort_node *node)
+{
+	unsigned int val;
+	struct iort_pci_devid *devid;
+	struct acpi_viot_iort_virtio_pci_iommu *viommu;
+
+	viommu = (struct acpi_viot_iort_virtio_pci_iommu *)node->node_data;
+
+	val = le32_to_cpu(viommu->devid);
+
+	devid = kzalloc(sizeof(*devid), GFP_KERNEL);
+	if (!devid)
+		return ERR_PTR(-ENOMEM);
+
+	devid->segment = val >> 16;
+	devid->bus = PCI_BUS_NUM(val);
+	devid->devfn = val & 0xff;
+
+	return devid;
+}
+
 struct iort_dev_config {
 	const char *name;
 	int (*dev_init)(struct acpi_iort_node *node);
@@ -1462,6 +1497,7 @@ struct iort_dev_config {
 	int (*dev_set_proximity)(struct device *dev,
 				    struct acpi_iort_node *node);
 	int (*dev_add_platdata)(struct platform_device *pdev);
+	struct iort_pci_devid *(*dev_get_pci_devid)(struct acpi_iort_node *node);
 };
 
 static const struct iort_dev_config iort_arm_smmu_v3_cfg __initconst = {
@@ -1494,6 +1530,10 @@ static const struct iort_dev_config iort_viommu_mmio_cfg __initconst = {
 	.dev_init_resources = viommu_mmio_init_resources,
 };
 
+static const struct iort_dev_config iort_viommu_pci_cfg __initconst = {
+	.dev_get_pci_devid = viommu_pci_get_devid,
+};
+
 static __init const struct iort_dev_config *iort_get_dev_cfg(
 			struct acpi_iort_node *node)
 {
@@ -1510,6 +1550,8 @@ static __init const struct iort_dev_config *iort_get_dev_cfg(
 		switch (node->type) {
 		case ACPI_VIOT_IORT_NODE_VIRTIO_MMIO_IOMMU:
 			return &iort_viommu_mmio_cfg;
+		case ACPI_VIOT_IORT_NODE_VIRTIO_PCI_IOMMU:
+			return &iort_viommu_pci_cfg;
 		}
 	}
 
@@ -1641,13 +1683,55 @@ static void __init iort_enable_acs(struct acpi_iort_node *iort_node)
 static inline void iort_enable_acs(struct acpi_iort_node *iort_node) { }
 #endif
 
-static void __init iort_init_platform_devices(void)
+static int __init iort_init_node(struct acpi_iort_node *iort_node)
+{
+	int ret;
+	const struct iort_dev_config *ops;
+	struct fwnode_handle *fwnode;
+
+	iort_enable_acs(iort_node);
+
+	ops = iort_get_dev_cfg(iort_node);
+	if (!ops)
+		return 0;
+
+	if (ops->dev_get_pci_devid) {
+		struct iort_pci_devid *pci_devid =
+			ops->dev_get_pci_devid(iort_node);
+
+		if (IS_ERR(pci_devid))
+			return PTR_ERR(pci_devid);
+		/*
+		 * For a PCI-based IOMMU, set the pci_devid handle now, but
+		 * leave the fwnode empty. It will be completed later when the
+		 * PCI device gets probed.
+		 */
+		iort_set_fwnode(iort_node, NULL, pci_devid);
+
+		return 0;
+	}
+
+	fwnode = acpi_alloc_fwnode_static();
+	if (!fwnode)
+		return -ENOMEM;
+
+	iort_set_fwnode(iort_node, fwnode, NULL);
+
+	ret = iort_add_platform_device(iort_node, ops);
+	if (ret) {
+		iort_delete_fwnode(iort_node);
+		acpi_free_fwnode_static(fwnode);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __init iort_init_devices(void)
 {
 	struct acpi_iort_node *iort_node, *iort_end;
 	struct acpi_table_iort *iort;
-	struct fwnode_handle *fwnode;
-	int i, ret;
-	const struct iort_dev_config *ops;
+	int i;
 
 	/*
 	 * iort_table and iort both point to the start of IORT table, but
@@ -1667,23 +1751,8 @@ static void __init iort_init_platform_devices(void)
 			return;
 		}
 
-		iort_enable_acs(iort_node);
-
-		ops = iort_get_dev_cfg(iort_node);
-		if (ops) {
-			fwnode = acpi_alloc_fwnode_static();
-			if (!fwnode)
-				return;
-
-			iort_set_fwnode(iort_node, fwnode);
-
-			ret = iort_add_platform_device(iort_node, ops);
-			if (ret) {
-				iort_delete_fwnode(iort_node);
-				acpi_free_fwnode_static(fwnode);
-				return;
-			}
-		}
+		if (iort_init_node(iort_node))
+			return;
 
 		iort_node = ACPI_ADD_PTR(struct acpi_iort_node, iort_node,
 					 iort_node->length);
@@ -1703,7 +1772,7 @@ void __init acpi_iort_register_table(struct acpi_table_header *table,
 	iort_table = table;
 	iort_table_source = source;
 
-	iort_init_platform_devices();
+	iort_init_devices();
 }
 
 void __init acpi_iort_init(void)
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
