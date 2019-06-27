Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BE27758279
	for <lists.virtualization@lfdr.de>; Thu, 27 Jun 2019 14:24:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AFC0ECAC;
	Thu, 27 Jun 2019 12:24:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3F70BF27
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 12:24:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 09F9C82F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 12:24:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6653230089B5;
	Thu, 27 Jun 2019 12:23:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
	[10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 029B45D71C;
	Thu, 27 Jun 2019 12:23:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5126916E36; Thu, 27 Jun 2019 14:23:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/bochs: drop stride and bpp from struct bochs_device
Date: Thu, 27 Jun 2019 14:23:47 +0200
Message-Id: <20190627122348.5833-5-kraxel@redhat.com>
In-Reply-To: <20190627122348.5833-1-kraxel@redhat.com>
References: <20190627122348.5833-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 27 Jun 2019 12:24:02 +0000 (UTC)
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

No need to store that, struct drm_framebuffer has all we need.

Also update VBE_DISPI_INDEX_VIRT_WIDTH register, otherwise we'll
have a fixes broken display in case pitch != width * cpp.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/bochs/bochs.h     |  2 --
 drivers/gpu/drm/bochs/bochs_hw.c  | 18 +++++++++---------
 drivers/gpu/drm/bochs/bochs_kms.c |  2 +-
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index 5c90b76708ef..4081b3aba28d 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -64,8 +64,6 @@ struct bochs_device {
 	/* mode */
 	u16 xres;
 	u16 yres;
-	u32 stride;
-	u32 bpp;
 	struct edid *edid;
 
 	/* drm */
diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index 9ab6ec269ef9..178715c6755d 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -205,16 +205,14 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 {
 	bochs->xres = mode->hdisplay;
 	bochs->yres = mode->vdisplay;
-	bochs->bpp = 32;
-	bochs->stride = mode->hdisplay * (bochs->bpp / 8);
 
-	DRM_DEBUG_DRIVER("%dx%d @ %d bpp\n",
-			 bochs->xres, bochs->yres, bochs->bpp);
+	DRM_DEBUG_DRIVER("%dx%d\n",
+			 bochs->xres, bochs->yres);
 
 	bochs_vga_writeb(bochs, 0x3c0, 0x20); /* unblank */
 
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
-	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp);
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         32);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_XRES,        bochs->xres);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_YRES,        bochs->yres);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BANK,        0);
@@ -256,11 +254,13 @@ void bochs_hw_setfb(struct bochs_device *bochs,
 {
 	struct drm_gem_vram_object *bo = drm_gem_vram_of_gem(fb->obj[0]);
 	unsigned long offset = bo->bo.offset +
-		y * bochs->stride +
-		x * (bochs->bpp / 8);
-	int vy = offset / bochs->stride;
-	int vx = (offset % bochs->stride) * 8 / bochs->bpp;
+		y * fb->pitches[0] +
+		x * fb->format->cpp[0];
+	int vy = offset / fb->pitches[0];
+	int vx = (offset % fb->pitches[0]) / fb->format->cpp[0];
+	int vw = fb->pitches[0] / fb->format->cpp[0];
 
+	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH, vw);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET, vx);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET, vy);
 }
diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index ddbf0802138d..28edfb2772ff 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -27,7 +27,7 @@ static const uint32_t bochs_formats[] = {
 static void bochs_plane_update(struct bochs_device *bochs,
 			       struct drm_plane_state *state)
 {
-	if (!state->fb || !bochs->stride)
+	if (!state->fb)
 		return;
 
 	bochs_hw_setfb(bochs, state->fb,
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
