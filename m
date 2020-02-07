Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6948A155BBB
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 17:26:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C94887E98;
	Fri,  7 Feb 2020 16:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i28V0OUQuPlu; Fri,  7 Feb 2020 16:26:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E24887E8F;
	Fri,  7 Feb 2020 16:26:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 482FCC013E;
	Fri,  7 Feb 2020 16:26:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F44DC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 16:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F1E0D87E8F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 16:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsmjYtHeLsPO
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 16:26:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E4B3A87E81
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 16:26:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so3144642wmj.5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 07 Feb 2020 08:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=haJ9tAlqEtnx7C2L3psZq4GEHOiH4KsdX68oj3ToLWE=;
 b=Nl8NttX7KPMtO6O6ZfjDUX74QQA4B09mP24r4JoeDF1CU/J7tt/OENX1asEr+T66MA
 8+9oFhYSN8sb9zgiYGEBgFdf4HpW2HwsDofWyHRc5d9MDKFny8LPbYwTQFnnX3ZZnSEY
 WXtsE9yhhOyvHJorEeXbNgpg1GpDbIlbI78rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=haJ9tAlqEtnx7C2L3psZq4GEHOiH4KsdX68oj3ToLWE=;
 b=aq0Lw26JmbsCfp7264x4oeoDpRO9BzvGEFcPZAmWz/L+U9IDthUup2OJZrdHLnGHrJ
 UJAXkM/JwmDLpKkbjyt5YR8WLpr5GieptqVN/7BN9L9a166jiw4Fvp37Yt+Cd6FSF3fZ
 SwSNxQnPaAPv7lv6dqSFkK07VYNaqMkobL7/IDwNh99TmvSl6T6AAYNg1iBPuC2PKq5Z
 utSrGw4ilYz5NodBheTURutu0I3GQ5gabvvcG7JF7Gvk59Jo2iuYUBJJbSUX5HkhRYzN
 iMYk72aOkAd6HmewHpHXewJXhA0QOvg6LITjK3aXMxqe658Mhj5jVOIzsz3qyxxGVgIu
 XSjg==
X-Gm-Message-State: APjAAAXx6rUO2w2NLKUzVtYRqg7h+7k5P701tz20xuJBnEhsUT38hrid
 Hj8bCggPaes/d1W4N72aVfR51g==
X-Google-Smtp-Source: APXvYqxKjQLj8Kx4lsLd9s8x0J57nuFgEDcrt/Xk8uQdGfK7PqZtb3jHLx0+8RndjtIakztQIy0RqQ==
X-Received: by 2002:a1c:b7c4:: with SMTP id h187mr5427628wmf.105.1581092799398; 
 Fri, 07 Feb 2020 08:26:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e22sm4047224wme.45.2020.02.07.08.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 08:26:38 -0800 (PST)
Date: Fri, 7 Feb 2020 17:26:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Message-ID: <20200207162636.GI43062@phenom.ffwll.local>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
 <20200207133720.GZ43062@phenom.ffwll.local>
 <86073cfa-496d-53d7-e4c4-9736128109fa@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86073cfa-496d-53d7-e4c4-9736128109fa@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org, sam@ravnborg.org,
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

On Fri, Feb 07, 2020 at 03:02:00PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 07.02.20 um 14:37 schrieb Daniel Vetter:
> > On Fri, Feb 07, 2020 at 09:41:31AM +0100, Thomas Zimmermann wrote:
> >> The simple-encoder helpers initialize an encoder with an empty
> >> implementation. This covers the requirements of most of the existing
> >> DRM drivers. A call to drm_simple_encoder_create() allocates and
> >> initializes an encoder instance, a call to drm_simple_encoder_init()
> >> initializes a pre-allocated instance.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > =

> > This has quick a bit midlayer taste to it ... I think having this as a
> > helper would be cleaner ...
> =

> How would such a helper roughly look like?

Essentially same code, but stuff the helper into drm-kms-helper.ko, then
make sure it still works. The separate kernel module makes sure that the
drm core and helper stuff aren't too close friends with each another :-)
Essentially like the simple display pipe helpers.
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > The other bit is drm_encoder->possible_crtcs. If we do create a helper =
for
> > these, lets at least try to make them not suck too badly :-) Otherwise I
> > guess it would be time to officially document what exactly possible_crt=
cs
> > =3D=3D 0 means from an uabi pov.
> > -Daniel
> > =

> >> ---
> >>  drivers/gpu/drm/drm_encoder.c | 116 ++++++++++++++++++++++++++++++++++
> >>  include/drm/drm_encoder.h     |  10 +++
> >>  2 files changed, 126 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encod=
er.c
> >> index ffe691a1bf34..1a65cab1f310 100644
> >> --- a/drivers/gpu/drm/drm_encoder.c
> >> +++ b/drivers/gpu/drm/drm_encoder.c
> >> @@ -178,6 +178,122 @@ int drm_encoder_init(struct drm_device *dev,
> >>  }
> >>  EXPORT_SYMBOL(drm_encoder_init);
> >>  =

