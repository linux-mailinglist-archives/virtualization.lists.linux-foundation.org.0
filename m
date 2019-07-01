Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E255A3B193
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 11:09:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B0CC8BA9;
	Mon, 10 Jun 2019 09:09:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E058E255
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 09:09:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D45EF6D6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 09:09:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2855822386F;
	Mon, 10 Jun 2019 09:09:49 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-103.sin2.redhat.com
	[10.67.116.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA64C60C05;
	Mon, 10 Jun 2019 09:09:11 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: dm-devel@redhat.com, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-acpi@vger.kernel.org, qemu-devel@nongnu.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v11 2/7] virtio-pmem: Add virtio pmem driver
Date: Mon, 10 Jun 2019 14:37:25 +0530
Message-Id: <20190610090730.8589-3-pagupta@redhat.com>
In-Reply-To: <20190610090730.8589-1-pagupta@redhat.com>
References: <20190610090730.8589-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 10 Jun 2019 09:09:50 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pagupta@redhat.com, rdunlap@infradead.org, jack@suse.cz, snitzer@redhat.com,
	mst@redhat.com, david@fromorbit.com, lcapitulino@redhat.com,
	adilger.kernel@dilger.ca, zwisler@kernel.org,
	aarcange@redhat.com, dave.jiang@intel.com, jstaron@google.com,
	darrick.wong@oracle.com, vishal.l.verma@intel.com,
	willy@infradead.org, hch@infradead.org, jmoyer@redhat.com,
	nilal@redhat.com, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval.shaia@oracle.com, stefanha@redhat.com,
	pbonzini@redhat.com, dan.j.williams@intel.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, cohuck@redhat.com,
	rjw@rjwysocki.net, imammedo@redhat.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This patch adds virtio-pmem driver for KVM guest.

Guest reads the persistent memory range information from
Qemu over VIRTIO and registers it on nvdimm_bus. It also
creates a nd_region object with the persistent memory
range information so that existing 'nvdimm/pmem' driver
can reserve this into system memory map. This way
'virtio-pmem' driver uses existing functionality of pmem
driver to register persistent memory compatible for DAX
capable filesystems.

This also provides function to perform guest flush over
VIRTIO from 'pmem' driver when userspace performs flush
on DAX memory range.

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jakub Staron <jstaron@google.com>
Tested-by: Jakub Staron <jstaron@google.com>
---
 drivers/nvdimm/Makefile          |   1 +
 drivers/nvdimm/nd_virtio.c       | 124 +++++++++++++++++++++++++++++++
 drivers/nvdimm/virtio_pmem.c     | 122 ++++++++++++++++++++++++++++++
 drivers/nvdimm/virtio_pmem.h     |  55 ++++++++++++++
 drivers/virtio/Kconfig           |  11 +++
 include/uapi/linux/virtio_ids.h  |   1 +
 include/uapi/linux/virtio_pmem.h |  35 +++++++++
 7 files changed, 349 insertions(+)
 create mode 100644 drivers/nvdimm/nd_virtio.c
 create mode 100644 drivers/nvdimm/virtio_pmem.c
 create mode 100644 drivers/nvdimm/virtio_pmem.h
 create mode 100644 include/uapi/linux/virtio_pmem.h

diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
index 6f2a088afad6..cefe233e0b52 100644
--- a/drivers/nvdimm/Makefile
+++ b/drivers/nvdimm/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_ND_BTT) += nd_btt.o
 obj-$(CONFIG_ND_BLK) += nd_blk.o
 obj-$(CONFIG_X86_PMEM_LEGACY) += nd_e820.o
 obj-$(CONFIG_OF_PMEM) += of_pmem.o
+obj-$(CONFIG_VIRTIO_PMEM) += virtio_pmem.o nd_virtio.o
 
 nd_pmem-y := pmem.o
 
