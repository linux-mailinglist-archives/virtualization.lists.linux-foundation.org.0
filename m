Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44314CA20
	for <lists.virtualization@lfdr.de>; Wed, 29 Jan 2020 13:05:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC73285F05;
	Wed, 29 Jan 2020 12:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3BckF2Vwb4T; Wed, 29 Jan 2020 12:05:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B314385E95;
	Wed, 29 Jan 2020 12:05:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92DB9C0171;
	Wed, 29 Jan 2020 12:05:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCF80C0171
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A83C085EC0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQ5CpQA0X6cs
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 17740859E3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B0242B1EB;
 Wed, 29 Jan 2020 12:05:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v5 14/15] drm/virtio: Remove sending of vblank event
Date: Wed, 29 Jan 2020 13:05:30 +0100
Message-Id: <20200129120531.6891-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
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

The atomic helpers automatically send out fake VBLANK events if no
vblanking has been initialized. Remove the sending code from the
driver.

v4:
	* separate commit from core vblank changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 0966208ec30d..ecf4ba7cc32b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -30,7 +30,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
 
 #include "virtgpu_drv.h"
 
@@ -121,13 +120,6 @@ static int virtio_gpu_crtc_atomic_check(struct drm_crtc *crtc,
 static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 					 struct drm_crtc_state *old_state)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
-	if (crtc->state->event)
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-	crtc->state->event = NULL;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 }
 
 static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs = {
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
