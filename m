Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 446DB16667D
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 19:42:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4449484B36;
	Thu, 20 Feb 2020 18:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pageOKVhNv+O; Thu, 20 Feb 2020 18:42:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7AE4A85693;
	Thu, 20 Feb 2020 18:42:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 723B8C013E;
	Thu, 20 Feb 2020 18:42:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3445BC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 18:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1DF86860AD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 18:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6aHIHYNARu0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 18:42:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 33F63842E9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 18:42:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F22EF80A60;
 Thu, 20 Feb 2020 19:42:31 +0100 (CET)
Date: Thu, 20 Feb 2020 19:42:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/4] drm/simple-kms: Add drm_simple_encoder_{init,
 create}()
Message-ID: <20200220184230.GA18993@ravnborg.org>
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218084815.2137-2-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=cNTKbyX6Oi9ivAK1HFkA:9 a=wPNLvfGTeEIA:10
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Thomas.

On Tue, Feb 18, 2020 at 09:48:12AM +0100, Thomas Zimmermann wrote:
> This patch makes the internal encoder implementation of the simple
> KMS helpers available to drivers.
> =

> These simple-encoder helpers initialize an encoder with an empty
> implementation. This covers the requirements of most of the existing
> DRM drivers. A call to drm_simple_encoder_create() allocates and
> initializes an encoder instance, a call to drm_simple_encoder_init()
> initializes a pre-allocated instance.
> =

> v2:
> 	* move simple encoder to KMS helpers
> 	* remove name argument; simplifies implementation
> 	* don't allocate with devm_ interfaces; unsafe with DRM
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 83 ++++++++++++++++++++++++-
>  include/drm/drm_simple_kms_helper.h     |  7 +++
>  2 files changed, 87 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/dr=
m_simple_kms_helper.c
> index 15fb516ae2d8..745c2f34c42b 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -26,12 +26,90 @@
>   * entity. Some flexibility for code reuse is provided through a separat=
ely
>   * allocated &drm_connector object and supporting optional &drm_bridge
>   * encoder drivers.
> + *
> + * Many drivers use an encoder with an empty implementation. Such encode=
rs
> + * fulfill the minimum requirements of the display pipeline, but don't a=
dd
> + * additional functionality. The simple-encoder functions
> + * drm_simple_encoder_init() and drm_simple_encoder_create() provide an
> + * appropriate implementation.
This paragraph reads a bit strange to me - I read this as a
justification for addding a generic encoded that can be used by exisitg
drivers.

How about something like this:

Many drivers requires a very simple encoder that only fullfill
the minimum requirements of the display pipeline and do not add
any extra functionslity.
The simple-encoder functions drm_simple_encoder_init() and
drm_simple_encoder_create() provides an imp=E5lmentation of such
a simple encoder.
The simple encoder includes automatically release of resources.

And then leave it to the changelog to tell what should be done in
existing drivers.



>   */
>  =

> -static const struct drm_encoder_funcs drm_simple_kms_encoder_funcs =3D {
> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup =
=3D {
>  	.destroy =3D drm_encoder_cleanup,
>  };
>  =

> +/**
> + * drm_simple_encoder_init - Initialize a preallocated encoder
> + * @dev: drm device
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + *
> + * Initialises a preallocated encoder that has no further functionality.=
 The
> + * encoder will be released automatically. Settings for possible CRTC and
> + * clones are left to their initial values. The encoder will be cleaned =
up
> + * automatically as part of the mode-setting cleanup.
> + *
> + * Also see drm_simple_encoder_create().
s/Also see/See also/??


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
> +static void drm_encoder_destroy(struct drm_encoder *encoder)
> +{
> +	drm_encoder_cleanup(encoder);
> +	kfree(encoder);
> +}
> +
> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_destroy =
=3D {
> +	.destroy =3D drm_encoder_destroy,
> +};
> +
> +/**
> + * drm_simple_encoder_create - Allocate and initialize an encoder
> + * @dev: drm device
> + * @encoder_type: user visible type of the encoder
> + *
> + * Allocates and initialises an encoder that has no further functionalit=
y. The
> + * encoder will be destroyed automatically as part of the mode-setting c=
leanup.
> + *
> + * See drm_simple_encoder_init() for more information.
> + *
> + * Returns:
> + * The encoder on success, a pointer-encoder error code on failure.
                                pointer-encoded?



> + */
> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> +					      int encoder_type)
> +{
> +	struct drm_encoder *encoder;
> +	int ret;
> +
> +	encoder =3D kzalloc(sizeof(*encoder), GFP_KERNEL);
> +	if (!encoder)
> +		return ERR_PTR(-ENOMEM);
> +	ret =3D drm_encoder_init(dev, encoder,
> +			       &drm_simple_encoder_funcs_destroy,
> +			       encoder_type, NULL);
> +	if (ret)
> +		goto err_kfree;
> +
> +	return encoder;
> +
> +err_kfree:
> +	kfree(encoder);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_simple_encoder_create);
> +
>  static enum drm_mode_status
>  drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
>  			       const struct drm_display_mode *mode)
> @@ -288,8 +366,7 @@ int drm_simple_display_pipe_init(struct drm_device *d=
ev,
>  		return ret;
>  =

>  	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
> -	ret =3D drm_encoder_init(dev, encoder, &drm_simple_kms_encoder_funcs,
> -			       DRM_MODE_ENCODER_NONE, NULL);
> +	ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
>  	if (ret || !connector)
>  		return ret;
>  =

> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple=
_kms_helper.h
> index e253ba7bea9d..54d5066d90c7 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -181,4 +181,11 @@ int drm_simple_display_pipe_init(struct drm_device *=
dev,
>  			const uint64_t *format_modifiers,
>  			struct drm_connector *connector);
>  =

> +int drm_simple_encoder_init(struct drm_device *dev,
> +			    struct drm_encoder *encoder,
> +			    int encoder_type);
> +
> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> +					      int encoder_type);
> +
>  #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */

	Sam
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
