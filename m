Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC3916C1D2
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 14:11:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 098F2878E3;
	Tue, 25 Feb 2020 13:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJw8RbrVipCv; Tue, 25 Feb 2020 13:11:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ACA6C878F1;
	Tue, 25 Feb 2020 13:11:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BC12C18DA;
	Tue, 25 Feb 2020 13:11:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A72CC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 13:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 78F9F8789B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 13:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApB9vSqxA+HN
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 13:11:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DB45F8788E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 13:11:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2FB1EB1A4;
 Tue, 25 Feb 2020 13:11:03 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH v3 2/4] drm/ast: Use simple encoder
Date: Tue, 25 Feb 2020 14:10:53 +0100
Message-Id: <20200225131055.27550-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225131055.27550-1-tzimmermann@suse.de>
References: <20200225131055.27550-1-tzimmermann@suse.de>
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

v2:
	* rebase onto new simple-encoder interface

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
index 562ea6d9df13..7a9f20a2fd30 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -40,6 +40,7 @@
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "ast_drv.h"
 #include "ast_tables.h"
@@ -968,28 +969,18 @@ static int ast_crtc_init(struct drm_device *dev)
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
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
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
