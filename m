Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CF350B451B
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 03:05:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A976C4E;
	Tue, 17 Sep 2019 01:05:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 321ABC4E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 01:05:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 058FB76D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 01:05:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Sep 2019 18:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="180612006"
Received: from dpdk-virtio-tbie-2.sh.intel.com ([10.67.104.71])
	by orsmga008.jf.intel.com with ESMTP; 16 Sep 2019 18:05:03 -0700
From: Tiwei Bie <tiwei.bie@intel.com>
To: mst@redhat.com, jasowang@redhat.com, alex.williamson@redhat.com,
	maxime.coquelin@redhat.com
Subject: [RFC v4 3/3] vhost: introduce mdev based hardware backend
Date: Tue, 17 Sep 2019 09:02:04 +0800
Message-Id: <20190917010204.30376-4-tiwei.bie@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917010204.30376-1-tiwei.bie@intel.com>
References: <20190917010204.30376-1-tiwei.bie@intel.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com
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

More details about this patch can be found from the cover
letter for now. Only compile test has been done for now.

Signed-off-by: Tiwei Bie <tiwei.bie@intel.com>
---
 drivers/vhost/Kconfig            |   9 +
 drivers/vhost/Makefile           |   3 +
 drivers/vhost/mdev.c             | 462 +++++++++++++++++++++++++++++++
 drivers/vhost/vhost.c            |  39 ++-
 drivers/vhost/vhost.h            |   6 +
 include/uapi/linux/vhost.h       |  10 +
 include/uapi/linux/vhost_types.h |   5 +
 7 files changed, 528 insertions(+), 6 deletions(-)
 create mode 100644 drivers/vhost/mdev.c

diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index 3d03ccbd1adc..ef9783156d2e 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -34,6 +34,15 @@ config VHOST_VSOCK
 	To compile this driver as a module, choose M here: the module will be called
 	vhost_vsock.
 
+config VHOST_MDEV
+	tristate "Mediated device based hardware vhost accelerator"
+	depends on EVENTFD && VFIO && VFIO_MDEV
+	select VHOST
+	default n
+	---help---
+	Say Y here to enable the vhost_mdev module
+	for use with hardware vhost accelerators
+
 config VHOST
 	tristate
 	---help---
diff --git a/drivers/vhost/Makefile b/drivers/vhost/Makefile
index 6c6df24f770c..ad9c0f8c6d8c 100644
--- a/drivers/vhost/Makefile
+++ b/drivers/vhost/Makefile
@@ -10,4 +10,7 @@ vhost_vsock-y := vsock.o
 
 obj-$(CONFIG_VHOST_RING) += vringh.o
 
+obj-$(CONFIG_VHOST_MDEV) += vhost_mdev.o
+vhost_mdev-y := mdev.o
+
 obj-$(CONFIG_VHOST)	+= vhost.o
