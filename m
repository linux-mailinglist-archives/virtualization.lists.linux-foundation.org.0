Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 083751940E7
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 15:05:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A331588670;
	Thu, 26 Mar 2020 14:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZXdoX8jKeX8; Thu, 26 Mar 2020 14:05:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3416086B55;
	Thu, 26 Mar 2020 14:05:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C4A8C1831;
	Thu, 26 Mar 2020 14:05:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2620DC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 14:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 14501204E5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eXm+JvW0IPUH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 14:05:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by silver.osuosl.org (Postfix) with ESMTPS id E825C203CE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585231498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QFA7r8FB33+I4RbfA+XntC2SdWcc/VdYPsdMzQ0KG8=;
 b=Bi/ONAUkHDRDDMoHj6wIS5PlHrpcDio6r++zs6f1qx7kcznsLK7ZIiHtUbcL82rpsuIRof
 6/4x2xNo1nvDKUer2rZuDxD0EwzPTI9l1QyVwSeULaOEBj/mQGUghOAFAmBQra9UymhhBz
 qCiR5tvrInBvXDJpgns5ZWVCw/Jfez8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-19bAYoIBPziTq5073DsfAQ-1; Thu, 26 Mar 2020 10:04:56 -0400
X-MC-Unique: 19bAYoIBPziTq5073DsfAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4FD913F6;
 Thu, 26 Mar 2020 14:04:53 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-19.pek2.redhat.com [10.72.12.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E34BA60BF3;
 Thu, 26 Mar 2020 14:04:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [PATCH V9 9/9] virtio: Intel IFC VF driver for VDPA
Date: Thu, 26 Mar 2020 22:01:25 +0800
Message-Id: <20200326140125.19794-10-jasowang@redhat.com>
In-Reply-To: <20200326140125.19794-1-jasowang@redhat.com>
References: <20200326140125.19794-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: mhabets@solarflare.com, rob.miller@broadcom.com, saugatm@xilinx.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 jgg@mellanox.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, rdunlap@infradead.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

From: Zhu Lingshan <lingshan.zhu@intel.com>

This commit introduced two layers to drive IFC VF:

(1) ifcvf_base layer, which handles IFC VF NIC hardware operations and
    configurations.

(2) ifcvf_main layer, which complies to VDPA bus framework,
    implemented device operations for VDPA bus, handles device probe,
    bus attaching, vring operations, etc.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Bie Tiwei <tiwei.bie@intel.com>
Signed-off-by: Wang Xiao <xiao.w.wang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/vdpa/Kconfig            |  11 +
 drivers/virtio/vdpa/Makefile           |   1 +
 drivers/virtio/vdpa/ifcvf/Makefile     |   3 +
 drivers/virtio/vdpa/ifcvf/ifcvf_base.c | 389 ++++++++++++++++++++++
 drivers/virtio/vdpa/ifcvf/ifcvf_base.h | 118 +++++++
 drivers/virtio/vdpa/ifcvf/ifcvf_main.c | 435 +++++++++++++++++++++++++
 6 files changed, 957 insertions(+)
 create mode 100644 drivers/virtio/vdpa/ifcvf/Makefile
 create mode 100644 drivers/virtio/vdpa/ifcvf/ifcvf_base.c
 create mode 100644 drivers/virtio/vdpa/ifcvf/ifcvf_base.h
 create mode 100644 drivers/virtio/vdpa/ifcvf/ifcvf_main.c

diff --git a/drivers/virtio/vdpa/Kconfig b/drivers/virtio/vdpa/Kconfig
index ae204465964e..7db1460104b7 100644
--- a/drivers/virtio/vdpa/Kconfig
+++ b/drivers/virtio/vdpa/Kconfig
@@ -23,4 +23,15 @@ config VDPA_SIM
 	  to RX. This device is used for testing, prototyping and
 	  development of vDPA.
 
+config IFCVF
+	tristate "Intel IFC VF VDPA driver"
+	depends on PCI_MSI
+	select VDPA
+	default n
+	help
+	  This kernel module can drive Intel IFC VF NIC to offload
+	  virtio dataplane traffic to hardware.
+	  To compile this driver as a module, choose M here: the module will
+	  be called ifcvf.
+
 endif # VDPA_MENU
diff --git a/drivers/virtio/vdpa/Makefile b/drivers/virtio/vdpa/Makefile
index 3814af8e097b..8bbb686ca7a2 100644
--- a/drivers/virtio/vdpa/Makefile
+++ b/drivers/virtio/vdpa/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_VDPA) += vdpa.o
 obj-$(CONFIG_VDPA_SIM) += vdpa_sim/
