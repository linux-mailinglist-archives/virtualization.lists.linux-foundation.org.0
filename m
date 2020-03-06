Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6DA17BADC
	for <lists.virtualization@lfdr.de>; Fri,  6 Mar 2020 11:57:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E673D864D0;
	Fri,  6 Mar 2020 10:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qshG2hyMCY4Y; Fri,  6 Mar 2020 10:57:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA413864BD;
	Fri,  6 Mar 2020 10:57:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BABF2C013E;
	Fri,  6 Mar 2020 10:57:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65AD4C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 10:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5200988162
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 10:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r3cN1M5i27Tf
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 10:57:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 283B08815F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 10:57:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a132so1886170wme.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 06 Mar 2020 02:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7rrE7Mh/VC4v8EhKmWswWSWB2baVjxpmAL/nTxqthaY=;
 b=d2qudtTvQazENZdB0E1Ugs4TiEWdjEh+sF5HkI/qMuAz1lhVxP+7jJ7IMt5HaphPzP
 5DxLj/MhLkdg2wPief+M95Xgo8kLO0XxU7PsK0Ih/1XNOcaBx0JTPt14bGOTe9dw2/L/
 v80v+GtgQ0pM22uXV5txDnK85ki9Af31ZRI+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7rrE7Mh/VC4v8EhKmWswWSWB2baVjxpmAL/nTxqthaY=;
 b=nUgu6pN5MPuiB0T0j9HU/TzXzZkYFrxT3OJLhEN9rLc+21eHSxO+SHCCieuXWJhg2r
 lKioed7+dgA1A+zXolaBV4ZrTDFBu7E+j7e0ZASaqn37Q5c7q8+HQoqwHCDERH1TVF2/
 2cMRJigIzajySsUWbQ31FKXGJmNSP0OoA2cGyyRXoMLeJpjm0hTNJzSlrn/BeBFOA8EM
 rOErsLwRa3Jo5gGCvKjGGOcWytVZqvOjCogNhW7oR/V5PEkkX5VB+5iUfIkVCWGxP22J
 YZek7pS1NHLML6Ej9s7gKlouLrdTscdIGWj4zUvcZ+O5sNl//jOsH7Sbe+HFKthnX5S9
 VKmQ==
X-Gm-Message-State: ANhLgQ27Smk6XK9Im3pLYg+pDLE+rYJK0XdfvTQs2Gqe8fXD+6nDiLFf
 fWCmBjdQUQ2K+XToHJ+yOAbhMQ==
X-Google-Smtp-Source: ADFU+vu8MQamXRdd0QBPum9kh+cSyHKPSAUhm+lD5hy3LLs4xarlv6b6xFmutidwsLBLwmFf5dsvQw==
X-Received: by 2002:a1c:bd45:: with SMTP id n66mr3312185wmf.167.1583492223205; 
 Fri, 06 Mar 2020 02:57:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e7sm28718865wrt.70.2020.03.06.02.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:57:01 -0800 (PST)
Date: Fri, 6 Mar 2020 11:56:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/22] drm: Convert drivers to drm_simple_encoder_init()
Message-ID: <20200306105659.GY2363188@phenom.ffwll.local>
References: <20200305155950.2705-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, heiko@sntech.de,
 airlied@linux.ie, stefan@agner.ch, linux@armlinux.org.uk, paul@crapouillou.net,
 eric@anholt.net, thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 sebastian.reichel@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, hjc@rock-chips.com, festevam@gmail.com,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com, xinliang.liu@linaro.org,
 ludovic.desroches@microchip.com, kgene@kernel.org, linux-imx@nxp.com,
 ck.hu@mediatek.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 p.zabel@pengutronix.de, puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 alison.wang@nxp.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, john.stultz@linaro.org, jsarha@ti.com,
 matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
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

