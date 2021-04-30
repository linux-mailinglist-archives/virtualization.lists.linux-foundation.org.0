Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DFA36F8CC
	for <lists.virtualization@lfdr.de>; Fri, 30 Apr 2021 12:58:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB5C84D43;
	Fri, 30 Apr 2021 10:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3V0N3Ho4mu0G; Fri, 30 Apr 2021 10:58:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C09884D33;
	Fri, 30 Apr 2021 10:58:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92053C002F;
	Fri, 30 Apr 2021 10:58:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 182BFC0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 10:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78C796F90B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 10:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ei16-mhKppO3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 10:58:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23BF96F8FD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 10:58:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 934B0B246;
 Fri, 30 Apr 2021 10:58:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, gregkh@linuxfoundation.org
Subject: [PATCH v5 3/9] drm/aperture: Add infrastructure for aperture ownership
Date: Fri, 30 Apr 2021 12:58:34 +0200
Message-Id: <20210430105840.30515-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430105840.30515-1-tzimmermann@suse.de>
References: <20210430105840.30515-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
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

Platform devices might operate on firmware framebuffers, such as VESA or
EFI. Before a native driver for the graphics hardware can take over the
device, it has to remove any platform driver that operates on the firmware
framebuffer. Aperture helpers provide the infrastructure for platform
drivers to acquire firmware framebuffers, and for native drivers to remove
them later on.

It works similar to the related fbdev mechanism. During initialization, the
platform driver acquires the firmware framebuffer's I/O memory and provides
a callback to be removed. The native driver later uses this information to
remove any platform driver for it's framebuffer I/O memory.

The aperture removal code is integrated into the existing code for removing
conflicting framebuffers, so native drivers use it automatically.

v5:
	* fix build error introduced by rebasing v4
	* fix typo in documentation
v4:
	* hide detach callback in implementation (Daniel)
	* documentation fixes
v3:
	* rebase onto existing aperture infrastructure
	* release aperture from list during detach; fix dangling apertures
	* don't export struct drm_aperture
	* document struct drm_aperture_funcs
v2:
	* rename plaform helpers to aperture helpers
	* tie to device lifetime with devm_ functions
	* removed unsued remove() callback
	* rename kickout to detach
	* make struct drm_aperture private
	* rebase onto existing drm_aperture.h header file
	* use MIT license only for simplicity
	* documentation

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/drm_aperture.c | 221 ++++++++++++++++++++++++++++++++-
 include/drm/drm_aperture.h     |   4 +
 2 files changed, 221 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index e034dd7f9b09..33bf018c3bdf 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -1,9 +1,18 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/device.h>
 #include <linux/fb.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h> /* for firmware helpers */
+#include <linux/slab.h>
+#include <linux/types.h>
 #include <linux/vgaarb.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 /**
  * DOC: overview
@@ -62,8 +71,200 @@
  * framebuffer apertures automatically. Device drivers without knowledge of
  * the framebuffer's location shall call drm_aperture_remove_framebuffers(),
  * which removes all drivers for known framebuffer.
+ *
+ * Drivers that are susceptible to being removed by other drivers, such as
+ * generic EFI or VESA drivers, have to register themselves as owners of their
+ * given framebuffer memory. Ownership of the framebuffer memory is achived
+ * by calling devm_aperture_acquire_from_firmware(). On success, the driver
+ * is the owner of the framebuffer range. The function fails if the
+ * framebuffer is already by another driver. See below for an example.
+ *
+ * .. code-block:: c
+ *
+ *	static int acquire_framebuffers(struct drm_device *dev, struct platform_device *pdev)
+ *	{
+ *		resource_size_t base, size;
+ *
+ *		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ *		if (!mem)
+ *			return -EINVAL;
+ *		base = mem->start;
+ *		size = resource_size(mem);
+ *
+ *		return devm_acquire_aperture_from_firmware(dev, base, size);
+ *	}
+ *
+ *	static int probe(struct platform_device *pdev)
+ *	{
+ *		struct drm_device *dev;
+ *		int ret;
+ *
+ *		// ... Initialize the device...
+ *		dev = devm_drm_dev_alloc();
+ *		...
+ *
+ *		// ... and acquire ownership of the framebuffer.
+ *		ret = acquire_framebuffers(dev, pdev);
+ *		if (ret)
+ *			return ret;
+ *
+ *		drm_dev_register(dev, 0);
+ *
+ *		return 0;
+ *	}
+ *
+ * The generic driver is now subject to forced removal by other drivers. This
+ * only works for platform drivers that support hot unplug.
+ * When a driver calls drm_aperture_remove_conflicting_framebuffers() et al
+ * for the registered framebuffer range, the aperture helpers call
+ * platform_device_unregister() and the generic driver unloads itself. It
+ * may not access the device's registers, framebuffer memory, ROM, etc
+ * afterwards.
  */
 
