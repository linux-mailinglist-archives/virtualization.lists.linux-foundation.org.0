Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 589975DFDC
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 10:33:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5423E1011;
	Wed,  3 Jul 2019 08:33:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D794F100B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 08:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1955A873
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 08:33:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 18BC9AF70;
	Wed,  3 Jul 2019 08:33:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
	sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
	yc_chen@aspeedtech.com
Subject: [PATCH 2/5] drm/fb-helper: Unmap BO for shadow-buffered framebuffer
	console
Date: Wed,  3 Jul 2019 10:32:59 +0200
Message-Id: <20190703083302.2609-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703083302.2609-1-tzimmermann@suse.de>
References: <20190703083302.2609-1-tzimmermann@suse.de>
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

The shadow-buffered framebuffer console only needs the buffer object
to be mapped during updates. While not being updated from the shadow
buffer, the buffer object can remain unmapped.

An unmapped buffer object can be evicted to system memory and does
not consume video ram until displayed. This allows to use generic fbdev
emulation with drivers for low-memory devices, such as ast and mgag200.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1984e5c54d58..2a6538f229e3 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -403,6 +403,7 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 	struct drm_clip_rect *clip = &helper->dirty_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
+	void *vaddr;
 
 	spin_lock_irqsave(&helper->dirty_lock, flags);
 	clip_copy = *clip;
@@ -412,10 +413,18 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 
 	/* call dirty callback only when it has been really touched */
 	if (clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2) {
+
 		/* Generic fbdev uses a shadow buffer */
-		if (helper->buffer)
+		if (helper->buffer) {
+			vaddr = drm_client_buffer_vmap(helper->buffer);
+			if (IS_ERR(vaddr))
+				return;
 			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
+		}
 		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
+
+		if (helper->buffer)
+			drm_client_buffer_vunmap(helper->buffer);
 	}
 }
 
@@ -2231,6 +2240,9 @@ int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 		fbi->fbdefio = &drm_fbdev_defio;
 
 		fb_deferred_io_init(fbi);
+
+		/* unmapped by default */
+		drm_client_buffer_vunmap(fb_helper->buffer);
 	}
 
 	return 0;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
