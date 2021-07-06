Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6D3BC772
	for <lists.virtualization@lfdr.de>; Tue,  6 Jul 2021 09:47:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 478C540025;
	Tue,  6 Jul 2021 07:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ual5yuT2Fqdd; Tue,  6 Jul 2021 07:47:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EC6A640163;
	Tue,  6 Jul 2021 07:47:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 622F6C0022;
	Tue,  6 Jul 2021 07:47:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AF36C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 07:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CB7E6070F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 07:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="G2NPq8A1";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="qQd6fR4u"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xkHb8rBImVXo
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 07:47:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D2E36066C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 07:47:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F85E2267D;
 Tue,  6 Jul 2021 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625557657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OOEMKHLnj2v83lJXaqLqWz0H+CjzlLXgAV1dW0vTbUE=;
 b=G2NPq8A1JJaK0+DxLpT7Dt1N9kXw8lx7j6c0zpxrnmwLgSF3K8QNBiMaSqxeyJlObOt3px
 DvCzQX6Kcgtn0VmFOh+zcq6UgtaHBmrcKxqtlhiefW0da9OerHr+ZjOS4J/6pXMSTeBAnb
 kZ6uu5vEln+p9a1Lc6fRKQAqwRzkueI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625557657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OOEMKHLnj2v83lJXaqLqWz0H+CjzlLXgAV1dW0vTbUE=;
 b=qQd6fR4u28ij0kuXXJz40CZYpDw0kax5OmpO6YnFUmAn9JKVuSckaf3iqSeeqq+sAvz5/Q
 K9bYBYVKR8WlWsAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25A4913A42;
 Tue,  6 Jul 2021 07:47:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YYXfB5kK5GAYbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 07:47:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/qxl: Convert to Linux IRQ interfaces
Date: Tue,  6 Jul 2021 09:47:35 +0200
Message-Id: <20210706074735.8849-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 1 -
 drivers/gpu/drm/qxl/qxl_drv.h | 1 -
 drivers/gpu/drm/qxl/qxl_irq.c | 9 +++++----
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 31f4c86ceb99..cfd3fbda6df6 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -284,7 +284,6 @@ static struct drm_driver qxl_driver = {
 	.gem_prime_mmap = qxl_gem_prime_mmap,
 	.fops = &qxl_fops,
 	.ioctls = qxl_ioctls,
-	.irq_handler = qxl_irq_handler,
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index dd6abee55f56..717c2d270f04 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -439,7 +439,6 @@ int qxl_gem_prime_mmap(struct drm_gem_object *obj,
 
 /* qxl_irq.c */
 int qxl_irq_init(struct qxl_device *qdev);
-irqreturn_t qxl_irq_handler(int irq, void *arg);
 
 void qxl_debugfs_add_files(struct qxl_device *qdev,
 			   struct drm_info_list *files,
diff --git a/drivers/gpu/drm/qxl/qxl_irq.c b/drivers/gpu/drm/qxl/qxl_irq.c
index d312322cacd1..665278ee3b6d 100644
--- a/drivers/gpu/drm/qxl/qxl_irq.c
+++ b/drivers/gpu/drm/qxl/qxl_irq.c
@@ -25,11 +25,11 @@
 
 #include <linux/pci.h>
 
-#include <drm/drm_irq.h>
+#include <drm/drm_drv.h>
 
 #include "qxl_drv.h"
 
-irqreturn_t qxl_irq_handler(int irq, void *arg)
+static irqreturn_t qxl_irq_handler(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *) arg;
 	struct qxl_device *qdev = to_qxl(dev);
@@ -81,7 +81,8 @@ static void qxl_client_monitors_config_work_func(struct work_struct *work)
 
 int qxl_irq_init(struct qxl_device *qdev)
 {
-	struct pci_dev *pdev = to_pci_dev(qdev->ddev.dev);
+	struct drm_device *ddev = &qdev->ddev;
+	struct pci_dev *pdev = to_pci_dev(ddev->dev);
 	int ret;
 
 	init_waitqueue_head(&qdev->display_event);
@@ -95,7 +96,7 @@ int qxl_irq_init(struct qxl_device *qdev)
 	atomic_set(&qdev->irq_received_cursor, 0);
 	atomic_set(&qdev->irq_received_io_cmd, 0);
 	qdev->irq_received_error = 0;
-	ret = drm_irq_install(&qdev->ddev, pdev->irq);
+	ret = request_irq(pdev->irq, qxl_irq_handler, IRQF_SHARED, ddev->driver->name, ddev);
 	qdev->ram_header->int_mask = QXL_INTERRUPT_MASK;
 	if (unlikely(ret != 0)) {
 		DRM_ERROR("Failed installing irq: %d\n", ret);
-- 
2.32.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
