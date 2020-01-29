Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 341CE14CA25
	for <lists.virtualization@lfdr.de>; Wed, 29 Jan 2020 13:05:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D792A86E5A;
	Wed, 29 Jan 2020 12:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Smy24fdtS54u; Wed, 29 Jan 2020 12:05:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7542E86E1A;
	Wed, 29 Jan 2020 12:05:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F8CFC1D84;
	Wed, 29 Jan 2020 12:05:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 318D6C1D8A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2D55C2153D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUNib-2uWcrX
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id A0C7F2152C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:05:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B79FB1F1;
 Wed, 29 Jan 2020 12:05:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v5 15/15] drm/xen: Explicitly disable automatic sending of
 vblank event
Date: Wed, 29 Jan 2020 13:05:31 +0100
Message-Id: <20200129120531.6891-16-tzimmermann@suse.de>
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
vblanking has been initialized. This would apply to xen, but xen has
its own vblank logic. To avoid interfering with the atomic helpers,
disable automatic vblank events explicitly.

v5:
	* update comment
v4:
	* separate commit from core vblank changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 4f34c5208180..78096bbcd226 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -220,6 +220,24 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	return false;
 }
 
+static int display_check(struct drm_simple_display_pipe *pipe,
+			 struct drm_plane_state *plane_state,
+			 struct drm_crtc_state *crtc_state)
+{
+	/*
+	 * Xen doesn't initialize vblanking via drm_vblank_init(), so
+	 * DRM helpers assume that it doesn't handle vblanking and start
+	 * sending out fake VBLANK events automatically.
+	 *
+	 * As xen contains it's own logic for sending out VBLANK events
+	 * in send_pending_event(), disable no_vblank (i.e., the xen
+	 * driver has vblanking support).
+	 */
+	crtc_state->no_vblank = false;
+
+	return 0;
+}
+
 static void display_update(struct drm_simple_display_pipe *pipe,
 			   struct drm_plane_state *old_plane_state)
 {
@@ -284,6 +302,7 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
 	.enable = display_enable,
 	.disable = display_disable,
 	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
+	.check = display_check,
 	.update = display_update,
 };
 
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
