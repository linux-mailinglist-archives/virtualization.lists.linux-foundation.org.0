Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A62EF9A2
	for <lists.virtualization@lfdr.de>; Tue,  5 Nov 2019 10:38:17 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C223E1986;
	Tue,  5 Nov 2019 09:38:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 46584DA3
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 09:38:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 60B47844
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572946689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=HbOiebGgVWYiwShAeT9cSxTLA5sWEIMRFlVhkay6wXY=;
	b=PQVBZzL/gVHjAtAcKBaj8u8GzkdO9blhSuIqswwsavPdkm/y7zg/bE4cGz7txjb4WtFgO/
	FMntioPx1ycwpEyDuHXdqPv39Zy4gyD24sGyeaZs0EzP3AXLALMz8rDEwBLQR03EMWwKBF
	ey46BVP7BPcPFJMQq22IG5R67eNumkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-164-tR3tNhCwMZuUVe3S9-7p7g-1; Tue, 05 Nov 2019 04:38:06 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFF47800C73;
	Tue,  5 Nov 2019 09:38:01 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-252.pek2.redhat.com [10.72.12.252])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDF395C1B2;
	Tue,  5 Nov 2019 09:36:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
	kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
	tiwei.bie@intel.com
Subject: [PATCH V8 4/6] mdev: introduce virtio device and its device ops
Date: Tue,  5 Nov 2019 17:32:38 +0800
Message-Id: <20191105093240.5135-5-jasowang@redhat.com>
In-Reply-To: <20191105093240.5135-1-jasowang@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: tR3tNhCwMZuUVe3S9-7p7g-1
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

This patch implements basic support for mdev driver that supports
virtio transport for kernel virtio driver.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vfio/mdev/mdev_core.c    |  21 +++++
 drivers/vfio/mdev/mdev_private.h |   2 +
 include/linux/mdev.h             |   6 ++
 include/linux/mdev_virtio_ops.h  | 149 +++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+)
 create mode 100644 include/linux/mdev_virtio_ops.h

diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 4e70f19ac145..c58253404ed5 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -78,6 +78,27 @@ const struct mdev_vfio_device_ops *mdev_get_vfio_ops(struct mdev_device *mdev)
 }
 EXPORT_SYMBOL(mdev_get_vfio_ops);
 
+/*
+ * Specify the virtio device ops for the mdev device, this
+ * must be called during create() callback for virtio mdev device.
+ */
+void mdev_set_virtio_ops(struct mdev_device *mdev,
+			 const struct mdev_virtio_device_ops *virtio_ops)
+{
+	mdev_set_class(mdev, MDEV_CLASS_ID_VIRTIO);
+	mdev->virtio_ops = virtio_ops;
+}
+EXPORT_SYMBOL(mdev_set_virtio_ops);
+
+/* Get the virtio device ops for the mdev device. */
+const struct mdev_virtio_device_ops *
+mdev_get_virtio_ops(struct mdev_device *mdev)
+{
+	WARN_ON(mdev->class_id != MDEV_CLASS_ID_VIRTIO);
+	return mdev->virtio_ops;
+}
+EXPORT_SYMBOL(mdev_get_virtio_ops);
+
 struct device *mdev_dev(struct mdev_device *mdev)
 {
 	return &mdev->dev;
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index 411227373625..2c74dd032409 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -11,6 +11,7 @@
 #define MDEV_PRIVATE_H
 
 #include <linux/mdev_vfio_ops.h>
+#include <linux/mdev_virtio_ops.h>
 
 int  mdev_bus_register(void);
 void mdev_bus_unregister(void);
@@ -38,6 +39,7 @@ struct mdev_device {
 	u16 class_id;
 	union {
 		const struct mdev_vfio_device_ops *vfio_ops;
+		const struct mdev_virtio_device_ops *virtio_ops;
 	};
 };
 
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 9e37506d1987..f3d75a60c2b5 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -17,6 +17,7 @@
 
 struct mdev_device;
 struct mdev_vfio_device_ops;
+struct mdev_virtio_device_ops;
 
 /*
  * Called by the parent device driver to set the device which represents
@@ -112,6 +113,10 @@ void mdev_set_class(struct mdev_device *mdev, u16 id);
 void mdev_set_vfio_ops(struct mdev_device *mdev,
 		       const struct mdev_vfio_device_ops *vfio_ops);
 const struct mdev_vfio_device_ops *mdev_get_vfio_ops(struct mdev_device *mdev);
+void mdev_set_virtio_ops(struct mdev_device *mdev,
+			 const struct mdev_virtio_device_ops *virtio_ops);
+const struct mdev_virtio_device_ops *
+mdev_get_virtio_ops(struct mdev_device *mdev);
 
 extern struct bus_type mdev_bus_type;
 
@@ -127,6 +132,7 @@ struct mdev_device *mdev_from_dev(struct device *dev);
 
 enum {
 	MDEV_CLASS_ID_VFIO = 1,
+	MDEV_CLASS_ID_VIRTIO = 2,
 	/* New entries must be added here */
 };
 
