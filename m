Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE4361C3D
	for <lists.virtualization@lfdr.de>; Fri, 16 Apr 2021 11:01:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 598CB4187F;
	Fri, 16 Apr 2021 09:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghHtSinO4IMM; Fri, 16 Apr 2021 09:00:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AFD4063E;
	Fri, 16 Apr 2021 09:00:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C1D8C0015;
	Fri, 16 Apr 2021 09:00:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FDEFC000A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 09:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C79BB6066C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 09:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GnIzTU2Yv31
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 09:00:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB6D460DD0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 09:00:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D97AAE86;
 Fri, 16 Apr 2021 09:00:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, gregkh@linuxfoundation.org
Subject: [PATCH v4 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
Date: Fri, 16 Apr 2021 11:00:40 +0200
Message-Id: <20210416090048.11492-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210416090048.11492-1-tzimmermann@suse.de>
References: <20210416090048.11492-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
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

The memcpy's destination buffer might have a different pitch than the
source. Support different pitches as function argument.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/drm_format_helper.c    | 9 +++++----
 drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
 drivers/gpu/drm/tiny/cirrus.c          | 2 +-
 include/drm/drm_format_helper.h        | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index c043ca364c86..8d5a683afea7 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -52,6 +52,7 @@ EXPORT_SYMBOL(drm_fb_memcpy);
 /**
  * drm_fb_memcpy_dstclip - Copy clip buffer
  * @dst: Destination buffer (iomem)
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: Source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -59,12 +60,12 @@ EXPORT_SYMBOL(drm_fb_memcpy);
  * This function applies clipping on dst, i.e. the destination is a
  * full (iomem) framebuffer but only the clip rect content is copied over.
  */
-void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
-			   struct drm_framebuffer *fb,
+void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			   void *vaddr, struct drm_framebuffer *fb,
 			   struct drm_rect *clip)
 {
 	unsigned int cpp = fb->format->cpp[0];
-	unsigned int offset = clip_offset(clip, fb->pitches[0], cpp);
+	unsigned int offset = clip_offset(clip, dst_pitch, cpp);
 	size_t len = (clip->x2 - clip->x1) * cpp;
 	unsigned int y, lines = clip->y2 - clip->y1;
 
@@ -73,7 +74,7 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
 	for (y = 0; y < lines; y++) {
 		memcpy_toio(dst, vaddr, len);
 		vaddr += fb->pitches[0];
-		dst += fb->pitches[0];
+		dst += dst_pitch;
 	}
 }
 EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index cece3e57fb27..9d576240faed 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1554,7 +1554,7 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
 {
 	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
 
-	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
+	drm_fb_memcpy_dstclip(mdev->vram, fb->pitches[0], vmap, fb, clip);
 
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index e3afb45d9a5c..42611dacde88 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -324,7 +324,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_
 		return -ENODEV;
 
 	if (cirrus->cpp == fb->format->cpp[0])
-		drm_fb_memcpy_dstclip(cirrus->vram,
+		drm_fb_memcpy_dstclip(cirrus->vram, fb->pitches[0],
 				      vmap, fb, rect);
 
 	else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2)
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 5f9e37032468..2b5036a5fbe7 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -11,7 +11,7 @@ struct drm_rect;
 
 void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb,
 		   struct drm_rect *clip);
-void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
+void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch, void *vaddr,
 			   struct drm_framebuffer *fb,
 			   struct drm_rect *clip);
 void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
