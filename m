Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ED895127A67
	for <lists.virtualization@lfdr.de>; Fri, 20 Dec 2019 12:59:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E0B287278;
	Fri, 20 Dec 2019 11:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNhh_t7HqU7K; Fri, 20 Dec 2019 11:59:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 36B518726A;
	Fri, 20 Dec 2019 11:59:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20DC4C077D;
	Fri, 20 Dec 2019 11:59:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71C47C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 11:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 591D68727C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 11:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLrtqASv_4m7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 11:59:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B576487264
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 11:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576843186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=HPolVK3TlmNTaweClvM7JUT5pDu7rY7SbMpa8C96AzI=;
 b=SPfCFJfDfHu/knBHrZZiIvlRehk7fa2j/pQV0oSpu9+bQgg0FvPq6XsUS65ZzwQGbSCb+v
 EYQUb9FuPMWjJelc/ECNG5WTfV9ytKiXAb+z18pwodBlpL0fPn34u7aQ0ATaCip0LyOmqi
 oJH/EVPJeEQ0uS5mmZFWcR+H7bg45iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-Q0IPQFIwPF6epFmzkN29FQ-1; Fri, 20 Dec 2019 06:59:40 -0500
X-MC-Unique: Q0IPQFIwPF6epFmzkN29FQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E5942275;
 Fri, 20 Dec 2019 11:59:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A796F6B566;
 Fri, 20 Dec 2019 11:59:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E25BA40060; Fri, 20 Dec 2019 12:59:35 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/qxl: add drm_driver.release callback.
Date: Fri, 20 Dec 2019 12:59:35 +0100
Message-Id: <20191220115935.15152-5-kraxel@redhat.com>
In-Reply-To: <20191220115935.15152-1-kraxel@redhat.com>
References: <20191220115935.15152-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
