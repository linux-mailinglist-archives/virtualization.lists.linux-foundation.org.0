Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E0E4377F4
	for <lists.virtualization@lfdr.de>; Fri, 22 Oct 2021 15:28:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D71983B4E;
	Fri, 22 Oct 2021 13:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKuHqdQ-SPWa; Fri, 22 Oct 2021 13:28:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 04D0B83BC6;
	Fri, 22 Oct 2021 13:28:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B84CC0036;
	Fri, 22 Oct 2021 13:28:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D86D1C0034
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 13:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B242E608D6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 13:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="VzDlkF0r";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="RfZJaBjK"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5HBYgAfTELf6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 13:28:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3721560852
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Oct 2021 13:28:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C3711FD61;
 Fri, 22 Oct 2021 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634909314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAXhOGGQChGHzwGT3Hlb/AiRyfXcxrct3puTJA/Y8zg=;
 b=VzDlkF0rpL5wCVgoogNB6cbnBgooTK6YucyCHwbHVR1PNY/onR7JQdkHSgkkahG4t7yjy8
 Ejz9h3gAOZRyA7yev+lm9KWR56RB7/VWGa/gMrZvX0cNZZ9WynMyOy1RWbrxgRpQA1+vic
 EAxppaVC8GIaDR5mGMlocIo8rWDHFxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634909314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAXhOGGQChGHzwGT3Hlb/AiRyfXcxrct3puTJA/Y8zg=;
 b=RfZJaBjKc5Mv80HvRiAGJ3QWFjhDmrhaS1IUlgRR3re4gRCDO2SsJ2UJhVsub9xpzfnP97
 p/BSaryvqk6cRYCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18C9313CDA;
 Fri, 22 Oct 2021 13:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SLEBBYK8cmEwXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Oct 2021 13:28:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Subject: [PATCH 8/9] drm/simpledrm: Support virtual screen sizes
Date: Fri, 22 Oct 2021 15:28:28 +0200
Message-Id: <20211022132829.7697-9-tzimmermann@suse.de>
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

Add constants for the maximum size of the shadow-plane surface
size. Useful for shadow planes with virtual screen sizes. The
current sizes are 4096 scanlines with 4096 pixels each. This
seems reasonable for current hardware, but can be increased as
necessary.

In simpledrm, set the maximum framebuffer size from the constants
for shadow planes. Implements support for virtual screen sizes and
page flipping on the fbdev console.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c    |  9 +++++++--
 include/drm/drm_gem_atomic_helper.h | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index e872121e9fb0..e42ae1c6ebcd 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -2,6 +2,7 @@
 
 #include <linux/clk.h>
 #include <linux/of_clk.h>
+#include <linux/minmax.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -776,6 +777,7 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
 	struct drm_display_mode *mode = &sdev->mode;
 	struct drm_connector *connector = &sdev->connector;
 	struct drm_simple_display_pipe *pipe = &sdev->pipe;
+	unsigned long max_width, max_height;
 	const uint32_t *formats;
 	size_t nformats;
 	int ret;
@@ -784,10 +786,13 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
 	if (ret)
 		return ret;
 
+	max_width = max_t(unsigned long, mode->hdisplay, DRM_SHADOW_PLANE_MAX_WIDTH);
+	max_height = max_t(unsigned long, mode->vdisplay, DRM_SHADOW_PLANE_MAX_HEIGHT);
+
 	dev->mode_config.min_width = mode->hdisplay;
-	dev->mode_config.max_width = mode->hdisplay;
+	dev->mode_config.max_width = max_width;
 	dev->mode_config.min_height = mode->vdisplay;
-	dev->mode_config.max_height = mode->vdisplay;
+	dev->mode_config.max_height = max_height;
 	dev->mode_config.prefer_shadow_fbdev = true;
 	dev->mode_config.preferred_depth = sdev->format->cpp[0] * 8;
 	dev->mode_config.funcs = &simpledrm_mode_config_funcs;
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
index 48222a107873..54983ecf641a 100644
--- a/include/drm/drm_gem_atomic_helper.h
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -22,6 +22,24 @@ int drm_gem_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
  * Helpers for planes with shadow buffers
  */
 
+/**
+ * DRM_SHADOW_PLANE_MAX_WIDTH - Maximum width of a plane's shadow buffer in pixels
+ *
+ * For drivers with shadow planes, the maximum width of the framebuffer is
+ * usually independent from hardware limitations. Drivers can initialize struct
+ * drm_mode_config.max_width from DRM_SHADOW_PLANE_MAX_WIDTH.
+ */
+#define DRM_SHADOW_PLANE_MAX_WIDTH	(1ul << 12)
+
+/**
+ * DRM_SHADOW_PLANE_MAX_HEIGHT - Maximum height of a plane's shadow buffer in scanlines
+ *
+ * For drivers with shadow planes, the maximum height of the framebuffer is
+ * usually independent from hardware limitations. Drivers can initialize struct
+ * drm_mode_config.max_height from DRM_SHADOW_PLANE_MAX_HEIGHT.
+ */
+#define DRM_SHADOW_PLANE_MAX_HEIGHT	(1ul << 12)
+
 /**
  * struct drm_shadow_plane_state - plane state for planes with shadow buffers
  *
-- 
2.33.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
