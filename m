Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1BCF3267
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 16:12:33 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2193DF98;
	Thu,  7 Nov 2019 15:12:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2683AC86
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 15:12:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 302DA189
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573139544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=ZjglcjJdfJ+rYNda606bWPhtmSxvctdSzvRhdUvjVro=;
	b=ARO+4fUIW9+nUjCyHI8M2W7lc8YKfBuEeeGcEz6sxY0ScoaIDukkrnF+ym096MCnLrvdot
	GxSVEFzv2VHWNeFvSY8eNlz/HUyckLw9/4YsqLnauLGsIAKsxYoK9ZaEp8NxvLDTQZe8OC
	ESS/oZhZ80K7STgea3ycokx34e9uCLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-216-l6M2zws_OXibIpCw8_kerw-1; Thu, 07 Nov 2019 10:12:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF4C107ACC3;
	Thu,  7 Nov 2019 15:12:16 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-21.pek2.redhat.com [10.72.12.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBA64600D1;
	Thu,  7 Nov 2019 15:11:37 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
	kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
	tiwei.bie@intel.com
Subject: [PATCH V11 1/6] mdev: class id support
Date: Thu,  7 Nov 2019 23:11:04 +0800
Message-Id: <20191107151109.23261-2-jasowang@redhat.com>
In-Reply-To: <20191107151109.23261-1-jasowang@redhat.com>
References: <20191107151109.23261-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: l6M2zws_OXibIpCw8_kerw-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: rdunlap@infradead.org, christophe.de.dinechin@gmail.com,
	sebott@linux.ibm.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	virtualization@lists.linux-foundation.org,
	rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, parav@mellanox.com, gor@linux.ibm.com,
	zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	jani.nikula@linux.intel.com, stefanha@redhat.com,
	zhihong.wang@intel.com, akrowiak@linux.ibm.com,
	netdev@vger.kernel.org, cohuck@redhat.com, oberpar@linux.ibm.com,
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

Mdev bus only supports vfio driver right now, so it doesn't implement
match method. But in the future, we may add drivers other than vfio,
the first driver could be virtio-mdev. This means we need to add
device class id support in bus match method to pair the mdev device
and mdev driver correctly.

So this patch adds id_table to mdev_driver and class_id for mdev
device with the match method for mdev bus.

Reviewed-by: Parav Pandit <parav@mellanox.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 .../driver-api/vfio-mediated-device.rst       |  5 ++++
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  1 +
 drivers/s390/cio/vfio_ccw_ops.c               |  1 +
 drivers/s390/crypto/vfio_ap_ops.c             |  1 +
 drivers/vfio/mdev/mdev_core.c                 | 17 +++++++++++++
 drivers/vfio/mdev/mdev_driver.c               | 25 +++++++++++++++++++
 drivers/vfio/mdev/mdev_private.h              |  1 +
 drivers/vfio/mdev/vfio_mdev.c                 |  6 +++++
 include/linux/mdev.h                          |  8 ++++++
 include/linux/mod_devicetable.h               |  8 ++++++
 samples/vfio-mdev/mbochs.c                    |  1 +
 samples/vfio-mdev/mdpy.c                      |  1 +
 samples/vfio-mdev/mtty.c                      |  1 +
 13 files changed, 76 insertions(+)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 25eb7d5b834b..6709413bee29 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -102,12 +102,14 @@ structure to represent a mediated device's driver::
       * @probe: called when new device created
       * @remove: called when device removed
       * @driver: device driver structure
+      * @id_table: the ids serviced by this driver
       */
      struct mdev_driver {
 	     const char *name;
 	     int  (*probe)  (struct device *dev);
 	     void (*remove) (struct device *dev);
 	     struct device_driver    driver;
+	     const struct mdev_class_id *id_table;
      };
 
 A mediated bus driver for mdev should use this structure in the function calls
@@ -170,6 +172,9 @@ that a driver should use to unregister itself with the mdev core driver::
 
 	extern void mdev_unregister_device(struct device *dev);
 
+It is also required to specify the class_id in create() callback through::
+
+	int mdev_set_class(struct mdev_device *mdev, u16 id);
 
 Mediated Device Management Interface Through sysfs
 ==================================================
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 343d79c1cb7e..6420f0dbd31b 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -678,6 +678,7 @@ static int intel_vgpu_create(struct kobject *kobj, struct mdev_device *mdev)
 		     dev_name(mdev_dev(mdev)));
 	ret = 0;
 
