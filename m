Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A21340336
	for <lists.virtualization@lfdr.de>; Thu, 18 Mar 2021 11:29:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F94E43292;
	Thu, 18 Mar 2021 10:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jX7OkCagdY4d; Thu, 18 Mar 2021 10:29:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB9DE41566;
	Thu, 18 Mar 2021 10:29:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C4FAC0001;
	Thu, 18 Mar 2021 10:29:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2C06C0012
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCEA982EFC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_3rPggwvZ_z
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4C5C82E69
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:29:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E05AAC1E;
 Thu, 18 Mar 2021 10:29:26 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net
Subject: [PATCH v2 03/10] drm/aperture: Move fbdev conflict helpers into
 drm_aperture.h
Date: Thu, 18 Mar 2021 11:29:14 +0100
Message-Id: <20210318102921.21536-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318102921.21536-1-tzimmermann@suse.de>
References: <20210318102921.21536-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
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

Fbdev's helpers for handling conflicting framebuffers are related to
framebuffer apertures, not console emulation. Therefore move them into a
drm_aperture.h, which will contain the interfaces for the new aperture
helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 Documentation/gpu/drm-internals.rst |  6 +++
 include/drm/drm_aperture.h          | 60 +++++++++++++++++++++++++++++
 include/drm/drm_fb_helper.h         | 56 ++-------------------------
 3 files changed, 69 insertions(+), 53 deletions(-)
 create mode 100644 include/drm/drm_aperture.h

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 12272b168580..4c7642d2ca34 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -75,6 +75,12 @@ update it, its value is mostly useless. The DRM core prints it to the
 kernel log at initialization time and passes it to userspace through the
 DRM_IOCTL_VERSION ioctl.
 
+Managing Ownership of the Framebuffer Aperture
+----------------------------------------------
+
+.. kernel-doc:: include/drm/drm_aperture.h
+   :internal:
+
 Device Instance and Driver Handling
 -----------------------------------
 
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
new file mode 100644
index 000000000000..13766efe9517
--- /dev/null
+++ b/include/drm/drm_aperture.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _DRM_APERTURE_H_
+#define _DRM_APERTURE_H_
+
+#include <linux/fb.h>
+#include <linux/vgaarb.h>
+
+/**
+ * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
+ * @a: memory range, users of which are to be removed
+ * @name: requesting driver name
+ * @primary: also kick vga16fb if present
+ *
+ * This function removes framebuffer devices (initialized by firmware/bootloader)
+ * which use memory range described by @a. If @a is NULL all such devices are
+ * removed.
+ */
+static inline int
+drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
+					      const char *name, bool primary)
+{
+#if IS_REACHABLE(CONFIG_FB)
+	return remove_conflicting_framebuffers(a, name, primary);
+#else
+	return 0;
+#endif
+}
+
+/**
+ * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured
+ *                                                     framebuffers for PCI devices
+ * @pdev: PCI device
+ * @name: requesting driver name
+ *
+ * This function removes framebuffer devices (eg. initialized by firmware)
+ * using memory range configured for any of @pdev's memory bars.
+ *
+ * The function assumes that PCI device with shadowed ROM drives a primary
+ * display and so kicks out vga16fb.
+ */
+static inline int
+drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
+						  const char *name)
+{
+	int ret = 0;
+
+	/*
+	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
+	 * otherwise the vga fbdev driver falls over.
+	 */
+#if IS_REACHABLE(CONFIG_FB)
+	ret = remove_conflicting_pci_framebuffers(pdev, name);
+#endif
+	if (ret == 0)
+		ret = vga_remove_vgacon(pdev);
+	return ret;
+}
+
+#endif
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3b273f9ca39a..d06a3942fddb 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -30,13 +30,13 @@
 #ifndef DRM_FB_HELPER_H
 #define DRM_FB_HELPER_H
 
-struct drm_fb_helper;
-
+#include <drm/drm_aperture.h>
 #include <drm/drm_client.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <linux/kgdb.h>
-#include <linux/vgaarb.h>
+
+struct drm_fb_helper;
 
 enum mode_set_atomic {
 	LEAVE_ATOMIC_MODE_SET,
@@ -451,54 +451,4 @@ drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 
 #endif
 
-/**
- * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
- * @a: memory range, users of which are to be removed
- * @name: requesting driver name
- * @primary: also kick vga16fb if present
- *
- * This function removes framebuffer devices (initialized by firmware/bootloader)
- * which use memory range described by @a. If @a is NULL all such devices are
- * removed.
- */
-static inline int
-drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
-					      const char *name, bool primary)
-{
-#if IS_REACHABLE(CONFIG_FB)
-	return remove_conflicting_framebuffers(a, name, primary);
-#else
-	return 0;
-#endif
-}
-
-/**
- * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
- * @pdev: PCI device
- * @name: requesting driver name
- *
- * This function removes framebuffer devices (eg. initialized by firmware)
- * using memory range configured for any of @pdev's memory bars.
- *
- * The function assumes that PCI device with shadowed ROM drives a primary
- * display and so kicks out vga16fb.
- */
-static inline int
-drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
-						  const char *name)
-{
-	int ret = 0;
-
-	/*
-	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-	 * otherwise the vga fbdev driver falls over.
-	 */
-#if IS_REACHABLE(CONFIG_FB)
-	ret = remove_conflicting_pci_framebuffers(pdev, name);
-#endif
-	if (ret == 0)
-		ret = vga_remove_vgacon(pdev);
-	return ret;
-}
-
 #endif
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
