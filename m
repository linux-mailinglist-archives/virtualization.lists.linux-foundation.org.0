Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DC7156E42
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 05:01:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 00CDB8734E;
	Mon, 10 Feb 2020 04:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E+kwexj1xzPO; Mon, 10 Feb 2020 04:01:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DCB5B862B7;
	Mon, 10 Feb 2020 04:01:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6497C0171;
	Mon, 10 Feb 2020 04:01:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5478DC0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 04:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 40AD685ECB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 04:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoCnNZaKnMaj
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 04:01:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D442485B48
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 04:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581307311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/WUSss28k1zXPtrvX7+juH17o1JUa0tz8B/5GaiG18=;
 b=QtT63y/gIOKgITrYygUqD/ZKplxo9+a15Eprl7UO+VZK2chfY7VR1PaYQoljBSKbujJCOC
 ABnY2XcnFhdl/JF+8fvo+zxmd8xzLFJeRUmNHU/oHJ+4kBSPmy9iIoSiOfW5vm7CZIdimo
 xzsNU/BI5zjyiLpUxHoLKpGyD1eE0ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-3xRfERGJM96D1DsmyiE9tQ-1; Sun, 09 Feb 2020 23:01:49 -0500
X-MC-Unique: 3xRfERGJM96D1DsmyiE9tQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC2BF8017CC;
 Mon, 10 Feb 2020 04:01:46 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-219.pek2.redhat.com [10.72.13.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F958101D481;
 Mon, 10 Feb 2020 04:00:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [PATCH V2 4/5] virtio: introduce a vDPA based transport
Date: Mon, 10 Feb 2020 11:56:07 +0800
Message-Id: <20200210035608.10002-5-jasowang@redhat.com>
In-Reply-To: <20200210035608.10002-1-jasowang@redhat.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

This patch introduces a vDPA transport for virtio. This is used to
use kernel virtio driver to drive the mediated device that is capable
of populating virtqueue directly.

A new virtio-vdpa driver will be registered to the vDPA bus, when a
new virtio-vdpa device is probed, it will register the device with
vdpa based config ops. This means it is a software transport between
vDPA driver and vDPA device. The transport was implemented through
bus_ops of vDPA parent.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/Kconfig       |  13 ++
 drivers/virtio/Makefile      |   1 +
 drivers/virtio/virtio_vdpa.c | 392 +++++++++++++++++++++++++++++++++++
 3 files changed, 406 insertions(+)
 create mode 100644 drivers/virtio/virtio_vdpa.c

diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 9c4fdb64d9ac..0df3676b0f4f 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -43,6 +43,19 @@ config VIRTIO_PCI_LEGACY
 
 	  If unsure, say Y.
 
+config VIRTIO_VDPA
+	tristate "vDPA driver for virtio devices"
+        select VDPA
+        select VIRTIO
+	help
+	  This driver provides support for virtio based paravirtual
+	  device driver over vDPA bus. For this to be useful, you need
+	  an appropriate vDPA device implementation that operates on a
+          physical device to allow the datapath of virtio to be
+	  offloaded to hardware.
+
+	  If unsure, say M.
+
 config VIRTIO_PMEM
 	tristate "Support for virtio pmem driver"
 	depends on VIRTIO
diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index fdf5eacd0d0a..3407ac03fe60 100644
--- a/drivers/virtio/Makefile
+++ b/drivers/virtio/Makefile
@@ -6,4 +6,5 @@ virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
 virtio_pci-$(CONFIG_VIRTIO_PCI_LEGACY) += virtio_pci_legacy.o
 obj-$(CONFIG_VIRTIO_BALLOON) += virtio_balloon.o
 obj-$(CONFIG_VIRTIO_INPUT) += virtio_input.o
+obj-$(CONFIG_VIRTIO_VDPA) += virtio_vdpa.o
 obj-$(CONFIG_VDPA) += vdpa/
diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
new file mode 100644
index 000000000000..077796087abf
--- /dev/null
+++ b/drivers/virtio/virtio_vdpa.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * VIRTIO based driver for vDPA device
+ *
+ * Copyright (c) 2020, Red Hat. All rights reserved.
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
+#include <linux/virtio.h>
+#include <linux/vdpa.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_ring.h>
+
+#define MOD_VERSION  "0.1"
+#define MOD_AUTHOR   "Jason Wang <jasowang@redhat.com>"
+#define MOD_DESC     "vDPA bus driver for virtio devices"
+#define MOD_LICENSE  "GPL v2"
+
+struct virtio_vdpa_device {
+	struct virtio_device vdev;
+	struct vdpa_device *vdpa;
+	u64 features;
+
+	/* The lock to protect virtqueue list */
+	spinlock_t lock;
+	/* List of virtio_vdpa_vq_info */
+	struct list_head virtqueues;
+};
+
+struct virtio_vdpa_vq_info {
+	/* the actual virtqueue */
+	struct virtqueue *vq;
+
+	/* the list node for the virtqueues list */
+	struct list_head node;
+};
+
+static inline struct virtio_vdpa_device *
+to_virtio_vdpa_device(struct virtio_device *dev)
+{
+	return container_of(dev, struct virtio_vdpa_device, vdev);
+}
+
+static struct vdpa_device *vd_get_vdpa(struct virtio_device *vdev)
+{
+	return to_virtio_vdpa_device(vdev)->vdpa;
+}
+
+static void virtio_vdpa_get(struct virtio_device *vdev, unsigned offset,
+			    void *buf, unsigned len)
+{
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	ops->get_config(vdpa, offset, buf, len);
+}
+
+static void virtio_vdpa_set(struct virtio_device *vdev, unsigned offset,
+			    const void *buf, unsigned len)
+{
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	ops->set_config(vdpa, offset, buf, len);
+}
+
+static u32 virtio_vdpa_generation(struct virtio_device *vdev)
+{
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	if (ops->get_generation)
+		return ops->get_generation(vdpa);
+
+	return 0;
+}
+
+static u8 virtio_vdpa_get_status(struct virtio_device *vdev)
+{
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	return ops->get_status(vdpa);
+}
+
+static void virtio_vdpa_set_status(struct virtio_device *vdev, u8 status)
+{
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	return ops->set_status(vdpa, status);
+}
+
+static void virtio_vdpa_reset(struct virtio_device *vdev)
+{
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	return ops->set_status(vdpa, 0);
+}
+
+static bool virtio_vdpa_notify(struct virtqueue *vq)
+{
+	struct vdpa_device *vdpa = vd_get_vdpa(vq->vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	ops->kick_vq(vdpa, vq->index);
+
+	return true;
+}
+
+static irqreturn_t virtio_vdpa_config_cb(void *private)
+{
+	struct virtio_vdpa_device *vd_dev = private;
+
+	virtio_config_changed(&vd_dev->vdev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t virtio_vdpa_virtqueue_cb(void *private)
+{
+	struct virtio_vdpa_vq_info *info = private;
+
+	return vring_interrupt(0, info->vq);
+}
+
+static struct virtqueue *
+virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
+		     void (*callback)(struct virtqueue *vq),
+		     const char *name, bool ctx)
+{
+	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+	struct virtio_vdpa_vq_info *info;
+	struct vdpa_callback cb;
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
+	if (ops->get_vq_ready(vdpa, index))
+		return ERR_PTR(-ENOENT);
+
+	/* Allocate and fill out our active queue description */
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	num = ops->get_vq_num_max(vdpa);
+	if (num == 0) {
+		err = -ENOENT;
+		goto error_new_virtqueue;
+	}
+
+	/* Create the vring */
+	align = ops->get_vq_align(vdpa);
+	vq = vring_create_virtqueue(index, num, align, vdev,
+				    true, true, ctx,
+				    virtio_vdpa_notify, callback, name);
+	if (!vq) {
+		err = -ENOMEM;
+		goto error_new_virtqueue;
+	}
+
+	/* Setup virtqueue callback */
+	cb.callback = virtio_vdpa_virtqueue_cb;
+	cb.private = info;
+	ops->set_vq_cb(vdpa, index, &cb);
+	ops->set_vq_num(vdpa, index, virtqueue_get_vring_size(vq));
+
+	desc_addr = virtqueue_get_desc_addr(vq);
+	driver_addr = virtqueue_get_avail_addr(vq);
+	device_addr = virtqueue_get_used_addr(vq);
+
+	if (ops->set_vq_address(vdpa, index,
+				desc_addr, driver_addr,
+				device_addr)) {
+		err = -EINVAL;
+		goto err_vq;
+	}
+
+	ops->set_vq_ready(vdpa, index, 1);
+
+	vq->priv = info;
+	info->vq = vq;
+
+	spin_lock_irqsave(&vd_dev->lock, flags);
+	list_add(&info->node, &vd_dev->virtqueues);
+	spin_unlock_irqrestore(&vd_dev->lock, flags);
+
+	return vq;
+
+err_vq:
+	vring_del_virtqueue(vq);
+error_new_virtqueue:
+	ops->set_vq_ready(vdpa, index, 0);
+	/* VDPA driver should make sure vq is stopeed here */
+	WARN_ON(ops->get_vq_ready(vdpa, index));
+	kfree(info);
+	return ERR_PTR(err);
+}
+
+static void virtio_vdpa_del_vq(struct virtqueue *vq)
+{
+	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vq->vdev);
+	struct vdpa_device *vdpa = vd_dev->vdpa;
+	const struct vdpa_config_ops *ops = vdpa->config;
+	struct virtio_vdpa_vq_info *info = vq->priv;
+	unsigned int index = vq->index;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vd_dev->lock, flags);
+	list_del(&info->node);
+	spin_unlock_irqrestore(&vd_dev->lock, flags);
+
+	/* Select and deactivate the queue */
+	ops->set_vq_ready(vdpa, index, 0);
+	WARN_ON(ops->get_vq_ready(vdpa, index));
+
+	vring_del_virtqueue(vq);
+
+	kfree(info);
+}
+
+static void virtio_vdpa_del_vqs(struct virtio_device *vdev)
+{
+	struct virtqueue *vq, *n;
+
+	list_for_each_entry_safe(vq, n, &vdev->vqs, list)
+		virtio_vdpa_del_vq(vq);
+}
+
+static int virtio_vdpa_find_vqs(struct virtio_device *vdev, unsigned nvqs,
+				struct virtqueue *vqs[],
+				vq_callback_t *callbacks[],
+				const char * const names[],
+				const bool *ctx,
+				struct irq_affinity *desc)
+{
+	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+	struct vdpa_callback cb;
+	int i, err, queue_idx = 0;
+
+	for (i = 0; i < nvqs; ++i) {
+		if (!names[i]) {
+			vqs[i] = NULL;
+			continue;
+		}
+
+		vqs[i] = virtio_vdpa_setup_vq(vdev, queue_idx++,
+					      callbacks[i], names[i], ctx ?
+					      ctx[i] : false);
+		if (IS_ERR(vqs[i])) {
+			err = PTR_ERR(vqs[i]);
+			goto err_setup_vq;
+		}
+	}
+
+	cb.callback = virtio_vdpa_config_cb;
+	cb.private = vd_dev;
+	ops->set_config_cb(vdpa, &cb);
+
+	return 0;
+
+err_setup_vq:
+	virtio_vdpa_del_vqs(vdev);
+	return err;
+}
+
+static u64 virtio_vdpa_get_features(struct virtio_device *vdev)
+{
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	return ops->get_features(vdpa);
+}
+
+static int virtio_vdpa_finalize_features(struct virtio_device *vdev)
+{
+	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
+	const struct vdpa_config_ops *ops = vdpa->config;
+
+	/* Give virtio_ring a chance to accept features. */
+	vring_transport_features(vdev);
+
+	return ops->set_features(vdpa, vdev->features);
+}
+
+static const char *virtio_vdpa_bus_name(struct virtio_device *vdev)
+{
+	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
+	struct vdpa_device *vdpa = vd_dev->vdpa;
+
+	return dev_name(&vdpa->dev);
+}
+
+static const struct virtio_config_ops virtio_vdpa_config_ops = {
+	.get		= virtio_vdpa_get,
+	.set		= virtio_vdpa_set,
+	.generation	= virtio_vdpa_generation,
+	.get_status	= virtio_vdpa_get_status,
+	.set_status	= virtio_vdpa_set_status,
+	.reset		= virtio_vdpa_reset,
+	.find_vqs	= virtio_vdpa_find_vqs,
+	.del_vqs	= virtio_vdpa_del_vqs,
+	.get_features	= virtio_vdpa_get_features,
+	.finalize_features = virtio_vdpa_finalize_features,
+	.bus_name	= virtio_vdpa_bus_name,
+};
+
+static void virtio_vdpa_release_dev(struct device *_d)
+{
+	struct virtio_device *vdev =
+	       container_of(_d, struct virtio_device, dev);
+	struct virtio_vdpa_device *vd_dev =
+	       container_of(vdev, struct virtio_vdpa_device, vdev);
+
+	kfree(vd_dev);
+}
+
+static int virtio_vdpa_probe(struct vdpa_device *vdpa)
+{
+	const struct vdpa_config_ops *ops = vdpa->config;
+	struct virtio_vdpa_device *vd_dev;
+	int ret = -EINVAL;
+
+	vd_dev = kzalloc(sizeof(*vd_dev), GFP_KERNEL);
+	if (!vd_dev)
+		return -ENOMEM;
+
+	vd_dev->vdev.dev.parent = vdpa_get_dma_dev(vdpa);
+	vd_dev->vdev.dev.release = virtio_vdpa_release_dev;
+	vd_dev->vdev.config = &virtio_vdpa_config_ops;
+	vd_dev->vdpa = vdpa;
+	INIT_LIST_HEAD(&vd_dev->virtqueues);
+	spin_lock_init(&vd_dev->lock);
+
+	vd_dev->vdev.id.device = ops->get_device_id(vdpa);
+	if (vd_dev->vdev.id.device == 0)
+		goto err;
+
+	vd_dev->vdev.id.vendor = ops->get_vendor_id(vdpa);
+	ret = register_virtio_device(&vd_dev->vdev);
+	if (ret)
+		goto err;
+
+	vdpa_set_drvdata(vdpa, vd_dev);
+
+	return 0;
+
+err:
+	kfree(vd_dev);
+	return ret;
+}
+
+static void virtio_vdpa_remove(struct vdpa_device *vdpa)
+{
+	struct virtio_vdpa_device *vd_dev = vdpa_get_drvdata(vdpa);
+
+	unregister_virtio_device(&vd_dev->vdev);
+}
+
+static struct vdpa_driver virtio_vdpa_driver = {
+	.driver = {
+		.name	= "virtio_vdpa",
+	},
+	.probe	= virtio_vdpa_probe,
+	.remove = virtio_vdpa_remove,
+};
+
+module_vdpa_driver(virtio_vdpa_driver);
+
+MODULE_VERSION(MOD_VERSION);
+MODULE_LICENSE(MOD_LICENSE);
+MODULE_AUTHOR(MOD_AUTHOR);
+MODULE_DESCRIPTION(MOD_DESC);
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