+	mdev_set_class(mdev, MDEV_CLASS_ID_VFIO);
 out:
 	return ret;
 }
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index f0d71ab77c50..cf2c013ae32f 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -129,6 +129,7 @@ static int vfio_ccw_mdev_create(struct kobject *kobj, struct mdev_device *mdev)
 			   private->sch->schid.ssid,
 			   private->sch->schid.sch_no);
 
+	mdev_set_class(mdev, MDEV_CLASS_ID_VFIO);
 	return 0;
 }
 
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 5c0f53c6dde7..07c31070afeb 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -343,6 +343,7 @@ static int vfio_ap_mdev_create(struct kobject *kobj, struct mdev_device *mdev)
 	list_add(&matrix_mdev->node, &matrix_dev->mdev_list);
 	mutex_unlock(&matrix_dev->lock);
 
+	mdev_set_class(mdev, MDEV_CLASS_ID_VFIO);
 	return 0;
 }
 
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index b558d4cfd082..7bfa2e46e829 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -45,6 +45,17 @@ void mdev_set_drvdata(struct mdev_device *mdev, void *data)
 }
 EXPORT_SYMBOL(mdev_set_drvdata);
 
+/*
+ * Specify the class for the mdev device, this must be called during
+ * create() callback.
+ */
+void mdev_set_class(struct mdev_device *mdev, u16 id)
+{
+	WARN_ON(mdev->class_id);
+	mdev->class_id = id;
+}
+EXPORT_SYMBOL(mdev_set_class);
+
 struct device *mdev_dev(struct mdev_device *mdev)
 {
 	return &mdev->dev;
@@ -324,6 +335,12 @@ int mdev_device_create(struct kobject *kobj,
 	if (ret)
 		goto ops_create_fail;
 
+	if (!mdev->class_id) {
+		ret = -EINVAL;
+		dev_warn(dev, "mdev vendor driver failed to specify device class\n");
+		goto add_fail;
+	}
+
 	ret = device_add(&mdev->dev);
 	if (ret)
 		goto add_fail;
diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
index 0d3223aee20b..ed06433693e8 100644
--- a/drivers/vfio/mdev/mdev_driver.c
+++ b/drivers/vfio/mdev/mdev_driver.c
@@ -69,8 +69,33 @@ static int mdev_remove(struct device *dev)
 	return 0;
 }
 
+static int mdev_match(struct device *dev, struct device_driver *drv)
+{
+	unsigned int i;
+	struct mdev_device *mdev = to_mdev_device(dev);
+	struct mdev_driver *mdrv = to_mdev_driver(drv);
+	const struct mdev_class_id *ids = mdrv->id_table;
+
+	if (!ids)
+		return 0;
+
+	for (i = 0; ids[i].id; i++)
+		if (ids[i].id == mdev->class_id)
+			return 1;
+	return 0;
+}
+
+static int mdev_uevent(struct device *dev, struct kobj_uevent_env *env)
+{
+	struct mdev_device *mdev = to_mdev_device(dev);
+
+	return add_uevent_var(env, "MODALIAS=mdev:c%02X", mdev->class_id);
+}
+
 struct bus_type mdev_bus_type = {
 	.name		= "mdev",
+	.match		= mdev_match,
+	.uevent		= mdev_uevent,
 	.probe		= mdev_probe,
 	.remove		= mdev_remove,
 };
diff --git a/drivers/vfio/mdev/mdev_private.h b/drivers/vfio/mdev/mdev_private.h
index 7d922950caaf..c65f436c1869 100644
--- a/drivers/vfio/mdev/mdev_private.h
+++ b/drivers/vfio/mdev/mdev_private.h
@@ -33,6 +33,7 @@ struct mdev_device {
 	struct kobject *type_kobj;
 	struct device *iommu_device;
 	bool active;
+	u16 class_id;
 };
 
 #define to_mdev_device(dev)	container_of(dev, struct mdev_device, dev)
diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
index 30964a4e0a28..38431e9ef7f5 100644
--- a/drivers/vfio/mdev/vfio_mdev.c
+++ b/drivers/vfio/mdev/vfio_mdev.c
@@ -120,10 +120,16 @@ static void vfio_mdev_remove(struct device *dev)
 	vfio_del_group_dev(dev);
 }
 
