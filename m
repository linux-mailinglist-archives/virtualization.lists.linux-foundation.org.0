Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28648520
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 16:18:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7B3FEACC;
	Mon, 17 Jun 2019 14:18:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9ACFDACC
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:18:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 05D332C3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:18:10 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d4so16380266edr.13
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=U2V9LJPWxdq3Nk0NdolFrZTzs3MZNPXv0KUg5LpciuY=;
	b=TX9y/JY5+hWC5Xm03AWZ7CFI378GG+jP0eC99ozrl7NkaoFW7f2OyEKmFeRlTvFdZT
	mdBp9hIJKhB/xFbTv3WTXFNOIL+SPWdM7qHW4Yl7/gp+275Kk4xi7OuN+a9JSaDJfGDY
	DR3ea0qGW/U8eTxdzsyRLfEoBA3bDdI7LjFHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=U2V9LJPWxdq3Nk0NdolFrZTzs3MZNPXv0KUg5LpciuY=;
	b=R7nVDxeiF72P4ERPQqkZc5NUxjwr3F5kjgycCNIxn0hQjuXggv9NivWVpreuYx0TJO
	ChO0w30g7pHwT6LKKpKuB7Eiw5h89feORZZ0i85Y0YTbJo7SSSMHZXdvSt94Z8AQwFsT
	oypU3a3O4mI2cfxL6GXB7wiWZNslYhzPVHh/e3IsDKqoMGMVHkLKbgtOlZhlDO4M/NSz
	lXTa+55m34+/k8qhrre8oTSZpTljfCLkywQDdX+JiGzEEpqjtarbQIgfxbNZ//33c8jz
	6FrDetqjzdNWU8/2W8xrgMoyIfpVFKGJHIG2p1U/J+BLxsa1gcokd8EQwe/G5ofcMta0
	Bptw==
X-Gm-Message-State: APjAAAVXwilXLyPTBTcbaehVkS+hKchAW6POQhug3jdrH4ebBrSGMMgf
	nYI1xhrE1YSCC8wzAdAVUzU7xbje8ro=
X-Google-Smtp-Source: APXvYqxt2wSFUMgJfQfTbf6PTQBIyVKZ3jLP6op9fPVtWFiQN/oXdv9RZbjIFHvLB1CrQt7BljrzOg==
X-Received: by 2002:a50:9168:: with SMTP id f37mr11016448eda.242.1560781089631;
	Mon, 17 Jun 2019 07:18:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id 14sm1868433ejj.12.2019.06.17.07.18.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 07:18:08 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:18:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/4] drm/virtio: simplify cursor updates
Message-ID: <20190617141806.GG12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
	<20190617111406.14765-4-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617111406.14765-4-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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

On Mon, Jun 17, 2019 at 01:14:05PM +0200, Gerd Hoffmann wrote:
> No need to do the reservation dance,
> we can just wait on the fence directly.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index 024c2aa0c929..4b805bf466d3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -184,7 +184,6 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>  	struct virtio_gpu_framebuffer *vgfb;
>  	struct virtio_gpu_object *bo = NULL;
>  	uint32_t handle;
> -	int ret = 0;
>  
>  	if (plane->state->crtc)
>  		output = drm_crtc_to_virtio_gpu_output(plane->state->crtc);
> @@ -208,15 +207,9 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>  			 cpu_to_le32(plane->state->crtc_w),
>  			 cpu_to_le32(plane->state->crtc_h),
>  			 0, 0, vgfb->fence);
> -		ret = virtio_gpu_object_reserve(bo, false);
> -		if (!ret) {
> -			reservation_object_add_excl_fence(bo->tbo.resv,
> -							  &vgfb->fence->f);
> -			dma_fence_put(&vgfb->fence->f);
> -			vgfb->fence = NULL;
> -			virtio_gpu_object_unreserve(bo);
> -			virtio_gpu_object_wait(bo, false);
> -		}
> +		dma_fence_wait(&vgfb->fence->f, true);
> +		dma_fence_put(&vgfb->fence->f);
> +		vgfb->fence = NULL;

Even nicer would be to add the fence using
drm_atomic_set_fence_for_plane() in the prepare_fb hook. Assuming this
isn't necessary for correctness (but then I kinda have questions about
races and stuff).

But this gets the job done too I think, so:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	}
>  
>  	if (plane->state->fb != old_state->fb) {
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