+struct drm_aperture {
+	struct drm_device *dev;
+	resource_size_t base;
+	resource_size_t size;
+	struct list_head lh;
+	void (*detach)(struct drm_device *dev);
+};
+
+static LIST_HEAD(drm_apertures);
+static DEFINE_MUTEX(drm_apertures_lock);
+
+static bool overlap(resource_size_t base1, resource_size_t end1,
+		    resource_size_t base2, resource_size_t end2)
+{
+	return (base1 < end2) && (end1 > base2);
+}
+
+static void devm_aperture_acquire_release(void *data)
+{
+	struct drm_aperture *ap = data;
+	bool detached = !ap->dev;
+
+	if (detached)
+		return;
+
+	mutex_lock(&drm_apertures_lock);
+	list_del(&ap->lh);
+	mutex_unlock(&drm_apertures_lock);
+}
+
+static int devm_aperture_acquire(struct drm_device *dev,
+				 resource_size_t base, resource_size_t size,
+				 void (*detach)(struct drm_device *))
+{
+	size_t end = base + size;
+	struct list_head *pos;
+	struct drm_aperture *ap;
+
+	mutex_lock(&drm_apertures_lock);
+
+	list_for_each(pos, &drm_apertures) {
+		ap = container_of(pos, struct drm_aperture, lh);
+		if (overlap(base, end, ap->base, ap->base + ap->size))
+			return -EBUSY;
+	}
+
+	ap = devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
+	if (!ap)
+		return -ENOMEM;
+
+	ap->dev = dev;
+	ap->base = base;
+	ap->size = size;
+	ap->detach = detach;
+	INIT_LIST_HEAD(&ap->lh);
+
+	list_add(&ap->lh, &drm_apertures);
+
+	mutex_unlock(&drm_apertures_lock);
+
+	return devm_add_action_or_reset(dev->dev, devm_aperture_acquire_release, ap);
+}
+
+static void drm_aperture_detach_firmware(struct drm_device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev->dev);
+
+	/*
+	 * Remove the device from the device hierarchy. This is the right thing
+	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
+	 * the new driver takes over the hardware, the firmware device's state
+	 * will be lost.
+	 *
+	 * For non-platform devices, a new callback would be required.
+	 *
+	 * If the aperture helpers ever need to handle native drivers, this call
+	 * would only have to unplug the DRM device, so that the hardware device
+	 * stays around after detachment.
+	 */
+	platform_device_unregister(pdev);
+}
+
+/**
+ * devm_aperture_acquire_from_firmware - Acquires ownership of a firmware framebuffer
+ *                                       on behalf of a DRM driver.
+ * @dev:	the DRM device to own the framebuffer memory
+ * @base:	the framebuffer's byte offset in physical memory
+ * @size:	the framebuffer size in bytes
+ *
+ * Installs the given device as the new owner of the framebuffer. The function
+ * expects the framebuffer to be provided by a platform device that has been
+ * set up by firmware. Firmware can be any generic interface, such as EFI,
+ * VESA, VGA, etc. If the native hardware driver takes over ownership of the
+ * framebuffer range, the firmware state gets lost. Aperture helpers will then
+ * unregister the platform device automatically. Acquired apertures are
+ * released automatically if the underlying device goes away.
+ *
+ * The function fails if the framebuffer range, or parts of it, is currently
+ * owned by another driver. To evict current owners, callers should use
+ * drm_aperture_remove_conflicting_framebuffers() et al. before calling this
+ * function. The function also fails if the given device is not a platform
+ * device.
+ *
+ * Returns:
+ * 0 on success, or a negative errno value otherwise.
+ */
+int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t base,
+					resource_size_t size)
+{
+	if (drm_WARN_ON(dev, !dev_is_platform(dev->dev)))
+		return -EINVAL;
+
+	return devm_aperture_acquire(dev, base, size, drm_aperture_detach_firmware);
+}
+EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
+
+static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
+{
+	resource_size_t end = base + size;
+	struct list_head *pos, *n;
+
+	mutex_lock(&drm_apertures_lock);
+
+	list_for_each_safe(pos, n, &drm_apertures) {
+		struct drm_aperture *ap =
+			container_of(pos, struct drm_aperture, lh);
+		struct drm_device *dev = ap->dev;
+
+		if (WARN_ON_ONCE(!dev))
+			continue;
+
+		if (!overlap(base, end, ap->base, ap->base + ap->size))
+			continue;
+
+		ap->dev = NULL; /* detach from device */
+		list_del(&ap->lh);
+
+		ap->detach(dev);
+	}
+
+	mutex_unlock(&drm_apertures_lock);
+}
+
 /**
  * drm_aperture_remove_conflicting_framebuffers - remove existing framebuffers in the given range
  * @base: the aperture's base address in physical memory
@@ -94,10 +295,13 @@ int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_
 	ret = remove_conflicting_framebuffers(a, name, primary);
 	kfree(a);
 
-	return ret;
-#else
-	return 0;
+	if (ret)
+		return ret;
 #endif
+
+	drm_aperture_detach_drivers(base, size);
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 
@@ -115,7 +319,16 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
  */
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name)
 {
-	int ret = 0;
+	resource_size_t base, size;
+	int bar, ret = 0;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
+		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+			continue;
+		base = pci_resource_start(pdev, bar);
+		size = pci_resource_len(pdev, bar);
+		drm_aperture_detach_drivers(base, size);
+	}
 
 	/*
 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
index 23cc01647ed3..6c148078780c 100644
--- a/include/drm/drm_aperture.h
+++ b/include/drm/drm_aperture.h
@@ -5,8 +5,12 @@
 
 #include <linux/types.h>
 
+struct drm_device;
 struct pci_dev;
 
+int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t base,
+					resource_size_t size);
+
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
 						 bool primary, const char *name);
 
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
