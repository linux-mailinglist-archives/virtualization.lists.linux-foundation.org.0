Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B72F17299D
	for <lists.virtualization@lfdr.de>; Thu, 27 Feb 2020 21:42:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2CD9287988;
	Thu, 27 Feb 2020 20:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3upEuCOAJcLN; Thu, 27 Feb 2020 20:42:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E464986819;
	Thu, 27 Feb 2020 20:42:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4A59C0177;
	Thu, 27 Feb 2020 20:42:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 238ABC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0D1D122DB0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SJfwbLh0Bkk
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:42:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by silver.osuosl.org (Postfix) with ESMTPS id 26C1C20408
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:42:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5BF3D2002C;
 Thu, 27 Feb 2020 21:42:47 +0100 (CET)
Date: Thu, 27 Feb 2020 21:42:46 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/4] drm/mgag200: Use simple encoder
Message-ID: <20200227204245.GE27592@ravnborg.org>
References: <20200225131055.27550-1-tzimmermann@suse.de>
 <20200225131055.27550-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225131055.27550-4-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=Xckx4fwRKHFAelP2trkA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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

On Tue, Feb 25, 2020 at 02:10:54PM +0100, Thomas Zimmermann wrote:
> The mgag200 driver uses an empty implementation for its encoder. Replace
> the code with the generic simple encoder.
> 
> v3:
> 	* init pre-allocated encoder with drm_simple_encoder_init()
> v2:
> 	* rebase onto new simple-encoder interface
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  9 +--
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 85 +++-----------------------
>  2 files changed, 12 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index aa32aad222c2..9691252d6233 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -95,7 +95,6 @@
>  #define MATROX_DPMS_CLEARED (-1)
>  
>  #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
> -#define to_mga_encoder(x) container_of(x, struct mga_encoder, base)
>  #define to_mga_connector(x) container_of(x, struct mga_connector, base)
>  
>  struct mga_crtc {
> @@ -110,12 +109,6 @@ struct mga_mode_info {
>  	struct mga_crtc *crtc;
>  };
>  
> -struct mga_encoder {
> -	struct drm_encoder base;
> -	int last_dpms;
> -};
> -
> -
>  struct mga_i2c_chan {
>  	struct i2c_adapter adapter;
>  	struct drm_device *dev;
> @@ -185,6 +178,8 @@ struct mga_device {
>  
>  	/* SE model number stored in reg 0x1e24 */
>  	u32 unique_rev_id;
> +
> +	struct drm_encoder encoder;
>  };
>  
>  static inline enum mga_type
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 62a8e9ccb16d..efc9eaa6a4d4 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "mgag200_drv.h"
>  
> @@ -1449,76 +1450,6 @@ static void mga_crtc_init(struct mga_device *mdev)
>  	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
>  }
>  
> -/*
> - * The encoder comes after the CRTC in the output pipeline, but before
> - * the connector. It's responsible for ensuring that the digital
> - * stream is appropriately converted into the output format. Setup is
> - * very simple in this case - all we have to do is inform qemu of the
> - * colour depth in order to ensure that it displays appropriately
> - */
> -
> -/*
> - * These functions are analagous to those in the CRTC code, but are intended
> - * to handle any encoder-specific limitations
> - */
> -static void mga_encoder_mode_set(struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> -{
> -
> -}
> -
> -static void mga_encoder_dpms(struct drm_encoder *encoder, int state)
> -{
> -	return;
> -}
> -
> -static void mga_encoder_prepare(struct drm_encoder *encoder)
> -{
> -}
> -
> -static void mga_encoder_commit(struct drm_encoder *encoder)
> -{
> -}
> -
> -static void mga_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	struct mga_encoder *mga_encoder = to_mga_encoder(encoder);
> -	drm_encoder_cleanup(encoder);
> -	kfree(mga_encoder);
> -}
> -
> -static const struct drm_encoder_helper_funcs mga_encoder_helper_funcs = {
> -	.dpms = mga_encoder_dpms,
> -	.mode_set = mga_encoder_mode_set,
> -	.prepare = mga_encoder_prepare,
> -	.commit = mga_encoder_commit,
> -};
> -
> -static const struct drm_encoder_funcs mga_encoder_encoder_funcs = {
> -	.destroy = mga_encoder_destroy,
> -};
> -
> -static struct drm_encoder *mga_encoder_init(struct drm_device *dev)
> -{
> -	struct drm_encoder *encoder;
> -	struct mga_encoder *mga_encoder;
> -
> -	mga_encoder = kzalloc(sizeof(struct mga_encoder), GFP_KERNEL);
> -	if (!mga_encoder)
> -		return NULL;
> -
> -	encoder = &mga_encoder->base;
> -	encoder->possible_crtcs = 0x1;
> -
> -	drm_encoder_init(dev, encoder, &mga_encoder_encoder_funcs,
> -			 DRM_MODE_ENCODER_DAC, NULL);
> -	drm_encoder_helper_add(encoder, &mga_encoder_helper_funcs);
> -
> -	return encoder;
> -}
> -
> -
>  static int mga_vga_get_modes(struct drm_connector *connector)
>  {
>  	struct mga_connector *mga_connector = to_mga_connector(connector);
> @@ -1686,8 +1617,9 @@ static struct drm_connector *mga_vga_init(struct drm_device *dev)
>  
>  int mgag200_modeset_init(struct mga_device *mdev)
>  {
> -	struct drm_encoder *encoder;
> +	struct drm_encoder *encoder = &mdev->encoder;
>  	struct drm_connector *connector;
> +	int ret;
>  
>  	mdev->mode_info.mode_config_initialized = true;
>  
> @@ -1698,11 +1630,14 @@ int mgag200_modeset_init(struct mga_device *mdev)
>  
>  	mga_crtc_init(mdev);
>  
> -	encoder = mga_encoder_init(mdev->dev);
> -	if (!encoder) {
> -		DRM_ERROR("mga_encoder_init failed\n");
> -		return -1;
> +	ret = drm_simple_encoder_init(mdev->dev, encoder,
> +				      DRM_MODE_ENCODER_DAC);
> +	if (ret) {
> +		DRM_ERROR("drm_simple_encoder_init() failed, error %d\n",
> +			  -ret);
DRM_ERROR is deprecated if you have a drm_device.
Consider to use:

		drm_err(mdev->dev, "drm_simple_encoder_init() failed, error %d\n",
		        ret);
Note - "-ret" looked strange. We usually do not modify return values
like this when printing.


> +		return ret;
>  	}
> +	encoder->possible_crtcs = 0x1;
>  
>  	connector = mga_vga_init(mdev->dev);
>  	if (!connector) {

With the above addressed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


	Sam
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
