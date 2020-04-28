Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC61BCDAA
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 22:47:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C4E1A227CD;
	Tue, 28 Apr 2020 20:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zccJA0+aLyeY; Tue, 28 Apr 2020 20:47:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DC1B422773;
	Tue, 28 Apr 2020 20:47:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF185C0172;
	Tue, 28 Apr 2020 20:47:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B735C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8784B87684
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3MMdToV3ymk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:47:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E1F7087689
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:47:39 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id v2so8971249plp.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 13:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZeEE3PPj3VxkTpYIgHSSehUeXArbT7d1JVLgceGCrQ=;
 b=JXjDo4IE7Xl2G0szRDCVSuinpyzSO9ECW8uwNvr6Yn7FqDCohcgIf9Gsy02cV/fETJ
 vaE40yAIdOQJAi5/ei8BZCCFCP3mr5cz3VL+DeEleCrRmHPxOH+TPyhqYiOoACs2XZqf
 PSQjQCCJ6FAmx9wDdNYURztZxJifgWWDfAm8uwSpUkyhs65bpWDsH/V83qTfmztI8joH
 lmdG+c4rxt9FZ4+y19ccvNWbwEtp/WMYjiFHNpfecN7Rci+39EFYAmUJRERsYtipFTkI
 RKH0OaEb7WB0PN4LuxMrQVyncveAiglX8NgNnvez6olbRaAtGwdspNyJDLTmw8+ojd29
 r6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZeEE3PPj3VxkTpYIgHSSehUeXArbT7d1JVLgceGCrQ=;
 b=A4/X+WiqQcRbk1MhlI2FUKXnSjuGdTRA4cWpSroXrl+7Y5pOS+5ouFcjZ7OAPsvLAL
 NyCKTdcCgdFdhj/FdWABcM/TODk58FgbmgOEv8VySN+QM9VIG1SQ2aN7M1D/NiKx7t5n
 hNvjbT/1a8aAK2lsbe/52+KXKWwRaHmnK+1fXz27T12szBxxE5sWd2vOR90vTr/Xoa7A
 IWGg+rMvRtAosnyPv79cefTIIRmVfq3bCg7yT5U9C9WsTYxTAPTdyBw1FuGX/OtxCfAG
 hRzY14Iy50srF/9T1E3OBfL6AtYeUqnAnCx49y79IPFtOd3076xmLMCL4zCjqC/8uZ/S
 tACg==
X-Gm-Message-State: AGi0PuZucpG8R3R/pxi1PRcIJnmMWKe6tE/I5+QL30I6wZgl+hLDeh/F
 cKFcFkg7QBh/GTx9DrKGrq0=
X-Google-Smtp-Source: APiQypJREfvvEyXyFlATD5fgTRZCdy6q0QU36JydImGtbRb/P4oU51eq/Bchpn1PFFoH9B5BtkoF9w==
X-Received: by 2002:a17:902:c181:: with SMTP id
 d1mr25468278pld.80.1588106859209; 
 Tue, 28 Apr 2020 13:47:39 -0700 (PDT)
Received: from paxos.mtv.corp.google.com
 ([2620:15c:202:201:31a4:f84f:da5f:97b4])
 by smtp.gmail.com with ESMTPSA id 128sm15380065pfy.5.2020.04.28.13.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 13:47:38 -0700 (PDT)
From: Lepton Wu <ytht.net@gmail.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 1/1] virtio: Add uvirtio driver
Date: Tue, 28 Apr 2020 13:47:29 -0700
Message-Id: <20200428204729.64569-2-ytht.net@gmail.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200428204729.64569-1-ytht.net@gmail.com>
References: <20200428204729.64569-1-ytht.net@gmail.com>
MIME-Version: 1.0
Cc: Lepton Wu <ytht.net@gmail.com>, mst@redhat.com
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
uvirtio-vga.c shows how to create a virtio-vga device. Currently we
don't have a use case which requires user/kernel communication so
read/write api hasn't been implemented.

