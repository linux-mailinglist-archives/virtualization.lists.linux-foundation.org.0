Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B402D733F
	for <lists.virtualization@lfdr.de>; Fri, 11 Dec 2020 11:02:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 62D5287289;
	Fri, 11 Dec 2020 10:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dh7yFDuZQf0P; Fri, 11 Dec 2020 10:02:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4779E8726D;
	Fri, 11 Dec 2020 10:02:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B09CC013B;
	Fri, 11 Dec 2020 10:02:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2620DC013B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 10:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1F2AB87046
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 10:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qqKFeMJtSat
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 10:02:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0511D8690A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 10:02:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c198so7039763wmd.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Dec 2020 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mTuKBk3C/3X76hOG0w8lx61nUDvWBKEJ69TOQ0mlXgA=;
 b=JR/zLRsPiH3O0tRuMUpzppzVpIGdPGfvPucgH2LkrZ5XtZGXvsKVwN576oM5s2qPhQ
 TJX+wLuZXM+Qo0Cqosk7Pf2krN/zHK2QeEK+aBtDcxWs6uAM1MxFdFTxK1j22wNwLYHA
 UIHBLVWVYe0VZHXcFMzZCpNzWbPDL4eyBWn58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mTuKBk3C/3X76hOG0w8lx61nUDvWBKEJ69TOQ0mlXgA=;
 b=Nts5biusbEd6hdufxPd+3ZdzrV/W/HcMEtn9Noxj82MpY7rKLtIhXwwZOzZN/v5sFI
 Zr+Cty2OjM4bwAOcE4uVagtdMmLdULJ9RZqX5F3DOFQq7A4nCnnLvQcSKwncif8DgkNE
 ITPwxeolL1V9VkJM7h9ypZgAsQTuykwEt7ZLGjCvCHsL0FiQoGU9l94VGLypzGJda1NZ
 oRIFdeS6svQ40mAJPrHu7gd6YX+PYZyJFRcU/GEAbX0VuFqYF1WVHiX7v11soATxygFl
 0yRty3+MwpkBi4LBPLyxRqLhYTYVDa0gf+LR191PDIuKVd5LQvvAWxP2Jw/lPxxaLKCg
 LBhQ==
X-Gm-Message-State: AOAM532g6X08FSDMQlSjmYgLhAY/+tuj6xRf9ksWeBtLubGh3GPGnXGg
 vZJqhRLaoSS1CLBImUsrC6ESeg==
X-Google-Smtp-Source: ABdhPJyTBf0iwScHXvSJGXt8CW6VWiYLkdsBFn4324eyY+JcNiRT9NAicuQZ0tAxgT35YR0E16K1dA==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr12459778wmf.95.1607680970334; 
 Fri, 11 Dec 2020 02:02:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m21sm13711303wml.13.2020.12.11.02.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 02:02:49 -0800 (PST)
Date: Fri, 11 Dec 2020 11:02:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 5/8] drm/cma-helper: Provide a vmap function for
 short-term mappings
Message-ID: <20201211100247.GO401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-6-tzimmermann@suse.de>
 <20201211094000.GK401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211094000.GK401619@phenom.ffwll.local>
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

