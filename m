Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB84377F1
	for <lists.virtualization@lfdr.de>; Fri, 22 Oct 2021 15:28:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B314C83BD1;
	Fri, 22 Oct 2021 13:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wg9v-S0qHygO; Fri, 22 Oct 2021 13:28:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E2E1D83B60;
	Fri, 22 Oct 2021 13:28:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1E60C0040;
	Fri, 22 Oct 2021 13:28:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61284C001E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 13:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E84283B20
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 13:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCA8egku0uia
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 13:28:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C223683B1B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 13:28:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B18FD1FD5D;
 Fri, 22 Oct 2021 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634909312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a92FVJ6f8nwQGJQbLyhh/KJViNjnrL79JTM37pj92bM=;
 b=HAw/0zEgXO1ziiFSP1jDmP2LoJ4z8tWAhVtJsNGIALoptHcn4x2t4Tn42ahrmceoSSunDd
 aW5AhvjIL9JsYNkpPjmXNdyfjgBCcmW7JJKWqmosBX3DtTe0Zo0QKm4s9gwqqdNG0HQMfp
 wNs4PX/y4e98w9F+BG8FClLImKFygzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634909312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a92FVJ6f8nwQGJQbLyhh/KJViNjnrL79JTM37pj92bM=;
 b=vWjLNmvsxR3L6JsfqYXGlPCeezMZKN1DvYyM99QiXcBlUV0znuaaVF/Kv4IFmjNmckGmkn
 Pl8BRK6V/WsUsvAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4039813CDA;
 Fri, 22 Oct 2021 13:28:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mMK5DoC8cmEwXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Oct 2021 13:28:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Subject: [PATCH 4/9] drm/format-helper: Rework format-helper conversion
 functions
Date: Fri, 22 Oct 2021 15:28:24 +0200
Message-Id: <20211022132829.7697-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211022132829.7697-1-tzimmermann@suse.de>
References: <20211022132829.7697-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
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

Move destination-buffer clipping from all format-helper conversion
functions into callers. Support destination-buffer pitch. Only
distinguish between system and I/O memory, but use same logic
everywhere.

Simply harmonize the interface and semantics of the existing code.
Not all conversion helpers support all combinations of parameters.
We have to add additional features when we need them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 131 +++++++++++++++-------------
 drivers/gpu/drm/drm_mipi_dbi.c      |   2 +-
 drivers/gpu/drm/gud/gud_pipe.c      |  10 +--
 drivers/gpu/drm/tiny/cirrus.c       |  10 +--
 drivers/gpu/drm/tiny/repaper.c      |   2 +-
 drivers/gpu/drm/tiny/st7586.c       |   2 +-
 include/drm/drm_format_helper.h     |  30 +++----
 7 files changed, 97 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 79869ed553d9..260dc587c1d7 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -156,7 +156,7 @@ void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
