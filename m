Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1CD15DF0A
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 17:07:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 69B7A22122;
	Fri, 14 Feb 2020 16:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuXD6+XQ4Q3z; Fri, 14 Feb 2020 16:07:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1891222193;
	Fri, 14 Feb 2020 16:06:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 006F0C1D8E;
	Fri, 14 Feb 2020 16:06:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38CB4C08A4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 287468671C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oad2hs5ptoda
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 14DD186519
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:06:56 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n10so9557990wrm.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 08:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dtoHQFfcPUx3J9Yj+w75j0tmJNIXXKWXBMrkNV5QUtA=;
 b=KxWvsYOjMDDeXW0C4FrB+T845xsr3tPHgfZyYOhEknCRkT2EZdKSnNFJ9FpEF/9U5H
 wEBmoRf35+PUjOzVklW6wQsV61NTqYXaLpdhKPD1dFg+v6rckomHE/jDunEQyNKdF2P/
 zDgJcd3Ly5V06ns/cPJupwvG4O0gzLF+2TgP00BbTX5mgRSeNmoz0eW6EC+6o6l3XstP
 AtCMsFDKbwwzHfxtJemEvJ64HCWsNWw9OHa7QhqnGXX4KBQ4+w2FzZ8ohClSIJrrLydK
 PVijQAi8nfX1Z5K1VWX4H/PKISs2VFfViK8uYoFKcTyp7e0FabhifofurcObbGYMSmcA
 S1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtoHQFfcPUx3J9Yj+w75j0tmJNIXXKWXBMrkNV5QUtA=;
 b=mGc7cXyHFMKQhgEYy7lDB19yyW50Xfft64iO2YgcoTGn6BuYK35WOs1q442B7VYeyh
 MZwj1CtAJKc+cJbTrShXBPBD6Yr9rfohxW9X0xBiz9i9Vu8AEmwE7jBdszDI403QC5qz
 HYL4jrEG6uhfty9un+OWLTDz8/4/TAyZpTPuSmoldaA/0wbVJ9PMY6kfeMypqEJ95C5A
 tEbPDJlA41Jo5SeWWn/isybpoIgOarzR3hKSlgRdSCP+XCM9obm9vKdPnBnOF6qY+cyi
 cZtShKLNnSVc5OFwEoOIyy3uZqHROJAY/gUcOYFiGmHEMS14f8n5JJq2sbFlIcqrHznO
 ajFA==
X-Gm-Message-State: APjAAAXgzBqTckxSVFJPTTRt0B+C+5yZbiYhlCuXjcOC8L6YuQL6jZnX
 UevAZLs6KJPvb2b95hPy/uoG+w==
X-Google-Smtp-Source: APXvYqxcwXzHQHmoBtBoFv66dr/Bmv59Kxy9319y9VZMdMNhbF5R98tMf/UqrROO4FQAK13aZSUpMQ==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr5017304wrk.249.1581696414114; 
 Fri, 14 Feb 2020 08:06:54 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id s139sm8133213wme.35.2020.02.14.08.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 08:06:53 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org
Subject: [PATCH 1/3] iommu/virtio: Add topology description to virtio-iommu
 config space
Date: Fri, 14 Feb 2020 17:04:11 +0100
Message-Id: <20200214160413.1475396-2-jean-philippe@linaro.org>
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

Platforms without device-tree do not currently have a method for
describing the vIOMMU topology. Provide a topology description embedded
into the virtio device.

Use PCI FIXUP to probe the config space early, because we need to
discover the topology before any DMA configuration takes place, and the
virtio driver may be loaded much later. Since we discover the topology
description when probing the PCI hierarchy, the virtual IOMMU cannot
manage other platform devices discovered earlier.

This solution isn't elegant nor foolproof, but is the best we can do at
the moment and works with existing virtio-iommu implementations. It also
enables an IOMMU for lightweight hypervisors that do not rely on
firmware methods for booting.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 MAINTAINERS                           |   2 +
 drivers/iommu/Kconfig                 |  10 +
 drivers/iommu/Makefile                |   1 +
 drivers/iommu/virtio-iommu-topology.c | 343 ++++++++++++++++++++++++++
 drivers/iommu/virtio-iommu.c          |   3 +
 include/linux/virt_iommu.h            |  19 ++
 include/uapi/linux/virtio_iommu.h     |  26 ++
 7 files changed, 404 insertions(+)
 create mode 100644 drivers/iommu/virtio-iommu-topology.c
 create mode 100644 include/linux/virt_iommu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 38fe2f3f7b6f..6b978b0d0c90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17780,6 +17780,8 @@ M:	Jean-Philippe Brucker <jean-philippe@linaro.org>
 L:	virtualization@lists.linux-foundation.org
 S:	Maintained
 F:	drivers/iommu/virtio-iommu.c
