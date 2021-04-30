Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FF036F8C1
	for <lists.virtualization@lfdr.de>; Fri, 30 Apr 2021 12:58:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B1A54024A;
	Fri, 30 Apr 2021 10:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgY7i3zX-Z4G; Fri, 30 Apr 2021 10:58:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 173E540170;
	Fri, 30 Apr 2021 10:58:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A263FC0001;
	Fri, 30 Apr 2021 10:58:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 267D1C0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 10:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1305E6F90B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 10:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aVQT3ODdtP2D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 10:58:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 953C46F8F5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 10:58:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF864B291;
 Fri, 30 Apr 2021 10:58:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, gregkh@linuxfoundation.org
Subject: [PATCH v5 2/9] drm/format-helper: Add blitter functions
Date: Fri, 30 Apr 2021 12:58:33 +0200
Message-Id: <20210430105840.30515-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430105840.30515-1-tzimmermann@suse.de>
References: <20210430105840.30515-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
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

The blitter functions copy a framebuffer to I/O memory using one of
the existing conversion functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/drm_format_helper.c | 87 +++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |  8 +++
 2 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 8d5a683afea7..0e885cd34107 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -344,3 +344,90 @@ void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
 
+/**
+ * drm_fb_blit_rect_dstclip - Copy parts of a framebuffer to display memory
+ * @dst:	The display memory to copy to
+ * @dst_pitch:	Number of bytes between two consecutive scanlines within dst
+ * @dst_format:	FOURCC code of the display's color format
+ * @vmap:	The framebuffer memory to copy from
+ * @fb:		The framebuffer to copy from
+ * @clip:	Clip rectangle area to copy
+ *
+ * This function copies parts of a framebuffer to display memory. If the
+ * formats of the display and the framebuffer mismatch, the blit function
+ * will attempt to convert between them.
+ *
+ * Use drm_fb_blit_dstclip() to copy the full framebuffer.
+ *
+ * Returns:
+ * 0 on success, or
+ * -EINVAL if the color-format conversion failed, or
+ * a negative error code otherwise.
+ */
+int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			     uint32_t dst_format, void *vmap,
+			     struct drm_framebuffer *fb,
+			     struct drm_rect *clip)
+{
+	uint32_t fb_format = fb->format->format;
+
+	/* treat alpha channel like filler bits */
+	if (fb_format == DRM_FORMAT_ARGB8888)
+		fb_format = DRM_FORMAT_XRGB8888;
+	if (dst_format == DRM_FORMAT_ARGB8888)
+		dst_format = DRM_FORMAT_XRGB8888;
+
+	if (dst_format == fb_format) {
+		drm_fb_memcpy_dstclip(dst, dst_pitch, vmap, fb, clip);
+		return 0;
+
+	} else if (dst_format == DRM_FORMAT_RGB565) {
+		if (fb_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_xrgb8888_to_rgb565_dstclip(dst, dst_pitch,
+							  vmap, fb, clip,
+							  false);
+			return 0;
+		}
+	} else if (dst_format == DRM_FORMAT_RGB888) {
+		if (fb_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_xrgb8888_to_rgb888_dstclip(dst, dst_pitch,
+							  vmap, fb, clip);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_fb_blit_rect_dstclip);
+
+/**
+ * drm_fb_blit_dstclip - Copy framebuffer to display memory
+ * @dst:	The display memory to copy to
+ * @dst_pitch:	Number of bytes between two consecutive scanlines within dst
+ * @dst_format:	FOURCC code of the display's color format
+ * @vmap:	The framebuffer memory to copy from
+ * @fb:		The framebuffer to copy from
+ *
+ * This function copies a full framebuffer to display memory. If the formats
+ * of the display and the framebuffer mismatch, the copy function will
+ * attempt to convert between them.
+ *
+ * See drm_fb_blit_rect_dstclip() for more inforamtion.
+ *
+ * Returns:
+ * 0 on success, or a negative error code otherwise.
+ */
+int drm_fb_blit_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			uint32_t dst_format, void *vmap,
+			struct drm_framebuffer *fb)
+{
+	struct drm_rect fullscreen = {
+		.x1 = 0,
+		.x2 = fb->width,
+		.y1 = 0,
+		.y2 = fb->height,
+	};
+	return drm_fb_blit_rect_dstclip(dst, dst_pitch, dst_format, vmap, fb,
+					&fullscreen);
+}
+EXPORT_SYMBOL(drm_fb_blit_dstclip);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 2b5036a5fbe7..4e0258a61311 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -28,4 +28,12 @@ void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch
 void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
 			      struct drm_rect *clip);
 
+int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			     uint32_t dst_format, void *vmap,
+			     struct drm_framebuffer *fb,
+			     struct drm_rect *rect);
+int drm_fb_blit_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			uint32_t dst_format, void *vmap,
+			struct drm_framebuffer *fb);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
