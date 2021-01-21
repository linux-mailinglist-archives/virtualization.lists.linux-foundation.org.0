Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 178AC2FF860
	for <lists.virtualization@lfdr.de>; Fri, 22 Jan 2021 00:04:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 64BAB86EA2;
	Thu, 21 Jan 2021 23:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3EOjFRD2ZF9; Thu, 21 Jan 2021 23:04:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 37CD386110;
	Thu, 21 Jan 2021 23:04:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB76BC013A;
	Thu, 21 Jan 2021 23:04:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58436C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 23:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3BDB986117
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 23:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rprDEMpmLAl
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 23:04:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CFD7386110
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 23:04:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2451050E;
 Fri, 22 Jan 2021 00:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1611270241;
 bh=T5NVDr46xcwrXL27T8VCCkqqocibkcaVgjkVgGiO8ZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y8cyClLX8kCaKU5wMc7DQBaagAtpgNWmTZ3+p386BcnpRP0PMgaNeQ9iuSFglc0Sw
 yxD8mSPCVAnyIXOWj5xsNFm7Htaoj3caG3DKUBN0MGRlEjztlQ48iKJbFja/DHFBKL
 ztANltlmDf+im+ixzdUmFqsBKC+TOLRQSVr+juDg=
Date: Fri, 22 Jan 2021 01:03:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 09/11] drm/atomic: Pass the full state to planes
 atomic disable and update
Message-ID: <YAoITqHbG1UeiAHV@pendragon.ideasonboard.com>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-9-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121163537.1466118-9-maxime@cerno.tech>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Roland Scheidegger <sroland@vmware.com>,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Dave Airlie <airlied@redhat.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 John Stultz <john.stultz@linaro.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Brian Starkey <brian.starkey@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>, linux-tegra@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Tomi Valkeinen <tomba@kernel.org>,
 Philippe Cornu <philippe.cornu@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
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

Hi Maxime,

Thank you for the patch.

On Thu, Jan 21, 2021 at 05:35:34PM +0100, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
> 
> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
> 
> Let's convert the remaining helpers to provide a consistent interface,
> this time with the planes atomic_update and atomic_disable.
> 
> The conversion was done using the coccinelle script below, built tested on
> all the drivers.
> 
> @@
> identifier plane, plane_state;
> symbol state;
> @@
> 
>  struct drm_plane_helper_funcs {
>  	...
> 	void (*atomic_update)(struct drm_plane *plane,
> -			      struct drm_plane_state *plane_state);
> +			      struct drm_atomic_state *state);
>  	...
>  }
> 
> @@
> identifier plane, plane_state;
> symbol state;
> @@
> 
>  struct drm_plane_helper_funcs {
> 	...
> 	void (*atomic_disable)(struct drm_plane *plane,
> -			       struct drm_plane_state *plane_state);
> +			       struct drm_atomic_state *state);
> 	...
>  }
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> (
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_update = func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_disable = func,
> 	...,
>  };
> )
> 
> @@
> struct drm_plane_helper_funcs *FUNCS;
> identifier f;
> identifier crtc_state;
> identifier plane, plane_state, state;
> expression e;
> @@
> 
>  f(struct drm_crtc_state *crtc_state)
>  {
>  	...
>  	struct drm_atomic_state *state = e;
>  	<+...
> (
> -	FUNCS->atomic_disable(plane, plane_state)
> +	FUNCS->atomic_disable(plane, state)
> |
> -	FUNCS->atomic_update(plane, plane_state)
> +	FUNCS->atomic_update(plane, state)
> )
>  	...+>
>  }
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane,
> -    struct drm_plane_state *state)
> +    struct drm_plane_state *old_plane_state)
>  {
> 	<...
> -	state
> +	old_plane_state
> 	...>
>  }
> 
> @ ignores_old_state @
> identifier plane_atomic_func.func;
> identifier plane, old_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
> 	... when != old_state
>  }
> 
> @ adds_old_state depends on plane_atomic_func && !ignores_old_state @
> identifier plane_atomic_func.func;
> identifier plane, plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *plane_state)
>  {
> +	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	...
>  }
> 
> @ depends on plane_atomic_func @
> identifier plane_atomic_func.func;
> identifier plane, plane_state;
> @@
> 
>  func(struct drm_plane *plane,
> -     struct drm_plane_state *plane_state
> +     struct drm_atomic_state *state
>      )
>  { ... }
> 
> @ include depends on adds_old_state @
> @@
> 
>  #include <drm/drm_atomic.h>
> 
> @ no_include depends on !include && adds_old_state @
> @@
> 
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state) {
>  	...
>  	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	<+...
> -	plane_state->state
> +	state
>  	...+>
>  }
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Reintroduce the old_plane_state check in zynqmp_disp_crtc_atomic_disable
> ---
>  drivers/gpu/drm/drm_atomic_helper.c               |  8 ++++----
>  drivers/gpu/drm/drm_simple_kms_helper.c           |  4 +++-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c                 |  6 ++++--
>  drivers/gpu/drm/omapdrm/omap_plane.c              |  4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c           |  4 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c             |  4 +++-
>  drivers/gpu/drm/tidss/tidss_plane.c               |  4 ++--
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c             |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c                | 15 ++++++++-------
>  include/drm/drm_modeset_helper_vtables.h          |  4 ++--

For these,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  58 files changed, 211 insertions(+), 123 deletions(-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