On Thu, Mar 05, 2020 at 04:59:28PM +0100, Thomas Zimmermann wrote:
> A call to drm_simple_encoder_init() initializes an encoder without
> further functionality. It only provides the destroy callback to
> cleanup the encoder's state. Only few drivers implement more
> sophisticated encoders than that. Most drivers implement such a
> simple encoder and can use drm_simple_encoder_init() instead.
> 
> The patchset converts drivers where the encoder's instance is
> embedded in a larger data structure. The driver releases the
> memory during cleanup. Each patch replaces drm_encoder_init() with
> drm_simple_encoder_init() and removes the (now unused) driver's
> encoder functions.
> 
> While the patchset is fairly large, the indiviual patches are self-
> contained and can be merged independently from each other. The
> simple-encoder functionality is currently in drm-misc-next, where
> these patches could go as well.
> 
> Future directions: There's another common case where the driver
> calls kzalloc() plus drm_encoder_init(). Such drivers are not
> handled by this patchset. The plan here is to use a simple encoder
> with either managed memory allocation (once it's merged), or embed
> the encoder in a larger data structure and drop kzalloc() entirely.
> 
> The patchset has been compile-tested on x86-64, aarch64 and arm.

So from a cursory look all these drivers get it wrong and devm_kzalloc
their encoders. But I guess simplifying stuff like you do here will at
least give us a nice list of things to look at once we get to the
drmm_simple_encoder_init version of all this. On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Thomas Zimmermann (22):
>   drm/arc: Use simple encoder
>   drm/atmel-hlcdc: Use simple encoder
>   drm/exynos: Use simple encoder
>   drm/fsl-dcu: Use simple encoder
>   drm/gma500: Use simple encoder
>   drm/hisilicon/kirin: Use simple encoder
>   drm/i2c/tda998x: Use simple encoder
>   drm/imx: Use simple encoder
>   drm/ingenic: Use simple encoder
>   drm/mediatek: Use simple encoder
>   drm/rcar-du: Use simple encoder
>   drm/rockchip: Use simple encoder
>   drm/shmobile: Use simple encoder
>   drm/sun4i: Use simple encoder
>   drm/tegra: Use simple encoder
>   drm/tidss: Use simple encoder
>   drm/tilcdc: Use simple encoder
>   drm/vc4: Use simple encoder
>   drm/virtgpu: Use simple encoder
>   drm/vkms: Use simple encoder
>   drm/writeback: Use simple encoder
>   drm/zte: Use simple encoder
> 
>  drivers/gpu/drm/arc/arcpgu_hdmi.c              | 10 +++-------
>  drivers/gpu/drm/arc/arcpgu_sim.c               |  8 ++------
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   | 12 ++++--------
>  drivers/gpu/drm/drm_writeback.c                | 10 +++-------
>  drivers/gpu/drm/exynos/exynos_dp.c             |  8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c        |  8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c        |  8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c       |  8 ++------
>  drivers/gpu/drm/exynos/exynos_hdmi.c           |  8 ++------
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c      | 14 +++-----------
>  drivers/gpu/drm/gma500/cdv_intel_crt.c         | 14 +++-----------
>  drivers/gpu/drm/gma500/cdv_intel_dp.c          | 16 +++-------------
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c        |  4 ++--
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c        | 17 +++--------------
>  drivers/gpu/drm/gma500/mdfld_dsi_dpi.c         |  7 +++----
>  drivers/gpu/drm/gma500/mdfld_output.h          |  1 -
>  drivers/gpu/drm/gma500/mdfld_tmd_vid.c         |  6 ------
>  drivers/gpu/drm/gma500/mdfld_tpo_vid.c         |  6 ------
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c         | 14 ++------------
>  drivers/gpu/drm/gma500/oaktrail_lvds.c         |  5 +++--
>  drivers/gpu/drm/gma500/psb_intel_drv.h         |  1 -
>  drivers/gpu/drm/gma500/psb_intel_lvds.c        | 18 +++---------------
>  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c     |  5 -----
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c   |  8 ++------
>  drivers/gpu/drm/i2c/tda998x_drv.c              | 14 +++-----------
>  drivers/gpu/drm/imx/dw_hdmi-imx.c              |  8 ++------
>  drivers/gpu/drm/imx/imx-drm-core.c             |  6 ------
>  drivers/gpu/drm/imx/imx-drm.h                  |  1 -
>  drivers/gpu/drm/imx/imx-ldb.c                  |  8 ++------
>  drivers/gpu/drm/imx/imx-tve.c                  |  8 ++------
>  drivers/gpu/drm/imx/parallel-display.c         |  8 ++------
>  drivers/gpu/drm/ingenic/ingenic-drm.c          |  9 +++------
>  drivers/gpu/drm/mediatek/mtk_dpi.c             | 14 +++-----------
>  drivers/gpu/drm/mediatek/mtk_dsi.c             | 14 +++-----------
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c      | 14 +++-----------
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c    |  9 +++------
>  drivers/gpu/drm/rockchip/cdn-dp-core.c         |  9 +++------
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  8 ++------
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    |  8 ++------
>  drivers/gpu/drm/rockchip/inno_hdmi.c           |  8 ++------
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c         |  8 ++------
>  drivers/gpu/drm/rockchip/rockchip_lvds.c       | 10 +++-------
>  drivers/gpu/drm/rockchip/rockchip_rgb.c        |  8 ++------
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c      | 14 +++-----------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c         | 12 +++---------
>  drivers/gpu/drm/sun4i/sun4i_lvds.c             | 12 +++---------
>  drivers/gpu/drm/sun4i/sun4i_rgb.c              | 17 +++--------------
>  drivers/gpu/drm/sun4i/sun4i_tv.c               | 17 +++--------------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c         | 12 +++---------
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c          |  8 ++------
>  drivers/gpu/drm/tegra/drm.h                    |  2 --
>  drivers/gpu/drm/tegra/dsi.c                    | 10 +++-------
>  drivers/gpu/drm/tegra/hdmi.c                   |  9 +++------
>  drivers/gpu/drm/tegra/output.c                 |  6 +-----
>  drivers/gpu/drm/tegra/rgb.c                    |  8 ++------
>  drivers/gpu/drm/tegra/sor.c                    |  8 ++------
>  drivers/gpu/drm/tidss/tidss_encoder.c          | 10 +++-------
>  drivers/gpu/drm/tilcdc/tilcdc_external.c       | 10 +++-------
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c          |  8 ++------
>  drivers/gpu/drm/vc4/vc4_dpi.c                  |  8 ++------
>  drivers/gpu/drm/vc4/vc4_dsi.c                  | 15 +++------------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                 | 17 ++++-------------
>  drivers/gpu/drm/vc4/vc4_vec.c                  |  8 ++------
>  drivers/gpu/drm/virtio/virtgpu_display.c       |  8 ++------
>  drivers/gpu/drm/vkms/vkms_output.c             |  8 ++------
>  drivers/gpu/drm/zte/zx_hdmi.c                  |  8 ++------
>  drivers/gpu/drm/zte/zx_tvenc.c                 |  8 ++------
>  drivers/gpu/drm/zte/zx_vga.c                   |  8 ++------
>  68 files changed, 151 insertions(+), 488 deletions(-)
> 
> --
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