> >> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanu=
p =3D {
> >> +	.destroy =3D drm_encoder_cleanup,
> >> +};
> >> +
> >> +/**
> >> + * drm_simple_encoder_init - Init a preallocated encoder
> >> + * @dev: drm device
> >> + * @funcs: callbacks for this encoder
> >> + * @encoder_type: user visible type of the encoder
> >> + * @name: printf style format string for the encoder name, or NULL
> >> + *        for default name
> >> + *
> >> + * Initialises a preallocated encoder that has no further functionali=
ty. The
> >> + * encoder will be released automatically.
> >> + *
> >> + * Returns:
> >> + * Zero on success, error code on failure.
> >> + */
> >> +int drm_simple_encoder_init(struct drm_device *dev,
> >> +			    struct drm_encoder *encoder,
> >> +			    int encoder_type, const char *name, ...)
> >> +{
> >> +	char *namestr =3D NULL;
> >> +	int ret;
> >> +
> >> +	if (name) {
> >> +		va_list ap;
> >> +
> >> +		va_start(ap, name);
> >> +		namestr =3D kvasprintf(GFP_KERNEL, name, ap);
> >> +		va_end(ap);
> >> +		if (!namestr)
> >> +			return -ENOMEM;
> >> +	}
> >> +
> >> +	ret =3D __drm_encoder_init(dev, encoder,
> >> +				 &drm_simple_encoder_funcs_cleanup,
> >> +				 encoder_type, namestr);
> >> +	if (ret)
> >> +		goto err_kfree;
> >> +
> >> +	return 0;
> >> +
> >> +err_kfree:
> >> +	if (name)
> >> +		kfree(namestr);
> >> +	return ret;
> >> +}
> >> +EXPORT_SYMBOL(drm_simple_encoder_init);
> >> +
> >> +static void drm_encoder_destroy(struct drm_encoder *encoder)
> >> +{
> >> +	struct drm_device *dev =3D encoder->dev;
> >> +
> >> +	drm_encoder_cleanup(encoder);
> >> +	devm_kfree(dev->dev, encoder);
> >> +}
> >> +
> >> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_destro=
y =3D {
> >> +	.destroy =3D drm_encoder_destroy,
> >> +};
> >> +
> >> +/**
> >> + * drm_simple_encoder_create - Allocate and initialize an encoder
> >> + * @dev: drm device
> >> + * @encoder_type: user visible type of the encoder
> >> + * @name: printf style format string for the encoder name, or NULL for
> >> + *        default name
> >> + *
> >> + * Allocates and initialises an encoder that has no further functiona=
lity. The
> >> + * encoder will be released automatically.
> >> + *
> >> + * Returns:
> >> + * The encoder on success, a pointer-encoder error code on failure.
> >> + */
> >> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> >> +					      int encoder_type,
> >> +					      const char *name, ...)
> >> +{
> >> +	char *namestr =3D NULL;
> >> +	struct drm_encoder *encoder;
> >> +	int ret;
> >> +
> >> +	encoder =3D devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNEL);
> >> +	if (!encoder)
> >> +		return ERR_PTR(-ENOMEM);
> >> +
> >> +	if (name) {
> >> +		va_list ap;
> >> +
> >> +		va_start(ap, name);
> >> +		namestr =3D kvasprintf(GFP_KERNEL, name, ap);
> >> +		va_end(ap);
> >> +		if (!namestr) {
> >> +			ret =3D -ENOMEM;
> >> +			goto err_devm_kfree;
> >> +		}
> >> +	}
> >> +
> >> +	ret =3D __drm_encoder_init(dev, encoder,
> >> +				 &drm_simple_encoder_funcs_destroy,
> >> +				 encoder_type, namestr);
> >> +	if (ret)
> >> +		goto err_kfree;
> >> +
> >> +	return encoder;
> >> +
> >> +err_kfree:
> >> +	if (name)
> >> +		kfree(namestr);
> >> +err_devm_kfree:
> >> +	devm_kfree(dev->dev, encoder);
> >> +	return ERR_PTR(ret);
> >> +}
> >> +EXPORT_SYMBOL(drm_simple_encoder_create);
> >> +
> >>  /**
> >>   * drm_encoder_cleanup - cleans up an initialised encoder
> >>   * @encoder: encoder to cleanup
> >> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> >> index 5623994b6e9e..0214f6cf9de6 100644
> >> --- a/include/drm/drm_encoder.h
> >> +++ b/include/drm/drm_encoder.h
> >> @@ -190,6 +190,16 @@ int drm_encoder_init(struct drm_device *dev,
> >>  		     const struct drm_encoder_funcs *funcs,
> >>  		     int encoder_type, const char *name, ...);
> >>  =

> >> +__printf(4, 5)
> >> +int drm_simple_encoder_init(struct drm_device *dev,
> >> +			    struct drm_encoder *encoder,
> >> +			    int encoder_type, const char *name, ...);
> >> +
> >> +__printf(3, 4)
> >> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> >> +					      int encoder_type,
> >> +					      const char *name, ...);
> >> +
> >>  /**
> >>   * drm_encoder_index - find the index of a registered encoder
> >>   * @encoder: encoder to find index for
> >> -- =

> >> 2.25.0
> >>
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
