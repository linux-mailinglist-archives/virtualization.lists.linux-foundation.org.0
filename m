Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C14E15D89E
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 14:36:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB3D286448;
	Fri, 14 Feb 2020 13:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UrxMTwTKByTV; Fri, 14 Feb 2020 13:36:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96ACC864D0;
	Fri, 14 Feb 2020 13:36:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7074AC0177;
	Fri, 14 Feb 2020 13:36:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E22C8C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 13:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D9EB120409
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 13:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGuqQdyCIJ4E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 13:36:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 6792F2036D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 13:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581687412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=GPmWxWPeWyJ4yanqYjqxsJb9kwmyfMzyZLJQdEXDG7w=;
 b=jUooLahymxccqZnQGbXaolLGHi/pEoqo6Rl9WKKlmLG3gyfw2uzBQc5SbHBAhfTqWxdJbF
 FvRTcWA7dTDSkwN4oUGDNFs+DfHbGuq2lsDHY6RGbPeEnFSAz9LZc8YKXyRyo/Om5WtNub
 HEBApgfY29BH4bVSeBxgT5gjFgXFuHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-eg9f1bVuMrOagcdCz0u9Aw-1; Fri, 14 Feb 2020 08:36:50 -0500
X-MC-Unique: eg9f1bVuMrOagcdCz0u9Aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 875D8107ACCA;
 Fri, 14 Feb 2020 13:36:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A2065DD72;
 Fri, 14 Feb 2020 13:36:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D33741747F; Fri, 14 Feb 2020 14:36:45 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: don't take vga ports on rev5+
Date: Fri, 14 Feb 2020 14:36:45 +0100
Message-Id: <20200214133645.30977-1-kraxel@redhat.com>
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

qemu 5.0 introduces a new qxl hardware revision 5.  Unlike revision 4
(and below) the device doesn't switch back into vga compatibility mode
when someone touches the vga ports.  So we don't have to reserve the
vga ports any more to avoid that happening.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 4fda3f9b29f4..afea743989dd 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -93,7 +93,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto disable_pci;
 
-	if (is_vga(pdev)) {
+	if (is_vga(pdev) && pdev->revision < 5) {
 		ret = vga_get_interruptible(pdev, VGA_RSRC_LEGACY_IO);
 		if (ret) {
 			DRM_ERROR("can't get legacy vga ioports\n");
@@ -124,7 +124,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 unload:
 	qxl_device_fini(qdev);
 put_vga:
-	if (is_vga(pdev))
+	if (is_vga(pdev) && pdev->revision < 5)
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
 disable_pci:
 	pci_disable_device(pdev);
@@ -155,7 +155,7 @@ qxl_pci_remove(struct pci_dev *pdev)
 
 	drm_dev_unregister(dev);
 	drm_atomic_helper_shutdown(dev);
-	if (is_vga(pdev))
+	if (is_vga(pdev) && pdev->revision < 5)
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
 	drm_dev_put(dev);
 }
-- 
2.18.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
