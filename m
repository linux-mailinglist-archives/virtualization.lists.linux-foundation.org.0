Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD29172992
	for <lists.virtualization@lfdr.de>; Thu, 27 Feb 2020 21:38:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 32C9988072;
	Thu, 27 Feb 2020 20:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DcoI-cZPEadS; Thu, 27 Feb 2020 20:38:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A6208805D;
	Thu, 27 Feb 2020 20:38:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AB47C0177;
	Thu, 27 Feb 2020 20:38:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64C1CC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 540338805D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H+vTcr825ofH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:38:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5F6AD88045
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:38:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0DCA120031;
 Thu, 27 Feb 2020 21:38:34 +0100 (CET)
Date: Thu, 27 Feb 2020 21:38:33 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/4] drm/simple-kms: Add drm_simple_encoder_{init,
 create}()
Message-ID: <20200227203833.GD27592@ravnborg.org>
References: <20200225131055.27550-1-tzimmermann@suse.de>
 <20200225131055.27550-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225131055.27550-2-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=2WS2h4KZY83Cp39CgdIA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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

On Tue, Feb 25, 2020 at 02:10:52PM +0100, Thomas Zimmermann wrote:
> This patch makes the internal encoder implementation of the simple
> KMS helpers available to drivers.
> 
> These simple-encoder helpers initialize an encoder with an empty
> implementation. This covers the requirements of most of the existing
> DRM drivers. A call to drm_simple_encoder_create() allocates and
> initializes an encoder instance, a call to drm_simple_encoder_init()
> initializes a pre-allocated instance.
> 
> v3:
> 	* remove drm_simple_encoder_create(); not required yet
> 	* provide more precise documentation
> v2:
> 	* move simple encoder to KMS helpers
> 	* remove name argument; simplifies implementation
> 	* don't allocate with devm_ interfaces; unsafe with DRM
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 34 ++++++++++++++++++++++---
>  include/drm/drm_simple_kms_helper.h     |  4 +++
>  2 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 15fb516ae2d8..04309e4660de 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -26,12 +26,41 @@
>   * entity. Some flexibility for code reuse is provided through a separately
>   * allocated &drm_connector object and supporting optional &drm_bridge
>   * encoder drivers.
> + *
> + * Many drivers require only a very simple encoder that fulfills the minimum
> + * requirements of the display pipeline and does not add additional
> + * functionality. The function drm_simple_encoder_init() provides an
> + * implementation of such an encoder.
>   */
>  
> -static const struct drm_encoder_funcs drm_simple_kms_encoder_funcs = {
> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
>  	.destroy = drm_encoder_cleanup,
>  };
>  
> +/**
> + * drm_simple_encoder_init - Initialize a preallocated encoder
> + * @dev: drm device
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + *
> + * Initialises a preallocated encoder that has no further functionality.
> + * Settings for possible CRTC and clones are left to their initial values.
> + * The encoder will be cleaned up automatically as part of the mode-setting
> + * cleanup.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_simple_encoder_init(struct drm_device *dev,
> +			    struct drm_encoder *encoder,
> +			    int encoder_type)
> +{
> +	return drm_encoder_init(dev, encoder,
> +				&drm_simple_encoder_funcs_cleanup,
> +				encoder_type, NULL);
> +}
> +EXPORT_SYMBOL(drm_simple_encoder_init);
> +
>  static enum drm_mode_status
>  drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
>  			       const struct drm_display_mode *mode)
> @@ -288,8 +317,7 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
>  		return ret;
>  
>  	encoder->possible_crtcs = drm_crtc_mask(crtc);
> -	ret = drm_encoder_init(dev, encoder, &drm_simple_kms_encoder_funcs,
> -			       DRM_MODE_ENCODER_NONE, NULL);
> +	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
>  	if (ret || !connector)
>  		return ret;
>  
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index e253ba7bea9d..a026375464ff 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -181,4 +181,8 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
>  			const uint64_t *format_modifiers,
>  			struct drm_connector *connector);
>  
> +int drm_simple_encoder_init(struct drm_device *dev,
> +			    struct drm_encoder *encoder,
> +			    int encoder_type);
> +
>  #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
> -- 
> 2.25.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
