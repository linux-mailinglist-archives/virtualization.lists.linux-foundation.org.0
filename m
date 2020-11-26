Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 786CD2C577C
	for <lists.virtualization@lfdr.de>; Thu, 26 Nov 2020 15:52:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34F2B878D7;
	Thu, 26 Nov 2020 14:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5xhYD1SMKip; Thu, 26 Nov 2020 14:52:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 05DFC878D1;
	Thu, 26 Nov 2020 14:52:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFD73C0052;
	Thu, 26 Nov 2020 14:52:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2996EC0052
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 18550878D1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ff6xgAwsyVDS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:52:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 90EEC875AF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606402353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEJNulm7wQG26FPbA36aIrjslRwp7UCFRBagPNw/tjE=;
 b=H7vgybaBdc3yoZSEX6Cpyanl4afcLgJqG/BmHzJ7xwksJPl48SMPmK0rwpcBHIy7nIPRzA
 ln9jnPY5Q9JNOYGv9GO6crMA3e6jP+R0oN0ItMhsF1h89cV7H4GjRY/Wnr8Tg3ykEf57nt
 JPoIdPgXox7f4JboPsgLw6tAGHOjWH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-UKBq6K4mNnOqSp212Sctiw-1; Thu, 26 Nov 2020 09:52:30 -0500
X-MC-Unique: UKBq6K4mNnOqSp212Sctiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75A2C8042C8;
 Thu, 26 Nov 2020 14:52:29 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-252.ams2.redhat.com
 [10.36.113.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 473AC10023B1;
 Thu, 26 Nov 2020 14:52:27 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2 17/17] vdpa: split vdpasim to core and net modules
Date: Thu, 26 Nov 2020 15:49:50 +0100
Message-Id: <20201126144950.92850-18-sgarzare@redhat.com>
In-Reply-To: <20201126144950.92850-1-sgarzare@redhat.com>
References: <20201126144950.92850-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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

From: Max Gurtovoy <mgurtovoy@nvidia.com>

Introduce new vdpa_sim_net and vdpa_sim (core) drivers. This is a
preparation for adding a vdpa simulator module for block devices.

Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
[sgarzare: various cleanups/fixes]
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
- Fixed "warning: variable 'dev' is used uninitialized" reported by
  'kernel test robot' and Dan Carpenter
- rebased on top of other changes (dev_attr, get_config(), notify(), etc.)
- left batch_mapping module parameter in the core [Jason]

v1:
- Removed unused headers
- Removed empty module_init() module_exit()
- Moved vdpasim_is_little_endian() in vdpa_sim.h
- Moved vdpasim16_to_cpu/cpu_to_vdpasim16() in vdpa_sim.h
- Added vdpasim*_to_cpu/cpu_to_vdpasim*() also for 32 and 64
- Replaced 'select VDPA_SIM' with 'depends on VDPA_SIM' since selected
  option can not depend on other [Jason]
