Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D160318
	for <lists.virtualization@lfdr.de>; Fri,  5 Jul 2019 11:26:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8E751115;
	Fri,  5 Jul 2019 09:26:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 482AE110E
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:26:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3727C70D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:26:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 4986BAE15;
	Fri,  5 Jul 2019 09:26:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
	sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
	yc_chen@aspeedtech.com
Subject: [PATCH v2 2/6] drm/fb-helper: Map DRM client buffer only when required
Date: Fri,  5 Jul 2019 11:26:09 +0200
Message-Id: <20190705092613.7621-3-tzimmermann@suse.de>
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

This patch changes DRM clients to not map the buffer by default. The
buffer, like any buffer object, should be mapped and unmapped when
needed.

An unmapped buffer object can be evicted to system memory and does
not consume video ram until displayed. This allows to use generic fbdev
emulation with drivers for low-memory devices, such as ast and mgag200.

This change affects the generic framebuffer console. HW-based consoles
map their console buffer once and keep it mapped. Userspace can mmap this
buffer into its address space. The shadow-buffered framebuffer console
only needs the buffer object to be mapped during updates. While not being
updated from the shadow buffer, the buffer object can remain unmapped.
Userspace will always mmap the shadow buffer.

v2:
	* change DRM client to not map buffer by default
	* manually map client buffer for fbdev with HW framebuffer

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c    | 16 ++++------------
 drivers/gpu/drm/drm_fb_helper.c | 33 +++++++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 66d8d645ac79..7d23c834f503 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -254,7 +254,6 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
 	struct drm_device *dev = client->dev;
 	struct drm_client_buffer *buffer;
 	struct drm_gem_object *obj;
-	void *vaddr;
 	int ret;
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
@@ -281,12 +280,6 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
 
 	buffer->gem = obj;
 
-	vaddr = drm_client_buffer_vmap(buffer);
-	if (IS_ERR(vaddr)) {
-		ret = PTR_ERR(vaddr);
-		goto err_delete;
-	}
-
 	return buffer;
 
 err_delete:
@@ -305,7 +298,7 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
  * Client buffer mappings are not ref'counted. Each call to
  * drm_client_buffer_vmap() should be followed by a call to
  * drm_client_buffer_vunmap(); or the client buffer should be mapped
- * throughout its lifetime. The latter is the default.
+ * throughout its lifetime.
  *
  * Returns:
  *	The mapped memory's address
@@ -340,10 +333,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
  * drm_client_buffer_vunmap - Unmap DRM client buffer
  * @buffer: DRM client buffer
  *
- * This function removes a client buffer's memory mmapping. This
- * function is only required by clients that manage their buffers
- * by themselves. By default, DRM client buffers are mapped throughout
- * their entire lifetime.
+ * This function removes a client buffer's memory mmapping. Calling this
+ * function is only required by clients that manage their buffer mappings
+ * by themselves.
  */
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1984e5c54d58..7ba6a0255821 100644
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
 
@@ -2178,6 +2187,7 @@ int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	struct drm_framebuffer *fb;
 	struct fb_info *fbi;
 	u32 format;
+	void *vaddr;
 
 	DRM_DEBUG_KMS("surface width(%d), height(%d) and bpp(%d)\n",
 		      sizes->surface_width, sizes->surface_height,
@@ -2200,13 +2210,7 @@ int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	fbi->fbops = &drm_fbdev_fb_ops;
 	fbi->screen_size = fb->height * fb->pitches[0];
 	fbi->fix.smem_len = fbi->screen_size;
-	fbi->screen_buffer = buffer->vaddr;
-	/* Shamelessly leak the physical address to user-space */
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-	if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0)
-		fbi->fix.smem_start =
-			page_to_phys(virt_to_page(fbi->screen_buffer));
-#endif
+
 	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
 
 	if (fb->funcs->dirty) {
@@ -2231,6 +2235,19 @@ int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 		fbi->fbdefio = &drm_fbdev_defio;
 
 		fb_deferred_io_init(fbi);
+	} else {
+		/* buffer is mapped for HW framebuffer */
+		vaddr = drm_client_buffer_vmap(fb_helper->buffer);
+		if (IS_ERR(vaddr))
+			return PTR_ERR(vaddr);
+
+		fbi->screen_buffer = vaddr;
+		/* Shamelessly leak the physical address to user-space */
+#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
+		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0)
+			fbi->fix.smem_start =
+				page_to_phys(virt_to_page(fbi->screen_buffer));
+#endif
 	}
 
 	return 0;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
