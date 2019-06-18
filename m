Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 511864A3A9
	for <lists.virtualization@lfdr.de>; Tue, 18 Jun 2019 16:16:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 545CEE4A;
	Tue, 18 Jun 2019 14:16:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1D11BE3D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:16:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 46AC482F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:16:08 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id p26so22014037edr.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wDyr/Hayw2IId/qNGbRLKP0mrDW1etMQA1PqQ01Gh10=;
	b=Mn/9T9RBbKXfNDMa8owY91k+MzyKmTXct/gRR9pkGC5sb28PLS5L9iEMP+FZmAFPw/
	nwcYkVIuVZ/ruRkYJiy/qr0IKuLKzkvmTQKUFFN64wRCq46JvEjab28ekRfZWFHW99BU
	s+ZJXt5+tn/X0ihJrtkCJrp54eaXZ/EFkx3GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=wDyr/Hayw2IId/qNGbRLKP0mrDW1etMQA1PqQ01Gh10=;
	b=Ln8gOFgeSMI4p40JFcWtPtl/TQWJJ5o3aMb/l7hhvYhPbm9iJ+G8/WRWRclX4HW93B
	kOcGwambKiYeg1DVnV1ouIvS/JUkqp4T7eIENGpIkb8Ln8HbV5/Mh4s/Pln8bCRMS7xa
	yF7TRmPg4UGeT4LBLYgt4346YQi1NtGoN2d01V4mkzfOJm3l2kTRS+S/SKIL0zy1Q1mm
	f/VqbCmDvu0jY8cUfbAvsXWlK6bWsXzJKhNNSUBsp+xe3eMBo4DFvYhTj9CkZnE7zhN+
	t0aCuNUg5NFBbgwV8vCMArGbtQoUAGlFQwf8RyWgdJRK4kYx8/Xwn46ziKL/n/FPCbKU
	b9bQ==
X-Gm-Message-State: APjAAAUL8v8+OGgBHWTbDDd6rtEmabRxy++cmI4KWMw5XJ8YVcfN6gXl
	qwhQvp2wto709ZQ3INvXyZbavQ==
X-Google-Smtp-Source: APXvYqzHXRYbcU+TSBG4oW3FDjsgiz3ekO87GItDZsVEAp5uoRHTuVJorSJpFrSxqXar92qtE0rl/g==
X-Received: by 2002:a17:906:670c:: with SMTP id
	a12mr54979446ejp.290.1560867366769; 
	Tue, 18 Jun 2019 07:16:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	i16sm2842945ejc.16.2019.06.18.07.16.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 07:16:06 -0700 (PDT)
Date: Tue, 18 Jun 2019 16:16:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 07/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
Message-ID: <20190618141604.GC12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190618135821.8644-1-kraxel@redhat.com>
	<20190618135821.8644-8-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618135821.8644-8-kraxel@redhat.com>
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

On Tue, Jun 18, 2019 at 03:58:15PM +0200, Gerd Hoffmann wrote:
> Use gem reservation helpers and direct reservation_object_* calls
> instead of ttm.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 36 ++++++++++++--------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 5cffd2e54c04..6db6a6e92dde 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -107,12 +107,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  	struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
>  	struct drm_gem_object *gobj;
>  	struct virtio_gpu_fence *out_fence;
> -	struct virtio_gpu_object *qobj;
>  	int ret;
>  	uint32_t *bo_handles = NULL;
>  	void __user *user_bo_handles = NULL;
>  	struct list_head validate_list;
> -	struct ttm_validate_buffer *buflist = NULL;
> +	struct drm_gem_object **buflist = NULL;
>  	int i;
>  	struct ww_acquire_ctx ticket;
>  	struct sync_file *sync_file;
> @@ -157,12 +156,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  
>  	INIT_LIST_HEAD(&validate_list);
>  	if (exbuf->num_bo_handles) {
> -
>  		bo_handles = kvmalloc_array(exbuf->num_bo_handles,
> -					   sizeof(uint32_t), GFP_KERNEL);
> +					    sizeof(uint32_t), GFP_KERNEL);
>  		buflist = kvmalloc_array(exbuf->num_bo_handles,
> -					   sizeof(struct ttm_validate_buffer),
> -					   GFP_KERNEL | __GFP_ZERO);
> +					 sizeof(struct drm_gem_object*),
> +					 GFP_KERNEL | __GFP_ZERO);
>  		if (!bo_handles || !buflist) {
>  			ret = -ENOMEM;
>  			goto out_unused_fd;
> @@ -181,19 +179,15 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  				ret = -ENOENT;
>  				goto out_unused_fd;
>  			}
> -
> -			qobj = gem_to_virtio_gpu_obj(gobj);
> -			buflist[i].bo = &qobj->tbo;
> -
> -			list_add(&buflist[i].head, &validate_list);
> +			buflist[i] = gobj;

I didn't bother looking, but I guess there's some room for a
array-of-gem-id to gem_bo-pointers helper function? Would only make sense
if we can share it with panfrost/v3d maybe.

>  		}
>  		kvfree(bo_handles);
>  		bo_handles = NULL;
>  	}
>  
> -	ret = virtio_gpu_object_list_validate(&ticket, &validate_list);
> +	ret = drm_gem_lock_reservations(buflist, exbuf->num_bo_handles, &ticket);
>  	if (ret)
> -		goto out_free;
> +		goto out_unused_fd;
>  
>  	buf = memdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
>  	if (IS_ERR(buf)) {
> @@ -222,21 +216,25 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
>  			      vfpriv->ctx_id, out_fence);
>  
> -	ttm_eu_fence_buffer_objects(&ticket, &validate_list, &out_fence->f);
> +	for (i = 0; i < exbuf->num_bo_handles; i++)
> +		reservation_object_add_excl_fence(buflist[i]->resv, &out_fence->f);

Helper to unref an array of gem bo? Probably also needed by other drivers.


> +	drm_gem_unlock_reservations(buflist, exbuf->num_bo_handles, &ticket);
>  
> -	/* fence the command bo */
> -	virtio_gpu_unref_list(&validate_list);
> +	for (i = 0; i < exbuf->num_bo_handles; i++)
> +		if (buflist[i])
> +			drm_gem_object_put_unlocked(buflist[i]);

I am left wondering who's holding references onto these buffers now? How
do you make sure they don't disappear untimely?

I think atm it's ttm making sure of that, but if you drop that completely
there needs to be something else.

>  	kvfree(buflist);
>  	return 0;
>  
>  out_memdup:
>  	kfree(buf);
>  out_unresv:
> -	ttm_eu_backoff_reservation(&ticket, &validate_list);
> -out_free:
> -	virtio_gpu_unref_list(&validate_list);
> +	drm_gem_unlock_reservations(buflist, exbuf->num_bo_handles, &ticket);
>  out_unused_fd:
>  	kvfree(bo_handles);
> +	for (i = 0; i < exbuf->num_bo_handles; i++)
> +		if (buflist && buflist[i])
> +			drm_gem_object_put_unlocked(buflist[i]);
>  	kvfree(buflist);
>  
>  	if (out_fence_fd >= 0)

Patch itself looks correct, just put down my thoughts while reviewing it.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
