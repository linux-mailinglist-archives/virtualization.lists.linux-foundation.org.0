Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E72F1B7B
	for <lists.virtualization@lfdr.de>; Mon, 11 Jan 2021 17:52:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 41DF285D3D;
	Mon, 11 Jan 2021 16:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id negYcPc3uzGp; Mon, 11 Jan 2021 16:52:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9075D845D6;
	Mon, 11 Jan 2021 16:52:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 632D8C013A;
	Mon, 11 Jan 2021 16:52:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E74BBC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 16:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D4C5A85D3D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 16:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNntN2ZMRGv9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 16:52:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E3954845D6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 16:52:36 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id r4so509041wmh.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 08:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L2ciB0ZiY63nsknxOb+XkhZB/lRAXhKnJqyovy38XHU=;
 b=fQrlhJeUC2nzkE3b8vqkp5Bt+Xk7Nis94U/z9OLCh/OsOVMBjpWBgV81xjfVAposrI
 Hz2QbOWo5Khfc7WImBQKlLbofw+oraLRgBfvb1mzaCMyLbnKLsPugYWQ9wKvCl3njf7z
 wpSMh636DZAjOl2DkPZ7h813H/l+e1yU8DWRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L2ciB0ZiY63nsknxOb+XkhZB/lRAXhKnJqyovy38XHU=;
 b=h/brnJYz3LetJsXJvbABXhbJ4AcipOQkmdqng1vTH6/YrpCKDI2VXMdzUghiNcvku3
 3Rmw/CFaGXnJkeltImMnZK9VrR8J2gRReBbUijPuq7Vgz8YF/GLa18RVJRTuEI+AB77Z
 UygkMk5U0fxHILJtTZZL7BvEUTb0Lv8q0tjne3c4Ta7k4mmc4eIQmCje1ZGT4cagmovE
 m/DY7O6ayRMspbbnTKClfYtu38yb9nDcOxFveTMBm48wu27noGmH3D7YaYYM3GDFEsvF
 sKv2cz9vCTqZEvhyUWz3BXNOXv4tVyrd4flVRoneKB0+uc9RnxgOhDiqQzECXSTc6emN
 6/fQ==
X-Gm-Message-State: AOAM531N53cpCTeuQUgUMSTxtasII/c8spSFrpj42284HDpnIGPzwINp
 zIA6ji+SOp2uAt2XvCbHLpgx7g==
X-Google-Smtp-Source: ABdhPJwvjqJBKFKbvlepX602x2fw4IwJ7Mw1+rioHgxQT+AqjhSw++/85u5dy3ggjzeKeESWAkmYMw==
X-Received: by 2002:a1c:bb07:: with SMTP id l7mr552378wmf.9.1610383955459;
 Mon, 11 Jan 2021 08:52:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h14sm242648wrx.37.2021.01.11.08.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 08:52:34 -0800 (PST)
Date: Mon, 11 Jan 2021 17:52:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 13/13] drm/vram-helper: Remove unused
 drm_gem_vram_{vmap,vunmap}()
Message-ID: <X/yCUI27dinzjRWq@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108094340.15290-14-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Cc: eric@anholt.net, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com,
 daniel@ffwll.ch, airlied@redhat.com, virtualization@lists.linux-foundation.org,
 sean@poorly.run, sumit.semwal@linaro.org, linux-media@vger.kernel.org
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

On Fri, Jan 08, 2021 at 10:43:40AM +0100, Thomas Zimmermann wrote:
> VRAM-helper BO's cannot be exported, so calls for vmap and vunmap
> can only come from the BO's drivers or a kernel client. These are
> supposed use vmap_local functionality.

	  ^to

