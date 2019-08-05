Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E966481799
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 12:54:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D7175E60;
	Mon,  5 Aug 2019 10:54:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 302EFA7F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 10:54:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C8FEF5E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 10:54:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 448B2C057F20;
	Mon,  5 Aug 2019 10:54:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
	[10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 497CE5C1D6;
	Mon,  5 Aug 2019 10:54:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 75E6916E08; Mon,  5 Aug 2019 12:54:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/qxl: get vga ioports
Date: Mon,  5 Aug 2019 12:54:01 +0200
Message-Id: <20190805105401.29874-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 05 Aug 2019 10:54:21 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
	Frediano Ziglio <fziglio@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

qxl has two modes: "native" (used by the drm driver) and "vga" (vga
compatibility mode, typically used for boot display and firmware
framebuffers).

Accessing any vga ioport will switch the qxl device into vga mode.
The qxl driver never does that, but other drivers accessing vga ports
can trigger that too and therefore disturb qxl operation.  So aquire
the legacy vga ioports from vgaarb to avoid that.

Reproducer: Boot kvm guest with both qxl and i915 vgpu, with qxl being
first in pci scan order.

v2: Skip this for secondary qxl cards which don't have vga mode in the
    first place (Frediano).

Cc: Frediano Ziglio <fziglio@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index b57a37543613..fcb48ac60598 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -63,6 +63,11 @@ module_param_named(num_heads, qxl_num_crtc, int, 0400);
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
+static bool is_vga(struct pci_dev *pdev)
+{
+	return pdev->class == PCI_CLASS_DISPLAY_VGA << 8;
+}
+
 static int
 qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
@@ -87,9 +92,17 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto disable_pci;
 
+	if (is_vga(pdev)) {
+		ret = vga_get_interruptible(pdev, VGA_RSRC_LEGACY_IO);
+		if (ret) {
+			DRM_ERROR("can't get legacy vga ioports\n");
+			goto disable_pci;
+		}
+	}
+
 	ret = qxl_device_init(qdev, &qxl_driver, pdev);
 	if (ret)
-		goto disable_pci;
+		goto put_vga;
 
 	ret = qxl_modeset_init(qdev);
 	if (ret)
@@ -109,6 +122,9 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	qxl_modeset_fini(qdev);
 unload:
 	qxl_device_fini(qdev);
+put_vga:
+	if (is_vga(pdev))
+		vga_put(pdev, VGA_RSRC_LEGACY_IO);
 disable_pci:
 	pci_disable_device(pdev);
 free_dev:
@@ -126,6 +142,8 @@ qxl_pci_remove(struct pci_dev *pdev)
 
 	qxl_modeset_fini(qdev);
 	qxl_device_fini(qdev);
+	if (is_vga(pdev))
+		vga_put(pdev, VGA_RSRC_LEGACY_IO);
 
 	dev->dev_private = NULL;
 	kfree(qdev);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
