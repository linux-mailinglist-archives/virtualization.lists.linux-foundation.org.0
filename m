Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE11FBBC
	for <lists.virtualization@lfdr.de>; Tue, 30 Apr 2019 16:41:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D9B7A1A07;
	Tue, 30 Apr 2019 14:41:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8758419CD
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 14:41:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A04EE711
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 14:41:21 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w11so5809547edl.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 07:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LB5F0b9HJ31bVnKaHqjgh/M8/61z+/bLZG4VI3ssMfI=;
	b=aRkEdKXpB6WiDnjK/DjswWqieymX/zB2XI9uwwsrWkBaB7KBTM/j+AY5UrEoE/jybj
	OapcHqLXXy79VqKllyNdakURyEcLMrhL1QpWxXgeecF2vHz41gGcAcZOObiYCOq0DWiz
	NlWCzxLPpPu28eTzdk7mElRmwfk+Td5QP/UYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LB5F0b9HJ31bVnKaHqjgh/M8/61z+/bLZG4VI3ssMfI=;
	b=ijEj42/fgK9FYXKY7Fy48LVZFvWfcD/k1GFsQPAC+bQ/7QUX8EgExWBJVV0FsCMXWq
	lZFEni6DJtYwA5KySzZFSEwnPSAqfq5U68CyTl/2KJq6JJoU2I9SyD3HE9+Fi5XXfA8Z
	ASuxpEEmwO/4nGaUfoBHctzn49Z8XLYoW5mOT3eYqjOUMRuDTCAkG5/v7HzD/wtp9imD
	LriXTGdihsU/mgrJLRMGY81sYZxsDgRvHgJk3PEWvoz2G6p6wTO0LI06u5viSK6ViTWE
	0rNI0K0M7S/duPeofGczzSbIH2B3h0nXll/t0gRZR3afXuBHzAs5irMAkHYJsGC6nwIZ
	NXcg==
X-Gm-Message-State: APjAAAVFEus1r4ckCRdbWaCJ5z2qwAn65vpRDRZDTnpS3o69iAOuIbXr
	W8Cz+tzMbTeYMkM4WbcOapBzyw==
X-Google-Smtp-Source: APXvYqysJKMXdtHasFAQ0lFt94YygW4MhbTKSN743uY1xbLlrhS5gMdCFgJIGm7VK21Yqgcwz8xvWg==
X-Received: by 2002:a50:86c4:: with SMTP id 4mr20861869edu.172.1556635280278; 
	Tue, 30 Apr 2019 07:41:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	g14sm6363165ejs.49.2019.04.30.07.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 07:41:19 -0700 (PDT)
Date: Tue, 30 Apr 2019 16:41:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 15/19] drm/mgag200: Replace mapping code with
	drm_gem_vram_{kmap/kunmap}()
Message-ID: <20190430144115.GY3271@phenom.ffwll.local>
References: <20190429144341.12615-1-tzimmermann@suse.de>
	<20190429144341.12615-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429144341.12615-16-tzimmermann@suse.de>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	daniel@ffwll.ch, zourongrong@gmail.com, Jerry.Zhang@amd.com,
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

On Mon, Apr 29, 2019 at 04:43:37PM +0200, Thomas Zimmermann wrote:
> The mgag200 driver establishes several memory mappings for frame buffers
> and cursors. This patch converts the driver to use the equivalent
> drm_gem_vram_kmap() functions. It removes the dependencies on TTM
> and cleans up the code.

s-o-b missing here.
-Daniel

