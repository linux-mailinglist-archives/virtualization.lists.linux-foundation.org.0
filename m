Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A12A58C8BC
	for <lists.virtualization@lfdr.de>; Mon,  8 Aug 2022 14:54:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B594417E3;
	Mon,  8 Aug 2022 12:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B594417E3
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Af/krbPZ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NYNB5gNm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkKR_UARLMOp; Mon,  8 Aug 2022 12:54:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8DB984175D;
	Mon,  8 Aug 2022 12:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB984175D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A2A2C0033;
	Mon,  8 Aug 2022 12:54:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2AF2C0083
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A042410E0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A042410E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pG6MiZWuWqcf
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D63940189
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D63940189
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:54:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D3E111FF99;
 Mon,  8 Aug 2022 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4D8JpYNawONkhxprNHgcPu3xX53VPjkYhM/kLqncRI=;
 b=Af/krbPZWZlaVYZsbxa0fSmX0K0iLkn1L1oruWY0VnM7G6Jgh7Fr4LD41aUoRn05hW/GSz
 AwruHrPst9kNxf+7ameisZ5z+IZfefbq1rUpJKqHXpbS+V6GviQkbxehkIvjKg0B4FSvMC
 Hl+tKJeHxcK1nUaWl9oLtm0gN1okIfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963250;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4D8JpYNawONkhxprNHgcPu3xX53VPjkYhM/kLqncRI=;
 b=NYNB5gNm5pTnL+OUF9PzjYvUk/yZvsgkXe65PYbh0Lsl/fGtLasyv7ZAC5nLcXOzPAGAUd
 jjPb2BrsiGUcAWBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7247613ADE;
 Mon,  8 Aug 2022 12:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qIn+GnIH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 06/14] drm/format-helper: Rework XRGB8888-to-RGBG565
 conversion
Date: Mon,  8 Aug 2022 14:53:58 +0200
Message-Id: <20220808125406.20752-7-tzimmermann@suse.de>
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

Update XRGB8888-to-RGB565 conversion to support struct iosys_map
and convert all users. Although these are single-plane color formats,
the new interface supports multi-plane formats for consistency with
drm_fb_blit().

v2:
	* update new Kunit tests
	* update documentation (Sam)
	* add TODO on vaddr location (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_format_helper.c           | 73 +++++++++----------
 drivers/gpu/drm/drm_mipi_dbi.c                |  4 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  3 +-
 .../gpu/drm/tests/drm_format_helper_test.c    | 25 ++++---
 drivers/gpu/drm/tiny/cirrus.c                 |  3 +-
 include/drm/drm_format_helper.h               |  9 +--
 6 files changed, 55 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 248fd87f0a36..a77291d2f9b9 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -357,53 +357,51 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
 
 /**
  * drm_fb_xrgb8888_to_rgb565 - Convert XRGB8888 to RGB565 clip buffer
- * @dst: RGB565 destination buffer
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: XRGB8888 source buffer
+ * @dst: Array of RGB565 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @vmap: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  * @swab: Swap bytes
  *
- * Drivers can use this function for RGB565 devices that don't natively
- * support XRGB8888.
+ * This function copies parts of a framebuffer to display memory and converts the
+ * color format during the process. Destination and framebuffer formats must match. The
+ * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * least as many entries as there are planes in @fb's format. Each entry stores the
+ * value for the format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
+ *
+ * Drivers can use this function for RGB565 devices that don't support XRGB8888 natively.
  */
-void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
-			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
-			       bool swab)
+void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
+			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip, bool swab)
 {
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
+
 	if (swab)
-		drm_fb_xfrm(dst, dst_pitch, 2, vaddr, fb, clip, false,
-			    drm_fb_xrgb8888_to_rgb565_swab_line);
+		xfrm_line = drm_fb_xrgb8888_to_rgb565_swab_line;
 	else
-		drm_fb_xfrm(dst, dst_pitch, 2, vaddr, fb, clip, false,
-			    drm_fb_xrgb8888_to_rgb565_line);
-}
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
+		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
 