-static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, __le32 *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, const __le32 *sbuf, unsigned int pixels)
 {
 	unsigned int x;
 	u32 pix;
@@ -172,23 +172,24 @@ static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, __le32 *sbuf, unsigned int
 /**
  * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
  * @dst: RGB332 destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @src: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * Drivers can use this function for RGB332 devices that don't natively support XRGB8888.
- *
- * This function does not apply clipping on dst, i.e. the destination is a small buffer
- * containing the clip rect only.
  */
-void drm_fb_xrgb8888_to_rgb332(void *dst, void *src, struct drm_framebuffer *fb,
-			       struct drm_rect *clip)
+void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *src,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	size_t width = drm_rect_width(clip);
 	size_t src_len = width * sizeof(u32);
 	unsigned int y;
 	void *sbuf;
 
+	if (!dst_pitch)
+		dst_pitch = width;
+
 	/* Use a buffer to speed up access on buffers with uncached read mapping (i.e. WC) */
 	sbuf = kmalloc(src_len, GFP_KERNEL);
 	if (!sbuf)
@@ -199,14 +200,14 @@ void drm_fb_xrgb8888_to_rgb332(void *dst, void *src, struct drm_framebuffer *fb,
 		memcpy(sbuf, src, src_len);
 		drm_fb_xrgb8888_to_rgb332_line(dst, sbuf, width);
 		src += fb->pitches[0];
-		dst += width;
+		dst += dst_pitch;
 	}
 
 	kfree(sbuf);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
-static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
+static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, const u32 *sbuf,
 					   unsigned int pixels,
 					   bool swab)
 {
@@ -227,6 +228,7 @@ static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
 /**
  * drm_fb_xrgb8888_to_rgb565 - Convert XRGB8888 to RGB565 clip buffer
  * @dst: RGB565 destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -234,13 +236,10 @@ static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
  *
  * Drivers can use this function for RGB565 devices that don't natively
  * support XRGB8888.
- *
- * This function does not apply clipping on dst, i.e. the destination
- * is a small buffer containing the clip rect only.
  */
-void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
-			       struct drm_framebuffer *fb,
-			       struct drm_rect *clip, bool swab)
+void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
+			       bool swab)
 {
 	size_t linepixels = clip->x2 - clip->x1;
 	size_t src_len = linepixels * sizeof(u32);
@@ -248,6 +247,9 @@ void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
 	unsigned y, lines = clip->y2 - clip->y1;
 	void *sbuf;
 
+	if (!dst_pitch)
+		dst_pitch = dst_len;
+
 	/*
 	 * The cma memory is write-combined so reads are uncached.
 	 * Speed up by fetching one line at a time.
@@ -261,7 +263,7 @@ void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
 		memcpy(sbuf, vaddr, src_len);
 		drm_fb_xrgb8888_to_rgb565_line(dst, sbuf, linepixels, swab);
 		vaddr += fb->pitches[0];
-		dst += dst_len;
+		dst += dst_pitch;
 	}
 
 	kfree(sbuf);
@@ -269,9 +271,9 @@ void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
 /**
- * drm_fb_xrgb8888_to_rgb565_dstclip - Convert XRGB8888 to RGB565 clip buffer
+ * drm_fb_xrgb8888_to_rgb565_toio - Convert XRGB8888 to RGB565 clip buffer
  * @dst: RGB565 destination buffer (iomem)
- * @dst_pitch: destination buffer pitch
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -279,37 +281,36 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
  *
  * Drivers can use this function for RGB565 devices that don't natively
  * support XRGB8888.
- *
- * This function applies clipping on dst, i.e. the destination is a
- * full (iomem) framebuffer but only the clip rect content is copied over.
  */
-void drm_fb_xrgb8888_to_rgb565_dstclip(void __iomem *dst, unsigned int dst_pitch,
-				       void *vaddr, struct drm_framebuffer *fb,
-				       struct drm_rect *clip, bool swab)
+void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
+				    const void *vaddr, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip, bool swab)
 {
 	size_t linepixels = clip->x2 - clip->x1;
 	size_t dst_len = linepixels * sizeof(u16);
 	unsigned y, lines = clip->y2 - clip->y1;
 	void *dbuf;
 
+	if (!dst_pitch)
+		dst_pitch = dst_len;
+
 	dbuf = kmalloc(dst_len, GFP_KERNEL);
 	if (!dbuf)
 		return;
 
 	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
-	dst += clip_offset(clip, dst_pitch, sizeof(u16));
 	for (y = 0; y < lines; y++) {
 		drm_fb_xrgb8888_to_rgb565_line(dbuf, vaddr, linepixels, swab);
 		memcpy_toio(dst, dbuf, dst_len);
 		vaddr += fb->pitches[0];
-		dst += dst_len;
+		dst += dst_pitch;
 	}
 
 	kfree(dbuf);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_dstclip);
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_toio);
 
-static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, u32 *sbuf,
+static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, const u32 *sbuf,
 					   unsigned int pixels)
 {
 	unsigned int x;
@@ -324,24 +325,25 @@ static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, u32 *sbuf,
 /**
  * drm_fb_xrgb8888_to_rgb888 - Convert XRGB8888 to RGB888 clip buffer
  * @dst: RGB888 destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @src: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * Drivers can use this function for RGB888 devices that don't natively
  * support XRGB8888.
- *
- * This function does not apply clipping on dst, i.e. the destination
- * is a small buffer containing the clip rect only.
  */
-void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
-			       struct drm_rect *clip)
+void drm_fb_xrgb8888_to_rgb888(void *dst, unsigned int dst_pitch, const void *src,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	size_t width = drm_rect_width(clip);
 	size_t src_len = width * sizeof(u32);
 	unsigned int y;
 	void *sbuf;
 
+	if (!dst_pitch)
+		dst_pitch = width * 3;
+
 	/* Use a buffer to speed up access on buffers with uncached read mapping (i.e. WC) */
 	sbuf = kmalloc(src_len, GFP_KERNEL);
 	if (!sbuf)
@@ -352,7 +354,7 @@ void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
 		memcpy(sbuf, src, src_len);
 		drm_fb_xrgb8888_to_rgb888_line(dst, sbuf, width);
 		src += fb->pitches[0];
-		dst += width * 3;
+		dst += dst_pitch;
 	}
 
 	kfree(sbuf);