+static const struct mdev_class_id vfio_id_table[] = {
+	{ MDEV_CLASS_ID_VFIO },
+	{ 0 },
+};
+
 static struct mdev_driver vfio_mdev_driver = {
 	.name	= "vfio_mdev",
 	.probe	= vfio_mdev_probe,
 	.remove	= vfio_mdev_remove,
+	.id_table = vfio_id_table,
 };
 
 static int __init vfio_mdev_init(void)
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 0ce30ca78db0..78b69d09eb54 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -118,6 +118,7 @@ struct mdev_type_attribute mdev_type_attr_##_name =		\
  * @probe: called when new device created
  * @remove: called when device removed
  * @driver: device driver structure
+ * @id_table: the ids serviced by this driver
  *
  **/
 struct mdev_driver {
@@ -125,6 +126,7 @@ struct mdev_driver {
 	int  (*probe)(struct device *dev);
 	void (*remove)(struct device *dev);
 	struct device_driver driver;
+	const struct mdev_class_id *id_table;
 };
 
 #define to_mdev_driver(drv)	container_of(drv, struct mdev_driver, driver)
@@ -132,6 +134,7 @@ struct mdev_driver {
 void *mdev_get_drvdata(struct mdev_device *mdev);
 void mdev_set_drvdata(struct mdev_device *mdev, void *data);
 const guid_t *mdev_uuid(struct mdev_device *mdev);
+void mdev_set_class(struct mdev_device *mdev, u16 id);
 
 extern struct bus_type mdev_bus_type;
 
@@ -145,4 +148,9 @@ struct device *mdev_parent_dev(struct mdev_device *mdev);
 struct device *mdev_dev(struct mdev_device *mdev);
 struct mdev_device *mdev_from_dev(struct device *dev);
 
+enum {
+	MDEV_CLASS_ID_VFIO = 1,
+	/* New entries must be added here */
+};
+
 #endif /* MDEV_H */
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5714fd35a83c..f32c6e44fb1a 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -821,4 +821,12 @@ struct wmi_device_id {
 	const void *context;
 };
 
+/**
+ * struct mdev_class_id - MDEV device class identifier
+ * @id: Used to identify a specific class of device, e.g vfio-mdev device.
+ */
+struct mdev_class_id {
+	__u16 id;
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index ac5c8c17b1ff..115bc5074656 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -561,6 +561,7 @@ static int mbochs_create(struct kobject *kobj, struct mdev_device *mdev)
 	mbochs_reset(mdev);
 
 	mbochs_used_mbytes += type->mbytes;
+	mdev_set_class(mdev, MDEV_CLASS_ID_VFIO);
 	return 0;
 
 err_mem:
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index cc86bf6566e4..665614574d50 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -269,6 +269,7 @@ static int mdpy_create(struct kobject *kobj, struct mdev_device *mdev)
 	mdpy_reset(mdev);
 
 	mdpy_count++;
+	mdev_set_class(mdev, MDEV_CLASS_ID_VFIO);
 	return 0;
 }
 
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index ce84a300a4da..90da12ff7fd9 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -755,6 +755,7 @@ static int mtty_create(struct kobject *kobj, struct mdev_device *mdev)
 	list_add(&mdev_state->next, &mdev_devices_list);
 	mutex_unlock(&mdev_list_lock);
 
+	mdev_set_class(mdev, MDEV_CLASS_ID_VFIO);
 	return 0;
 }
 
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