On Fri, Dec 11, 2020 at 10:40:00AM +0100, Daniel Vetter wrote:
> On Wed, Dec 09, 2020 at 03:25:24PM +0100, Thomas Zimmermann wrote:
> > Implementations of the vmap/vunmap GEM callbacks may perform pinning
> > of the BO and may acquire the associated reservation object's lock.
> > Callers that only require a mapping of the contained memory can thus
> > interfere with other tasks that require exact pinning, such as scanout.
> > This is less of an issue with private CMA buffers, but may happen
> > with imported ones.
> > 
> > Therefore provide the new interface drm_gem_cma_vmap_local(), which only
> > performs the vmap operations. Callers have to hold the reservation lock
> > while the mapping persists.
> > 
> > This patch also connects GEM CMA helpers to the GEM object function with
> > equivalent functionality.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/drm_gem_cma_helper.c | 35 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/vc4/vc4_bo.c         | 13 +++++++++++
> >  drivers/gpu/drm/vc4/vc4_drv.h        |  1 +
> >  include/drm/drm_gem_cma_helper.h     |  1 +
> >  4 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> > index 7942cf05cd93..40b3e8e3fc42 100644
> > --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> > @@ -38,6 +38,7 @@ static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
> >  	.print_info = drm_gem_cma_print_info,
> >  	.get_sg_table = drm_gem_cma_get_sg_table,
> >  	.vmap = drm_gem_cma_vmap,
> > +	.vmap_local = drm_gem_cma_vmap_local,
> >  	.mmap = drm_gem_cma_mmap,
> >  	.vm_ops = &drm_gem_cma_vm_ops,
> >  };
> > @@ -471,6 +472,40 @@ int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
> >  
> > +/**
> > + * drm_gem_cma_vmap_local - map a CMA GEM object into the kernel's virtual
> > + *     address space
> > + * @obj: GEM object
> > + * @map: Returns the kernel virtual address of the CMA GEM object's backing
> > + *       store.
> > + *
> > + * This function maps a buffer into the kernel's
> > + * virtual address space. Since the CMA buffers are already mapped into the
> > + * kernel virtual address space this simply returns the cached virtual
> > + * address. Drivers using the CMA helpers should set this as their DRM
> > + * driver's &drm_gem_object_funcs.vmap_local callback.
> > + *
> > + * Returns:
> > + * 0 on success, or a negative error code otherwise.
> > + */
> > +int drm_gem_cma_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
> > +{
> > +	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> > +
> > +	/*
> > +	 * TODO: The code in drm_gem_cma_prime_import_sg_table_vmap()
> > +	 *       establishes this mapping. The correct solution would
> > +	 *       be to call dma_buf_vmap_local() here.
> > +	 *
> > +	 *       If we find a case where we absolutely have to call
> > +	 *       dma_buf_vmap_local(), the code needs to be restructured.
> 
> dma_buf_vmap_local is only relevant for dynamic importers, pinning at
> import time is actually what you get anyway. That's what Christian meant
> with his comments for the ->pin hook. So the TODO here doesn't make sense
> imo, just delete it. We're very far away from making cma dynamic :-)
> 
> > +	 */
> > +	dma_buf_map_set_vaddr(map, cma_obj->vaddr);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_cma_vmap_local);
> > +
> >  /**
> >   * drm_gem_cma_mmap - memory-map an exported CMA GEM object
> >   * @obj: GEM object
> > diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> > index dc316cb79e00..ec57326c69c4 100644
> > --- a/drivers/gpu/drm/vc4/vc4_bo.c
> > +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> > @@ -387,6 +387,7 @@ static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
> >  	.export = vc4_prime_export,
> >  	.get_sg_table = drm_gem_cma_get_sg_table,
> >  	.vmap = vc4_prime_vmap,
> > +	.vmap_local = vc4_prime_vmap_local,
> >  	.vm_ops = &vc4_vm_ops,
> >  };
> >  
> > @@ -797,6 +798,18 @@ int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
> >  	return drm_gem_cma_vmap(obj, map);
> >  }
> >  
> > +int vc4_prime_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
> > +{
> > +	struct vc4_bo *bo = to_vc4_bo(obj);
> > +
> > +	if (bo->validated_shader) {
> 
> This freaks me out. It should be impossible to export a validated shader
> as a dma-buf, and indeed the check exists already.
> 
> All the wrapper functions here are imo pointless. Either we should remove
> them, or replace the if with a BUG_ON here since if that ever happens we
> have a security bug already. I'd go with removing, less code. Maybe throw
> a patch on top?

On 2nd thought, since I asked for the driver parts to be split out in all
the follow-up patches. Maybe best if you do the removal of these wrappers
here first, that gets rid of the vc4 changes in this patch here too.
-Daniel

> 
> Anyway this patch looks good, with the todo deleted:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> 
> > +		DRM_DEBUG("mmaping of shader BOs not allowed.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return drm_gem_cma_vmap_local(obj, map);
> > +}
> > +
> >  struct drm_gem_object *
> >  vc4_prime_import_sg_table(struct drm_device *dev,
> >  			  struct dma_buf_attachment *attach,
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> > index 43a1af110b3e..efb6c47d318f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.h
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> > @@ -812,6 +812,7 @@ struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
> >  						 struct dma_buf_attachment *attach,
> >  						 struct sg_table *sgt);
> >  int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> > +int vc4_prime_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
> >  int vc4_bo_cache_init(struct drm_device *dev);
> >  int vc4_bo_inc_usecnt(struct vc4_bo *bo);
> >  void vc4_bo_dec_usecnt(struct vc4_bo *bo);
> > diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> > index 0a9711caa3e8..05122e71bc6d 100644
> > --- a/include/drm/drm_gem_cma_helper.h
> > +++ b/include/drm/drm_gem_cma_helper.h
> > @@ -99,6 +99,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
> >  				  struct dma_buf_attachment *attach,
> >  				  struct sg_table *sgt);
> >  int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> > +int drm_gem_cma_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
> >  int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> >  
> >  /**
> > -- 
> > 2.29.2
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
