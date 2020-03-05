Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D3117A9AF
	for <lists.virtualization@lfdr.de>; Thu,  5 Mar 2020 17:00:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D626987E38;
	Thu,  5 Mar 2020 16:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Js2hejMCTQoc; Thu,  5 Mar 2020 16:00:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C4BA087E2E;
	Thu,  5 Mar 2020 16:00:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0FC5C013E;
	Thu,  5 Mar 2020 16:00:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B203C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5475087DA6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3cGrM3JB6GLx
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5893A87D6A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B2D4B0BA;
 Thu,  5 Mar 2020 16:00:15 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, abrodkin@synopsys.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jingoohan1@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
 patrik.r.jakobsson@gmail.com, xinliang.liu@linaro.org,
 zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 linux@armlinux.org.uk, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
 matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 sebastian.reichel@collabora.com
Subject: [PATCH 15/22] drm/tegra: Use simple encoder
Date: Thu,  5 Mar 2020 16:59:43 +0100
Message-Id: <20200305155950.2705-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
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

The tegra driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/drm.h    |  2 --
 drivers/gpu/drm/tegra/dsi.c    | 10 +++-------
 drivers/gpu/drm/tegra/hdmi.c   |  9 +++------
 drivers/gpu/drm/tegra/output.c |  6 +-----
 drivers/gpu/drm/tegra/rgb.c    |  8 ++------
 drivers/gpu/drm/tegra/sor.c    |  8 ++------
 6 files changed, 11 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ed99b67deb29..804869799305 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -152,8 +152,6 @@ enum drm_connector_status
 tegra_output_connector_detect(struct drm_connector *connector, bool force);
 void tegra_output_connector_destroy(struct drm_connector *connector);
 
-void tegra_output_encoder_destroy(struct drm_encoder *encoder);
-
 /* from dpaux.c */
 struct drm_dp_aux *drm_dp_aux_find_by_of_node(struct device_node *np);
 enum drm_connector_status drm_dp_aux_detect(struct drm_dp_aux *aux);
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 88b9d64c77bf..76369b128e5d 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
 #include "drm.h"
@@ -824,10 +825,6 @@ static const struct drm_connector_helper_funcs tegra_dsi_connector_helper_funcs
 	.mode_valid = tegra_dsi_connector_mode_valid,
 };
 
-static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
-	.destroy = tegra_output_encoder_destroy,
-};
-
 static void tegra_dsi_unprepare(struct tegra_dsi *dsi)
 {
 	int err;
@@ -1058,9 +1055,8 @@ static int tegra_dsi_init(struct host1x_client *client)
 					 &tegra_dsi_connector_helper_funcs);
 		dsi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-		drm_encoder_init(drm, &dsi->output.encoder,
-				 &tegra_dsi_encoder_funcs,
-				 DRM_MODE_ENCODER_DSI, NULL);
+		drm_simple_encoder_init(drm, &dsi->output.encoder,
+					DRM_MODE_ENCODER_DSI);
 		drm_encoder_helper_add(&dsi->output.encoder,
 				       &tegra_dsi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6f117628f257..8ec72546f330 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "hda.h"
 #include "hdmi.h"
@@ -1136,10 +1137,6 @@ tegra_hdmi_connector_helper_funcs = {
 	.mode_valid = tegra_hdmi_connector_mode_valid,
 };
 
-static const struct drm_encoder_funcs tegra_hdmi_encoder_funcs = {
-	.destroy = tegra_output_encoder_destroy,
-};
-
 static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
@@ -1445,8 +1442,8 @@ static int tegra_hdmi_init(struct host1x_client *client)
 				 &tegra_hdmi_connector_helper_funcs);
 	hdmi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, &hdmi->output.encoder, &tegra_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_simple_encoder_init(drm, &hdmi->output.encoder,
+				DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(&hdmi->output.encoder,
 			       &tegra_hdmi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a264259b97a2..e36e5e7c2f69 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "drm.h"
 #include "dc.h"
@@ -79,11 +80,6 @@ void tegra_output_connector_destroy(struct drm_connector *connector)
 	drm_connector_cleanup(connector);
 }
 
-void tegra_output_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-
 static irqreturn_t hpd_irq(int irq, void *data)
 {
 	struct tegra_output *output = data;
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 4be4dfd4a68a..0562a7eb793f 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -8,6 +8,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "drm.h"
 #include "dc.h"
@@ -110,10 +111,6 @@ static const struct drm_connector_helper_funcs tegra_rgb_connector_helper_funcs
 	.mode_valid = tegra_rgb_connector_mode_valid,
 };
 
-static const struct drm_encoder_funcs tegra_rgb_encoder_funcs = {
-	.destroy = tegra_output_encoder_destroy,
-};
-
 static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
@@ -281,8 +278,7 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 				 &tegra_rgb_connector_helper_funcs);
 	output->connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 81226a4953c1..606cab4f37b2 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -23,6 +23,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_scdc_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
 #include "dp.h"
@@ -1805,10 +1806,6 @@ static const struct drm_connector_helper_funcs tegra_sor_connector_helper_funcs
 	.mode_valid = tegra_sor_connector_mode_valid,
 };
 
-static const struct drm_encoder_funcs tegra_sor_encoder_funcs = {
-	.destroy = tegra_output_encoder_destroy,
-};
-
 static int
 tegra_sor_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
@@ -3102,8 +3099,7 @@ static int tegra_sor_init(struct host1x_client *client)
 				 &tegra_sor_connector_helper_funcs);
 	sor->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, &sor->output.encoder, &tegra_sor_encoder_funcs,
-			 encoder, NULL);
+	drm_simple_encoder_init(drm, &sor->output.encoder, encoder);
 	drm_encoder_helper_add(&sor->output.encoder, helpers);
 
 	drm_connector_attach_encoder(&sor->output.connector,
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
