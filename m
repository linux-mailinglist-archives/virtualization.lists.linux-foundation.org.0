Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0C41D1B21
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 18:35:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6BAB521FAC;
	Wed, 13 May 2020 16:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsmvlbb0xvvb; Wed, 13 May 2020 16:35:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 06FBF221B5;
	Wed, 13 May 2020 16:35:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCE94C016F;
	Wed, 13 May 2020 16:35:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8669AC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 16:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 74E91892B4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 16:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMfp1hs8yOgI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 16:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0F1C2892A0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589387701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9XHzfeBd6Ycnq2E1cOGJb06yk0FxduAZPIKhSGyVhGI=;
 b=btFvAGp8QrF+nxqe1/1DNvYxlN5J+k1OD+iTI5bVRBcok2H4dL4EwWcmaMyC0mMVxsOr2c
 cQvRrX7dmqYigNS3HqwEk4syjtTvwZNxVMHbRFxgFPQybWBTiRnsjZXLl2kquQa1hZ+5Z1
 pvhRbThqiQudECGFu3R5UJaFrSfOwHA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-JCvr7trrMSysFwq1zooObA-1; Wed, 13 May 2020 12:34:57 -0400
X-MC-Unique: JCvr7trrMSysFwq1zooObA-1
Received: by mail-wr1-f71.google.com with SMTP id p2so7013184wrm.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 09:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9XHzfeBd6Ycnq2E1cOGJb06yk0FxduAZPIKhSGyVhGI=;
 b=G+OoDDDT3yKGvHRfT25cdydbou66m//K1bAMFBz11W7mPxFKHjSG0u/6y797fVl30G
 dJnfNmtdhPLqhMmv7nEGW4g4M/WS7Vo7nf1Mx80CJO36LQ8vxUCCfnH6LKcfB+/6ri9n
 1QvccThxovHXzooX4cCNZDPbQ1PGWMWo5lP8at1dJyvP31IaOucjhvPNYl/qBntzVM7e
 rdturCK4HL9A5XD8K7+WXntJ1VYqC5reGGjCCAXRargF4C1em1d07w45PaN6gPSx5Ksr
 mvsC7JNSTmFWQzMuTzQq1m5vJ+cxLTObvoFp57W7SngiEQQN1jwY3mRwKm5katst6GpP
 gShQ==
X-Gm-Message-State: AGi0Pubj4hbaHSk3OC/JwLxxOC4Eoiul6arlbw8YFV9JOc3sg2rMQj5c
 zcNDlptEDNx54aWwFCVpZKB+a5kDRnJoBKtx+qacW1rGC843Qga9Z65MGs8PnNUC1Nu11K9fYl3
 piX7tomjX/KV2tNvd8QJXVrRwPpq7BvO5vkufn6lPuA==
X-Received: by 2002:a1c:b604:: with SMTP id g4mr20433237wmf.103.1589387696780; 
 Wed, 13 May 2020 09:34:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypKqiA2Xp0IN2p/gFQzld2/j/z7a01JqN+qAtpCQqjHgAHlWfHiJwq/aECdtAfuX0kd+FULJRA==
X-Received: by 2002:a1c:b604:: with SMTP id g4mr20433202wmf.103.1589387696440; 
 Wed, 13 May 2020 09:34:56 -0700 (PDT)
Received: from redhat.com (bzq-79-179-68-225.red.bezeqint.net. [79.179.68.225])
 by smtp.gmail.com with ESMTPSA id z1sm36576406wmf.15.2020.05.13.09.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 09:34:55 -0700 (PDT)
Date: Wed, 13 May 2020 12:34:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200513123326-mutt-send-email-mst@kernel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200311112004.47138-5-stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
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

