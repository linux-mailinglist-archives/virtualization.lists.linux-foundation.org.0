Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B716229E
	for <lists.virtualization@lfdr.de>; Tue, 18 Feb 2020 09:48:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 24BF6870DF;
	Tue, 18 Feb 2020 08:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfpZbZLWhhyI; Tue, 18 Feb 2020 08:48:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4173687356;
	Tue, 18 Feb 2020 08:48:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3596AC08A0;
	Tue, 18 Feb 2020 08:48:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0CB3C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 08:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CD1FF20198
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 08:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tt7JkOKrhgI3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 08:48:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 7C8B92014B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 08:48:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 738B0AE5C;
 Tue, 18 Feb 2020 08:48:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH v2 3/4] drm/mgag200: Use simple encoder
Date: Tue, 18 Feb 2020 09:48:14 +0100
Message-Id: <20200218084815.2137-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218084815.2137-1-tzimmermann@suse.de>
References: <20200218084815.2137-1-tzimmermann@suse.de>
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

The mgag200 driver uses an empty implementation for its encoder. Replace
the code with the generic simple encoder.

v2:
	* rebase onto new simple-encoder interface

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  7 ---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 61 ++------------------------
 2 files changed, 3 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index aa32aad222c2..9bb9e8e14539 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -95,7 +95,6 @@
 #define MATROX_DPMS_CLEARED (-1)
 
 #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
-#define to_mga_encoder(x) container_of(x, struct mga_encoder, base)
 #define to_mga_connector(x) container_of(x, struct mga_connector, base)
 
 struct mga_crtc {
@@ -110,12 +109,6 @@ struct mga_mode_info {
 	struct mga_crtc *crtc;
 };
 
-struct mga_encoder {
-	struct drm_encoder base;
-	int last_dpms;
-};
-
-
 struct mga_i2c_chan {
 	struct i2c_adapter adapter;
 	struct drm_device *dev;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 62a8e9ccb16d..957ea1057b6c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -15,6 +15,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -1449,72 +1450,16 @@ static void mga_crtc_init(struct mga_device *mdev)
 	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
 }
 
-/*
- * The encoder comes after the CRTC in the output pipeline, but before
- * the connector. It's responsible for ensuring that the digital
- * stream is appropriately converted into the output format. Setup is
- * very simple in this case - all we have to do is inform qemu of the
- * colour depth in order to ensure that it displays appropriately
- */
-
-/*
- * These functions are analagous to those in the CRTC code, but are intended
- * to handle any encoder-specific limitations
- */
-static void mga_encoder_mode_set(struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
-{
-
-}
-
-static void mga_encoder_dpms(struct drm_encoder *encoder, int state)
-{
-	return;
-}
-
-static void mga_encoder_prepare(struct drm_encoder *encoder)
-{
-}
-
-static void mga_encoder_commit(struct drm_encoder *encoder)
-{
-}
-
-static void mga_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mga_encoder *mga_encoder = to_mga_encoder(encoder);
-	drm_encoder_cleanup(encoder);
-	kfree(mga_encoder);
-}
-
-static const struct drm_encoder_helper_funcs mga_encoder_helper_funcs = {
-	.dpms = mga_encoder_dpms,
-	.mode_set = mga_encoder_mode_set,
-	.prepare = mga_encoder_prepare,
-	.commit = mga_encoder_commit,
-};
-
-static const struct drm_encoder_funcs mga_encoder_encoder_funcs = {
-	.destroy = mga_encoder_destroy,
-};
-
 static struct drm_encoder *mga_encoder_init(struct drm_device *dev)
 {
 	struct drm_encoder *encoder;
-	struct mga_encoder *mga_encoder;
 
-	mga_encoder = kzalloc(sizeof(struct mga_encoder), GFP_KERNEL);
-	if (!mga_encoder)
+	encoder = drm_simple_encoder_create(dev, DRM_MODE_ENCODER_DAC);
+	if (IS_ERR(encoder))
 		return NULL;
 
-	encoder = &mga_encoder->base;
 	encoder->possible_crtcs = 0x1;
 
-	drm_encoder_init(dev, encoder, &mga_encoder_encoder_funcs,
-			 DRM_MODE_ENCODER_DAC, NULL);
-	drm_encoder_helper_add(encoder, &mga_encoder_helper_funcs);
-
 	return encoder;
 }
 
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