+F:	drivers/iommu/virtio-iommu-topology.c
+F:	include/linux/virt_iommu.h
 F:	include/uapi/linux/virtio_iommu.h
 
 VIRTUAL BOX GUEST DEVICE DRIVER
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index d2fade984999..068d4e0e3541 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -516,4 +516,14 @@ config VIRTIO_IOMMU
 
 	  Say Y here if you intend to run this kernel as a guest.
 
+config VIRTIO_IOMMU_TOPOLOGY
+	bool "Topology properties for the virtio-iommu"
+	depends on VIRTIO_IOMMU
+	default y
+	help
+	  Enable early probing of the virtio-iommu device, to detect the
+	  built-in topology description.
+
+	  Say Y here if you intend to run this kernel as a guest.
+
 endif # IOMMU_SUPPORT
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 2104fb8afc06..f295cacf9c6e 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
 obj-$(CONFIG_QCOM_IOMMU) += qcom_iommu.o
 obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
 obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
+obj-$(CONFIG_VIRTIO_IOMMU_TOPOLOGY) += virtio-iommu-topology.o
diff --git a/drivers/iommu/virtio-iommu-topology.c b/drivers/iommu/virtio-iommu-topology.c
new file mode 100644
index 000000000000..e4ab49701df5
--- /dev/null
+++ b/drivers/iommu/virtio-iommu-topology.c
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/dma-iommu.h>
+#include <linux/list.h>
+#include <linux/pci.h>
+#include <linux/virt_iommu.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_pci.h>
+#include <uapi/linux/virtio_iommu.h>
+
+struct viommu_cap_config {
+	u8 bar;
+	u32 length; /* structure size */
+	u32 offset; /* structure offset within the bar */
+};
+
+union viommu_topo_cfg {
+	__le16					type;
+	struct virtio_iommu_topo_pci_range	pci;
+	struct virtio_iommu_topo_endpoint	ep;
+};
+
+struct viommu_spec {
+	struct device				*dev; /* transport device */
+	struct fwnode_handle			*fwnode;
+	struct iommu_ops			*ops;
+	struct list_head			list;
+	size_t					num_items;
+	/* The config array of length num_items follows */
+	union viommu_topo_cfg			cfg[];
+};
+
+static LIST_HEAD(viommus);
+static DEFINE_MUTEX(viommus_lock);
+
+#define VPCI_FIELD(field) offsetof(struct virtio_pci_cap, field)
+
+static inline int viommu_pci_find_capability(struct pci_dev *dev, u8 cfg_type,
+					     struct viommu_cap_config *cap)
+{
+	int pos;
+	u8 bar;
+
+	for (pos = pci_find_capability(dev, PCI_CAP_ID_VNDR);
+	     pos > 0;
+	     pos = pci_find_next_capability(dev, pos, PCI_CAP_ID_VNDR)) {
+		u8 type;
+
+		pci_read_config_byte(dev, pos + VPCI_FIELD(cfg_type), &type);
+		if (type != cfg_type)
+			continue;
+
+		pci_read_config_byte(dev, pos + VPCI_FIELD(bar), &bar);
+
+		/* Ignore structures with reserved BAR values */
+		if (type != VIRTIO_PCI_CAP_PCI_CFG && bar > 0x5)
+			continue;
+
+		cap->bar = bar;
+		pci_read_config_dword(dev, pos + VPCI_FIELD(length),
+				      &cap->length);
+		pci_read_config_dword(dev, pos + VPCI_FIELD(offset),
+				      &cap->offset);
+
+		return pos;
+	}
+	return 0;
+}
+
+static void viommu_ccopy(__le32 *dst, u32 __iomem *src, size_t length)
+{
+	size_t i;
+
+	/* For the moment all our config structures align on 32b */
+	if (WARN_ON(length % 4))
+		return;
+
+	for (i = 0; i < length / 4; i++)
+		/* Keep little-endian data */
+		dst[i] = cpu_to_le32(ioread32(src + i));
+}
+
+static int viommu_parse_topology(struct device *dev,
+				 struct virtio_iommu_config __iomem *cfg)
+{
+	size_t i;
+	size_t spec_length;
+	struct viommu_spec *viommu_spec;
+	u32 offset, item_length, num_items;
+
+	offset = ioread32(&cfg->topo_config.offset);
+	item_length = ioread32(&cfg->topo_config.item_length);
+	num_items = ioread32(&cfg->topo_config.num_items);
+	if (!offset || !num_items || !item_length)
+		return 0;
+
+	spec_length = sizeof(*viommu_spec) + num_items *
+					     sizeof(union viommu_topo_cfg);
+	viommu_spec = kzalloc(spec_length, GFP_KERNEL);
+	if (!viommu_spec)
+		return -ENOMEM;
+
+	viommu_spec->dev = dev;
+
+	/* Copy in the whole array, sort it out later */
+	for (i = 0; i < num_items; i++) {
+		size_t read_length = min_t(size_t, item_length,
+					   sizeof(union viommu_topo_cfg));
+
+		viommu_ccopy((__le32 *)&viommu_spec->cfg[i],
+			     (void __iomem *)cfg + offset,
+			     read_length);
+
+		offset += item_length;
+	}
+	viommu_spec->num_items = num_items;
+
+	mutex_lock(&viommus_lock);
+	list_add(&viommu_spec->list, &viommus);
+	mutex_unlock(&viommus_lock);
+
+	return 0;
+}
+
+static void viommu_pci_parse_topology(struct pci_dev *dev)
+{
+	int pos;
+	u32 features;
+	void __iomem *regs;
+	struct viommu_cap_config cap = {0};
+	struct virtio_pci_common_cfg __iomem *common_cfg;
+
+	/*
+	 * The virtio infrastructure might not be loaded at this point. we need
+	 * to access the BARs ourselves.
+	 */
+	pos = viommu_pci_find_capability(dev, VIRTIO_PCI_CAP_COMMON_CFG, &cap);
+	if (!pos) {
+		pci_warn(dev, "common capability not found\n");
+		return;
+	}
+
+	if (pci_enable_device_mem(dev))
+		return;
+
+	regs = pci_iomap(dev, cap.bar, 0);
+	if (!regs)
+		return;
+
+	common_cfg = regs + cap.offset;
+
+	/* Find out if the device supports topology description */
+	writel(0, &common_cfg->device_feature_select);
+	features = ioread32(&common_cfg->device_feature);
+
+	pci_iounmap(dev, regs);
+
+	if (!(features & BIT(VIRTIO_IOMMU_F_TOPOLOGY))) {
+		pci_dbg(dev, "device doesn't have topology description");
+		return;
+	}
+
+	pos = viommu_pci_find_capability(dev, VIRTIO_PCI_CAP_DEVICE_CFG, &cap);
+	if (!pos) {
+		pci_warn(dev, "device config capability not found\n");
+		return;
+	}
+
+	regs = pci_iomap(dev, cap.bar, 0);
+	if (!regs)
+		return;
+
+	pci_info(dev, "parsing virtio-iommu topology\n");
+	viommu_parse_topology(&dev->dev, regs + cap.offset);
+	pci_iounmap(dev, regs);
+}
+
+/*
+ * Catch a PCI virtio-iommu implementation early to get the topology description
+ * before we start probing other endpoints.
+ */
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT_QUMRANET, 0x1040 + VIRTIO_ID_IOMMU,
+			viommu_pci_parse_topology);
+
+/*
+ * Return true if the device matches this topology structure. Write the endpoint
+ * ID into epid if it's the case.
+ */
+static bool viommu_parse_pci(struct pci_dev *pdev, union viommu_topo_cfg *cfg,
+			     u32 *epid)
+{
+	u32 endpoint_start;
+	u16 start, end, domain;
+	u16 devid = pci_dev_id(pdev);
+	u16 type = le16_to_cpu(cfg->type);
+
+	if (type != VIRTIO_IOMMU_TOPO_PCI_RANGE)
+		return false;
+
+	start		= le16_to_cpu(cfg->pci.requester_start);
+	end		= le16_to_cpu(cfg->pci.requester_end);
+	domain		= le16_to_cpu(cfg->pci.hierarchy);
+	endpoint_start	= le32_to_cpu(cfg->pci.endpoint_start);
+
+	if (pci_domain_nr(pdev->bus) == domain &&
+	    devid >= start && devid <= end) {
+		*epid = devid - start + endpoint_start;
+		return true;
+	}
+	return false;
+}
+
+static const struct iommu_ops *virt_iommu_setup(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	const struct iommu_ops *viommu_ops = NULL;
+	struct fwnode_handle *viommu_fwnode;
+	struct viommu_spec *viommu_spec;
+	struct pci_dev *pci_dev = NULL;
+	struct device *viommu_dev;
+	bool found = false;
+	size_t i;
+	u32 epid;
+	int ret;
+
+	/* Already translated? */
+	if (fwspec && fwspec->ops)
+		return fwspec->ops;
+
+	if (dev_is_pci(dev)) {
+		pci_dev = to_pci_dev(dev);
+	} else {
+		/* At the moment we don't support platform devices */
+		return NULL;
+	}
+
+	mutex_lock(&viommus_lock);
+	list_for_each_entry(viommu_spec, &viommus, list) {
+		for (i = 0; i < viommu_spec->num_items; i++) {
+			union viommu_topo_cfg *cfg = &viommu_spec->cfg[i];
+
+			found = viommu_parse_pci(pci_dev, cfg, &epid);
+			if (found)
+				break;
+		}
+		if (found) {
+			viommu_ops = viommu_spec->ops;
+			viommu_fwnode = viommu_spec->fwnode;
+			viommu_dev = viommu_spec->dev;
+			break;
+		}
+	}
+	mutex_unlock(&viommus_lock);
+	if (!found)
+		return NULL;
+
+	/* We're not translating ourselves. */
+	if (viommu_dev == dev)
+		return NULL;
+
+	/*
+	 * If we found a PCI range managed by the viommu, we're the ones that
+	 * have to request ACS.
+	 */
+	if (pci_dev)
+		pci_request_acs();
+
+	if (!viommu_ops)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	ret = iommu_fwspec_init(dev, viommu_fwnode, viommu_ops);
+	if (ret)
+		return ERR_PTR(ret);
+
+	iommu_fwspec_add_ids(dev, &epid, 1);
+
+	return viommu_ops;
+}
+
+/**
+ * virt_dma_configure - Configure DMA of virtualized devices
+ * @dev: the endpoint
+ *
+ * Setup the DMA and IOMMU ops of a virtual device, for platforms without DT or
+ * ACPI.
+ *
+ * Return: -EPROBE_DEFER if the device is managed by an IOMMU that hasn't been
+ *   probed yet, 0 otherwise
+ */
+int virt_dma_configure(struct device *dev)
+{
+	const struct iommu_ops *iommu_ops;
+
+	iommu_ops = virt_iommu_setup(dev);
+	if (IS_ERR_OR_NULL(iommu_ops)) {
+		int ret = PTR_ERR(iommu_ops);
+
+		if (ret == -EPROBE_DEFER || ret == 0)
+			return ret;
+		dev_err(dev, "error %d while setting up virt IOMMU\n", ret);
+		return 0;
+	}
+
+	/*
+	 * If we have reason to believe the IOMMU driver missed the initial
+	 * add_device callback for dev, replay it to get things in order.
+	 */
+	if (dev->bus && !device_iommu_mapped(dev))
+		iommu_probe_device(dev);
+
+	/* Assume coherent, as well as full 64-bit addresses. */
+#ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
+	arch_setup_dma_ops(dev, 0, ~0ULL, iommu_ops, true);
+#else
+	iommu_setup_dma_ops(dev, 0, ~0ULL);
+#endif
+	return 0;
+}
+
+/**
+ * virt_set_iommu_ops - Set the IOMMU ops of a virtual IOMMU device
+ * @dev: the IOMMU device (transport)
+ * @ops: the new IOMMU ops or NULL
+ *
+ * Setup the iommu_ops associated to a viommu_spec, once the driver is loaded
+ * and the device probed.
+ */
+void virt_set_iommu_ops(struct device *dev, struct iommu_ops *ops)
+{
+	struct viommu_spec *viommu_spec;
+
+	mutex_lock(&viommus_lock);
+	list_for_each_entry(viommu_spec, &viommus, list) {
+		if (viommu_spec->dev == dev) {
+			viommu_spec->ops = ops;
+			viommu_spec->fwnode = ops ? dev->fwnode : NULL;
+			break;
+		}
+	}
+	mutex_unlock(&viommus_lock);
+}
+EXPORT_SYMBOL_GPL(virt_set_iommu_ops);
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index cce329d71fba..f18ba8e22ebd 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -21,6 +21,7 @@
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_ids.h>
+#include <linux/virt_iommu.h>
 #include <linux/wait.h>
 
 #include <uapi/linux/virtio_iommu.h>
