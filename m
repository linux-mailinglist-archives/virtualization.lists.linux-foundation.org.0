Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1312D7333
	for <lists.virtualization@lfdr.de>; Fri, 11 Dec 2020 10:57:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1500885FA2;
	Fri, 11 Dec 2020 09:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSDDgzytPDdq; Fri, 11 Dec 2020 09:57:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C4B485FA3;
	Fri, 11 Dec 2020 09:57:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3D27C013B;
	Fri, 11 Dec 2020 09:57:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BAEFC013B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 09:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9380185FC1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 09:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1Y0-4Kz8Xxd
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 09:57:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AD97185FC6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 09:57:06 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a6so7020213wmc.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 01:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xNFrCL3oslsHC0LPH66qb20IOnNLuZTuJpRHZ2dK56c=;
 b=hQOdGih/C3Eftq42nXDH0tuLGEHXPQimo3YJkJjh88Cz4pg++npVLL1C70HqS3p8JC
 Tet4F1nBk8S8TsPLxmZU7/NstGhKgA5FEC/bJGk3klN3B496WvfOUTNtvOGIEuRjeRL0
 3+ejZOI96xQ+/osY4B8j7eWnELoxcBBRFSZtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xNFrCL3oslsHC0LPH66qb20IOnNLuZTuJpRHZ2dK56c=;
 b=uVTSGCAHiWyuEAe/kbVcpvIHtSVhSLf4xGln3keIs7rs7BGb3sWMC2OjOc6RndUKcV
 nxemDkg+gKPTcajMwz+GKULwj/jKTQhcNsLc6H0k0Y8EV5NCtPpTp3cqxGKwbnSyfyum
 T7wE0mB81anLgpacLo5XLijlWNo2E/6EfZqcPS2PfirF1I3BTHN9lJg36nGsiNhEQbZW
 EKG1O8P4nnqaOy0x+gfzSWOLqPgshSaoni/jbQ5h0rC18YeTbN/VTWCWeAZTVtYcbE4t
 rpspLsqYq+cuWpf8vFQ7T50Vz/FVTAhk/+vvVLMaS/MtTbjDrZ8J5V5CgNaXwk2IyVyO
 tfng==
X-Gm-Message-State: AOAM532kQBp1qPKGUBvZD4ZZsfv/qVcSQDQT66i+NrIvLynpuqg2mj23
 2uWDu8Vi1O1/iJRCsH1oqYgR7A==
X-Google-Smtp-Source: ABdhPJxPXM6I1Znc1JEoUbjT40+oOjkJXbNKGcRMopHVN+SIEkxXLW4JLMp2hlW6VSMa+Q/eslvY8g==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr12685159wmh.51.1607680625002; 
 Fri, 11 Dec 2020 01:57:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v1sm13209944wrr.48.2020.12.11.01.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 01:57:04 -0800 (PST)
Date: Fri, 11 Dec 2020 10:57:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 7/8] drm/vram-helper: Provide a vmap function for
 short-term mappings
Message-ID: <20201211095702.GM401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209142527.26415-8-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Cc: eric@anholt.net, airlied@linux.ie, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, daniel@ffwll.ch,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 christian.koenig@amd.com, linux-media@vger.kernel.org
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

On Wed, Dec 09, 2020 at 03:25:26PM +0100, Thomas Zimmermann wrote:
> Implementations of the vmap/vunmap GEM callbacks may perform pinning
> of the BO and may acquire the associated reservation object's lock.
> It's somewhat inconvenient to callers that simply require a mapping of
> the contained memory; and also ipmplies a certain overhead.
> 
> Therefore provide drm_gem_vram_vmap_local() drm_gem_vram_vunmap_local(),
> which only perform the vmap/vunmap operations. Callers have to hold the
> reservation lock while the mapping persists; or have to pin the BO by
> themselves.
> 
> The affected callers are cursor updates in ast and vboxvideo. Both
> are being changed to the new interface.
> 
> This patch connects GEM VRAM helpers to GEM object functions with
> equivalent functionality.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_cursor.c      |  37 +++++--

Again I'd split out the driver parts. I didn't come up with a hard
functional reason for this though.