> ---
>  drivers/gpu/drm/mgag200/mgag200_cursor.c | 35 +++++++++++-------------
>  drivers/gpu/drm/mgag200/mgag200_drv.h    |  1 -
>  drivers/gpu/drm/mgag200/mgag200_fb.c     | 22 +++++++++------
>  drivers/gpu/drm/mgag200/mgag200_mode.c   |  9 ++++--
>  4 files changed, 36 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> index cca3922f9f67..6c1a9d724d85 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> @@ -43,6 +43,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
>  	struct drm_gem_object *obj;
>  	struct drm_gem_vram_object *gbo = NULL;
>  	int ret = 0;
> +	u8 *src, *dst;
>  	unsigned int i, row, col;
>  	uint32_t colour_set[16];
>  	uint32_t *next_space = &colour_set[0];
> @@ -126,18 +127,17 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
>  		dev_err(&dev->pdev->dev, "failed to reserve user bo\n");
>  		goto out1;
>  	}
> -	if (!gbo->kmap.virtual) {
> -		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
> -		if (ret) {
> -			dev_err(&dev->pdev->dev, "failed to kmap user buffer updates\n");
> -			goto out2;
> -		}
> +	src = drm_gem_vram_kmap(gbo, true, NULL);
> +	if (IS_ERR(src)) {
> +		ret = PTR_ERR(src);
> +		dev_err(&dev->pdev->dev, "failed to kmap user buffer updates\n");
> +		goto out2;
>  	}
>  
>  	memset(&colour_set[0], 0, sizeof(uint32_t)*16);
>  	/* width*height*4 = 16384 */
>  	for (i = 0; i < 16384; i += 4) {
> -		this_colour = ioread32(gbo->kmap.virtual + i);
> +		this_colour = ioread32(src + i);
>  		/* No transparency */
>  		if (this_colour>>24 != 0xff &&
>  			this_colour>>24 != 0x0) {
> @@ -189,21 +189,18 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
>  	}
>  
>  	/* Map up-coming buffer to write colour indices */
> -	if (!pixels_prev->kmap.virtual) {
> -		ret = ttm_bo_kmap(&pixels_prev->bo, 0,
> -				  pixels_prev->bo.num_pages,
> -				  &pixels_prev->kmap);
> -		if (ret) {
> -			dev_err(&dev->pdev->dev, "failed to kmap cursor updates\n");
> -			goto out3;
> -		}
> +	dst = drm_gem_vram_kmap(pixels_prev, true, NULL);
> +	if (IS_ERR(dst)) {
> +		ret = PTR_ERR(dst);
> +		dev_err(&dev->pdev->dev, "failed to kmap cursor updates\n");
> +		goto out3;
>  	}
>  
>  	/* now write colour indices into hardware cursor buffer */
>  	for (row = 0; row < 64; row++) {
>  		memset(&this_row[0], 0, 48);
>  		for (col = 0; col < 64; col++) {
> -			this_colour = ioread32(gbo->kmap.virtual + 4*(col + 64*row));
> +			this_colour = ioread32(src + 4*(col + 64*row));
>  			/* write transparent pixels */
>  			if (this_colour>>24 == 0x0) {
>  				this_row[47 - col/8] |= 0x80>>(col%8);
> @@ -221,7 +218,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
>  				}
>  			}
>  		}
> -		memcpy_toio(pixels_prev->kmap.virtual + row*48, &this_row[0], 48);
> +		memcpy_toio(dst + row*48, &this_row[0], 48);
>  	}
>  
>  	/* Program gpu address of cursor buffer */
> @@ -247,9 +244,9 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
>  	}
>  	ret = 0;
>  
> -	ttm_bo_kunmap(&pixels_prev->kmap);
> +	drm_gem_vram_kunmap(pixels_prev);
>   out3:
> -	ttm_bo_kunmap(&gbo->kmap);
> +	drm_gem_vram_kunmap(gbo);
>   out2:
>  	drm_gem_vram_unreserve(gbo);
>   out1:
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 16ce6b338dce..6180acbca7ca 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -115,7 +115,6 @@ struct mga_fbdev {
>  	struct mga_framebuffer mfb;
>  	void *sysram;
>  	int size;
> -	struct ttm_bo_kmap_obj mapping;
>  	int x1, y1, x2, y2; /* dirty rect */
>  	spinlock_t dirty_lock;
>  };
> diff --git a/drivers/gpu/drm/mgag200/mgag200_fb.c b/drivers/gpu/drm/mgag200/mgag200_fb.c
> index 508ec2dddbba..7c457dad5d9e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_fb.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_fb.c
> @@ -27,6 +27,7 @@ static void mga_dirty_update(struct mga_fbdev *mfbdev,
>  	int src_offset, dst_offset;
>  	int bpp = mfbdev->mfb.base.format->cpp[0];
>  	int ret = -EBUSY;
> +	u8 *dst;
>  	bool unmap = false;
>  	bool store_for_later = false;
>  	int x2, y2;
> @@ -75,24 +76,29 @@ static void mga_dirty_update(struct mga_fbdev *mfbdev,
>  	mfbdev->x2 = mfbdev->y2 = 0;
>  	spin_unlock_irqrestore(&mfbdev->dirty_lock, flags);
>  
> -	if (!gbo->kmap.virtual) {
> -		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
> -		if (ret) {
> +	dst = drm_gem_vram_kmap(gbo, false, NULL);
> +	if (IS_ERR(dst)) {
> +		DRM_ERROR("failed to kmap fb updates\n");
> +		goto out;
> +	} else if (!dst) {
> +		dst = drm_gem_vram_kmap(gbo, true, NULL);
> +		if (IS_ERR(dst)) {
>  			DRM_ERROR("failed to kmap fb updates\n");
> -			drm_gem_vram_unreserve(gbo);
> -			return;
> +			goto out;
>  		}
>  		unmap = true;
>  	}
> +
>  	for (i = y; i <= y2; i++) {
>  		/* assume equal stride for now */
>  		src_offset = dst_offset = i * mfbdev->mfb.base.pitches[0] + (x * bpp);
> -		memcpy_toio(gbo->kmap.virtual + src_offset, mfbdev->sysram + src_offset, (x2 - x + 1) * bpp);
> -
> +		memcpy_toio(dst + dst_offset, mfbdev->sysram + src_offset, (x2 - x + 1) * bpp);
>  	}
> +
>  	if (unmap)
> -		ttm_bo_kunmap(&gbo->kmap);
> +		drm_gem_vram_kunmap(gbo);
>  
> +out:
>  	drm_gem_vram_unreserve(gbo);
>  }
>  
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index ddec2c485381..769ace139377 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -870,6 +870,7 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
>  	struct drm_gem_vram_object *gbo;
>  	int ret;
>  	s64 gpu_addr;
> +	void* base;
>  
>  	/* push the previous fb to system ram */
>  	if (!atomic && fb) {
> @@ -902,11 +903,13 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
>  
>  	if (&mdev->mfbdev->mfb == mga_fb) {
>  		/* if pushing console in kmap it */
> -		ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, &gbo->kmap);
> -		if (ret)
> +		base = drm_gem_vram_kmap(gbo, true, NULL);
> +		if (IS_ERR(base)) {
> +			ret = PTR_ERR(base);
>  			DRM_ERROR("failed to kmap fbcon\n");
> -
> +		}
>  	}
> +
>  	drm_gem_vram_unreserve(gbo);
>  
>  	mga_set_start_address(crtc, (u32)gpu_addr);
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
