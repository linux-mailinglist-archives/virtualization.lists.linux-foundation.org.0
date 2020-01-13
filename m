Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9543B138F4E
	for <lists.virtualization@lfdr.de>; Mon, 13 Jan 2020 11:38:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0EDB98708F;
	Mon, 13 Jan 2020 10:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnZz0nQg69uc; Mon, 13 Jan 2020 10:38:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BBF9187158;
	Mon, 13 Jan 2020 10:38:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 927E8C077D;
	Mon, 13 Jan 2020 10:38:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B08C3C077D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 10:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9F08D85142
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 10:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5zVRPzFnjvG
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 10:38:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 728C08558F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 10:38:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C3522B18C;
 Mon, 13 Jan 2020 10:38:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events by
 default
Date: Mon, 13 Jan 2020 11:38:22 +0100
Message-Id: <20200113103822.24473-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113103822.24473-1-tzimmermann@suse.de>
References: <20200113103822.24473-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.or,
 Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
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

In drm_atomic_helper_fake_vblank() the DRM core sends out VBLANK events
if struct drm_crtc_state.no_vblank is enabled in the check() callbacks.

For drivers that have neither an enable_vblank() callback nor a check()
callback, the simple-KMS helpers enable VBLANK generation by default. This
simplifies bochs, udl, several tiny drivers, and drivers based upon MIPI
DPI helpers. The driver for Xen explicitly disables no_vblank, as it has
its own logic for sending these events.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/bochs/bochs_kms.c       |  9 ---------
 drivers/gpu/drm/drm_mipi_dbi.c          |  9 ---------
 drivers/gpu/drm/drm_simple_kms_helper.c | 19 +++++++++++++++----
 drivers/gpu/drm/tiny/gm12u320.c         |  9 ---------
 drivers/gpu/drm/tiny/ili9225.c          |  9 ---------
 drivers/gpu/drm/tiny/repaper.c          |  9 ---------
 drivers/gpu/drm/tiny/st7586.c           |  9 ---------
 drivers/gpu/drm/udl/udl_modeset.c       | 11 -----------
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 13 +++++++++++++
 9 files changed, 28 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 3f0006c2470d..ff275faee88d 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -7,7 +7,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "bochs.h"
 
@@ -57,16 +56,8 @@ static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
 			      struct drm_plane_state *old_state)
 {
 	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
-	struct drm_crtc *crtc = &pipe->crtc;
 
 	bochs_plane_update(bochs, pipe->plane.state);
-
-	if (crtc->state->event) {
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		crtc->state->event = NULL;
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
 }
 
 static const struct drm_simple_display_pipe_funcs bochs_pipe_funcs = {
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 16bff1be4b8a..13b753cb3f67 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -24,7 +24,6 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
-#include <drm/drm_vblank.h>
 #include <video/mipi_display.h>
 
 #define MIPI_DBI_MAX_SPI_READ_SPEED 2000000 /* 2MHz */
@@ -299,18 +298,10 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 			  struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		mipi_dbi_fb_dirty(state->fb, &rect);
-
-	if (crtc->state->event) {
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-		crtc->state->event = NULL;
-	}
 }
 EXPORT_SYMBOL(mipi_dbi_pipe_update);
 
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 15fb516ae2d8..4414c7a5b2ce 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -146,10 +146,21 @@ static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
 	if (!plane_state->visible)
 		return 0;
 
-	if (!pipe->funcs || !pipe->funcs->check)
-		return 0;
-
-	return pipe->funcs->check(pipe, plane_state, crtc_state);
+	if (pipe->funcs) {
+		if (pipe->funcs->check)
+			return pipe->funcs->check(pipe, plane_state,
+						  crtc_state);
+		if (pipe->funcs->enable_vblank)
+			return 0;
+	}
+
+	/* Drivers without VBLANK support have to fake VBLANK events. As
+	 * there's no check() callback to enable this, set the no_vblank
+	 * field by default.
+	 */
+	crtc_state->no_vblank = true;
+
+	return 0;
 }
 
 static void drm_simple_kms_plane_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 94fb1f593564..a48173441ae0 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -22,7 +22,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/drm_vblank.h>
 
 static bool eco_mode;
 module_param(eco_mode, bool, 0644);
@@ -610,18 +609,10 @@ static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
 				 struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		gm12u320_fb_mark_dirty(pipe->plane.state->fb, &rect);
-
-	if (crtc->state->event) {
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		crtc->state->event = NULL;
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
 }
 
 static const struct drm_simple_display_pipe_funcs gm12u320_pipe_funcs = {
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index c66acc566c2b..802fb8dde1b6 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -26,7 +26,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_rect.h>
-#include <drm/drm_vblank.h>
 
 #define ILI9225_DRIVER_READ_CODE	0x00
 #define ILI9225_DRIVER_OUTPUT_CONTROL	0x01
@@ -165,18 +164,10 @@ static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		ili9225_fb_dirty(state->fb, &rect);
-
-	if (crtc->state->event) {
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-		crtc->state->event = NULL;
-	}
 }
 
 static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 76d179200775..183484595aea 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -33,7 +33,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_rect.h>
-#include <drm/drm_vblank.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -856,18 +855,10 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		repaper_fb_dirty(state->fb);
-
-	if (crtc->state->event) {
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-		crtc->state->event = NULL;
-	}
 }
 
 static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 060cc756194f..9ef559dd3191 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -23,7 +23,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_rect.h>
-#include <drm/drm_vblank.h>
 
 /* controller-specific commands */
 #define ST7586_DISP_MODE_GRAY	0x38
@@ -159,18 +158,10 @@ static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		st7586_fb_dirty(state->fb, &rect);
-
-	if (crtc->state->event) {
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-		crtc->state->event = NULL;
-	}
 }
 
 static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 22af17959053..d59ebac70b15 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -375,8 +375,6 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	char *wrptr;
 	int color_depth = UDL_COLOR_DEPTH_16BPP;
 
-	crtc_state->no_vblank = true;
-
 	buf = (char *)udl->mode_buf;
 
 	/* This first section has to do with setting the base address on the
@@ -428,14 +426,6 @@ udl_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
 }
 
-static int
-udl_simple_display_pipe_check(struct drm_simple_display_pipe *pipe,
-			      struct drm_plane_state *plane_state,
-			      struct drm_crtc_state *crtc_state)
-{
-	return 0;
-}
-
 static void
 udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_plane_state)
@@ -457,7 +447,6 @@ struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
 	.mode_valid = udl_simple_display_pipe_mode_valid,
 	.enable = udl_simple_display_pipe_enable,
 	.disable = udl_simple_display_pipe_disable,
-	.check = udl_simple_display_pipe_check,
 	.update = udl_simple_display_pipe_update,
 	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
 };
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 4f34c5208180..8ec29d5d3353 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -220,6 +220,18 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	return false;
 }
 
+static int display_check(struct drm_simple_display_pipe *pipe,
+			 struct drm_plane_state *plane_state,
+			 struct drm_crtc_state *crtc_state)
+{
+	/* Make sure the simple DRM helpers don't enable VBLANK
+	 * generation. Xen has it's own logic to do so.
+	 */
+	crtc_state->no_vblank = false;
+
+	return 0;
+}
+
 static void display_update(struct drm_simple_display_pipe *pipe,
 			   struct drm_plane_state *old_plane_state)
 {
@@ -284,6 +296,7 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
 	.enable = display_enable,
 	.disable = display_disable,
 	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+	.check = display_check,
 	.update = display_update,
 };
 
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
