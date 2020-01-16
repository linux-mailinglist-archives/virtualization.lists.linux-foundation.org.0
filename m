Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CAD13D46F
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 07:41:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6607A87B36;
	Thu, 16 Jan 2020 06:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w5uclUhQQN78; Thu, 16 Jan 2020 06:41:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5274287B0E;
	Thu, 16 Jan 2020 06:41:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22FA6C077D;
	Thu, 16 Jan 2020 06:41:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 034DAC077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 06:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ED90C86447
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 06:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZmbORo623YW
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 06:41:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5187186322
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 06:41:17 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b9so9371941pgk.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 22:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f+3QqTgKD7g/KMqBuMVdD0S0/jS8wXuOx0d2mRo05wM=;
 b=HWyZ3sMXGypZPNNMnZ852l+iVVKgncaqVj3flIFUoNqtIfd60EyelDa3m2LZrvRnBr
 h0l7o9f8UC4fo6HCkftcKVspCowdS+e6L/ybziqj3RV6Rrr6GakIosK/u3nobSMoK8hX
 lSxCdkVTZryN2yp+LCBmbzoysuD5mrcoDIeEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f+3QqTgKD7g/KMqBuMVdD0S0/jS8wXuOx0d2mRo05wM=;
 b=YB+COdM5QxTyv+n3BjHnnxw0PFCNdep4w/L8yxE7h3hSqjaPC7iOL8ZXQ9QdRznNAu
 9BMwDNj/7h0BY/HieaFIvfXhaSshl+c10aiEg0tRYvlYH7Qkao6IPo6Ra+bCWjST6Lyy
 KAju0sjgvPuoOo7qe6QXpXy0BlrrBLnX8LSpAWJENK/4I7GyxNxi2CUcExui9JX8aP9X
 HiAnE0paUi65R0cElC+EHpmCFZ6a4lb18G/GpzqzOJiRaxIhGN2Gq3OVII5f5kbiK+W+
 hLmsSTgLJI3FrFvz78Rif4T5ClRxDUCW8wyOAP8iG/wKOxEnmyY4nDdqDQiTFYoFIMdS
 1rig==
X-Gm-Message-State: APjAAAWWFzjI/9WzbbvfWYddCeJt+rNkrDo3wF0o0GM3zYiGUqTMM6JD
 l0Qjb0s5SA+uxjj2ufBjuQpScA==
X-Google-Smtp-Source: APXvYqwZqouniRGqLdIbpa7A320WvTTDLYRevXEYwIJDywXZPmI0KIu4Kbc7bxX/PQE5dglAyvziBw==
X-Received: by 2002:a63:e0c:: with SMTP id d12mr36249068pgl.3.1579156876764;
 Wed, 15 Jan 2020 22:41:16 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id a1sm23642333pfo.68.2020.01.15.22.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 22:41:16 -0800 (PST)
Date: Thu, 16 Jan 2020 07:41:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events
 by default
Message-ID: <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115125226.13843-5-tzimmermann@suse.de>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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

On Wed, Jan 15, 2020 at 01:52:26PM +0100, Thomas Zimmermann wrote:
> In drm_atomic_helper_fake_vblank() the DRM core sends out VBLANK events
> if struct drm_crtc_state.no_vblank is enabled in the check() callbacks.
> 
> For drivers that have neither an enable_vblank() callback nor a check()
> callback, the simple-KMS helpers enable VBLANK generation by default. This
> simplifies bochs, udl, several tiny drivers, and drivers based upon MIPI
> DPI helpers. The driver for Xen explicitly disables no_vblank, as it has
> its own logic for sending these events.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 15fb516ae2d8..4414c7a5b2ce 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -146,10 +146,21 @@ static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
>  	if (!plane_state->visible)
>  		return 0;
>  
> -	if (!pipe->funcs || !pipe->funcs->check)
> -		return 0;
> -
> -	return pipe->funcs->check(pipe, plane_state, crtc_state);
> +	if (pipe->funcs) {
> +		if (pipe->funcs->check)
> +			return pipe->funcs->check(pipe, plane_state,
> +						  crtc_state);
> +		if (pipe->funcs->enable_vblank)
> +			return 0;
> +	}
> +
> +	/* Drivers without VBLANK support have to fake VBLANK events. As
> +	 * there's no check() callback to enable this, set the no_vblank
> +	 * field by default.
> +	 */

The ->check callback is right above this comment ... I'm confused.

> +	crtc_state->no_vblank = true;

That's kinda not what I meant with handling this automatically. Instead
something like this:


diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7cf3cf936547..23d2f51fc1d4 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -149,6 +149,11 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 	/* Self refresh should be canceled when a new update is available */
 	state->active = drm_atomic_crtc_effectively_active(state);
 	state->self_refresh_active = false;
+
+	if (drm_dev_has_vblank(crtc->dev))
+		state->no_vblank = true;
+	else
+		state->no_vblank = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
 
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1659b13b178c..32cab3d3c872 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -81,6 +81,12 @@
  */
 #define DRM_REDUNDANT_VBLIRQ_THRESH_NS 1000000
 
+/* FIXME roll this out here in this file */
+bool drm_dev_has_vblank(dev)
+{
+	return dev->num_crtcs;
+}
+
 static bool
 drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
 			  ktime_t *tvblank, bool in_vblank_irq);


But maybe move the default value to some other/better place in the atomic
helpers, not sure what the best one is.

Plus then in the documentation patch also highlight the link between
crtc_state->no_vblank and drm_dev_has_vblank respectively
drm_device.num_crtcs.

That should plug this issue once for all across the board.

There's still the fun between having the vblank callbacks and the
drm_vblank setup, but that's a much older can of worms ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
