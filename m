Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA876BB947
	for <lists.virtualization@lfdr.de>; Wed, 15 Mar 2023 17:14:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F36860F69;
	Wed, 15 Mar 2023 16:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F36860F69
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mlXTChYJ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cVUrTcy5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNZD5Nwm_QAk; Wed, 15 Mar 2023 16:14:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4E94360F34;
	Wed, 15 Mar 2023 16:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E94360F34
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88C0AC008D;
	Wed, 15 Mar 2023 16:14:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C7E2C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 16:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33E44404A5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 16:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33E44404A5
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=mlXTChYJ; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cVUrTcy5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQvSbhS1A6vs
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 16:14:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 806F340141
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 806F340141
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 16:14:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 403BB219AE;
 Wed, 15 Mar 2023 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678896884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkoMtkVpeZ7PdV7v31+be9XCyu0+0XinxZDkTWh/t8Y=;
 b=mlXTChYJ+KoAgBHXqcG6wiFrEbq2DupIqtdG36pxEYn8uYV41n1lu10BhDKp1PvUTclPmP
 JtxG/Bxo3hHqukpq/NqoJ4ESNetAZmDsk/qiZFQKGF+ZTmdRmtkV8sOcVnXE6TWknj8o+7
 smzuDpPdBdD6kKr1JzjeDKLT4R6QLKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678896884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkoMtkVpeZ7PdV7v31+be9XCyu0+0XinxZDkTWh/t8Y=;
 b=cVUrTcy5gHXWDLm1QZfn5bgiPgJAzLef22GwNps8bQ7JLOyUH0LZ6XBGZRFrfvSRx7VAJ2
 N1hSNujjmj8hBrDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06A9C13A2F;
 Wed, 15 Mar 2023 16:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WMCgAPTuEWTrAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Mar 2023 16:14:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH 2/6] drm/fbdev-generic: Remove unused prefer_shadow_fbdev flag
Date: Wed, 15 Mar 2023 17:14:38 +0100
Message-Id: <20230315161442.27318-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315161442.27318-1-tzimmermann@suse.de>
References: <20230315161442.27318-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Thomas Zimmermann <tzimmermann@suse.de>
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

Remove the flag prefer_shadow_fbdev from struct drm_mode_config.
Drivers set this flag to enable shadow buffering in the generic
fbdev emulation. Such shadow buffering is now mandatory, so the
flag is unused.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/bochs.c        | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 1 -
 include/drm/drm_mode_config.h       | 7 -------
 3 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 024346054c70..d254679a136e 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -545,7 +545,6 @@ static int bochs_kms_init(struct bochs_device *bochs)
 
 	bochs->dev->mode_config.preferred_depth = 24;
 	bochs->dev->mode_config.prefer_shadow = 0;
-	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
 	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 
 	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 84d6380b9895..5162a7a12792 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2112,7 +2112,6 @@ int vmw_kms_init(struct vmw_private *dev_priv)
 	dev->mode_config.max_width = dev_priv->texture_max_width;
 	dev->mode_config.max_height = dev_priv->texture_max_height;
 	dev->mode_config.preferred_depth = dev_priv->assume_16bpp ? 16 : 32;
-	dev->mode_config.prefer_shadow_fbdev = !dev_priv->has_mob;
 
 	drm_mode_create_suggested_offset_properties(dev);
 	vmw_kms_create_hotplug_mode_update_property(dev_priv);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index e5b053001d22..973119a9176b 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -890,13 +890,6 @@ struct drm_mode_config {
 	/* dumb ioctl parameters */
 	uint32_t preferred_depth, prefer_shadow;
 
-	/**
-	 * @prefer_shadow_fbdev:
-	 *
-	 * Hint to framebuffer emulation to prefer shadow-fb rendering.
-	 */
-	bool prefer_shadow_fbdev;
-
 	/**
 	 * @quirk_addfb_prefer_xbgr_30bpp:
 	 *
-- 
2.39.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
