Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D13D960317
	for <lists.virtualization@lfdr.de>; Fri,  5 Jul 2019 11:26:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 68D9A1116;
	Fri,  5 Jul 2019 09:26:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EB597110E
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:26:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3E154880
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:26:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id AB70BAE89;
	Fri,  5 Jul 2019 09:26:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
	sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
	yc_chen@aspeedtech.com
Subject: [PATCH v2 3/6] drm/fb-helper: Instanciate shadow FB if configured in
	device's mode_config
Date: Fri,  5 Jul 2019 11:26:10 +0200
Message-Id: <20190705092613.7621-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190705092613.7621-1-tzimmermann@suse.de>
References: <20190705092613.7621-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Generic framebuffer emulation uses a shadow buffer for framebuffers with
dirty() function. If drivers want to use the shadow FB without such a
function, they can now set prefer_shadow or prefer_shadow_fbdev in their
mode_config structures. The former flag is exported to userspace, the latter
flag is fbdev-only.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 19 ++++++++++++++-----
 include/drm/drm_mode_config.h   |  5 +++++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 7ba6a0255821..56ef169e1814 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -421,7 +421,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 				return;
 			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
 		}
-		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
+		if (helper->fb->funcs->dirty)
+			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
+						 &clip_copy, 1);
 
 		if (helper->buffer)
 			drm_client_buffer_vunmap(helper->buffer);
@@ -620,9 +622,6 @@ static void drm_fb_helper_dirty(struct fb_info *info, u32 x, u32 y,
 	struct drm_clip_rect *clip = &helper->dirty_clip;
 	unsigned long flags;
 
-	if (!helper->fb->funcs->dirty)
-		return;
-
 	spin_lock_irqsave(&helper->dirty_lock, flags);
 	clip->x1 = min_t(u32, clip->x1, x);
 	clip->y1 = min_t(u32, clip->y1, y);
@@ -2166,6 +2165,16 @@ static struct fb_deferred_io drm_fbdev_defio = {
 	.deferred_io	= drm_fb_helper_deferred_io,
 };
 
+static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
+{
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_framebuffer *fb = fb_helper->fb;
+
+	return dev->mode_config.prefer_shadow_fbdev |
+	       dev->mode_config.prefer_shadow |
+	       !!fb->funcs->dirty;
+}
+
 /**
  * drm_fb_helper_generic_probe - Generic fbdev emulation probe helper
  * @fb_helper: fbdev helper structure
@@ -2213,7 +2222,7 @@ int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 
 	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
 
-	if (fb->funcs->dirty) {
+	if (drm_fbdev_use_shadow_fb(fb_helper)) {
 		struct fb_ops *fbops;
 		void *shadow;
 
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 759d462d028b..e1c751aca353 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -347,6 +347,8 @@ struct drm_mode_config_funcs {
  * @output_poll_work: delayed work for polling in process context
  * @preferred_depth: preferred RBG pixel depth, used by fb helpers
  * @prefer_shadow: hint to userspace to prefer shadow-fb rendering
+ * @prefer_shadow_fbdev: hint to framebuffer emulation to prefer shadow-fb \
+	rendering
  * @cursor_width: hint to userspace for max cursor width
  * @cursor_height: hint to userspace for max cursor height
  * @helper_private: mid-layer private data
@@ -852,6 +854,9 @@ struct drm_mode_config {
 	/* dumb ioctl parameters */
 	uint32_t preferred_depth, prefer_shadow;
 
+	/* fbdev parameters */
+	uint32_t prefer_shadow_fbdev;
+
 	/**
 	 * @quirk_addfb_prefer_xbgr_30bpp:
 	 *
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
