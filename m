Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ADDE96D5
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 07:51:24 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3D076FC7;
	Wed, 30 Oct 2019 06:51:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 26603FB7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 06:51:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id DF92C8A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572418274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=7x9JkdTyCcKKn0chueqpkzNgaOG4fsM0eH9MJzehASI=;
	b=V+3CaVge4q+SMVYF0iZyaj7Ht8/nRPiX1O02G42kbmYjpXzexIYFMkf+GtVAQfMl6VNBMI
	g1w2iAJ+zI48CkNPCOhQCUxXEs3Raci1+UaTi9kHY9GqqtewgRBPjNN1DPLnk5WwhmyZnj
	1gFex9AMC3e57pcMm1H1APfK+++RWYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-254-OLx427cEOP6ghya0Qu0idw-1; Wed, 30 Oct 2019 02:51:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BA46107AD28;
	Wed, 30 Oct 2019 06:51:07 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-223.pek2.redhat.com [10.72.12.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC86A5D9C3;
	Wed, 30 Oct 2019 06:49:52 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
	kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
	tiwei.bie@intel.com
Subject: [PATCH V6 5/6] virtio: introduce a mdev based transport
Date: Wed, 30 Oct 2019 14:44:43 +0800
Message-Id: <20191030064444.21166-6-jasowang@redhat.com>
In-Reply-To: <20191030064444.21166-1-jasowang@redhat.com>
References: <20191030064444.21166-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: OLx427cEOP6ghya0Qu0idw-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	virtualization@lists.linux-foundation.org,
	rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	jani.nikula@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, stefanha@redhat.com,
	akrowiak@linux.ibm.com, netdev@vger.kernel.org,
	cohuck@redhat.com, oberpar@linux.ibm.com,
	maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This patch introduces a new mdev transport for virtio. This is used to
use kernel virtio driver to drive the mediated device that is capable
of populating virtqueue directly.

A new virtio-mdev driver will be registered to the mdev bus, when a
new virtio-mdev device is probed, it will register the device with
mdev based config ops. This means it is a software transport between
mdev driver and mdev device. The transport was implemented through
device specific ops which is a part of mdev_parent_ops now.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/Kconfig       |   7 +
 drivers/virtio/Makefile      |   1 +
 drivers/virtio/virtio_mdev.c | 413 +++++++++++++++++++++++++++++++++++
 3 files changed, 421 insertions(+)
 create mode 100644 drivers/virtio/virtio_mdev.c

diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 078615cf2afc..8d18722ab572 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -43,6 +43,13 @@ config VIRTIO_PCI_LEGACY
 
 	  If unsure, say Y.
 
+config VIRTIO_MDEV_DEVICE
+	tristate "VIRTIO driver for Mediated devices"
+	depends on VFIO_MDEV && VIRTIO
+	default n
+	help
+	  VIRTIO based driver for Mediated devices.
+
 config VIRTIO_PMEM
 	tristate "Support for virtio pmem driver"
 	depends on VIRTIO
diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 3a2b5c5dcf46..ebc7fa15ae82 100644
--- a/drivers/virtio/Makefile
+++ b/drivers/virtio/Makefile
@@ -6,3 +6,4 @@ virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
 virtio_pci-$(CONFIG_VIRTIO_PCI_LEGACY) += virtio_pci_legacy.o
 obj-$(CONFIG_VIRTIO_BALLOON) += virtio_balloon.o
 obj-$(CONFIG_VIRTIO_INPUT) += virtio_input.o
+obj-$(CONFIG_VIRTIO_MDEV_DEVICE) += virtio_mdev.o
diff --git a/drivers/virtio/virtio_mdev.c b/drivers/virtio/virtio_mdev.c
new file mode 100644
index 000000000000..3d49072b2d3e
--- /dev/null
+++ b/drivers/virtio/virtio_mdev.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * VIRTIO based driver for Mediated device
+ *
+ * Copyright (c) 2019, Red Hat. All rights reserved.
+ *     Author: Jason Wang <jasowang@redhat.com>
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/uuid.h>
+#include <linux/mdev.h>
+#include <linux/virtio_mdev_ops.h>
+#include <linux/virtio.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_ring.h>
+
+#define DRIVER_VERSION  "0.1"
+#define DRIVER_AUTHOR   "Red Hat Corporation"
+#define DRIVER_DESC     "VIRTIO based driver for Mediated device"
+
+#define to_virtio_mdev_device(dev) \
+	container_of(dev, struct virtio_mdev_device, vdev)
+
+struct virtio_mdev_device {
+	struct virtio_device vdev;
+	struct mdev_device *mdev;
+	u64 features;
+
+	/* The lock to protect virtqueue list */
+	spinlock_t lock;
+	/* List of virtio_mdev_vq_info */
+	struct list_head virtqueues;
+};
+
+struct virtio_mdev_vq_info {
+	/* the actual virtqueue */
+	struct virtqueue *vq;
+
+	/* the list node for the virtqueues list */
+	struct list_head node;
+};
+
+static struct mdev_device *vm_get_mdev(struct virtio_device *vdev)
+{
+	struct virtio_mdev_device *vm_dev = to_virtio_mdev_device(vdev);
+	struct mdev_device *mdev = vm_dev->mdev;
+
+	return mdev;
+}
+
+static void virtio_mdev_get(struct virtio_device *vdev, unsigned offset,
+			    void *buf, unsigned len)
+{
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+
+	ops->get_config(mdev, offset, buf, len);
+}
+
+static void virtio_mdev_set(struct virtio_device *vdev, unsigned offset,
+			    const void *buf, unsigned len)
+{
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+
+	ops->set_config(mdev, offset, buf, len);
+}
+
+static u32 virtio_mdev_generation(struct virtio_device *vdev)
+{
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+
+	if (ops->get_generation)
+		return ops->get_generation(mdev);
+
+	return 0;
+}
+
+static u8 virtio_mdev_get_status(struct virtio_device *vdev)
+{
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+
+	return ops->get_status(mdev);
+}
+
+static void virtio_mdev_set_status(struct virtio_device *vdev, u8 status)
+{
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+
+	return ops->set_status(mdev, status);
+}
+
+static void virtio_mdev_reset(struct virtio_device *vdev)
+{
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+
+	return ops->set_status(mdev, 0);
+}
+
+static bool virtio_mdev_notify(struct virtqueue *vq)
+{
+	struct mdev_device *mdev = vm_get_mdev(vq->vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+
+	ops->kick_vq(mdev, vq->index);
+
+	return true;
+}
+
+static irqreturn_t virtio_mdev_config_cb(void *private)
+{
+	struct virtio_mdev_device *vm_dev = private;
+
+	virtio_config_changed(&vm_dev->vdev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t virtio_mdev_virtqueue_cb(void *private)
+{
+	struct virtio_mdev_vq_info *info = private;
+
+	return vring_interrupt(0, info->vq);
+}
+
+static struct virtqueue *
+virtio_mdev_setup_vq(struct virtio_device *vdev, unsigned index,
+		     void (*callback)(struct virtqueue *vq),
+		     const char *name, bool ctx)
+{
+	struct virtio_mdev_device *vm_dev = to_virtio_mdev_device(vdev);
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+	struct virtio_mdev_vq_info *info;
+	struct virtio_mdev_callback cb;
+	struct virtqueue *vq;
+	u64 desc_addr, driver_addr, device_addr;
+	unsigned long flags;
+	u32 align, num;
+	int err;
+
+	if (!name)
+		return NULL;
+
+	/* Queue shouldn't already be set up. */
+	if (ops->get_vq_ready(mdev, index))
+		return ERR_PTR(-ENOENT);
+
+	/* Allocate and fill out our active queue description */
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	num = ops->get_vq_num_max(mdev);
+	if (num == 0) {
+		err = -ENOENT;
+		goto error_new_virtqueue;
+	}
+
+	/* Create the vring */
+	align = ops->get_vq_align(mdev);
+	vq = vring_create_virtqueue(index, num, align, vdev,
+				    true, true, ctx,
+				    virtio_mdev_notify, callback, name);
+	if (!vq) {
+		err = -ENOMEM;
+		goto error_new_virtqueue;
+	}
+
+	/* Setup virtqueue callback */
+	cb.callback = virtio_mdev_virtqueue_cb;
+	cb.private = info;
+	ops->set_vq_cb(mdev, index, &cb);
+	ops->set_vq_num(mdev, index, virtqueue_get_vring_size(vq));
+
+	desc_addr = virtqueue_get_desc_addr(vq);
+	driver_addr = virtqueue_get_avail_addr(vq);
+	device_addr = virtqueue_get_used_addr(vq);
+
+	if (ops->set_vq_address(mdev, index,
+				desc_addr, driver_addr,
+				device_addr)) {
+		err = -EINVAL;
+		goto err_vq;
+	}
+
+	ops->set_vq_ready(mdev, index, 1);
+
+	vq->priv = info;
+	info->vq = vq;
+
+	spin_lock_irqsave(&vm_dev->lock, flags);
+	list_add(&info->node, &vm_dev->virtqueues);
+	spin_unlock_irqrestore(&vm_dev->lock, flags);
+
+	return vq;
+
+err_vq:
+	vring_del_virtqueue(vq);
+error_new_virtqueue:
+	ops->set_vq_ready(mdev, index, 0);
+	WARN_ON(ops->get_vq_ready(mdev, index));
+	kfree(info);
+	return ERR_PTR(err);
+
+}
+
+static void virtio_mdev_del_vq(struct virtqueue *vq)
+{
+	struct virtio_mdev_device *vm_dev = to_virtio_mdev_device(vq->vdev);
+	struct mdev_device *mdev = vm_dev->mdev;
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+	struct virtio_mdev_vq_info *info = vq->priv;
+	unsigned int index = vq->index;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vm_dev->lock, flags);
+	list_del(&info->node);
+	spin_unlock_irqrestore(&vm_dev->lock, flags);
+
+	/* Select and deactivate the queue */
+	ops->set_vq_ready(mdev, index, 0);
+	WARN_ON(ops->get_vq_ready(mdev, index));
+
+	vring_del_virtqueue(vq);
+
+	kfree(info);
+}
+
+static void virtio_mdev_del_vqs(struct virtio_device *vdev)
+{
+	struct virtqueue *vq, *n;
+
+	list_for_each_entry_safe(vq, n, &vdev->vqs, list)
+		virtio_mdev_del_vq(vq);
+}
+
+static int virtio_mdev_find_vqs(struct virtio_device *vdev, unsigned nvqs,
+				struct virtqueue *vqs[],
+				vq_callback_t *callbacks[],
+				const char * const names[],
+				const bool *ctx,
+				struct irq_affinity *desc)
+{
+	struct virtio_mdev_device *vm_dev = to_virtio_mdev_device(vdev);
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+	struct virtio_mdev_callback cb;
+	int i, err, queue_idx = 0;
+
+	for (i = 0; i < nvqs; ++i) {
+		if (!names[i]) {
+			vqs[i] = NULL;
+			continue;
+		}
+
+		vqs[i] = virtio_mdev_setup_vq(vdev, queue_idx++,
+					      callbacks[i], names[i], ctx ?
+					      ctx[i] : false);
+		if (IS_ERR(vqs[i])) {
+			err = PTR_ERR(vqs[i]);
+			goto err_setup_vq;
+		}
+	}
+
+	cb.callback = virtio_mdev_config_cb;
+	cb.private = vm_dev;
+	ops->set_config_cb(mdev, &cb);
+
+	return 0;
+
+err_setup_vq:
+	virtio_mdev_del_vqs(vdev);
+	return err;
+}
+
+static u64 virtio_mdev_get_features(struct virtio_device *vdev)
+{
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+
+	return ops->get_features(mdev);
+}
+
+static int virtio_mdev_finalize_features(struct virtio_device *vdev)
+{
+	struct mdev_device *mdev = vm_get_mdev(vdev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+
+	/* Give virtio_ring a chance to accept features. */
+	vring_transport_features(vdev);
+
+	return ops->set_features(mdev, vdev->features);
+}
+
+static const char *virtio_mdev_bus_name(struct virtio_device *vdev)
+{
+	struct virtio_mdev_device *vm_dev = to_virtio_mdev_device(vdev);
+	struct mdev_device *mdev = vm_dev->mdev;
+
+	return dev_name(mdev_dev(mdev));
+}
+
+static const struct virtio_config_ops virtio_mdev_config_ops = {
+	.get		= virtio_mdev_get,
+	.set		= virtio_mdev_set,
+	.generation	= virtio_mdev_generation,
+	.get_status	= virtio_mdev_get_status,
+	.set_status	= virtio_mdev_set_status,
+	.reset		= virtio_mdev_reset,
+	.find_vqs	= virtio_mdev_find_vqs,
+	.del_vqs	= virtio_mdev_del_vqs,
+	.get_features	= virtio_mdev_get_features,
+	.finalize_features = virtio_mdev_finalize_features,
+	.bus_name	= virtio_mdev_bus_name,
+};
+
+static void virtio_mdev_release_dev(struct device *_d)
+{
+	struct virtio_device *vdev =
+	       container_of(_d, struct virtio_device, dev);
+	struct virtio_mdev_device *vm_dev =
+	       container_of(vdev, struct virtio_mdev_device, vdev);
+	struct mdev_device *mdev = vm_dev->mdev;
+
+	devm_kfree(mdev_dev(mdev), vm_dev);
+}
+
+static int virtio_mdev_probe(struct device *dev)
+{
+	struct mdev_device *mdev = mdev_from_dev(dev);
+	const struct virtio_mdev_device_ops *ops = mdev_get_virtio_ops(mdev);
+	struct virtio_mdev_device *vm_dev;
+	int rc;
+
+	vm_dev = devm_kzalloc(dev, sizeof(*vm_dev), GFP_KERNEL);
+	if (!vm_dev)
+		return -ENOMEM;
+
+	vm_dev->vdev.dev.parent = dev;
+	vm_dev->vdev.dev.release = virtio_mdev_release_dev;
+	vm_dev->vdev.config = &virtio_mdev_config_ops;
+	vm_dev->mdev = mdev;
+	INIT_LIST_HEAD(&vm_dev->virtqueues);
+	spin_lock_init(&vm_dev->lock);
+
+	vm_dev->features = ops->get_mdev_features(mdev);
+	if (vm_dev->features != VIRTIO_MDEV_F_VERSION_1) {
+		dev_err(dev, "VIRTIO_MDEV_F_VERSION_1 is mandatory\n");
+		return -ENXIO;
+	}
+
+	vm_dev->vdev.id.device = ops->get_device_id(mdev);
+	if (vm_dev->vdev.id.device == 0)
+		return -ENODEV;
+
+	vm_dev->vdev.id.vendor = ops->get_vendor_id(mdev);
+	rc = register_virtio_device(&vm_dev->vdev);
+	if (rc)
+		put_device(dev);
+	else
+		dev_set_drvdata(dev, vm_dev);
+
+	return rc;
+}
+
+static void virtio_mdev_remove(struct device *dev)
+{
+	struct virtio_mdev_device *vm_dev = dev_get_drvdata(dev);
+
+	unregister_virtio_device(&vm_dev->vdev);
+}
+
+static const struct mdev_class_id virtio_id_table[] = {
+	{ MDEV_CLASS_ID_VIRTIO },
+	{ 0 },
+};
+
+MODULE_DEVICE_TABLE(mdev, virtio_id_table);
+
+static struct mdev_driver virtio_mdev_driver = {
+	.name	= "virtio_mdev",
+	.probe	= virtio_mdev_probe,
+	.remove = virtio_mdev_remove,
+	.id_table = virtio_id_table,
+};
+
+static int __init virtio_mdev_init(void)
+{
+	return mdev_register_driver(&virtio_mdev_driver, THIS_MODULE);
+}
+
+static void __exit virtio_mdev_exit(void)
+{
+	mdev_unregister_driver(&virtio_mdev_driver);
+}
+
+module_init(virtio_mdev_init)
+module_exit(virtio_mdev_exit)
+
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESC);
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