>  drivers/gpu/drm/drm_gem_vram_helper.c | 142 +++++++++++++++++---------
>  drivers/gpu/drm/vboxvideo/vbox_mode.c |  15 +--
>  include/drm/drm_gem_vram_helper.h     |   2 +
>  4 files changed, 132 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index fac1ee79c372..c38f435bcde2 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -159,6 +159,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
>  	struct drm_device *dev = &ast->base;
>  	struct drm_gem_vram_object *dst_gbo = ast->cursor.gbo[ast->cursor.next_index];
>  	struct drm_gem_vram_object *src_gbo = drm_gem_vram_of_gem(fb->obj[0]);
> +	struct drm_gem_object *objs[] = {&src_gbo->bo.base, &dst_gbo->bo.base};
> +	struct ww_acquire_ctx ctx;
>  	struct dma_buf_map src_map, dst_map;
>  	void __iomem *dst;
>  	void *src;
> @@ -168,26 +170,34 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
>  	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
>  		return -EINVAL;
>  
> -	ret = drm_gem_vram_vmap(src_gbo, &src_map);
> +	ret = drm_gem_lock_reservations(objs, ARRAY_SIZE(objs), &ctx);
>  	if (ret)
>  		return ret;
> +
> +	ret = drm_gem_vram_vmap_local(src_gbo, &src_map);
> +	if (ret)
> +		goto err_drm_gem_unlock_reservations;
>  	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
>  
> -	ret = drm_gem_vram_vmap(dst_gbo, &dst_map);
> +	ret = drm_gem_vram_vmap_local(dst_gbo, &dst_map);
>  	if (ret)
> -		goto err_drm_gem_vram_vunmap;
> +		goto err_drm_gem_vram_vunmap_local;
>  	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
>  
>  	/* do data transfer to cursor BO */
>  	update_cursor_image(dst, src, fb->width, fb->height);
>  
> -	drm_gem_vram_vunmap(dst_gbo, &dst_map);
> -	drm_gem_vram_vunmap(src_gbo, &src_map);
> +	drm_gem_vram_vunmap_local(dst_gbo, &dst_map);
> +	drm_gem_vram_vunmap_local(src_gbo, &src_map);
> +
> +	drm_gem_unlock_reservations(objs, ARRAY_SIZE(objs), &ctx);
>  
>  	return 0;
>  
> -err_drm_gem_vram_vunmap:
> -	drm_gem_vram_vunmap(src_gbo, &src_map);
> +err_drm_gem_vram_vunmap_local:
> +	drm_gem_vram_vunmap_local(src_gbo, &src_map);
> +err_drm_gem_unlock_reservations:
> +	drm_gem_unlock_reservations(objs, ARRAY_SIZE(objs), &ctx);
>  	return ret;
>  }
>  
> @@ -241,6 +251,7 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
>  {
>  	struct drm_device *dev = &ast->base;
>  	struct drm_gem_vram_object *gbo = ast->cursor.gbo[ast->cursor.next_index];
> +	struct drm_gem_object *obj = &gbo->bo.base;
>  	struct dma_buf_map map;
>  	u8 x_offset, y_offset;
>  	u8 __iomem *dst;
> @@ -248,16 +259,22 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
>  	u8 jreg;
>  	int ret;
>  
> -	ret = drm_gem_vram_vmap(gbo, &map);
> -	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret))
> +	ret = dma_resv_lock(obj->resv, NULL);
> +	if (ret)
> +		return;
> +	ret = drm_gem_vram_vmap_local(gbo, &map);
> +	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap_local() failed, ret=%d\n", ret)) {
> +		dma_resv_unlock(obj->resv);
>  		return;
> +	}
>  	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
>  
>  	sig = dst + AST_HWC_SIZE;
>  	writel(x, sig + AST_HWC_SIGNATURE_X);
>  	writel(y, sig + AST_HWC_SIGNATURE_Y);
>  
> -	drm_gem_vram_vunmap(gbo, &map);
> +	drm_gem_vram_vunmap_local(gbo, &map);
> +	dma_resv_unlock(obj->resv);
>  
>  	if (x < 0) {
>  		x_offset = (-x) + offset_x;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 02ca22e90290..08a713993896 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -379,47 +379,6 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_unpin);
>  
> -static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
> -				    struct dma_buf_map *map)
> -{
> -	int ret;
> -
> -	if (gbo->vmap_use_count > 0)
> -		goto out;
> -
> -	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
> -	if (ret)
> -		return ret;
> -
> -out:
> -	++gbo->vmap_use_count;
> -	*map = gbo->map;
> -
> -	return 0;
> -}
> -
> -static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
> -				       struct dma_buf_map *map)
> -{
> -	struct drm_device *dev = gbo->bo.base.dev;
> -
> -	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
> -		return;
> -
> -	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
> -		return; /* BUG: map not mapped from this BO */
> -
> -	if (--gbo->vmap_use_count > 0)
> -		return;
> -
> -	/*
> -	 * Permanently mapping and unmapping buffers adds overhead from
> -	 * updating the page tables and creates debugging output. Therefore,
> -	 * we delay the actual unmap operation until the BO gets evicted
> -	 * from memory. See drm_gem_vram_bo_driver_move_notify().
> -	 */
> -}
> -
>  /**
>   * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
>   *                       space
> @@ -447,7 +406,7 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
>  	ret = drm_gem_vram_pin_locked(gbo, 0);
>  	if (ret)
>  		goto err_ttm_bo_unreserve;
> -	ret = drm_gem_vram_kmap_locked(gbo, map);
> +	ret = drm_gem_vram_vmap_local(gbo, map);
>  	if (ret)
>  		goto err_drm_gem_vram_unpin_locked;
>  
> @@ -479,13 +438,84 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *ma
>  	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
>  		return;
>  
> -	drm_gem_vram_kunmap_locked(gbo, map);
> +	drm_gem_vram_vunmap_local(gbo, map);
>  	drm_gem_vram_unpin_locked(gbo);
>  
>  	ttm_bo_unreserve(&gbo->bo);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_vunmap);
>  
> +/**
> + * drm_gem_vram_vmap_local() - Maps a GEM VRAM object into kernel address space
> + * @gbo: The GEM VRAM object to map
> + * @map: Returns the kernel virtual address of the VRAM GEM object's backing
> + *       store.
> + *
> + * The vmap_local function maps the buffer of a GEM VRAM object into kernel address
> + * space. Call drm_gem_vram_vunmap_local() with the returned address to unmap and
> + * unpin the GEM VRAM object.
> + *
> + * The function is called with the BO's reservation object locked. For short-term
> + * mappings, callers must hold the lock until after unmapping the buffer. For

"the lock" is unclear, please mention the exact lock and maybe how to lock
it. This is the first time we have a vram helper function which requires
callers to lock, so better safe than sorry :-)

> + * long-term mappings, callers are required to pin the BO to it's current location
> + * before calling this function.

With the dma_resv_assert_held the 2nd use-case kinda doesn't work, since
there we'd access without the dma_resv_lock. I'd just drop that
sentence.

For the vram helper part, with the kerneldoc polished:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + *
> + * Returns:
> + * 0 on success, or a negative error code otherwise.
> + */
> +int drm_gem_vram_vmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
> +{
> +	int ret;
> +
> +	dma_resv_assert_held(gbo->bo.base.resv);
> +
> +	if (gbo->vmap_use_count > 0)
> +		goto out;
> +
> +	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
> +	if (ret)
> +		return ret;
> +
> +out:
> +	++gbo->vmap_use_count;
> +	*map = gbo->map;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gem_vram_vmap_local);
> +
> +/**
> + * drm_gem_vram_vunmap_local() - Unmaps a GEM VRAM object
> + * @gbo: The GEM VRAM object to unmap
> + * @map: Kernel virtual address where the VRAM GEM object was mapped
> + *
> + * A call to drm_gem_vram_vunmap_local() unmaps a GEM VRAM object's buffer. See
> + * the documentation for drm_gem_vram_vmap_local() for more information.
> + */
> +void drm_gem_vram_vunmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
> +{
> +	struct drm_device *dev = gbo->bo.base.dev;
> +
> +	dma_resv_assert_held(gbo->bo.base.resv);
> +
> +	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
> +		return;
> +
> +	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
> +		return; /* BUG: map not mapped from this BO */
> +
> +	if (--gbo->vmap_use_count > 0)
> +		return;
> +
> +	/*
> +	 * Permanently mapping and unmapping buffers adds overhead from
> +	 * updating the page tables and creates debugging output. Therefore,
> +	 * we delay the actual unmap operation until the BO gets evicted
> +	 * from memory. See drm_gem_vram_bo_driver_move_notify().
> +	 */
> +}
> +EXPORT_SYMBOL(drm_gem_vram_vunmap_local);
> +
>  /**
>   * drm_gem_vram_fill_create_dumb() - \
>  	Helper for implementing &struct drm_driver.dumb_create
> @@ -871,17 +901,33 @@ static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem, struct dma_bu
>  	drm_gem_vram_vunmap(gbo, map);
>  }
>  
> +static int drm_gem_vram_object_vmap_local(struct drm_gem_object *gem, struct dma_buf_map *map)
> +{
> +	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
> +
> +	return drm_gem_vram_vmap_local(gbo, map);
> +}
> +
> +static void drm_gem_vram_object_vunmap_local(struct drm_gem_object *gem, struct dma_buf_map *map)
> +{
> +	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
> +
> +	drm_gem_vram_vunmap_local(gbo, map);
> +}
> +
>  /*
>   * GEM object funcs
>   */
>  
>  static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
> -	.free	= drm_gem_vram_object_free,
> -	.pin	= drm_gem_vram_object_pin,
> -	.unpin	= drm_gem_vram_object_unpin,
> -	.vmap	= drm_gem_vram_object_vmap,
> +	.free = drm_gem_vram_object_free,
> +	.pin = drm_gem_vram_object_pin,
> +	.unpin = drm_gem_vram_object_unpin,
> +	.vmap = drm_gem_vram_object_vmap,
>  	.vunmap	= drm_gem_vram_object_vunmap,
> -	.mmap   = drm_gem_ttm_mmap,
> +	.vmap_local = drm_gem_vram_object_vmap_local,
> +	.vunmap_local = drm_gem_vram_object_vunmap_local,
> +	.mmap = drm_gem_ttm_mmap,
>  	.print_info = drm_gem_ttm_print_info,
>  };
>  
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index dbc0dd53c69e..215b37c78c10 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -381,7 +381,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  		container_of(plane->dev, struct vbox_private, ddev);
>  	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
>  	struct drm_framebuffer *fb = plane->state->fb;
> -	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
> +	struct drm_gem_object *obj = fb->obj[0];
> +	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(obj);
>  	u32 width = plane->state->crtc_w;
>  	u32 height = plane->state->crtc_h;
>  	size_t data_size, mask_size;
> @@ -401,11 +402,12 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  
>  	vbox_crtc->cursor_enabled = true;
>  
> -	ret = drm_gem_vram_vmap(gbo, &map);
> +	ret = dma_resv_lock(obj->resv, NULL);
> +	if (ret)
> +		return;
> +	ret = drm_gem_vram_vmap_local(gbo, &map);
>  	if (ret) {
> -		/*
> -		 * BUG: we should have pinned the BO in prepare_fb().
> -		 */
> +		dma_resv_unlock(obj->resv);
>  		mutex_unlock(&vbox->hw_mutex);
>  		DRM_WARN("Could not map cursor bo, skipping update\n");
>  		return;
> @@ -421,7 +423,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  	data_size = width * height * 4 + mask_size;
>  
>  	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
> -	drm_gem_vram_vunmap(gbo, &map);
> +	drm_gem_vram_vunmap_local(gbo, &map);
> +	dma_resv_unlock(obj->resv);
>  
>  	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>  		VBOX_MOUSE_POINTER_ALPHA;
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index a4bac02249c2..bd6a60e7c22b 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -99,6 +99,8 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
>  int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
>  int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
>  void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
> +int drm_gem_vram_vmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
> +void drm_gem_vram_vunmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
>  
>  int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>  				  struct drm_device *dev,
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
