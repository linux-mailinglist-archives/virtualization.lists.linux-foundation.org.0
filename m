Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E55017EEAF
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 03:37:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1056987B07;
	Tue, 10 Mar 2020 02:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RT7eoMt18gKm; Tue, 10 Mar 2020 02:37:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 571E187AFF;
	Tue, 10 Mar 2020 02:37:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18327C0177;
	Tue, 10 Mar 2020 02:37:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E53F9C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 02:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E063E88500
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 02:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOONiLlwJx2D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 02:37:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8DB16884FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 02:37:31 +0000 (UTC)
X-UUID: f7731083a6bb467bbae773dcdd098d58-20200310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hLjlW65hQN7C6KTZ0z09rF1NUbZS3I5Rt9C9E6AC1dM=; 
 b=G4KZOYec4ghBtwfsRhvrArSWXtZAwYe4JjBpGHXb9+7rCrAdo9glAWfc+rs29ZiVD/VFgnBHP5+ZyGA5D5YH/qzIflNEDnMJiZqom53+YHdzLinubIkWdcK9EtM/HqZHjASUg19eGgFkpWhXt+M8gLjkwl1HyaMN2aF1avXJQpA=;
X-UUID: f7731083a6bb467bbae773dcdd098d58-20200310
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2051755948; Tue, 10 Mar 2020 10:37:26 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 10:36:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Mar 2020 10:36:31 +0800
Message-ID: <1583807844.30143.0.camel@mtksdaap41>
Subject: Re: [PATCH 10/22] drm/mediatek: Use simple encoder
From: CK Hu <ck.hu@mediatek.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 10 Mar 2020 10:37:24 +0800
In-Reply-To: <20200305155950.2705-11-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-11-tzimmermann@suse.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, heiko@sntech.de,
 airlied@linux.ie, stefan@agner.ch, linux@armlinux.org.uk, paul@crapouillou.net,
 eric@anholt.net, thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 sebastian.reichel@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, hjc@rock-chips.com, festevam@gmail.com,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com, xinliang.liu@linaro.org,
 ludovic.desroches@microchip.com, kgene@kernel.org, linux-imx@nxp.com,
 linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, p.zabel@pengutronix.de, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, john.stultz@linaro.org,
 jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, rodrigosiqueiramelo@gmail.com, tomi.valkeinen@ti.com,
 bbrezillon@kernel.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, daniel@ffwll.ch,
 zourongrong@gmail.com, linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
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

Hi, Thomas:

On Thu, 2020-03-05 at 16:59 +0100, Thomas Zimmermann wrote:
> The mediatak driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.
> 

Acked-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++-----------
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 14 +++-----------
>  2 files changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 14fbe1c09ce9..9c90c58e5acd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "mtk_dpi_regs.h"
>  #include "mtk_drm_ddp_comp.h"
> @@ -509,15 +510,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	return 0;
>  }
>  
> -static void mtk_dpi_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> -}
> -
> -static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
> -	.destroy = mtk_dpi_encoder_destroy,
> -};
> -
>  static bool mtk_dpi_encoder_mode_fixup(struct drm_encoder *encoder,
>  				       const struct drm_display_mode *mode,
>  				       struct drm_display_mode *adjusted_mode)
> @@ -596,8 +588,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>  		return ret;
>  	}
>  
> -	ret = drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, NULL);
> +	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
> +				      DRM_MODE_ENCODER_TMDS);
>  	if (ret) {
>  		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>  		goto err_unregister;
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 0ede69830a9d..a9a25087112f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -22,6 +22,7 @@
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "mtk_drm_ddp_comp.h"
>  
> @@ -787,15 +788,6 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
>  	dsi->enabled = false;
>  }
>  
> -static void mtk_dsi_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> -}
> -
> -static const struct drm_encoder_funcs mtk_dsi_encoder_funcs = {
> -	.destroy = mtk_dsi_encoder_destroy,
> -};
> -
>  static bool mtk_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
>  				       const struct drm_display_mode *mode,
>  				       struct drm_display_mode *adjusted_mode)
> @@ -888,8 +880,8 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
>  {
>  	int ret;
>  
> -	ret = drm_encoder_init(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
> -			       DRM_MODE_ENCODER_DSI, NULL);
> +	ret = drm_simple_encoder_init(drm, &dsi->encoder,
> +				      DRM_MODE_ENCODER_DSI);
>  	if (ret) {
>  		DRM_ERROR("Failed to encoder init to drm\n");
>  		return ret;

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
