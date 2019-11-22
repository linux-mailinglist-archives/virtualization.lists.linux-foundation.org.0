Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 458DE106CEF
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:56:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E581E881BA;
	Fri, 22 Nov 2019 10:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-f1cBtuQkFv; Fri, 22 Nov 2019 10:56:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7B86A881C0;
	Fri, 22 Nov 2019 10:56:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 633D2C18DA;
	Fri, 22 Nov 2019 10:56:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAD30C18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B3855881BF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTXbDsBeQIXt
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C6818881BA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:56:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i12so8013427wrn.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtJV+Z/+/tbCQItMssO61Gtwu58uukk1EMY1cx5Lnrc=;
 b=mCKz+BwSiQij013yjrKfw6oVS8rZuOUhHnkYyeMuylQQuFFsn9XIbdgBHPAB3A8pdU
 cMUMBgkrvvyXzSZLc4JjMGoOSzDyj//LqR8hEsiytCRio7CzvsCfCntQef1cjjByIfQ+
 0DBqbuPYhmOF4UbwVb2bHkiMX1wUo68X/5aywzwjn2hqptbDdDMBAVskk51+xMBuyCTU
 0aOnmA88FRuITCJgViQafNz+hmtGYWMc11yYsyCe7/24XyqUneiJC1AQ84o9o8cla+Ey
 ATsb1Rzo34z2s9+ijfxeiOEUyGmCjwuFbjm2z5hrxBdndr6/6EsPwSvHM8DWWWBQjgAR
 RgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtJV+Z/+/tbCQItMssO61Gtwu58uukk1EMY1cx5Lnrc=;
 b=rL+tWM3I4Qz7GdSSO6z8YLbfYED9Nx3MzclF8WVKxdo7dXc3eWj0KKZNEc2GRaB4gp
 YJDrV8bcNOrS99/wJ4ezOtl3m865i4zJfMdv46SlIGDDDb3Vc9Y7a6taWbF/3ijKXv+T
 VEHSSEsTw3Xm+wo1ITDbVNEKoW6jbpebRoBtT1lviSutuaNZI0lMnHpyO86WgKZg9eab
 VC5sBHqihFpIVUVNUIF/+BQff3OfV1KOq5FPqCzHf6nYbi4RJQBWQCgoDve8vaLzk2lZ
 8id5/wiwGbQYs/BG032UEzrjx9FO3oCvZ7qfIKgp16XE1csQxVfgpqSJhCw1BB8VB9Jh
 8f0g==
X-Gm-Message-State: APjAAAVT4gXR/V4vwjR5aQSeUtryR4YdoZrmGXC8t69ypUcjX90zakwH
 gwNrsagQ/aYfAbNqO9wT4WYLSg==
X-Google-Smtp-Source: APXvYqx7MG4bOlzFFisEZutGEcVZWtWFA9RVeyazzfivhpVCLuQP4wNiRtqWewtbovVtsPJwXnRjLg==
X-Received: by 2002:a5d:4a8c:: with SMTP id o12mr508171wrq.43.1574419860358;
 Fri, 22 Nov 2019 02:51:00 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:50:59 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 07/13] ACPI/IORT: Defer probe until virtio-iommu-pci has
 registered a fwnode
Date: Fri, 22 Nov 2019 11:49:54 +0100
Message-Id: <20191122105000.800410-8-jean-philippe@linaro.org>
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

When the IOMMU is PCI-based, IORT doesn't know the fwnode until the
driver has had a chance to register it. In addition to deferring the
probe until the IOMMU ops are set, also defer the probe until the fwspec
is available.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/acpi/iort.c | 54 ++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/acpi/iort.c b/drivers/acpi/iort.c
index b517aa4e83ba..f08f72d8af78 100644
--- a/drivers/acpi/iort.c
+++ b/drivers/acpi/iort.c
@@ -61,6 +61,22 @@ static bool iort_type_matches(u8 type, enum iort_node_category category)
 	}
 }
 
