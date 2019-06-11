Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3323D12A
	for <lists.virtualization@lfdr.de>; Tue, 11 Jun 2019 17:42:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC588F74;
	Tue, 11 Jun 2019 15:42:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 12918CDD
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 15:42:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F1976174
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 15:42:51 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id w13so20817456eds.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BkaQ44VYcLgrCEyARS/Ty4P5nJLX6sSZ9QJ2AuozWlU=;
	b=HM5nMwM3r7lp//mDQTILtcS5qaJnpK6OEbvKzSbx6picx1r0+t+zYSoljicMjGivuL
	TUrK4HdCNUhn7Nqzdm+DRRDLznnkUdh90mcSkrxrADZes7DbcYnkpZqeEQvOiltv9mSE
	OxUCXyzydtaBmxpJWU2d+O/+rKvdWxzcsFZNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=BkaQ44VYcLgrCEyARS/Ty4P5nJLX6sSZ9QJ2AuozWlU=;
	b=Wbi90UEhGs9Cu9hbkdPRgUb8rtU1bT1Onq5l1vaBiKfjK91geBCfbG8/fR/XYrGWze
	nAyD6HfpSIgfkV/Y2K5Yu4cK6Zwp3MqK0DlywRs/ZuDl1AtdYqFpuPWJgpYscE1KB4C/
	4qnHwOuH85oc3RVtOw1tc+4YEHnihk4NRtpSDJjvBrRmcM2HVbVbWyfjgBaNEMpTMx5R
	N+wqW1sAsMRAGzeXE67jwsTwXjjhYwcnmzEGrGtWV5zFpiNbA+4sgo9amv3dNYGTI5fl
	bX4wCW8pDXJbNlRrC4A0f70nBgd8ppFfElaxVBwDgYLPqLGxfWntZIwsRwXW8qGX+nk7
	cqYA==
X-Gm-Message-State: APjAAAUTne7loDWDR2FtN3CJsh7VR7ETFDzGa3diLCYL5Na3nWWYj3MK
	JsO7+K9ReUtgOVgB2co3J0CWSQ==
X-Google-Smtp-Source: APXvYqyRnacC3y1JrS4WUDaqH/+7OISIA4B9JNSo/AW5zVwS5ucjKWFdQXeMQYKaoRcM9Y2LOgO6QQ==
X-Received: by 2002:a17:907:2177:: with SMTP id
	rl23mr32215187ejb.14.1560267770529; 
	Tue, 11 Jun 2019 08:42:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id m6sm3813267ede.2.2019.06.11.08.42.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 08:42:49 -0700 (PDT)
Date: Tue, 11 Jun 2019 17:42:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: drop framebuffer dirty tracking code
Message-ID: <20190611154246.GG2458@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>
References: <20190611125408.29421-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611125408.29421-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
	open list <linux-kernel@vger.kernel.org>
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

On Tue, Jun 11, 2019 at 02:54:07PM +0200, Gerd Hoffmann wrote:
> No need to have our own implementation,
> atomic helpers can do it for us.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Nice!

