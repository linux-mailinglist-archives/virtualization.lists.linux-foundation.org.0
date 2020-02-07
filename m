Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 417C5155776
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 13:14:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 012D882067;
	Fri,  7 Feb 2020 12:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iy9DEm0v0r86; Fri,  7 Feb 2020 12:14:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7615381DD2;
	Fri,  7 Feb 2020 12:14:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 571A5C013E;
	Fri,  7 Feb 2020 12:14:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25426C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0F00387E55
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ah47xwAlE14a
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:14:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3404687E53
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581077656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=HPolVK3TlmNTaweClvM7JUT5pDu7rY7SbMpa8C96AzI=;
 b=ePK26y1/d8XYyetyinDL+V8WD65yhpFlUSLntguKyXlYURUWCmQ5pQJ5n+CVzrUaKQDKaa
 P7FvuGScBSl7hGQSobhPIyrwETNYBc3Onf1/PXPGizfUoHfMBpwgv++4Spz1sZkWVyKfqO
 h2KTWbxqgw+ALbWML44yWNdIFM/R85g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-HXij-0yAMwaTx6MzNAnnlQ-1; Fri, 07 Feb 2020 07:14:11 -0500
X-MC-Unique: HXij-0yAMwaTx6MzNAnnlQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9603B2EE3;
 Fri,  7 Feb 2020 12:14:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89B025DA7E;
 Fri,  7 Feb 2020 12:14:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB5671747D; Fri,  7 Feb 2020 13:14:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: add drm_driver.release callback.
Date: Fri,  7 Feb 2020 13:14:05 +0100
Message-Id: <20200207121405.25895-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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

Move final cleanups to qxl_drm_release() callback.
Add drm_atomic_helper_shutdown() call to qxl_pci_remove().

Reorder calls in qxl_device_fini().  Cleaning up gem & ttm
might trigger qxl commands, so we should do that before
releaseing command rings.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 21 ++++++++++++++-------
 drivers/gpu/drm/qxl/qxl_kms.c |  8 ++++----
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1d601f57a6ba..8044363ba0f2 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -34,6 +34,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_modeset_helper.h>
@@ -132,21 +133,25 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return ret;
 }
 
+static void qxl_drm_release(struct drm_device *dev)
+{
+	struct qxl_device *qdev = dev->dev_private;
+
+	qxl_modeset_fini(qdev);
+	qxl_device_fini(qdev);
+	dev->dev_private = NULL;
+	kfree(qdev);
+}
+
 static void
 qxl_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct qxl_device *qdev = dev->dev_private;
 
 	drm_dev_unregister(dev);
-
-	qxl_modeset_fini(qdev);
-	qxl_device_fini(qdev);
+	drm_atomic_helper_shutdown(dev);
 	if (is_vga(pdev))
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
-
-	dev->dev_private = NULL;
-	kfree(qdev);
 	drm_dev_put(dev);
 }
 
@@ -279,6 +284,8 @@ static struct drm_driver qxl_driver = {
 	.major = 0,
 	.minor = 1,
 	.patchlevel = 0,
+
+	.release = qxl_drm_release,
 };
 
 static int __init qxl_init(void)
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index bfc1631093e9..70b20ee4741a 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -299,12 +299,12 @@ void qxl_device_fini(struct qxl_device *qdev)
 {
 	qxl_bo_unref(&qdev->current_release_bo[0]);
 	qxl_bo_unref(&qdev->current_release_bo[1]);
-	flush_work(&qdev->gc_work);
-	qxl_ring_free(qdev->command_ring);
-	qxl_ring_free(qdev->cursor_ring);
-	qxl_ring_free(qdev->release_ring);
 	qxl_gem_fini(qdev);
 	qxl_bo_fini(qdev);
+	flush_work(&qdev->gc_work);
+	qxl_ring_free(qdev->command_ring);
+	qxl_ring_free(qdev->cursor_ring);
+	qxl_ring_free(qdev->release_ring);
 	io_mapping_free(qdev->surface_mapping);
 	io_mapping_free(qdev->vram_mapping);
 	iounmap(qdev->ram_header);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
