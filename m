Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539961827B
	for <lists.virtualization@lfdr.de>; Thu,  3 Nov 2022 16:20:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E08F61004;
	Thu,  3 Nov 2022 15:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E08F61004
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yti9r2qW;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2ajT4ujF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWw24IJbTcRc; Thu,  3 Nov 2022 15:20:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F04F261007;
	Thu,  3 Nov 2022 15:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F04F261007
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD45CC0084;
	Thu,  3 Nov 2022 15:20:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80DDCC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Nov 2022 15:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F32E81EF3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Nov 2022 15:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F32E81EF3
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=yti9r2qW; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2ajT4ujF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3QhPwiv3JZ1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Nov 2022 15:20:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA91681EF2
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA91681EF2
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Nov 2022 15:20:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 53B241F8EF;
 Thu,  3 Nov 2022 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667488499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vZDLOJd6MhABJ+xWbcToVn7E+N8T6jjqOm5hhU1vcE=;
 b=yti9r2qWk9MpHeMKTVrTMsnHKmzs8r+WSILqoCaZXPgCYKo3JnU+BAsP+TuN/aPI5uwdMK
 HvGlepxAFJWH/SUvWHhKbVoa/ldyIVEi8Xs3FEzrkEjof9lErKuo1XrDINe4NXuwjSekIW
 jVZSiu0fEpk7WQwyTdPfVeWnQY832A4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667488499;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vZDLOJd6MhABJ+xWbcToVn7E+N8T6jjqOm5hhU1vcE=;
 b=2ajT4ujFWhdm3DtOFuj2efRbCkmjwPhuuTSrUUsdxA2jpJJ/72DvyMCD42cLpJ0XRfHVR3
 MgsQNmAGVakNH3Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C126013AAF;
 Thu,  3 Nov 2022 15:14:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uGieLPLaY2PBGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Nov 2022 15:14:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 18/23] drm/fb_helper: Minimize damage-helper overhead
Date: Thu,  3 Nov 2022 16:14:41 +0100
Message-Id: <20221103151446.2638-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221103151446.2638-1-tzimmermann@suse.de>
References: <20221103151446.2638-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-hyperv@vger.kernel.orglinux-hyperv"@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
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

Pull the test for fb_dirty into the caller to avoid extra work
if no callback has been set. In this case no damage handling is
required and no damage area needs to be computed. Print a warning
if the damage worker runs without getting an fb_dirty callback.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 90 ++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index c7c0c0a8532b4..3dfda1e3830b3 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -449,12 +449,13 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 static void drm_fb_helper_damage_work(struct work_struct *work)
 {
 	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
+	struct drm_device *dev = helper->dev;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
 	int ret;
 
-	if (!helper->funcs->fb_dirty)
+	if (drm_WARN_ON_ONCE(dev, !helper->funcs->fb_dirty))
 		return;
 
 	spin_lock_irqsave(&helper->damage_lock, flags);
@@ -659,16 +660,12 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 }
 EXPORT_SYMBOL(drm_fb_helper_fini);
 
-static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
+static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 				 u32 width, u32 height)
 {
-	struct drm_fb_helper *helper = info->par;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	unsigned long flags;
 
-	if (!helper->funcs->fb_dirty)
-		return;
-
 	spin_lock_irqsave(&helper->damage_lock, flags);
 	clip->x1 = min_t(u32, clip->x1, x);
 	clip->y1 = min_t(u32, clip->y1, y);
@@ -718,6 +715,7 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
  */
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
+	struct drm_fb_helper *helper = info->par;
 	unsigned long start, end, min_off, max_off;
 	struct fb_deferred_io_pageref *pageref;
 	struct drm_rect damage_area;
@@ -733,17 +731,19 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 	if (min_off >= max_off)
 		return;
 
-	/*
-	 * As we can only track pages, we might reach beyond the end
-	 * of the screen and account for non-existing scanlines. Hence,
-	 * keep the covered memory area within the screen buffer.
-	 */
-	max_off = min(max_off, info->screen_size);
+	if (helper->funcs->fb_dirty) {
+		/*
+		 * As we can only track pages, we might reach beyond the end
+		 * of the screen and account for non-existing scanlines. Hence,
+		 * keep the covered memory area within the screen buffer.
+		 */
+		max_off = min(max_off, info->screen_size);
 
-	drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
+	}
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
@@ -877,6 +877,7 @@ static ssize_t drm_fb_helper_write_screen_buffer(struct fb_info *info, const cha
 ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct drm_fb_helper *helper = info->par;
 	loff_t pos = *ppos;
 	ssize_t ret;
 	struct drm_rect damage_area;
@@ -885,10 +886,12 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 	if (ret <= 0)
 		return ret;
 
-	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
+	}
 
 	return ret;
 }
@@ -904,8 +907,12 @@ EXPORT_SYMBOL(drm_fb_helper_sys_write);
 void drm_fb_helper_sys_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	sys_fillrect(info, rect);
-	drm_fb_helper_damage(info, rect->dx, rect->dy, rect->width, rect->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
 
@@ -919,8 +926,12 @@ EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
 void drm_fb_helper_sys_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	sys_copyarea(info, area);
-	drm_fb_helper_damage(info, area->dx, area->dy, area->width, area->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
 
@@ -934,8 +945,12 @@ EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
 void drm_fb_helper_sys_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	sys_imageblit(info, image);
-	drm_fb_helper_damage(info, image->dx, image->dy, image->width, image->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
@@ -1035,6 +1050,7 @@ static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf
 ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct drm_fb_helper *helper = info->par;
 	loff_t pos = *ppos;
 	ssize_t ret;
 	struct drm_rect damage_area;
@@ -1043,10 +1059,12 @@ ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
 	if (ret <= 0)
 		return ret;
 
-	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
-			     drm_rect_width(&damage_area),
-			     drm_rect_height(&damage_area));
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
+	}
 
 	return ret;
 }
@@ -1062,8 +1080,12 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_write);
 void drm_fb_helper_cfb_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	cfb_fillrect(info, rect);
-	drm_fb_helper_damage(info, rect->dx, rect->dy, rect->width, rect->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
 
@@ -1077,8 +1099,12 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
 void drm_fb_helper_cfb_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	cfb_copyarea(info, area);
-	drm_fb_helper_damage(info, area->dx, area->dy, area->width, area->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
 
@@ -1092,8 +1118,12 @@ EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
 void drm_fb_helper_cfb_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
+	struct drm_fb_helper *helper = info->par;
+
 	cfb_imageblit(info, image);
-	drm_fb_helper_damage(info, image->dx, image->dy, image->width, image->height);
+
+	if (helper->funcs->fb_dirty)
+		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
 
-- 
2.38.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
