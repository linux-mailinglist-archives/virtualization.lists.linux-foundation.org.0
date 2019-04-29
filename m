Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D810FEB39
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 21:59:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E2DE31A90;
	Mon, 29 Apr 2019 19:59:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C6A461A88
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 19:59:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C36CD876
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 19:59:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by asavdk4.altibox.net (Postfix) with ESMTPS id AC20E80486;
	Mon, 29 Apr 2019 21:58:56 +0200 (CEST)
Date: Mon, 29 Apr 2019 21:58:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Message-ID: <20190429195855.GA6610@ravnborg.org>
References: <20190429144341.12615-1-tzimmermann@suse.de>
	<20190429144341.12615-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429144341.12615-2-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
	a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
	a=b9UjndnBwROZd5N9eiUA:9 a=fNIUSwskkzvKi2ym:21 a=j7ZNruIje-ix_gbU:21
	a=D_xUyxa-0ynIy6dB:21 a=CjuIK1q_8ugA:10
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
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

Hi Thomas.

Some minor things and some bikeshedding too.

One general^Wbikeshedding thing - unint32_t is used in many places.
And then s64 in one place.
Seems like two concepts are mixed.
Maybe be consistent and use u32, s32 everywhere?

I did not read the code carefully enough to understand it.
I cannot give a r-b or a-b - as I feel I need to understand it to do
so.

	Sam

On Mon, Apr 29, 2019 at 04:43:23PM +0200, Thomas Zimmermann wrote:
> The type |struct drm_gem_vram_object| implements a GEM object for simple
> framebuffer devices with dedicated video memory. The BO is either located
> in VRAM or system memory.
> 
> The implementation has been created from the respective code in ast,
> bochs and mgag200. These drivers copy their implementation from each
> other; except for the names of several data types. The helpers are
> currently build with TTM, but this is considered an implementation
> detail and may change in future updates.
> 
> v2:
> 	* rename to |struct drm_gem_vram_object|
> 	* move drm_is_gem_ttm() to a later patch in the series
> 	* add drm_gem_vram_kmap_at()
> 	* return is_iomem from kmap functions
> 	* redefine TTM placement flags for public interface
> 	* documentation fixes
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/gpu/drm-mm.rst             |  12 +
>  drivers/gpu/drm/Kconfig                  |  13 +
>  drivers/gpu/drm/Makefile                 |   4 +
>  drivers/gpu/drm/drm_gem_vram_helper.c    | 410 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_vram_helper_common.c |   6 +
>  include/drm/drm_gem_vram_helper.h        |  92 +++++
>  6 files changed, 537 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_gem_vram_helper.c
>  create mode 100644 drivers/gpu/drm/drm_vram_helper_common.c
>  create mode 100644 include/drm/drm_gem_vram_helper.h
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 54a696d961a7..d5327ed608d7 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -380,6 +380,18 @@ GEM CMA Helper Functions Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_gem_cma_helper.c
>     :export:
>  
> +GEM VRAM Helper Functions Reference
> +----------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gem_vram_helper.c
> +   :doc: overview
> +
> +.. kernel-doc:: include/drm/drm_gem_vram_helper.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gem_vram_helper.c
> +   :export:
> +
>  VMA Offset Manager
>  ==================
>  
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2267e84d5cb4..c0d49a6c09d2 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -160,6 +160,12 @@ config DRM_TTM
>  	  GPU memory types. Will be enabled automatically if a device driver
>  	  uses it.
>  
> +config DRM_VRAM_HELPER
> +	tristate
> +	depends on DRM && DRM_TTM
> +	help
> +	  Helpers for VRAM memory management
> +
>  config DRM_GEM_CMA_HELPER
>  	bool
>  	depends on DRM
> @@ -179,6 +185,13 @@ config DRM_GEM_SHMEM_HELPER
>  	help
>  	  Choose this if you need the GEM shmem helper functions
>  
> +config DRM_GEM_VRAM_HELPER
> +	bool
> +	depends on DRM
> +	select DRM_VRAM_HELPER
> +	help
> +	  Choose this if you need the GEM VRAM helper functions
> +
I cannot remember how select will deal with symbols whos has
a  "depends on".
But if I recall correct then the "depends on" will be ignored
or in best case trigger a warning.
In other words - when we have symbols we select they should not
have a depends on.

