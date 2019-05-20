Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4396723D18
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 18:19:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DE0CAE6E;
	Mon, 20 May 2019 16:19:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D9A0AE57
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 16:19:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BB3337ED
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 16:19:04 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id w11so24683323edl.5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 09:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sOUxMhvGUst9mmlcWrfedwiZFP4mpETUNGCC6yWZnv8=;
	b=c01NMuMYIASiG2rq9lIkhm5r9dqnOkOK1jwxPv1lBYW0vs/vK8bUunTmTzoZLBH5Bv
	2eShmIDn33t6ljpUQ41VuUkAfrsEUXvObZd2IxZYBk3wdlwJ6F+q7DmABju/g/ZRyzcj
	8az4SQeB2e7Pt90kd0q+LRdo40Wuxi2XUvZ2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sOUxMhvGUst9mmlcWrfedwiZFP4mpETUNGCC6yWZnv8=;
	b=QtINHqxi+q0ngQiWRPLX/7Ps99QklyrFA5S+SNKK4PZYHojWlcou5r4l1wV9CUw5mV
	ncgq24IDXcFLaGA1Z9FoABvI0AsYCVHIdmw0N58QP8Et49y94VLbvYKR6dpbecJJwu/l
	ACGqlkSUGkrsiEegXLS5/3EU7xM2ZV3qoADkqxnXdrlkF173IqQFYJl7YvnTJD2dgn0r
	J/9A1bUfjw3ZB3nzaDvUafYNkdlG96BLr9tyKoiFl2qCQT0IsAXIT8VqS+K+TjJA5mt1
	rju3mxF5J2aRxh3I02m57zABUSr8QwNeMxCmrUiI9PXS2RDTc59+2oMpWVgDmysP3ieT
	bEKw==
X-Gm-Message-State: APjAAAWTka1BeML9KsF8WilJCPo+ZDOtNY2jhIRVugkT+YguuR3ebElB
	pJ+NG/s7ZtKtQORhD/tTg0MM2g==
X-Google-Smtp-Source: APXvYqzZ6a3bXXaTk8mu9BRowP8OJQg7X1IxVLxuB23EoTvXBuBqUZEb2FhAmCOFLHivGOQ/Qz1lAQ==
X-Received: by 2002:a17:906:2e55:: with SMTP id
	r21mr49707133eji.88.1558369143198; 
	Mon, 20 May 2019 09:19:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id u1sm1923449ejz.92.2019.05.20.09.19.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 09:19:02 -0700 (PDT)
Date: Mon, 20 May 2019 18:19:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm: Add drm_gem_vram_{pin/unpin}_reserved() and
	convert mgag200
Message-ID: <20190520161900.GB21222@phenom.ffwll.local>
References: <20190516162746.11636-1-tzimmermann@suse.de>
	<20190516162746.11636-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516162746.11636-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: noralf@tronnes.org, airlied@linux.ie, puck.chen@hisilicon.com,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	daniel@ffwll.ch, zourongrong@gmail.com, sam@ravnborg.org,
	christian.koenig@amd.com
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

On Thu, May 16, 2019 at 06:27:45PM +0200, Thomas Zimmermann wrote:
> The new interfaces drm_gem_vram_{pin/unpin}_reserved() are variants of the
> GEM VRAM pin/unpin functions that do not reserve the BO during validation.
> The mgag200 driver requires this behavior for its cursor handling. The
> patch also converts the driver to use the new interfaces.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c    | 75 ++++++++++++++++++++++++
>  drivers/gpu/drm/mgag200/mgag200_cursor.c | 18 +++---
>  include/drm/drm_gem_vram_helper.h        |  3 +
>  3 files changed, 88 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 8f142b810eb4..a002c03eaf4c 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -254,6 +254,47 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_pin);
>  
> +/**
> + * drm_gem_vram_pin_reserved() - Pins a GEM VRAM object in a region.
> + * @gbo:	the GEM VRAM object
> + * @pl_flag:	a bitmask of possible memory regions
> + *
> + * Pinning a buffer object ensures that it is not evicted from
> + * a memory region. A pinned buffer object has to be unpinned before
> + * it can be pinned to another region.
> + *
> + * This function pins a GEM VRAM object that has already been
> + * reserved. Use drm_gem_vram_pin() if possible.
> + *
> + * Returns:
> + * 0 on success, or
> + * a negative error code otherwise.
> + */
> +int drm_gem_vram_pin_reserved(struct drm_gem_vram_object *gbo,
> +			      unsigned long pl_flag)
> +{
> +	int i, ret;
> +	struct ttm_operation_ctx ctx = { false, false };

I think would be good to have a lockdep_assert_held here for the ww_mutex.

Also general thing: _reserved is kinda ttm lingo, for dma-buf reservations
we call the structure tracking the fences+lock the "reservation", but the
naming scheme used is _lock/_unlock.

I think would be good to be consistent with that, and use _locked here.
Especially for a very simplified vram helper like this one I expect that's
going to lead to less wtf moments by driver writers :-)

Maybe we should also do a large-scale s/reserve/lock/ within ttm, to align
more with what we now have in dma-buf.

