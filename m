Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D00589FCD
	for <lists.virtualization@lfdr.de>; Thu,  4 Aug 2022 19:18:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1CE16114A;
	Thu,  4 Aug 2022 17:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1CE16114A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=A0zWqn39;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=TAE41Igg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umJ_P5crA8qm; Thu,  4 Aug 2022 17:18:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2B63961151;
	Thu,  4 Aug 2022 17:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B63961151
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B811C0078;
	Thu,  4 Aug 2022 17:18:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E33CC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Aug 2022 17:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E374F41CE7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Aug 2022 17:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E374F41CE7
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ravnborg.org
 header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=A0zWqn39; 
 dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256
 header.s=ed1 header.b=TAE41Igg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsogroamZpcY
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Aug 2022 17:18:38 +0000 (UTC)
X-Greylist: delayed 00:16:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F57D41CA7
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F57D41CA7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Aug 2022 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6lqOvzq1olToeddy04m7uPvbzyOoA2W4lF9ZcurNFYo=;
 b=A0zWqn39/WSk6BZDReKvv8cRu3GNCvFgEyfLa/CfLsrOW+uMgdj3Kkr4RW3Ae5A64StbNn0e3cpAp
 ho6fy+QvYwgDfsocYVNAGcMAuXb0YttCYZnLujIjSsU4kDjRT6+1qQQWyJAeJ16wCdbE4UIISvlfXy
 OyaxgPQn3+zYIuhKJuMRdqWZCDI9nkJ3KCnWhnOC+uNOAYxuOhUA8NTDpDYLvkclsyJLmZHgQKoiKu
 DyCTOKkR+jScn057QDdooDv1vOGuJPUwokhCShpu7TWgLseY8x3wTXhKD6lo3byoqNbygVBp/7y9xo
 cH/J97BNzHMf7qpwfPvNN8RR+ByNCig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6lqOvzq1olToeddy04m7uPvbzyOoA2W4lF9ZcurNFYo=;
 b=TAE41Igg0tqWGEcA86jM5mVXy8L4CetgQxCW51eD8PDP+KorwWeNXouQtsVx/11ZnNz7ey76ydjjZ
 q6IAcKkCw==
X-HalOne-Cookie: a4c06d85f231a6271e9b5141b6ce2fb8ad5776e1
X-HalOne-ID: 37af5f95-1417-11ed-8244-d0431ea8bb10
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 37af5f95-1417-11ed-8244-d0431ea8bb10;
 Thu, 04 Aug 2022 17:02:27 +0000 (UTC)
Date: Thu, 4 Aug 2022 19:02:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/12] drm/format-helper: Provide drm_fb_blit()
Message-ID: <Yuv7oURk9RR4KOYV@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727113312.22407-2-tzimmermann@suse.de>
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 javierm@redhat.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, daniel@ffwll.ch, jose.exposito89@gmail.com,
 airlied@redhat.com
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

Hi Thomas,

