Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B79C144DCE
	for <lists.virtualization@lfdr.de>; Wed, 22 Jan 2020 09:37:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FEA185FA1;
	Wed, 22 Jan 2020 08:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ono4VLHEaH8I; Wed, 22 Jan 2020 08:37:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEB4685FA0;
	Wed, 22 Jan 2020 08:37:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 851F5C0174;
	Wed, 22 Jan 2020 08:37:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 047E9C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 08:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E5E4720791
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 08:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cD9cWiJWXbdq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 08:37:37 +0000 (UTC)
X-Greylist: delayed 00:05:53 by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by silver.osuosl.org (Postfix) with ESMTPS id AE01620373
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 08:37:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p9so5870082wmc.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 00:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vETm/cqCDdvu8YgJ91D8ovTzZmiZ5bghni5xOlGJa50=;
 b=Sft5dCWICznPBdMLL1VP3xutOvmmI3zIZgFi/qdZISt6LRrNscYorefEQHLmYYRqKZ
 KWT4w5opqDO9q1wJ/VME8d/ENGgll01J2LRNIXjHL/OZHCcKtF46ZGASluDEo5y65SYF
 ATntM9icj+qqTQKmpkuGxqOEMJWaRDDP2qOnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vETm/cqCDdvu8YgJ91D8ovTzZmiZ5bghni5xOlGJa50=;
 b=QNxFtQ5whpWyxEH/5zzCH1C7CpyyuggJ9Nunto+6/rw/r7DBkg0O6Whlisz1rFtzna
 I66u3myXxM2HEnzkLX89tzk5YmMMg6zGITH+lHSGhJnHq1C69PB16P+idzXGY446sGNw
 egAj3x4BsLumyGNn7Zt0lUCQI2XyFwY21u+hEQMbGzLagHiUrCjzm3YSWGd7GXZCfW2R
 oVKVOlmVhbeGX6v/knzgzGbG33+o8EL4GGC6AEoTQEYryTXzTIa5kxObI5z1B89gQWNm
 WLnV+L+PpK3YoynWqs9Mox68JxWoT5uXFTREKSMp5X2U+J3lHYWTJpmGmI0wp5CdoWDe
 BFRA==
X-Gm-Message-State: APjAAAVxha70PnJnsRP8SfusIFsWa5H68xdRB4nwzOX4uGAqDYo8ZAi1
 6lCr7LJ5ecJNlofAtoIn0B3K1w==
X-Google-Smtp-Source: APXvYqyGHGDtB9jvhm0wcfvsN8ff+Y7NBcqJOhea2NMz8SRwNiCQCQfPW7Aub5jBelErwtQJogOSOQ==
X-Received: by 2002:a1c:f218:: with SMTP id s24mr1749861wmc.128.1579681902143; 
 Wed, 22 Jan 2020 00:31:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g7sm55799243wrq.21.2020.01.22.00.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 00:31:41 -0800 (PST)
Date: Wed, 22 Jan 2020 09:31:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/4] drm: Add drm_crtc_has_vblank()
Message-ID: <20200122083139.GP43062@phenom.ffwll.local>
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200120122051.25178-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120122051.25178-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 noralf@tronnes.org, daniel@ffwll.ch, xen-devel@lists.xenproject.org,
 emil.velikov@collabora.com, sean@poorly.run, laurent.pinchart@ideasonboard.com
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

On Mon, Jan 20, 2020 at 01:20:48PM +0100, Thomas Zimmermann wrote:
> The new interface drm_crtc_has_vblank() return true if vblanking has
> been initialized for a certain CRTC, or false otherwise. This function
> will be useful for initializing CRTC state.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_vblank.c | 21 +++++++++++++++++++++
>  include/drm/drm_vblank.h     |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 1659b13b178c..c20102899411 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -501,6 +501,27 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  }
>  EXPORT_SYMBOL(drm_vblank_init);
>  
> +/**
> + * drm_crtc_has_vblank - test if vblanking has been initialized for
> + *                       a CRTC
> + * @crtc: the CRTC
> + *
> + * Drivers may call this function to test if vblank support is
> + * initialized for a CRTC. For most hardware this means that vblanking
> + * can also be enabled on the CRTC.
> + *
> + * Returns:
> + * True if vblanking has been initialized for the given CRTC, false
> + * otherwise.
> + */
> +bool drm_crtc_has_vblank(const struct drm_crtc *crtc)

So making this specific to a CRTC sounds like a good idea. But it's not
the reality, drm_vblank.c assumes that either everything or nothing
supports vblanks.

The reason for dev->num_crtcs is historical baggage, it predates kms by a
few years. For kms drivers the only two valid values are either 0 or
dev->mode_config.num_crtcs. Yes that's an entire different can of worms
that's been irking me since forever (ideally drm_vblank_init would somehow
loose the num_crtcs argument for kms drivers, but some drivers call this
before they've done all the drm_crtc_init calls so it's complicated).

Hence drm_dev_has_vblank as I suggested. That would also allow you to
replace a bunch of if (dev->num_crtcs) checks in drm_vblank.c, which
should help quite a bit in code readability.

Cheers, Daniel

> +{
> +	struct drm_device *dev = crtc->dev;
> +
> +	return crtc->index < dev->num_crtcs;
> +}
> +EXPORT_SYMBOL(drm_crtc_has_vblank);
> +
>  /**
>   * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
>   * @crtc: which CRTC's vblank waitqueue to retrieve
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index c16c44052b3d..531a6bc12b7e 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -206,6 +206,7 @@ struct drm_vblank_crtc {
>  };
>  
>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
> +bool drm_crtc_has_vblank(const struct drm_crtc *crtc);
>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
>  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
>  				   ktime_t *vblanktime);
> -- 
> 2.24.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
