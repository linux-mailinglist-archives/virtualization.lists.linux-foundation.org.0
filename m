Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E6155BB0
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 17:25:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9CECD87E98;
	Fri,  7 Feb 2020 16:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXuoVmCM2-DN; Fri,  7 Feb 2020 16:25:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 077E587E8F;
	Fri,  7 Feb 2020 16:25:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEDBFC013E;
	Fri,  7 Feb 2020 16:25:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2198C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 16:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AFBF487E8F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 16:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKQmsgDr24bR
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 16:25:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AE24387E81
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 16:25:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g1so3154498wmh.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 07 Feb 2020 08:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ABM5sPmuYyfwyFFg86r2EIUp7pzpkgyEmE7tZ3sQLNQ=;
 b=QBnpK0a4KKF1C/1vq/mdAE3IoR8A7Jmi0B88AZSIxbGWiPOGWaHEZQKXYlkPh5xmzR
 lw7BpPL6/a/d7/XQHCfxtPjhMJv2XizAimDT3g8KsCgTbyHiffe/zWdduWIU9mug1RFL
 +fCTIYhSAmQ5h1y5zWyVdbON7E9A8sHyWoYlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ABM5sPmuYyfwyFFg86r2EIUp7pzpkgyEmE7tZ3sQLNQ=;
 b=XvzR3mTjSqGH51YuCkzYxvQ0v8OrLR0R4BJ7i20Qb/Yxm35dLG9cbvgMXb8HQLgGIQ
 eB3CktRQ91hPLYK13Fw1SnRxPsUQ2ajcgMTdqEYF87+iy2ZPCa5w1xppv9jCMxzCLZvK
 WVH59nn/iX61znXmvk8qs2Nm1ASyB1/vB+z8/8GYyDksNCJSmb9XlKCw+0NQgJ8LkVCA
 WrOhLRtsWAM0yxjVBKJWiQZkaBJrfQgBd8UU81FBzfR+ycSwDNHVVyFntXt7nXSmRjIn
 93IgsOHVdIv7Fzw8qjqR2VocFCkUhu2Mo4ImE7CkTeuOQqG+ZglE6JZ/wDG9JrbFwrwW
 BT5w==
X-Gm-Message-State: APjAAAVfExPpyKYreXfYSfH3rBsHbum82CAbUNzT1CaN7HMz9qV6KyUz
 TbqETcXTsXwyoKZ1RUzDOjBv7g==
X-Google-Smtp-Source: APXvYqxr4J8VxpLHdQGB+E1AjASXNHqXB7Tb6P5GFPGa/ArXS5/ZvoMbLmFneETUQSNcQT7yqdZ21A==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr4974941wme.153.1581092713847; 
 Fri, 07 Feb 2020 08:25:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b18sm3942381wru.50.2020.02.07.08.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 08:25:12 -0800 (PST)
Date: Fri, 7 Feb 2020 17:25:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Message-ID: <20200207162510.GH43062@phenom.ffwll.local>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
 <e43dcf9c-e228-dd01-2e55-5ad75804cf79@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e43dcf9c-e228-dd01-2e55-5ad75804cf79@tronnes.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, virtualization@lists.linux-foundation.org, daniel@ffwll.ch,
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

On Fri, Feb 07, 2020 at 03:36:49PM +0100, Noralf Tr=F8nnes wrote:
> =

> =

> Den 07.02.2020 09.41, skrev Thomas Zimmermann:
> > The simple-encoder helpers initialize an encoder with an empty
> > implementation. This covers the requirements of most of the existing
> > DRM drivers. A call to drm_simple_encoder_create() allocates and
> > initializes an encoder instance, a call to drm_simple_encoder_init()
> > initializes a pre-allocated instance.
> > =

> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/drm_encoder.c | 116 ++++++++++++++++++++++++++++++++++
> >  include/drm/drm_encoder.h     |  10 +++
> >  2 files changed, 126 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encode=
r.c
> =

> <snip>
> =

> > +/**
> > + * drm_simple_encoder_create - Allocate and initialize an encoder
> > + * @dev: drm device
> > + * @encoder_type: user visible type of the encoder
> > + * @name: printf style format string for the encoder name, or NULL for
> > + *        default name
> > + *
> > + * Allocates and initialises an encoder that has no further functional=
ity. The
> > + * encoder will be released automatically.
> > + *
> > + * Returns:
> > + * The encoder on success, a pointer-encoder error code on failure.
> > + */
> > +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> > +					      int encoder_type,
> > +					      const char *name, ...)
> > +{
> > +	char *namestr =3D NULL;
> > +	struct drm_encoder *encoder;
> > +	int ret;
> > +
> > +	encoder =3D devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNEL);
> =

> The encoder can outlive the devres if the device is unbound when
> userspace has open fds, so you can't use devm_ here.

Ah yes great catch. Rule of thumb: Never use devm_ for any drm_*
structure. It's wrong.

There's a todo somewhere to essentially create a drm_managed set of apis
where the cleanup matches the right lifetime - we need to only
free/release drm resource at drm_driver->release time.
-Daniel

> =

> Noralf.
> =

> > +	if (!encoder)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	if (name) {
> > +		va_list ap;
> > +
> > +		va_start(ap, name);
> > +		namestr =3D kvasprintf(GFP_KERNEL, name, ap);
> > +		va_end(ap);
> > +		if (!namestr) {
> > +			ret =3D -ENOMEM;
> > +			goto err_devm_kfree;
> > +		}
> > +	}
> > +
> > +	ret =3D __drm_encoder_init(dev, encoder,
> > +				 &drm_simple_encoder_funcs_destroy,
> > +				 encoder_type, namestr);
> > +	if (ret)
> > +		goto err_kfree;
> > +
> > +	return encoder;
> > +
> > +err_kfree:
> > +	if (name)
> > +		kfree(namestr);
> > +err_devm_kfree:
> > +	devm_kfree(dev->dev, encoder);
> > +	return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL(drm_simple_encoder_create);
> > +

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
