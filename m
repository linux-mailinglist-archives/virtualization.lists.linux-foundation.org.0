Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7405758C8C3
	for <lists.virtualization@lfdr.de>; Mon,  8 Aug 2022 14:54:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208A841830;
	Mon,  8 Aug 2022 12:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 208A841830
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=K6o7yfTv;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sL/5z7Zl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwgXl-dhOh2D; Mon,  8 Aug 2022 12:54:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F0CF4417C3;
	Mon,  8 Aug 2022 12:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0CF4417C3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F742C007B;
	Mon,  8 Aug 2022 12:54:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10C60C007B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B151F60E45
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B151F60E45
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=K6o7yfTv; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sL/5z7Zl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vlr2_QfbJUgC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61FF460B94
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61FF460B94
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A2182007D;
 Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cB1enQ3xoze2JBKpVwyF1r9/mszqKgh8oSb9OXU6QZo=;
 b=K6o7yfTvhCIyjKUoIoXrQ64VuUu8TylikbN+S9GLoji4M4CTyqXnSs/8g6d8S5WlrxCDax
 WSrwiGouFH6D8YkmqR0Y/RWYYjuaDK8hPpV7ZGth2eNSiBA9Wp1eHyfWOfOKii/DjcaBco
 nlWrdf/A3rRgEuDE+VowQOGzFUf9nNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cB1enQ3xoze2JBKpVwyF1r9/mszqKgh8oSb9OXU6QZo=;
 b=sL/5z7ZlcylCJ3IeVbl/MlM4W7VlwXi0TTCdTeYcP4xrhUXwZsLyVc7deoDebC0OQjeRkt
 au0RogSK9syPQqCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C332E13ADE;
 Mon,  8 Aug 2022 12:54:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mF1yLnQH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 12/14] drm/format-helper: Rework XRGB8888-to-MONO conversion
Date: Mon,  8 Aug 2022 14:54:04 +0200
Message-Id: <20220808125406.20752-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125406.20752-1-tzimmermann@suse.de>
References: <20220808125406.20752-1-tzimmermann@suse.de>
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

Update XRGB8888-to-MONO conversion to support struct iosys_map
and convert all users. Although these are single-plane color formats,
the new interface supports multi-plane formats for consistency with
drm_fb_blit().

v2:
	* rebase after renaming CMA helpers to DMA helpers
	* update documentation (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_format_helper.c | 56 +++++++++++++++++++----------
 drivers/gpu/drm/solomon/ssd130x.c   |  7 ++--
 drivers/gpu/drm/tiny/repaper.c      |  6 +++-
 include/drm/drm_format_helper.h     |  5 +--
 4 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 890370c0424f..53a313f83dc2 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -753,46 +753,64 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
 
 /**
  * drm_fb_xrgb8888_to_mono - Convert XRGB8888 to monochrome
- * @dst: monochrome destination buffer (0=black, 1=white)
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: XRGB8888 source buffer
+ * @dst: Array of monochrome destination buffers (0=black, 1=white)
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @vmap: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
- * DRM doesn't have native monochrome support.
- * Such drivers can announce the commonly supported XR24 format to userspace
- * and use this function to convert to the native format.
+ * This function copies parts of a framebuffer to display memory and converts the
+ * color format during the process. Destination and framebuffer formats must match. The
+ * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * least as many entries as there are planes in @fb's format. Each entry stores the
+ * value for the format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner). The first pixel (upper left corner of the clip rectangle) will
+ * be converted and copied to the first bit (LSB) in the first byte of the monochrome
+ * destination buffer. If the caller requires that the first pixel in a byte must
+ * be located at an x-coordinate that is a multiple of 8, then the caller must take
+ * care itself of supplying a suitable clip rectangle.
+ *
+ * DRM doesn't have native monochrome support. Drivers can use this function for
+ * monochrome devices that don't support XRGB8888 natively. Such drivers can
+ * announce the commonly supported XR24 format to userspace and use this function
+ * to convert to the native format.
  *
  * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
  * then the result is converted from grayscale to monochrome.
- *
- * The first pixel (upper left corner of the clip rectangle) will be converted
- * and copied to the first bit (LSB) in the first byte of the monochrome
- * destination buffer.
- * If the caller requires that the first pixel in a byte must be located at an
- * x-coordinate that is a multiple of 8, then the caller must take care itself
- * of supplying a suitable clip rectangle.
  */
-void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vaddr,
-			     const struct drm_framebuffer *fb, const struct drm_rect *clip)
+void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			     const struct drm_rect *clip)
 {
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
 	unsigned int linepixels = drm_rect_width(clip);
 	unsigned int lines = drm_rect_height(clip);
 	unsigned int cpp = fb->format->cpp[0];
 	unsigned int len_src32 = linepixels * cpp;
 	struct drm_device *dev = fb->dev;
+	void *vaddr = vmap[0].vaddr;
+	unsigned int dst_pitch_0;
 	unsigned int y;
-	u8 *mono = dst, *gray8;
+	u8 *mono = dst[0].vaddr, *gray8;
 	u32 *src32;
 
 	if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
 		return;
 
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+	dst_pitch_0 = dst_pitch[0];
+
 	/*
 	 * The mono destination buffer contains 1 bit per pixel
 	 */
-	if (!dst_pitch)
-		dst_pitch = DIV_ROUND_UP(linepixels, 8);
+	if (!dst_pitch_0)
+		dst_pitch_0 = DIV_ROUND_UP(linepixels, 8);
 
 	/*
 	 * The dma memory is write-combined so reads are uncached.
@@ -817,7 +835,7 @@ void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vadd
 		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
 		drm_fb_gray8_to_mono_line(mono, gray8, linepixels);
 		vaddr += fb->pitches[0];
-		mono += dst_pitch;
+		mono += dst_pitch_0;
 	}
 
 	kfree(src32);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index e1ff683db12a..94d92b726c34 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -536,11 +536,11 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
 	kfree(buf);
 }
 
-static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *map,
+static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *vmap,
 				struct drm_rect *rect)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
 	u8 *buf = NULL;
@@ -554,7 +554,8 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	if (!buf)
 		return -ENOMEM;
 
-	drm_fb_xrgb8888_to_mono(buf, dst_pitch, vmap, fb, rect);
+	iosys_map_set_vaddr(&dst, buf);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
 
 	ssd130x_update_rect(ssd130x, buf, rect);
 
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 4cd24b54ac74..c4c1be3ac0b8 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -513,6 +513,8 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 {
 	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	struct repaper_epd *epd = drm_to_epd(fb->dev);
+	unsigned int dst_pitch = 0;
+	struct iosys_map dst, vmap;
 	struct drm_rect clip;
 	int idx, ret = 0;
 	u8 *buf = NULL;
@@ -541,7 +543,9 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 	if (ret)
 		goto out_free;
 
-	drm_fb_xrgb8888_to_mono(buf, 0, dma_obj->vaddr, fb, &clip);
+	iosys_map_set_vaddr(&dst, buf);
+	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 68087c982497..1e1d8f356cc1 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -40,7 +40,8 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 		const struct drm_rect *rect);
 
-void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *src,
-			     const struct drm_framebuffer *fb, const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			     const struct drm_rect *clip);
 
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.37.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