> 
> The vmap and vunmap operations in VRAM helpers are therefore unused
> and can be removed.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 98 ---------------------------
>  include/drm/drm_gem_vram_helper.h     |  2 -
>  2 files changed, 100 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index c7fba3a0758e..c7d166cd16df 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -379,72 +379,6 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_unpin);
>  
> -/**
> - * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
> - *                       space
> - * @gbo: The GEM VRAM object to map
> - * @map: Returns the kernel virtual address of the VRAM GEM object's backing
> - *       store.
> - *
> - * The vmap function pins a GEM VRAM object to its current location, either
> - * system or video memory, and maps its buffer into kernel address space.
> - * As pinned object cannot be relocated, you should avoid pinning objects
> - * permanently. Call drm_gem_vram_vunmap() with the returned address to
> - * unmap and unpin the GEM VRAM object.
> - *
> - * Returns:
> - * 0 on success, or a negative error code otherwise.
> - */
> -int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
> -{
> -	int ret;
> -
> -	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
> -	if (ret)
> -		return ret;
> -
> -	ret = drm_gem_vram_pin_locked(gbo, 0);
> -	if (ret)
> -		goto err_ttm_bo_unreserve;
> -	ret = drm_gem_vram_vmap_local(gbo, map);
> -	if (ret)
> -		goto err_drm_gem_vram_unpin_locked;
> -
> -	ttm_bo_unreserve(&gbo->bo);
> -
> -	return 0;
> -
> -err_drm_gem_vram_unpin_locked:
> -	drm_gem_vram_unpin_locked(gbo);
> -err_ttm_bo_unreserve:
> -	ttm_bo_unreserve(&gbo->bo);
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_gem_vram_vmap);
> -
> -/**
> - * drm_gem_vram_vunmap() - Unmaps and unpins a GEM VRAM object
> - * @gbo: The GEM VRAM object to unmap
> - * @map: Kernel virtual address where the VRAM GEM object was mapped
> - *
> - * A call to drm_gem_vram_vunmap() unmaps and unpins a GEM VRAM buffer. See
> - * the documentation for drm_gem_vram_vmap() for more information.
> - */
> -void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
> -{
> -	int ret;
> -
> -	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
> -	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
> -		return;
> -
> -	drm_gem_vram_vunmap_local(gbo, map);
> -	drm_gem_vram_unpin_locked(gbo);
> -
> -	ttm_bo_unreserve(&gbo->bo);
> -}
> -EXPORT_SYMBOL(drm_gem_vram_vunmap);
> -
>  /**
>   * drm_gem_vram_vmap_local() - Maps a GEM VRAM object into kernel address space
>   * @gbo: The GEM VRAM object to map
> @@ -870,36 +804,6 @@ static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
>  	drm_gem_vram_unpin(gbo);
>  }
>  
> -/**
> - * drm_gem_vram_object_vmap() -
> - *	Implements &struct drm_gem_object_funcs.vmap
> - * @gem: The GEM object to map
> - * @map: Returns the kernel virtual address of the VRAM GEM object's backing
> - *       store.
> - *
> - * Returns:
> - * 0 on success, or a negative error code otherwise.
> - */
> -static int drm_gem_vram_object_vmap(struct drm_gem_object *gem, struct dma_buf_map *map)
> -{
> -	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
> -
> -	return drm_gem_vram_vmap(gbo, map);
> -}
> -
> -/**
> - * drm_gem_vram_object_vunmap() -
> - *	Implements &struct drm_gem_object_funcs.vunmap
> - * @gem: The GEM object to unmap
> - * @map: Kernel virtual address where the VRAM GEM object was mapped
> - */
> -static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem, struct dma_buf_map *map)
> -{
> -	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
> -
> -	drm_gem_vram_vunmap(gbo, map);
> -}
> -
>  static int drm_gem_vram_object_vmap_local(struct drm_gem_object *gem, struct dma_buf_map *map)
>  {
>  	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
> @@ -922,8 +826,6 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
>  	.free = drm_gem_vram_object_free,
>  	.pin = drm_gem_vram_object_pin,
>  	.unpin = drm_gem_vram_object_unpin,
> -	.vmap = drm_gem_vram_object_vmap,
> -	.vunmap	= drm_gem_vram_object_vunmap,
>  	.vmap_local = drm_gem_vram_object_vmap_local,
>  	.vunmap_local = drm_gem_vram_object_vunmap_local,
>  	.mmap = drm_gem_ttm_mmap,
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index bd6a60e7c22b..e571867f4069 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -97,8 +97,6 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
>  s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
>  int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
>  int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
> -int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
> -void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
>  int drm_gem_vram_vmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
>  void drm_gem_vram_vunmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
>  
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
