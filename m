Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 630626A46D8
	for <lists.virtualization@lfdr.de>; Mon, 27 Feb 2023 17:16:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67D640A49;
	Mon, 27 Feb 2023 16:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E67D640A49
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=BBsBrhRn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kgEwa0TWZIO; Mon, 27 Feb 2023 16:16:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 529B6401D8;
	Mon, 27 Feb 2023 16:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 529B6401D8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C396C007C;
	Mon, 27 Feb 2023 16:16:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7D9DC002B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Feb 2023 16:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AED3F605E0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Feb 2023 16:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED3F605E0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch
 header.a=rsa-sha256 header.s=google header.b=BBsBrhRn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KY13w9f2Lgcb
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Feb 2023 16:16:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5323D6059C
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5323D6059C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Feb 2023 16:16:46 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id o15so25532305edr.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Feb 2023 08:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFyoSbv6lM2ZYA0XKND1Vd4lvACB9TtZGPdAO/DFomU=;
 b=BBsBrhRnL9S4IyIxzC9dVFIbwDl5CXusloqIF01eKfx3uC+NIWBgm3oU9AWbXeFgPB
 q+hm1cn2KJK78ZEWn1cp9Ngi2g4e4tPo4WaQ3GE4Mdhxv3uoW3/dNshBFOLlYVQ5yaJK
 Pbk5CABrmaIlVmbQa8KjvZXPG0IbInaU/QOb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wFyoSbv6lM2ZYA0XKND1Vd4lvACB9TtZGPdAO/DFomU=;
 b=1Gqot8e5ZLYTRg3zGi7F4vAemq/anq1piegP/9jZvkMU4zFlKnsMOV+ok20Iu6/qo8
 1YlxiWn2byZ1Ro4cWZCkb9gTYqQ2OgQzq+mHVWJ9nH8xjLTtO42TDLM4zF2XV9o5SsMX
 EngDAMOGfsxtkG4U2w/Z5IqMYlcIHH174uKqKqpscFFQYkdGZSlMG3lFq0cvwlLrSIJB
 oxzQWOgvJhwFdRYIDpLFqm5im3SEg6hakqw4RtQrD20wYicbaN8CG60MJXEuOAdcr2ra
 3GP+tksWW8rdXOOwJxENLkOnEQcwa67WJv1R3xf2LuCefgSl4C++gicsTysr2d7cCgHq
 1pwQ==
X-Gm-Message-State: AO0yUKX/cs/B7ikLtQ4qWIJiOKj0inK3OQ80NCiLSMYM2Z/Gso3yPeXW
 MtZdo+dZV4YT5Dz4orn+R2mgeA==
X-Google-Smtp-Source: AK7set9kqeABoH7vQQMqktjGPSGxHqBdJjj+AUz9bhnFiRdnxBnmtt8faLs94MbyQT6LGQXBl3UxTw==
X-Received: by 2002:a17:906:530b:b0:878:5946:c0ac with SMTP id
 h11-20020a170906530b00b008785946c0acmr30853558ejo.3.1677514604406; 
 Mon, 27 Feb 2023 08:16:44 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 rk20-20020a170907215400b008b9d2da5343sm3377765ejb.210.2023.02.27.08.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 08:16:43 -0800 (PST)
Date: Mon, 27 Feb 2023 17:16:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Add option to disable KMS support
Message-ID: <Y/zXaaFJhi8Q5YRZ@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Chia-I Wu <olvaffe@gmail.com>,
 Ryan Neph <ryanneph@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230227160114.2799001-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230227160114.2799001-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 6.0.0-6-amd64 
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Chia-I Wu <olvaffe@gmail.com>
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

On Mon, Feb 27, 2023 at 08:01:13AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a build option to disable modesetting support.  This is useful in
> cases where the guest only needs to use the GPU in a headless mode, or
> (such as in the CrOS usage) window surfaces are proxied to a host
> compositor.
> 
> v2: Use more if (IS_ENABLED(...))
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

This feels a bit much like a worksforus solution. Not objecting to landing
this, but would some kind of feature bit on the virtio hw and
autodetection in the guest driver side work? Especially if people ever
want to get this to a Just Works model with standard distros.

Usually the argument for compile option is "binary size", but you're
leaving most of the kms stuff in there so that's clearly not it :-)
-Daniel



