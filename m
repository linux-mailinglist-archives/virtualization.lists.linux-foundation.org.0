Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA6A1BEEBF
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 05:56:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B79F886C69;
	Thu, 30 Apr 2020 03:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W5URXovDJ7z9; Thu, 30 Apr 2020 03:55:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 657B686C5E;
	Thu, 30 Apr 2020 03:55:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FBBAC0172;
	Thu, 30 Apr 2020 03:55:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65C39C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4E78886C5E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHLtmOhZGkEu
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:55:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7843086C59
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:55:54 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d3so2127836pgj.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 20:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PU4mKEfOLwjMNUFYykFdZ+/TR7+uXnsDlmtcF63w89k=;
 b=R47ST5iqg9tv7/m3n8G6AYETLOnoKgePk2mXopH9aCZVsl0qhnlARyclkdroIcmMmq
 EyoKLS6zN5+7J8XhH6AjSR8/AesyYDXrQRVVmvK/W/+fo17K7BbX8roiEF71i2wBfLCA
 86HWrLFF+EL4H0mIs6130mDN7VBdephfsEOZlI5xK/ThRAU74Aai9Cm+Ognw3MeHqzaI
 TR74lmdF9X0fHqqCb4ErHgVojD8g5cZ1Z1likeC0owcfXOeujZFpzCcMg3lLZcqqV+8g
 e7S7sgpJjzgQYKbYmzAtKbDnGYu4Wifwc7TiGKh6Y7vTCEIHOsccOn1cHP+Ah2zG/vK0
 J9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PU4mKEfOLwjMNUFYykFdZ+/TR7+uXnsDlmtcF63w89k=;
 b=QIY+LpbMRhEV2Kh2VZuIWA/ho5lLPz7Suk2IfbNJCSzVok5bk9NGSOvBTk+kti4EHb
 cGb6wK2tbAbUQQJ4E8wBBvZHrWD+o69Orv3S6qXWFfgv5q0sJ2NvGEnglX92Alq81J2m
 tQsxW0RiD54Gl85QWiqQUIEi6CFVSL9TQZueC8rX8OzsTVSNWbHyGWUpmt9iMO5Q7c6u
 75u4gavV4xA8+EspaphnIUcCjbkexC6rHHp6g/afWsjOW68gNQmMRNDWXbsJTzKK32iB
 Zw2mYQkGB0VHD2tB7pUuvyM0pdHbOQj4vRWSnEmBd564Kz1Mdw8uVMiHW08xGHXXR1wA
 2FTA==
X-Gm-Message-State: AGi0PuZrsIO/vnKYE4vOKlCvtrQfV/CBjqksNFVViU1sh1qmjHWgFJH9
 77wuP2g9D3gwb2cU6ZOaPlY=
X-Google-Smtp-Source: APiQypKbw2wqY8Xa//ajMqjYQbRGDXhMcrZQjh0rHfN81mmvjQ/psZQXu3dGVCjPIpFB+MSedi8hqA==
X-Received: by 2002:a65:5b41:: with SMTP id y1mr191077pgr.414.1588218953682;
 Wed, 29 Apr 2020 20:55:53 -0700 (PDT)
Received: from paxos.mtv.corp.google.com
 ([2620:15c:202:201:31a4:f84f:da5f:97b4])
 by smtp.gmail.com with ESMTPSA id r26sm2304540pfq.75.2020.04.29.20.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 20:55:52 -0700 (PDT)
From: Lepton Wu <ytht.net@gmail.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2] virtio: Add uvirtio driver
Date: Wed, 29 Apr 2020 20:55:41 -0700
Message-Id: <20200430035540.212720-1-ytht.net@gmail.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
References: <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
MIME-Version: 1.0
Cc: Lepton Wu <ytht.net@gmail.com>
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

This is for testing purpose to create virtio devices from user space.
uvirtio-vga.c shows how to create a virtio-vga device.

For "simple" device like virtio 2d VGA, actually we only need to handle
one virtio request which return the resolution of VGA. We provide a
UV_DEV_EXPECT ioctl which set the expected virtio request and the prepared
reply. This can eliminate user/kernel communication. We just handle this in
the notify callback of the virtqueue.

Check samples/uvirtio/uvirtio-vga.c for example.