---
 drivers/vdpa/vdpa_sim/vdpa_sim.h     | 103 +++++++++++++
 drivers/vdpa/vdpa_sim/vdpa_sim.c     | 222 +--------------------------
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c | 171 +++++++++++++++++++++
 drivers/vdpa/Kconfig                 |  13 +-
 drivers/vdpa/vdpa_sim/Makefile       |   1 +
 5 files changed, 290 insertions(+), 220 deletions(-)
 create mode 100644 drivers/vdpa/vdpa_sim/vdpa_sim.h
 create mode 100644 drivers/vdpa/vdpa_sim/vdpa_sim_net.c

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.h b/drivers/vdpa/vdpa_sim/vdpa_sim.h
new file mode 100644
index 000000000000..1662f3bf3eac
--- /dev/null
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020, Red Hat Inc. All rights reserved.
+ */
+
+#ifndef _VDPA_SIM_H
+#define _VDPA_SIM_H
+
+#include <linux/vringh.h>
+#include <linux/vdpa.h>
+#include <linux/vhost_iotlb.h>
+#include <uapi/linux/virtio_config.h>
+
+#define VDPASIM_FEATURES	((1ULL << VIRTIO_F_ANY_LAYOUT) | \
+				 (1ULL << VIRTIO_F_VERSION_1)  | \
+				 (1ULL << VIRTIO_F_ACCESS_PLATFORM))
+
+struct vdpasim;
+
+struct vdpasim_virtqueue {
+	struct vringh vring;
+	struct vringh_kiov in_iov;
+	struct vringh_kiov out_iov;
+	unsigned short head;
+	bool ready;
+	u64 desc_addr;
+	u64 device_addr;
+	u64 driver_addr;
+	u32 num;
+	void *private;
+	irqreturn_t (*cb)(void *data);
+};
+
+struct vdpasim_dev_attr {
+	u64 supported_features;
+	size_t config_size;
+	size_t buffer_size;
+	int nvqs;
+	u32 id;
+
+	work_func_t work_fn;
+	void (*get_config)(struct vdpasim *vdpasim, void *config);
+};
+
+/* State of each vdpasim device */
+struct vdpasim {
+	struct vdpa_device vdpa;
+	struct vdpasim_virtqueue *vqs;
+	struct work_struct work;
+	struct vdpasim_dev_attr dev_attr;
+	/* spinlock to synchronize virtqueue state */
+	spinlock_t lock;
+	/* virtio config according to device type */
+	void *config;
+	struct vhost_iotlb *iommu;
+	void *buffer;
+	u32 status;
+	u32 generation;
+	u64 features;
+	/* spinlock to synchronize iommu table */
+	spinlock_t iommu_lock;
+};
+
+struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *attr);
+
+/* TODO: cross-endian support */
+static inline bool vdpasim_is_little_endian(struct vdpasim *vdpasim)
+{
+	return virtio_legacy_is_little_endian() ||
+		(vdpasim->features & (1ULL << VIRTIO_F_VERSION_1));
+}
+
+static inline u16 vdpasim16_to_cpu(struct vdpasim *vdpasim, __virtio16 val)
+{
+	return __virtio16_to_cpu(vdpasim_is_little_endian(vdpasim), val);
+}
+
+static inline __virtio16 cpu_to_vdpasim16(struct vdpasim *vdpasim, u16 val)
+{
+	return __cpu_to_virtio16(vdpasim_is_little_endian(vdpasim), val);
+}
+
+static inline u32 vdpasim32_to_cpu(struct vdpasim *vdpasim, __virtio32 val)
+{
+	return __virtio32_to_cpu(vdpasim_is_little_endian(vdpasim), val);
+}
+
+static inline __virtio32 cpu_to_vdpasim32(struct vdpasim *vdpasim, u32 val)
+{
+	return __cpu_to_virtio32(vdpasim_is_little_endian(vdpasim), val);
+}
+
+static inline u64 vdpasim64_to_cpu(struct vdpasim *vdpasim, __virtio64 val)
+{
+	return __virtio64_to_cpu(vdpasim_is_little_endian(vdpasim), val);
+}
+
+static inline __virtio64 cpu_to_vdpasim64(struct vdpasim *vdpasim, u64 val)
+{
+	return __cpu_to_virtio64(vdpasim_is_little_endian(vdpasim), val);
+}
+
+#endif
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index f8ee261ef4ae..cbdd419de1ef 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * VDPA networking device simulator.
+ * VDPA device simulator core.
  *
  * Copyright (c) 2020, Red Hat Inc. All rights reserved.
  *     Author: Jason Wang <jasowang@redhat.com>
@@ -9,106 +9,22 @@
 
 #include <linux/module.h>
 #include <linux/dma-map-ops.h>
-#include <linux/etherdevice.h>
-#include <linux/vringh.h>
-#include <linux/vdpa.h>
-#include <linux/vhost_iotlb.h>
-#include <uapi/linux/virtio_config.h>
-#include <uapi/linux/virtio_net.h>
+
+#include "vdpa_sim.h"
 
 #define DRV_VERSION  "0.1"
 #define DRV_AUTHOR   "Jason Wang <jasowang@redhat.com>"
-#define DRV_DESC     "vDPA Device Simulator"
+#define DRV_DESC     "vDPA Device Simulator core"
 #define DRV_LICENSE  "GPL v2"
 
 static int batch_mapping = 1;
 module_param(batch_mapping, int, 0444);
 MODULE_PARM_DESC(batch_mapping, "Batched mapping 1 -Enable; 0 - Disable");
 
