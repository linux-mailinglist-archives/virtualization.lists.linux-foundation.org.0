Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B3798BAC
	for <lists.virtualization@lfdr.de>; Thu, 22 Aug 2019 08:51:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 59440CD4;
	Thu, 22 Aug 2019 06:50:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DE484CBF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 943AF89B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 224BA89F38E;
	Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B489E58B5;
	Thu, 22 Aug 2019 06:50:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E57E77F; Thu, 22 Aug 2019 08:50:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm/bochs: drop yres_virtual from struct bochs_device
Date: Thu, 22 Aug 2019 08:50:39 +0200
Message-Id: <20190822065041.11941-3-kraxel@redhat.com>
In-Reply-To: <20190822065041.11941-1-kraxel@redhat.com>
References: <20190822065041.11941-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>
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

Not needed, writing to VBE_DISPI_INDEX_VIRT_HEIGHT has no effect anyway.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/bochs/bochs.h    | 1 -
 drivers/gpu/drm/bochs/bochs_hw.c | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index ed16840411f1..6aae494ffbe8 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -62,7 +62,6 @@ struct bochs_device {
 	/* mode */
 	u16 xres;
 	u16 yres;
-	u16 yres_virtual;
 	u32 stride;
 	u32 bpp;
 	struct edid *edid;
diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index 949930d8a92f..2657b2e6e4d8 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -211,11 +211,9 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 	bochs->yres = mode->vdisplay;
 	bochs->bpp = 32;
 	bochs->stride = mode->hdisplay * (bochs->bpp / 8);
-	bochs->yres_virtual = bochs->fb_size / bochs->stride;
 
-	DRM_DEBUG_DRIVER("%dx%d @ %d bpp, vy %d\n",
-			 bochs->xres, bochs->yres, bochs->bpp,
-			 bochs->yres_virtual);
+	DRM_DEBUG_DRIVER("%dx%d @ %d bpp\n",
+			 bochs->xres, bochs->yres, bochs->bpp);
 
 	bochs_vga_writeb(bochs, 0x3c0, 0x20); /* unblank */
 
@@ -225,8 +223,6 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_YRES,        bochs->yres);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BANK,        0);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH,  bochs->xres);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_HEIGHT,
-			  bochs->yres_virtual);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET,    0);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET,    0);
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
