Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5F1558B7
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 14:45:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B457920439;
	Fri,  7 Feb 2020 13:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKC8nmd9nW6e; Fri,  7 Feb 2020 13:45:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB7EC20478;
	Fri,  7 Feb 2020 13:45:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92A49C013E;
	Fri,  7 Feb 2020 13:45:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45171C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 41524863F2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrX-MMv22Rpb
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:45:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D70F0863CD
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:45:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u6so2787208wrt.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 07 Feb 2020 05:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1CcTElHSNqMZM5zwk48mWmWtE3xBK2DdfIEEUuyZkGg=;
 b=c72ecVghVbnBxD82XL/P39Jjig+XsM5ybdRwUtoHjTB404HjgQevnYA7ePFGNtuKxx
 8kgofSnmJOXcmRqrgPMKz/N29TXcqR23SymlnrvLQ7E9KQ6NFIuFg/0UxYqn5aRVAnCw
 9pXIkP1Uxe2lGcuauCe3ftg1ivRDGKomeB7Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1CcTElHSNqMZM5zwk48mWmWtE3xBK2DdfIEEUuyZkGg=;
 b=X7YUM2U5+V1vnqMjjwNUdEb1GQNjWuFOQBLkM8eECyFOdb6CLITwjM+WZiBrfspaph
 SU5BjF0aaBtAiLhvRK/qTOie0jtq6D46lxbWC9tDcLNrnb6GJPZt/maUYCCPAICK9ttT
 I3yMhQ9wFco/b8hP3FAzKxYBqC4C+qcYWLN8z9BHNbLqFd6I2fraGYy4EqtuCnQTIeZc
 Ri8wxl0WLauS7+obm8bVWAv/gz1/3z4LOLCWZvZpyEpcLJMEaH28ONGchO1kEjCSi96K
 29kqpVU7e/IJ1BFv7A5eEZuH7BYG+J1J70AJ7ulYHpIfz1ZvOmpstktBk/bTXIKye7fx
 e8HA==
X-Gm-Message-State: APjAAAXlXB3AoeVmvqdw6oI7ZVWkwvUugwngGBwVNVM+d3My8xZkjtcl
 zP1UVy5z01zfLf5o5ie3cFBb1/eRmwv52Q==
X-Google-Smtp-Source: APXvYqzW2ypvPBQo3tzVbCDYecJkmF0aMsQiTlbyoInM4Dd9NFY9omFvK/0gunpcQRlvlf+XRCV+qA==
X-Received: by 2002:adf:f787:: with SMTP id q7mr4764491wrp.297.1581082642747; 
 Fri, 07 Feb 2020 05:37:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a184sm3504277wmf.29.2020.02.07.05.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 05:37:22 -0800 (PST)
Date: Fri, 7 Feb 2020 14:37:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Message-ID: <20200207133720.GZ43062@phenom.ffwll.local>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207084135.4524-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, noralf@tronnes.org, daniel@ffwll.ch,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Feb 07, 2020 at 09:41:31AM +0100, Thomas Zimmermann wrote:
> The simple-encoder helpers initialize an encoder with an empty
> implementation. This covers the requirements of most of the existing
> DRM drivers. A call to drm_simple_encoder_create() allocates and
> initializes an encoder instance, a call to drm_simple_encoder_init()
> initializes a pre-allocated instance.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

This has quick a bit midlayer taste to it ... I think having this as a
helper would be cleaner ...

The other bit is drm_encoder->possible_crtcs. If we do create a helper for
these, lets at least try to make them not suck too badly :-) Otherwise I
guess it would be time to officially document what exactly possible_crtcs
== 0 means from an uabi pov.
-Daniel

> ---
>  drivers/gpu/drm/drm_encoder.c | 116 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_encoder.h     |  10 +++
>  2 files changed, 126 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index ffe691a1bf34..1a65cab1f310 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -178,6 +178,122 @@ int drm_encoder_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_encoder_init);
>  
> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +/**
> + * drm_simple_encoder_init - Init a preallocated encoder
> + * @dev: drm device
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL
> + *        for default name
> + *
> + * Initialises a preallocated encoder that has no further functionality. The
> + * encoder will be released automatically.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_simple_encoder_init(struct drm_device *dev,
> +			    struct drm_encoder *encoder,
> +			    int encoder_type, const char *name, ...)
> +{
> +	char *namestr = NULL;
> +	int ret;
> +
> +	if (name) {
> +		va_list ap;
> +
> +		va_start(ap, name);
> +		namestr = kvasprintf(GFP_KERNEL, name, ap);
> +		va_end(ap);
> +		if (!namestr)
> +			return -ENOMEM;
> +	}
> +
> +	ret = __drm_encoder_init(dev, encoder,
> +				 &drm_simple_encoder_funcs_cleanup,
> +				 encoder_type, namestr);
> +	if (ret)
> +		goto err_kfree;
> +
> +	return 0;
> +
> +err_kfree:
> +	if (name)
> +		kfree(namestr);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_simple_encoder_init);
> +
> +static void drm_encoder_destroy(struct drm_encoder *encoder)
> +{
> +	struct drm_device *dev = encoder->dev;
> +
> +	drm_encoder_cleanup(encoder);
> +	devm_kfree(dev->dev, encoder);
> +}
> +
> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_destroy = {
> +	.destroy = drm_encoder_destroy,
> +};
> +
> +/**
> + * drm_simple_encoder_create - Allocate and initialize an encoder
> + * @dev: drm device
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL for
> + *        default name
> + *
> + * Allocates and initialises an encoder that has no further functionality. The
> + * encoder will be released automatically.
> + *
> + * Returns:
> + * The encoder on success, a pointer-encoder error code on failure.
> + */
> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> +					      int encoder_type,
> +					      const char *name, ...)
> +{
> +	char *namestr = NULL;
> +	struct drm_encoder *encoder;
> +	int ret;
> +
> +	encoder = devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNEL);
> +	if (!encoder)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (name) {
> +		va_list ap;
> +
> +		va_start(ap, name);
> +		namestr = kvasprintf(GFP_KERNEL, name, ap);
> +		va_end(ap);
> +		if (!namestr) {
> +			ret = -ENOMEM;
> +			goto err_devm_kfree;
> +		}
> +	}
> +
> +	ret = __drm_encoder_init(dev, encoder,
> +				 &drm_simple_encoder_funcs_destroy,
> +				 encoder_type, namestr);
> +	if (ret)
> +		goto err_kfree;
> +
> +	return encoder;
> +
> +err_kfree:
> +	if (name)
> +		kfree(namestr);
> +err_devm_kfree:
> +	devm_kfree(dev->dev, encoder);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_simple_encoder_create);
> +
>  /**
>   * drm_encoder_cleanup - cleans up an initialised encoder
>   * @encoder: encoder to cleanup
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 5623994b6e9e..0214f6cf9de6 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -190,6 +190,16 @@ int drm_encoder_init(struct drm_device *dev,
>  		     const struct drm_encoder_funcs *funcs,
>  		     int encoder_type, const char *name, ...);
>  
> +__printf(4, 5)
> +int drm_simple_encoder_init(struct drm_device *dev,
> +			    struct drm_encoder *encoder,
> +			    int encoder_type, const char *name, ...);
> +
> +__printf(3, 4)
> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> +					      int encoder_type,
> +					      const char *name, ...);
> +
>  /**
>   * drm_encoder_index - find the index of a registered encoder
>   * @encoder: encoder to find index for
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