Signed-off-by: Lepton Wu <ytht.net@gmail.com>
---
 drivers/virtio/Kconfig        |   8 +
 drivers/virtio/Makefile       |   1 +
 drivers/virtio/uvirtio.c      | 405 ++++++++++++++++++++++++++++++++++
 include/linux/uvirtio.h       |   8 +
 include/uapi/linux/uvirtio.h  |  69 ++++++
 samples/uvirtio/Makefile      |   9 +
 samples/uvirtio/uvirtio-vga.c |  63 ++++++
 7 files changed, 563 insertions(+)
 create mode 100644 drivers/virtio/uvirtio.c
 create mode 100644 include/linux/uvirtio.h
 create mode 100644 include/uapi/linux/uvirtio.h
 create mode 100644 samples/uvirtio/Makefile
 create mode 100644 samples/uvirtio/uvirtio-vga.c

diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 69a32dfc318a..8bfb77db4efa 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -109,4 +109,12 @@ config VIRTIO_MMIO_CMDLINE_DEVICES
 
 	 If unsure, say 'N'.
 
+config UVIRTIO
+	tristate "UVirtio driver"
+	select VIRTIO
+	---help---
+	 This driver supports create virtio devices from guest userspace.
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
index 000000000000..a25107473dab
--- /dev/null
+++ b/drivers/virtio/uvirtio.c
@@ -0,0 +1,405 @@
+/*
+ *  User level driver support for virtio subsystem
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
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
+			    vq_callback_t * callbacks[],
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
+	if (!total) {
+		return 0;
+	}
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
+	if (uvirtio_misc.this_device->bus == NULL) {
+		uvirtio_misc.this_device->bus = &uvirtio_bus;
+	}
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
index 000000000000..ff217080d921
--- /dev/null
+++ b/include/linux/uvirtio.h
@@ -0,0 +1,8 @@
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
index 000000000000..4771e527fce0
--- /dev/null
+++ b/include/uapi/linux/uvirtio.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ *  User level driver support for virtio subsystem
+ *
+ * Based on uinput.c by Aristeu Sergio Rozanski Filho
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
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
+#define UV_DEV_CREATE		_IOW(UVIRTIO_IOCTL_BASE, 1, struct uvirtio_setup)
+#define UV_DEV_EXPECT		_IOW(UVIRTIO_IOCTL_BASE, 2, struct uvirtio_expect)
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
index 000000000000..b65cb62a6d91
--- /dev/null
+++ b/samples/uvirtio/uvirtio-vga.c
@@ -0,0 +1,63 @@
+#include <stdio.h>
+#include <stddef.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <linux/uvirtio.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <fcntl.h>
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
+int main()
+{
+	int fd = open("/dev/uvirtio", O_RDWR);
+	if (fd < 0) {
+		error("open");
+	}
+	struct uvirtio_expect expect = { };
+
+	strcpy(expect.expects[0].vq_name, "control");
+	struct uvirtio_block *b = &expect.expects[0].blocks[0];
+	struct virtio_gpu_ctrl_hdr cmd;
+	cmd.type = VIRTIO_GPU_CMD_GET_DISPLAY_INFO;
+	b->len = sizeof(cmd);
+	b->flags = VRING_DESC_F_NEXT;
+	b->data = (__u64) & cmd.type;
+	b->rules[0].off = offsetof(struct virtio_gpu_ctrl_hdr, type);
+	b->rules[0].len = sizeof(cmd.type);
+	struct virtio_gpu_resp_display_info info = { };
+	info.pmodes[0].r.width = 1024;
+	info.pmodes[0].r.height = 768;
+	info.pmodes[0].enabled = 1;
+	b = &expect.expects[0].blocks[1];
+	b->len = sizeof(info);
+	b->flags = VRING_DESC_F_WRITE;
+	b->data = (__u64) & info.pmodes[0];
+	b->rules[0].off =
+	    offsetof(struct virtio_gpu_resp_display_info, pmodes[0]);
+	b->rules[0].len = sizeof(info.pmodes[0]);
+	int ret = ioctl(fd, UV_DEV_EXPECT, &expect);
+	if (ret < 0)
+		error("ioctl UV_DEV_EXPECT");
+	struct uvirtio_setup setup;
+	struct virtio_gpu_config config = {.num_scanouts = 1 };
+	setup.features = 1ULL << VIRTIO_F_VERSION_1;
+	setup.config_addr = (__u64) & config;
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
