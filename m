Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF1D2F86E0
	for <lists.virtualization@lfdr.de>; Fri, 15 Jan 2021 21:42:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9F39D86DBE;
	Fri, 15 Jan 2021 20:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRR0RxN6MLCZ; Fri, 15 Jan 2021 20:42:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8ED2F86DBB;
	Fri, 15 Jan 2021 20:42:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 627DAC013A;
	Fri, 15 Jan 2021 20:42:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51B68C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 20:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3F35686C19
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 20:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-YMMsrzEwTT
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 20:42:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5B27586C06
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 20:42:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6768E58B;
 Fri, 15 Jan 2021 21:42:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610743351;
 bh=YM0UFEEnI3+Rh/NmmpBAyHwTyu8kF8Q6d7WaAvXYXmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ePDFtIg2t/f8Sh35gudyogfQHgJctjLWaOxjX9MALH284FX8TVNfetW4hT9f9t6Zs
 RkKSbZK9kxaFvE9rFVQDu2VmmTQ6+yQ/IEntNmQ4OGrAWr43Z8LNSl81omX5DWIITd
 FZb6j2pMbH2Kg7TVoFuIiyWnRsiWGYMJt85Nq3bg=
Date: Fri, 15 Jan 2021 22:42:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 05/10] drm: Use the state pointer directly in planes
 atomic_check
Message-ID: <YAH+JvNnlx73BA+Q@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-5-maxime@cerno.tech>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Rob Clark <robdclark@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 freedreno@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Harry Wentland <harry.wentland@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans de Goede <hdegoede@redhat.com>, John Stultz <john.stultz@linaro.org>,
 Stefan Agner <stefan@agner.ch>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Melissa Wen <melissa.srw@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, virtualization@lists.linux-foundation.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Vincent Abriou <vincent.abriou@st.com>, Edmund Dea <edmund.j.dea@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Brian Starkey <brian.starkey@arm.com>,
 Lucas Stach <l.stach@pengutronix.de>
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

On Fri, Jan 15, 2021 at 01:56:57PM +0100, Maxime Ripard wrote:
> Now that atomic_check takes the global atomic state as a parameter, we
> don't need to go through the pointer in the plane state.
> 
> This was done using the following coccinelle script:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> static struct drm_plane_helper_funcs helpers = {
> 	...,
> 	.atomic_check = func,
> 	...,
> };
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier plane_state;
> @@
> 
>   func(struct drm_plane *plane, struct drm_atomic_state *state) {
>   ...
> - struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>   <... when != plane_state
> - plane_state->state
> + state
>   ...>
>  }
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier plane_state;
> @@
> 
>   func(struct drm_plane *plane, struct drm_atomic_state *state) {
>   ...
>   struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>   <...
> - plane_state->state
> + state
>   ...>
>  }
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[snip]

>  drivers/gpu/drm/omapdrm/omap_plane.c              | 2 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c                | 2 +-

For these, with the small issue below addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[snip]

> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index b0a3ba528718..d749acc78c85 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1152,7 +1152,7 @@ zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
>  	if (!new_plane_state->crtc)
>  		return 0;
>  
> -	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
> +	crtc_state = drm_atomic_get_crtc_state(state,
>  					       new_plane_state->crtc);

This now holds on a single line.

>  	if (IS_ERR(crtc_state))
>  		return PTR_ERR(crtc_state);

[snip]

-- 
Regards,

Laurent Pinchart
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