On Wed, Mar 11, 2020 at 08:20:04PM +0900, David Stevens wrote:
> Add support for UUID-based resource sharing mechanism to virtgpu. This
> implements the new virtgpu commands and hooks them up to dma-buf's
> get_uuid callback.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 ++
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 18 +++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 41 +++++++++++++++++--
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 ++++++++++++++++++++++++++
>  5 files changed, 118 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index ab4bed78e656..776e6667042e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -165,6 +165,7 @@ static unsigned int features[] = {
>  	VIRTIO_GPU_F_VIRGL,
>  #endif
>  	VIRTIO_GPU_F_EDID,
> +	VIRTIO_GPU_F_RESOURCE_UUID,
>  };
>  static struct virtio_driver virtio_gpu_driver = {
>  	.feature_table = features,
> @@ -202,7 +203,9 @@ static struct drm_driver driver = {
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>  	.gem_prime_mmap = drm_gem_prime_mmap,
> +	.gem_prime_export = virtgpu_gem_prime_export,
>  	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
> +	.gem_prime_get_uuid = virtgpu_gem_prime_get_uuid,
>  
>  	.gem_create_object = virtio_gpu_create_object,
>  	.fops = &virtio_gpu_driver_fops,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index af9403e1cf78..fab65f0f5a4d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -49,6 +49,10 @@
>  #define DRIVER_MINOR 1
>  #define DRIVER_PATCHLEVEL 0
>  
> +#define UUID_INITIALIZING 0
> +#define UUID_INITIALIZED 1
> +#define UUID_INITIALIZATION_FAILED 2
> +
>  struct virtio_gpu_object_params {
>  	uint32_t format;
>  	uint32_t width;
> @@ -75,6 +79,9 @@ struct virtio_gpu_object {
>  
>  	bool dumb;
>  	bool created;
> +
> +	int uuid_state;
> +	uuid_t uuid;
>  };
>  #define gem_to_virtio_gpu_obj(gobj) \
>  	container_of((gobj), struct virtio_gpu_object, base.base)
> @@ -196,6 +203,7 @@ struct virtio_gpu_device {
>  	bool has_virgl_3d;
>  	bool has_edid;
>  	bool has_indirect;
> +	bool has_resource_assign_uuid;
>  
>  	struct work_struct config_changed_work;
>  
> @@ -206,6 +214,8 @@ struct virtio_gpu_device {
>  	struct virtio_gpu_drv_capset *capsets;
>  	uint32_t num_capsets;
>  	struct list_head cap_cache;
> +
> +	spinlock_t resource_export_lock;
>  };
>  
>  struct virtio_gpu_fpriv {
> @@ -338,6 +348,10 @@ void virtio_gpu_dequeue_fence_func(struct work_struct *work);
>  void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
>  
> +int
> +virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
> +				    struct virtio_gpu_object_array *objs);
> +
>  /* virtio_gpu_display.c */
>  void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
> @@ -366,6 +380,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  			     struct virtio_gpu_object **bo_ptr,
>  			     struct virtio_gpu_fence *fence);
>  /* virtgpu_prime.c */
> +struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
> +					 int flags);
> +int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
> +			       uuid_t *uuid);
>  struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
>  	struct drm_device *dev, struct dma_buf_attachment *attach,
>  	struct sg_table *sgt);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 4009c2f97d08..5a2aeb6d2f35 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -134,6 +134,7 @@ int virtio_gpu_init(struct drm_device *dev)
>  	vgdev->dev = dev->dev;
>  
>  	spin_lock_init(&vgdev->display_info_lock);
> +	spin_lock_init(&vgdev->resource_export_lock);
>  	ida_init(&vgdev->ctx_id_ida);
>  	ida_init(&vgdev->resource_ida);
>  	init_waitqueue_head(&vgdev->resp_wq);
> @@ -162,6 +163,9 @@ int virtio_gpu_init(struct drm_device *dev)
>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
>  		vgdev->has_indirect = true;
>  	}
> +	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> +		vgdev->has_resource_assign_uuid = true;
> +	}


Just a question: this relies on DMA bufs so I assume it is
not really assumed to work when DMA API is bypassed, right?
Rather than worry what does it mean, how about just
disabling  this feature without PLATFORM_DMA for now?