+static inline bool iort_iommu_driver_enabled(u8 type)
+{
+	switch (type) {
+	case ACPI_IORT_NODE_SMMU_V3:
+		return IS_BUILTIN(CONFIG_ARM_SMMU_V3);
+	case ACPI_IORT_NODE_SMMU:
+		return IS_BUILTIN(CONFIG_ARM_SMMU);
+	case ACPI_VIOT_IORT_NODE_VIRTIO_MMIO_IOMMU:
+	case ACPI_VIOT_IORT_NODE_VIRTIO_PCI_IOMMU:
+		return IS_ENABLED(CONFIG_VIRTIO_IOMMU);
+	default:
+		pr_warn("IORT node type %u does not describe an IOMMU\n", type);
+		return false;
+	}
+}
+
 /**
  * iort_set_fwnode() - Create iort_fwnode and use it to register
  *		       iommu data in the iort_fwnode_list
@@ -102,9 +118,9 @@ static inline int iort_set_fwnode(struct acpi_iort_node *iort_node,
  *
  * Returns: fwnode_handle pointer on success, NULL on failure
  */
-static inline struct fwnode_handle *iort_get_fwnode(
-			struct acpi_iort_node *node)
+static inline struct fwnode_handle *iort_get_fwnode(struct acpi_iort_node *node)
 {
+	int err = -ENODEV;
 	struct iort_fwnode *curr;
 	struct fwnode_handle *fwnode = NULL;
 
@@ -112,12 +128,20 @@ static inline struct fwnode_handle *iort_get_fwnode(
 	list_for_each_entry(curr, &iort_fwnode_list, list) {
 		if (curr->iort_node == node) {
 			fwnode = curr->fwnode;
+			if (!fwnode && curr->pci_devid) {
+				/*
+				 * Postpone probe until virtio-iommu has
+				 * registered its fwnode.
+				 */
+				err = iort_iommu_driver_enabled(node->type) ?
+					-EPROBE_DEFER : -ENODEV;
+			}
 			break;
 		}
 	}
 	spin_unlock(&iort_fwnode_lock);
 
-	return fwnode;
+	return fwnode ?: ERR_PTR(err);
 }
 
 /**
@@ -874,22 +898,6 @@ int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 	return (resv == its->its_count) ? resv : -ENODEV;
 }
 
-static inline bool iort_iommu_driver_enabled(u8 type)
-{
-	switch (type) {
-	case ACPI_IORT_NODE_SMMU_V3:
-		return IS_BUILTIN(CONFIG_ARM_SMMU_V3);
-	case ACPI_IORT_NODE_SMMU:
-		return IS_BUILTIN(CONFIG_ARM_SMMU);
-	case ACPI_VIOT_IORT_NODE_VIRTIO_MMIO_IOMMU:
-	case ACPI_VIOT_IORT_NODE_VIRTIO_PCI_IOMMU:
-		return IS_ENABLED(CONFIG_VIRTIO_IOMMU);
-	default:
-		pr_warn("IORT node type %u does not describe an IOMMU\n", type);
-		return false;
-	}
-}
-
 static int arm_smmu_iort_xlate(struct device *dev, u32 streamid,
 			       struct fwnode_handle *fwnode,
 			       const struct iommu_ops *ops)
@@ -920,8 +928,8 @@ static int iort_iommu_xlate(struct device *dev, struct acpi_iort_node *node,
 		return -ENODEV;
 
 	iort_fwnode = iort_get_fwnode(node);
-	if (!iort_fwnode)
-		return -ENODEV;
+	if (IS_ERR(iort_fwnode))
+		return PTR_ERR(iort_fwnode);
 
 	/*
 	 * If the ops look-up fails, this means that either
@@ -1618,8 +1626,8 @@ static int __init iort_add_platform_device(struct acpi_iort_node *node,
 
 	fwnode = iort_get_fwnode(node);
 
-	if (!fwnode) {
-		ret = -ENODEV;
+	if (IS_ERR(fwnode)) {
+		ret = PTR_ERR(fwnode);
 		goto dev_put;
 	}
 
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