+obj-$(CONFIG_IFCVF)    += ifcvf/
diff --git a/drivers/virtio/vdpa/ifcvf/Makefile b/drivers/virtio/vdpa/ifcvf/Makefile
new file mode 100644
index 000000000000..d709915995ab
--- /dev/null
+++ b/drivers/virtio/vdpa/ifcvf/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_IFCVF) += ifcvf.o
+ifcvf-$(CONFIG_IFCVF) += ifcvf_main.o ifcvf_base.o
diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_base.c b/drivers/virtio/vdpa/ifcvf/ifcvf_base.c
new file mode 100644
index 000000000000..b61b06ea26d3
--- /dev/null
+++ b/drivers/virtio/vdpa/ifcvf/ifcvf_base.c
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel IFC VF NIC driver for virtio dataplane offloading
+ *
+ * Copyright (C) 2020 Intel Corporation.
+ *
+ * Author: Zhu Lingshan <lingshan.zhu@intel.com>
+ *
+ */
+
+#include "ifcvf_base.h"
+
+static inline u8 ifc_ioread8(u8 __iomem *addr)
+{
+	return ioread8(addr);
+}
+static inline u16 ifc_ioread16 (__le16 __iomem *addr)
+{
+	return ioread16(addr);
+}
+
+static inline u32 ifc_ioread32(__le32 __iomem *addr)
+{
+	return ioread32(addr);
+}
+
+static inline void ifc_iowrite8(u8 value, u8 __iomem *addr)
+{
+	iowrite8(value, addr);
+}
+
+static inline void ifc_iowrite16(u16 value, __le16 __iomem *addr)
+{
+	iowrite16(value, addr);
+}
+
+static inline void ifc_iowrite32(u32 value, __le32 __iomem *addr)
+{
+	iowrite32(value, addr);
+}
+
+static void ifc_iowrite64_twopart(u64 val,
+				  __le32 __iomem *lo, __le32 __iomem *hi)
+{
+	ifc_iowrite32((u32)val, lo);
+	ifc_iowrite32(val >> 32, hi);
+}
+
+struct ifcvf_adapter *vf_to_adapter(struct ifcvf_hw *hw)
+{
+	return container_of(hw, struct ifcvf_adapter, vf);
+}
+
+static void __iomem *get_cap_addr(struct ifcvf_hw *hw,
+				  struct virtio_pci_cap *cap)
+{
+	struct ifcvf_adapter *ifcvf;
+	struct pci_dev *pdev;
+	u32 length, offset;
+	u8 bar;
+
+	length = le32_to_cpu(cap->length);
+	offset = le32_to_cpu(cap->offset);
+	bar = cap->bar;
+
+	ifcvf= vf_to_adapter(hw);
+	pdev = ifcvf->pdev;
+
+	if (bar >= IFCVF_PCI_MAX_RESOURCE) {
+		IFCVF_DBG(pdev,
+			  "Invalid bar number %u to get capabilities\n", bar);
+		return NULL;
+	}
+
+	if (offset + length > pci_resource_len(pdev, bar)) {
+		IFCVF_DBG(pdev,
+			  "offset(%u) + len(%u) overflows bar%u's capability\n",
+			  offset, length, bar);
+		return NULL;
+	}
+
+	return hw->base[bar] + offset;
+}
+
+static int ifcvf_read_config_range(struct pci_dev *dev,
+				   uint32_t *val, int size, int where)
+{
+	int ret, i;
+
+	for (i = 0; i < size; i += 4) {
+		ret = pci_read_config_dword(dev, where + i, val + i / 4);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+int ifcvf_init_hw(struct ifcvf_hw *hw, struct pci_dev *pdev)
+{
+	struct virtio_pci_cap cap;
+	u16 notify_off;
+	int ret;
+	u8 pos;
+	u32 i;
+
+	ret = pci_read_config_byte(pdev, PCI_CAPABILITY_LIST, &pos);
+	if (ret < 0) {
+		IFCVF_ERR(pdev, "Failed to read PCI capability list\n");
+		return -EIO;
+	}
+
+	while (pos) {
+		ret = ifcvf_read_config_range(pdev, (u32 *)&cap,
+					      sizeof(cap), pos);
+		if (ret < 0) {
+			IFCVF_ERR(pdev,
+				  "Failed to get PCI capability at %x\n", pos);
+			break;
+		}
+
+		if (cap.cap_vndr != PCI_CAP_ID_VNDR)
+			goto next;
+
+		switch (cap.cfg_type) {
+		case VIRTIO_PCI_CAP_COMMON_CFG:
+			hw->common_cfg = get_cap_addr(hw, &cap);
+			IFCVF_DBG(pdev, "hw->common_cfg = %p\n",
+				  hw->common_cfg);
+			break;
+		case VIRTIO_PCI_CAP_NOTIFY_CFG:
+			pci_read_config_dword(pdev, pos + sizeof(cap),
+					      &hw->notify_off_multiplier);
+			hw->notify_bar = cap.bar;
+			hw->notify_base = get_cap_addr(hw, &cap);
+			IFCVF_DBG(pdev, "hw->notify_base = %p\n",
+				  hw->notify_base);
+			break;
+		case VIRTIO_PCI_CAP_ISR_CFG:
+			hw->isr = get_cap_addr(hw, &cap);
+			IFCVF_DBG(pdev, "hw->isr = %p\n", hw->isr);
+			break;
+		case VIRTIO_PCI_CAP_DEVICE_CFG:
+			hw->net_cfg = get_cap_addr(hw, &cap);
+			IFCVF_DBG(pdev, "hw->net_cfg = %p\n", hw->net_cfg);
+			break;
+		}
+
+next:
+		pos = cap.cap_next;
+	}
+
+	if (hw->common_cfg == NULL || hw->notify_base == NULL ||
+	    hw->isr == NULL || hw->net_cfg == NULL) {
+		IFCVF_ERR(pdev, "Incomplete PCI capabilities\n");
+		return -EIO;
+	}
+
+	for (i = 0; i < IFCVF_MAX_QUEUE_PAIRS * 2; i++) {
+		ifc_iowrite16(i, &hw->common_cfg->queue_select);
+		notify_off = ifc_ioread16(&hw->common_cfg->queue_notify_off);
+		hw->vring[i].notify_addr = hw->notify_base +
+			notify_off * hw->notify_off_multiplier;
+	}
+
+	hw->lm_cfg = hw->base[IFCVF_LM_BAR];
+
+	IFCVF_DBG(pdev,
+		  "PCI capability mapping: common cfg: %p, notify base: %p\n, isr cfg: %p, device cfg: %p, multiplier: %u\n",
+		  hw->common_cfg, hw->notify_base, hw->isr,
+		  hw->net_cfg, hw->notify_off_multiplier);
+
+	return 0;
+}
+
+u8 ifcvf_get_status(struct ifcvf_hw *hw)
+{
+	return ifc_ioread8(&hw->common_cfg->device_status);
+}
+
+void ifcvf_set_status(struct ifcvf_hw *hw, u8 status)
+{
+	ifc_iowrite8(status, &hw->common_cfg->device_status);
+}
+
+void ifcvf_reset(struct ifcvf_hw *hw)
+{
+	ifcvf_set_status(hw, 0);
+	/* flush set_status, make sure VF is stopped, reset */
+	ifcvf_get_status(hw);
+}
+
+static void ifcvf_add_status(struct ifcvf_hw *hw, u8 status)
+{
+	if (status != 0)
+		status |= ifcvf_get_status(hw);
+
+	ifcvf_set_status(hw, status);
+	ifcvf_get_status(hw);
+}
+
+u64 ifcvf_get_features(struct ifcvf_hw *hw)
+{
+	struct virtio_pci_common_cfg __iomem *cfg = hw->common_cfg;
+	u32 features_lo, features_hi;
+
+	ifc_iowrite32(0, &cfg->device_feature_select);
+	features_lo = ifc_ioread32(&cfg->device_feature);
+
+	ifc_iowrite32(1, &cfg->device_feature_select);
+	features_hi = ifc_ioread32(&cfg->device_feature);
+
+	return ((u64)features_hi << 32) | features_lo;
+}
+
+void ifcvf_read_net_config(struct ifcvf_hw *hw, u64 offset,
+			   void *dst, int length)
+{
+	u8 old_gen, new_gen, *p;
+	int i;
+
+	WARN_ON(offset + length > sizeof(struct virtio_net_config));
+	do {
+		old_gen = ifc_ioread8(&hw->common_cfg->config_generation);
+		p = dst;
+		for (i = 0; i < length; i++)
+			*p++ = ifc_ioread8(hw->net_cfg + offset + i);
+
+		new_gen = ifc_ioread8(&hw->common_cfg->config_generation);
+	} while (old_gen != new_gen);
+}
+
+void ifcvf_write_net_config(struct ifcvf_hw *hw, u64 offset,
+			    const void *src, int length)
+{
+	const u8 *p;
+	int i;
+
+	p = src;
+	WARN_ON(offset + length > sizeof(struct virtio_net_config));
+	for (i = 0; i < length; i++)
+		ifc_iowrite8(*p++, hw->net_cfg + offset + i);
+}
+
+static void ifcvf_set_features(struct ifcvf_hw *hw, u64 features)
+{
+	struct virtio_pci_common_cfg __iomem *cfg = hw->common_cfg;
+
+	ifc_iowrite32(0, &cfg->guest_feature_select);
+	ifc_iowrite32((u32)features, &cfg->guest_feature);
+
+	ifc_iowrite32(1, &cfg->guest_feature_select);
+	ifc_iowrite32(features >> 32, &cfg->guest_feature);
+}
+
+static int ifcvf_config_features(struct ifcvf_hw *hw)
+{
+	struct ifcvf_adapter *ifcvf;
+
+	ifcvf = vf_to_adapter(hw);
+	ifcvf_set_features(hw, hw->req_features);
+	ifcvf_add_status(hw, VIRTIO_CONFIG_S_FEATURES_OK);
+
+	if (!(ifcvf_get_status(hw) & VIRTIO_CONFIG_S_FEATURES_OK)) {
+		IFCVF_ERR(ifcvf->pdev, "Failed to set FEATURES_OK status\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+u64 ifcvf_get_vq_state(struct ifcvf_hw *hw, u16 qid)
+{
+	struct ifcvf_lm_cfg __iomem *ifcvf_lm;
+	void __iomem *avail_idx_addr;
+	u16 last_avail_idx;
+	u32 q_pair_id;
+
+	ifcvf_lm = (struct ifcvf_lm_cfg __iomem *)hw->lm_cfg;
+	q_pair_id = qid / (IFCVF_MAX_QUEUE_PAIRS * 2);
+	avail_idx_addr = &ifcvf_lm->vring_lm_cfg[q_pair_id].idx_addr[qid % 2];
+	last_avail_idx = ifc_ioread16(avail_idx_addr);
+
+	return last_avail_idx;
+}
+
+int ifcvf_set_vq_state(struct ifcvf_hw *hw, u16 qid, u64 num)
+{
+	struct ifcvf_lm_cfg __iomem *ifcvf_lm;
+	void __iomem *avail_idx_addr;
+	u32 q_pair_id;
+
+	ifcvf_lm = (struct ifcvf_lm_cfg __iomem *)hw->lm_cfg;
+	q_pair_id = qid / (IFCVF_MAX_QUEUE_PAIRS * 2);
+	avail_idx_addr = &ifcvf_lm->vring_lm_cfg[q_pair_id].idx_addr[qid % 2];
+	hw->vring[qid].last_avail_idx = num;
+	ifc_iowrite16(num, avail_idx_addr);
+
+	return 0;
+}
+
+static int ifcvf_hw_enable(struct ifcvf_hw *hw)
+{
+	struct ifcvf_lm_cfg __iomem *ifcvf_lm;
+	struct virtio_pci_common_cfg __iomem *cfg;
+	struct ifcvf_adapter *ifcvf;
+	u32 i;
+
+	ifcvf_lm = (struct ifcvf_lm_cfg __iomem *)hw->lm_cfg;
+	ifcvf = vf_to_adapter(hw);
+	cfg = hw->common_cfg;
+	ifc_iowrite16(IFCVF_MSI_CONFIG_OFF, &cfg->msix_config);
+
+	if (ifc_ioread16(&cfg->msix_config) == VIRTIO_MSI_NO_VECTOR) {
+		IFCVF_ERR(ifcvf->pdev, "No msix vector for device config\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < hw->nr_vring; i++) {
+		if (!hw->vring[i].ready)
+			break;
+
+		ifc_iowrite16(i, &cfg->queue_select);
+		ifc_iowrite64_twopart(hw->vring[i].desc, &cfg->queue_desc_lo,
+				     &cfg->queue_desc_hi);
+		ifc_iowrite64_twopart(hw->vring[i].avail, &cfg->queue_avail_lo,
+				      &cfg->queue_avail_hi);
+		ifc_iowrite64_twopart(hw->vring[i].used, &cfg->queue_used_lo,
+				     &cfg->queue_used_hi);
+		ifc_iowrite16(hw->vring[i].size, &cfg->queue_size);
+		ifc_iowrite16(i + IFCVF_MSI_QUEUE_OFF, &cfg->queue_msix_vector);
+
+		if (ifc_ioread16(&cfg->queue_msix_vector) ==
+		    VIRTIO_MSI_NO_VECTOR) {
+			IFCVF_ERR(ifcvf->pdev,
+				  "No msix vector for queue %u\n", i);
+			return -EINVAL;
+		}
+
+		ifcvf_set_vq_state(hw, i, hw->vring[i].last_avail_idx);
+		ifc_iowrite16(1, &cfg->queue_enable);
+	}
+
+	return 0;
+}
+
+static void ifcvf_hw_disable(struct ifcvf_hw *hw)
+{
+	struct virtio_pci_common_cfg __iomem *cfg;
+	u32 i;
+
+	cfg = hw->common_cfg;
+	ifc_iowrite16(VIRTIO_MSI_NO_VECTOR, &cfg->msix_config);
+
+	for (i = 0; i < hw->nr_vring; i++) {
+		ifc_iowrite16(i, &cfg->queue_select);
+		ifc_iowrite16(VIRTIO_MSI_NO_VECTOR, &cfg->queue_msix_vector);
+	}
+
+	ifc_ioread16(&cfg->queue_msix_vector);
+}
+
+int ifcvf_start_hw(struct ifcvf_hw *hw)
+{
+	ifcvf_reset(hw);
+	ifcvf_add_status(hw, VIRTIO_CONFIG_S_ACKNOWLEDGE);
+	ifcvf_add_status(hw, VIRTIO_CONFIG_S_DRIVER);
+
+	if (ifcvf_config_features(hw) < 0)
+		return -EINVAL;
+
+	if (ifcvf_hw_enable(hw) < 0)
+		return -EINVAL;
+
+	ifcvf_add_status(hw, VIRTIO_CONFIG_S_DRIVER_OK);
+
+	return 0;
+}
+
+void ifcvf_stop_hw(struct ifcvf_hw *hw)
+{
+	ifcvf_hw_disable(hw);
+	ifcvf_reset(hw);
+}
+
+void ifcvf_notify_queue(struct ifcvf_hw *hw, u16 qid)
+{
+	ifc_iowrite16(qid, hw->vring[qid].notify_addr);
+}
diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_base.h b/drivers/virtio/vdpa/ifcvf/ifcvf_base.h
new file mode 100644
index 000000000000..e80307092351
--- /dev/null
+++ b/drivers/virtio/vdpa/ifcvf/ifcvf_base.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel IFC VF NIC driver for virtio dataplane offloading
+ *
+ * Copyright (C) 2020 Intel Corporation.
+ *
+ * Author: Zhu Lingshan <lingshan.zhu@intel.com>
+ *
+ */
+
+#ifndef _IFCVF_H_
+#define _IFCVF_H_
+
+#include <linux/pci.h>
+#include <linux/pci_regs.h>
+#include <linux/vdpa.h>
+#include <uapi/linux/virtio_net.h>
+#include <uapi/linux/virtio_config.h>
+#include <uapi/linux/virtio_pci.h>
+
+#define IFCVF_VENDOR_ID		0x1AF4
+#define IFCVF_DEVICE_ID		0x1041
+#define IFCVF_SUBSYS_VENDOR_ID	0x8086
+#define IFCVF_SUBSYS_DEVICE_ID	0x001A
+
+#define IFCVF_SUPPORTED_FEATURES \
+		((1ULL << VIRTIO_NET_F_MAC)			| \
+		 (1ULL << VIRTIO_F_ANY_LAYOUT)			| \
+		 (1ULL << VIRTIO_F_VERSION_1)			| \
+		 (1ULL << VIRTIO_F_ORDER_PLATFORM)		| \
+		 (1ULL << VIRTIO_F_IOMMU_PLATFORM)		| \
+		 (1ULL << VIRTIO_NET_F_MRG_RXBUF))
+
+/* Only one queue pair for now. */
+#define IFCVF_MAX_QUEUE_PAIRS	1
+
+#define IFCVF_QUEUE_ALIGNMENT	PAGE_SIZE
+#define IFCVF_QUEUE_MAX		32768
+#define IFCVF_MSI_CONFIG_OFF	0
+#define IFCVF_MSI_QUEUE_OFF	1
+#define IFCVF_PCI_MAX_RESOURCE	6
+
+#define IFCVF_LM_CFG_SIZE		0x40
+#define IFCVF_LM_RING_STATE_OFFSET	0x20
+#define IFCVF_LM_BAR			4
+
+#define IFCVF_ERR(pdev, fmt, ...)	dev_err(&pdev->dev, fmt, ##__VA_ARGS__)
+#define IFCVF_DBG(pdev, fmt, ...)	dev_dbg(&pdev->dev, fmt, ##__VA_ARGS__)
+#define IFCVF_INFO(pdev, fmt, ...)	dev_info(&pdev->dev, fmt, ##__VA_ARGS__)
+
+#define ifcvf_private_to_vf(adapter) \
+	(&((struct ifcvf_adapter *)adapter)->vf)
+
+#define IFCVF_MAX_INTR (IFCVF_MAX_QUEUE_PAIRS * 2 + 1)
+
+struct vring_info {
+	u64 desc;
+	u64 avail;
+	u64 used;
+	u16 size;
+	u16 last_avail_idx;
+	bool ready;
+	void __iomem *notify_addr;
+	u32 irq;
+	struct vdpa_callback cb;
+	char msix_name[256];
+};
+
+struct ifcvf_hw {
+	u8 __iomem *isr;
+	/* Live migration */
+	u8 __iomem *lm_cfg;
+	u16 nr_vring;
+	/* Notification bar number */
+	u8 notify_bar;
+	/* Notificaiton bar address */
+	void __iomem *notify_base;
+	u32 notify_off_multiplier;
+	u64 req_features;
+	struct virtio_pci_common_cfg __iomem *common_cfg;
+	void __iomem *net_cfg;
+	struct vring_info vring[IFCVF_MAX_QUEUE_PAIRS * 2];
+	void __iomem * const *base;
+};
+
+struct ifcvf_adapter {
+	struct vdpa_device vdpa;
+	struct pci_dev *pdev;
+	struct ifcvf_hw vf;
+};
+
+struct ifcvf_vring_lm_cfg {
+	u32 idx_addr[2];
+	u8 reserved[IFCVF_LM_CFG_SIZE - 8];
+};
+
+struct ifcvf_lm_cfg {
+	u8 reserved[IFCVF_LM_RING_STATE_OFFSET];
+	struct ifcvf_vring_lm_cfg vring_lm_cfg[IFCVF_MAX_QUEUE_PAIRS];
+};
+
+int ifcvf_init_hw(struct ifcvf_hw *hw, struct pci_dev *dev);
+int ifcvf_start_hw(struct ifcvf_hw *hw);
+void ifcvf_stop_hw(struct ifcvf_hw *hw);
+void ifcvf_notify_queue(struct ifcvf_hw *hw, u16 qid);
+void ifcvf_read_net_config(struct ifcvf_hw *hw, u64 offset,
+			   void *dst, int length);
+void ifcvf_write_net_config(struct ifcvf_hw *hw, u64 offset,
+			    const void *src, int length);
+u8 ifcvf_get_status(struct ifcvf_hw *hw);
+void ifcvf_set_status(struct ifcvf_hw *hw, u8 status);
+void io_write64_twopart(u64 val, u32 *lo, u32 *hi);
+void ifcvf_reset(struct ifcvf_hw *hw);
+u64 ifcvf_get_features(struct ifcvf_hw *hw);
+u64 ifcvf_get_vq_state(struct ifcvf_hw *hw, u16 qid);
+int ifcvf_set_vq_state(struct ifcvf_hw *hw, u16 qid, u64 num);
+struct ifcvf_adapter *vf_to_adapter(struct ifcvf_hw *hw);
+#endif /* _IFCVF_H_ */
diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_main.c b/drivers/virtio/vdpa/ifcvf/ifcvf_main.c
new file mode 100644
index 000000000000..8d54dc5b08d2
--- /dev/null
+++ b/drivers/virtio/vdpa/ifcvf/ifcvf_main.c
@@ -0,0 +1,435 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel IFC VF NIC driver for virtio dataplane offloading
+ *
+ * Copyright (C) 2020 Intel Corporation.
+ *
+ * Author: Zhu Lingshan <lingshan.zhu@intel.com>
+ *
+ */
+
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sysfs.h>
+#include "ifcvf_base.h"
+
+#define VERSION_STRING  "0.1"
+#define DRIVER_AUTHOR   "Intel Corporation"
+#define IFCVF_DRIVER_NAME       "ifcvf"
+
+static irqreturn_t ifcvf_intr_handler(int irq, void *arg)
+{
+	struct vring_info *vring = arg;
+
+	if (vring->cb.callback)
+		return vring->cb.callback(vring->cb.private);
+
+	return IRQ_HANDLED;
+}
+
+static int ifcvf_start_datapath(void *private)
+{
+	struct ifcvf_hw *vf = ifcvf_private_to_vf(private);
+	struct ifcvf_adapter *ifcvf;
+	u8 status;
+	int ret;
+
+	ifcvf = vf_to_adapter(vf);
+	vf->nr_vring = IFCVF_MAX_QUEUE_PAIRS * 2;
+	ret = ifcvf_start_hw(vf);
+	if (ret < 0) {
+		status = ifcvf_get_status(vf);
+		status |= VIRTIO_CONFIG_S_FAILED;
+		ifcvf_set_status(vf, status);
+	}
+
+	return ret;
+}
+
+static int ifcvf_stop_datapath(void *private)
+{
+	struct ifcvf_hw *vf = ifcvf_private_to_vf(private);
+	int i;
+
+	for (i = 0; i < IFCVF_MAX_QUEUE_PAIRS * 2; i++)
+		vf->vring[i].cb.callback = NULL;
+
+	ifcvf_stop_hw(vf);
+
+	return 0;
+}
+
+static void ifcvf_reset_vring(struct ifcvf_adapter *adapter)
+{
+	struct ifcvf_hw *vf = ifcvf_private_to_vf(adapter);
+	int i;
+
+	for (i = 0; i < IFCVF_MAX_QUEUE_PAIRS * 2; i++) {
+		vf->vring[i].last_avail_idx = 0;
+		vf->vring[i].desc = 0;
+		vf->vring[i].avail = 0;
+		vf->vring[i].used = 0;
+		vf->vring[i].ready = 0;
+		vf->vring[i].cb.callback = NULL;
+		vf->vring[i].cb.private = NULL;
+	}
+
+	ifcvf_reset(vf);
+}
+
+static struct ifcvf_adapter *vdpa_to_adapter(struct vdpa_device *vdpa_dev)
+{
+	return container_of(vdpa_dev, struct ifcvf_adapter, vdpa);
+}
+
+static struct ifcvf_hw *vdpa_to_vf(struct vdpa_device *vdpa_dev)
+{
+	struct ifcvf_adapter *adapter = vdpa_to_adapter(vdpa_dev);
+
+	return &adapter->vf;
+}
+
+static u64 ifcvf_vdpa_get_features(struct vdpa_device *vdpa_dev)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+	u64 features;
+
+	features = ifcvf_get_features(vf) & IFCVF_SUPPORTED_FEATURES;
+
+	return features;
+}
+
+static int ifcvf_vdpa_set_features(struct vdpa_device *vdpa_dev, u64 features)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	vf->req_features = features;
+
+	return 0;
+}
+
+static u8 ifcvf_vdpa_get_status(struct vdpa_device *vdpa_dev)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	return ifcvf_get_status(vf);
+}
+
+static void ifcvf_vdpa_set_status(struct vdpa_device *vdpa_dev, u8 status)
+{
+	struct ifcvf_adapter *adapter;
+	struct ifcvf_hw *vf;
+
+	vf  = vdpa_to_vf(vdpa_dev);
+	adapter = dev_get_drvdata(vdpa_dev->dev.parent);
+
+	if (status == 0) {
+		ifcvf_stop_datapath(adapter);
+		ifcvf_reset_vring(adapter);
+		return;
+	}
+
+	if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
+		if (ifcvf_start_datapath(adapter) < 0)
+			IFCVF_ERR(adapter->pdev,
+				  "Failed to set ifcvf vdpa  status %u\n",
+				  status);
+	}
+
+	ifcvf_set_status(vf, status);
+}
+
+static u16 ifcvf_vdpa_get_vq_num_max(struct vdpa_device *vdpa_dev)
+{
+	return IFCVF_QUEUE_MAX;
+}
+
+static u64 ifcvf_vdpa_get_vq_state(struct vdpa_device *vdpa_dev, u16 qid)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	return ifcvf_get_vq_state(vf, qid);
+}
+
+static int ifcvf_vdpa_set_vq_state(struct vdpa_device *vdpa_dev, u16 qid,
+				   u64 num)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	return ifcvf_set_vq_state(vf, qid, num);
+}
+
+static void ifcvf_vdpa_set_vq_cb(struct vdpa_device *vdpa_dev, u16 qid,
+				 struct vdpa_callback *cb)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	vf->vring[qid].cb = *cb;
+}
+
+static void ifcvf_vdpa_set_vq_ready(struct vdpa_device *vdpa_dev,
+				    u16 qid, bool ready)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	vf->vring[qid].ready = ready;
+}
+
+static bool ifcvf_vdpa_get_vq_ready(struct vdpa_device *vdpa_dev, u16 qid)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	return vf->vring[qid].ready;
+}
+
+static void ifcvf_vdpa_set_vq_num(struct vdpa_device *vdpa_dev, u16 qid,
+				  u32 num)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	vf->vring[qid].size = num;
+}
+
+static int ifcvf_vdpa_set_vq_address(struct vdpa_device *vdpa_dev, u16 qid,
+				     u64 desc_area, u64 driver_area,
+				     u64 device_area)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	vf->vring[qid].desc = desc_area;
+	vf->vring[qid].avail = driver_area;
+	vf->vring[qid].used = device_area;
+
+	return 0;
+}
+
+static void ifcvf_vdpa_kick_vq(struct vdpa_device *vdpa_dev, u16 qid)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	ifcvf_notify_queue(vf, qid);
+}
+
+static u32 ifcvf_vdpa_get_generation(struct vdpa_device *vdpa_dev)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	return ioread8(&vf->common_cfg->config_generation);
+}
+
+static u32 ifcvf_vdpa_get_device_id(struct vdpa_device *vdpa_dev)
+{
+	return VIRTIO_ID_NET;
+}
+
+static u32 ifcvf_vdpa_get_vendor_id(struct vdpa_device *vdpa_dev)
+{
+	return IFCVF_SUBSYS_VENDOR_ID;
+}
+
+static u16 ifcvf_vdpa_get_vq_align(struct vdpa_device *vdpa_dev)
+{
+	return IFCVF_QUEUE_ALIGNMENT;
+}
+
+static void ifcvf_vdpa_get_config(struct vdpa_device *vdpa_dev,
+				  unsigned int offset,
+				  void *buf, unsigned int len)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	WARN_ON(offset + len > sizeof(struct virtio_net_config));
+	ifcvf_read_net_config(vf, offset, buf, len);
+}
+
+static void ifcvf_vdpa_set_config(struct vdpa_device *vdpa_dev,
+				  unsigned int offset, const void *buf,
+				  unsigned int len)
+{
+	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
+
+	WARN_ON(offset + len > sizeof(struct virtio_net_config));
+	ifcvf_write_net_config(vf, offset, buf, len);
+}
+
+static void ifcvf_vdpa_set_config_cb(struct vdpa_device *vdpa_dev,
+				     struct vdpa_callback *cb)
+{
+	/* We don't support config interrupt */
+}
+
+/*
+ * IFCVF currently does't have on-chip IOMMU, so not
+ * implemented set_map()/dma_map()/dma_unmap()
+ */
+static const struct vdpa_config_ops ifc_vdpa_ops = {
+	.get_features	= ifcvf_vdpa_get_features,
+	.set_features	= ifcvf_vdpa_set_features,
+	.get_status	= ifcvf_vdpa_get_status,
+	.set_status	= ifcvf_vdpa_set_status,
+	.get_vq_num_max	= ifcvf_vdpa_get_vq_num_max,
+	.get_vq_state	= ifcvf_vdpa_get_vq_state,
+	.set_vq_state	= ifcvf_vdpa_set_vq_state,
+	.set_vq_cb	= ifcvf_vdpa_set_vq_cb,
+	.set_vq_ready	= ifcvf_vdpa_set_vq_ready,
+	.get_vq_ready	= ifcvf_vdpa_get_vq_ready,
+	.set_vq_num	= ifcvf_vdpa_set_vq_num,
+	.set_vq_address	= ifcvf_vdpa_set_vq_address,
+	.kick_vq	= ifcvf_vdpa_kick_vq,
+	.get_generation	= ifcvf_vdpa_get_generation,
+	.get_device_id	= ifcvf_vdpa_get_device_id,
+	.get_vendor_id	= ifcvf_vdpa_get_vendor_id,
+	.get_vq_align	= ifcvf_vdpa_get_vq_align,
+	.get_config	= ifcvf_vdpa_get_config,
+	.set_config	= ifcvf_vdpa_set_config,
+	.set_config_cb  = ifcvf_vdpa_set_config_cb,
+};
+
+static int ifcvf_request_irq(struct ifcvf_adapter *adapter)
+{
+	struct pci_dev *pdev = adapter->pdev;
+	struct ifcvf_hw *vf = &adapter->vf;
+	int vector, i, ret, irq;
+
+
+	for (i = 0; i < IFCVF_MAX_QUEUE_PAIRS * 2; i++) {
+		snprintf(vf->vring[i].msix_name, 256, "ifcvf[%s]-%d\n",
+			 pci_name(pdev), i);
+		vector = i + IFCVF_MSI_QUEUE_OFF;
+		irq = pci_irq_vector(pdev, vector);
+		ret = devm_request_irq(&pdev->dev, irq,
+				       ifcvf_intr_handler, 0,
+				       vf->vring[i].msix_name,
+				       &vf->vring[i]);
+		if (ret) {
+			IFCVF_ERR(pdev,
+				  "Failed to request irq for vq %d\n", i);
+			return ret;
+		}
+		vf->vring[i].irq = irq;
+	}
+
+	return 0;
+}
+
+static void ifcvf_free_irq_vectors(void *data)
+{
+	pci_free_irq_vectors(data);
+}
+
+static int ifcvf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct ifcvf_adapter *adapter;
+	struct ifcvf_hw *vf;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		IFCVF_ERR(pdev, "Failed to enable device\n");
+		return ret;
+	}
+
+	ret = pcim_iomap_regions(pdev, BIT(0) | BIT(2) | BIT(4),
+				 IFCVF_DRIVER_NAME);
+	if (ret) {
+		IFCVF_ERR(pdev, "Failed to request MMIO region\n");
+		return ret;
+	}
+
+	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
+	if (ret) {
+		IFCVF_ERR(pdev, "No usable DMA confiugration\n");
+		return ret;
+	}
+
+	ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
+	if (ret) {
+		IFCVF_ERR(pdev,
+			  "No usable coherent DMA confiugration\n");
+		return ret;
+	}
+
+	ret = pci_alloc_irq_vectors(pdev, IFCVF_MAX_INTR,
+				    IFCVF_MAX_INTR, PCI_IRQ_MSIX);
+	if (ret < 0) {
+		IFCVF_ERR(pdev, "Failed to alloc irq vectors\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, ifcvf_free_irq_vectors, pdev);
+	if (ret) {
+		IFCVF_ERR(pdev,
+			  "Failed for adding devres for freeing irq vectors\n");
+		return ret;
+	}
+
+	adapter = vdpa_alloc_device(struct ifcvf_adapter, vdpa,
+				    dev, &ifc_vdpa_ops);
+	if (adapter == NULL) {
+		IFCVF_ERR(pdev, "Failed to allocate vDPA structure");
+		return -ENOMEM;
+	}
+
+	pci_set_master(pdev);
+	pci_set_drvdata(pdev, adapter);
+
+	vf = &adapter->vf;
+	vf->base = pcim_iomap_table(pdev);
+
+	adapter->pdev = pdev;
+	adapter->vdpa.dma_dev = &pdev->dev;
+
+	ret = ifcvf_request_irq(adapter);
+	if (ret) {
+		IFCVF_ERR(pdev, "Failed to request MSI-X irq\n");
+		goto err;
+	}
+
+	ret = ifcvf_init_hw(vf, pdev);
+	if (ret) {
+		IFCVF_ERR(pdev, "Failed to init IFCVF hw\n");
+		goto err;
+	}
+
+	ret = vdpa_register_device(&adapter->vdpa);
+	if (ret) {
+		IFCVF_ERR(pdev, "Failed to register ifcvf to vdpa bus");
+		goto err;
+	}
+
+	return 0;
+
+err:
+	put_device(&adapter->vdpa.dev);
+	return ret;
+}
+
+static void ifcvf_remove(struct pci_dev *pdev)
+{
+	struct ifcvf_adapter *adapter = pci_get_drvdata(pdev);
+
+	vdpa_unregister_device(&adapter->vdpa);
+}
+
+static struct pci_device_id ifcvf_pci_ids[] = {
+	{ PCI_DEVICE_SUB(IFCVF_VENDOR_ID,
+		IFCVF_DEVICE_ID,
+		IFCVF_SUBSYS_VENDOR_ID,
+		IFCVF_SUBSYS_DEVICE_ID) },
+	{ 0 },
+};
+MODULE_DEVICE_TABLE(pci, ifcvf_pci_ids);
+
+static struct pci_driver ifcvf_driver = {
+	.name     = IFCVF_DRIVER_NAME,
+	.id_table = ifcvf_pci_ids,
+	.probe    = ifcvf_probe,
+	.remove   = ifcvf_remove,
+};
+
+module_pci_driver(ifcvf_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_VERSION(VERSION_STRING);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
