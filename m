Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 140155E650
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 16:17:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7162C1052;
	Wed,  3 Jul 2019 14:17:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6CE89103B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 14:15:52 +0000 (UTC)
X-Greylist: delayed 00:07:44 by SQLgrey-1.7.6
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A220D899
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org;
	s=ds201810; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=BRg7PnID/9yWmnCWfjnnheL6LDhHWiZ5hA/sa7gOus8=; 
	b=d0in+u4h42Zz7T6UpvJI0fgJWEuxAeZfY0IJefqEo62zRVjsYpot/GpE15phZPplO2O42KIRofP5WqPtLkHH3P2Bpie+koSDvp0C566ymeijlvkFilDVaykl1UINhtF9UijRGb2bN/d4WqDJe5EsIiUyLR3W62Y9CNzFokIFx0lXFtW7lqSjbRNqnTfbOZlwp7ABPjueFKXKLzeTkHvp28X+6DYB5zJfQ8tyFzptllydwLTZe3DH6MPlPPH10OcJNGqxCddHzd881UVospTETVazICnXUrJgK3uZxRbt5CvpvANmMJH3K+LSpDQG37hYhxSkg0qNAzmDfXXX+P6SpQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61524
	helo=[192.168.10.173]) by smtp.domeneshop.no with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <noralf@tronnes.org>)
	id 1hifvZ-0005MZ-0z; Wed, 03 Jul 2019 16:08:05 +0200
Subject: Re: [PATCH 1/5] drm/client: Support unmapping of DRM client buffers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
	daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com, 
	maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
	yc_chen@aspeedtech.com
References: <20190703083302.2609-1-tzimmermann@suse.de>
	<20190703083302.2609-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <458e7d7d-3aa5-5d45-6c5c-62fadd9e4e91@tronnes.org>
Date: Wed, 3 Jul 2019 16:07:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703083302.2609-2-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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



Den 03.07.2019 10.32, skrev Thomas Zimmermann:
> DRM clients, such as the fbdev emulation, have their buffer objects
> mapped by default. Mapping a buffer implicitly prevents its relocation.
> Hence, the buffer may permanently consume video memory while it's
> allocated. This is a problem for drivers of low-memory devices, such as
> ast, mgag200 or older framebuffer hardware, which will then not have
> enough memory to display other content (e.g., X11).
> 
> This patch introduces drm_client_buffer_vmap() and _vunmap(). Internal
> DRM clients can use these functions to unmap and remap buffer objects
> as needed.
> 
> There's no reference counting for vmap operations. Callers are expected
> to either keep buffers mapped (as it is now), or call vmap and vunmap
> in pairs around code that accesses the mapped memory.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_client.c | 71 +++++++++++++++++++++++++++++++-----
>  include/drm/drm_client.h     |  3 ++
>  2 files changed, 64 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 410572f14257..d04660c4470a 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -235,7 +235,8 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>  {
>  	struct drm_device *dev = buffer->client->dev;
>  
> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
> +	if (buffer->vaddr)

No need for this, drm_gem_vunmap() has a NULL check.

> +		drm_gem_vunmap(buffer->gem, buffer->vaddr);
>  
>  	if (buffer->gem)
>  		drm_gem_object_put_unlocked(buffer->gem);
> @@ -281,6 +282,43 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
>  
>  	buffer->gem = obj;
>  
> +	vaddr = drm_client_buffer_vmap(buffer);

I think we should change this and _not_ vmap on buffer creation.
Eventually we'll get bootsplash and console clients and they will also
have to deal with these low memory devices. AFAICS the only client that
will need a virtual address at all times is the fbdev client when it
doesn't use a shadow buffer.

> +	if (IS_ERR(vaddr)) {
> +		ret = PTR_ERR(vaddr);
> +		goto err_delete;
> +	}
> +
> +	return buffer;
> +
> +err_delete:
> +	drm_client_buffer_delete(buffer);
> +
> +	return ERR_PTR(ret);
> +}
> +
> +/**
> + * drm_client_buffer_vmap - Map DRM client buffer into address space
> + * @buffer: DRM client buffer
> + *
> + * This function maps a client buffer into kernel address space. If the
> + * buffer is already mapped, it returns the mapping's address.
> + *
> + * Client buffer mappings are not ref'counted. Each call to
> + * drm_client_buffer_vmap() should be followed by a call to
> + * drm_client_buffer_vunmap(); or the client buffer should be mapped
> + * throughout its lifetime. The latter is the default.
> + *
> + * Returns:
> + *	The mapped memory's address
> + */
> +void *
> +drm_client_buffer_vmap(struct drm_client_buffer *buffer)
> +{
> +	void *vaddr;
> +
> +	if (buffer->vaddr)
> +		return buffer->vaddr;
> +
>  	/*
>  	 * FIXME: The dependency on GEM here isn't required, we could
>  	 * convert the driver handle to a dma-buf instead and use the
> @@ -289,21 +327,34 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
>  	 * fd_install step out of the driver backend hooks, to make that
>  	 * final step optional for internal users.
>  	 */
> -	vaddr = drm_gem_vmap(obj);
> -	if (IS_ERR(vaddr)) {
> -		ret = PTR_ERR(vaddr);
> -		goto err_delete;
> -	}
> +	vaddr = drm_gem_vmap(buffer->gem);
> +	if (IS_ERR(vaddr))
> +		return vaddr;
>  
>  	buffer->vaddr = vaddr;
>  
> -	return buffer;
> +	return vaddr;
> +}
> +EXPORT_SYMBOL(drm_client_buffer_vmap);
>  
> -err_delete:
> -	drm_client_buffer_delete(buffer);
> +/**
> + * drm_client_buffer_vunmap - Unmap DRM client buffer
> + * @buffer: DRM client buffer
> + *
> + * This function removes a client buffer's memory mmapping. This
> + * function is only required by clients that manage their buffers
> + * by themselves. By default, DRM client buffers are mapped throughout
> + * their entire lifetime.
> + */
> +void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
> +{
> +	if (!buffer->vaddr)

No need for a NULL check here either.

Noralf.

> +		return;
>  
> -	return ERR_PTR(ret);
> +	drm_gem_vunmap(buffer->gem, buffer->vaddr);
> +	buffer->vaddr = NULL;
>  }
> +EXPORT_SYMBOL(drm_client_buffer_vunmap);
>  
>  static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
>  {
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 72d51d1e9dd9..e1db1d9da0bf 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -149,6 +149,9 @@ struct drm_client_buffer {
>  struct drm_client_buffer *
>  drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
> +void *
> +drm_client_buffer_vmap(struct drm_client_buffer *buffer);
> +void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>  
>  int drm_client_modeset_create(struct drm_client_dev *client);
>  void drm_client_modeset_free(struct drm_client_dev *client);
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