Currently we don't have a use case which requires user/kernel communication so
read/write api hasn't been implemented.

Signed-off-by: Lepton Wu <ytht.net@gmail.com>
---
v2:
  * Fix styles issues found by checkpatch.pl
  * Update comments and commit log
---
 drivers/virtio/Kconfig        |  11 +
 drivers/virtio/Makefile       |   1 +
 drivers/virtio/uvirtio.c      | 399 ++++++++++++++++++++++++++++++++++
 include/linux/uvirtio.h       |  16 ++
 include/uapi/linux/uvirtio.h  |  50 +++++
 samples/uvirtio/Makefile      |   9 +
 samples/uvirtio/uvirtio-vga.c |  72 ++++++
 7 files changed, 558 insertions(+)
 create mode 100644 drivers/virtio/uvirtio.c
 create mode 100644 include/linux/uvirtio.h
 create mode 100644 include/uapi/linux/uvirtio.h
 create mode 100644 samples/uvirtio/Makefile
 create mode 100644 samples/uvirtio/uvirtio-vga.c

diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 69a32dfc318a..4686df49cac5 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -109,4 +109,15 @@ config VIRTIO_MMIO_CMDLINE_DEVICES
 
 	 If unsure, say 'N'.
 
+config UVIRTIO
+	tristate "UVirtio driver"
+	select VIRTIO
+	help
+	 This driver supports creating virtio devices from userspace.
+
+	 This can be used to create virtio devices from user space without
+         supports from VMM. Check samples/uvirtio for examples.
+
+	 If unsure, say 'N'.
+
 endif # VIRTIO_MENU
diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 29a1386ecc03..558b2f890e8c 100644
--- a/drivers/virtio/Makefile
+++ b/drivers/virtio/Makefile
@@ -7,3 +7,4 @@ virtio_pci-$(CONFIG_VIRTIO_PCI_LEGACY) += virtio_pci_legacy.o
 obj-$(CONFIG_VIRTIO_BALLOON) += virtio_balloon.o
 obj-$(CONFIG_VIRTIO_INPUT) += virtio_input.o
 obj-$(CONFIG_VIRTIO_VDPA) += virtio_vdpa.o