Cheers, Daniel

> +
> +	if (gbo->pin_count) {
> +		++gbo->pin_count;
> +		return 0;
> +	}
> +
> +	drm_gem_vram_placement(gbo, pl_flag);
> +	for (i = 0; i < gbo->placement.num_placement; ++i)
> +		gbo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
> +
> +	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	gbo->pin_count = 1;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gem_vram_pin_reserved);
> +
>  /**
>   * drm_gem_vram_unpin() - Unpins a GEM VRAM object
>   * @gbo:	the GEM VRAM object
> @@ -285,6 +326,40 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_unpin);
>  
> +/**
> + * drm_gem_vram_unpin_reserved() - Unpins a GEM VRAM object
> + * @gbo:	the GEM VRAM object
> + *
> + * This function unpins a GEM VRAM object that has already been
> + * reserved. Use drm_gem_vram_unpin() if possible.
> + *
> + * Returns:
> + * 0 on success, or
> + * a negative error code otherwise.
> + */
> +int drm_gem_vram_unpin_reserved(struct drm_gem_vram_object *gbo)
> +{
> +	int i, ret;
> +	struct ttm_operation_ctx ctx = { false, false };
> +
> +	if (WARN_ON_ONCE(!gbo->pin_count))
> +		return 0;
> +
> +	--gbo->pin_count;
> +	if (gbo->pin_count)
> +		return 0;
> +
> +	for (i = 0; i < gbo->placement.num_placement ; ++i)
> +		gbo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
> +
> +	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gem_vram_unpin_reserved);
> +
>  /**
>   * drm_gem_vram_push_to_system() - \
>  	Unpins a GEM VRAM object and moves it to system memory
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> index 6c1a9d724d85..1c4fc85315a0 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> @@ -23,9 +23,9 @@ static void mga_hide_cursor(struct mga_device *mdev)
>  	WREG8(MGA_CURPOSXL, 0);
>  	WREG8(MGA_CURPOSXH, 0);
>  	if (mdev->cursor.pixels_1->pin_count)
> -		drm_gem_vram_unpin(mdev->cursor.pixels_1);
> +		drm_gem_vram_unpin_reserved(mdev->cursor.pixels_1);
>  	if (mdev->cursor.pixels_2->pin_count)
> -		drm_gem_vram_unpin(mdev->cursor.pixels_2);
> +		drm_gem_vram_unpin_reserved(mdev->cursor.pixels_2);
>  }
>  
>  int mga_crtc_cursor_set(struct drm_crtc *crtc,
> @@ -96,26 +96,28 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
>  
>  	/* Move cursor buffers into VRAM if they aren't already */
>  	if (!pixels_1->pin_count) {
> -		ret = drm_gem_vram_pin(pixels_1, DRM_GEM_VRAM_PL_FLAG_VRAM);
> +		ret = drm_gem_vram_pin_reserved(pixels_1,
> +						DRM_GEM_VRAM_PL_FLAG_VRAM);
>  		if (ret)
>  			goto out1;
>  		gpu_addr = drm_gem_vram_offset(pixels_1);
>  		if (gpu_addr < 0) {
> -			drm_gem_vram_unpin(pixels_1);
> +			drm_gem_vram_unpin_reserved(pixels_1);
>  			goto out1;
>  		}
>  		mdev->cursor.pixels_1_gpu_addr = gpu_addr;
>  	}
>  	if (!pixels_2->pin_count) {
> -		ret = drm_gem_vram_pin(pixels_2, DRM_GEM_VRAM_PL_FLAG_VRAM);
> +		ret = drm_gem_vram_pin_reserved(pixels_2,
> +						DRM_GEM_VRAM_PL_FLAG_VRAM);
>  		if (ret) {
> -			drm_gem_vram_unpin(pixels_1);
> +			drm_gem_vram_unpin_reserved(pixels_1);
>  			goto out1;
>  		}
>  		gpu_addr = drm_gem_vram_offset(pixels_2);
>  		if (gpu_addr < 0) {
> -			drm_gem_vram_unpin(pixels_1);
> -			drm_gem_vram_unpin(pixels_2);
> +			drm_gem_vram_unpin_reserved(pixels_1);
> +			drm_gem_vram_unpin_reserved(pixels_2);
>  			goto out1;
>  		}
>  		mdev->cursor.pixels_2_gpu_addr = gpu_addr;
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index b056f189ba62..ff1a81761543 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -82,7 +82,10 @@ void drm_gem_vram_unreserve(struct drm_gem_vram_object *gbo);
>  u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
>  s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
>  int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
> +int drm_gem_vram_pin_reserved(struct drm_gem_vram_object *gbo,
> +			      unsigned long pl_flag);
>  int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
> +int drm_gem_vram_unpin_reserved(struct drm_gem_vram_object *gbo);
>  int drm_gem_vram_push_to_system(struct drm_gem_vram_object *gbo);
>  void *drm_gem_vram_kmap_at(struct drm_gem_vram_object *gbo, bool map,
>  			   bool *is_iomem, struct ttm_bo_kmap_obj *kmap);
> -- 
> 2.21.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