diff --git a/drivers/vhost/mdev.c b/drivers/vhost/mdev.c
new file mode 100644
index 000000000000..8c6597aff45e
--- /dev/null
+++ b/drivers/vhost/mdev.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018-2019 Intel Corporation.
+ */
+
+#include <linux/compat.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/mdev.h>
+#include <linux/module.h>
+#include <linux/vfio.h>
+#include <linux/vhost.h>
+#include <linux/virtio_mdev.h>
+
+#include "vhost.h"
+
+struct vhost_mdev {
+	struct mutex mutex;
+	struct vhost_dev dev;
+	struct vhost_virtqueue *vqs;
+	int nvqs;
+	u64 state;
+	u64 features;
+	u64 acked_features;
+	struct vfio_group *vfio_group;
+	struct vfio_device *vfio_device;
+	struct mdev_device *mdev;
+};
+
+/*
+ * XXX
+ * We assume virtio_mdev.ko exposes below symbols for now, as we
+ * don't have a proper way to access parent ops directly yet.
+ *
+ * virtio_mdev_readl()
+ * virtio_mdev_writel()
+ */
+extern u32 virtio_mdev_readl(struct mdev_device *mdev, loff_t off);
+extern void virtio_mdev_writel(struct mdev_device *mdev, loff_t off, u32 val);
+
+static u8 mdev_get_status(struct mdev_device *mdev)
+{
+	return virtio_mdev_readl(mdev, VIRTIO_MDEV_STATUS);
+}
+
+static void mdev_set_status(struct mdev_device *mdev, u8 status)
+{
+	virtio_mdev_writel(mdev, VIRTIO_MDEV_STATUS, status);
+}
+
+static void mdev_add_status(struct mdev_device *mdev, u8 status)
+{
+	status |= mdev_get_status(mdev);
+	mdev_set_status(mdev, status);
+}
+
+static void mdev_reset(struct mdev_device *mdev)
+{
+	mdev_set_status(mdev, 0);
+}
+
+static void handle_vq_kick(struct vhost_work *work)
+{
+	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
+						  poll.work);
+	struct vhost_mdev *m = container_of(vq->dev, struct vhost_mdev, dev);
+
+	virtio_mdev_writel(m->mdev, VIRTIO_MDEV_QUEUE_NOTIFY, vq - m->vqs);
+}
+
+static long vhost_mdev_start_backend(struct vhost_mdev *m)
+{
+	struct mdev_device *mdev = m->mdev;
+	u64 features = m->acked_features;
+	u64 addr;
+	struct vhost_virtqueue *vq;
+	int queue_id;
+
+	features |= 1ULL << VIRTIO_F_IOMMU_PLATFORM;
+
+	virtio_mdev_writel(mdev, VIRTIO_MDEV_DRIVER_FEATURES_SEL, 1);
+	virtio_mdev_writel(mdev, VIRTIO_MDEV_DRIVER_FEATURES,
+			   (u32)(features >> 32));
+
+	virtio_mdev_writel(mdev, VIRTIO_MDEV_DRIVER_FEATURES_SEL, 0);
+	virtio_mdev_writel(mdev, VIRTIO_MDEV_DRIVER_FEATURES,
+			   (u32)features);
+
+	mdev_add_status(mdev, VIRTIO_CONFIG_S_FEATURES_OK);
+	if (!(mdev_get_status(mdev) & VIRTIO_CONFIG_S_FEATURES_OK))
+		return -ENODEV;
+
+	for (queue_id = 0; queue_id < m->nvqs; queue_id++) {
+		vq = &m->vqs[queue_id];
+
+		if (!vq->desc || !vq->avail || !vq->used)
+			break;
+
+		virtio_mdev_writel(mdev, VIRTIO_MDEV_QUEUE_NUM, vq->num);
+
+		if (!vhost_translate_ring_addr(vq, (u64)vq->desc,
+					       vhost_get_desc_size(vq, vq->num),
+					       &addr))
+			return -EINVAL;
+
+		virtio_mdev_writel(mdev, VIRTIO_MDEV_QUEUE_DESC_LOW, addr);
+		virtio_mdev_writel(mdev, VIRTIO_MDEV_QUEUE_DESC_HIGH,
+				   (addr >> 32));
+
+		if (!vhost_translate_ring_addr(vq, (u64)vq->avail,
+					       vhost_get_avail_size(vq, vq->num),
+					       &addr))
+			return -EINVAL;
+
+		virtio_mdev_writel(mdev, VIRTIO_MDEV_QUEUE_AVAIL_LOW, addr);
+		virtio_mdev_writel(mdev, VIRTIO_MDEV_QUEUE_AVAIL_HIGH,
+				   (addr >> 32));
+
+		if (!vhost_translate_ring_addr(vq, (u64)vq->used,
+					       vhost_get_used_size(vq, vq->num),
+					       &addr))
+			return -EINVAL;
+
+		virtio_mdev_writel(mdev, VIRTIO_MDEV_QUEUE_USED_LOW, addr);
+		virtio_mdev_writel(mdev, VIRTIO_MDEV_QUEUE_USED_HIGH,
+				   (addr >> 32));
+
+		// XXX: we need to support set_vring_base
+
+		virtio_mdev_writel(mdev, VIRTIO_MDEV_QUEUE_READY, 1);
+	}
+
+	// XXX: we need to setup interrupt as well
+
+	mdev_add_status(mdev, VIRTIO_CONFIG_S_DRIVER_OK);
+	return 0;
+}
+
+static long vhost_mdev_stop_backend(struct vhost_mdev *m)
+{
+	struct mdev_device *mdev = m->mdev;
+
+	mdev_reset(mdev);
+	mdev_add_status(mdev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
+	mdev_add_status(mdev, VIRTIO_CONFIG_S_DRIVER);
+	return 0;
+}
+
+static long vhost_set_state(struct vhost_mdev *m, u64 __user *statep)
+{
+	u64 state;
+	long r;
+
+	if (copy_from_user(&state, statep, sizeof(state)))
+		return -EFAULT;
+
+	if (state >= VHOST_MDEV_S_MAX)
+		return -EINVAL;
+
+	if (m->state == state)
+		return 0;
+
+	m->state = state;
+
+	switch (m->state) {
+	case VHOST_MDEV_S_RUNNING:
+		r = vhost_mdev_start_backend(m);
+		break;
+	case VHOST_MDEV_S_STOPPED:
+		r = vhost_mdev_stop_backend(m);
+		break;
+	default:
+		r = -EINVAL;
+		break;
+	}
+
+	return r;
+}
+
+static long vhost_get_features(struct vhost_mdev *m, u64 __user *featurep)
+{
+	if (copy_to_user(featurep, &m->features, sizeof(m->features)))
+		return -EFAULT;
+	return 0;
+}
+
+static long vhost_set_features(struct vhost_mdev *m, u64 __user *featurep)
+{
+	u64 features;
+
+	if (copy_from_user(&features, featurep, sizeof(features)))
+		return -EFAULT;
+
+	if (features & ~m->features)
+		return -EINVAL;
+
+	m->acked_features = features;
+
+	return 0;
+}
+
+static long vhost_get_vring_base(struct vhost_mdev *m, void __user *argp)
+{
+	struct vhost_virtqueue *vq;
+	u32 idx;
+	long r;
+
+	r = get_user(idx, (u32 __user *)argp);
+	if (r < 0)
+		return r;
+	if (idx >= m->nvqs)
+		return -ENOBUFS;
+
+	vq = &m->vqs[idx];
+
+	// XXX: we need to support get_vring_base
+	//vq->last_avail_idx = virtio_mdev_readl(b->mdev, ...);
+
+	return vhost_vring_ioctl(&m->dev, VHOST_GET_VRING_BASE, argp);
+}
+
+static void vhost_mdev_release_backend(struct vhost_mdev *m)
+{
+	if (!m->mdev)
+		return;
+
+	if (m->state != VHOST_MDEV_S_STOPPED) {
+		m->state = VHOST_MDEV_S_STOPPED;
+		vhost_mdev_stop_backend(m);
+	}
+
+	vhost_dev_stop(&m->dev);
+	vhost_dev_cleanup(&m->dev);
+
+	kfree(m->dev.vqs);
+	kfree(m->vqs);
+
+	vfio_device_put(m->vfio_device);
+	vfio_group_put_external_user(m->vfio_group);
+
+	m->mdev = NULL;
+}
+
+static long vhost_mdev_set_backend(struct vhost_mdev *m,
+				   struct vhost_mdev_backend __user *argp)
+{
+	struct vhost_mdev_backend backend;
+	struct mdev_device *mdev;
+	struct vhost_dev *dev;
+	struct vhost_virtqueue **vqs;
+	struct file *file;
+	struct vfio_device *device;
+	struct vfio_group *group;
+	unsigned long magic;
+	u64 features;
+	int i, nvqs;
+	long r;
+
+	vhost_mdev_release_backend(m);
+
+	if (copy_from_user(&backend, argp, sizeof(backend))) {
+		r = -EFAULT;
+		goto err;
+	}
+
+	file = fget(backend.group_fd);
+	if (!file) {
+		r = -EBADF;
+		goto err;
+	}
+
+	group = vfio_group_get_external_user(file);
+	fput(file);
+	if (IS_ERR(group)) {
+		r = PTR_ERR(group);
+		goto err;
+	}
+
+	device = vfio_device_get_from_fd(group, backend.device_fd);
+	if (!IS_ERR(device)) {
+		r = PTR_ERR(device);
+		goto err_put_group;
+	}
+
+	if (!vfio_device_ops_match(device, &vfio_mdev_dev_ops)) {
+		r = -EINVAL;
+		goto err_put_device;
+	}
+
+	mdev = vfio_device_data(m->vfio_device);
+
+	magic = virtio_mdev_readl(mdev, VIRTIO_MDEV_MAGIC_VALUE);
+	if (magic != ('v' | 'i' << 8 | 'r' << 16 | 't' << 24)) {
+		r = -ENODEV;
+		goto err_put_device;
+	}
+
+	mdev_reset(mdev);
+	mdev_add_status(mdev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
+	mdev_add_status(mdev, VIRTIO_CONFIG_S_DRIVER);
+
+	virtio_mdev_writel(mdev, VIRTIO_MDEV_DEVICE_FEATURES_SEL, 1);
+	features = virtio_mdev_readl(mdev, VIRTIO_MDEV_DEVICE_FEATURES);
+	features <<= 32;
+
+	virtio_mdev_writel(mdev, VIRTIO_MDEV_DEVICE_FEATURES_SEL, 0);
+	features |= virtio_mdev_readl(mdev, VIRTIO_MDEV_DEVICE_FEATURES);
+
+	if (!(features & (1ULL << VIRTIO_F_IOMMU_PLATFORM))) {
+		r = -EINVAL;
+		goto err_put_device;
+	}
+
+	m->features = features;
+
+	nvqs = virtio_mdev_readl(mdev, VIRTIO_MDEV_QUEUE_NUM_MAX);
+	m->nvqs = nvqs;
+
+	m->vqs = kmalloc_array(nvqs, sizeof(struct vhost_virtqueue),
+			       GFP_KERNEL);
+	if (!m->vqs) {
+		r = -ENOMEM;
+		goto err_put_device;
+	}
+
+	vqs = kmalloc_array(nvqs, sizeof(*vqs), GFP_KERNEL);
+	if (!vqs) {
+		r = -ENOMEM;
+		goto err_free_vqs;
+	}
+
+	dev = &m->dev;
+	for (i = 0; i < nvqs; i++) {
+		vqs[i] = &m->vqs[i];
+		vqs[i]->handle_kick = handle_vq_kick;
+	}
+	vhost_dev_init(dev, vqs, nvqs, 0, 0, 0);
+
+	m->vfio_group = group;
+	m->vfio_device = device;
+	m->mdev = mdev;
+
+	return 0;
+
+err_free_vqs:
+	kfree(m->vqs);
+err_put_device:
+	vfio_device_put(device);
+err_put_group:
+	vfio_group_put_external_user(group);
+err:
+	return r;
+}
+
+static int vhost_mdev_open(struct inode *inode, struct file *f)
+{
+	struct vhost_mdev *m;
+
+	m = kzalloc(sizeof(*m), GFP_KERNEL | __GFP_RETRY_MAYFAIL);
+	if (!m)
+		return -ENOMEM;
+
+	mutex_init(&m->mutex);
+	f->private_data = m;
+
+	return 0;
+}
+
+static int vhost_mdev_release(struct inode *inode, struct file *f)
+{
+	struct vhost_mdev *m = f->private_data;
+
+	vhost_mdev_release_backend(m);
+	mutex_destroy(&m->mutex);
+	kfree(m);
+
+	return 0;
+}
+
+static long vhost_mdev_ioctl(struct file *f, unsigned int cmd,
+			     unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	struct vhost_mdev *m = f->private_data;
+	long r;
+
+	mutex_lock(&m->mutex);
+
+	if (cmd == VHOST_MDEV_SET_BACKEND) {
+		r = vhost_mdev_set_backend(m, argp);
+		goto done;
+	}
+
+	if (!m->mdev) {
+		r = -EINVAL;
+		goto done;
+	}
+
+	switch (cmd) {
+	case VHOST_MDEV_SET_STATE:
+		r = vhost_set_state(m, argp);
+		break;
+	case VHOST_GET_FEATURES:
+		r = vhost_get_features(m, argp);
+		break;
+	case VHOST_SET_FEATURES:
+		r = vhost_set_features(m, argp);
+		break;
+	case VHOST_GET_VRING_BASE:
+		r = vhost_get_vring_base(m, argp);
+		break;
+	default:
+		r = vhost_dev_ioctl(&m->dev, cmd, argp);
+		if (r == -ENOIOCTLCMD)
+			r = vhost_vring_ioctl(&m->dev, cmd, argp);
+	}
+
+done:
+	mutex_lock(&m->mutex);
+	return r;
+}
+
+#ifdef CONFIG_COMPAT
+static long vhost_mdev_compat_ioctl(struct file *f, unsigned int ioctl,
+				    unsigned long arg)
+{
+	return vhost_mdev_ioctl(f, ioctl, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+static const struct file_operations vhost_mdev_fops = {
+	.owner		= THIS_MODULE,
+	.release	= vhost_mdev_release,
+	.unlocked_ioctl	= vhost_mdev_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl	= vhost_mdev_compat_ioctl,
+#endif
+	.open		= vhost_mdev_open,
+	.llseek		= noop_llseek,
+};
+
+static struct miscdevice vhost_mdev_misc = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "vhost-mdev",
+	.fops = &vhost_mdev_fops,
+};
+
+static int __init vhost_mdev_init(void)
+{
+	return misc_register(&vhost_mdev_misc);
+}
+module_init(vhost_mdev_init);
+
+static void __exit vhost_mdev_exit(void)
+{
+	misc_deregister(&vhost_mdev_misc);
+}
+module_exit(vhost_mdev_exit);
+
+MODULE_VERSION("0.0.0");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Hardware vhost accelerator abstraction");
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 5dc174ac8cac..0f7236a17a56 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -426,8 +426,7 @@ bool vhost_exceeds_weight(struct vhost_virtqueue *vq,
 }
 EXPORT_SYMBOL_GPL(vhost_exceeds_weight);
 
-static size_t vhost_get_avail_size(struct vhost_virtqueue *vq,
-				   unsigned int num)
+size_t vhost_get_avail_size(struct vhost_virtqueue *vq, unsigned int num)
 {
 	size_t event __maybe_unused =
 	       vhost_has_feature(vq, VIRTIO_RING_F_EVENT_IDX) ? 2 : 0;
@@ -435,9 +434,9 @@ static size_t vhost_get_avail_size(struct vhost_virtqueue *vq,
 	return sizeof(*vq->avail) +
 	       sizeof(*vq->avail->ring) * num + event;
 }
+EXPORT_SYMBOL_GPL(vhost_get_avail_size);
 
-static size_t vhost_get_used_size(struct vhost_virtqueue *vq,
-				  unsigned int num)
+size_t vhost_get_used_size(struct vhost_virtqueue *vq, unsigned int num)
 {
 	size_t event __maybe_unused =
 	       vhost_has_feature(vq, VIRTIO_RING_F_EVENT_IDX) ? 2 : 0;
@@ -445,12 +444,13 @@ static size_t vhost_get_used_size(struct vhost_virtqueue *vq,
 	return sizeof(*vq->used) +
 	       sizeof(*vq->used->ring) * num + event;
 }
+EXPORT_SYMBOL_GPL(vhost_get_used_size);
 
-static size_t vhost_get_desc_size(struct vhost_virtqueue *vq,
-				  unsigned int num)
+size_t vhost_get_desc_size(struct vhost_virtqueue *vq, unsigned int num)
 {
 	return sizeof(*vq->desc) * num;
 }
+EXPORT_SYMBOL_GPL(vhost_get_desc_size);
 
 void vhost_dev_init(struct vhost_dev *dev,
 		    struct vhost_virtqueue **vqs, int nvqs,
@@ -2617,6 +2617,33 @@ struct vhost_msg_node *vhost_dequeue_msg(struct vhost_dev *dev,
 }
 EXPORT_SYMBOL_GPL(vhost_dequeue_msg);
 
+bool vhost_translate_ring_addr(struct vhost_virtqueue *vq, u64 ring_addr,
+			       u64 len, u64 *addr)
+{
+	struct vhost_umem *umem = vq->umem;
+	struct vhost_umem_node *u;
+
+	if (vhost_overflow(ring_addr, len))
+		return false;
+
+	if (vq->iotlb) {
+		/* Ring address is already IOVA */
+		*addr = ring_addr;
+		return true;
+	}
+
+	/* Ring address is host virtual address. */
+	list_for_each_entry(u, &umem->umem_list, link) {
+		if (u->userspace_addr <= ring_addr &&
+		    u->userspace_addr + u->size >= ring_addr + len) {
+			*addr = ring_addr - u->userspace_addr + u->start;
+			return true;
+		}
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(vhost_translate_ring_addr);
 
 static int __init vhost_init(void)
 {
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index e9ed2722b633..294a6bcb6adf 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -189,6 +189,12 @@ long vhost_dev_ioctl(struct vhost_dev *, unsigned int ioctl, void __user *argp);
 long vhost_vring_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp);
 bool vhost_vq_access_ok(struct vhost_virtqueue *vq);
 bool vhost_log_access_ok(struct vhost_dev *);
+bool vhost_translate_ring_addr(struct vhost_virtqueue *vq, u64 ring_addr,
+			       u64 len, u64 *addr);
+
+size_t vhost_get_avail_size(struct vhost_virtqueue *vq, unsigned int num);
+size_t vhost_get_used_size(struct vhost_virtqueue *vq, unsigned int num);
+size_t vhost_get_desc_size(struct vhost_virtqueue *vq, unsigned int num);
 
 int vhost_get_vq_desc(struct vhost_virtqueue *,
 		      struct iovec iov[], unsigned int iov_count,
diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
index 40d028eed645..7213aedc8506 100644
--- a/include/uapi/linux/vhost.h
+++ b/include/uapi/linux/vhost.h
@@ -116,4 +116,14 @@
 #define VHOST_VSOCK_SET_GUEST_CID	_IOW(VHOST_VIRTIO, 0x60, __u64)
 #define VHOST_VSOCK_SET_RUNNING		_IOW(VHOST_VIRTIO, 0x61, int)
 
+/* VHOST_MDEV specific defines */
+
+#define VHOST_MDEV_SET_BACKEND	_IOW(VHOST_VIRTIO, 0x70, \
+					struct vhost_mdev_backend)
+#define VHOST_MDEV_SET_STATE	_IOW(VHOST_VIRTIO, 0x71, __u64)
+
+#define VHOST_MDEV_S_STOPPED	0
+#define VHOST_MDEV_S_RUNNING	1
+#define VHOST_MDEV_S_MAX	2
+
 #endif
diff --git a/include/uapi/linux/vhost_types.h b/include/uapi/linux/vhost_types.h
index c907290ff065..f06f0dbb7e51 100644
--- a/include/uapi/linux/vhost_types.h
+++ b/include/uapi/linux/vhost_types.h
@@ -119,6 +119,11 @@ struct vhost_scsi_target {
 	unsigned short reserved;
 };
 
+struct vhost_mdev_backend {
+	int group_fd;
+	int device_fd;
+};
+
 /* Feature bits */
 /* Log all write descriptors. Can be changed while device is active. */
 #define VHOST_F_LOG_ALL 26
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
