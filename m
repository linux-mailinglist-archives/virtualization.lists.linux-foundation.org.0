Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC71553D7
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 09:41:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D6B2D87E23;
	Fri,  7 Feb 2020 08:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXHVS0oXMWOH; Fri,  7 Feb 2020 08:41:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4C27587D8B;
	Fri,  7 Feb 2020 08:41:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CF09C013E;
	Fri,  7 Feb 2020 08:41:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E31FEC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D053B86448
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWsdOobCQrdx
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2403286433
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F175FB145;
 Fri,  7 Feb 2020 08:41:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH 3/6] drm/ast: Use simple encoder
Date: Fri,  7 Feb 2020 09:41:32 +0100
Message-Id: <20200207084135.4524-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207084135.4524-1-tzimmermann@suse.de>
References: <20200207084135.4524-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
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

The ast driver uses an empty implementation for its encoder. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  6 +-----
 drivers/gpu/drm/ast/ast_mode.c | 25 ++++++++-----------------
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index f5d8780776ae..656d591b154b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -121,6 +121,7 @@ struct ast_private {
 		unsigned int next_index;
 	} cursor;
 
+	struct drm_encoder encoder;
 	struct drm_plane primary_plane;
 	struct drm_plane cursor_plane;
 
@@ -238,13 +239,8 @@ struct ast_crtc {
 	u8 offset_x, offset_y;
 };
 
-struct ast_encoder {
-	struct drm_encoder base;
-};
-
 #define to_ast_crtc(x) container_of(x, struct ast_crtc, base)
 #define to_ast_connector(x) container_of(x, struct ast_connector, base)
-#define to_ast_encoder(x) container_of(x, struct ast_encoder, base)
 
 struct ast_vbios_stdtable {
 	u8 misc;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 562ea6d9df13..60facaa152ac 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -968,28 +968,19 @@ static int ast_crtc_init(struct drm_device *dev)
  * Encoder
  */
 
-static void ast_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-	kfree(encoder);
-}
-
-static const struct drm_encoder_funcs ast_enc_funcs = {
-	.destroy = ast_encoder_destroy,
-};
-
 static int ast_encoder_init(struct drm_device *dev)
 {
-	struct ast_encoder *ast_encoder;
+	struct ast_private *ast = dev->dev_private;
+	struct drm_encoder *encoder = &ast->encoder;
+	int ret;
 
-	ast_encoder = kzalloc(sizeof(struct ast_encoder), GFP_KERNEL);
-	if (!ast_encoder)
-		return -ENOMEM;
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC,
+				      NULL);
+	if (ret)
+		return ret;
 
-	drm_encoder_init(dev, &ast_encoder->base, &ast_enc_funcs,
-			 DRM_MODE_ENCODER_DAC, NULL);
+	encoder->possible_crtcs = 1;
 
-	ast_encoder->base.possible_crtcs = 1;
 	return 0;
 }
 
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