I think you got it all, most of the custom code already disappeared with
the switch to generic fbdev code.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |   7 --
>  drivers/gpu/drm/virtio/virtgpu_display.c |  20 +--
>  drivers/gpu/drm/virtio/virtgpu_fb.c      | 150 -----------------------
>  drivers/gpu/drm/virtio/Makefile          |   2 +-
>  4 files changed, 3 insertions(+), 176 deletions(-)
>  delete mode 100644 drivers/gpu/drm/virtio/virtgpu_fb.c
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 5faccf92aa15..9e2d3062b01d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -142,9 +142,6 @@ struct virtio_gpu_output {
>  
>  struct virtio_gpu_framebuffer {
>  	struct drm_framebuffer base;
> -	int x1, y1, x2, y2; /* dirty rect */
> -	spinlock_t dirty_lock;
> -	uint32_t hw_res_handle;
>  	struct virtio_gpu_fence *fence;
>  };
>  #define to_virtio_gpu_framebuffer(x) \
> @@ -254,10 +251,6 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
>  			      struct drm_device *dev,
>  			      uint32_t handle, uint64_t *offset_p);
>  
> -/* virtio_fb */
> -int virtio_gpu_surface_dirty(struct virtio_gpu_framebuffer *qfb,
> -			     struct drm_clip_rect *clips,
> -			     unsigned int num_clips);
>  /* virtio vg */
>  int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index 86843a4d6102..ba16e8cb7124 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -29,6 +29,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_damage_helper.h>
>  
>  #define XRES_MIN    32
>  #define YRES_MIN    32
> @@ -49,23 +50,10 @@ static const struct drm_crtc_funcs virtio_gpu_crtc_funcs = {
>  	.atomic_destroy_state   = drm_atomic_helper_crtc_destroy_state,
>  };
>  
> -static int
> -virtio_gpu_framebuffer_surface_dirty(struct drm_framebuffer *fb,
> -				     struct drm_file *file_priv,
> -				     unsigned int flags, unsigned int color,
> -				     struct drm_clip_rect *clips,
> -				     unsigned int num_clips)
> -{
> -	struct virtio_gpu_framebuffer *virtio_gpu_fb
> -		= to_virtio_gpu_framebuffer(fb);
> -
> -	return virtio_gpu_surface_dirty(virtio_gpu_fb, clips, num_clips);
> -}
> -
>  static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs = {
>  	.create_handle = drm_gem_fb_create_handle,
>  	.destroy = drm_gem_fb_destroy,
> -	.dirty = virtio_gpu_framebuffer_surface_dirty,
> +	.dirty = drm_atomic_helper_dirtyfb,
>  };
>  
>  int
> @@ -85,10 +73,6 @@ virtio_gpu_framebuffer_init(struct drm_device *dev,
>  		vgfb->base.obj[0] = NULL;
>  		return ret;
>  	}
> -
> -	spin_lock_init(&vgfb->dirty_lock);
> -	vgfb->x1 = vgfb->y1 = INT_MAX;
> -	vgfb->x2 = vgfb->y2 = 0;
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_fb.c b/drivers/gpu/drm/virtio/virtgpu_fb.c
> deleted file mode 100644
> index b07584b1c2bf..000000000000
> --- a/drivers/gpu/drm/virtio/virtgpu_fb.c
> +++ /dev/null
> @@ -1,150 +0,0 @@
> -/*
> - * Copyright (C) 2015 Red Hat, Inc.
> - * All Rights Reserved.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining
> - * a copy of this software and associated documentation files (the
> - * "Software"), to deal in the Software without restriction, including
> - * without limitation the rights to use, copy, modify, merge, publish,
> - * distribute, sublicense, and/or sell copies of the Software, and to
> - * permit persons to whom the Software is furnished to do so, subject to
> - * the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the
> - * next paragraph) shall be included in all copies or substantial
> - * portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> - * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
> - * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> - * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> - * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> - */
> -
> -#include <drm/drmP.h>
> -#include <drm/drm_fb_helper.h>
> -#include "virtgpu_drv.h"
> -
> -static int virtio_gpu_dirty_update(struct virtio_gpu_framebuffer *fb,
> -				   bool store, int x, int y,
> -				   int width, int height)
> -{
> -	struct drm_device *dev = fb->base.dev;
> -	struct virtio_gpu_device *vgdev = dev->dev_private;
> -	bool store_for_later = false;
> -	int bpp = fb->base.format->cpp[0];
> -	int x2, y2;
> -	unsigned long flags;
> -	struct virtio_gpu_object *obj = gem_to_virtio_gpu_obj(fb->base.obj[0]);
> -
> -	if ((width <= 0) ||
> -	    (x + width > fb->base.width) ||
> -	    (y + height > fb->base.height)) {
> -		DRM_DEBUG("values out of range %dx%d+%d+%d, fb %dx%d\n",
> -			  width, height, x, y,
> -			  fb->base.width, fb->base.height);
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * Can be called with pretty much any context (console output
> -	 * path).  If we are in atomic just store the dirty rect info
> -	 * to send out the update later.
> -	 *
> -	 * Can't test inside spin lock.
> -	 */
> -	if (in_atomic() || store)
> -		store_for_later = true;
> -
> -	x2 = x + width - 1;
> -	y2 = y + height - 1;
> -
> -	spin_lock_irqsave(&fb->dirty_lock, flags);
> -
> -	if (fb->y1 < y)
> -		y = fb->y1;
> -	if (fb->y2 > y2)
> -		y2 = fb->y2;
> -	if (fb->x1 < x)
> -		x = fb->x1;
> -	if (fb->x2 > x2)
> -		x2 = fb->x2;
> -
> -	if (store_for_later) {
> -		fb->x1 = x;
> -		fb->x2 = x2;
> -		fb->y1 = y;
> -		fb->y2 = y2;
> -		spin_unlock_irqrestore(&fb->dirty_lock, flags);
> -		return 0;
> -	}
> -
> -	fb->x1 = fb->y1 = INT_MAX;
> -	fb->x2 = fb->y2 = 0;
> -
> -	spin_unlock_irqrestore(&fb->dirty_lock, flags);
> -
> -	{
> -		uint32_t offset;
> -		uint32_t w = x2 - x + 1;
> -		uint32_t h = y2 - y + 1;
> -
> -		offset = (y * fb->base.pitches[0]) + x * bpp;
> -
> -		virtio_gpu_cmd_transfer_to_host_2d(vgdev, obj,
> -						   offset,
> -						   cpu_to_le32(w),
> -						   cpu_to_le32(h),
> -						   cpu_to_le32(x),
> -						   cpu_to_le32(y),
> -						   NULL);
> -
> -	}
> -	virtio_gpu_cmd_resource_flush(vgdev, obj->hw_res_handle,
> -				      x, y, x2 - x + 1, y2 - y + 1);
> -	return 0;
> -}
> -
> -int virtio_gpu_surface_dirty(struct virtio_gpu_framebuffer *vgfb,
> -			     struct drm_clip_rect *clips,
> -			     unsigned int num_clips)
> -{
> -	struct virtio_gpu_device *vgdev = vgfb->base.dev->dev_private;
> -	struct virtio_gpu_object *obj = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> -	struct drm_clip_rect norect;
> -	struct drm_clip_rect *clips_ptr;
> -	int left, right, top, bottom;
> -	int i;
> -	int inc = 1;
> -
> -	if (!num_clips) {
> -		num_clips = 1;
> -		clips = &norect;
> -		norect.x1 = norect.y1 = 0;
> -		norect.x2 = vgfb->base.width;
> -		norect.y2 = vgfb->base.height;
> -	}
> -	left = clips->x1;
> -	right = clips->x2;
> -	top = clips->y1;
> -	bottom = clips->y2;
> -
> -	/* skip the first clip rect */
> -	for (i = 1, clips_ptr = clips + inc;
> -	     i < num_clips; i++, clips_ptr += inc) {
> -		left = min_t(int, left, (int)clips_ptr->x1);
> -		right = max_t(int, right, (int)clips_ptr->x2);
> -		top = min_t(int, top, (int)clips_ptr->y1);
> -		bottom = max_t(int, bottom, (int)clips_ptr->y2);
> -	}
> -
> -	if (obj->dumb)
> -		return virtio_gpu_dirty_update(vgfb, false, left, top,
> -					       right - left, bottom - top);
> -
> -	virtio_gpu_cmd_resource_flush(vgdev, obj->hw_res_handle,
> -				      left, top, right - left, bottom - top);
> -	return 0;
> -}
> diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
> index 42949a17ff70..458e606a936f 100644
> --- a/drivers/gpu/drm/virtio/Makefile
> +++ b/drivers/gpu/drm/virtio/Makefile
> @@ -4,7 +4,7 @@
>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>  
>  virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o \
> -	virtgpu_fb.o virtgpu_display.o virtgpu_vq.o virtgpu_ttm.o \
> +	virtgpu_display.o virtgpu_vq.o virtgpu_ttm.o \
>  	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
>  	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
>  
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