On Wed, Jul 27, 2022 at 01:33:01PM +0200, Thomas Zimmermann wrote:
> Provide drm_fb_blit() that works with struct iosys_map. Update all
> users of drm_fb_blit_toio(), which required a destination buffer in
> I/O memory. The new function's interface works with multi-plane
> color formats, although the implementation only supports a single
> plane for now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 39 ++++++++++++++++++-----------
>  drivers/gpu/drm/tiny/simpledrm.c    | 18 +++++++------
>  include/drm/drm_format_helper.h     |  7 +++---
>  3 files changed, 38 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index c6182b5de78b..4d74d46ab155 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -8,9 +8,10 @@
>   * (at your option) any later version.
>   */
>  
> +#include <linux/io.h>
> +#include <linux/iosys-map.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> -#include <linux/io.h>
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_format_helper.h>
> @@ -545,9 +546,9 @@ void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vad
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
>  
>  /**
> - * drm_fb_blit_toio - Copy parts of a framebuffer to display memory
> - * @dst:	The display memory to copy to
> - * @dst_pitch:	Number of bytes between two consecutive scanlines within dst
> + * drm_fb_blit - Copy parts of a framebuffer to display memory
> + * @dst:	Array of display-memory addresses to copy to
> + * @dst_pitch:	Array of numbers of bytes between two consecutive scanlines within dst

The rename confused me since this function continue to operate only on
io memory, but I see that this is all fixed up in later patches.
It would be nice to have this mentioned in the changelog, just in case
someone else takes a deeper look at it.

With the changelog updated:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

See also comments below.

>   * @dst_format:	FOURCC code of the display's color format
>   * @vmap:	The framebuffer memory to copy from
>   * @fb:		The framebuffer to copy from
> @@ -557,14 +558,18 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
>   * formats of the display and the framebuffer mismatch, the blit function
>   * will attempt to convert between them.
>   *
> + * The parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must
> + * have at least as many entries as there are planes in @dst_format's format. Each
> + * entry stores the value for the format's respective color plane at the same index.
> + *
>   * Returns:
>   * 0 on success, or
>   * -EINVAL if the color-format conversion failed, or
>   * a negative error code otherwise.
>   */
> -int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_format,
> -		     const void *vmap, const struct drm_framebuffer *fb,
> -		     const struct drm_rect *clip)
> +int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
> +		const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +		const struct drm_rect *clip)
>  {
>  	uint32_t fb_format = fb->format->format;
>  
> @@ -579,30 +584,35 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
>  		dst_format = DRM_FORMAT_XRGB2101010;
>  
>  	if (dst_format == fb_format) {
> -		drm_fb_memcpy_toio(dst, dst_pitch, vmap, fb, clip);
> +		drm_fb_memcpy_toio(dst[0].vaddr_iomem, dst_pitch[0], vmap[0].vaddr, fb, clip);
>  		return 0;
>  
>  	} else if (dst_format == DRM_FORMAT_RGB565) {
>  		if (fb_format == DRM_FORMAT_XRGB8888) {
> -			drm_fb_xrgb8888_to_rgb565_toio(dst, dst_pitch, vmap, fb, clip, false);
> +			drm_fb_xrgb8888_to_rgb565_toio(dst[0].vaddr_iomem, dst_pitch[0],
> +						       vmap[0].vaddr, fb, clip, false);
>  			return 0;
>  		}
>  	} else if (dst_format == DRM_FORMAT_RGB888) {
>  		if (fb_format == DRM_FORMAT_XRGB8888) {
> -			drm_fb_xrgb8888_to_rgb888_toio(dst, dst_pitch, vmap, fb, clip);
> +			drm_fb_xrgb8888_to_rgb888_toio(dst[0].vaddr_iomem, dst_pitch[0],
> +						       vmap[0].vaddr, fb, clip);
>  			return 0;
>  		}
>  	} else if (dst_format == DRM_FORMAT_XRGB8888) {
>  		if (fb_format == DRM_FORMAT_RGB888) {
> -			drm_fb_rgb888_to_xrgb8888_toio(dst, dst_pitch, vmap, fb, clip);
> +			drm_fb_rgb888_to_xrgb8888_toio(dst[0].vaddr_iomem, dst_pitch[0],
> +						       vmap[0].vaddr, fb, clip);
>  			return 0;
>  		} else if (fb_format == DRM_FORMAT_RGB565) {
> -			drm_fb_rgb565_to_xrgb8888_toio(dst, dst_pitch, vmap, fb, clip);
> +			drm_fb_rgb565_to_xrgb8888_toio(dst[0].vaddr_iomem, dst_pitch[0],
> +						       vmap[0].vaddr, fb, clip);
>  			return 0;
>  		}
>  	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
>  		if (fb_format == DRM_FORMAT_XRGB8888) {
> -			drm_fb_xrgb8888_to_xrgb2101010_toio(dst, dst_pitch, vmap, fb, clip);
> +			drm_fb_xrgb8888_to_xrgb2101010_toio(dst[0].vaddr_iomem, dst_pitch[0],
> +							    vmap[0].vaddr, fb, clip);
>  			return 0;
>  		}
>  	}
> @@ -612,8 +622,7 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
>  
>  	return -EINVAL;
>  }
> -EXPORT_SYMBOL(drm_fb_blit_toio);
> -
> +EXPORT_SYMBOL(drm_fb_blit);
>  
>  static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 5422363690e7..1ec73bec0513 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -652,9 +652,8 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
>  	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>  	struct drm_framebuffer *fb = plane_state->fb;
> -	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
>  	struct drm_device *dev = &sdev->dev;
> -	void __iomem *dst = sdev->screen_base;
> +	struct iosys_map dst;
Maybe
struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);

>  	struct drm_rect src_clip, dst_clip;
>  	int idx;
>  
> @@ -670,8 +669,10 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
>  	if (!drm_dev_enter(dev, &idx))
>  		return;
>  
> -	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
> -	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &src_clip);
> +	iosys_map_set_vaddr_iomem(&dst, sdev->screen_base);
> +	iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
> +	drm_fb_blit(&dst, &sdev->pitch, sdev->format->format,
> +		    shadow_plane_state->data, fb, &src_clip);
>  
>  	drm_dev_exit(idx);
>  }
> @@ -699,10 +700,9 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
>  	struct simpledrm_device *sdev = simpledrm_device_of_dev(pipe->crtc.dev);
>  	struct drm_plane_state *plane_state = pipe->plane.state;
>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> -	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
>  	struct drm_framebuffer *fb = plane_state->fb;
>  	struct drm_device *dev = &sdev->dev;
> -	void __iomem *dst = sdev->screen_base;
> +	struct iosys_map dst;
Likewise:
struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);

>  	struct drm_rect src_clip, dst_clip;
>  	int idx;
>  
> @@ -719,8 +719,10 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
>  	if (!drm_dev_enter(dev, &idx))
>  		return;
>  
> -	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
> -	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &src_clip);
> +	iosys_map_set_vaddr_iomem(&dst, sdev->screen_base);
> +	iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
> +	drm_fb_blit(&dst, &sdev->pitch, sdev->format->format,
> +		    shadow_plane_state->data, fb, &src_clip);
>  
>  	drm_dev_exit(idx);
>  }
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 55145eca0782..21daea7fda99 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -6,6 +6,7 @@
>  #ifndef __LINUX_DRM_FORMAT_HELPER_H
>  #define __LINUX_DRM_FORMAT_HELPER_H
>  
> +struct iosys_map;
>  struct drm_format_info;
>  struct drm_framebuffer;
>  struct drm_rect;
> @@ -39,9 +40,9 @@ void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst, unsigned int dst_pit
>  void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
>  			      const struct drm_framebuffer *fb, const struct drm_rect *clip);
>  
> -int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_format,
> -		     const void *vmap, const struct drm_framebuffer *fb,
> -		     const struct drm_rect *rect);
> +int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
> +		const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +		const struct drm_rect *rect);
>  
>  void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *src,
>  			     const struct drm_framebuffer *fb, const struct drm_rect *clip);
> -- 
> 2.37.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
