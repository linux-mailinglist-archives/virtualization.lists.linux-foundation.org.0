Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 59159449C10
	for <lists.virtualization@lfdr.de>; Mon,  8 Nov 2021 19:57:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C1D6083C;
	Mon,  8 Nov 2021 18:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLTEkMiJS1hc; Mon,  8 Nov 2021 18:57:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6C96460839;
	Mon,  8 Nov 2021 18:57:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF168C0036;
	Mon,  8 Nov 2021 18:57:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46715C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 18:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 350FE80E24
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 18:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tronnes.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LvvbInjf9uud
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 18:57:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16EB380E1E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ZEIejB1KmN7Tvumn+Q8xoy05D91sldAVAMCnu3bH2A=; b=oWnPxKGfEP7c8zwds8Q5X/hmgF
 3MaxLCux8b3gq5oGzQBU8QsQVs7f5xVvIV9sm0Xin32uoqFZgnPhPK8cnoD3U3Y8+JEpuD4ufOWNt
 dATmecMG13tdMtaREfpAW3NZ9lau2LLpe3+1BNKUBloEM6DWem7YYyCbrILbzLTSRZUnDKuX9nhNn
 6e2+vSVWeiONZ3jB/G5dKDmmAjxwMOB0dwZ4Jo5hxoHwZsvYr2OP9yUagDiu4Oidg3WzZgF1lAzYp
 hq5j1WH0wXCX3hGYD4g9grUopc+IdAyIeWicGT8LfZ0WIrfR41qmPMDnY7rhMEQs3wDP6K5a0yojX
 2IfiAJMg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52048
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mk9pX-0000LX-GN; Mon, 08 Nov 2021 19:57:19 +0100
Subject: Re: [PATCH v2 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-8-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6cf78eae-796d-f5a2-e93f-624599af4944@tronnes.org>
Date: Mon, 8 Nov 2021 19:57:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211101141532.26655-8-tzimmermann@suse.de>
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
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



Den 01.11.2021 15.15, skrev Thomas Zimmermann:
> Enable the FB_DAMAGE_CLIPS property to reduce display-update
> overhead. Also fixes a warning in the kernel log.
> 
>   simple-framebuffer simple-framebuffer.0: [drm] drm_plane_enable_fb_damage_clips() not called
> 
> Fix the computation of the blit rectangle. This wasn't an issue so
> far, as simpledrm always blitted the full framebuffer. The code now
> supports damage clipping and virtual screen sizes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 571f716ff427..e872121e9fb0 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -642,7 +642,7 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
>  	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
>  	struct drm_device *dev = &sdev->dev;
>  	void __iomem *dst = sdev->screen_base;
> -	struct drm_rect clip;
> +	struct drm_rect src_clip, dst_clip;
>  	int idx;
>  
>  	if (!fb)
> @@ -651,10 +651,14 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
>  	if (!drm_dev_enter(dev, &idx))
>  		return;
>  
> -	drm_rect_init(&clip, 0, 0, fb->width, fb->height);
> +	drm_rect_fp_to_int(&src_clip, &plane_state->src);
>  
> -	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &clip);
> -	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &clip);
> +	dst_clip = plane_state->dst;
> +	if (!drm_rect_intersect(&dst_clip, &src_clip))
> +		return;

You're inside drm_dev_enter here so can't just return. Move
drm_dev_enter after this like you do in update().

> +
> +	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
> +	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &src_clip);
>  
>  	drm_dev_exit(idx);
>  }
> @@ -686,20 +690,28 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
>  	struct drm_framebuffer *fb = plane_state->fb;
>  	struct drm_device *dev = &sdev->dev;
>  	void __iomem *dst = sdev->screen_base;
> -	struct drm_rect clip;
> +	struct drm_rect damage_clip, src_clip, dst_clip;
>  	int idx;
>  
>  	if (!fb)
>  		return;
>  
> -	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &clip))
> +	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage_clip))
> +		return;
> +

The following check, isn't that the same check that has just happened in
drm_atomic_helper_damage_iter_next()?

Noralf.

> +	drm_rect_fp_to_int(&src_clip, &plane_state->src);
> +	if (!drm_rect_intersect(&src_clip, &damage_clip))
> +		return;
> +
> +	dst_clip = plane_state->dst;
> +	if (!drm_rect_intersect(&dst_clip, &src_clip))
>  		return;
>  
>  	if (!drm_dev_enter(dev, &idx))
>  		return;
>  
> -	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &clip);
> -	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &clip);
> +	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
> +	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &src_clip);
>  
>  	drm_dev_exit(idx);
>  }
> @@ -794,6 +806,8 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
>  	if (ret)
>  		return ret;
>  
> +	drm_plane_enable_fb_damage_clips(&pipe->plane);
> +
>  	drm_mode_config_reset(dev);
>  
>  	return 0;
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