@@ -1075,6 +1076,7 @@ static int viommu_probe(struct virtio_device *vdev)
 	if (ret)
 		goto err_free_vqs;
 
+	virt_set_iommu_ops(dev->parent, &viommu_ops);
 	iommu_device_set_ops(&viommu->iommu, &viommu_ops);
 	iommu_device_set_fwnode(&viommu->iommu, parent_dev->fwnode);
 
@@ -1122,6 +1124,7 @@ static void viommu_remove(struct virtio_device *vdev)
 {
 	struct viommu_dev *viommu = vdev->priv;
 
+	virt_set_iommu_ops(vdev->dev.parent, NULL);
 	iommu_device_sysfs_remove(&viommu->iommu);
 	iommu_device_unregister(&viommu->iommu);
 
diff --git a/include/linux/virt_iommu.h b/include/linux/virt_iommu.h
new file mode 100644
index 000000000000..c68b03ec75ba
--- /dev/null
+++ b/include/linux/virt_iommu.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef VIRTIO_IOMMU_H_
+#define VIRTIO_IOMMU_H_
+
+#if IS_ENABLED(CONFIG_VIRTIO_IOMMU_TOPOLOGY)
+int virt_dma_configure(struct device *dev);
+void virt_set_iommu_ops(struct device *dev, struct iommu_ops *ops);
+#else /* !CONFIG_VIRTIO_IOMMU_TOPOLOGY */
+static inline int virt_dma_configure(struct device *dev)
+{
+	/* Don't disturb the normal DMA configuration methods */
+	return 0;
+}
+
+static inline void virt_set_iommu_ops(struct device *dev, struct iommu_ops *ops)
+{ }
+#endif /* !CONFIG_VIRTIO_IOMMU_TOPOLOGY */
+
+#endif /* VIRTIO_IOMMU_H_ */
diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
index 237e36a280cb..ec57d215086a 100644
--- a/include/uapi/linux/virtio_iommu.h
+++ b/include/uapi/linux/virtio_iommu.h
@@ -16,6 +16,7 @@
 #define VIRTIO_IOMMU_F_BYPASS			3
 #define VIRTIO_IOMMU_F_PROBE			4
 #define VIRTIO_IOMMU_F_MMIO			5
+#define VIRTIO_IOMMU_F_TOPOLOGY			6
 
 struct virtio_iommu_range_64 {
 	__le64					start;
@@ -27,6 +28,12 @@ struct virtio_iommu_range_32 {
 	__le32					end;
 };
 
+struct virtio_iommu_topo_config {
+	__le32					offset;
+	__le32					num_items;
+	__le32					item_length;
+};
+
 struct virtio_iommu_config {
 	/* Supported page sizes */
 	__le64					page_size_mask;
@@ -36,6 +43,25 @@ struct virtio_iommu_config {
 	struct virtio_iommu_range_32		domain_range;
 	/* Probe buffer size */
 	__le32					probe_size;
+	struct virtio_iommu_topo_config		topo_config;
+};
+
+#define VIRTIO_IOMMU_TOPO_PCI_RANGE		0x1
+#define VIRTIO_IOMMU_TOPO_ENDPOINT		0x2
+
+struct virtio_iommu_topo_pci_range {
+	__le16					type;
+	__le16					hierarchy;
+	__le16					requester_start;
+	__le16					requester_end;
+	__le32					endpoint_start;
+};
+
+struct virtio_iommu_topo_endpoint {
+	__le16					type;
+	__le16					reserved;
+	__le32					endpoint;
+	__le64					address;
 };
 
 /* Request types */
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