-/**
- * drm_fb_xrgb8888_to_rgb565_toio - Convert XRGB8888 to RGB565 clip buffer
- * @dst: RGB565 destination buffer (iomem)
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: XRGB8888 source buffer
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
- * @swab: Swap bytes
- *
- * Drivers can use this function for RGB565 devices that don't natively
- * support XRGB8888.
- */
-void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
-				    const void *vaddr, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip, bool swab)
-{
-	if (swab)
-		drm_fb_xfrm_toio(dst, dst_pitch, 2, vaddr, fb, clip, false,
-				 drm_fb_xrgb8888_to_rgb565_swab_line);
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	/* TODO: handle vmap in I/O memory here */
+	if (dst[0].is_iomem)
+		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
+				 false, xfrm_line);
 	else
-		drm_fb_xfrm_toio(dst, dst_pitch, 2, vaddr, fb, clip, false,
-				 drm_fb_xrgb8888_to_rgb565_line);
+		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
+			    false, xfrm_line);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_toio);
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
 static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
@@ -635,8 +633,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 
 	} else if (dst_format == DRM_FORMAT_RGB565) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_rgb565_toio(dst[0].vaddr_iomem, dst_pitch[0],
-						       vmap[0].vaddr, fb, clip, false);
+			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, vmap, fb, clip, false);
 			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_RGB888) {
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index a44b7d6ae06c..84abc3920b57 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -206,7 +206,6 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct iosys_map dst_map = IOSYS_MAP_INIT_VADDR(dst);
-	void *src;
 	int ret;
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
@@ -216,7 +215,6 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	ret = drm_gem_fb_vmap(fb, map, data);
 	if (ret)
 		goto out_drm_gem_fb_end_cpu_access;
-	src = data[0].vaddr; /* TODO: Use mapping abstraction properly */
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
@@ -226,7 +224,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 			drm_fb_memcpy(&dst_map, NULL, data, fb, clip);
 		break;
 	case DRM_FORMAT_XRGB8888:
-		drm_fb_xrgb8888_to_rgb565(dst, 0, src, fb, clip, swap);
+		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, data, fb, clip, swap);
 		break;
 	default:
 		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 426a3ae6cc50..a43eb6645352 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -198,7 +198,8 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		} else if (format->format == DRM_FORMAT_RGB332) {
 			drm_fb_xrgb8888_to_rgb332(&dst, NULL, map_data, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(buf, 0, vaddr, fb, rect, gud_is_big_endian());
+			drm_fb_xrgb8888_to_rgb565(&dst, NULL, map_data, fb, rect,
+						  gud_is_big_endian());
 		} else if (format->format == DRM_FORMAT_RGB888) {
 			drm_fb_xrgb8888_to_rgb888(buf, 0, vaddr, fb, rect);
 		} else {
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 7b14694ead59..828487071796 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -227,8 +227,9 @@ static void xrgb8888_to_rgb565_test(struct kunit *test)
 	const struct convert_xrgb8888_case *params = test->param_value;
 	const struct convert_to_rgb565_result *result = &params->rgb565_result;
 	size_t dst_size;
-	__u16 *dst = NULL;
-	__u32 *src = NULL;
+	__u16 *buf = NULL;
+	__u32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
@@ -239,19 +240,19 @@ static void xrgb8888_to_rgb565_test(struct kunit *test)
 				       &params->clip);
 	KUNIT_ASSERT_GT(test, dst_size, 0);
 
-	dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
 
-	src = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, src);
+	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
 
-	drm_fb_xrgb8888_to_rgb565(dst, result->dst_pitch, src, &fb,
-				  &params->clip, false);
-	KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected, dst_size), 0);
+	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, false);
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 
-	drm_fb_xrgb8888_to_rgb565(dst, result->dst_pitch, src, &fb,
-				  &params->clip, true);
-	KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected_swab, dst_size), 0);
+	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
 }
 
 static struct kunit_case drm_format_helper_test_cases[] = {
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 73fb9f63d227..9cd398e4700b 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -335,8 +335,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
 		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
-		drm_fb_xrgb8888_to_rgb565_toio(dst.vaddr_iomem, cirrus->pitch, vaddr, fb, rect,
-					       false);
+		drm_fb_xrgb8888_to_rgb565(&dst, &cirrus->pitch, vmap, fb, rect, false);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
 		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 3c28f099e3ed..9f1d45d7ce84 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -23,12 +23,9 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
-void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
-			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
-			       bool swab);
-void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
-				    const void *vaddr, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip, bool swab);
+void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
+			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip, bool swab);
 void drm_fb_xrgb8888_to_rgb888(void *dst, unsigned int dst_pitch, const void *src,
 			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
-- 
2.37.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
