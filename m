Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6205E58C8B4
	for <lists.virtualization@lfdr.de>; Mon,  8 Aug 2022 14:54:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5918281A3E;
	Mon,  8 Aug 2022 12:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5918281A3E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ixzcNcHx;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AtIYr0nk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oovChfSwzLvx; Mon,  8 Aug 2022 12:54:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ABFCA8276E;
	Mon,  8 Aug 2022 12:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABFCA8276E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B173AC0080;
	Mon,  8 Aug 2022 12:54:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E5C4C0080
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C169408CA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C169408CA
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ixzcNcHx; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AtIYr0nk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ye0BA1l7s0qg
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 371E1405AE
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 371E1405AE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3AA2E1F952;
 Mon,  8 Aug 2022 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0AM6xaht10Lq8zB3C1Lk4TvMgQxVsJUw4uDBhY+M90=;
 b=ixzcNcHxUHz6rFxBvBfn3pTm1NjIi7XDdvT5M1ASCt7CbTnYh6Iz/0+C0vFk9g7Ob1xmdC
 0cTjv7gAC2ql8rRPyTByI/1O+LB+SgQizhOd8UVZBETS0pkyquR7pSpqwj0ApD+IJ3Ezh3
 X5ORvlii1nDMjGBJaUxGVuxQxiygMEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963251;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0AM6xaht10Lq8zB3C1Lk4TvMgQxVsJUw4uDBhY+M90=;
 b=AtIYr0nk5r+SNAGN1xXlWeL8w2LzSkqei7WAvUxLSIm82HAXIHd9yeW+EVAWbVuO+VjtTe
 OC4AFdz01Hc8KpCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D483513A7C;
 Mon,  8 Aug 2022 12:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oD3qMnIH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 07/14] drm/format-helper: Rework XRGB8888-to-RGB888
 conversion
Date: Mon,  8 Aug 2022 14:53:59 +0200
Message-Id: <20220808125406.20752-8-tzimmermann@suse.de>
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

Update XRGB8888-to-RGB888 conversion to support struct iosys_map
and convert all users. Although these are single-plane color formats,
the new interface supports multi-plane formats for consistency with
drm_fb_blit().

v2:
	* update documentation (Sam)
	* add TODO on vaddr location (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_format_helper.c | 59 +++++++++++++++--------------
 drivers/gpu/drm/gud/gud_pipe.c      |  2 +-
 drivers/gpu/drm/tiny/cirrus.c       |  3 +-
 include/drm/drm_format_helper.h     |  8 ++--
 4 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index a77291d2f9b9..3ee57dc8bcc5 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -420,41 +420,45 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
 
 /**
  * drm_fb_xrgb8888_to_rgb888 - Convert XRGB8888 to RGB888 clip buffer
- * @dst: RGB888 destination buffer
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @src: XRGB8888 source buffer
+ * @dst: Array of RGB888 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @vmap: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
- * Drivers can use this function for RGB888 devices that don't natively
- * support XRGB8888.
- */
-void drm_fb_xrgb8888_to_rgb888(void *dst, unsigned int dst_pitch, const void *src,
-			       const struct drm_framebuffer *fb, const struct drm_rect *clip)
-{
-	drm_fb_xfrm(dst, dst_pitch, 3, src, fb, clip, false, drm_fb_xrgb8888_to_rgb888_line);
-}
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
-
-/**
- * drm_fb_xrgb8888_to_rgb888_toio - Convert XRGB8888 to RGB888 clip buffer
- * @dst: RGB565 destination buffer (iomem)
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: XRGB8888 source buffer
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
+ * This function copies parts of a framebuffer to display memory and converts the
+ * color format during the process. Destination and framebuffer formats must match. The
+ * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * least as many entries as there are planes in @fb's format. Each entry stores the
+ * value for the format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
  *
  * Drivers can use this function for RGB888 devices that don't natively
  * support XRGB8888.
  */
-void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
-				    const void *vaddr, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip)
+void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
+			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip)
 {
-	drm_fb_xfrm_toio(dst, dst_pitch, 3, vaddr, fb, clip, false,
-			 drm_fb_xrgb8888_to_rgb888_line);
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	/* TODO: handle vmap in I/O memory here */
+	if (dst[0].is_iomem)
+		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 3, vmap[0].vaddr, fb,
+				 clip, false, drm_fb_xrgb8888_to_rgb888_line);
+	else
+		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 3, vmap[0].vaddr, fb,
+			    clip, false, drm_fb_xrgb8888_to_rgb888_line);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_toio);
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
 
 static void drm_fb_rgb565_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
@@ -638,8 +642,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		}
 	} else if (dst_format == DRM_FORMAT_RGB888) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_rgb888_toio(dst[0].vaddr_iomem, dst_pitch[0],
-						       vmap[0].vaddr, fb, clip);
+			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, vmap, fb, clip);
 			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_XRGB8888) {
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index a43eb6645352..0caa228f736d 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -201,7 +201,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			drm_fb_xrgb8888_to_rgb565(&dst, NULL, map_data, fb, rect,
 						  gud_is_big_endian());
 		} else if (format->format == DRM_FORMAT_RGB888) {
-			drm_fb_xrgb8888_to_rgb888(buf, 0, vaddr, fb, rect);
+			drm_fb_xrgb8888_to_rgb888(&dst, NULL, map_data, fb, rect);
 		} else {
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 9cd398e4700b..354d5e854a6f 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -321,7 +321,6 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
 	struct iosys_map dst;
-	void *vaddr = vmap->vaddr; /* TODO: Use mapping abstraction properly */
 	int idx;
 
 	if (!drm_dev_enter(&cirrus->dev, &idx))
@@ -339,7 +338,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
 		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
-		drm_fb_xrgb8888_to_rgb888_toio(dst.vaddr_iomem, cirrus->pitch, vaddr, fb, rect);
+		drm_fb_xrgb8888_to_rgb888(&dst, &cirrus->pitch, vmap, fb, rect);
 
 	} else {
 		WARN_ON_ONCE("cpp mismatch");
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 9f1d45d7ce84..8c633dbab5d6 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -26,11 +26,9 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, bool swab);
-void drm_fb_xrgb8888_to_rgb888(void *dst, unsigned int dst_pitch, const void *src,
-			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
-void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
-				    const void *vaddr, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
+			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst, unsigned int dst_pitch,
 					 const void *vaddr, const struct drm_framebuffer *fb,
 					 const struct drm_rect *clip);
-- 
2.37.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
