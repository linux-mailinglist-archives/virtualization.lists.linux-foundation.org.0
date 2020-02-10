Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9731571DB
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 10:38:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6BA118444E;
	Mon, 10 Feb 2020 09:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngZCDkQR+O03; Mon, 10 Feb 2020 09:38:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D2B838472A;
	Mon, 10 Feb 2020 09:38:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA405C1796;
	Mon, 10 Feb 2020 09:38:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A01BC1796
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 76A55864EF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4gub8wcLMaS
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:38:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BB94B861E6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581327500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=xX7Esd2LjoEl226z40syD0xaVDhvEyrAmaske0/4mxc=;
 b=JDb6pzINuqfO/dbbwmgrp1esh2Lp7ZlrrXps3BddvSVKHGMlWltnqaLDLAK8S6oMEC4XVB
 LpzEPW4i+nwGOWpEOslN2Ib6qdHNa1XrKIxx5wtnjXNH2NAT3ArE6opbBxtqdsB9igcDEr
 tMDwI7VQnfzFsTTpKK54oT0gV5h9EC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412--gqScj6WOSSVCRv19KO4gA-1; Mon, 10 Feb 2020 04:38:06 -0500
X-MC-Unique: -gqScj6WOSSVCRv19KO4gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93B898018DE;
 Mon, 10 Feb 2020 09:38:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 313D25C1D4;
 Mon, 10 Feb 2020 09:38:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6CEF8A1E0; Mon, 10 Feb 2020 10:38:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bochs: add drm_driver.release callback.
Date: Mon, 10 Feb 2020 10:38:01 +0100
Message-Id: <20200210093801.4773-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 daniel@ffwll.ch, "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Call drm_dev_unregister() first in bochs_pci_remove().  Hook
bochs_unload() into the new .release callback, to make sure cleanup
is done when all users are gone.

Add ready bool to state struct and move bochs_hw_fini() call from
bochs_unload() to bochs_pci_remove() to make sure hardware is not
touched after bochs_pci_remove returns.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/bochs/bochs.h     |  1 +
 drivers/gpu/drm/bochs/bochs_drv.c |  6 +++---
 drivers/gpu/drm/bochs/bochs_hw.c  | 14 ++++++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index 917767173ee6..f6bce8669274 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -57,6 +57,7 @@ struct bochs_device {
 	unsigned long  fb_base;
 	unsigned long  fb_size;
 	unsigned long  qext_size;
+	bool           ready;
 
 	/* mode */
 	u16 xres;
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index 10460878414e..60b5492739ef 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -23,7 +23,6 @@ static void bochs_unload(struct drm_device *dev)
 
 	bochs_kms_fini(bochs);
 	bochs_mm_fini(bochs);
-	bochs_hw_fini(dev);
 	kfree(bochs);
 	dev->dev_private = NULL;
 }
@@ -69,6 +68,7 @@ static struct drm_driver bochs_driver = {
 	.major			= 1,
 	.minor			= 0,
 	DRM_GEM_VRAM_DRIVER,
+	.release                = bochs_unload,
 };
 
 /* ---------------------------------------------------------------------- */
@@ -148,9 +148,9 @@ static void bochs_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-	drm_atomic_helper_shutdown(dev);
 	drm_dev_unregister(dev);
-	bochs_unload(dev);
+	drm_atomic_helper_shutdown(dev);
+	bochs_hw_fini(dev);
 	drm_dev_put(dev);
 }
 
diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index b615b7dfdd9d..48c1a6a8b026 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -168,6 +168,7 @@ int bochs_hw_init(struct drm_device *dev)
 	}
 	bochs->fb_base = addr;
 	bochs->fb_size = size;
+	bochs->ready = true;
 
 	DRM_INFO("Found bochs VGA, ID 0x%x.\n", id);
 	DRM_INFO("Framebuffer size %ld kB @ 0x%lx, %s @ 0x%lx.\n",
@@ -194,6 +195,10 @@ void bochs_hw_fini(struct drm_device *dev)
 {
 	struct bochs_device *bochs = dev->dev_private;
 
+	bochs->ready = false;
+
+	/* TODO: shot down existing vram mappings */
+
 	if (bochs->mmio)
 		iounmap(bochs->mmio);
 	if (bochs->ioports)
@@ -207,6 +212,9 @@ void bochs_hw_fini(struct drm_device *dev)
 void bochs_hw_setmode(struct bochs_device *bochs,
 		      struct drm_display_mode *mode)
 {
+	if (!bochs->ready)
+		return;
+
 	bochs->xres = mode->hdisplay;
 	bochs->yres = mode->vdisplay;
 	bochs->bpp = 32;
@@ -237,6 +245,9 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 void bochs_hw_setformat(struct bochs_device *bochs,
 			const struct drm_format_info *format)
 {
+	if (!bochs->ready)
+		return;
+
 	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
 			 (format->format >>  0) & 0xff,
 			 (format->format >>  8) & 0xff,
@@ -264,6 +275,9 @@ void bochs_hw_setbase(struct bochs_device *bochs,
 	unsigned long offset;
 	unsigned int vx, vy, vwidth;
 
+	if (!bochs->ready)
+		return;
+
 	bochs->stride = stride;
 	offset = (unsigned long)addr +
 		y * bochs->stride +
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
