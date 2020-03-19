Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A6918B93A
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 15:20:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3B0CF87E1D;
	Thu, 19 Mar 2020 14:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xskXYxiQldf; Thu, 19 Mar 2020 14:20:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5472E87E1F;
	Thu, 19 Mar 2020 14:20:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 263D2C07FF;
	Thu, 19 Mar 2020 14:20:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83BF9C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 14:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6CD0A86999
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 14:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQMs-IqMQqj0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 14:20:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E9CD48697D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 14:20:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E0EAA8052B;
 Thu, 19 Mar 2020 15:19:55 +0100 (CET)
Date: Thu, 19 Mar 2020 15:19:54 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/3] drm: drm_encoder_init() => drm_encoder_init_funcs()
Message-ID: <20200319141954.GA25036@ravnborg.org>
References: <20200313201744.19773-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313201744.19773-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=MgBhUfZuEF2DRmvJ2N4A:9 a=CjuIK1q_8ugA:10
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Jose Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-tegra@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
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

On Fri, Mar 13, 2020 at 09:17:41PM +0100, Sam Ravnborg wrote:
> Thomas Zimmermann had made a nice patch-set that introduced
> drm_simple_encoder_init() which is already present in drm-misc-next.
> 
> While looking at this it was suddenly obvious to me that
> this was functionalty that really should be included in drm_encoder.c
> The case where the core could handle the callback is pretty
> common and not part of the simple pipe line.
> 
> So after some dialog on dri-devel the conclusion was to go for
> a change like this:
> 
>     drm_encoder_init_funcs() for all users that specified a
>     drm_encoder_funcs to extend the functionality.
> 
>     drm_encoder_init() for all users that did not
>     need to extend the basic functionality with
>     drm_encoder_funcs.
> 
> A similar approach with a _funcs() prefix is used elsewhere in drm/
> 
> This required a rename of the existing users, and
> a follow-up patch that moves drm_simple_encoder_init()
> to drm_encoder.c
> 
> Patches 3 in this set demonstrate the use of drm_encoder_init().
> There are many more drivers that can be converted as Thomas
> has already demonstrated.
> 
> This is all based on work done by Thomas Zimmermann,
> I just wanted to implement my suggestion so
> we could select the best way forward.
> 
> Note: Daniel Vetter has hinted the approach implemented
> here smelled like middle-layer.
> IMO this is not so, it is just a way to handle cleanup
> for the simple cases.

We discussed this patch-set briefly on irc.
With the upcoming drmm_ changes and such this is bad timing..
And in the end this may be pointless code-chrunch.

Patch-set shelfed for now - may re-visit it later.

	Sam
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
