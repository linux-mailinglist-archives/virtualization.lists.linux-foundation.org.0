Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C91CF57ECB
	for <lists.virtualization@lfdr.de>; Thu, 27 Jun 2019 10:59:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4856AC4E;
	Thu, 27 Jun 2019 08:59:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7A0BBBA4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 08:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B723A710
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 08:59:05 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id z25so6304333edq.9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LGczOakCSLer9ILQE8tNaqgNPozV8pb7PqeHtCzn1g0=;
	b=GsJ767+Bz59YQxnCnFMvFcSYh9soByANcFXUQ+dxUx5Q/FTIOZmR4kAWwuk9/HT1Gi
	raBZ4yVpCvC1kmTcyiq97Fnn6tEjrLxXJryKVmWHYVVzhGFre9eg61bQxVCoeFBrPx5W
	nbFSeFVId7v0Y/+FBuoxSRqzo2aQP3RbWafpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=LGczOakCSLer9ILQE8tNaqgNPozV8pb7PqeHtCzn1g0=;
	b=E14GW9ZDhu1FjdPloIEg4pG9bYKgSIVaIQM16Pvgx8EYfZp1rTVACeNGmZwqdn/t2C
	2+hzlmwiBF+IwvCJFCDwTbcNvMFJvMhCxULtlPeymVhzlsJMml87PcFXaW+PSU5qE0Rq
	jKBpAS5soDoopEPqJ1kxwfeRKZLhhBt5epj5nVS8W0nQbsSb3VhMJ8nn1Ll/r2gM1Yqc
	xZwd4KTTxPEH3+DbEaQllJcnvY6LFk4fdGwcD2nTS5fkAPGRLqxwe4pXeghaqIGvBQT/
	/mGy4kSo0wSHo83fSZUyECx57SR65GRP4NScFcGeKtDYWZ+CdHeG5VNsbAG6qkK0jUxH
	w8CQ==
X-Gm-Message-State: APjAAAU37bWGP6XSRDYOIa1krlxVSddxYkxGbze+XMssUPLpE3Fr4x66
	oJWY5WIvzdHCbOO1HwcVEVRCQw==
X-Google-Smtp-Source: APXvYqztF4cKNAF9DjpaD52JmFXj0BdZd5GbwscnxOS6ZW0fc4x9KnKm97t+ztQ3ANKwIhFX1OJPwA==
X-Received: by 2002:a17:906:2f0b:: with SMTP id
	v11mr1993434eji.200.1561625944030; 
	Thu, 27 Jun 2019 01:59:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id s26sm309794eja.81.2019.06.27.01.59.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 01:59:03 -0700 (PDT)
Date: Thu, 27 Jun 2019 10:59:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/bochs: fix framebuffer setup.
Message-ID: <20190627085900.GI12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	David Airlie <airlied@linux.ie>,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190627081206.23135-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627081206.23135-1-kraxel@redhat.com>
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

On Thu, Jun 27, 2019 at 10:12:06AM +0200, Gerd Hoffmann wrote:
> The driver doesn't consider framebuffer pitch and offset, leading to a
> wrong display in case offset != 0 or pitch != width * bpp.  Fix it.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Yeah this looks more like it.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/bochs/bochs.h     |  2 +-
>  drivers/gpu/drm/bochs/bochs_hw.c  | 14 ++++++++++----
>  drivers/gpu/drm/bochs/bochs_kms.c |  3 ++-
>  3 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
> index cc35d492142c..2a65434500ee 100644
> --- a/drivers/gpu/drm/bochs/bochs.h
> +++ b/drivers/gpu/drm/bochs/bochs.h
> @@ -86,7 +86,7 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>  void bochs_hw_setformat(struct bochs_device *bochs,
>  			const struct drm_format_info *format);
>  void bochs_hw_setbase(struct bochs_device *bochs,
> -		      int x, int y, u64 addr);
> +		      int x, int y, int stride, u64 addr);
>  int bochs_hw_load_edid(struct bochs_device *bochs);
>  
>  /* bochs_mm.c */
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
> index 791ab2f79947..ebfea8744fe6 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -255,16 +255,22 @@ void bochs_hw_setformat(struct bochs_device *bochs,
>  }
>  
>  void bochs_hw_setbase(struct bochs_device *bochs,
> -		      int x, int y, u64 addr)
> +		      int x, int y, int stride, u64 addr)
>  {
> -	unsigned long offset = (unsigned long)addr +
> +	unsigned long offset;
> +	unsigned int vx, vy, vwidth;
> +
> +	bochs->stride = stride;

Might be nice to ditch these global/not-so-atomic things like
bochs->stride/bpp eventually.
-Daniel

> +	offset = (unsigned long)addr +
>  		y * bochs->stride +
>  		x * (bochs->bpp / 8);
> -	int vy = offset / bochs->stride;
> -	int vx = (offset % bochs->stride) * 8 / bochs->bpp;
> +	vy = offset / bochs->stride;
> +	vx = (offset % bochs->stride) * 8 / bochs->bpp;
> +	vwidth = stride * 8 / bochs->bpp;
>  
>  	DRM_DEBUG_DRIVER("x %d, y %d, addr %llx -> offset %lx, vx %d, vy %d\n",
>  			 x, y, addr, offset, vx, vy);
> +	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH, vwidth);
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET, vx);
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET, vy);
>  }
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 5904eddc83a5..bc19dbd531ef 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -36,7 +36,8 @@ static void bochs_plane_update(struct bochs_device *bochs,
>  	bochs_hw_setbase(bochs,
>  			 state->crtc_x,
>  			 state->crtc_y,
> -			 gbo->bo.offset);
> +			 state->fb->pitches[0],
> +			 state->fb->offsets[0] + gbo->bo.offset);
>  	bochs_hw_setformat(bochs, state->fb->format);
>  }
>  
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