> ---
>  drivers/gpu/drm/virtio/Kconfig       | 11 +++++++++
>  drivers/gpu/drm/virtio/Makefile      |  5 +++-
>  drivers/gpu/drm/virtio/virtgpu_drv.c |  6 ++++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h | 10 ++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c | 35 ++++++++++++++++------------
>  5 files changed, 50 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
> index 51ec7c3240c9..ea06ff2aa4b4 100644
> --- a/drivers/gpu/drm/virtio/Kconfig
> +++ b/drivers/gpu/drm/virtio/Kconfig
> @@ -11,3 +11,14 @@ config DRM_VIRTIO_GPU
>  	   QEMU based VMMs (like KVM or Xen).
>  
>  	   If unsure say M.
> +
> +config DRM_VIRTIO_GPU_KMS
> +	bool "Virtio GPU driver modesetting support"
> +	depends on DRM_VIRTIO_GPU
> +	default y
> +	help
> +	   Enable modesetting support for virtio GPU driver.  This can be
> +	   disabled in cases where only "headless" usage of the GPU is
> +	   required.
> +
> +	   If unsure, say Y.
> diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
> index b99fa4a73b68..24c7ebe87032 100644
> --- a/drivers/gpu/drm/virtio/Makefile
> +++ b/drivers/gpu/drm/virtio/Makefile
> @@ -4,8 +4,11 @@
>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>  
>  virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o virtgpu_vram.o \
> -	virtgpu_display.o virtgpu_vq.o \
> +	virtgpu_vq.o \
>  	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
>  	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
>  
> +virtio-gpu-$(CONFIG_DRM_VIRTIO_GPU_KMS) += \
> +	virtgpu_display.o
> +
>  obj-$(CONFIG_DRM_VIRTIO_GPU) += virtio-gpu.o
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index ae97b98750b6..9cb7d6dd3da6 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -172,7 +172,11 @@ MODULE_AUTHOR("Alon Levy");
>  DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
>  
>  static const struct drm_driver driver = {
> -	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
> +	.driver_features =
> +#if defined(CONFIG_DRM_VIRTIO_GPU_KMS)
> +			DRIVER_MODESET | DRIVER_ATOMIC |
> +#endif
> +			DRIVER_GEM | DRIVER_RENDER,
>  	.open = virtio_gpu_driver_open,
>  	.postclose = virtio_gpu_driver_postclose,
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index af6ffb696086..ffe8faf67247 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -426,8 +426,18 @@ virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
>  				uint32_t x, uint32_t y);
>  
>  /* virtgpu_display.c */
> +#if defined(CONFIG_DRM_VIRTIO_GPU_KMS)
>  int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
> +#else
> +static inline int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
> +{
> +	return 0;
> +}
> +static inline void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
> +{
> +}
> +#endif
>  
>  /* virtgpu_plane.c */
>  uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 27b7f14dae89..70d87e653d07 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -161,7 +161,8 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
>  		vgdev->has_virgl_3d = true;
>  #endif
> -	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
> +	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) &&
> +	    virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
>  		vgdev->has_edid = true;
>  	}
>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
> @@ -218,17 +219,19 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  		goto err_vbufs;
>  	}
>  
> -	/* get display info */
> -	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
> -			num_scanouts, &num_scanouts);
> -	vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
> -				    VIRTIO_GPU_MAX_SCANOUTS);
> -	if (!vgdev->num_scanouts) {
> -		DRM_ERROR("num_scanouts is zero\n");
> -		ret = -EINVAL;
> -		goto err_scanouts;
> +	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS)) {
> +		/* get display info */
> +		virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
> +				num_scanouts, &num_scanouts);
> +		vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
> +					    VIRTIO_GPU_MAX_SCANOUTS);
> +		if (!vgdev->num_scanouts) {
> +			DRM_ERROR("num_scanouts is zero\n");
> +			ret = -EINVAL;
> +			goto err_scanouts;
> +		}
> +		DRM_INFO("number of scanouts: %d\n", num_scanouts);
>  	}
> -	DRM_INFO("number of scanouts: %d\n", num_scanouts);
>  
>  	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
>  			num_capsets, &num_capsets);
> @@ -246,10 +249,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  		virtio_gpu_get_capsets(vgdev, num_capsets);
>  	if (vgdev->has_edid)
>  		virtio_gpu_cmd_get_edids(vgdev);
> -	virtio_gpu_cmd_get_display_info(vgdev);
> -	virtio_gpu_notify(vgdev);
> -	wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
> -			   5 * HZ);
> +	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS)) {
> +		virtio_gpu_cmd_get_display_info(vgdev);
> +		virtio_gpu_notify(vgdev);
> +		wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
> +				   5 * HZ);
> +	}
>  	return 0;
>  
>  err_scanouts:
> -- 
> 2.39.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
