Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 025596E2382
	for <lists.virtualization@lfdr.de>; Fri, 14 Apr 2023 14:39:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93D9642B1D;
	Fri, 14 Apr 2023 12:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93D9642B1D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igel-co-jp.20221208.gappssmtp.com header.i=@igel-co-jp.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=EPdWogGf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzV1SOhrlNdu; Fri, 14 Apr 2023 12:39:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 912FD42B11;
	Fri, 14 Apr 2023 12:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 912FD42B11
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA323C0089;
	Fri, 14 Apr 2023 12:39:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BF67C002A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Apr 2023 12:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B066FF0D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Apr 2023 12:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B066FF0D
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igel-co-jp.20221208.gappssmtp.com
 header.i=@igel-co-jp.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=EPdWogGf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CC-KfoVNnFa
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Apr 2023 12:39:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F7416FF0C
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F7416FF0C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Apr 2023 12:39:18 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 hg14-20020a17090b300e00b002471efa7a8fso4796412pjb.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Apr 2023 05:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20221208.gappssmtp.com; s=20221208; t=1681475957; x=1684067957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3NQNzImpl7v9ZsQ1lWCxb6S+hYC5oLdUBv6JvMjGuE=;
 b=EPdWogGf/Az3KsP0yPBGLfyncklpreuAVN4wgKKeyX9jVIyz49Saw3GnDSFwulOlYF
 pDwEqN0crmcrN2w17a66pt0HZ9SxY7XGBb5nG9hpCr03S+KfMMhUiRVCAEluya6YmUui
 E/irnFcAfpnutuJSbx1WuQJpcXvOmEBMCtQv38Yfq7YDyI9DU/VQhLJD3vCrIe/optbN
 k6K34FNgbqJTAHwggn15OLh+2nWXythhirkaq7DR0QvLbJHt+V4SdPPmzJHJ7SkSDJN8
 VnU8+NCvdbq0lePOkIxkH6LFI+QC3OyPYZe4X3TqWEVdZhttBSZdd157RddQpGk7U/0q
 0ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681475957; x=1684067957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3NQNzImpl7v9ZsQ1lWCxb6S+hYC5oLdUBv6JvMjGuE=;
 b=SngaBt/++EmnHXqfifJNc3ITBtixQz9YdSw6SkjyALwbaVixB5bL4IQ/lIuEPUWowj
 RCNfoV2O8pixQitkCu1fDECBuVQw0LY6A4F+OHPgRfJNyZ5FiD4jWo08hiCwHPpw7iPB
 6aSBs2JOFhVYKPazW9/vcAvEzELK4INQkTEARyQ6+Rov2MmhoNm0evJHzuPLhuQS66sT
 VVlcJLO8INS2h4lFUZC4CmGINbm2UTpTmwJHvrkGyq5kJhK29sawKT2+F8ebX3TO8dgY
 yrpzwFqoOT9yH0vaVhiRmEQwKEUKR2Ss0orINzuK7QSOrj7s0Di8ZFX+KWaFxzBB3FCB
 1idQ==
X-Gm-Message-State: AAQBX9f/J2tdh9bZuoUCw/iZ6uEOz/XpeHtqVeAXXs3U8FGRpzwcIh8P
 VeDI4LbD2JscM5W95KLTGN2mGA==
X-Google-Smtp-Source: AKy350ZowWWUvq7RUMpkAPX+2sPQlC9MpUlP6TgrvPjutz5vDLhMZoKq8l+apqjdfQkRnQe5cfXSxA==
X-Received: by 2002:a17:902:db10:b0:1a6:494c:f723 with SMTP id
 m16-20020a170902db1000b001a6494cf723mr2905237plx.54.1681475957271; 
 Fri, 14 Apr 2023 05:39:17 -0700 (PDT)
