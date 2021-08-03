Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C683DEE95
	for <lists.virtualization@lfdr.de>; Tue,  3 Aug 2021 14:59:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A7304032E;
	Tue,  3 Aug 2021 12:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoiIUPg7o5LM; Tue,  3 Aug 2021 12:59:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A2984404D6;
	Tue,  3 Aug 2021 12:59:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAE04C0026;
	Tue,  3 Aug 2021 12:59:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AF6AC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 12:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8693040348
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 12:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kZ5IMwaL1vb
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 12:59:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4A3B402E1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 12:59:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 148AD22084;
 Tue,  3 Aug 2021 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627995576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MROQ0m4qHUIUFE4xO+08CVeZ9jU4Y+FvvW7n66qEaus=;
 b=t6bJFoQ1DI4cGzF0f3f2c5erAOADIqgJzfuDHDZIe40tT4/om9TUsV/gmkQfaSdHTA7Wdu
 Ah6V8s0IG7ztMCaJMVj+ooXCTXV5i2PeL2xiLeAxafDvc0akwOMvY6EePOxWGW/jvhN4vX
 citNwWFHurcUWLwF5eqJO2wLywcMgVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627995576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MROQ0m4qHUIUFE4xO+08CVeZ9jU4Y+FvvW7n66qEaus=;
 b=niiv1qvrj/eITnwStuLLYR78eM5b5KO0hW23ME219N7azZ81wZgUj40dJvCrRewxXk4MDI
 yHaLsdixocod99Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91BC213CD6;
 Tue,  3 Aug 2021 12:59:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EA5HIrc9CWExZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 12:59:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, noralf@tronnes.org,
 drawat.floss@gmail.com, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 sam@ravnborg.org
Subject: [PATCH 10/11] drm/vbox: Use offset-adjusted shadow-plane mappings
Date: Tue,  3 Aug 2021 14:59:27 +0200
Message-Id: <20210803125928.27780-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803125928.27780-1-tzimmermann@suse.de>
References: <20210803125928.27780-1-tzimmermann@suse.de>
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

For framebuffers with non-zero offset fields, shadow-plane helpers
provide a pointer to the first byte of the contained data. Use it in
vbox.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 972c83b720aa..4227a915b06a 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -398,7 +398,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	u32 height = new_state->crtc_h;
 	struct drm_shadow_plane_state *shadow_plane_state =
 		to_drm_shadow_plane_state(new_state);
-	struct dma_buf_map map = shadow_plane_state->map[0];
+	struct dma_buf_map map = shadow_plane_state->data[0];
 	u8 *src = map.vaddr; /* TODO: Use mapping abstraction properly */
 	size_t data_size, mask_size;
 	u32 flags;
-- 
2.32.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
