Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBD514A123
	for <lists.virtualization@lfdr.de>; Mon, 27 Jan 2020 10:47:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2396E20483;
	Mon, 27 Jan 2020 09:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2R87ILwPKIaU; Mon, 27 Jan 2020 09:47:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CBC602047D;
	Mon, 27 Jan 2020 09:47:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB2BFC0171;
	Mon, 27 Jan 2020 09:47:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07958C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 09:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E9FE120396
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 09:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWNv1sPb-jFv
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 09:47:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 9AA4F2046D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 09:47:45 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so6297635wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H6zmf5XzCvSMH9uJ4yak9/j0gn5TwDDcpXp+N0GvNHo=;
 b=NCVXrrNnL4lyVfhwYABdKDq/2VD10nrlZBZBe3FObKCZRT96shMvVvzOJki+O6QtFg
 EKMM/rhgc7ZN20P1bLv7MEUldvDF0nYx4fyp8ccghH1u5knbG0v2iyAdYmGsO25VEy0S
 RJq/xEMeFTyMCmxFJhlZ+YoWpubcwcOCzrldM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H6zmf5XzCvSMH9uJ4yak9/j0gn5TwDDcpXp+N0GvNHo=;
 b=LUvrTum59mNhMbGHVwXTMh06VF618uZLNENeW/bkx1eMcJVvrKWaftWkorzdnDLX4n
 KfM1NJTtXhsTV55p3sCg4KsN46lJEIaZItoN/TxvAaCee83maEpvC+FW0Pov57yCvhSN
 8wgJJFnvQAqiOV00ZWfxoAIXDdDnsJPzncCqdfT7FTycl/adFs5bEVROQiUGN0APkl68
 kaodkjWWDkOj6F1S0EWAs5HJtnDYwKrHUdmBeGwjxfoBtviimch9r1ukrcrK4WNBip6b
 HRbaGly7CiApJVDHVvOVCIIQVGrOTtUOwtZ/NH4X5cgoJz+icpU94S99XsST8oiuvPGh
 fIyA==
X-Gm-Message-State: APjAAAWNhKzuclmR0xY+1MH5UEWOI+lUyeQ5V62/JbRQGW4vTsjfmz98
 pLBrOCJWwEG+f5tjE7pibtJWFA==
X-Google-Smtp-Source: APXvYqxiuy6Py0Q5jzlpt7uYzU5B7HYSxIB1lnaCN0G0+kt5/J1oUyOyFtRJvmBLfiSE5JdJs4h2WA==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr5128572wme.129.1580118464074; 
 Mon, 27 Jan 2020 01:47:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x10sm19636740wrv.60.2020.01.27.01.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 01:47:43 -0800 (PST)
Date: Mon, 27 Jan 2020 10:47:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 15/15] drm/xen: Explicitly disable automatic sending
 of vblank event
Message-ID: <20200127094741.GA43062@phenom.ffwll.local>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123092123.28368-16-tzimmermann@suse.de>
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

On Thu, Jan 23, 2020 at 10:21:23AM +0100, Thomas Zimmermann wrote:
> The atomic helpers automatically send out fake VBLANK events if no
> vblanking has been initialized. This would apply to xen, but xen has
> its own vblank logic. To avoid interfering with the atomic helpers,
> disable automatic vblank events explictly.
> 
> v4:
> 	* separate commit from core vblank changes
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

On all the driver patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/xen/xen_drm_front_kms.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> index 4f34c5208180..efde4561836f 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> @@ -220,6 +220,18 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
>  	return false;
>  }
>  
> +static int display_check(struct drm_simple_display_pipe *pipe,
> +			 struct drm_plane_state *plane_state,
> +			 struct drm_crtc_state *crtc_state)
> +{
> +	/* Make sure that DRM helpers don't send VBLANK events
> +	 * automatically. Xen has it's own logic to do so.
> +	 */
> +	crtc_state->no_vblank = false;

So this here is strictly speaking dead code, because the fake_vblank
helper makes sure to only send out the event if it hasn't been processed
yet.

Which is a bit awkward, since it does this silently, potentially hiding
bugs. We already have a warning that complains if a crtc_state->event
hasn't been processed at all. But with the auto-vblank stuff here we kinda
defeat that a bit ... I think adding a WARN_ON in fake_vblank that fires
if no_vblank is set, but the event is somehow gone, would be really
useful. That would point at some serious driver snafu ...

Care to throw that on top?
-Daniel

> +
> +	return 0;
> +}
> +
>  static void display_update(struct drm_simple_display_pipe *pipe,
>  			   struct drm_plane_state *old_plane_state)
>  {
> @@ -284,6 +296,7 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
>  	.enable = display_enable,
>  	.disable = display_disable,
>  	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.check = display_check,
>  	.update = display_update,
>  };
>  
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
