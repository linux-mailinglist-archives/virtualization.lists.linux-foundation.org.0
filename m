Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74413C1C0
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 13:52:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D5D9086016;
	Wed, 15 Jan 2020 12:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oz43QobiqBrY; Wed, 15 Jan 2020 12:52:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6F69A86239;
	Wed, 15 Jan 2020 12:52:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4546EC077D;
	Wed, 15 Jan 2020 12:52:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0746C1D8B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A894A84B75
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRCzbb66aBKd
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:52:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5934484558
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:52:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 91269AFFE;
 Wed, 15 Jan 2020 12:52:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v2 3/4] drm/cirrus: Let DRM core send VBLANK events
Date: Wed, 15 Jan 2020 13:52:25 +0100
Message-Id: <20200115125226.13843-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115125226.13843-1-tzimmermann@suse.de>
References: <20200115125226.13843-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>,
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

In drm_atomic_helper_fake_vblank(), the DRM core sends out VBLANK
events if struct drm_crtc_state.no_vblank is enabled. Replace cirrus'
VBLANK events with the DRM core's functionality.

v2:
	* set struct_drm_crtc_state.no_vblank in cirrus_pipe_check()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/cirrus/cirrus.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
index 248c9f765c45..5ff15e8a2a0a 100644
--- a/drivers/gpu/drm/cirrus/cirrus.c
+++ b/drivers/gpu/drm/cirrus/cirrus.c
@@ -38,7 +38,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/drm_vblank.h>
 
 #define DRIVER_NAME "cirrus"
 #define DRIVER_DESC "qemu cirrus vga"
@@ -404,6 +403,8 @@ static int cirrus_pipe_check(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_framebuffer *fb = plane_state->fb;
 
+	crtc_state->no_vblank = true;
+
 	if (!fb)
 		return 0;
 	return cirrus_check_size(fb->width, fb->height, fb);
@@ -434,13 +435,6 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		cirrus_fb_blit_rect(pipe->plane.state->fb, &rect);
-
-	if (crtc->state->event) {
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		crtc->state->event = NULL;
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
 }
 
 static const struct drm_simple_display_pipe_funcs cirrus_pipe_funcs = {
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