diff --git a/include/linux/mdev_virtio_ops.h b/include/linux/mdev_virtio_ops.h
new file mode 100644
index 000000000000..379bfa5d6a30
--- /dev/null
+++ b/include/linux/mdev_virtio_ops.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Virtio mediated device driver
+ *
+ * Copyright 2019, Red Hat Corp.
+ *     Author: Jason Wang <jasowang@redhat.com>
+ */
+#ifndef MDEV_VIRTIO_OPS_H
+#define MDEV_VIRTIO_OPS_H
+
+#include <linux/interrupt.h>
+#include <linux/mdev.h>
+#include <uapi/linux/vhost.h>
+
+#define VIRTIO_MDEV_DEVICE_API_STRING		"virtio-mdev"
+#define VIRTIO_MDEV_F_VERSION_1 0x1
+
+struct virtio_mdev_callback {
+	irqreturn_t (*callback)(void *data);
+	void *private;
+};
+
+/**
+ * struct mdev_virtio_device_ops - Structure to be registered for each
+ * mdev device to register the device for virtio/vhost drivers.
+ *
+ * The device ops that is supported by VIRTIO_MDEV_F_VERSION_1, the
+ * callbacks are mandatory unless explicity mentioned.
+ *
+ * @set_vq_address:		Set the address of virtqueue
+ *				@mdev: mediated device
+ *				@idx: virtqueue index
+ *				@desc_area: address of desc area
+ *				@driver_area: address of driver area
+ *				@device_area: address of device area
+ *				Returns integer: success (0) or error (< 0)
+ * @set_vq_num:			Set the size of virtqueue
+ *				@mdev: mediated device
+ *				@idx: virtqueue index
+ *				@num: the size of virtqueue
+ * @kick_vq:			Kick the virtqueue
+ *				@mdev: mediated device
+ *				@idx: virtqueue index
+ * @set_vq_cb:			Set the interrupt callback function for
+ *				a virtqueue
+ *				@mdev: mediated device
+ *				@idx: virtqueue index
+ *				@cb: virtio-mdev interrupt callback structure
+ * @set_vq_ready:		Set ready status for a virtqueue
+ *				@mdev: mediated device
+ *				@idx: virtqueue index
+ *				@ready: ready (true) not ready(false)
+ * @get_vq_ready:		Get ready status for a virtqueue
+ *				@mdev: mediated device
+ *				@idx: virtqueue index
+ *				Returns boolean: ready (true) or not (false)
+ * @set_vq_state:		Set the state for a virtqueue
+ *				@mdev: mediated device
+ *				@idx: virtqueue index
+ *				@state: virtqueue state (last_avail_idx)
+ *				Returns integer: success (0) or error (< 0)
+ * @get_vq_state:		Get the state for a virtqueue
+ *				@mdev: mediated device
+ *				@idx: virtqueue index
+ *				Returns virtqueue state (last_avail_idx)
+ * @get_vq_align:		Get the virtqueue align requirement
+ *				for the device
+ *				@mdev: mediated device
+ *				Returns virtqueue algin requirement
+ * @get_features:		Get virtio features supported by the device
+ *				@mdev: mediated device
+ *				Returns the virtio features support by the
+ *				device
+ * @set_features:		Set virtio features supported by the driver
+ *				@mdev: mediated device
+ *				@features: feature support by the driver
+ *				Returns integer: success (0) or error (< 0)
+ * @set_config_cb:		Set the config interrupt callback
+ *				@mdev: mediated device
+ *				@cb: virtio-mdev interrupt callback structure
+ * @get_vq_num_max:		Get the max size of virtqueue
+ *				@mdev: mediated device
+ *				Returns u16: max size of virtqueue
+ * @get_device_id:		Get virtio device id
+ *				@mdev: mediated device
+ *				Returns u32: virtio device id
+ * @get_vendor_id:		Get id for the vendor that provides this device
+ *				@mdev: mediated device
+ *				Returns u32: virtio vendor id
+ * @get_status:			Get the device status
+ *				@mdev: mediated device
+ *				Returns u8: virtio device status
+ * @set_status:			Set the device status
+ *				@mdev: mediated device
+ *				@status: virtio device status
+ * @get_config:			Read from device specific configuration space
+ *				@mdev: mediated device
+ *				@offset: offset from the beginning of
+ *				configuration space
+ *				@buf: buffer used to read to
+ *				@len: the length to read from
+ *				configration space
+ * @set_config:			Write to device specific configuration space
+ *				@mdev: mediated device
+ *				@offset: offset from the beginning of
+ *				configuration space
+ *				@buf: buffer used to write from
+ *				@len: the length to write to
+ *				configration space
+ * @get_generation:		Get device config generaton (optional)
+ *				@mdev: mediated device
+ *				Returns u32: device generation
+ */
+struct mdev_virtio_device_ops {
+	/* Virtqueue ops */
+	int (*set_vq_address)(struct mdev_device *mdev,
+			      u16 idx, u64 desc_area, u64 driver_area,
+			      u64 device_area);
+	void (*set_vq_num)(struct mdev_device *mdev, u16 idx, u32 num);
+	void (*kick_vq)(struct mdev_device *mdev, u16 idx);
+	void (*set_vq_cb)(struct mdev_device *mdev, u16 idx,
+			  struct virtio_mdev_callback *cb);
+	void (*set_vq_ready)(struct mdev_device *mdev, u16 idx, bool ready);
+	bool (*get_vq_ready)(struct mdev_device *mdev, u16 idx);
+	int (*set_vq_state)(struct mdev_device *mdev, u16 idx, u64 state);
+	u64 (*get_vq_state)(struct mdev_device *mdev, u16 idx);
+
+	/* Virtio device ops */
+	u16 (*get_vq_align)(struct mdev_device *mdev);
+	u64 (*get_features)(struct mdev_device *mdev);
+	int (*set_features)(struct mdev_device *mdev, u64 features);
+	void (*set_config_cb)(struct mdev_device *mdev,
+			      struct virtio_mdev_callback *cb);
+	u16 (*get_vq_num_max)(struct mdev_device *mdev);
+	u32 (*get_device_id)(struct mdev_device *mdev);
+	u32 (*get_vendor_id)(struct mdev_device *mdev);
+	u8 (*get_status)(struct mdev_device *mdev);
+	void (*set_status)(struct mdev_device *mdev, u8 status);
+	void (*get_config)(struct mdev_device *mdev, unsigned int offset,
+			   void *buf, unsigned int len);
+	void (*set_config)(struct mdev_device *mdev, unsigned int offset,
+			   const void *buf, unsigned int len);
+	u32 (*get_generation)(struct mdev_device *mdev);
+};
+
+void mdev_set_virtio_ops(struct mdev_device *mdev,
+			 const struct mdev_virtio_device_ops *virtio_ops);
+
+#endif
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