Received: from tyrell.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a1709028d9500b001a527761c31sm3015366plo.79.2023.04.14.05.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 05:39:16 -0700 (PDT)
From: Shunsuke Mie <mie@igel.co.jp>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [RFC PATCH 1/3] PCI: endpoint: introduce a helper to implement pci ep
 virtio function
Date: Fri, 14 Apr 2023 21:39:01 +0900
Message-Id: <20230414123903.896914-2-mie@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230414123903.896914-1-mie@igel.co.jp>
References: <20230414123903.896914-1-mie@igel.co.jp>
MIME-Version: 1.0
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Randy Dunlap <rdunlap@infradead.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ren Zhijie <renzhijie2@huawei.com>,
 Shunsuke Mie <mie@igel.co.jp>, Jon Mason <jdmason@kudzu.us>,
 Bjorn Helgaas <bhelgaas@google.com>
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

The Linux PCIe Endpoint framework supports to implement PCIe endpoint
functions using a PCIe controller operating in endpoint mode.
It is possble to realize the behavior of PCIe device, such as virtio PCI
device. This patch introduces a setof helper functions and data structures
to implement a PCIe endpoint function that behaves as a virtio device.

Those functions enable the implementation PCIe endpoint function that
comply with the virtio lecacy specification. Because modern virtio
specifications require devices to implement custom PCIe capabilities, which
are not currently supported by either PCIe controllers/drivers or the PCIe
endpoint framework.

The helper functions work with the new struct epf_virtio, which is
initialized and finalized using the following functions:

- int epf_virtio_init();
- void epf_virtio_final()

Once initialized, the PCIe configuration space can be read and written
using the following functions:

- epf_virtio_cfg_{read,write}#size()
- epf_virtio_cfg_{set,clear}#size()
- epf_virtio_cfg_memcpy_toio()

The size is supported 8, 16 and 32bits. The content of configuration space
varies depending on the type of virtio device.

After the setup, launch the kernel thread for negotiation with host virtio
drivers and detection virtqueue notifications with the function:

- epf_virtio_launch_bgtask()

Also there are functions to shutdown and reset the kthread.

- epf_virtio_terminate_bgtask()
- epf_virtio_terminate_reset()

Data transfer function is also provide.

- epf_virtio_vrh_memcpy()

This function copy data indicated descriptor of PCIe host and endpoint
virtqueue to each other. The virtqueue manage as vringh and copy direction
is specified by enum epf_virtio_copy_dir, which is defined as
follows:
This function copies data between the PCIe host and endpoint virtqueues.
The each virtqueues are managed using vringh, and the copy direction is
specified by an enum called epf_virtio_copy_dir, which is defined as
follows:

enum epf_virtio_copy_dir {
	   EPF_VIRTIO_COPY_DIR_FROM_DEV,
	   EPF_VIRTIO_COPY_DIR_TO_DEV,
};

While this patch provides functions for negotiating with host drivers and
copying data, each PCIe function driver must impl ement operations that
depend on each specific device, such as network, block, etc.

Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
---
 drivers/pci/endpoint/functions/Kconfig        |   7 +
 drivers/pci/endpoint/functions/Makefile       |   1 +
 .../pci/endpoint/functions/pci-epf-virtio.c   | 469 ++++++++++++++++++
 .../pci/endpoint/functions/pci-epf-virtio.h   | 123 +++++
 4 files changed, 600 insertions(+)
 create mode 100644 drivers/pci/endpoint/functions/pci-epf-virtio.c
 create mode 100644 drivers/pci/endpoint/functions/pci-epf-virtio.h

diff --git a/drivers/pci/endpoint/functions/Kconfig b/drivers/pci/endpoint/functions/Kconfig
index 9fd560886871..cf16d33c9585 100644
--- a/drivers/pci/endpoint/functions/Kconfig
+++ b/drivers/pci/endpoint/functions/Kconfig
@@ -37,3 +37,10 @@ config PCI_EPF_VNTB
 	  between PCI Root Port and PCIe Endpoint.
 
 	  If in doubt, say "N" to disable Endpoint NTB driver.
