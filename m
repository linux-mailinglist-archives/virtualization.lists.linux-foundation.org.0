Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A13E5698075
	for <lists.virtualization@lfdr.de>; Wed, 15 Feb 2023 17:15:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDC641725;
	Wed, 15 Feb 2023 16:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DDC641725
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QPo/Elnu;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nwoddGzO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNdNUeh-s3aG; Wed, 15 Feb 2023 16:15:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1390441746;
	Wed, 15 Feb 2023 16:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1390441746
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C9A5C0082;
	Wed, 15 Feb 2023 16:15:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68E95C0033
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Feb 2023 16:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45B9F4086C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Feb 2023 16:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B9F4086C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xP-QCh1VEs_e
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Feb 2023 16:15:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7128040278
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7128040278
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Feb 2023 16:15:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5156339A6;
 Wed, 15 Feb 2023 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRFV+QNI8PjidzHXCFWglMswHRXc8TtDlGt9X2IgUWo=;
 b=QPo/ElnuRiYGAM/gjIEGunaxfauLe0qhS6VEmhuqMejUuwb7JVXz1ABwuRnFl4nNFuPYge
 RWS5WaEK5PW8taGXOHLmQsas43YB6sARlL/P3DGpFah9V/W84/YeApNEJPuJ9X90yRJWx5
 3TAYdvv0FimmUtNdjwSdjiE/jpLyyYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRFV+QNI8PjidzHXCFWglMswHRXc8TtDlGt9X2IgUWo=;
 b=nwoddGzOQ/Ck2ia1nJhJghIONnbSwisn1nVPWSt30nhf60KPcKNOcKrm/t8V9d0Zkf0oXy
 q0oNUSBgrCEHTeAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73521134BA;
 Wed, 15 Feb 2023 16:15:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UBYBFiIF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 16/17] drm/cirrus: Store HW format/pitch in primary-plane state
Date: Wed, 15 Feb 2023 17:15:16 +0100
Message-Id: <20230215161517.5113-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215161517.5113-1-tzimmermann@suse.de>
References: <20230215161517.5113-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
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

The hardware settings for color format and pitch are state of the
primary plane. Store the values in the primary plane's state structure
struct cirrus_primary_plane_state. Adapt all callers.