@@ -360,48 +362,48 @@ void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
 
 /**
- * drm_fb_xrgb8888_to_rgb888_dstclip - Convert XRGB8888 to RGB888 clip buffer
+ * drm_fb_xrgb8888_to_rgb888_toio - Convert XRGB8888 to RGB888 clip buffer
  * @dst: RGB565 destination buffer (iomem)
- * @dst_pitch: destination buffer pitch
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * Drivers can use this function for RGB888 devices that don't natively
  * support XRGB8888.
- *
- * This function applies clipping on dst, i.e. the destination is a
- * full (iomem) framebuffer but only the clip rect content is copied over.
  */
-void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch,
-				       void *vaddr, struct drm_framebuffer *fb,
-				       struct drm_rect *clip)
+void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
+				    const void *vaddr, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip)
 {
 	size_t linepixels = clip->x2 - clip->x1;
 	size_t dst_len = linepixels * 3;
 	unsigned y, lines = clip->y2 - clip->y1;
 	void *dbuf;
 
+	if (!dst_pitch)
+		dst_pitch = dst_len;
+
 	dbuf = kmalloc(dst_len, GFP_KERNEL);
 	if (!dbuf)
 		return;
 
 	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
-	dst += clip_offset(clip, dst_pitch, sizeof(u16));
 	for (y = 0; y < lines; y++) {
 		drm_fb_xrgb8888_to_rgb888_line(dbuf, vaddr, linepixels);
 		memcpy_toio(dst, dbuf, dst_len);
 		vaddr += fb->pitches[0];
-		dst += dst_len;
+		dst += dst_pitch;
 	}
 
 	kfree(dbuf);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_dstclip);
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_toio);
 
 /**
  * drm_fb_xrgb8888_to_gray8 - Convert XRGB8888 to grayscale
  * @dst: 8-bit grayscale destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -415,16 +417,21 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_dstclip);
  *
  * ITU BT.601 is used for the RGB -> luma (brightness) conversion.
  */
-void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
-			       struct drm_rect *clip)
+void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
+			      const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	unsigned int len = (clip->x2 - clip->x1) * sizeof(u32);
 	unsigned int x, y;
 	void *buf;
-	u32 *src;
+	u8 *dst8;
+	u32 *src32;
 
 	if (WARN_ON(fb->format->format != DRM_FORMAT_XRGB8888))
 		return;