+
+config PCI_EPF_VIRTIO
+	tristate
+	depends on PCI_ENDPOINT
+	select VHOST_IOMEM
+	help
+	  Helpers to implement PCI virtio Endpoint function
diff --git a/drivers/pci/endpoint/functions/Makefile b/drivers/pci/endpoint/functions/Makefile
index 5c13001deaba..a96f127ce900 100644
--- a/drivers/pci/endpoint/functions/Makefile
+++ b/drivers/pci/endpoint/functions/Makefile
@@ -6,3 +6,4 @@
 obj-$(CONFIG_PCI_EPF_TEST)		+= pci-epf-test.o
 obj-$(CONFIG_PCI_EPF_NTB)		+= pci-epf-ntb.o
 obj-$(CONFIG_PCI_EPF_VNTB) 		+= pci-epf-vntb.o
+obj-$(CONFIG_PCI_EPF_VIRTIO)		+= pci-epf-virtio.o
diff --git a/drivers/pci/endpoint/functions/pci-epf-virtio.c b/drivers/pci/endpoint/functions/pci-epf-virtio.c
new file mode 100644
index 000000000000..bb3de01563de
--- /dev/null
+++ b/drivers/pci/endpoint/functions/pci-epf-virtio.c
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Helpers to implement PCIe virtio EP function.
+ */
+#include <linux/virtio_pci.h>
+#include <linux/virtio_config.h>
+#include <linux/kthread.h>
+
+#include "pci-epf-virtio.h"
+
+static void epf_virtio_unmap_vq(struct pci_epf *epf, void __iomem *vq_virt,
+				phys_addr_t vq_phys, unsigned int num)
+{
+	size_t vq_size = vring_size(num, VIRTIO_PCI_VRING_ALIGN);
+
+	pci_epc_unmap_addr(epf->epc, epf->func_no, epf->vfunc_no, vq_phys,
+			   vq_virt, vq_size);
+	pci_epc_mem_free_addr(epf->epc, vq_phys, vq_virt, vq_size);
+}
+
+static void __iomem *epf_virtio_map_vq(struct pci_epf *epf,
+				       phys_addr_t vq_pci_addr,
+				       unsigned int num, phys_addr_t *vq_phys)
+{
+	int err;
+	size_t vq_size;
+	void __iomem *vq_virt;
+
+	vq_size = vring_size(num, VIRTIO_PCI_VRING_ALIGN);
+
+	vq_virt = pci_epc_map_addr(epf->epc, epf->func_no, epf->vfunc_no,
+				   vq_pci_addr, vq_phys, vq_size);
+	if (IS_ERR(vq_virt)) {
+		pr_err("Failed to map virtuqueue to local");
+		goto err_free;
+	}
+
+	return vq_virt;
+
+err_free:
+	pci_epc_mem_free_addr(epf->epc, *vq_phys, vq_virt, vq_size);
+
+	return ERR_PTR(err);
+}
+
+static void epf_virtio_free_vringh(struct pci_epf *epf, struct epf_vringh *evrh)
+{
+	epf_virtio_unmap_vq(epf, evrh->virt, evrh->phys, evrh->num);
+	kfree(evrh);
+}
+
+static struct epf_vringh *epf_virtio_alloc_vringh(struct pci_epf *epf,
+						  u64 features,
+						  phys_addr_t pci_addr,
+						  unsigned int num)
+{
+	int err;
+	struct vring vring;
+	struct epf_vringh *evrh;
+
+	evrh = kmalloc(sizeof(*evrh), GFP_KERNEL);
+	if (!evrh) {
+		err = -ENOMEM;
+		goto err_unmap_vq;
+	}
+
+	evrh->num = num;
+
+	evrh->virt = epf_virtio_map_vq(epf, pci_addr, num, &evrh->phys);
+	if (IS_ERR(evrh->virt))
+		return evrh->virt;
+
+	vring_init(&vring, num, evrh->virt, VIRTIO_PCI_VRING_ALIGN);
+
+	err = vringh_init_iomem(&evrh->vrh, features, num, false, GFP_KERNEL,
+				vring.desc, vring.avail, vring.used);
+	if (err)
+		goto err_free_epf_vq;
+
+	return evrh;
+
+err_free_epf_vq:
+	kfree(evrh);
+
+err_unmap_vq:
+	epf_virtio_unmap_vq(epf, evrh->virt, evrh->phys, evrh->num);
+
+	return ERR_PTR(err);
+}
+
+#define VIRTIO_PCI_LEGACY_CFG_BAR 0
+
+static void __iomem *epf_virtio_alloc_bar(struct pci_epf *epf, size_t size)
+{
+	struct pci_epf_bar *config_bar = &epf->bar[VIRTIO_PCI_LEGACY_CFG_BAR];
+	const struct pci_epc_features *features;
+	void __iomem *bar;
+	int err;
+
+	features = pci_epc_get_features(epf->epc, epf->func_no, epf->vfunc_no);
+	if (!features) {
+		pr_debug("Failed to get PCI EPC features\n");
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
+	if (features->reserved_bar & BIT(VIRTIO_PCI_LEGACY_CFG_BAR)) {
+		pr_debug("Cannot use the PCI BAR for legacy virtio pci\n");
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
+	if (features->bar_fixed_size[VIRTIO_PCI_LEGACY_CFG_BAR]) {
+		if (size >
+		    features->bar_fixed_size[VIRTIO_PCI_LEGACY_CFG_BAR]) {
+			pr_debug("PCI BAR size is not enough\n");
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	bar = pci_epf_alloc_space(epf, size, VIRTIO_PCI_LEGACY_CFG_BAR,
+				  features->align, PRIMARY_INTERFACE);
+	if (!bar) {
+		pr_debug("Failed to allocate virtio-net config memory\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config_bar->flags |= PCI_BASE_ADDRESS_MEM_TYPE_64;
+	err = pci_epc_set_bar(epf->epc, epf->func_no, epf->vfunc_no,
+			      config_bar);
+	if (err) {
+		pr_debug("Failed to set PCI BAR");
+		goto err_free_space;
+	}
+
+	return bar;
+
+err_free_space:
+
+	pci_epf_free_space(epf, bar, VIRTIO_PCI_LEGACY_CFG_BAR,
+			   PRIMARY_INTERFACE);
+
+	return ERR_PTR(err);
+}
+
+static void epf_virtio_free_bar(struct pci_epf *epf, void __iomem *bar)
+{
+	struct pci_epf_bar *config_bar = &epf->bar[VIRTIO_PCI_LEGACY_CFG_BAR];
+
+	pci_epc_clear_bar(epf->epc, epf->func_no, epf->vfunc_no, config_bar);
+	pci_epf_free_space(epf, bar, VIRTIO_PCI_LEGACY_CFG_BAR,
+			   PRIMARY_INTERFACE);
+}
+
+static void epf_virtio_init_bar(struct epf_virtio *evio, void __iomem *bar)
+{
+	evio->bar = bar;
+
+	epf_virtio_cfg_write32(evio, VIRTIO_PCI_HOST_FEATURES, evio->features);
+	epf_virtio_cfg_write16(evio, VIRTIO_PCI_ISR, VIRTIO_PCI_ISR_QUEUE);
+	epf_virtio_cfg_write16(evio, VIRTIO_PCI_QUEUE_NUM, evio->vqlen);
+	epf_virtio_cfg_write16(evio, VIRTIO_PCI_QUEUE_NOTIFY, evio->nvq);
+	epf_virtio_cfg_write8(evio, VIRTIO_PCI_STATUS, 0);
+}
+
+/**
+ * epf_virtio_init - initialize struct epf_virtio and setup BAR for virtio
+ * @evio: struct epf_virtio to initialize.
+ * @hdr: pci configuration space to show remote host.
+ * @bar_size: pci BAR size it depends on the virtio device type.
+ *
+ * Returns zero or a negative error.
+ */
+int epf_virtio_init(struct epf_virtio *evio, struct pci_epf_header *hdr,
+		    size_t bar_size)
+{
+	struct pci_epf *epf = evio->epf;
+	void __iomem *bar;
+	int err;
+
+	err = pci_epc_write_header(epf->epc, epf->func_no, epf->vfunc_no, hdr);
+	if (err)
+		return err;
+
+	bar = epf_virtio_alloc_bar(epf, bar_size);
+	if (IS_ERR(bar))
+		return PTR_ERR(bar);
+
+	epf_virtio_init_bar(evio, bar);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(epf_virtio_init);
+
+/**
+ * epf_virtio_final - finalize struct epf_virtio. it frees bar and memories
+ * @evio: struct epf_virtio to finalize.
+ */
+void epf_virtio_final(struct epf_virtio *evio)
+{
+	epf_virtio_free_bar(evio->epf, evio->bar);
+
+	for (int i = 0; i < evio->nvq; i++)
+		epf_virtio_free_vringh(evio->epf, evio->vrhs[i]);
+
+	kfree(evio->vrhs);
+}
+EXPORT_SYMBOL_GPL(epf_virtio_final);
+
+static int epf_virtio_negotiate_vq(struct epf_virtio *evio)
+{
+	u32 pfn;
+	u16 sel;
+	int i = 0;
+	struct _pair {
+		u32 pfn;
+		u16 sel;
+	} *tmp;
+	int err = 0;
+	size_t nvq = evio->nvq;
+
+	tmp = kmalloc_array(nvq, sizeof(tmp[0]), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	/*
+	 * PCIe EP framework has no capability to hook access PCI BAR space from
+	 * remote host driver, so poll the specific register, queue pfn to detect
+	 * the writing from the driver.
+	 *
+	 * This implementation assumes that the address of each virtqueue is
+	 * written only once.
+	 */
+	for (i = 0; i < nvq; i++) {
+		while (!(pfn = epf_virtio_cfg_read32(evio,
+						     VIRTIO_PCI_QUEUE_PFN)) &&
+		       evio->running)
+			;
+
+		sel = epf_virtio_cfg_read16(evio, VIRTIO_PCI_QUEUE_SEL);
+
+		epf_virtio_cfg_write32(evio, VIRTIO_PCI_QUEUE_PFN, 0);
+
+		tmp[i].pfn = pfn;
+		tmp[i].sel = sel;
+	}
+
+	if (!evio->running)
+		goto err_out;
+
+	evio->vrhs = kmalloc_array(nvq, sizeof(evio->vrhs[0]), GFP_KERNEL);
+	if (!evio->vrhs) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	for (i = 0; i < nvq; i++) {
+		phys_addr_t pci = tmp[i].pfn << VIRTIO_PCI_QUEUE_ADDR_SHIFT;
+
+		evio->vrhs[i] = epf_virtio_alloc_vringh(
+			evio->epf, evio->features, pci, evio->vqlen);
+		if (IS_ERR(evio->vrhs[i])) {
+			err = PTR_ERR(evio->vrhs[i]);
+			goto err_free_evrhs;
+		}
+	}
+
+	kfree(tmp);
+
+	return 0;
+
+err_free_evrhs:
+	for (i -= 1; i > 0; i--)
+		epf_virtio_free_vringh(evio->epf, evio->vrhs[i]);
+
+	kfree(evio->vrhs);
+
+err_out:
+	kfree(tmp);
+
+	return err;
+}
+
+static void epf_virtio_monitor_qnotify(struct epf_virtio *evio)
+{
+	const u16 qn_default = evio->nvq;
+	u16 tmp;
+
+	/* Since there is no way to synchronize between the host and EP functions,
+	 * it is possible to miss multiple notifications.
+	 */
+	while (evio->running) {
+		tmp = epf_virtio_cfg_read16(evio, VIRTIO_PCI_QUEUE_NOTIFY);
+		if (tmp == qn_default)
+			continue;
+
+		epf_virtio_cfg_write16(evio, VIRTIO_PCI_QUEUE_NOTIFY,
+				       qn_default);
+
+		evio->qn_callback(evio->qn_param);
+	}
+}
+
+static int epf_virtio_bgtask(void *param)
+{
+	struct epf_virtio *evio = param;
+	int err;
+
+	err = epf_virtio_negotiate_vq(evio);
+	if (err < 0) {
+		pr_err("failed to negoticate configs with driver\n");
+		return err;
+	}
+
+	while (!(epf_virtio_cfg_read8(evio, VIRTIO_PCI_STATUS) &
+		 VIRTIO_CONFIG_S_DRIVER_OK) &&
+	       evio->running)
+		;
+
+	if (evio->ic_callback && evio->running)
+		evio->ic_callback(evio->ic_param);
+
+	epf_virtio_monitor_qnotify(evio);
+
+	return 0;
+}
+
+/**
+ * epf_virtio_launch_bgtask - spawn a kthread that emulates virtio device
+ * operations.
+ * @evio: It should be initialized prior with epf_virtio_init().
+ *
+ * Returns zero or a negative error.
+ */
+int epf_virtio_launch_bgtask(struct epf_virtio *evio)
+{
+	evio->bgtask = kthread_create(epf_virtio_bgtask, evio,
+				      "pci-epf-virtio/bgtask");
+	if (IS_ERR(evio->bgtask))
+		return PTR_ERR(evio->bgtask);
+
+	evio->running = true;
+
+	sched_set_fifo(evio->bgtask);
+	wake_up_process(evio->bgtask);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(epf_virtio_launch_bgtask);
+
+/**
+ * epf_virtio_terminate_bgtask - shutdown a device emulation kthread.
+ * @evio: struct epf_virtio it already launched bgtask.
+ */
+void epf_virtio_terminate_bgtask(struct epf_virtio *evio)
+{
+	evio->running = false;
+
+	kthread_stop(evio->bgtask);
+}
+EXPORT_SYMBOL_GPL(epf_virtio_terminate_bgtask);
+
+/**
+ * epf_virtio_reset - reset virtio status
+ * @evio: struct epf_virtio to reset
+ *
+ * Returns zero or a negative error.
+ */
+int epf_virtio_reset(struct epf_virtio *evio)
+{
+	epf_virtio_terminate_bgtask(evio);
+	epf_virtio_init_bar(evio, evio->bar);
+
+	return epf_virtio_launch_bgtask(evio);
+}
+EXPORT_SYMBOL_GPL(epf_virtio_reset);
+
+/**
+ * epf_virtio_vrh_memcpy - copy a data with CPU between remote and local vring.
+ * @evio: struct epf_virtio
+ * @svrh: vringh for source virtqueue.
+ * @siov: iovec to store buffer info for source virtqueue
+ * @dvrh: vringh for destination virtqueue.
+ * @diov: iovec to store buffer info for destination virtqueue
+ * @dir: direction of the copy.
+ *
+ * Returns zero, one or a negative.
+ * 0: there is no data in src virtio ring.
+ * 1: success to transfer data.
+ * negative: errors.
+ */
+int epf_virtio_vrh_memcpy(struct epf_virtio *evio, struct vringh *svrh,
+			  struct vringh_kiov *siov, struct vringh *dvrh,
+			  struct vringh_kiov *diov,
+			  enum epf_virtio_copy_dir dir)
+{
+	int err;
+	u16 shead, dhead;
+	size_t slen, dlen, total_len;
+	void *svirt, *dvirt;
+	phys_addr_t sbase, dbase, phys;
+	struct pci_epf *epf = evio->epf;
+
+	err = vringh_getdesc(svrh, siov, NULL, &shead);
+	if (err <= 0) {
+		if (err < 0)
+			pr_err("s err %d\n", err);
+		return err;
+	}
+
+	err = vringh_getdesc(dvrh, NULL, diov, &dhead);
+	if (err <= 0) {
+		if (err < 0)
+			pr_err("d err %d\n", err);
+		return err;
+	}
+
+	total_len = vringh_kiov_length(siov);
+
+	for (; siov->i < siov->used; siov->i++, diov->i++) {
+		slen = siov->iov[siov->i].iov_len;
+		sbase = (u64)siov->iov[siov->i].iov_base;
+		dlen = diov->iov[diov->i].iov_len;
+		dbase = (u64)diov->iov[diov->i].iov_base;
+
+		if (dlen < slen) {
+			pr_err("no space %ld < %ld\n", dlen, slen);
+			return -ENOSPC;
+		}
+
+		if (dir == EPF_VIRTIO_COPY_DIR_FROM_DEV) {
+			svirt = pci_epc_map_addr(epf->epc, epf->func_no,
+						 epf->vfunc_no, sbase, &phys,
+						 slen);
+			if (IS_ERR(svirt)) {
+				pr_err("pci_epc_map_addr s %ld\n",
+				       PTR_ERR(svirt));
+				return PTR_ERR(svirt);
+			}
+
+			dvirt = phys_to_virt(dbase);
+			memcpy_fromio(dvirt, svirt, slen);
+
+			pci_epc_unmap_addr(epf->epc, epf->func_no,
+					   epf->vfunc_no, phys, svirt, slen);
+		} else {
+			svirt = phys_to_virt(sbase);
+			dvirt = pci_epc_map_addr(epf->epc, epf->func_no,
+						 epf->vfunc_no, dbase, &phys,
+						 dlen);
+			if (IS_ERR(dvirt)) {
+				pr_err("pci_epc_map_addr d %ld\n",
+				       PTR_ERR(dvirt));
+				return PTR_ERR(dvirt);
+			}
+
+			memcpy_toio(dvirt, svirt, slen);
+
+			pci_epc_unmap_addr(epf->epc, epf->func_no,
+					   epf->vfunc_no, phys, dvirt, dlen);
+		}
+	}
+
+	vringh_complete(svrh, shead, total_len);
+	vringh_complete(dvrh, dhead, total_len);
+
+	return 1;
+}
+EXPORT_SYMBOL_GPL(epf_virtio_vrh_memcpy);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/pci/endpoint/functions/pci-epf-virtio.h b/drivers/pci/endpoint/functions/pci-epf-virtio.h
new file mode 100644
index 000000000000..162029f6da70
--- /dev/null
+++ b/drivers/pci/endpoint/functions/pci-epf-virtio.h
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PCI_EPF_VIRTIO_H__
+#define __PCI_EPF_VIRTIO_H__
+
+#include <linux/pci-epf.h>
+#include <linux/pci-epc.h>
+#include <linux/vringh.h>
+
+struct epf_vringh {
+	struct vringh vrh;
+	void __iomem *virt;
+	phys_addr_t phys;
+	unsigned int num;
+};
+
+struct epf_virtio {
+	/* Base PCI endpoint function */
+	struct pci_epf *epf;
+
+	/* Virtio parameters */
+	u64 features;
+	size_t bar_size;
+	size_t nvq;
+	size_t vqlen;
+
+	/* struct to access virtqueue on remote host */
+	struct epf_vringh **vrhs;
+
+	/* struct for thread to emulate virtio device */
+	struct task_struct *bgtask;
+
+	/* Virtual address of pci configuration space */
+	void __iomem *bar;
+
+	/* Callback function and parameter for queue notifcation
+	 * Note: PCI EP function cannot detect qnotify accurately, therefore this
+	 * callback function should check all of virtqueue's changes.
+	 */
+	void (*qn_callback)(void *param);
+	void *qn_param;
+
+	/* Callback function and parameter for initialize complete */
+	void (*ic_callback)(void *param);
+	void *ic_param;
+
+	bool running;
+};
+
+#define DEFINE_EPF_VIRTIO_CFG_READ(size)                 \
+	static inline u##size epf_virtio_cfg_read##size( \
+		struct epf_virtio *evio, size_t offset)  \
+	{                                                \
+		void __iomem *base = evio->bar + offset; \
+		return ioread##size(base);               \
+	}
+
+DEFINE_EPF_VIRTIO_CFG_READ(8)
+DEFINE_EPF_VIRTIO_CFG_READ(16)
+DEFINE_EPF_VIRTIO_CFG_READ(32)
+
+#define DEFINE_EPF_VIRTIO_CFG_WRITE(size)                              \
+	static inline void epf_virtio_cfg_write##size(                 \
+		struct epf_virtio *evio, size_t offset, u##size value) \
+	{                                                              \
+		void __iomem *base = evio->bar + offset;               \
+		iowrite##size(value, base);                            \
+	}
+
+DEFINE_EPF_VIRTIO_CFG_WRITE(8);
+DEFINE_EPF_VIRTIO_CFG_WRITE(16);
+DEFINE_EPF_VIRTIO_CFG_WRITE(32);
+
+#define DEFINE_EPF_VIRTIO_CFG_SET(size)                                \
+	static inline void epf_virtio_cfg_set##size(                   \
+		struct epf_virtio *evio, size_t offset, u##size value) \
+	{                                                              \
+		void __iomem *base = evio->bar + offset;               \
+		iowrite##size(ioread##size(base) | value, base);       \
+	}
+
+DEFINE_EPF_VIRTIO_CFG_SET(8)
+DEFINE_EPF_VIRTIO_CFG_SET(16)
+DEFINE_EPF_VIRTIO_CFG_SET(32)
+
+#define DEFINE_EPF_VIRTIO_CFG_CLEAR(size)                              \
+	static inline void epf_virtio_cfg_clear##size(                 \
+		struct epf_virtio *evio, size_t offset, u##size value) \
+	{                                                              \
+		void __iomem *base = evio->bar + offset;               \
+		iowrite##size(ioread##size(base) & ~value, base);      \
+	}
+
+DEFINE_EPF_VIRTIO_CFG_CLEAR(8)
+DEFINE_EPF_VIRTIO_CFG_CLEAR(16)
+DEFINE_EPF_VIRTIO_CFG_CLEAR(32)
+
+static inline void epf_virtio_cfg_memcpy_toio(struct epf_virtio *evio,
+					      size_t offset, void *buf,
+					      size_t len)
+{
+	void __iomem *base = evio->bar + offset;
+
+	memcpy_toio(base, buf, len);
+}
+
+int epf_virtio_init(struct epf_virtio *evio, struct pci_epf_header *hdr,
+		    size_t bar_size);
+void epf_virtio_final(struct epf_virtio *evio);
+int epf_virtio_launch_bgtask(struct epf_virtio *evio);
+void epf_virtio_terminate_bgtask(struct epf_virtio *evio);
+int epf_virtio_reset(struct epf_virtio *evio);
+
+enum epf_virtio_copy_dir {
+	EPF_VIRTIO_COPY_DIR_FROM_DEV,
+	EPF_VIRTIO_COPY_DIR_TO_DEV,
+};
+
+int epf_virtio_vrh_memcpy(struct epf_virtio *evio, struct vringh *svrh,
+			  struct vringh_kiov *siov, struct vringh *dvrh,
+			  struct vringh_kiov *diov,
+			  enum epf_virtio_copy_dir dir);
+
+#endif /* __PCI_EPF_VIRTIO_H__ */
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