-static char *macaddr;
-module_param(macaddr, charp, 0);
-MODULE_PARM_DESC(macaddr, "Ethernet MAC address");
-
-u8 macaddr_buf[ETH_ALEN];
-
-struct vdpasim_virtqueue {
-	struct vringh vring;
-	struct vringh_kiov in_iov;
-	struct vringh_kiov out_iov;
-	unsigned short head;
-	bool ready;
-	u64 desc_addr;
-	u64 device_addr;
-	u64 driver_addr;
-	u32 num;
-	void *private;
-	irqreturn_t (*cb)(void *data);
-};
-
 #define VDPASIM_QUEUE_ALIGN PAGE_SIZE
 #define VDPASIM_QUEUE_MAX 256
 #define VDPASIM_VENDOR_ID 0
 #define VDPASIM_IOTLB_LIMIT 0 /* unlimited */
-#define VDPASIM_VQ_NUM 0x2
-#define VDPASIM_NAME "vdpasim-netdev"
-
-#define VDPASIM_FEATURES	((1ULL << VIRTIO_F_ANY_LAYOUT) | \
-				 (1ULL << VIRTIO_F_VERSION_1)  | \
-				 (1ULL << VIRTIO_F_ACCESS_PLATFORM))
-
-#define VDPASIM_NET_FEATURES	(VDPASIM_FEATURES | \
-				 (1ULL << VIRTIO_NET_F_MAC))
-
-struct vdpasim;
-
-struct vdpasim_dev_attr {
-	u64 supported_features;
-	size_t config_size;
-	size_t buffer_size;
-	int nvqs;
-	u32 id;
-
-	work_func_t work_fn;
-	void (*get_config)(struct vdpasim *vdpasim, void *config);
-};
-
-/* State of each vdpasim device */
-struct vdpasim {
-	struct vdpa_device vdpa;
-	struct vdpasim_virtqueue *vqs;
-	struct work_struct work;
-	struct vdpasim_dev_attr dev_attr;
-	/* spinlock to synchronize virtqueue state */
-	spinlock_t lock;
-	/* virtio config according to device type */
-	void *config;
-	struct vhost_iotlb *iommu;
-	void *buffer;
-	u32 status;
-	u32 generation;
-	u64 features;
-	/* spinlock to synchronize iommu table */
-	spinlock_t iommu_lock;
-};
-
-/* TODO: cross-endian support */
-static inline bool vdpasim_is_little_endian(struct vdpasim *vdpasim)
-{
-	return virtio_legacy_is_little_endian() ||
-		(vdpasim->features & (1ULL << VIRTIO_F_VERSION_1));
-}
-
-static inline u16 vdpasim16_to_cpu(struct vdpasim *vdpasim, __virtio16 val)
-{
-	return __virtio16_to_cpu(vdpasim_is_little_endian(vdpasim), val);
-}
-
-static inline __virtio16 cpu_to_vdpasim16(struct vdpasim *vdpasim, u16 val)
-{
-	return __cpu_to_virtio16(vdpasim_is_little_endian(vdpasim), val);
-}
-
-static struct vdpasim *vdpasim_dev;
 
 static struct vdpasim *vdpa_to_sim(struct vdpa_device *vdpa)
 {
@@ -177,80 +93,6 @@ static void vdpasim_reset(struct vdpasim *vdpasim)
 	++vdpasim->generation;
 }
 