>  
>  	DRM_INFO("features: %cvirgl %cedid\n",
>  		 vgdev->has_virgl_3d ? '+' : '-',
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 050d24c39a8f..7c6357f59877 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -26,9 +26,44 @@
>  
>  #include "virtgpu_drv.h"
>  
> -/* Empty Implementations as there should not be any other driver for a virtual
> - * device that might share buffers with virtgpu
> - */
> +int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
> +			       uuid_t *uuid)
> +{
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +
> +	wait_event(vgdev->resp_wq, bo->uuid_state != UUID_INITIALIZING);
> +	if (bo->uuid_state != UUID_INITIALIZED)
> +		return -ENODEV;
> +
> +	uuid_copy(uuid, &bo->uuid);
> +
> +	return 0;
> +}
> +
> +struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
> +					 int flags)
> +{
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +	struct virtio_gpu_object_array *objs;
> +	int ret = 0;
> +
> +	if (vgdev->has_resource_assign_uuid) {
> +		objs = virtio_gpu_array_alloc(1);
> +		if (!objs)
> +			return ERR_PTR(-ENOMEM);
> +		virtio_gpu_array_add_obj(objs, &bo->base.base);
> +
> +		ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, objs);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	} else {
> +		bo->uuid_state = UUID_INITIALIZATION_FAILED;
> +  }
> +
> +	return drm_gem_prime_export(obj, flags);
> +}
>  
>  struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
>  	struct drm_device *dev, struct dma_buf_attachment *attach,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index cfe9c54f87a3..b968eaa46bb0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1111,3 +1111,58 @@ void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
>  	memcpy(cur_p, &output->cursor, sizeof(output->cursor));
>  	virtio_gpu_queue_cursor(vgdev, vbuf);
>  }
> +
> +static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
> +					    struct virtio_gpu_vbuffer *vbuf)
> +{
> +	struct virtio_gpu_object *obj =
> +		gem_to_virtio_gpu_obj(vbuf->objs->objs[0]);
> +	struct virtio_gpu_resp_resource_uuid *resp =
> +		(struct virtio_gpu_resp_resource_uuid *)vbuf->resp_buf;
> +	uint32_t resp_type = le32_to_cpu(resp->hdr.type);
> +
> +	spin_lock(&vgdev->resource_export_lock);
> +	WARN_ON(obj->uuid_state != UUID_INITIALIZING);
> +
> +	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
> +			obj->uuid_state == UUID_INITIALIZING) {
> +		memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
> +		obj->uuid_state = UUID_INITIALIZED;
> +	} else {
> +		obj->uuid_state = UUID_INITIALIZATION_FAILED;
> +	}
> +	spin_unlock(&vgdev->resource_export_lock);
> +
> +	wake_up_all(&vgdev->resp_wq);
> +}
> +
> +int
> +virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
> +				    struct virtio_gpu_object_array *objs)
> +{
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
> +	struct virtio_gpu_resource_assign_uuid *cmd_p;
> +	struct virtio_gpu_vbuffer *vbuf;
> +	struct virtio_gpu_resp_resource_uuid *resp_buf;
> +
> +	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
> +	if (!resp_buf) {
> +		spin_lock(&vgdev->resource_export_lock);
> +		bo->uuid_state = UUID_INITIALIZATION_FAILED;
> +		spin_unlock(&vgdev->resource_export_lock);
> +		virtio_gpu_array_put_free(objs);
> +		return -ENOMEM;
> +	}
> +
> +	cmd_p = virtio_gpu_alloc_cmd_resp(vgdev,
> +		virtio_gpu_cmd_resource_uuid_cb, &vbuf, sizeof(*cmd_p),
> +		sizeof(struct virtio_gpu_resp_resource_uuid), resp_buf);
> +	memset(cmd_p, 0, sizeof(*cmd_p));
> +
> +	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID);
> +	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> +
> +	vbuf->objs = objs;
> +	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
> +	return 0;
> +}
> -- 
> 2.25.1.481.gfbce0eb801-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
