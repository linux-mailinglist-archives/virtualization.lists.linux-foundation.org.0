Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 26595582587
	for <lists.virtualization@lfdr.de>; Wed, 27 Jul 2022 13:33:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC028410C6;
	Wed, 27 Jul 2022 11:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC028410C6
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=W25wqD3O;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eD96YHmY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YPAqnj8x2WM; Wed, 27 Jul 2022 11:33:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 069604098B;
	Wed, 27 Jul 2022 11:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 069604098B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3566BC007B;
	Wed, 27 Jul 2022 11:33:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88AB3C0086
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jul 2022 11:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DBEF410A1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jul 2022 11:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DBEF410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BSs5c_hKsNjQ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jul 2022 11:33:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152164005F
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 152164005F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jul 2022 11:33:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC1EA20644;
 Wed, 27 Jul 2022 11:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658921617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFmfd9HXuJ89KgAp4+AVhcTVTZgRfo38aMhjOslwy+4=;
 b=W25wqD3OeyEJyFpI8bkFIBsqIRCsXOkmCcVSxIN+wCQhwK8tdJB426RKxGuZPVGEFoOPnb
 wllA0/tQK/TpojWhTx3AFkDixMSE4bW18OgzYkogrM563JWp5PyQ0VQNnnZNDVRM4uKw3i
 GbHN9z1Vn9L8p9Trwnvjdcl42355MP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658921617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFmfd9HXuJ89KgAp4+AVhcTVTZgRfo38aMhjOslwy+4=;
 b=eD96YHmYWsQvzXYqmRYf/A0Dbxn9mIEfmshNmRj0JMm+V870GpsYL09TKzcC03Ku7PYR2t
 G+tUOVrVjh3wSzAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F73F13AD7;
 Wed, 27 Jul 2022 11:33:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IOYDHpEi4WJmBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 11:33:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@redhat.com,
 javierm@redhat.com, drawat.floss@gmail.com, kraxel@redhat.com,
 david@lechnology.com, jose.exposito89@gmail.com
Subject: [PATCH 03/12] drm/format-helper: Convert drm_fb_swab() to struct
 iosys_map
Date: Wed, 27 Jul 2022 13:33:03 +0200
Message-Id: <20220727113312.22407-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727113312.22407-1-tzimmermann@suse.de>
References: <20220727113312.22407-1-tzimmermann@suse.de>
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

Convert drm_fb_swab() to use struct iosys_map() and convert users. The
new interface supports multi-plane color formats.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 38 +++++++++++++++++++++--------
 drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c      |  2 +-
 include/drm/drm_format_helper.h     |  6 ++---
 4 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 49589b442f18..fa22d3cb11e8 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -196,9 +196,9 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
 
 /**
  * drm_fb_swab - Swap bytes into clip buffer
- * @dst: Destination buffer
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @src: Source buffer
+ * @dst: Array of destination buffers
+ * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
+ * @vmap: Array of source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  * @cached: Source buffer is mapped cached (eg. not write-combined)
@@ -209,24 +209,42 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
  * This function does not apply clipping on dst, i.e. the destination
  * is at the top-left corner.
  */
-void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
-		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
-		 bool cached)
+void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
+		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		 const struct drm_rect *clip, bool cached)
 {
-	u8 cpp = fb->format->cpp[0];
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+	const struct drm_format_info *format = fb->format;
+	u8 cpp = format->cpp[0];
+	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels);
 
 	switch (cpp) {
 	case 4:
-		drm_fb_xfrm(dst, dst_pitch, cpp, src, fb, clip, cached, drm_fb_swab32_line);
+		swab_line = drm_fb_swab32_line;
 		break;
 	case 2:
-		drm_fb_xfrm(dst, dst_pitch, cpp, src, fb, clip, cached, drm_fb_swab16_line);
+		swab_line = drm_fb_swab16_line;
 		break;
 	default:
 		drm_warn_once(fb->dev, "Format %p4cc has unsupported pixel size.\n",
-			      &fb->format->format);
+			      &format->format);
+		swab_line = NULL;
 		break;
 	}
+	if (!swab_line)
+		return;
+
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	if (dst->is_iomem)
+		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], cpp,
+				 vmap[0].vaddr, fb, clip, cached, swab_line);
+	else
+		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], cpp, vmap[0].vaddr, fb,
+			    clip, cached, swab_line);
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 22451806fb5c..973a75585cad 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -221,7 +221,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		if (swap)
-			drm_fb_swab(dst, 0, src, fb, clip, !gem->import_attach);
+			drm_fb_swab(&dst_map, NULL, data, fb, clip, !gem->import_attach);
 		else
 			drm_fb_memcpy(&dst_map, NULL, data, fb, clip);
 		break;
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 449c95a4aee0..a15cda9ba058 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -205,7 +205,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
 	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
-		drm_fb_swab(buf, 0, vaddr, fb, rect, !import_attach);
+		drm_fb_swab(&dst, NULL, map_data, fb, rect, !import_attach);
 	} else if (compression && !import_attach && pitch == fb->pitches[0]) {
 		/* can compress directly from the framebuffer */
 		buf = vaddr + rect->y1 * pitch;
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 8af6a2717bc9..60944feaa936 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -17,9 +17,9 @@ unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info
 void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
 		   const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 		   const struct drm_rect *clip);
-void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
-		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
-		 bool cached);
+void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
+		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		 const struct drm_rect *clip, bool cached);
 void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *vaddr,
 			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
-- 
2.37.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
