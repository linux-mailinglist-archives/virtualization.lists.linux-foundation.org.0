Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CACBD1553E1
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 09:42:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 831E286432;
	Fri,  7 Feb 2020 08:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMbQ2fXMFkEJ; Fri,  7 Feb 2020 08:41:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3822886448;
	Fri,  7 Feb 2020 08:41:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B9A9C013E;
	Fri,  7 Feb 2020 08:41:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C535FC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB9CD86BDB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BN1qPvOycJA
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BC72986BA4
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 08:41:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C4FC0B149;
 Fri,  7 Feb 2020 08:41:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH 5/6] drm/qxl: Use simple encoder
Date: Fri,  7 Feb 2020 09:41:34 +0100
Message-Id: <20200207084135.4524-6-tzimmermann@suse.de>
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

The qxl driver uses an empty implementation for its encoder. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_display.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index ab4f8dd00400..fc71f7d9436a 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1007,9 +1007,6 @@ static struct drm_encoder *qxl_best_encoder(struct drm_connector *connector)
 	return &qxl_output->enc;
 }
 
-static const struct drm_encoder_helper_funcs qxl_enc_helper_funcs = {
-};
-
 static const struct drm_connector_helper_funcs qxl_connector_helper_funcs = {
 	.get_modes = qxl_conn_get_modes,
 	.mode_valid = qxl_conn_mode_valid,
@@ -1059,15 +1056,6 @@ static const struct drm_connector_funcs qxl_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static void qxl_enc_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-
-static const struct drm_encoder_funcs qxl_enc_funcs = {
-	.destroy = qxl_enc_destroy,
-};
-
 static int qxl_mode_create_hotplug_mode_update_property(struct qxl_device *qdev)
 {
 	if (qdev->hotplug_mode_update_property)
@@ -1098,15 +1086,14 @@ static int qdev_output_init(struct drm_device *dev, int num_output)
 	drm_connector_init(dev, &qxl_output->base,
 			   &qxl_connector_funcs, DRM_MODE_CONNECTOR_VIRTUAL);
 
-	drm_encoder_init(dev, &qxl_output->enc, &qxl_enc_funcs,
-			 DRM_MODE_ENCODER_VIRTUAL, NULL);
+	drm_simple_encoder_init(dev, qxl_output->enc, DRM_MODE_ENCODER_VIRTUAL,
+				NULL);
 
 	/* we get HPD via client monitors config */
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 	encoder->possible_crtcs = 1 << num_output;
 	drm_connector_attach_encoder(&qxl_output->base,
 					  &qxl_output->enc);
-	drm_encoder_helper_add(encoder, &qxl_enc_helper_funcs);
 	drm_connector_helper_add(connector, &qxl_connector_helper_funcs);
 
 	drm_object_attach_property(&connector->base,
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