-static void vdpasim_net_work(struct work_struct *work)
-{
-	struct vdpasim *vdpasim = container_of(work, struct
-						 vdpasim, work);
-	struct vdpasim_virtqueue *txq = &vdpasim->vqs[1];
-	struct vdpasim_virtqueue *rxq = &vdpasim->vqs[0];
-	ssize_t read, write;
-	size_t total_write;
-	int pkts = 0;
-	int err;
-
-	spin_lock(&vdpasim->lock);
-
-	if (!(vdpasim->status & VIRTIO_CONFIG_S_DRIVER_OK))
-		goto out;
-
-	if (!txq->ready || !rxq->ready)
-		goto out;
-
-	while (true) {
-		total_write = 0;
-		err = vringh_getdesc_iotlb(&txq->vring, &txq->out_iov, NULL,
-					   &txq->head, GFP_ATOMIC);
-		if (err <= 0)
-			break;
-
-		err = vringh_getdesc_iotlb(&rxq->vring, NULL, &rxq->in_iov,
-					   &rxq->head, GFP_ATOMIC);
-		if (err <= 0) {
-			vringh_complete_iotlb(&txq->vring, txq->head, 0);
-			break;
-		}
-
-		while (true) {
-			read = vringh_iov_pull_iotlb(&txq->vring, &txq->out_iov,
-						     vdpasim->buffer,
-						     PAGE_SIZE);
-			if (read <= 0)
-				break;
-
-			write = vringh_iov_push_iotlb(&rxq->vring, &rxq->in_iov,
-						      vdpasim->buffer, read);
-			if (write <= 0)
-				break;
-
-			total_write += write;
-		}
-
-		/* Make sure data is wrote before advancing index */
-		smp_wmb();
-
-		vringh_complete_iotlb(&txq->vring, txq->head, 0);
-		vringh_complete_iotlb(&rxq->vring, rxq->head, total_write);
-
-		/* Make sure used is visible before rasing the interrupt. */
-		smp_wmb();
-
-		local_bh_disable();
-		if (vringh_need_notify_iotlb(&txq->vring) > 0)
-			vringh_notify(&txq->vring);
-		if (vringh_need_notify_iotlb(&rxq->vring) > 0)
-			vringh_notify(&rxq->vring);
-		local_bh_enable();
-
-		if (++pkts > 4) {
-			schedule_work(&vdpasim->work);
-			goto out;
-		}
-	}
-
-out:
-	spin_unlock(&vdpasim->lock);
-}
-
 static int dir_to_perm(enum dma_data_direction dir)
 {
 	int perm = -EFAULT;
@@ -366,7 +208,7 @@ static const struct dma_map_ops vdpasim_dma_ops = {
 static const struct vdpa_config_ops vdpasim_config_ops;
 static const struct vdpa_config_ops vdpasim_batch_config_ops;
 
-static struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr)
+struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr)
 {
 	const struct vdpa_config_ops *ops;
 	struct vdpasim *vdpasim;
@@ -411,23 +253,10 @@ static struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr)
 	if (!vdpasim->buffer)
 		goto err_iommu;
 
-	if (macaddr) {
-		mac_pton(macaddr, macaddr_buf);
-		if (!is_valid_ether_addr(macaddr_buf)) {
-			ret = -EADDRNOTAVAIL;
-			goto err_iommu;
-		}
-	} else {
-		eth_random_addr(macaddr_buf);
-	}
-
 	for (i = 0; i < dev_attr->nvqs; i++)
 		vringh_set_iotlb(&vdpasim->vqs[i].vring, vdpasim->iommu);
 
 	vdpasim->vdpa.dma_dev = dev;
-	ret = vdpa_register_device(&vdpasim->vdpa);
-	if (ret)
-		goto err_iommu;
 
 	return vdpasim;
 
