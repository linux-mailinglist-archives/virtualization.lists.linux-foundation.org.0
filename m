Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B74445706
	for <lists.virtualization@lfdr.de>; Thu,  4 Nov 2021 17:17:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B187E60B0F;
	Thu,  4 Nov 2021 16:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIV_F-otL3ZD; Thu,  4 Nov 2021 16:17:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7424560B28;
	Thu,  4 Nov 2021 16:17:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02921C0021;
	Thu,  4 Nov 2021 16:17:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C734EC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 16:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B622681763
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 16:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8gVx7uaqK1I
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 16:17:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E479F81024
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636042656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=58SrHNIIdlgF7MCvqRHT0amuy7+SSMib9RGeKXb0aIU=;
 b=AnXSD9VJlaJwL+M7nrPjLEYlPmKV0u9bo9Bo5rLrX4A904+0w3dC9LKAg9pGpTBiPw7qPv
 788SrUN39US+3cG29T9/URKwvcg6oXx6cLXckoBupcS9dAFJaQyhPNKaDLlsiw2Z3cdQxy
 FEHwcSeQuWBVjybM8bDFGHooDmFo9qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-ijKeRPLMMYiD6fo1jNpPEQ-1; Thu, 04 Nov 2021 12:17:33 -0400
X-MC-Unique: ijKeRPLMMYiD6fo1jNpPEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C8DF87D571;
 Thu,  4 Nov 2021 16:17:32 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADDE678C01;
 Thu,  4 Nov 2021 16:17:30 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] vdpa: add driver_override support
Date: Thu,  4 Nov 2021 17:17:29 +0100
Message-Id: <20211104161729.258294-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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

`driver_override` allows to control which of the vDPA bus drivers
binds to a vDPA device.

If `driver_override` is not set, the previous behaviour is followed:
devices use the first vDPA bus driver loaded (unless auto binding
is disabled).

Tested on Fedora 34 with driverctl(8):
  $ modprobe virtio-vdpa
  $ modprobe vhost-vdpa
  $ modprobe vdpa-sim-net

  $ vdpa dev add mgmtdev vdpasim_net name dev1

  # dev1 is attached to the first vDPA bus driver loaded
  $ driverctl -b vdpa list-devices
    dev1 virtio_vdpa

  $ driverctl -b vdpa set-override dev1 vhost_vdpa

  $ driverctl -b vdpa list-devices
    dev1 vhost_vdpa [*]

  Note: driverctl(8) integrates with udev so the binding is
  preserved.

Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/vdpa.h |  2 ++
 drivers/vdpa/vdpa.c  | 74 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index c3011ccda430..ae34015b37b7 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -64,6 +64,7 @@ struct vdpa_mgmt_dev;
  * struct vdpa_device - representation of a vDPA device
  * @dev: underlying device
  * @dma_dev: the actual device that is performing DMA
+ * @driver_override: driver name to force a match
  * @config: the configuration ops for this device.
  * @cf_mutex: Protects get and set access to configuration layout.
  * @index: device index
@@ -76,6 +77,7 @@ struct vdpa_mgmt_dev;
 struct vdpa_device {
 	struct device dev;
 	struct device *dma_dev;
+	const char *driver_override;
 	const struct vdpa_config_ops *config;
 	struct mutex cf_mutex; /* Protects get/set config */
 	unsigned int index;
diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 7332a74a4b00..659231bbfee8 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -52,8 +52,81 @@ static void vdpa_dev_remove(struct device *d)
 		drv->remove(vdev);
 }
 
+static int vdpa_dev_match(struct device *dev, struct device_driver *drv)
+{
+	struct vdpa_device *vdev = dev_to_vdpa(dev);
+
+	/* Check override first, and if set, only use the named driver */
+	if (vdev->driver_override)
+		return strcmp(vdev->driver_override, drv->name) == 0;
+
+	/* Currently devices must be supported by all vDPA bus drivers */
+	return 1;
+}
+
+static ssize_t driver_override_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct vdpa_device *vdev = dev_to_vdpa(dev);
+	const char *driver_override, *old;
+	char *cp;
+
+	/* We need to keep extra room for a newline */
+	if (count >= (PAGE_SIZE - 1))
+		return -EINVAL;
+
+	driver_override = kstrndup(buf, count, GFP_KERNEL);
+	if (!driver_override)
+		return -ENOMEM;
+
+	cp = strchr(driver_override, '\n');
+	if (cp)
+		*cp = '\0';
+
+	device_lock(dev);
+	old = vdev->driver_override;
+	if (strlen(driver_override)) {
+		vdev->driver_override = driver_override;
+	} else {
+		kfree(driver_override);
+		vdev->driver_override = NULL;
+	}
+	device_unlock(dev);
+
+	kfree(old);
+
+	return count;
+}
+
+static ssize_t driver_override_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct vdpa_device *vdev = dev_to_vdpa(dev);
+	ssize_t len;
+
+	device_lock(dev);
+	len = snprintf(buf, PAGE_SIZE, "%s\n", vdev->driver_override);
+	device_unlock(dev);
+
+	return len;
+}
+static DEVICE_ATTR_RW(driver_override);
+
+static struct attribute *vdpa_dev_attrs[] = {
+	&dev_attr_driver_override.attr,
+	NULL,
+};
+
+static const struct attribute_group vdpa_dev_group = {
+	.attrs  = vdpa_dev_attrs,
+};
+__ATTRIBUTE_GROUPS(vdpa_dev);
+
 static struct bus_type vdpa_bus = {
 	.name  = "vdpa",
+	.dev_groups = vdpa_dev_groups,
+	.match = vdpa_dev_match,
 	.probe = vdpa_dev_probe,
 	.remove = vdpa_dev_remove,
 };
@@ -68,6 +141,7 @@ static void vdpa_release_dev(struct device *d)
 
 	ida_simple_remove(&vdpa_index_ida, vdev->index);
 	mutex_destroy(&vdev->cf_mutex);
+	kfree(vdev->driver_override);
 	kfree(vdev);
 }
 
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
