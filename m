Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9AF58A1D9
	for <lists.virtualization@lfdr.de>; Thu,  4 Aug 2022 22:21:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45D08328E;
	Thu,  4 Aug 2022 20:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45D08328E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=cIuQo9kd;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=3LNCwAyK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grHw9SklNIb6; Thu,  4 Aug 2022 20:21:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 452DF83139;
	Thu,  4 Aug 2022 20:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 452DF83139
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 708EDC0078;
	Thu,  4 Aug 2022 20:21:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D148C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Aug 2022 20:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E139D60D88
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Aug 2022 20:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E139D60D88
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ravnborg.org
 header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=cIuQo9kd; 
 dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256
 header.s=ed1 header.b=3LNCwAyK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RMKPcZ0oXnv
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Aug 2022 20:21:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE25360093
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE25360093
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Aug 2022 20:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=xkSnPbTttnxOhHWTBnilIh0iHoBa5HPmoRojRGu+rVw=;
 b=cIuQo9kdQVfww7Tfs8gxYbsDbajcRrM/bIAV0pQCxJA+4c7ZujYPHgzN6O6O3c/9Qp1tL2yVFxoTx
 3Jti7XviA6W3WJRJl708DA7GSPJoKBS1gDOWRJzl75RkJp3OhQARY8mB707XDzJop0jXPT2IoRyU8Z
 kBv6Fg4AfcQUHWc9xh0wQLQSdjHHmIIoRLvpi632dMc0lhz7bRqkERs0aI5vIfQE+eRdQEvpS3eOV/
 WbMJP+91TfUksy3YbURfSabRRbBNR1KmQmSY7ILS7Is0Mw9fkO2z0bxfndKuZHp3NbJ8ycnXZFxB4C
 O+CLr4CCxl2Adfj6omuVL8Wy4a33KKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=xkSnPbTttnxOhHWTBnilIh0iHoBa5HPmoRojRGu+rVw=;
 b=3LNCwAyKtI0MEwXkv05EBHzW+t17UxR4LaEFhQ0lnxOKrpPmLg7QagJoTVuSjMec8dVInzCq6cwuF
 W3LIO95AA==
X-HalOne-Cookie: 26ad2c18fe4e8288730b6c2192e64739cc5e5ff9
X-HalOne-ID: 0ab3fe06-1433-11ed-a6ca-d0431ea8a283
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 0ab3fe06-1433-11ed-a6ca-d0431ea8a283;
 Thu, 04 Aug 2022 20:21:37 +0000 (UTC)
Date: Thu, 4 Aug 2022 22:21:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 11/12] drm/format-helper: Rework XRGB8888-to-MONO
 conversion
Message-ID: <YuwqUMqRwxr2yyqW@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727113312.22407-12-tzimmermann@suse.de>
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

On Wed, Jul 27, 2022 at 01:33:11PM +0200, Thomas Zimmermann wrote:
> Update XRGB8888-to-MONO conversion to support struct iosys_map
> and convert all users. Although these are single-plane color formats,
> the new interface supports multi-plane formats for consistency with
> drm_fb_blit().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 28 +++++++++++++++++++---------
>  drivers/gpu/drm/solomon/ssd130x.c   |  7 ++++---
>  drivers/gpu/drm/tiny/repaper.c      |  6 +++++-
>  include/drm/drm_format_helper.h     |  5 +++--
>  4 files changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 521932fac491..d296d181659d 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -680,9 +680,9 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
>  
>  /**
>   * drm_fb_xrgb8888_to_mono - Convert XRGB8888 to monochrome
It should be documented that this only supports system memory (no io
memory support).

	Sam

> - * @dst: monochrome destination buffer (0=black, 1=white)
> - * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> - * @vaddr: XRGB8888 source buffer
> + * @dst: Array of monochrome destination buffers (0=black, 1=white)
> + * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
> + * @vmap: Array of XRGB8888 source buffers
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
>   *
> @@ -700,26 +700,36 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
>   * x-coordinate that is a multiple of 8, then the caller must take care itself
>   * of supplying a suitable clip rectangle.
>   */
> -void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vaddr,
> -			     const struct drm_framebuffer *fb, const struct drm_rect *clip)
> +void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			     const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +			     const struct drm_rect *clip)
>  {
> +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +		0, 0, 0, 0
> +	};
>  	unsigned int linepixels = drm_rect_width(clip);
>  	unsigned int lines = drm_rect_height(clip);
>  	unsigned int cpp = fb->format->cpp[0];
>  	unsigned int len_src32 = linepixels * cpp;
>  	struct drm_device *dev = fb->dev;
> +	void *vaddr = vmap[0].vaddr;
> +	unsigned int dst_pitch_0;
>  	unsigned int y;
> -	u8 *mono = dst, *gray8;
> +	u8 *mono = dst[0].vaddr, *gray8;
>  	u32 *src32;
>  
>  	if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
>  		return;
>  
> +	if (!dst_pitch)
> +		dst_pitch = default_dst_pitch;
> +	dst_pitch_0 = dst_pitch[0];
> +
>  	/*
>  	 * The mono destination buffer contains 1 bit per pixel
>  	 */
> -	if (!dst_pitch)
> -		dst_pitch = DIV_ROUND_UP(linepixels, 8);
> +	if (!dst_pitch_0)
> +		dst_pitch_0 = DIV_ROUND_UP(linepixels, 8);
>  
>  	/*
>  	 * The cma memory is write-combined so reads are uncached.
> @@ -744,7 +754,7 @@ void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vadd
>  		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
>  		drm_fb_gray8_to_mono_line(mono, gray8, linepixels);
>  		vaddr += fb->pitches[0];
> -		mono += dst_pitch;
> +		mono += dst_pitch_0;
>  	}
>  
>  	kfree(src32);
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 5a3e3b78cd9e..aa7329a65c98 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -537,11 +537,11 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
>  	kfree(buf);
>  }
>  
> -static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *map,
> +static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *vmap,
>  				struct drm_rect *rect)
>  {
>  	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
> -	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
> +	struct iosys_map dst;
>  	unsigned int dst_pitch;
>  	int ret = 0;
>  	u8 *buf = NULL;
> @@ -555,7 +555,8 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	drm_fb_xrgb8888_to_mono(buf, dst_pitch, vmap, fb, rect);
> +	iosys_map_set_vaddr(&dst, buf);
> +	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
>  
>  	ssd130x_update_rect(ssd130x, buf, rect);
>  
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 013790c45d0a..0cdf6ab8fcc5 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -513,6 +513,8 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
>  {
>  	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
>  	struct repaper_epd *epd = drm_to_epd(fb->dev);
> +	unsigned int dst_pitch = 0;
> +	struct iosys_map dst, vmap;
>  	struct drm_rect clip;
>  	int idx, ret = 0;
>  	u8 *buf = NULL;
> @@ -541,7 +543,9 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
>  	if (ret)
>  		goto out_free;
>  
> -	drm_fb_xrgb8888_to_mono(buf, 0, cma_obj->vaddr, fb, &clip);
> +	iosys_map_set_vaddr(&dst, buf);
> +	iosys_map_set_vaddr(&vmap, cma_obj->vaddr);
> +	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip);
>  
>  	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>  
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 68087c982497..1e1d8f356cc1 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -40,7 +40,8 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  		const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  		const struct drm_rect *rect);
>  
> -void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *src,
> -			     const struct drm_framebuffer *fb, const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			     const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +			     const struct drm_rect *clip);
>  
>  #endif /* __LINUX_DRM_FORMAT_HELPER_H */
> -- 
> 2.37.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