+obj-$(CONFIG_UVIRTIO) += uvirtio.o
diff --git a/drivers/virtio/uvirtio.c b/drivers/virtio/uvirtio.c
new file mode 100644
index 000000000000..64cc9140de7a
--- /dev/null
+++ b/drivers/virtio/uvirtio.c
@@ -0,0 +1,399 @@
+// SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+/*
+ *  User level device support for virtio subsystem
+ */
+
+#include <linux/module.h>
+#include <linux/miscdevice.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/uvirtio.h>
+#include <linux/virtio.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_ring.h>
+#include <uapi/linux/uvirtio.h>
+
+#define UVIRTIO_MAX_EXPECT_DATA  (1UL << 20)
+
+struct uvirtio_device {
+	struct virtio_device vdev;
+	struct mutex mutex;
+	enum uvirtio_state state;
+	unsigned char virtio_status;
+	struct uvirtio_setup setup;
+	struct uvirtio_expect expect;
+	char *expect_data;
+};
+
+static struct miscdevice uvirtio_misc;
+
+static struct bus_type uvirtio_bus = {
+	.name = "",
+};
+
+static u64 uvirtio_get_features(struct virtio_device *dev)
+{
+	struct uvirtio_device *udev = container_of(dev, struct uvirtio_device,
+						   vdev);
+	return udev->setup.features;
+}
+
+static int uvirtio_finalize_features(struct virtio_device *vdev)
+{
+	return 0;
+}
+
+static void uvirtio_get(struct virtio_device *dev, unsigned int offset,
+			void *buf, unsigned int len)
+{
+	struct uvirtio_device *udev = container_of(dev, struct uvirtio_device,
+						   vdev);
+	if (WARN_ON(offset + len > udev->setup.config_len))
+		return;
+	memcpy(buf, (char *)udev->setup.config_addr + offset, len);
+}
+
+static u8 uvirtio_get_status(struct virtio_device *dev)
+{
+	struct uvirtio_device *udev = container_of(dev, struct uvirtio_device,
+						   vdev);
+	return udev->virtio_status;
+}
+
+static void uvirtio_set_status(struct virtio_device *dev, u8 status)
+{
+	struct uvirtio_device *udev = container_of(dev, struct uvirtio_device,
+						   vdev);
+	if (WARN_ON(!status))
+		return;
+	udev->virtio_status = status;
+}
+
+static int find_match(int write, char *buf, unsigned int len,
+		      struct uvirtio_block *block, char *data)
+{
+	int i;
+	int off = 0;
+
+	for (i = 0; i < UVIRTIO_MAX_RULES; ++i) {
+		if (!block->rules[i].len)
+			break;
+		if (block->rules[i].off + block->rules[i].len > len)
+			return -1;
+		if (write) {
+			memcpy(buf + block->rules[i].off,
+			       data + block->data + off, block->rules[i].len);
+		} else {
+			if (memcmp(buf + block->rules[i].off,
+				   data + block->data + off,
+				   block->rules[i].len))
+				return -1;
+		}
+		off += block->rules[i].len;
+	}
+	return i ? write : 0;
+}
+
+static void process_vq(struct virtio_device *vdev, const char *name,
+		       struct vring_desc *desc, int idx)
+{
+	unsigned short flags;
+	char *buf;
+	unsigned int len;
+	struct uvirtio_device *udev = container_of(vdev, struct uvirtio_device,
+						   vdev);
+	struct uvirtio_expect *expect = &udev->expect;
+	int i, j, matched = 0;
+
+	for (i = 0; i < UVIRTIO_MAX_EXPECTS; ++i) {
+		if (!expect->expects[i].vq_name[0])
+			break;
+		if (strncmp(name, expect->expects[i].vq_name,
+			    sizeof(expect->expects[i].vq_name)))
+			continue;
+		for (j = 0; j < UVIRTIO_MAX_BLOCKS &&
+		     expect->expects[i].blocks[j].len; ++j) {
+			flags = virtio16_to_cpu(vdev, desc[idx].flags);
+			len = virtio32_to_cpu(vdev, desc[idx].len);
+			buf = __va(virtio64_to_cpu(vdev, desc[idx].addr));
+			if (expect->expects[i].blocks[j].len != len ||
+			    expect->expects[i].blocks[j].flags != flags)
+				break;
+			matched = find_match(flags & VRING_DESC_F_WRITE,
+					     buf, len,
+					     &expect->expects[i].blocks[j],
+					     udev->expect_data);
+			if (matched)
+				break;
+			if (!(flags & VRING_DESC_F_NEXT))
+				break;
+			idx = virtio16_to_cpu(vdev, desc[idx].next);
+		}
+		if (matched > 0)
+			break;
+	}
+}
+
+static bool uvirtio_notify(struct virtqueue *vq)
+{
+	struct vring *r = (struct vring *)(vq + 1);
+	int used_idx, avail_idx, id;
+
+	used_idx = virtio16_to_cpu(vq->vdev, r->used->idx);
+	avail_idx = virtio16_to_cpu(vq->vdev, r->avail->idx);
+	while (used_idx != avail_idx) {
+		id = used_idx & (r->num - 1);
+		process_vq(vq->vdev, vq->name, r->desc, r->avail->ring[id]);
+		r->used->ring[id].id = r->avail->ring[id];
+		used_idx++;
+	}
+	r->used->idx = r->avail->idx;
+	vq->callback(vq);
+	return true;
+}
+
+static int uvirtio_find_vqs(struct virtio_device *dev, unsigned int nvqs,
+			    struct virtqueue *vqs[],
+			    vq_callback_t *callbacks[],
+			    const char *const names[],
+			    const bool *ctx, struct irq_affinity *desc)
+{
+	int i, j;
+
+	for (i = 0; i < nvqs; ++i) {
+		vqs[i] = vring_create_virtqueue(i, 256, SMP_CACHE_BYTES, dev,
+						true, false, false,
+						uvirtio_notify, callbacks[i],
+						names[i]);
+		if (!vqs[i])
+			goto err;
+	}
+	return 0;
+err:
+	for (j = 0; j < i; ++j) {
+		vring_del_virtqueue(vqs[j]);
+		vqs[j] = NULL;
+	}
+	return -ENOMEM;
+}
+
+static void uvirtio_del_vqs(struct virtio_device *dev)
+{
+	struct virtqueue *vq, *n;
+
+	list_for_each_entry_safe(vq, n, &dev->vqs, list)
+		vring_del_virtqueue(vq);
+}
+
+static void uvirtio_reset(struct virtio_device *vdev)
+{
+}
+
+static const struct virtio_config_ops uvirtio_vq_ops = {
+	.get_features = uvirtio_get_features,
+	.finalize_features = uvirtio_finalize_features,
+	.get = uvirtio_get,
+	.get_status = uvirtio_get_status,
+	.set_status = uvirtio_set_status,
+	.reset = uvirtio_reset,
+	.find_vqs = uvirtio_find_vqs,
+	.del_vqs = uvirtio_del_vqs,
+};
+
+static int uvirtio_open(struct inode *inode, struct file *file)
+{
+	struct uvirtio_device *newdev;
+
+	newdev = kzalloc(sizeof(*newdev), GFP_KERNEL);
+	if (!newdev)
+		return -ENOMEM;
+
+	mutex_init(&newdev->mutex);
+	newdev->state = UVST_NEW_DEVICE;
+
+	file->private_data = newdev;
+	nonseekable_open(inode, file);
+
+	return 0;
+}
+
+static int uvirtio_release(struct inode *inode, struct file *file)
+{
+	struct uvirtio_device *udev = file->private_data;
+
+	if (udev->state == UVST_CREATED) {
+		if (udev->setup.flags & (1 << UVIRTIO_DEV_FLAG_STICK))
+			return 0;
+		unregister_virtio_device(&udev->vdev);
+	}
+	kfree((void *)udev->setup.config_addr);
+	kfree(udev->expect_data);
+	kfree(udev);
+	return 0;
+}
+
+static int load_data(struct uvirtio_block *b, char **ptr,
+		     unsigned int *off, unsigned int *len)
+{
+	int i, ret, total = 0;
+	void __user *p = (void __user *)b->data;
+	unsigned int need;
+	int realloc = 0;
+
+	for (i = 0; i < UVIRTIO_MAX_RULES; ++i) {
+		if (!b->rules[i].len)
+			break;
+		total += b->rules[i].len;
+	}
+	if (!total)
+		return 0;
+
+	need = (*off) + total;
+	while (need > (*len)) {
+		if (*len >= UVIRTIO_MAX_EXPECT_DATA)
+			return -ENOMEM;
+		*len = (*len) << 1;
+		realloc = 1;
+	}
+	if (realloc)
+		(*ptr) = krealloc(*ptr, *len, GFP_KERNEL);
+	if (!(*ptr))
+		return -ENOMEM;
+
+	ret = copy_from_user(*ptr + (*off), p, total);
+	if (ret)
+		return ret;
+	b->data = (*off);
+	(*off) += total;
+	return 0;
+}
+
+static int set_expect(struct uvirtio_device *udev, unsigned long arg)
+{
+	int i, j, ret;
+	struct uvirtio_block *b;
+	unsigned int off = 0, len = 1024;
+
+	ret = copy_from_user(&udev->expect, (void __user *)arg,
+			     sizeof(udev->expect));
+	if (ret)
+		return ret;
+
+	udev->expect_data = kmalloc(len, GFP_KERNEL);
+
+	if (!udev->expect_data)
+		return -ENOMEM;
+
+	for (i = 0; i < UVIRTIO_MAX_EXPECTS; ++i) {
+		if (!udev->expect.expects[i].vq_name[0])
+			break;
+		for (j = 0; j < UVIRTIO_MAX_BLOCKS; ++j) {
+			b = &udev->expect.expects[i].blocks[j];
+			if (!b->len)
+				break;
+			ret = load_data(b, &udev->expect_data, &off, &len);
+			if (ret)
+				goto err;
+		}
+	}
+	return 0;
+err:
+	kfree(udev->expect_data);
+	udev->expect_data = NULL;
+	return ret;
+}
+
+static int create_device(struct uvirtio_device *udev, unsigned long arg)
+{
+	int ret;
+	char *config = NULL;
+
+	ret = copy_from_user(&udev->setup, (void __user *)arg,
+			     sizeof(udev->setup));
+	if (ret)
+		return ret;
+	if (!udev->setup.config_len || !udev->setup.config_addr)
+		return -EINVAL;
+	if (udev->setup.config_len > UVIRTIO_MAX_CONFIG_LEN)
+		return -EINVAL;
+	if (udev->setup.flags & ~((1 << UVIRTIO_DEV_FLAG_MAX) - 1))
+		return -EINVAL;
+	config = kmalloc(udev->setup.config_len, GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
+	ret = copy_from_user(config, (void __user *)udev->setup.config_addr,
+			     udev->setup.config_len);
+	if (ret)
+		goto err;
+	udev->setup.config_addr = (uint64_t) config;
+
+	if (uvirtio_misc.this_device->bus == NULL)
+		uvirtio_misc.this_device->bus = &uvirtio_bus;
+
+	udev->vdev.dev.parent = uvirtio_misc.this_device;
+	udev->vdev.id.device = udev->setup.id;
+	udev->vdev.config = &uvirtio_vq_ops;
+	ret = register_virtio_device(&udev->vdev);
+	if (ret)
+		goto err;
+	udev->state = UVST_CREATED;
+	return 0;
+err:
+	kfree(config);
+	udev->setup.config_addr = 0;
+	return ret;
+}
+
+static long uvirtio_ioctl(struct file *file, unsigned int cmd,
+			  unsigned long arg)
+{
+	struct uvirtio_device *udev = file->private_data;
+	int ret;
+
+	ret = mutex_lock_interruptible(&udev->mutex);
+	if (ret)
+		return ret;
+
+	if (udev->state != UVST_NEW_DEVICE) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	switch (cmd) {
+	case UV_DEV_CREATE:
+		ret = create_device(udev, arg);
+		break;
+	case UV_DEV_EXPECT:
+		ret = set_expect(udev, arg);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+out:
+	mutex_unlock(&udev->mutex);
+	return ret;
+}
+
+static const struct file_operations uvirtio_fops = {
+	.owner = THIS_MODULE,
+	.open = uvirtio_open,
+	.release = uvirtio_release,
+	.unlocked_ioctl = uvirtio_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = uvirtio_ioctl,
+#endif
+	.llseek = no_llseek,
+};
+
+static struct miscdevice uvirtio_misc = {
+	.fops = &uvirtio_fops,
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "uvirtio",
+};
+
+module_misc_device(uvirtio_misc);
+
+MODULE_VERSION("0.0.1");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("User level driver support for virtio subsystem");
diff --git a/include/linux/uvirtio.h b/include/linux/uvirtio.h
new file mode 100644
index 000000000000..ae3fd6dfbe58
--- /dev/null
+++ b/include/linux/uvirtio.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * User level device support for virtio subsystem
+ *
+ * Check samples/uvirtio for examples.
+ *
+ * Based on uinput.c by Aristeu Sergio Rozanski Filho
+ */
+#ifndef __UVIRTIO_H_
+#define __UVIRTIO_H_
+
+#include <uapi/linux/uvirtio.h>
+
+enum uvirtio_state { UVST_NEW_DEVICE, UVST_CREATED };
+
+#endif  /* __UVIRTIO_H_ */
diff --git a/include/uapi/linux/uvirtio.h b/include/uapi/linux/uvirtio.h
new file mode 100644
index 000000000000..a17f923d73a8
--- /dev/null
+++ b/include/uapi/linux/uvirtio.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_UVIRTIO_H_
+#define _UAPI_UVIRTIO_H_
+
+#include <linux/types.h>
+
+/* ioctl */
+
+#define UVIRTIO_MAX_CONFIG_LEN 1024
+#define UVIRTIO_MAX_RULES 8
+#define UVIRTIO_MAX_BLOCKS 8
+#define UVIRTIO_MAX_EXPECTS 8
+#define UVIRTIO_MAX_VQ_NAME 64
+
+enum {
+	UVIRTIO_DEV_FLAG_STICK = 0,
+	UVIRTIO_DEV_FLAG_MAX
+};
+
+struct uvirtio_setup {
+	__u64 features;
+	__u64 config_addr;
+	__u16 config_len;
+	__u16 flags;
+	__u32 id;
+};
+
+struct uvirtio_block {
+	__u32 len;
+	__u16 flags;
+	__u16 unused;
+	__u64 data;
+	struct {
+		__u16 off;
+		__u16 len;
+	} rules[UVIRTIO_MAX_RULES];
+};
+
+struct uvirtio_expect {
+	struct {
+		char vq_name[UVIRTIO_MAX_VQ_NAME];
+		struct uvirtio_block blocks[UVIRTIO_MAX_BLOCKS];
+	} expects[UVIRTIO_MAX_EXPECTS];
+};
+
+#define UVIRTIO_IOCTL_BASE	'V'
+#define UV_DEV_CREATE	_IOW(UVIRTIO_IOCTL_BASE, 1, struct uvirtio_setup)
+#define UV_DEV_EXPECT	_IOW(UVIRTIO_IOCTL_BASE, 2, struct uvirtio_expect)
+
+#endif /* _UAPI_UVIRTIO_H_ */
diff --git a/samples/uvirtio/Makefile b/samples/uvirtio/Makefile
new file mode 100644
index 000000000000..ee830986eda2
--- /dev/null
+++ b/samples/uvirtio/Makefile
@@ -0,0 +1,9 @@
+uvirtio-vga: uvirtio-vga.c uapi/linux/uvirtio.h linux/uvirtio.h
+	$(CC) -o $@ $^ -I.
+uapi/linux/uvirtio.h:
+	mkdir -p uapi/linux && ln ../../../../include/uapi/linux/uvirtio.h uapi/linux -sf
+linux/uvirtio.h:
+	mkdir -p linux && ln ../../../include/linux/uvirtio.h linux -sf
+.PHONY: clean
+clean:
+	rm -f uvirtio-vga
diff --git a/samples/uvirtio/uvirtio-vga.c b/samples/uvirtio/uvirtio-vga.c
new file mode 100644
index 000000000000..fae79a6f4968
--- /dev/null
+++ b/samples/uvirtio/uvirtio-vga.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdio.h>
+#include <stddef.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <linux/uvirtio.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_gpu.h>
+#include <linux/virtio_ring.h>
+
+void error(char *str)
+{
+	fprintf(stderr, "%s\n", str);
+	exit(-1);
+}
+
+int main(void)
+{
+	int ret;
+	int fd = open("/dev/uvirtio", O_RDWR);
+
+	if (fd < 0)
+		error("open");
+
+	struct uvirtio_expect expect = { };
+
+	strcpy(expect.expects[0].vq_name, "control");
+
+	struct uvirtio_block *b = &expect.expects[0].blocks[0];
+	struct virtio_gpu_ctrl_hdr cmd;
+
+	cmd.type = VIRTIO_GPU_CMD_GET_DISPLAY_INFO;
+	b->len = sizeof(cmd);
+	b->flags = VRING_DESC_F_NEXT;
+	b->data = (__u64) &cmd.type;
+	b->rules[0].off = offsetof(struct virtio_gpu_ctrl_hdr, type);
+	b->rules[0].len = sizeof(cmd.type);
+
+	struct virtio_gpu_resp_display_info info = { };
+
+	info.pmodes[0].r.width = 1024;
+	info.pmodes[0].r.height = 768;
+	info.pmodes[0].enabled = 1;
+	b = &expect.expects[0].blocks[1];
+	b->len = sizeof(info);
+	b->flags = VRING_DESC_F_WRITE;
+	b->data = (__u64) &info.pmodes[0];
+	b->rules[0].off =
+	    offsetof(struct virtio_gpu_resp_display_info, pmodes[0]);
+	b->rules[0].len = sizeof(info.pmodes[0]);
+	ret = ioctl(fd, UV_DEV_EXPECT, &expect);
+	if (ret < 0)
+		error("ioctl UV_DEV_EXPECT");
+
+	struct uvirtio_setup setup;
+	struct virtio_gpu_config config = {.num_scanouts = 1 };
+
+	setup.features = 1ULL << VIRTIO_F_VERSION_1;
+	setup.config_addr = (__u64) &config;
+	setup.config_len = sizeof(config);
+	setup.id = VIRTIO_ID_GPU;
+	setup.flags = 1 << UVIRTIO_DEV_FLAG_STICK;
+	ret = ioctl(fd, UV_DEV_CREATE, &setup);
+	if (ret < 0)
+		error("ioctl UV_DEV_CREATE");
+}
-- 
2.26.2.303.gf8c07b1a785-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