@@ -436,6 +265,7 @@ static struct vdpasim *vdpasim_create(struct vdpasim_dev_attr *dev_attr)
 err_alloc:
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(vdpasim_create);
 
 static int vdpasim_set_vq_address(struct vdpa_device *vdpa, u16 idx,
 				  u64 desc_area, u64 driver_area,
@@ -748,46 +578,6 @@ static const struct vdpa_config_ops vdpasim_batch_config_ops = {
 	.free                   = vdpasim_free,
 };
 
-static void vdpasim_net_get_config(struct vdpasim *vdpasim, void *config)
-{
-	struct virtio_net_config *net_config =
-		(struct virtio_net_config *)config;
-
-	net_config->mtu = cpu_to_vdpasim16(vdpasim, 1500);
-	net_config->status = cpu_to_vdpasim16(vdpasim, VIRTIO_NET_S_LINK_UP);
-	memcpy(net_config->mac, macaddr_buf, ETH_ALEN);
-}
-
-static int __init vdpasim_dev_init(void)
-{
-	struct vdpasim_dev_attr dev_attr = {};
-
-	dev_attr.id = VIRTIO_ID_NET;
-	dev_attr.supported_features = VDPASIM_NET_FEATURES;
-	dev_attr.nvqs = VDPASIM_VQ_NUM;
-	dev_attr.config_size = sizeof(struct virtio_net_config);
-	dev_attr.get_config = vdpasim_net_get_config;
-	dev_attr.work_fn = vdpasim_net_work;
-	dev_attr.buffer_size = PAGE_SIZE;
-
-	vdpasim_dev = vdpasim_create(&dev_attr);
-
-	if (!IS_ERR(vdpasim_dev))
-		return 0;
-
-	return PTR_ERR(vdpasim_dev);
-}
-
-static void __exit vdpasim_dev_exit(void)
-{
-	struct vdpa_device *vdpa = &vdpasim_dev->vdpa;
-
-	vdpa_unregister_device(vdpa);
-}
-
-module_init(vdpasim_dev_init)
-module_exit(vdpasim_dev_exit)
-
 MODULE_VERSION(DRV_VERSION);
 MODULE_LICENSE(DRV_LICENSE);
 MODULE_AUTHOR(DRV_AUTHOR);
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
new file mode 100644
index 000000000000..d278f6bd34ac
--- /dev/null
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * VDPA simulator for networking device.
+ *
+ * Copyright (c) 2020, Red Hat Inc. All rights reserved.
+ *     Author: Jason Wang <jasowang@redhat.com>
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/etherdevice.h>
+#include <uapi/linux/virtio_net.h>
+
+#include "vdpa_sim.h"
+
+#define DRV_VERSION  "0.1"
+#define DRV_AUTHOR   "Jason Wang <jasowang@redhat.com>"
+#define DRV_DESC     "vDPA Device Simulator for networking device"
+#define DRV_LICENSE  "GPL v2"
+
+#define VDPASIM_NET_FEATURES	(VDPASIM_FEATURES | \
+				 (1ULL << VIRTIO_NET_F_MAC))
+
+#define VDPASIM_NET_VQ_NUM	2
+
+static char *macaddr;
+module_param(macaddr, charp, 0);
+MODULE_PARM_DESC(macaddr, "Ethernet MAC address");
+
+u8 macaddr_buf[ETH_ALEN];
+
+static struct vdpasim *vdpasim_net_dev;
+
+static void vdpasim_net_work(struct work_struct *work)
+{
+	struct vdpasim *vdpasim = container_of(work, struct vdpasim, work);
+	struct vdpasim_virtqueue *txq = &vdpasim->vqs[1];
+	struct vdpasim_virtqueue *rxq = &vdpasim->vqs[0];
+	ssize_t read, write;
+	size_t total_write;
+	int pkts = 0;
+	int err;
+
+	spin_lock(&vdpasim->lock);
+
+	if (!(vdpasim->status & VIRTIO_CONFIG_S_DRIVER_OK))
+		goto out;
+
+	if (!txq->ready || !rxq->ready)
+		goto out;
+
+	while (true) {
+		total_write = 0;
+		err = vringh_getdesc_iotlb(&txq->vring, &txq->out_iov, NULL,
+					   &txq->head, GFP_ATOMIC);
+		if (err <= 0)
+			break;
+
+		err = vringh_getdesc_iotlb(&rxq->vring, NULL, &rxq->in_iov,
+					   &rxq->head, GFP_ATOMIC);
+		if (err <= 0) {
+			vringh_complete_iotlb(&txq->vring, txq->head, 0);
+			break;
+		}
+
+		while (true) {
+			read = vringh_iov_pull_iotlb(&txq->vring, &txq->out_iov,
+						     vdpasim->buffer,
+						     PAGE_SIZE);
+			if (read <= 0)
+				break;
+
+			write = vringh_iov_push_iotlb(&rxq->vring, &rxq->in_iov,
+						      vdpasim->buffer, read);
+			if (write <= 0)
+				break;
+
+			total_write += write;
+		}
+
+		/* Make sure data is wrote before advancing index */
+		smp_wmb();
+
+		vringh_complete_iotlb(&txq->vring, txq->head, 0);
+		vringh_complete_iotlb(&rxq->vring, rxq->head, total_write);
+
+		/* Make sure used is visible before rasing the interrupt. */
+		smp_wmb();
+
+		local_bh_disable();
+		if (vringh_need_notify_iotlb(&txq->vring) > 0)
+			vringh_notify(&txq->vring);
+		if (vringh_need_notify_iotlb(&rxq->vring) > 0)
+			vringh_notify(&rxq->vring);
+		local_bh_enable();
+
+		if (++pkts > 4) {
+			schedule_work(&vdpasim->work);
+			goto out;
+		}
+	}
+
+out:
+	spin_unlock(&vdpasim->lock);
+}
+
+static void vdpasim_net_get_config(struct vdpasim *vdpasim, void *config)
+{
+	struct virtio_net_config *net_config =
+		(struct virtio_net_config *)config;
+
+	net_config->mtu = cpu_to_vdpasim16(vdpasim, 1500);
+	net_config->status = cpu_to_vdpasim16(vdpasim, VIRTIO_NET_S_LINK_UP);
+	memcpy(net_config->mac, macaddr_buf, ETH_ALEN);
+}
+
+static int __init vdpasim_net_init(void)
+{
+	struct vdpasim_dev_attr dev_attr = {};
+	int ret;
+
+	if (macaddr) {
+		mac_pton(macaddr, macaddr_buf);
+		if (!is_valid_ether_addr(macaddr_buf)) {
+			ret = -EADDRNOTAVAIL;
+			goto out;
+		}
+	} else {
+		eth_random_addr(macaddr_buf);
+	}
+
+	dev_attr.id = VIRTIO_ID_NET;
+	dev_attr.supported_features = VDPASIM_NET_FEATURES;
+	dev_attr.nvqs = VDPASIM_NET_VQ_NUM;
+	dev_attr.config_size = sizeof(struct virtio_net_config);
+	dev_attr.get_config = vdpasim_net_get_config;
+	dev_attr.work_fn = vdpasim_net_work;
+	dev_attr.buffer_size = PAGE_SIZE;
+
+	vdpasim_net_dev = vdpasim_create(&dev_attr);
+	if (IS_ERR(vdpasim_net_dev)) {
+		ret = PTR_ERR(vdpasim_net_dev);
+		goto out;
+	}
+
+	ret = vdpa_register_device(&vdpasim_net_dev->vdpa);
+	if (ret)
+		goto put_dev;
+
+	return 0;
+
+put_dev:
+	put_device(&vdpasim_net_dev->vdpa.dev);
+out:
+	return ret;
+}
+
+static void __exit vdpasim_net_exit(void)
+{
+	struct vdpa_device *vdpa = &vdpasim_net_dev->vdpa;
+
+	vdpa_unregister_device(vdpa);
+}
+
+module_init(vdpasim_net_init);
+module_exit(vdpasim_net_exit);
+
+MODULE_VERSION(DRV_VERSION);
+MODULE_LICENSE(DRV_LICENSE);
+MODULE_AUTHOR(DRV_AUTHOR);
+MODULE_DESCRIPTION(DRV_DESC);
diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 4019ceb88181..6d63f10e6741 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -9,15 +9,20 @@ menuconfig VDPA
 if VDPA
 
 config VDPA_SIM
-	tristate "vDPA device simulator"
+	tristate "vDPA device simulator core"
 	depends on RUNTIME_TESTING_MENU && HAS_DMA
 	select DMA_OPS
 	select VHOST_RING
+	help
+	  Enable this module to support vDPA device simulators. These devices
+	  are used for testing, prototyping and development of vDPA.
+
+config VDPA_SIM_NET
+	tristate "vDPA simulator for networking device"
+	depends on VDPA_SIM
 	select GENERIC_NET_UTILS
 	help
-	  vDPA networking device simulator which loop TX traffic back
-	  to RX. This device is used for testing, prototyping and
-	  development of vDPA.
+	  vDPA networking device simulator which loop TX traffic back to RX.
 
 config IFCVF
 	tristate "Intel IFC VF vDPA driver"
diff --git a/drivers/vdpa/vdpa_sim/Makefile b/drivers/vdpa/vdpa_sim/Makefile
index b40278f65e04..79d4536d347e 100644
--- a/drivers/vdpa/vdpa_sim/Makefile
+++ b/drivers/vdpa/vdpa_sim/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_VDPA_SIM) += vdpa_sim.o
+obj-$(CONFIG_VDPA_SIM_NET) += vdpa_sim_net.o
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
