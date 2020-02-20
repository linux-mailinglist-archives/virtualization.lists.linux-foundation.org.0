Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A368F1666E0
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 20:10:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5AA0387D8E;
	Thu, 20 Feb 2020 19:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JC0X8rbQzlfK; Thu, 20 Feb 2020 19:10:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC0E287D96;
	Thu, 20 Feb 2020 19:10:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B09F2C1D8E;
	Thu, 20 Feb 2020 19:10:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9D49C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9917985F57
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sEBE1CrBCu37
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:10:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C3B8C85D30
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:10:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 585E580A88;
 Thu, 20 Feb 2020 20:10:48 +0100 (CET)
Date: Thu, 20 Feb 2020 20:10:47 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/4] drm/qxl: Use simple encoder
Message-ID: <20200220191047.GC20011@ravnborg.org>
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218084815.2137-5-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=wMNakxb3kf32nlJXWIsA:9 a=dtiwrycrY4r5epML:21 a=rIm5waDK4KQ2vjO9:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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

On Tue, Feb 18, 2020 at 09:48:15AM +0100, Thomas Zimmermann wrote:
> The qxl driver uses an empty implementation for its encoder. Replace
> the code with the generic simple encoder.
> 
> v2:
> 	* rebase onto new simple-encoder interface
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
I looked at best_encoder - but could not see we could do anything.
So from browsing the code:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index ab4f8dd00400..9c0e1add59fb 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "qxl_drv.h"
>  #include "qxl_object.h"
> @@ -1007,9 +1008,6 @@ static struct drm_encoder *qxl_best_encoder(struct drm_connector *connector)
>  	return &qxl_output->enc;
>  }
>  
> -static const struct drm_encoder_helper_funcs qxl_enc_helper_funcs = {
> -};
> -
>  static const struct drm_connector_helper_funcs qxl_connector_helper_funcs = {
>  	.get_modes = qxl_conn_get_modes,
>  	.mode_valid = qxl_conn_mode_valid,
> @@ -1059,15 +1057,6 @@ static const struct drm_connector_funcs qxl_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static void qxl_enc_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> -}
> -
> -static const struct drm_encoder_funcs qxl_enc_funcs = {
> -	.destroy = qxl_enc_destroy,
> -};
> -
>  static int qxl_mode_create_hotplug_mode_update_property(struct qxl_device *qdev)
>  {
>  	if (qdev->hotplug_mode_update_property)
> @@ -1098,15 +1087,14 @@ static int qdev_output_init(struct drm_device *dev, int num_output)
>  	drm_connector_init(dev, &qxl_output->base,
>  			   &qxl_connector_funcs, DRM_MODE_CONNECTOR_VIRTUAL);
>  
> -	drm_encoder_init(dev, &qxl_output->enc, &qxl_enc_funcs,
> -			 DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	drm_simple_encoder_init(dev, &qxl_output->enc,
> +				DRM_MODE_ENCODER_VIRTUAL);
>  
>  	/* we get HPD via client monitors config */
>  	connector->polled = DRM_CONNECTOR_POLL_HPD;
>  	encoder->possible_crtcs = 1 << num_output;
>  	drm_connector_attach_encoder(&qxl_output->base,
>  					  &qxl_output->enc);
> -	drm_encoder_helper_add(encoder, &qxl_enc_helper_funcs);
>  	drm_connector_helper_add(connector, &qxl_connector_helper_funcs);
>  
>  	drm_object_attach_property(&connector->base,
> -- 
> 2.25.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
