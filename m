Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795814644E
	for <lists.virtualization@lfdr.de>; Thu, 23 Jan 2020 10:21:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C2E8857DC;
	Thu, 23 Jan 2020 09:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNnfrluUktKd; Thu, 23 Jan 2020 09:21:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC3FC85A4E;
	Thu, 23 Jan 2020 09:21:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 904B0C0174;
	Thu, 23 Jan 2020 09:21:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1C30C0174
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 98AA320429
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Jo1GqDhop0e
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 09:21:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id CE20220364
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 09:21:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 564A2B1FB;
 Thu, 23 Jan 2020 09:21:26 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v4 02/15] drm/arc: Remove sending of vblank event
Date: Thu, 23 Jan 2020 10:21:10 +0100
Message-Id: <20200123092123.28368-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
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

The atomic helpers automatically send out fake VBLANK events if no
vblanking has been initialized. Remove the sending code from the
driver.

v4:
	* separate commit from core vblank changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 8ae1e1f97a73..be7c29cec318 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -9,7 +9,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_vblank.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <linux/clk.h>
@@ -138,24 +137,9 @@ static void arc_pgu_crtc_atomic_disable(struct drm_crtc *crtc,
 			      ~ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
-				      struct drm_crtc_state *state)
-{
-	struct drm_pending_vblank_event *event = crtc->state->event;
-
-	if (event) {
-		crtc->state->event = NULL;
-
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
-}
-
 static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
 	.mode_valid	= arc_pgu_crtc_mode_valid,
 	.mode_set_nofb	= arc_pgu_crtc_mode_set_nofb,
-	.atomic_begin	= arc_pgu_crtc_atomic_begin,
 	.atomic_enable	= arc_pgu_crtc_atomic_enable,
 	.atomic_disable	= arc_pgu_crtc_atomic_disable,
 };
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
