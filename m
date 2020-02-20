Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7971666DD
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 20:09:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1CC0E85D30;
	Thu, 20 Feb 2020 19:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cL-LaxZQ8rju; Thu, 20 Feb 2020 19:09:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 75FE485F18;
	Thu, 20 Feb 2020 19:09:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BAFDC013E;
	Thu, 20 Feb 2020 19:09:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7116FC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5A98F87D92
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhvFcRt6kzxP
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:09:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CA6A687D8E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:09:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F378580A7D;
 Thu, 20 Feb 2020 20:09:44 +0100 (CET)
Date: Thu, 20 Feb 2020 20:09:43 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/4] drm/ast: Use simple encoder
Message-ID: <20200220190943.GB20011@ravnborg.org>
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218084815.2137-3-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=MOjwyByp_6yglrnL3V8A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, noralf@tronnes.org, daniel@ffwll.ch,
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org,
 emil.velikov@collabora.com
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

Hi Thomas.

On Tue, Feb 18, 2020 at 09:48:13AM +0100, Thomas Zimmermann wrote:
> The ast driver uses an empty implementation for its encoder. Replace
> the code with the generic simple encoder.
> 
> v2:
> 	* rebase onto new simple-encoder interface
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
From browsign the code - looks good:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> ---
>  drivers/gpu/drm/ast/ast_drv.h  |  6 +-----
>  drivers/gpu/drm/ast/ast_mode.c | 25 ++++++++-----------------
>  2 files changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index f5d8780776ae..656d591b154b 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -121,6 +121,7 @@ struct ast_private {
>  		unsigned int next_index;
>  	} cursor;
>  
> +	struct drm_encoder encoder;
>  	struct drm_plane primary_plane;
>  	struct drm_plane cursor_plane;
>  
> @@ -238,13 +239,8 @@ struct ast_crtc {
>  	u8 offset_x, offset_y;
>  };
>  
> -struct ast_encoder {
> -	struct drm_encoder base;
> -};
> -
>  #define to_ast_crtc(x) container_of(x, struct ast_crtc, base)
>  #define to_ast_connector(x) container_of(x, struct ast_connector, base)
> -#define to_ast_encoder(x) container_of(x, struct ast_encoder, base)
>  
>  struct ast_vbios_stdtable {
>  	u8 misc;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 562ea6d9df13..7a9f20a2fd30 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -40,6 +40,7 @@
>  #include <drm/drm_gem_vram_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "ast_drv.h"
>  #include "ast_tables.h"
> @@ -968,28 +969,18 @@ static int ast_crtc_init(struct drm_device *dev)
>   * Encoder
>   */
>  
> -static void ast_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> -	kfree(encoder);
> -}
> -
> -static const struct drm_encoder_funcs ast_enc_funcs = {
> -	.destroy = ast_encoder_destroy,
> -};
> -
>  static int ast_encoder_init(struct drm_device *dev)
>  {
> -	struct ast_encoder *ast_encoder;
> +	struct ast_private *ast = dev->dev_private;
> +	struct drm_encoder *encoder = &ast->encoder;
> +	int ret;
>  
> -	ast_encoder = kzalloc(sizeof(struct ast_encoder), GFP_KERNEL);
> -	if (!ast_encoder)
> -		return -ENOMEM;
> +	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
> +	if (ret)
> +		return ret;
>  
> -	drm_encoder_init(dev, &ast_encoder->base, &ast_enc_funcs,
> -			 DRM_MODE_ENCODER_DAC, NULL);
> +	encoder->possible_crtcs = 1;
>  
> -	ast_encoder->base.possible_crtcs = 1;
>  	return 0;
>  }
>  
> -- 
> 2.25.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