What can be done is something like:

symbol foo
	bool

symbol bar
	depends on foo


symbol foobar
	bool "This is what you need - select me"
	select foo

So when one chooses "foobar" then we will select "foo" and this will
satisfy bar.

But maybe this rambling is irrelevant - maybe check what we do with
other selectable symbols in DRM.


> +/**
> + * DOC: overview
> + *
> + * This library provides a GEM object that is backed by VRAM. It
> + * can be used for simple framebuffer devices with dedicated memory.
> + */
It is likely only me, but...
I could use a short explanation what is GEM and maybe also VRAM.

VRAM as video RAM, but maybe there is more constraints?
(When I first looked at DRM I wondered what you used Virtual RAM for.
But thats a long time ago so it counts only as a funny story.

> + * Buffer-objects helpers
> + */
> +
> +static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
> +{
> +	/* We got here via ttm_bo_put(), which means that the
> +	 * TTM buffer object in 'bo' has already been cleaned
> +	 * up; only release the GEM object. */
> +	drm_gem_object_release(&gbo->gem);
> +}
> +
> +static void drm_gem_vram_destroy(struct drm_gem_vram_object *gbo)
> +{
> +	drm_gem_vram_cleanup(gbo);
> +	kfree(gbo);
> +}
> +
> +static void ttm_buffer_object_destroy(struct ttm_buffer_object *bo)
> +{
> +	struct drm_gem_vram_object *gbo = drm_gem_vram_of_bo(bo);
> +	drm_gem_vram_destroy(gbo);
> +}
> +
> +static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo, int pl_flag)
> +{
> +	unsigned int i;
> +	unsigned int c = 0;
> +
> +	gbo->placement.placement = gbo->placements;
> +	gbo->placement.busy_placement = gbo->placements;
> +
> +	if (pl_flag & TTM_PL_FLAG_VRAM)
> +		gbo->placements[c++].flags = TTM_PL_FLAG_WC |
> +					     TTM_PL_FLAG_UNCACHED |
> +					     TTM_PL_FLAG_VRAM;
> +
> +	if (pl_flag & TTM_PL_FLAG_SYSTEM)
> +		gbo->placements[c++].flags = TTM_PL_MASK_CACHING |
> +					     TTM_PL_FLAG_SYSTEM;
> +
> +	if (!c)
> +		gbo->placements[c++].flags = TTM_PL_MASK_CACHING |
> +					     TTM_PL_FLAG_SYSTEM;
> +
> +	gbo->placement.num_placement = c;
> +	gbo->placement.num_busy_placement = c;
> +
> +	for (i = 0; i < c; ++i) {
> +		gbo->placements[i].fpfn = 0;
> +		gbo->placements[i].lpfn = 0;
> +	}
> +}
> +
> +static int drm_gem_vram_init(struct drm_device *dev,
> +			     struct ttm_bo_device *bdev,
> +			     struct drm_gem_vram_object *gbo,
> +			     unsigned long size, uint32_t pg_align,
> +			     bool interruptible)
> +{
> +	int ret;
> +	size_t acc_size;
> +
> +	ret = drm_gem_object_init(dev, &gbo->gem, size);
> +	if (ret)
> +		return ret;
> +
> +	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
> +
> +	gbo->bo.bdev = bdev;
> +	drm_gem_vram_placement(gbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
> +
> +	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
> +			  &gbo->placement, pg_align, interruptible, acc_size,
> +			  NULL, NULL, ttm_buffer_object_destroy);
> +	if (ret)
> +		goto err_drm_gem_object_release;
> +
> +	return 0;
> +
> +err_drm_gem_object_release:
> +	drm_gem_object_release(&gbo->gem);
> +	return ret;
> +}
> +
> +/**
> + * drm_gem_vram_create() - Creates a VRAM-backed GEM object
> + * @dev:		the DRM device
> + * @bdev:		the TTM BO device backing the object
> + * @size:		the buffer size in bytes
> + * @pg_align:		the buffer's alignment in multiples of the page size
> + * @interruptible:	sleep interruptible if waiting for memory
> + *
> + * Returns:
> + * A new instance of &struct drm_gem_vram_object on success, or
> + * an ERR_PTR()-encoded error code otherwise.
> + */
> +struct drm_gem_vram_object* drm_gem_vram_create(struct drm_device *dev,
> +						struct ttm_bo_device *bdev,
> +						unsigned long size,
> +						uint32_t pg_align,
> +						bool interruptible)
> +{
> +	struct drm_gem_vram_object *gbo;
> +	int ret;
> +
> +	gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
> +	if (!gbo)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = drm_gem_vram_init(dev, bdev, gbo, size, pg_align, interruptible);
> +	if (ret < 0)
> +		goto err_kfree;
> +
> +	return gbo;
> +
> +err_kfree:
> +	kfree(gbo);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_gem_vram_create);
> +
> +/**
> + * drm_gem_vram_put() - Releases a reference to a VRAM-backed GEM object
> + * @gbo:	the GEM VRAM object
> + *
> + * See ttm_bo_put() for more information.
> + */
> +void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
> +{
> +	ttm_bo_put(&gbo->bo);
> +}
> +EXPORT_SYMBOL(drm_gem_vram_put);
> +
> +/**
> + * drm_gem_vram_reserve() - Reserves a VRAM-backed GEM object
> + * @gbo:	the GEM VRAM object
> + * @no_wait:	don't wait for buffer object to become available
> + *
> + * See ttm_bo_reserve() for more information.
> + *
> + * Returns:
> + * 0 on success, or
> + * a negative error code otherwise
> + */
> +int drm_gem_vram_reserve(struct drm_gem_vram_object *gbo, bool no_wait)
> +{
> +	return ttm_bo_reserve(&gbo->bo, true, no_wait, NULL);
> +}
> +EXPORT_SYMBOL(drm_gem_vram_reserve);
> +
> +/**
> + * drm_gem_vram_unreserve() - \
> +	Release a reservation acquired by drm_gem_vram_reserve()
> + * @gbo:	the GEM VRAM object
> + *
> + * See ttm_bo_unreserve() for more information.
> + */
> +void drm_gem_vram_unreserve(struct drm_gem_vram_object *gbo)
> +{
> +	ttm_bo_unreserve(&gbo->bo);
> +}
> +EXPORT_SYMBOL(drm_gem_vram_unreserve);
> +
> +/**
> + * drm_gem_vram_mmap_offset() - Returns a GEM VRAM object's mmap offset
> + * @gbo:	the GEM VRAM object
> + *
> + * See drm_vma_node_offset_addr() for more information.
> + *
> + * Returns:
> + * The buffer object's offset for userspace mappings on success, or
> + * 0 if no offset is allocated.
> + */
> +u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
> +{
> +	return drm_vma_node_offset_addr(&gbo->bo.vma_node);
> +}
> +EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
> +
> +/**
> + * drm_gem_vram_offset() - \
> +	Returns a GEM VRAM object's offset in video memory
> + * @gbo:	the GEM VRAM object
> + *
> + * This function returns the buffer object's offset in the device's video
> + * memory. The buffer object has to be pinned to %TTM_PL_VRAM.
> + *
> + * Returns:
> + * The buffer object's offset in video memory on success, or
> + * a negative error code otherwise.
> + */
> +s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
> +{
> +	if (!gbo->pin_count)
> +		return (s64)-ENODEV;
> +	return gbo->bo.offset;
> +}
> +EXPORT_SYMBOL(drm_gem_vram_offset);
> +
> +/**
> + * drm_gem_vram_pin() - Pins a GEM VRAM object in a region.
> + * @gbo:	the GEM VRAM object
> + * @pl_flag:	a bitmask of possible memory regions
> + *
> + * Pinning a buffer object ensures that it is not evicted from
> + * a memory region. A pinned buffer object has to be unpinned before
> + * it can be pinned to another region.
> + *
> + * Returns:
> + * 0 on success, or
> + * a negative error code otherwise.
> + */
> +int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, u32 pl_flag)
> +{
> +	int i, ret;
> +	struct ttm_operation_ctx ctx = { false, false };
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
> +EXPORT_SYMBOL(drm_gem_vram_pin);
> +
> +/**
> + * drm_gem_vram_unpin() - Unpins a GEM VRAM object
> + * @gbo:	the GEM VRAM object
> + *
> + * Returns:
> + * 0 on success, or
> + * a negative error code otherwise.
> + */
> +int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
> +{
> +	int i, ret;
> +	struct ttm_operation_ctx ctx = { false, false };
> +
> +	if (!gbo->pin_count)
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
> +EXPORT_SYMBOL(drm_gem_vram_unpin);
> +
> +/**
> + * drm_gem_vram_push_to_system() - \
> +	Unpins a GEM VRAM object and moves it to system memory
> + * @gbo:	the GEM VRAM object
> + *
> + * This operation only works if the caller holds the final pin on the
> + * buffer object.
> + *
> + * Returns:
> + * 0 on success, or
> + * a negative error code otherwise.
> + */
> +int drm_gem_vram_push_to_system(struct drm_gem_vram_object *gbo)
> +{
> +	int i, ret;
> +	struct ttm_operation_ctx ctx = { false, false };
> +
> +	if (!gbo->pin_count)
> +		return 0;
> +
> +	--gbo->pin_count;
> +	if (gbo->pin_count)
> +		return 0;
> +
> +	if (gbo->kmap.virtual)
> +		ttm_bo_kunmap(&gbo->kmap);
> +
> +	drm_gem_vram_placement(gbo, TTM_PL_FLAG_SYSTEM);
> +	for (i = 0; i < gbo->placement.num_placement ; ++i)
> +		gbo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
> +
> +	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gem_vram_push_to_system);
> +
> +/**
> + * drm_gem_vram_kmap_at() - Maps a GEM VRAM object into kernel address space
> + * @gbo:	the GEM VRAM object
> + * @map:	establish a mapping if necessary
> + * @is_iomem:	returns true if the mapped memory is I/O memory, or false \
> +	otherwise; can be NULL
> + * @kmap:	the mapping's kmap object
> + *
> + * This function maps the buffer object into the kernel's address space
> + * or returns the current mapping. If the parameter map is false, the
> + * function only queries the current mapping, but does not establish a
> + * new one.
> + *
> + * Returns:
> + * The buffers virtual address if mapped, or
> + * NULL if not mapped, or
> + * an ERR_PTR()-encoded error code otherwise.
> + */
> +void* drm_gem_vram_kmap_at(struct drm_gem_vram_object *gbo, bool map,
> +			   bool *is_iomem, struct ttm_bo_kmap_obj *kmap)
> +{
> +	int ret;
> +
> +	if (kmap->virtual || !map)
> +		goto out;
> +
> +	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +out:
> +	if (!is_iomem) {
> +		return kmap->virtual;
> +	}
> +	if (!kmap->virtual) {
> +		*is_iomem = false;
> +		return NULL;
> +	}
> +	return ttm_kmap_obj_virtual(kmap, is_iomem);
> +}
> +EXPORT_SYMBOL(drm_gem_vram_kmap_at);
> +
> +/**
> + * drm_gem_vram_kmap() - Maps a GEM VRAM object into kernel address space
> + * @gbo:	the GEM VRAM object
> + * @map:	establish a mapping if necessary
> + * @is_iomem:	returns true if the mapped memory is I/O memory, or false \
> +	otherwise; can be NULL
> + *
> + * This function maps the buffer object into the kernel's address space
> + * or returns the current mapping. If the parameter map is false, the
> + * function only queries the current mapping, but does not establish a
> + * new one.
> + *
> + * Returns:
> + * The buffers virtual address if mapped, or
> + * NULL if not mapped, or
> + * an ERR_PTR()-encoded error code otherwise.
> + */
> +void* drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
> +			bool *is_iomem)
> +{
> +	return drm_gem_vram_kmap_at(gbo, map, is_iomem, &gbo->kmap);
> +}
> +EXPORT_SYMBOL(drm_gem_vram_kmap);
> +
> +/**
> + * drm_gem_vram_kunmap_at() - Unmaps a GEM VRAM object
> + * @gbo:	the GEM VRAM object
> + * @kmap:	the mapping's kmap object
> + */
> +void drm_gem_vram_kunmap_at(struct drm_gem_vram_object *gbo,
> +			    struct ttm_bo_kmap_obj *kmap)
> +{
> +	if (!kmap->virtual)
> +		return;
> +
> +	ttm_bo_kunmap(kmap);
> +	kmap->virtual = NULL;
> +}
> +EXPORT_SYMBOL(drm_gem_vram_kunmap_at);
> +
> +/**
> + * drm_gem_vram_kunmap() - Unmaps a GEM VRAM object
> + * @gbo:	the GEM VRAM object
> + */
> +void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo)
> +{
> +	drm_gem_vram_kunmap_at(gbo, &gbo->kmap);
> +}
> +EXPORT_SYMBOL(drm_gem_vram_kunmap);
> diff --git a/drivers/gpu/drm/drm_vram_helper_common.c b/drivers/gpu/drm/drm_vram_helper_common.c
> new file mode 100644
> index 000000000000..76b6569c9aad
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_vram_helper_common.c
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <linux/module.h>
> +
> +MODULE_DESCRIPTION("DRM VRAM memory-management helpers");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> new file mode 100644
> index 000000000000..167616f552e5
> --- /dev/null
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef DRM_GEM_VRAM_HELPER_H
> +#define DRM_GEM_VRAM_HELPER_H
> +
> +#include <drm/drm_gem.h>
> +#include <drm/ttm/ttm_bo_api.h>
> +#include <drm/ttm/ttm_placement.h>
> +#include <linux/kernel.h> /* for container_of() */
> +
> +struct filp;
> +
> +#define DRM_GEM_VRAM_PL_FLAG_VRAM	TTM_PL_FLAG_VRAM
> +#define DRM_GEM_VRAM_PL_FLAG_SYSTEM	TTM_PL_FLAG_SYSTEM
> +
> +/*
> + * Buffer-object helpers
> + */
> +
> +/**
> + * struct drm_gem_vram_object - GEM object backed by VRAM
> + * @gem:	GEM object
> + * @bo:		TTM buffer object
> + * @kmap:	Mapping information for @bo
> + * @placement:	TTM placement information. Supported placements are \
> +	%TTM_PL_VRAM and %TTM_PL_SYSTEM
> + * @placements:	TTM placement information.
> + * @pin_count:	Pin counter
> + *
> + * The type struct drm_gem_vram_object represents a GEM object that is
> + * backed by VRAM. It can be used for simple frambuffer devices with
> + * dedicated memory. The buffer object can be evicted to system memory if
> + * video memory becomes scarce.
> + */
> +struct drm_gem_vram_object {
> +        struct drm_gem_object gem;
> +        struct ttm_buffer_object bo;
> +        struct ttm_bo_kmap_obj kmap;
> +
> +	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
> +        struct ttm_placement placement;
> +        struct ttm_place placements[3];
> +
> +        int pin_count;
> +};
Use tabs for indent - not spaces.
Ask checkpatch if anything similar needs to be adjusted.


> +
> +/**
> + * Returns the container of type &struct drm_gem_vram_object
> + * for field bo.
> + * @bo:		the VRAM buffer object
> + * Returns:	The containing GEM VRAM object
> + */
> +static inline struct drm_gem_vram_object* drm_gem_vram_of_bo(
> +	struct ttm_buffer_object *bo)
> +{
> +	return container_of(bo, struct drm_gem_vram_object, bo);
> +}
Indent funny. USe same indent as used in other parts of file for
function arguments.

> +
> +/**
> + * Returns the container of type &struct drm_gem_vram_object
> + * for field gem.
> + * @gem:	the GEM object
> + * Returns:	The containing GEM VRAM object
> + */
> +static inline struct drm_gem_vram_object* drm_gem_vram_of_gem(
> +	struct drm_gem_object *gem)
> +{
> +	return container_of(gem, struct drm_gem_vram_object, gem);
> +}
ditto

> +
> +struct drm_gem_vram_object* drm_gem_vram_create(struct drm_device *dev,
> +						struct ttm_bo_device* bdev,
> +						unsigned long size,
> +						uint32_t pg_align,
> +						bool interruptible);

Here is is "normal"

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
