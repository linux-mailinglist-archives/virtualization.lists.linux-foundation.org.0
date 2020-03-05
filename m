Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DB50C17A9A0
	for <lists.virtualization@lfdr.de>; Thu,  5 Mar 2020 17:00:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8B23987E38;
	Thu,  5 Mar 2020 16:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gN4a0sykAv3U; Thu,  5 Mar 2020 16:00:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39A9187E43;
	Thu,  5 Mar 2020 16:00:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 220E2C013E;
	Thu,  5 Mar 2020 16:00:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB3C8C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B7D9E87DDB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id veBgzhiyeIyk
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AE06587D9F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0B720AC91;
 Thu,  5 Mar 2020 16:00:05 +0000 (UTC)
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
Subject: [PATCH 08/22] drm/imx: Use simple encoder
Date: Thu,  5 Mar 2020 16:59:36 +0100
Message-Id: <20200305155950.2705-9-tzimmermann@suse.de>
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

The imx driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/imx/dw_hdmi-imx.c      | 8 ++------
 drivers/gpu/drm/imx/imx-drm-core.c     | 6 ------
 drivers/gpu/drm/imx/imx-drm.h          | 1 -
 drivers/gpu/drm/imx/imx-ldb.c          | 8 ++------
 drivers/gpu/drm/imx/imx-tve.c          | 8 ++------
 drivers/gpu/drm/imx/parallel-display.c | 8 ++------
 6 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index f22cfbf9353e..ba4ca17fd4d8 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -18,6 +18,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "imx-drm.h"
 
@@ -143,10 +144,6 @@ static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs =
 	.atomic_check = dw_hdmi_imx_atomic_check,
 };
 
-static const struct drm_encoder_funcs dw_hdmi_imx_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static enum drm_mode_status
 imx6q_hdmi_mode_valid(struct drm_connector *con,
 		      const struct drm_display_mode *mode)
@@ -236,8 +233,7 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 		return ret;
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_imx_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &dw_hdmi_imx_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 
 	platform_set_drvdata(pdev, hdmi);
 
diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index da87c70e413b..9979547ca883 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -42,12 +42,6 @@ void imx_drm_connector_destroy(struct drm_connector *connector)
 }
 EXPORT_SYMBOL_GPL(imx_drm_connector_destroy);
 
-void imx_drm_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-EXPORT_SYMBOL_GPL(imx_drm_encoder_destroy);
-
 static int imx_drm_atomic_check(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/imx/imx-drm.h b/drivers/gpu/drm/imx/imx-drm.h
index ab9c6f706eb3..c3e1a3f14d30 100644
--- a/drivers/gpu/drm/imx/imx-drm.h
+++ b/drivers/gpu/drm/imx/imx-drm.h
@@ -38,7 +38,6 @@ int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np);
 
 void imx_drm_connector_destroy(struct drm_connector *connector);
-void imx_drm_encoder_destroy(struct drm_encoder *encoder);
 
 int ipu_planes_assign_pre(struct drm_device *dev,
 			  struct drm_atomic_state *state);
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 4da22a94790c..66ea68e8da87 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -26,6 +26,7 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "imx-drm.h"
 
@@ -393,10 +394,6 @@ static const struct drm_connector_helper_funcs imx_ldb_connector_helper_funcs =
 	.best_encoder = imx_ldb_connector_best_encoder,
 };
 
-static const struct drm_encoder_funcs imx_ldb_encoder_funcs = {
-	.destroy = imx_drm_encoder_destroy,
-};
-
 static const struct drm_encoder_helper_funcs imx_ldb_encoder_helper_funcs = {
 	.atomic_mode_set = imx_ldb_encoder_atomic_mode_set,
 	.enable = imx_ldb_encoder_enable,
@@ -441,8 +438,7 @@ static int imx_ldb_register(struct drm_device *drm,
 	}
 
 	drm_encoder_helper_add(encoder, &imx_ldb_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &imx_ldb_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_LVDS);
 
 	if (imx_ldb_ch->bridge) {
 		ret = drm_bridge_attach(&imx_ldb_ch->encoder,
diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 5bbfaa2cd0f4..ee63782c77e9 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -21,6 +21,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "imx-drm.h"
 
@@ -348,10 +349,6 @@ static const struct drm_connector_helper_funcs imx_tve_connector_helper_funcs =
 	.mode_valid = imx_tve_connector_mode_valid,
 };
 
-static const struct drm_encoder_funcs imx_tve_encoder_funcs = {
-	.destroy = imx_drm_encoder_destroy,
-};
-
 static const struct drm_encoder_helper_funcs imx_tve_encoder_helper_funcs = {
 	.mode_set = imx_tve_encoder_mode_set,
 	.enable = imx_tve_encoder_enable,
@@ -479,8 +476,7 @@ static int imx_tve_register(struct drm_device *drm, struct imx_tve *tve)
 		return ret;
 
 	drm_encoder_helper_add(&tve->encoder, &imx_tve_encoder_helper_funcs);
-	drm_encoder_init(drm, &tve->encoder, &imx_tve_encoder_funcs,
-			 encoder_type, NULL);
+	drm_simple_encoder_init(drm, &tve->encoder, encoder_type);
 
 	drm_connector_helper_add(&tve->connector,
 			&imx_tve_connector_helper_funcs);
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 08fafa4bf8c2..ac916c84a631 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -18,6 +18,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "imx-drm.h"
 
@@ -256,10 +257,6 @@ static const struct drm_connector_helper_funcs imx_pd_connector_helper_funcs = {
 	.best_encoder = imx_pd_connector_best_encoder,
 };
 
-static const struct drm_encoder_funcs imx_pd_encoder_funcs = {
-	.destroy = imx_drm_encoder_destroy,
-};
-
 static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
 	.enable = imx_pd_bridge_enable,
 	.disable = imx_pd_bridge_disable,
@@ -288,8 +285,7 @@ static int imx_pd_register(struct drm_device *drm,
 	 */
 	imxpd->connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, encoder, &imx_pd_encoder_funcs,
-			 DRM_MODE_ENCODER_NONE, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
 
 	imxpd->bridge.funcs = &imx_pd_bridge_funcs;
 	drm_bridge_attach(encoder, &imxpd->bridge, NULL, 0);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
