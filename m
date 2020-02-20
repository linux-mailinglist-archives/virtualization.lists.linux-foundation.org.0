Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A33501655F2
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 04:58:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57F4E8630A;
	Thu, 20 Feb 2020 03:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGDjGkUVW2V6; Thu, 20 Feb 2020 03:58:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B7E286566;
	Thu, 20 Feb 2020 03:58:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71C5DC013E;
	Thu, 20 Feb 2020 03:58:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9042C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 03:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E4791204EE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 03:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEaARg5A-dXz
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 03:58:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 7CE7920364
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 03:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582171079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jZtX/+U7sBVZb7ycb2o9P8TTwtjrjB9jmTRrC0WXDM=;
 b=BrOhjDEL4aCx3shJYe7D56M5HjMDjiE7C2pw9BoPo6T6dFLWNPA1SMOAstgnSdLI3/czU0
 LLIlpUGL0PC3rs3V0HPhsPz3QdU3sNmTlMB07c79iqMrQJtRsmbxTrdm29a5OvocqKDf0K
 RJcSL80Gp7y4ULKapv7/H7/GreD+Ezw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-T9_RJZ9dOyiimUvkPmxZeg-1; Wed, 19 Feb 2020 22:57:57 -0500
X-MC-Unique: T9_RJZ9dOyiimUvkPmxZeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D91E8107ACC4;
 Thu, 20 Feb 2020 03:57:54 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-159.pek2.redhat.com [10.72.12.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0234E5C651;
 Thu, 20 Feb 2020 03:57:37 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [PATCH V3 3/5] vDPA: introduce vDPA bus
Date: Thu, 20 Feb 2020 11:56:48 +0800
Message-Id: <20200220035650.7986-4-jasowang@redhat.com>
In-Reply-To: <20200220035650.7986-1-jasowang@redhat.com>
References: <20200220035650.7986-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: jgg@mellanox.com, rob.miller@broadcom.com, lulu@redhat.com,
 hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, mhabets@solarflare.com, shahafs@mellanox.com,
 parav@mellanox.com, jiri@mellanox.com, xiao.w.wang@intel.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rdunlap@infradead.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

vDPA device is a device that uses a datapath which complies with the
virtio specifications with vendor specific control path. vDPA devices
can be both physically located on the hardware or emulated by
software. vDPA hardware devices are usually implemented through PCIE
with the following types:

- PF (Physical Function) - A single Physical Function
- VF (Virtual Function) - Device that supports single root I/O
  virtualization (SR-IOV). Its Virtual Function (VF) represents a
  virtualized instance of the device that can be assigned to different
  partitions
- ADI (Assignable Device Interface) and its equivalents - With
  technologies such as Intel Scalable IOV, a virtual device (VDEV)
  composed by host OS utilizing one or more ADIs. Or its equivalent
  like SF (Sub function) from Mellanox.

From a driver's perspective, depends on how and where the DMA
translation is done, vDPA devices are split into two types:

- Platform specific DMA translation - From the driver's perspective,
  the device can be used on a platform where device access to data in
  memory is limited and/or translated. An example is a PCIE vDPA whose
  DMA request was tagged via a bus (e.g PCIE) specific way. DMA
  translation and protection are done at PCIE bus IOMMU level.
- Device specific DMA translation - The device implements DMA
  isolation and protection through its own logic. An example is a vDPA
  device which uses on-chip IOMMU.

To hide the differences and complexity of the above types for a vDPA
device/IOMMU options and in order to present a generic virtio device
to the upper layer, a device agnostic framework is required.

This patch introduces a software vDPA bus which abstracts the
common attributes of vDPA device, vDPA bus driver and the
communication method (vdpa_config_ops) between the vDPA device
abstraction and the vDPA bus driver. This allows multiple types of
drivers to be used for vDPA device like the virtio_vdpa and vhost_vdpa
driver to operate on the bus and allow vDPA device could be used by
either kernel virtio driver or userspace vhost drivers as:

   virtio drivers  vhost drivers
          |             |
    [virtio bus]   [vhost uAPI]
          |             |
   virtio device   vhost device
   virtio_vdpa drv vhost_vdpa drv
             \       /
            [vDPA bus]
                 |
            vDPA device
            hardware drv
                 |
            [hardware bus]
                 |
            vDPA hardware

With the abstraction of vDPA bus and vDPA bus operations, the
difference and complexity of the under layer hardware is hidden from
upper layer. The vDPA bus drivers on top can use a unified
vdpa_config_ops to control different types of vDPA device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 MAINTAINERS                  |   1 +
 drivers/virtio/Kconfig       |   2 +
 drivers/virtio/Makefile      |   1 +
 drivers/virtio/vdpa/Kconfig  |   9 ++
 drivers/virtio/vdpa/Makefile |   2 +
 drivers/virtio/vdpa/vdpa.c   | 167 +++++++++++++++++++++++++
 include/linux/vdpa.h         | 232 +++++++++++++++++++++++++++++++++++
 7 files changed, 414 insertions(+)
 create mode 100644 drivers/virtio/vdpa/Kconfig
 create mode 100644 drivers/virtio/vdpa/Makefile
 create mode 100644 drivers/virtio/vdpa/vdpa.c
 create mode 100644 include/linux/vdpa.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fb645b5a7df..2b8d9fa38d9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17701,6 +17701,7 @@ F:	tools/virtio/
 F:	drivers/net/virtio_net.c
 F:	drivers/block/virtio_blk.c
 F:	include/linux/virtio*.h
+F:	include/linux/vdpa.h
 F:	include/uapi/linux/virtio_*.h
 F:	drivers/crypto/virtio/
 F:	mm/balloon_compaction.c
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 078615cf2afc..9c4fdb64d9ac 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -96,3 +96,5 @@ config VIRTIO_MMIO_CMDLINE_DEVICES
 	 If unsure, say 'N'.
 
 endif # VIRTIO_MENU
+
+source "drivers/virtio/vdpa/Kconfig"
diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 3a2b5c5dcf46..fdf5eacd0d0a 100644
--- a/drivers/virtio/Makefile
+++ b/drivers/virtio/Makefile
@@ -6,3 +6,4 @@ virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
 virtio_pci-$(CONFIG_VIRTIO_PCI_LEGACY) += virtio_pci_legacy.o
 obj-$(CONFIG_VIRTIO_BALLOON) += virtio_balloon.o
 obj-$(CONFIG_VIRTIO_INPUT) += virtio_input.o
+obj-$(CONFIG_VDPA) += vdpa/
diff --git a/drivers/virtio/vdpa/Kconfig b/drivers/virtio/vdpa/Kconfig
new file mode 100644
index 000000000000..7a99170e6c30
--- /dev/null
+++ b/drivers/virtio/vdpa/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VDPA
+	tristate
+        default m
+        help
+          Enable this module to support vDPA device that uses a
+          datapath which complies with virtio specifications with
+          vendor specific control path.
+
diff --git a/drivers/virtio/vdpa/Makefile b/drivers/virtio/vdpa/Makefile
new file mode 100644
index 000000000000..ee6a35e8a4fb
--- /dev/null
+++ b/drivers/virtio/vdpa/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VDPA) += vdpa.o
diff --git a/drivers/virtio/vdpa/vdpa.c b/drivers/virtio/vdpa/vdpa.c
new file mode 100644
index 000000000000..31dcd38d5390
--- /dev/null
+++ b/drivers/virtio/vdpa/vdpa.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vDPA bus.
+ *
+ * Copyright (c) 2020, Red Hat. All rights reserved.
+ *     Author: Jason Wang <jasowang@redhat.com>
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/idr.h>
+#include <linux/slab.h>
+#include <linux/vdpa.h>
+
+static DEFINE_IDA(vdpa_index_ida);
+
+static int vdpa_dev_probe(struct device *d)
+{
+	struct vdpa_device *vdev = dev_to_vdpa(d);
+	struct vdpa_driver *drv = drv_to_vdpa(vdev->dev.driver);
+	int ret = 0;
+
+	if (drv && drv->probe)
+		ret = drv->probe(vdev);
+
+	return ret;
+}
+
+static int vdpa_dev_remove(struct device *d)
+{
+	struct vdpa_device *vdev = dev_to_vdpa(d);
+	struct vdpa_driver *drv = drv_to_vdpa(vdev->dev.driver);
+
+	if (drv && drv->remove)
+		drv->remove(vdev);
+
+	return 0;
+}
+
+static struct bus_type vdpa_bus = {
+	.name  = "vdpa",
+	.probe = vdpa_dev_probe,
+	.remove = vdpa_dev_remove,
+};
+
+static void vdpa_release_dev(struct device *d)
+{
+	struct vdpa_device *vdev = dev_to_vdpa(d);
+
+	ida_simple_remove(&vdpa_index_ida, vdev->index);
+	kfree(vdev);
+}
+
+/**
+ * vdpa_alloc_device - allocate and initilaize a vDPA device
+ * This allows driver to some prepartion after device is
+ * initialized but before registered.
+ * @parent: the parent device
+ * @dma_dev: the actual device that is performing DMA
+ * @config: the bus operations that is supported by this device
+ *
+ * Returns an error when parent/config/dma_dev is not set or fail to get
+ * ida.
+ */
+struct vdpa_device *vdpa_alloc_device(struct device *parent,
+				      struct device *dma_dev,
+				      const struct vdpa_config_ops *config)
+{
+	struct vdpa_device *vdev;
+	int err = -ENOMEM;
+
+	if (!parent || !dma_dev || !config)
+		goto err;
+
+	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
+	if (!vdev)
+		goto err;
+
+	err = ida_simple_get(&vdpa_index_ida, 0, 0, GFP_KERNEL);
+	if (err < 0)
+		goto err_ida;
+
+	vdev->dev.bus = &vdpa_bus;
+	vdev->dev.parent = parent;
+	vdev->dev.release = vdpa_release_dev;
+
+	device_initialize(&vdev->dev);
+
+	vdev->index = err;
+	vdev->dma_dev = dma_dev;
+	vdev->config = config;
+
+	dev_set_name(&vdev->dev, "vdpa%u", vdev->index);
+
+	return vdev;
+
+err_ida:
+	kfree(vdev);
+err:
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(vdpa_alloc_device);
+
+/**
+ * vdpa_register_device - register a vDPA device
+ * Callers must have a succeed call of vdpa_init_device() before.
+ * @vdev: the vdpa device to be registered to vDPA bus
+ *
+ * Returns an error when fail to add to vDPA bus
+ */
+int vdpa_register_device(struct vdpa_device *vdev)
+{
+	return device_add(&vdev->dev);
+}
+EXPORT_SYMBOL_GPL(vdpa_register_device);
+
+/**
+ * vdpa_unregister_device - unregister a vDPA device
+ * @vdev: the vdpa device to be unregisted from vDPA bus
+ */
+void vdpa_unregister_device(struct vdpa_device *vdev)
+{
+	device_unregister(&vdev->dev);
+}
+EXPORT_SYMBOL_GPL(vdpa_unregister_device);
+
+/**
+ * __vdpa_register_driver - register a vDPA device driver
+ * @drv: the vdpa device driver to be registered
+ * @owner: module owner of the driver
+ *
+ * Returns an err when fail to do the registration
+ */
+int __vdpa_register_driver(struct vdpa_driver *drv, struct module *owner)
+{
+	drv->driver.bus = &vdpa_bus;
+	drv->driver.owner = owner;
+
+	return driver_register(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(__vdpa_register_driver);
+
+/**
+ * vdpa_unregister_driver - unregister a vDPA device driver
+ * @drv: the vdpa device driver to be unregistered
+ */
+void vdpa_unregister_driver(struct vdpa_driver *drv)
+{
+	driver_unregister(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(vdpa_unregister_driver);
+
+static int vdpa_init(void)
+{
+	return bus_register(&vdpa_bus);
+}
+
+static void __exit vdpa_exit(void)
+{
+	bus_unregister(&vdpa_bus);
+	ida_destroy(&vdpa_index_ida);
+}
+core_initcall(vdpa_init);
+module_exit(vdpa_exit);
+
+MODULE_AUTHOR("Jason Wang <jasowang@redhat.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
new file mode 100644
index 000000000000..7cb8ef32e2e8
--- /dev/null
+++ b/include/linux/vdpa.h
@@ -0,0 +1,232 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_VDPA_H
+#define _LINUX_VDPA_H
+
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/vhost_iotlb.h>
+
+/**
+ * vDPA callback definition.
+ * @callback: interrupt callback function
+ * @private: the data passed to the callback function
+ */
+struct vdpa_callback {
+	irqreturn_t (*callback)(void *data);
+	void *private;
+};
+
+/**
+ * vDPA device - representation of a vDPA device
+ * @dev: underlying device
+ * @dma_dev: the actual device that is performing DMA
+ * @config: the configuration ops for this device.
+ * @index: device index
+ */
+struct vdpa_device {
+	struct device dev;
+	struct device *dma_dev;
+	const struct vdpa_config_ops *config;
+	unsigned int index;
+};
+
+/**
+ * vDPA_config_ops - operations for configuring a vDPA device.
+ * Note: vDPA device drivers are required to implement all of the
+ * operations unless it is mentioned to be optional in the following
+ * list.
+ *
+ * @set_vq_address:		Set the address of virtqueue
+ *				@vdev: vdpa device
+ *				@idx: virtqueue index
+ *				@desc_area: address of desc area
+ *				@driver_area: address of driver area
+ *				@device_area: address of device area
+ *				Returns integer: success (0) or error (< 0)
+ * @set_vq_num:			Set the size of virtqueue
+ *				@vdev: vdpa device
+ *				@idx: virtqueue index
+ *				@num: the size of virtqueue
+ * @kick_vq:			Kick the virtqueue
+ *				@vdev: vdpa device
+ *				@idx: virtqueue index
+ * @set_vq_cb:			Set the interrupt callback function for
+ *				a virtqueue
+ *				@vdev: vdpa device
+ *				@idx: virtqueue index
+ *				@cb: virtio-vdev interrupt callback structure
+ * @set_vq_ready:		Set ready status for a virtqueue
+ *				@vdev: vdpa device
+ *				@idx: virtqueue index
+ *				@ready: ready (true) not ready(false)
+ * @get_vq_ready:		Get ready status for a virtqueue
+ *				@vdev: vdpa device
+ *				@idx: virtqueue index
+ *				Returns boolean: ready (true) or not (false)
+ * @set_vq_state:		Set the state for a virtqueue
+ *				@vdev: vdpa device
+ *				@idx: virtqueue index
+ *				@state: virtqueue state (last_avail_idx)
+ *				Returns integer: success (0) or error (< 0)
+ * @get_vq_state:		Get the state for a virtqueue
+ *				@vdev: vdpa device
+ *				@idx: virtqueue index
+ *				Returns virtqueue state (last_avail_idx)
+ * @get_vq_align:		Get the virtqueue align requirement
+ *				for the device
+ *				@vdev: vdpa device
+ *				Returns virtqueue algin requirement
+ * @get_features:		Get virtio features supported by the device
+ *				@vdev: vdpa device
+ *				Returns the virtio features support by the
+ *				device
+ * @set_features:		Set virtio features supported by the driver
+ *				@vdev: vdpa device
+ *				@features: feature support by the driver
+ *				Returns integer: success (0) or error (< 0)
+ * @set_config_cb:		Set the config interrupt callback
+ *				@vdev: vdpa device
+ *				@cb: virtio-vdev interrupt callback structure
+ * @get_vq_num_max:		Get the max size of virtqueue
+ *				@vdev: vdpa device
+ *				Returns u16: max size of virtqueue
+ * @get_device_id:		Get virtio device id
+ *				@vdev: vdpa device
+ *				Returns u32: virtio device id
+ * @get_vendor_id:		Get id for the vendor that provides this device
+ *				@vdev: vdpa device
+ *				Returns u32: virtio vendor id
+ * @get_status:			Get the device status
+ *				@vdev: vdpa device
+ *				Returns u8: virtio device status
+ * @set_status:			Set the device status
+ *				@vdev: vdpa device
+ *				@status: virtio device status
+ * @get_config:			Read from device specific configuration space
+ *				@vdev: vdpa device
+ *				@offset: offset from the beginning of
+ *				configuration space
+ *				@buf: buffer used to read to
+ *				@len: the length to read from
+ *				configuration space
+ * @set_config:			Write to device specific configuration space
+ *				@vdev: vdpa device
+ *				@offset: offset from the beginning of
+ *				configuration space
+ *				@buf: buffer used to write from
+ *				@len: the length to write to
+ *				configuration space
+ * @get_generation:		Get device config generation (optional)
+ *				@vdev: vdpa device
+ *				Returns u32: device generation
+ * @set_map:			Set device memory mapping (optional)
+ *				and only needed for device that using
+ *				device specific DMA translation
+ *				(on-chip IOMMU)
+ *				@vdev: vdpa device
+ *				@iotlb: vhost memory mapping to be
+ *				used by the vDPA
+ *				Returns integer: success (0) or error (< 0)
+ * @dma_map:			Map an area of PA to IOVA
+ *				@vdev: vdpa device
+ *				@iova: iova to be mapped
+ *				@size: size of the area
+ *				@pa: physical address for the map
+ *				@perm: device access permission (VHOST_MAP_XX)
+ *				Returns integer: success (0) or error (< 0)
+ * @dma_unmap:			Unmap an area of IOVA
+ *				@vdev: vdpa device
+ *				@iova: iova to be unmapped
+ *				@size: size of the area
+ *				Returns integer: success (0) or error (< 0)
+ */
+struct vdpa_config_ops {
+	/* Virtqueue ops */
+	int (*set_vq_address)(struct vdpa_device *vdev,
+			      u16 idx, u64 desc_area, u64 driver_area,
+			      u64 device_area);
+	void (*set_vq_num)(struct vdpa_device *vdev, u16 idx, u32 num);
+	void (*kick_vq)(struct vdpa_device *vdev, u16 idx);
+	void (*set_vq_cb)(struct vdpa_device *vdev, u16 idx,
+			  struct vdpa_callback *cb);
+	void (*set_vq_ready)(struct vdpa_device *vdev, u16 idx, bool ready);
+	bool (*get_vq_ready)(struct vdpa_device *vdev, u16 idx);
+	int (*set_vq_state)(struct vdpa_device *vdev, u16 idx, u64 state);
+	u64 (*get_vq_state)(struct vdpa_device *vdev, u16 idx);
+
+	/* Device ops */
+	u16 (*get_vq_align)(struct vdpa_device *vdev);
+	u64 (*get_features)(struct vdpa_device *vdev);
+	int (*set_features)(struct vdpa_device *vdev, u64 features);
+	void (*set_config_cb)(struct vdpa_device *vdev,
+			      struct vdpa_callback *cb);
+	u16 (*get_vq_num_max)(struct vdpa_device *vdev);
+	u32 (*get_device_id)(struct vdpa_device *vdev);
+	u32 (*get_vendor_id)(struct vdpa_device *vdev);
+	u8 (*get_status)(struct vdpa_device *vdev);
+	void (*set_status)(struct vdpa_device *vdev, u8 status);
+	void (*get_config)(struct vdpa_device *vdev, unsigned int offset,
+			   void *buf, unsigned int len);
+	void (*set_config)(struct vdpa_device *vdev, unsigned int offset,
+			   const void *buf, unsigned int len);
+	u32 (*get_generation)(struct vdpa_device *vdev);
+
+	/* DMA ops */
+	int (*set_map)(struct vdpa_device *vdev, struct vhost_iotlb *iotlb);
+	int (*dma_map)(struct vdpa_device *vdev, u64 iova, u64 size,
+		       u64 pa, u32 perm);
+	int (*dma_unmap)(struct vdpa_device *vdev, u64 iova, u64 size);
+};
+
+struct vdpa_device *vdpa_alloc_device(struct device *parent,
+				      struct device *dma_dev,
+				      const struct vdpa_config_ops *config);
+int vdpa_register_device(struct vdpa_device *vdev);
+void vdpa_unregister_device(struct vdpa_device *vdev);
+
+/**
+ * vdpa_driver - operations for a vDPA driver
+ * @driver: underlying device driver
+ * @probe: the function to call when a device is found.  Returns 0 or -errno.
+ * @remove: the function to call when a device is removed.
+ */
+struct vdpa_driver {
+	struct device_driver driver;
+	int (*probe)(struct vdpa_device *vdev);
+	void (*remove)(struct vdpa_device *vdev);
+};
+
+#define vdpa_register_driver(drv) \
+	__vdpa_register_driver(drv, THIS_MODULE)
+int __vdpa_register_driver(struct vdpa_driver *drv, struct module *owner);
+void vdpa_unregister_driver(struct vdpa_driver *drv);
+
+#define module_vdpa_driver(__vdpa_driver) \
+	module_driver(__vdpa_driver, vdpa_register_driver,	\
+		      vdpa_unregister_driver)
+
+static inline struct vdpa_driver *drv_to_vdpa(struct device_driver *driver)
+{
+	return container_of(driver, struct vdpa_driver, driver);
+}
+
+static inline struct vdpa_device *dev_to_vdpa(struct device *_dev)
+{
+	return container_of(_dev, struct vdpa_device, dev);
+}
+
+static inline void *vdpa_get_drvdata(const struct vdpa_device *vdev)
+{
+	return dev_get_drvdata(&vdev->dev);
+}
+
+static inline void vdpa_set_drvdata(struct vdpa_device *vdev, void *data)
+{
+	dev_set_drvdata(&vdev->dev, data);
+}
+
+static inline struct device *vdpa_get_dma_dev(struct vdpa_device *vdev)
+{
+	return vdev->dma_dev;
+}
+#endif /* _LINUX_VDPA_H */
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
