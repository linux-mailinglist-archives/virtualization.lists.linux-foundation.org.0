Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2A56EC5
	for <lists.virtualization@lfdr.de>; Wed, 26 Jun 2019 18:30:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 05F44C8E;
	Wed, 26 Jun 2019 16:30:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A8922C59
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 16:30:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1248F710
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 16:30:01 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id d4so4104668edr.13
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=pxtWuk1q9NwdLhCWjigp44Ai1m3FAAy67WUlQm2a8yA=;
	b=F9CIevuQHRyHX0Cb4LbioMn7puTjlO57X0AZlpXpUCdNutm0m2aJ7IS0d8M21OWHZK
	+TETAqZTKW1TY9VDnAGJK5hZkd6b7xbLie+HSdTg2DDc63QTHsEvYtwx3R/luOMgj16x
	ehuLvbWfKr7ecteKGqISws5eJ8uiRlMZCBetw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=pxtWuk1q9NwdLhCWjigp44Ai1m3FAAy67WUlQm2a8yA=;
	b=ZnkZuy34ADhKQabTi1YYyHoywPY+6C6q9Z4Wi+IvyO1T1sl7RsMBWb7wzqpD4Ua4ZZ
	81jEP/SF1wkcXJjCrVS360CWQxAc56o7u1hKo9v3yoD0IgtNbgSsUh0CqqxSBXj9WZrB
	MCNkcyokXQ0v0VfY6OK2VuxmrhlydaubYo49Ba5Mnnw4ei6qb6N0tMaywmCkcdtYGxtf
	3NdJRFuNs6NRUmPFxsWPkgH7E3ikB91QKbrMeVJoxcIm937zGaoTMJfryNCG4AjYKMuu
	fzgYb5iwh4md1LGc4p7hWFHe++8NzcQvXM5s3ZC1GHyOAgg27pq+SvcI/XqyxLTylJ30
	SBzQ==
X-Gm-Message-State: APjAAAVs9GZIi/M9B45aA4IODqtOGAX15PsSG9+WewKXCv7OMU4GrSef
	RfQfexx3ThxQdZ/B9mWQ67nvTA==
X-Google-Smtp-Source: APXvYqw14KV/pLRZOsgSJp+IRx5aZGACL1k4TeWcmneUTB28zjQgI7qKkEuffGFS5EHv4rTsmQzyaA==
X-Received: by 2002:a50:b4fd:: with SMTP id x58mr6357100edd.97.1561566600740; 
	Wed, 26 Jun 2019 09:30:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id g7sm5884310eda.52.2019.06.26.09.29.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 26 Jun 2019 09:29:59 -0700 (PDT)
Date: Wed, 26 Jun 2019 18:29:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/2] drm/bochs: fix framebuffer setup.
Message-ID: <20190626162957.GW12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	David Airlie <airlied@linux.ie>,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190626065551.12956-1-kraxel@redhat.com>
	<20190626065551.12956-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626065551.12956-3-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
	open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, Jun 26, 2019 at 08:55:51AM +0200, Gerd Hoffmann wrote:
> If bo->width doesn't match fb->width the driver fails to configure
> the display correctly, resulting in a scrambled display.  Fix it.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/bochs/bochs.h     |  2 +-
>  drivers/gpu/drm/bochs/bochs_hw.c  | 13 +++++++++----
>  drivers/gpu/drm/bochs/bochs_kms.c |  1 +
>  3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
> index cc35d492142c..78c0283496cc 100644
> --- a/drivers/gpu/drm/bochs/bochs.h
> +++ b/drivers/gpu/drm/bochs/bochs.h
> @@ -86,7 +86,7 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>  void bochs_hw_setformat(struct bochs_device *bochs,
>  			const struct drm_format_info *format);
>  void bochs_hw_setbase(struct bochs_device *bochs,
> -		      int x, int y, u64 addr);
> +		      int x, int y, int fbwidth, u64 addr);
>  int bochs_hw_load_edid(struct bochs_device *bochs);
>  
>  /* bochs_mm.c */
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
> index 791ab2f79947..141aa02962d3 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -255,16 +255,21 @@ void bochs_hw_setformat(struct bochs_device *bochs,
>  }
>  
>  void bochs_hw_setbase(struct bochs_device *bochs,
> -		      int x, int y, u64 addr)
> +		      int x, int y, int fbwidth, u64 addr)
>  {
> -	unsigned long offset = (unsigned long)addr +
> +	unsigned long offset;
> +	unsigned int vx, vy;
> +
> +	bochs->stride = fbwidth * (bochs->bpp / 8);
> +	offset = (unsigned long)addr +
>  		y * bochs->stride +
>  		x * (bochs->bpp / 8);
> -	int vy = offset / bochs->stride;
> -	int vx = (offset % bochs->stride) * 8 / bochs->bpp;
> +	vy = offset / bochs->stride;
> +	vx = (offset % bochs->stride) * 8 / bochs->bpp;
>  
>  	DRM_DEBUG_DRIVER("x %d, y %d, addr %llx -> offset %lx, vx %d, vy %d\n",
>  			 x, y, addr, offset, vx, vy);
> +	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH, fbwidth);
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET, vx);
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET, vy);
>  }
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 5904eddc83a5..1f6aa11a1dc9 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -36,6 +36,7 @@ static void bochs_plane_update(struct bochs_device *bochs,
>  	bochs_hw_setbase(bochs,
>  			 state->crtc_x,
>  			 state->crtc_y,
> +			 gbo->width,

You want the dimensions of the drm_framebuffer here, not something from
the underlying gem bo.

>  			 gbo->bo.offset);

I think same here, or at least additionally take into account both
drm_framebuffer offset _and_ vram offset.
-Daniel

>  	bochs_hw_setformat(bochs, state->fb->format);
>  }
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
