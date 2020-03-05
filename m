Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8476817A9C9
	for <lists.virtualization@lfdr.de>; Thu,  5 Mar 2020 17:00:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32BC5861FF;
	Thu,  5 Mar 2020 16:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mN1lDvbbqgx; Thu,  5 Mar 2020 16:00:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2829A8621E;
	Thu,  5 Mar 2020 16:00:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 030FCC013E;
	Thu,  5 Mar 2020 16:00:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26EA3C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0D55A87E56
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PtRz5Rd5iv7i
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2863587E13
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:00:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 77B4DB0C6;
 Thu,  5 Mar 2020 16:00:25 +0000 (UTC)
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
Subject: [PATCH 22/22] drm/zte: Use simple encoder
Date: Thu,  5 Mar 2020 16:59:50 +0100
Message-Id: <20200305155950.2705-23-tzimmermann@suse.de>
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

The zte driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/zte/zx_hdmi.c  | 8 ++------
 drivers/gpu/drm/zte/zx_tvenc.c | 8 ++------
 drivers/gpu/drm/zte/zx_vga.c   | 8 ++------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_hdmi.c b/drivers/gpu/drm/zte/zx_hdmi.c
index b98a1420dcd3..76a16d997a23 100644
--- a/drivers/gpu/drm/zte/zx_hdmi.c
+++ b/drivers/gpu/drm/zte/zx_hdmi.c
@@ -20,6 +20,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_print.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include <sound/hdmi-codec.h>
 
@@ -254,10 +255,6 @@ static const struct drm_encoder_helper_funcs zx_hdmi_encoder_helper_funcs = {
 	.mode_set = zx_hdmi_encoder_mode_set,
 };
 
-static const struct drm_encoder_funcs zx_hdmi_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int zx_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct zx_hdmi *hdmi = to_zx_hdmi(connector);
@@ -313,8 +310,7 @@ static int zx_hdmi_register(struct drm_device *drm, struct zx_hdmi *hdmi)
 
 	encoder->possible_crtcs = VOU_CRTC_MASK;
 
-	drm_encoder_init(drm, encoder, &zx_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(encoder, &zx_hdmi_encoder_helper_funcs);
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
diff --git a/drivers/gpu/drm/zte/zx_tvenc.c b/drivers/gpu/drm/zte/zx_tvenc.c
index c598b7daf1f1..d8a89ba383bc 100644
--- a/drivers/gpu/drm/zte/zx_tvenc.c
+++ b/drivers/gpu/drm/zte/zx_tvenc.c
@@ -14,6 +14,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "zx_drm_drv.h"
 #include "zx_tvenc_regs.h"
@@ -218,10 +219,6 @@ static const struct drm_encoder_helper_funcs zx_tvenc_encoder_helper_funcs = {
 	.mode_set = zx_tvenc_encoder_mode_set,
 };
 
-static const struct drm_encoder_funcs zx_tvenc_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int zx_tvenc_connector_get_modes(struct drm_connector *connector)
 {
 	struct zx_tvenc *tvenc = to_zx_tvenc(connector);
@@ -285,8 +282,7 @@ static int zx_tvenc_register(struct drm_device *drm, struct zx_tvenc *tvenc)
 	 */
 	encoder->possible_crtcs = BIT(1);
 
-	drm_encoder_init(drm, encoder, &zx_tvenc_encoder_funcs,
-			 DRM_MODE_ENCODER_TVDAC, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TVDAC);
 	drm_encoder_helper_add(encoder, &zx_tvenc_encoder_helper_funcs);
 
 	connector->interlace_allowed = true;
diff --git a/drivers/gpu/drm/zte/zx_vga.c b/drivers/gpu/drm/zte/zx_vga.c
index c4fa3bbaba78..a7ed7f5ca837 100644
--- a/drivers/gpu/drm/zte/zx_vga.c
+++ b/drivers/gpu/drm/zte/zx_vga.c
@@ -14,6 +14,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "zx_drm_drv.h"
 #include "zx_vga_regs.h"
@@ -72,10 +73,6 @@ static const struct drm_encoder_helper_funcs zx_vga_encoder_helper_funcs = {
 	.disable = zx_vga_encoder_disable,
 };
 
-static const struct drm_encoder_funcs zx_vga_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int zx_vga_connector_get_modes(struct drm_connector *connector)
 {
 	struct zx_vga *vga = to_zx_vga(connector);
@@ -154,8 +151,7 @@ static int zx_vga_register(struct drm_device *drm, struct zx_vga *vga)
 
 	encoder->possible_crtcs = VOU_CRTC_MASK;
 
-	ret = drm_encoder_init(drm, encoder, &zx_vga_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DAC);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to init encoder: %d\n", ret);
 		return ret;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
