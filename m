Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33F4B6BB
	for <lists.virtualization@lfdr.de>; Wed, 19 Jun 2019 13:09:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 32BA6107F;
	Wed, 19 Jun 2019 11:09:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6293B107F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 11:09:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5131B832
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 11:09:08 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p26so26637461edr.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Y4GSKeCxJOgBNmn285dQtmwkYvSlROxIywFguE4X2O8=;
	b=fWazkw0TX0zMESV9BeuzYc7r57HbzPWhl2QefHRfXlkuYhZXTAMe3lHCoH4S4uHslg
	eUp+EKWZ9cM7q1bKimUB89IjflyIj1R0vMKgj7WiFygkrSyKa77wqIYaeaKchjlE+SVw
	VhMNlHvU2/iLMeCEH1kJaUcnov8MRHZq9sjGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=Y4GSKeCxJOgBNmn285dQtmwkYvSlROxIywFguE4X2O8=;
	b=b1hCU44h3ocKSAjD9rOujD3QzI4jPmp+XT22FjI6b87QK135dTEsOnyoSW6dmt9Ok6
	ylrYg8ZgrrYU5+mGi8XAp9EoabIKMpYx369FL0YAnXWdFJtnyVyllgfw5lTy2TpmdLL5
	PhkWnM7rV0rzAdeN0OCGx1atrV0MvR29GQGlUG8pEl7Gj/QMQXkntUwnwOJBySt3QH3l
	uMbdt7KPzHDjTgEpixv7EEphcY/RW1PdeWpxw1MuyQdwhghUuYSd7mZ5nFEXjCV5SN6w
	U9Y5rjzF23VruO5+WZJ439Z2V4GPYxCvbXjBZ/prdTdYsfUID9Gk7XDnXuObvgyV/wDb
	SMVw==
X-Gm-Message-State: APjAAAU4CuwqgcbOrNoH/2HRoaMIoaBQ31EOlJO6Pke2Kv0TabaJ+mbs
	hvGiTYHbFE9dWkHG4HUfA7gBCw==
X-Google-Smtp-Source: APXvYqxN7fRiV5hi8HTQ63ymgdaFtW6z8GpHO8Q8ACquWKrp1cDzhV6vjBBRbkYE36i801HPT+hUcA==
X-Received: by 2002:aa7:d30b:: with SMTP id p11mr92006989edq.23.1560942546910; 
	Wed, 19 Jun 2019 04:09:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	g18sm5421605edh.13.2019.06.19.04.09.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 04:09:06 -0700 (PDT)
Date: Wed, 19 Jun 2019 13:09:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 08/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
Message-ID: <20190619110902.GO12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>
References: <20190619090420.6667-1-kraxel@redhat.com>
	<20190619090420.6667-9-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619090420.6667-9-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Sean Paul <sean@poorly.run>
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

On Wed, Jun 19, 2019 at 11:04:16AM +0200, Gerd Hoffmann wrote:
> Use gem reservation helpers and direct reservation_object_* calls
> instead of ttm.
> 
> v3: Also attach the array of gem objects to the virtio command buffer,
> so we can drop the object references in the completion callback.  Needed
> because ttm fence helpers grab a reference for us, but gem helpers
> don't.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

I think this looks reasonable now, but since it now touches virtio
lifetime management I'm not sure I can convince myself of its correctness.
I didn't spot anything fundamentally wrong with the remaining patches, so
on 8-12:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But I think you want someone with clue about virtio to double-check stuff
doesn't get leaked or the driver oopses somewhere. Specifically I'm not
sure whether you have some more traps lurking around buffer destruction,
since ttm keeps stuff on the lru for longer than just until all the fences
are signalled.

Also, I strongly recommend you do a very basic igt to exercise this, i.e.
allocate some buffers, submit them in a dummby op, then close the entire
drmfd. The old version should at least have tripped over kasan, maybe even
oopses somewhere.
-Daniel

> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++-
>  drivers/gpu/drm/drm_gem_array_helper.c |  2 +
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 62 +++++++++++---------------
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 16 ++++---
>  4 files changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 77ac69a8e6cc..573173c35c48 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -33,6 +33,7 @@
>  
>  #include <drm/drmP.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_array_helper.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fb_helper.h>
> @@ -115,9 +116,9 @@ struct virtio_gpu_vbuffer {
>  
>  	char *resp_buf;
>  	int resp_size;
> -
>  	virtio_gpu_resp_cb resp_cb;
>  
> +	struct drm_gem_object_array *objs;
>  	struct list_head list;
>  };
>  
> @@ -301,7 +302,8 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
>  					    uint32_t resource_id);
>  void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
>  			   void *data, uint32_t data_size,
> -			   uint32_t ctx_id, struct virtio_gpu_fence *fence);
> +			   uint32_t ctx_id, struct virtio_gpu_fence *fence,
> +			   struct drm_gem_object_array *objs);
>  void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
>  					  uint32_t resource_id, uint32_t ctx_id,
>  					  uint64_t offset, uint32_t level,
> diff --git a/drivers/gpu/drm/drm_gem_array_helper.c b/drivers/gpu/drm/drm_gem_array_helper.c
> index d35c77c4a02d..fde6c2e63253 100644
> --- a/drivers/gpu/drm/drm_gem_array_helper.c
> +++ b/drivers/gpu/drm/drm_gem_array_helper.c
> @@ -57,6 +57,7 @@ drm_gem_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents)
>  	}
>  	return objs;
>  }
> +EXPORT_SYMBOL(drm_gem_array_from_handles);
>  
>  /**
>   * drm_gem_array_put_free -- put gem objects and free array.
> @@ -74,3 +75,4 @@ void drm_gem_array_put_free(struct drm_gem_object_array *objs)
>  	}
>  	drm_gem_array_free(objs);
>  }
> +EXPORT_SYMBOL(drm_gem_array_put_free);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 5cffd2e54c04..21ebf5cdb8bc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -105,14 +105,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  	struct drm_virtgpu_execbuffer *exbuf = data;
>  	struct virtio_gpu_device *vgdev = dev->dev_private;
>  	struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
> -	struct drm_gem_object *gobj;
>  	struct virtio_gpu_fence *out_fence;
> -	struct virtio_gpu_object *qobj;
>  	int ret;
>  	uint32_t *bo_handles = NULL;
>  	void __user *user_bo_handles = NULL;
> -	struct list_head validate_list;
> -	struct ttm_validate_buffer *buflist = NULL;
> +	struct drm_gem_object_array *buflist = NULL;
>  	int i;
>  	struct ww_acquire_ctx ticket;
>  	struct sync_file *sync_file;
> @@ -155,15 +152,10 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  			return out_fence_fd;
>  	}
>  
> -	INIT_LIST_HEAD(&validate_list);
>  	if (exbuf->num_bo_handles) {
> -
>  		bo_handles = kvmalloc_array(exbuf->num_bo_handles,
> -					   sizeof(uint32_t), GFP_KERNEL);
> -		buflist = kvmalloc_array(exbuf->num_bo_handles,
> -					   sizeof(struct ttm_validate_buffer),
> -					   GFP_KERNEL | __GFP_ZERO);
> -		if (!bo_handles || !buflist) {
> +					    sizeof(uint32_t), GFP_KERNEL);
> +		if (!bo_handles) {
>  			ret = -ENOMEM;
>  			goto out_unused_fd;
>  		}
> @@ -175,25 +167,22 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  			goto out_unused_fd;
>  		}
>  
> -		for (i = 0; i < exbuf->num_bo_handles; i++) {
> -			gobj = drm_gem_object_lookup(drm_file, bo_handles[i]);
> -			if (!gobj) {
> -				ret = -ENOENT;
> -				goto out_unused_fd;
> -			}
> -
> -			qobj = gem_to_virtio_gpu_obj(gobj);
> -			buflist[i].bo = &qobj->tbo;
> -
> -			list_add(&buflist[i].head, &validate_list);
> +		buflist = drm_gem_array_from_handles(drm_file, bo_handles,
> +						     exbuf->num_bo_handles);
> +		if (!buflist) {
> +			ret = -ENOENT;
> +			goto out_unused_fd;
>  		}
>  		kvfree(bo_handles);
>  		bo_handles = NULL;
>  	}
>  
> -	ret = virtio_gpu_object_list_validate(&ticket, &validate_list);
> -	if (ret)
> -		goto out_free;
> +	if (buflist) {
> +		ret = drm_gem_lock_reservations(buflist->objs, buflist->nents,
> +						&ticket);
> +		if (ret)
> +			goto out_unused_fd;
> +	}
>  
>  	buf = memdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
>  	if (IS_ERR(buf)) {
> @@ -219,25 +208,26 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>  		fd_install(out_fence_fd, sync_file->file);
>  	}
>  
> +	if (buflist) {
> +		for (i = 0; i < exbuf->num_bo_handles; i++)
> +			reservation_object_add_excl_fence(buflist->objs[i]->resv,
> +							  &out_fence->f);
> +		drm_gem_unlock_reservations(buflist->objs, buflist->nents,
> +					    &ticket);
> +	}
> +
>  	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
> -			      vfpriv->ctx_id, out_fence);
> -
> -	ttm_eu_fence_buffer_objects(&ticket, &validate_list, &out_fence->f);
> -
> -	/* fence the command bo */
> -	virtio_gpu_unref_list(&validate_list);
> -	kvfree(buflist);
> +			      vfpriv->ctx_id, out_fence, buflist);
>  	return 0;
>  
>  out_memdup:
>  	kfree(buf);
>  out_unresv:
> -	ttm_eu_backoff_reservation(&ticket, &validate_list);
> -out_free:
> -	virtio_gpu_unref_list(&validate_list);
> +	drm_gem_unlock_reservations(buflist->objs, buflist->nents, &ticket);
>  out_unused_fd:
>  	kvfree(bo_handles);
> -	kvfree(buflist);
> +	if (buflist)
> +		drm_gem_array_put_free(buflist);
>  
>  	if (out_fence_fd >= 0)
>  		put_unused_fd(out_fence_fd);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 6c1a90717535..6efea4fca012 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -191,7 +191,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
>  	} while (!virtqueue_enable_cb(vgdev->ctrlq.vq));
>  	spin_unlock(&vgdev->ctrlq.qlock);
>  
> -	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
> +	list_for_each_entry(entry, &reclaim_list, list) {
>  		resp = (struct virtio_gpu_ctrl_hdr *)entry->resp_buf;
>  
>  		trace_virtio_gpu_cmd_response(vgdev->ctrlq.vq, resp);
> @@ -218,14 +218,18 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
>  		}
>  		if (entry->resp_cb)
>  			entry->resp_cb(vgdev, entry);
> -
> -		list_del(&entry->list);
> -		free_vbuf(vgdev, entry);
>  	}
>  	wake_up(&vgdev->ctrlq.ack_queue);
>  
>  	if (fence_id)
>  		virtio_gpu_fence_event_process(vgdev, fence_id);
> +
> +	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
> +		if (entry->objs)
> +			drm_gem_array_put_free(entry->objs);
> +		list_del(&entry->list);
> +		free_vbuf(vgdev, entry);
> +	}
>  }
>  
>  void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
> @@ -939,7 +943,8 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
>  
>  void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
>  			   void *data, uint32_t data_size,
> -			   uint32_t ctx_id, struct virtio_gpu_fence *fence)
> +			   uint32_t ctx_id, struct virtio_gpu_fence *fence,
> +			   struct drm_gem_object_array *objs)
>  {
>  	struct virtio_gpu_cmd_submit *cmd_p;
>  	struct virtio_gpu_vbuffer *vbuf;
> @@ -949,6 +954,7 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
>  
>  	vbuf->data_buf = data;
>  	vbuf->data_size = data_size;
> +	vbuf->objs = objs;
>  
>  	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_SUBMIT_3D);
>  	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
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
