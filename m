Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 797501388C1
	for <lists.virtualization@lfdr.de>; Mon, 13 Jan 2020 00:29:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F2AF28459A;
	Sun, 12 Jan 2020 23:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wk8m20WiRKBF; Sun, 12 Jan 2020 23:29:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D7021844A8;
	Sun, 12 Jan 2020 23:29:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C984FC077D;
	Sun, 12 Jan 2020 23:29:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23D4BC077D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jan 2020 23:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1EAEF8426E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jan 2020 23:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vw0wzpn1QxPV
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jan 2020 23:29:25 +0000 (UTC)
X-Greylist: delayed 00:28:33 by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 23A9984081
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jan 2020 23:29:25 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x8so3809880pgk.8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Jan 2020 15:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CwfMuvC2hvYR0XTpj3sBClHWpepFkZYtWFnlziVzfFk=;
 b=ieUC2cli8MCv7mHQt8+GMdqSkuPB0kYCgS+7yID38EOzzqRncDfnfLTCQJ+DVOZ+2R
 xXap0zJpcRxQlfIEfd72SMgYdrmFQ/uiNaDcH20Tu+CJ4PlMAgIsIqeOvTurdHRQ0Dfh
 FsnpenDt/Ieixvy7cFlHxztCqFVgZb+YhvFys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CwfMuvC2hvYR0XTpj3sBClHWpepFkZYtWFnlziVzfFk=;
 b=qqRgkN54EZ9JO3MgsHatbq6sm+DfF9zXWIR2eG1R0s4sfJ92XHY1WhZT3YNfK6R2py
 cfpqX2rX6PSw4C8LqvJnODpncw9efYGGKXIhyFlAX/z5Fy7U8VxPsvq9cgGMuxXYEjMv
 NxnvuBHvMSEAdL3VkRf+kocrpHyvKdCWaylcmdmsMumq0bRQ45iJ1vjfEnY6hCUT6GUN
 wV9uGcOeFp/RKxxy76lXZW7OXCSv6ZhrpGgYnafcvregfOdmbU7tMzhgpKlV9378BRoQ
 6UOO94O0W2L12SD+cAdnF8j36LpXR/to8VxYYSgnSLGCHX+iGy/s2TwkxNtY/IPCXHIR
 V2jA==
X-Gm-Message-State: APjAAAW7LezcMKBwj5bHfqxfzlw6+lN+OvqewWxs9HTtGoFcDIYOOXJH
 6DNmW0HN4R0n7QGaaPg9RhNqzWqVJ6SkvA==
X-Google-Smtp-Source: APXvYqy02e8v8/s0tOnLAMFwoGvwXVi5pgKf19gDRUkhvGwfqbOiP5PiRyxfLsEi4gRtVULKXEKyYA==
X-Received: by 2002:aa7:9d87:: with SMTP id f7mr16616440pfq.138.1578870051961; 
 Sun, 12 Jan 2020 15:00:51 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id i3sm11767518pfo.72.2020.01.12.15.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 15:00:51 -0800 (PST)
Date: Mon, 13 Jan 2020 00:00:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/cirrus: Let DRM core send VBLANK events
Message-ID: <20200112230045.GE5340@dvetter-linux.ger.corp.intel.com>
References: <20200110115707.14080-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110115707.14080-1-tzimmermann@suse.de>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 virtualization@lists.linux-foundation.org
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

On Fri, Jan 10, 2020 at 12:57:07PM +0100, Thomas Zimmermann wrote:
> In drm_atomic_helper_fake_vblank() the DRM core sends out VBLANK
> events if struct drm_crtc_state.no_vblank is enabled. Replace cirrus'
> VBLANK events with the DRM core's functionality.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
> index 248c9f765c45..4a1729aa7e53 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -38,7 +38,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> -#include <drm/drm_vblank.h>
>  
>  #define DRIVER_NAME "cirrus"
>  #define DRIVER_DESC "qemu cirrus vga"
> @@ -415,6 +414,8 @@ static void cirrus_pipe_enable(struct drm_simple_display_pipe *pipe,
>  {
>  	struct cirrus_device *cirrus = pipe->crtc.dev->dev_private;
>  
> +	crtc_state->no_vblank = true;

Huh, nice untended use of this stuff ... We've added this for writeback,
but I guess it can be used for anything that's a virtual connector ...

I've also spotted that you've done this same trick for ast & udl already.
But I think before we roll this out massively we should make this
official. Can you pls do a patch to update the kerneldoc for @no_vblank
that virtual hw can also use this stuff?

Also, computing state values in atomic_commit code is kinda uncool and
fraught with peril - design assumption is that with some very few
exceptions (which are kinda awkward, would be nice to make state pointers
const) all the core and helper codes that state structures stay unchanged
after atomic_check completed. This should be computed in atomic_check (like vc4
does). Can you pls also include patches to update ast and udl in this
series?

Thanks, Daniel


> +
>  	cirrus_mode_set(cirrus, &crtc_state->mode, plane_state->fb);
>  	cirrus_fb_blit_fullscreen(plane_state->fb);
>  }
> @@ -434,13 +435,6 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
>  
>  	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>  		cirrus_fb_blit_rect(pipe->plane.state->fb, &rect);
> -
> -	if (crtc->state->event) {
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -		crtc->state->event = NULL;
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -	}
>  }
>  
>  static const struct drm_simple_display_pipe_funcs cirrus_pipe_funcs = {
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