+
+	if (!dst_pitch)
+		dst_pitch = len;
+
 	/*
 	 * The cma memory is write-combined so reads are uncached.
 	 * Speed up by fetching one line at a time.
@@ -433,20 +440,22 @@ void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
 	if (!buf)
 		return;
 
+	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
 	for (y = clip->y1; y < clip->y2; y++) {
-		src = vaddr + (y * fb->pitches[0]);
-		src += clip->x1;
-		memcpy(buf, src, len);
-		src = buf;
+		dst8 = dst;
+		src32 = memcpy(buf, vaddr, len);
 		for (x = clip->x1; x < clip->x2; x++) {
-			u8 r = (*src & 0x00ff0000) >> 16;
-			u8 g = (*src & 0x0000ff00) >> 8;
-			u8 b =  *src & 0x000000ff;
+			u8 r = (*src32 & 0x00ff0000) >> 16;
+			u8 g = (*src32 & 0x0000ff00) >> 8;
+			u8 b =  *src32 & 0x000000ff;
 
 			/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
-			*dst++ = (3 * r + 6 * g + b) / 10;
-			src++;
+			*dst8++ = (3 * r + 6 * g + b) / 10;
+			src32++;
 		}
+
+		vaddr += fb->pitches[0];
+		dst += dst_pitch;
 	}
 
 	kfree(buf);
@@ -493,15 +502,15 @@ int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
 
 	} else if (dst_format == DRM_FORMAT_RGB565) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_rgb565_dstclip(dst, dst_pitch,
-							  vmap, fb, clip,
-							  false);
+			dst += clip_offset(clip, dst_pitch, fb->format->cpp[0]);
+			drm_fb_xrgb8888_to_rgb565_toio(dst, dst_pitch, vmap, fb, clip,
+						       false);
 			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_RGB888) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_rgb888_dstclip(dst, dst_pitch,
-							  vmap, fb, clip);
+			dst += clip_offset(clip, dst_pitch, fb->format->cpp[0]);
+			drm_fb_xrgb8888_to_rgb888_toio(dst, dst_pitch, vmap, fb, clip);
 			return 0;
 		}
 	}
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 7ce89917d761..b75403f3251a 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -216,7 +216,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 			drm_fb_memcpy(dst, 0, src, fb, clip);
 		break;
 	case DRM_FORMAT_XRGB8888:
-		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
+		drm_fb_xrgb8888_to_rgb565(dst, 0, src, fb, clip, swap);
 		break;
 	default:
 		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index e0b117b2559f..a150a5a4b5d4 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -74,7 +74,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	if (!buf)
 		return 0;
 
-	drm_fb_xrgb8888_to_gray8(buf, src, fb, rect);
+	drm_fb_xrgb8888_to_gray8(buf, 0, src, fb, rect);
 	pix8 = buf;
 
 	for (y = 0; y < height; y++) {
@@ -190,13 +190,13 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 				goto end_cpu_access;
 			}
 		} else if (format->format == DRM_FORMAT_R8) {
-			drm_fb_xrgb8888_to_gray8(buf, vaddr, fb, rect);
+			drm_fb_xrgb8888_to_gray8(buf, 0, vaddr, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB332) {
-			drm_fb_xrgb8888_to_rgb332(buf, vaddr, fb, rect);
+			drm_fb_xrgb8888_to_rgb332(buf, 0, vaddr, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(buf, vaddr, fb, rect, gud_is_big_endian());
+			drm_fb_xrgb8888_to_rgb565(buf, 0, vaddr, fb, rect, gud_is_big_endian());
 		} else if (format->format == DRM_FORMAT_RGB888) {
-			drm_fb_xrgb8888_to_rgb888(buf, vaddr, fb, rect);
+			drm_fb_xrgb8888_to_rgb888(buf, 0, vaddr, fb, rect);
 		} else {
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 5344e506e8a9..9327001d35dd 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -329,14 +329,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_
 		drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
-		drm_fb_xrgb8888_to_rgb565_dstclip(cirrus->vram,
-						  cirrus->pitch,
-						  vmap, fb, rect, false);
+		dst += drm_fb_clip_offset(cirrus->pitch, fb->format, rect);
+		drm_fb_xrgb8888_to_rgb565_toio(dst, cirrus->pitch, vmap, fb, rect, false);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
-		drm_fb_xrgb8888_to_rgb888_dstclip(cirrus->vram,
-						  cirrus->pitch,
-						  vmap, fb, rect);
+		dst += drm_fb_clip_offset(cirrus->pitch, fb->format, rect);
+		drm_fb_xrgb8888_to_rgb888_toio(dst, cirrus->pitch, vmap, fb, rect);
 
 	} else {
 		WARN_ON_ONCE("cpp mismatch");
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 4d07b21a16e6..97a775c48cea 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -560,7 +560,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 	if (ret)
 		goto out_free;
 
-	drm_fb_xrgb8888_to_gray8(buf, cma_obj->vaddr, fb, &clip);
+	drm_fb_xrgb8888_to_gray8(buf, 0, cma_obj->vaddr, fb, &clip);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index ad0faa8723c2..51b9b9fb3ead 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -73,7 +73,7 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 	if (!buf)
 		return;
 
-	drm_fb_xrgb8888_to_gray8(buf, vaddr, fb, clip);
+	drm_fb_xrgb8888_to_gray8(buf, 0, vaddr, fb, clip);
 	src = buf;
 
 	for (y = clip->y1; y < clip->y2; y++) {
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index c4c3c845e119..8af9b8f35dd6 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -20,21 +20,21 @@ void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *v
 void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
 		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
 		 bool cached);
-void drm_fb_xrgb8888_to_rgb332(void *dst, void *vaddr, struct drm_framebuffer *fb,
-			       struct drm_rect *clip);
-void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
-			       struct drm_framebuffer *fb,
-			       struct drm_rect *clip, bool swab);
-void drm_fb_xrgb8888_to_rgb565_dstclip(void __iomem *dst, unsigned int dst_pitch,
-				       void *vaddr, struct drm_framebuffer *fb,
-				       struct drm_rect *clip, bool swab);
-void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
-			       struct drm_rect *clip);
-void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch,
-				       void *vaddr, struct drm_framebuffer *fb,
-				       struct drm_rect *clip);
-void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
-			      struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *vaddr,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
+			       bool swab);
+void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
+				    const void *vaddr, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip, bool swab);
+void drm_fb_xrgb8888_to_rgb888(void *dst, unsigned int dst_pitch, const void *src,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
+				    const void *vaddr, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
+			      const struct drm_framebuffer *fb, const struct drm_rect *clip);
 
 int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
 			     uint32_t dst_format, void *vmap,
-- 
2.33.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
