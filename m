Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 01807106C3B
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:51:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACDFA881B7;
	Fri, 22 Nov 2019 10:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNm121tIOH-y; Fri, 22 Nov 2019 10:51:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A584881AC;
	Fri, 22 Nov 2019 10:51:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24176C18DA;
	Fri, 22 Nov 2019 10:51:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A2F4C1DE1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7876C25D78
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufMoynoymzvn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 3C46A21526
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z19so7061426wmk.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 02:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GmQroTy0ZSrB9+ytyBw658P0+bfjBqqeFkyQrRlY2fc=;
 b=R/GX7GpncHdtpCGTNb9LZDYyir4t0PAmFjI7FlT5nol5eGqh3g9UoW1PBFoTNplogC
 SVaBaD4hexSWM3jfSYqGTKlvokoECPyser6aGFmjBzeKT2/KrCawSXcvu8mgYtMRxIMj
 tjqCar++xgaYfLYaRy3XdgFwRtpRlR7HYSWpL7hpbcrnKLQ/CT50WIpJ4qwVNNF+zNZc
 UXwNi6d2mNmRLawPvPUm7CP8glqP2G8DYGV8VDXJ3clmTzacXVLkJQNgq1AhzYbkUbhk
 G7dh/PVGzK1sEon1bwZfxl1rMOZ3neP3I9WNi3BrtVhqN5GNfDY+HDZVheLdZIq1uKyx
 Bdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GmQroTy0ZSrB9+ytyBw658P0+bfjBqqeFkyQrRlY2fc=;
 b=Xj723vVMDrmbzwpBJx06RNbHK4JYCpbHYCDoHrgcc6PbjGx/1ryuI51V55cCKGmXCO
 QszsOzrzQVyhiCN25LGB9vopvqkWGtlqprxmvFc7Xf9HZPLi5rnhfkGaGMJipn4wHO9q
 mKYEPoXp07cFykh7qMz6Cd/Nnj1Sa3J99EtiodzZAL2vgrR5uok2+70wS5Mu2efW1OYG
 UJ+FJZHq6oJ+lZKnVhLhnYzRNBParpwt9tLYiQTlkCNGxoKLmd30vWG4grt+WYUBiHNH
 30IdsgNzrsl9vB6j+uUKgwCLF/TOZZk82LsxglsJpyGAHO63DzbX6EwX5Hczzz+6iq08
 svag==
X-Gm-Message-State: APjAAAWi0N9KDHz0HPqBXHIpyzKDKx4g/MwcX2aB0Liy4v9q3DQU8yDt
 AUDBYWyMLynkt6Gztv5t66vtU79Cjm8=
X-Google-Smtp-Source: APXvYqzQ0kK55WM+AUAEgoOeMQBtZwacsLjY81F9irulPCIeYc5srmqzEv2GsM8DeS2tetqh0occ7Q==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr8729559wmh.157.1574419861629; 
 Fri, 22 Nov 2019 02:51:01 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:51:01 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 08/13] ACPI/IORT: Add callback to update a device's fwnode
Date: Fri, 22 Nov 2019 11:49:55 +0100
Message-Id: <20191122105000.800410-9-jean-philippe@linaro.org>
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

For a PCI-based IOMMU, IORT isn't in charge of allocating a fwnode. Let
the IOMMU driver update the fwnode associated to an IORT node when
available.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/acpi/iort.c       | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/acpi_iort.h |  4 ++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/acpi/iort.c b/drivers/acpi/iort.c
index f08f72d8af78..8263ab275b2b 100644
--- a/drivers/acpi/iort.c
+++ b/drivers/acpi/iort.c
@@ -1038,11 +1038,49 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 
 	return ops;
 }
+
+/**
+ * iort_iommu_update_fwnode - update fwnode of a PCI IOMMU
+ * @dev: the IOMMU device
+ * @fwnode: the fwnode, or NULL to remove an existing fwnode
+ *
+ * A PCI device isn't instantiated by the IORT driver. The IOMMU driver sets or
+ * removes its fwnode using this function.
+ */
+void iort_iommu_update_fwnode(struct device *dev, struct fwnode_handle *fwnode)
+{
+	struct pci_dev *pdev;
+	struct iort_fwnode *curr;
+	struct iort_pci_devid *devid;
+
+	if (!dev_is_pci(dev))
+		return;
+
+	pdev = to_pci_dev(dev);
+
+	spin_lock(&iort_fwnode_lock);
+	list_for_each_entry(curr, &iort_fwnode_list, list) {
+		devid = curr->pci_devid;
+		if (devid &&
+		    pci_domain_nr(pdev->bus) == devid->segment &&
+		    pdev->bus->number == devid->bus &&
+		    pdev->devfn == devid->devfn) {
+			WARN_ON(fwnode && curr->fwnode);
+			curr->fwnode = fwnode;
+			break;
+		}
+	}
+	spin_unlock(&iort_fwnode_lock);
+}
+EXPORT_SYMBOL_GPL(iort_iommu_update_fwnode);
 #else
 int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 { return 0; }
 const struct iommu_ops *iort_iommu_configure(struct device *dev)
 { return NULL; }
+static void iort_iommu_update_fwnode(struct device *dev,
+				     struct fwnode_handle *fwnode)
+{ }
 #endif
 
 static int nc_dma_get_range(struct device *dev, u64 *size)
diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
index f4db5fff07cf..840635e40d9d 100644
--- a/include/linux/acpi_iort.h
+++ b/include/linux/acpi_iort.h
@@ -43,6 +43,7 @@ int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id);
 void iort_dma_setup(struct device *dev, u64 *dma_addr, u64 *size);
 const struct iommu_ops *iort_iommu_configure(struct device *dev);
 int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
+void iort_iommu_update_fwnode(struct device *dev, struct fwnode_handle *fwnode);
 #else
 static void acpi_iort_register_table(struct acpi_table_header *table,
 				     enum iort_table_source source)
@@ -63,6 +64,9 @@ static inline const struct iommu_ops *iort_iommu_configure(
 static inline
 int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 { return 0; }
+static void iort_iommu_update_fwnode(struct device *dev,
+				     struct fwnode_handle *fwnode)
+{ }
 #endif
 
 #endif /* __ACPI_IORT_H__ */
-- 
2.24.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