diff --git a/drivers/nvdimm/nd_virtio.c b/drivers/nvdimm/nd_virtio.c
new file mode 100644
index 000000000000..efc535723517
--- /dev/null
+++ b/drivers/nvdimm/nd_virtio.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * virtio_pmem.c: Virtio pmem Driver
+ *
+ * Discovers persistent memory range information
+ * from host and provides a virtio based flushing
+ * interface.
+ */
+#include "virtio_pmem.h"
+#include "nd.h"
+
+ /* The interrupt handler */
+void host_ack(struct virtqueue *vq)
+{
+	struct virtio_pmem *vpmem = vq->vdev->priv;
+	struct virtio_pmem_request *req_data, *req_buf;
+	unsigned long flags;
+	unsigned int len;
+
+	spin_lock_irqsave(&vpmem->pmem_lock, flags);
+	while ((req_data = virtqueue_get_buf(vq, &len)) != NULL) {
+		req_data->done = true;
+		wake_up(&req_data->host_acked);
+
+		if (!list_empty(&vpmem->req_list)) {
+			req_buf = list_first_entry(&vpmem->req_list,
+					struct virtio_pmem_request, list);
+			req_buf->wq_buf_avail = true;
+			wake_up(&req_buf->wq_buf);
+			list_del(&req_buf->list);
+		}
+	}
+	spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
+}
+EXPORT_SYMBOL_GPL(host_ack);
+
+ /* The request submission function */
+int virtio_pmem_flush(struct nd_region *nd_region)
+{
+	struct virtio_device *vdev = nd_region->provider_data;
+	struct virtio_pmem *vpmem  = vdev->priv;
+	struct virtio_pmem_request *req_data;
+	struct scatterlist *sgs[2], sg, ret;
+	unsigned long flags;
+	int err, err1;
+
+	might_sleep();
+	req_data = kmalloc(sizeof(*req_data), GFP_KERNEL);
+	if (!req_data)
+		return -ENOMEM;
+
+	req_data->done = false;
+	init_waitqueue_head(&req_data->host_acked);
+	init_waitqueue_head(&req_data->wq_buf);
+	INIT_LIST_HEAD(&req_data->list);
+	req_data->req.type = cpu_to_virtio32(vdev, VIRTIO_PMEM_REQ_TYPE_FLUSH);
+	sg_init_one(&sg, &req_data->req, sizeof(req_data->req));
+	sgs[0] = &sg;
+	sg_init_one(&ret, &req_data->resp.ret, sizeof(req_data->resp));
+	sgs[1] = &ret;
+
+	spin_lock_irqsave(&vpmem->pmem_lock, flags);
+	 /*
+	  * If virtqueue_add_sgs returns -ENOSPC then req_vq virtual
+	  * queue does not have free descriptor. We add the request
+	  * to req_list and wait for host_ack to wake us up when free
+	  * slots are available.
+	  */
+	while ((err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req_data,
+					GFP_ATOMIC)) == -ENOSPC) {
+
+		dev_err(&vdev->dev, "failed to send command to virtio pmem device, no free slots in the virtqueue\n");
+		req_data->wq_buf_avail = false;
+		list_add_tail(&req_data->list, &vpmem->req_list);
+		spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
+
+		/* A host response results in "host_ack" getting called */
+		wait_event(req_data->wq_buf, req_data->wq_buf_avail);
+		spin_lock_irqsave(&vpmem->pmem_lock, flags);
+	}
+	err1 = virtqueue_kick(vpmem->req_vq);
+	spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
+	/*
+	 * virtqueue_add_sgs failed with error different than -ENOSPC, we can't
+	 * do anything about that.
+	 */
+	if (err || !err1) {
+		dev_info(&vdev->dev, "failed to send command to virtio pmem device\n");
+		err = -EIO;
+	} else {
+		/* A host repsonse results in "host_ack" getting called */
+		wait_event(req_data->host_acked, req_data->done);
+		err = virtio32_to_cpu(vdev, req_data->resp.ret);
+	}
+
+	kfree(req_data);
+	return err;
+};
+
+/* The asynchronous flush callback function */
+int async_pmem_flush(struct nd_region *nd_region, struct bio *bio)
+{
+	/* Create child bio for asynchronous flush and chain with
+	 * parent bio. Otherwise directly call nd_region flush.
+	 */
+	if (bio && bio->bi_iter.bi_sector != -1) {
+		struct bio *child = bio_alloc(GFP_ATOMIC, 0);
+
+		if (!child)
+			return -ENOMEM;
+		bio_copy_dev(child, bio);
+		child->bi_opf = REQ_PREFLUSH;
+		child->bi_iter.bi_sector = -1;
+		bio_chain(child, bio);
+		submit_bio(child);
+		return 0;
+	}
+	if (virtio_pmem_flush(nd_region))
+		return -EIO;
+
+	return 0;
+};
+EXPORT_SYMBOL_GPL(async_pmem_flush);
+MODULE_LICENSE("GPL");
diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
new file mode 100644
index 000000000000..b60ebd8cd2fd
--- /dev/null
+++ b/drivers/nvdimm/virtio_pmem.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * virtio_pmem.c: Virtio pmem Driver
+ *
+ * Discovers persistent memory range information
+ * from host and registers the virtual pmem device
+ * with libnvdimm core.
+ */
+#include "virtio_pmem.h"
+#include "nd.h"
+
+static struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_PMEM, VIRTIO_DEV_ANY_ID },
+	{ 0 },
+};
+
+ /* Initialize virt queue */
+static int init_vq(struct virtio_pmem *vpmem)
+{
+	/* single vq */
+	vpmem->req_vq = virtio_find_single_vq(vpmem->vdev,
+						host_ack, "flush_queue");
+	if (IS_ERR(vpmem->req_vq))
+		return PTR_ERR(vpmem->req_vq);
+
+	spin_lock_init(&vpmem->pmem_lock);
+	INIT_LIST_HEAD(&vpmem->req_list);
+
+	return 0;
+};
+
+static int virtio_pmem_probe(struct virtio_device *vdev)
+{
+	struct nd_region_desc ndr_desc = {};
+	int nid = dev_to_node(&vdev->dev);
+	struct nd_region *nd_region;
+	struct virtio_pmem *vpmem;
+	struct resource res;
+	int err = 0;
+
+	if (!vdev->config->get) {
+		dev_err(&vdev->dev, "%s failure: config access disabled\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	vpmem = devm_kzalloc(&vdev->dev, sizeof(*vpmem), GFP_KERNEL);
+	if (!vpmem) {
+		err = -ENOMEM;
+		goto out_err;
+	}
+
+	vpmem->vdev = vdev;
+	vdev->priv = vpmem;
+	err = init_vq(vpmem);
+	if (err) {
+		dev_err(&vdev->dev, "failed to initialize virtio pmem vq's\n");
+		goto out_err;
+	}
+
+	virtio_cread(vpmem->vdev, struct virtio_pmem_config,
+			start, &vpmem->start);
+	virtio_cread(vpmem->vdev, struct virtio_pmem_config,
+			size, &vpmem->size);
+
+	res.start = vpmem->start;
+	res.end   = vpmem->start + vpmem->size - 1;
+	vpmem->nd_desc.provider_name = "virtio-pmem";
+	vpmem->nd_desc.module = THIS_MODULE;
+
+	vpmem->nvdimm_bus = nvdimm_bus_register(&vdev->dev,
+						&vpmem->nd_desc);
+	if (!vpmem->nvdimm_bus) {
+		dev_err(&vdev->dev, "failed to register device with nvdimm_bus\n");
+		err = -ENXIO;
+		goto out_vq;
+	}
+
+	dev_set_drvdata(&vdev->dev, vpmem->nvdimm_bus);
+
+	ndr_desc.res = &res;
+	ndr_desc.numa_node = nid;
+	ndr_desc.flush = async_pmem_flush;
+	set_bit(ND_REGION_PAGEMAP, &ndr_desc.flags);
+	set_bit(ND_REGION_ASYNC, &ndr_desc.flags);
+	nd_region = nvdimm_pmem_region_create(vpmem->nvdimm_bus, &ndr_desc);
+	if (!nd_region) {
+		dev_err(&vdev->dev, "failed to create nvdimm region\n");
+		err = -ENXIO;
+		goto out_nd;
+	}
+	nd_region->provider_data = dev_to_virtio(nd_region->dev.parent->parent);
+	return 0;
+out_nd:
+	nvdimm_bus_unregister(vpmem->nvdimm_bus);
+out_vq:
+	vdev->config->del_vqs(vdev);
+out_err:
+	return err;
+}
+
+static void virtio_pmem_remove(struct virtio_device *vdev)
+{
+	struct nvdimm_bus *nvdimm_bus = dev_get_drvdata(&vdev->dev);
+
+	nvdimm_bus_unregister(nvdimm_bus);
+	vdev->config->del_vqs(vdev);
+	vdev->config->reset(vdev);
+}
+
+static struct virtio_driver virtio_pmem_driver = {
+	.driver.name		= KBUILD_MODNAME,
+	.driver.owner		= THIS_MODULE,
+	.id_table		= id_table,
+	.probe			= virtio_pmem_probe,
+	.remove			= virtio_pmem_remove,
+};
+
+module_virtio_driver(virtio_pmem_driver);
+MODULE_DEVICE_TABLE(virtio, id_table);
+MODULE_DESCRIPTION("Virtio pmem driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/nvdimm/virtio_pmem.h b/drivers/nvdimm/virtio_pmem.h
new file mode 100644
index 000000000000..6e47521be158
--- /dev/null
+++ b/drivers/nvdimm/virtio_pmem.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * virtio_pmem.h: virtio pmem Driver
+ *
+ * Discovers persistent memory range information
+ * from host and provides a virtio based flushing
+ * interface.
+ **/
+
+#ifndef _LINUX_VIRTIO_PMEM_H
+#define _LINUX_VIRTIO_PMEM_H
+
+#include <linux/module.h>
+#include <uapi/linux/virtio_pmem.h>
+#include <linux/libnvdimm.h>
+#include <linux/spinlock.h>
+
+struct virtio_pmem_request {
+	struct virtio_pmem_req req;
+	struct virtio_pmem_resp resp;
+
+	/* Wait queue to process deferred work after ack from host */
+	wait_queue_head_t host_acked;
+	bool done;
+
+	/* Wait queue to process deferred work after virt queue buffer avail */
+	wait_queue_head_t wq_buf;
+	bool wq_buf_avail;
+	struct list_head list;
+};
+
+struct virtio_pmem {
+	struct virtio_device *vdev;
+
+	/* Virtio pmem request queue */
+	struct virtqueue *req_vq;
+
+	/* nvdimm bus registers virtio pmem device */
+	struct nvdimm_bus *nvdimm_bus;
+	struct nvdimm_bus_descriptor nd_desc;
+
+	/* List to store deferred work if virtqueue is full */
+	struct list_head req_list;
+
+	/* Synchronize virtqueue data */
+	spinlock_t pmem_lock;
+
+	/* Memory region information */
+	uint64_t start;
+	uint64_t size;
+};
+
+void host_ack(struct virtqueue *vq);
+int async_pmem_flush(struct nd_region *nd_region, struct bio *bio);
+#endif
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 35897649c24f..009278b23241 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -42,6 +42,17 @@ config VIRTIO_PCI_LEGACY
 
 	  If unsure, say Y.
 
+config VIRTIO_PMEM
+	tristate "Support for virtio pmem driver"
+	depends on VIRTIO
+	depends on LIBNVDIMM
+	help
+	  This driver provides access to virtio-pmem devices, storage devices
+	  that are mapped into the physical address space - similar to NVDIMMs
+	   - with a virtio-based flushing interface.
+
+	  If unsure, say Y.
+
 config VIRTIO_BALLOON
 	tristate "Virtio balloon driver"
 	depends on VIRTIO
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index 6d5c3b2d4f4d..32b2f94d1f58 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -43,5 +43,6 @@
 #define VIRTIO_ID_INPUT        18 /* virtio input */
 #define VIRTIO_ID_VSOCK        19 /* virtio vsock transport */
 #define VIRTIO_ID_CRYPTO       20 /* virtio crypto */
+#define VIRTIO_ID_PMEM         27 /* virtio pmem */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
diff --git a/include/uapi/linux/virtio_pmem.h b/include/uapi/linux/virtio_pmem.h
new file mode 100644
index 000000000000..7a3e2fe52415
--- /dev/null
+++ b/include/uapi/linux/virtio_pmem.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Definitions for virtio-pmem devices.
+ *
+ * Copyright (C) 2019 Red Hat, Inc.
+ *
+ * Author(s): Pankaj Gupta <pagupta@redhat.com>
+ */
+
+#ifndef _UAPI_LINUX_VIRTIO_PMEM_H
+#define _UAPI_LINUX_VIRTIO_PMEM_H
+
+#include <linux/types.h>
+#include <linux/virtio_types.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_config.h>
+
+struct virtio_pmem_config {
+	__le64 start;
+	__le64 size;
+};
+
+#define VIRTIO_PMEM_REQ_TYPE_FLUSH      0
+
+struct virtio_pmem_resp {
+	/* Host return status corresponding to flush request */
+	__virtio32 ret;
+};
+
+struct virtio_pmem_req {
+	/* command type */
+	__virtio32 type;
+};
+
+#endif
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