All fields in struct cirrus_device are now considered immutable after
initialization. Plane updates consider the difference between the old
and the new plane state before updating format or pitch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 51 +++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index ec6b918dce7b..ad67fb895213 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -63,10 +63,6 @@ struct cirrus_device {
 	struct drm_encoder	       encoder;
 	struct drm_connector	       connector;
 
-	/* HW scanout buffer */
-	const struct drm_format_info   *format;
-	unsigned int		       pitch;
-
 	/* HW resources */
 	void __iomem		       *vram;
 	void __iomem		       *mmio;
@@ -76,6 +72,10 @@ struct cirrus_device {
 
 struct cirrus_primary_plane_state {
 	struct drm_shadow_plane_state base;
+
+	/* HW scanout buffer */
+	const struct drm_format_info   *format;
+	unsigned int		       pitch;
 };
 
 static inline struct cirrus_primary_plane_state *
@@ -268,15 +268,14 @@ static void cirrus_mode_set(struct cirrus_device *cirrus,
 }
 
 static void cirrus_format_set(struct cirrus_device *cirrus,
-			      struct drm_framebuffer *fb)
+			      const struct drm_format_info *format)
 {
 	u8 sr07, hdr;
 
 	sr07 = rreg_seq(cirrus, 0x07);
 	sr07 &= 0xe0;
 
-	cirrus->format = cirrus_format(fb);
-	switch (cirrus->format->format) {
+	switch (format->format) {
 	case DRM_FORMAT_C8:
 		sr07 |= 0x11;
 		hdr = 0x00;
@@ -308,20 +307,18 @@ static void cirrus_format_set(struct cirrus_device *cirrus,
 	wreg_hdr(cirrus, hdr);
 }
 
-static void cirrus_pitch_set(struct cirrus_device *cirrus,
-			     struct drm_framebuffer *fb)
+static void cirrus_pitch_set(struct cirrus_device *cirrus, unsigned int pitch)
 {
 	u8 cr13, cr1b;
 
 	/* Program the pitch */
-	cirrus->pitch = cirrus_pitch(fb);
-	cr13 = cirrus->pitch / 8;
+	cr13 = pitch / 8;
 	wreg_crt(cirrus, VGA_CRTC_OFFSET, cr13);
 
 	/* Enable extended blanking and pitch bits, and enable full memory */
 	cr1b = 0x22;
-	cr1b |= (cirrus->pitch >> 7) & 0x10;
-	cr1b |= (cirrus->pitch >> 6) & 0x40;
+	cr1b |= (pitch >> 7) & 0x10;
+	cr1b |= (pitch >> 6) & 0x40;
 	wreg_crt(cirrus, 0x1b, cr1b);
 
 	cirrus_set_start_address(cirrus, 0);
@@ -345,6 +342,8 @@ static int cirrus_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						    struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct cirrus_primary_plane_state *new_primary_plane_state =
+		to_cirrus_primary_plane_state(new_plane_state);
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
@@ -371,6 +370,9 @@ static int cirrus_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (pitch * fb->height > CIRRUS_VRAM_SIZE)
 		return -EINVAL;
 
+	new_primary_plane_state->format = cirrus_format(fb);
+	new_primary_plane_state->pitch = pitch;
+
 	return 0;
 }
 
@@ -379,9 +381,15 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 {
 	struct cirrus_device *cirrus = to_cirrus(plane->dev);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct cirrus_primary_plane_state *primary_plane_state =
+		to_cirrus_primary_plane_state(plane_state);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
+	const struct drm_format_info *format = primary_plane_state->format;
+	unsigned int pitch = primary_plane_state->pitch;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct cirrus_primary_plane_state *old_primary_plane_state =
+		to_cirrus_primary_plane_state(old_plane_state);
 	struct iosys_map vaddr = IOSYS_MAP_INIT_VADDR_IOMEM(cirrus->vram);
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
@@ -393,18 +401,17 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		return;
 
-	if (cirrus->format != cirrus_format(fb))
-		cirrus_format_set(cirrus, fb);
-	if (cirrus->pitch != cirrus_pitch(fb))
-		cirrus_pitch_set(cirrus, fb);
+	if (old_primary_plane_state->format != format)
+		cirrus_format_set(cirrus, format);
+	if (old_primary_plane_state->pitch != pitch)
+		cirrus_pitch_set(cirrus, pitch);
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		unsigned int offset = drm_fb_clip_offset(cirrus->pitch, fb->format, &damage);
+		unsigned int offset = drm_fb_clip_offset(pitch, format, &damage);
 		struct iosys_map dst = IOSYS_MAP_INIT_OFFSET(&vaddr, offset);
 
-		drm_fb_blit(&dst, &cirrus->pitch, cirrus->format->format,
-			    &shadow_plane_state->data[0], fb, &damage);
+		drm_fb_blit(&dst, &pitch, format->format, shadow_plane_state->data, fb, &damage);
 	}
 
 	drm_dev_exit(idx);
@@ -420,6 +427,8 @@ static struct drm_plane_state *
 cirrus_primary_plane_atomic_duplicate_state(struct drm_plane *plane)
 {
 	struct drm_plane_state *plane_state = plane->state;
+	struct cirrus_primary_plane_state *primary_plane_state =
+		to_cirrus_primary_plane_state(plane_state);
 	struct cirrus_primary_plane_state *new_primary_plane_state;
 	struct drm_shadow_plane_state *new_shadow_plane_state;
 
@@ -432,6 +441,8 @@ cirrus_primary_plane_atomic_duplicate_state(struct drm_plane *plane)
 	new_shadow_plane_state = &new_primary_plane_state->base;
 
 	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
+	new_primary_plane_state->format = primary_plane_state->format;
+	new_primary_plane_state->pitch = primary_plane_state->pitch;
 
 	return &new_shadow_plane_state->base;
 }
-- 
2.39.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
