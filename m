Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D381591E5
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:27:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3685984484;
	Tue, 11 Feb 2020 14:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKdYANKuDKCK; Tue, 11 Feb 2020 14:27:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88A7784474;
	Tue, 11 Feb 2020 14:27:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B371C07FE;
	Tue, 11 Feb 2020 14:27:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB730C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B21382043E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaQg4ztJCVs8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:27:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 12AD32038F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:27:16 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w12so12646279wrt.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=B81Helubz/3hZDr2f63ZyA0xlysSr7WeBi3vAb4q+7w=;
 b=FBpDQadfDssHONzIdiz6TzdfWN2OUK4/oJmSDUM8STx8nE/rHkGNZppmXPn0PtL584
 ZbMojHbXPDAo2sR1WlTlluWErQJsmcSkvosVYg4dliUtAhVReZ5B6PD6C6uljS4T+M+m
 7quwsA0hgYXCJ7RFuhOD6iW1AIx6jz2Bve7XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=B81Helubz/3hZDr2f63ZyA0xlysSr7WeBi3vAb4q+7w=;
 b=qNqRz0itIbi/ifDNkQcD4IEIulLW1964ZueHq9FMwLb0H4Yiw84KW49EUOCaN0wZGh
 OSo5Po/EcjAcVvePQvbLQHf/qCiOy2dUK7LHTwWkKitFXhHmQNYI9x+S+Ttncx7i5L/R
 jjPHNFrFuyAGb+5F1QP66Ueo48ByJhf1MIxMQHRdOEqXf003couCjfUAMnlyy519yqch
 t6KXlqZdo71BtwebAwfSOy00X7yDcFOUKOfCpFUIZyjiRA0rGRQff6ORIzA4lYLrQfDd
 vDVWTzGO02CCmhnPMTJb7nqJfchASpWmHDiS8Btc3Q2GaVB3UqOwtqVIX88dXQC1Wtz9
 Av5g==
X-Gm-Message-State: APjAAAXXFQwGlGo6KOAiUruE/sDMD8WT6Q9nF+5f42vQ5C3bSrYLdnci
 dNdctfAi75DmxklLp6AYCbVVFw==
X-Google-Smtp-Source: APXvYqxPdtmD49fRWAf6OVDfFpYPRx5XA1Kpu2Wc+SB5UGRs/6jQXQ2Be543NV6S5p7xjnOwRk6G2A==
X-Received: by 2002:adf:f606:: with SMTP id t6mr8812978wrp.304.1581431234436; 
 Tue, 11 Feb 2020 06:27:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o15sm5465805wra.83.2020.02.11.06.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 06:27:13 -0800 (PST)
Date: Tue, 11 Feb 2020 15:27:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4] drm/virtio: add drm_driver.release callback.
Message-ID: <20200211142711.GE2363188@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, olvaffe@gmail.com,
 gurchetansingh@chromium.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200211135805.24436-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211135805.24436-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
 olvaffe@gmail.com
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

On Tue, Feb 11, 2020 at 02:58:04PM +0100, Gerd Hoffmann wrote:
> Split virtio_gpu_deinit(), move the drm shutdown and release to
> virtio_gpu_release().  Drop vqs_ready variable, instead use
> drm_dev_{enter,exit,unplug} to avoid touching hardware after
> device removal.  Tidy up here and there.
> 
> v4: add changelog.
> v3: use drm_dev_*().
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Looks reasonable I think.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I didn't review whether you need more drm_dev_enter/exit pairs, virtio is
a bit more complex for that and I have no idea how exactly it works. Maybe
for these more complex drivers we need a drm_dev_assert_entered() or so
that uses the right srcu lockdep annotations to make sure we do this
right. Sprinkling that check into a few low-level hw functions (touching
registers or whatever) should catch most issues.
-Daniel

> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |  3 ++-
>  drivers/gpu/drm/virtio/virtgpu_display.c |  1 -
>  drivers/gpu/drm/virtio/virtgpu_drv.c     |  6 +++++-
>  drivers/gpu/drm/virtio/virtgpu_kms.c     |  7 ++++--
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 27 +++++++++++++-----------
>  5 files changed, 27 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 7fd8361e1c9e..af9403e1cf78 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -32,6 +32,7 @@
>  #include <linux/virtio_gpu.h>
>  
>  #include <drm/drm_atomic.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem.h>
> @@ -177,7 +178,6 @@ struct virtio_gpu_device {
>  	struct virtio_gpu_queue ctrlq;
>  	struct virtio_gpu_queue cursorq;
>  	struct kmem_cache *vbufs;
> -	bool vqs_ready;
>  
>  	bool disable_notify;
>  	bool pending_notify;
> @@ -219,6 +219,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
>  /* virtio_kms.c */
>  int virtio_gpu_init(struct drm_device *dev);
>  void virtio_gpu_deinit(struct drm_device *dev);
> +void virtio_gpu_release(struct drm_device *dev);
>  int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
>  void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index 7b0f0643bb2d..af953db4a0c9 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -368,6 +368,5 @@ void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
>  
>  	for (i = 0 ; i < vgdev->num_scanouts; ++i)
>  		kfree(vgdev->outputs[i].edid);
> -	drm_atomic_helper_shutdown(vgdev->ddev);
>  	drm_mode_config_cleanup(vgdev->ddev);
>  }
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 8cf27af3ad53..ab4bed78e656 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -31,6 +31,7 @@
>  #include <linux/pci.h>
>  
>  #include <drm/drm.h>
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  
> @@ -135,7 +136,8 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
>  {
>  	struct drm_device *dev = vdev->priv;
>  
> -	drm_dev_unregister(dev);
> +	drm_dev_unplug(dev);
> +	drm_atomic_helper_shutdown(dev);
>  	virtio_gpu_deinit(dev);
>  	drm_dev_put(dev);
>  }
> @@ -214,4 +216,6 @@ static struct drm_driver driver = {
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> +
> +	.release = virtio_gpu_release,
>  };
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index c1086df49816..4009c2f97d08 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -199,7 +199,6 @@ int virtio_gpu_init(struct drm_device *dev)
>  	virtio_gpu_modeset_init(vgdev);
>  
>  	virtio_device_ready(vgdev->vdev);
> -	vgdev->vqs_ready = true;
>  
>  	if (num_capsets)
>  		virtio_gpu_get_capsets(vgdev, num_capsets);
> @@ -234,12 +233,16 @@ void virtio_gpu_deinit(struct drm_device *dev)
>  	struct virtio_gpu_device *vgdev = dev->dev_private;
>  
>  	flush_work(&vgdev->obj_free_work);
> -	vgdev->vqs_ready = false;
>  	flush_work(&vgdev->ctrlq.dequeue_work);
>  	flush_work(&vgdev->cursorq.dequeue_work);
>  	flush_work(&vgdev->config_changed_work);
>  	vgdev->vdev->config->reset(vgdev->vdev);
>  	vgdev->vdev->config->del_vqs(vgdev->vdev);
> +}
> +
> +void virtio_gpu_release(struct drm_device *dev)
> +{
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
>  
>  	virtio_gpu_modeset_fini(vgdev);
>  	virtio_gpu_free_vbufs(vgdev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index a682c2fcbe9a..cfe9c54f87a3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -330,7 +330,14 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>  {
>  	struct virtqueue *vq = vgdev->ctrlq.vq;
>  	bool notify = false;
> -	int ret;
> +	int ret, idx;
> +
> +	if (!drm_dev_enter(vgdev->ddev, &idx)) {
> +		if (fence && vbuf->objs)
> +			virtio_gpu_array_unlock_resv(vbuf->objs);
> +		free_vbuf(vgdev, vbuf);
> +		return;
> +	}
>  
>  	if (vgdev->has_indirect)
>  		elemcnt = 1;
> @@ -338,14 +345,6 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>  again:
>  	spin_lock(&vgdev->ctrlq.qlock);
>  
> -	if (!vgdev->vqs_ready) {
> -		spin_unlock(&vgdev->ctrlq.qlock);
> -
> -		if (fence && vbuf->objs)
> -			virtio_gpu_array_unlock_resv(vbuf->objs);
> -		return;
> -	}
> -
>  	if (vq->num_free < elemcnt) {
>  		spin_unlock(&vgdev->ctrlq.qlock);
>  		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
> @@ -379,6 +378,7 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>  		else
>  			virtqueue_notify(vq);
>  	}
> +	drm_dev_exit(idx);
>  }
>  
>  static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
> @@ -460,12 +460,13 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
>  {
>  	struct virtqueue *vq = vgdev->cursorq.vq;
>  	struct scatterlist *sgs[1], ccmd;
> +	int idx, ret, outcnt;
>  	bool notify;
> -	int ret;
> -	int outcnt;
>  
> -	if (!vgdev->vqs_ready)
> +	if (!drm_dev_enter(vgdev->ddev, &idx)) {
> +		free_vbuf(vgdev, vbuf);
>  		return;
> +	}
>  
>  	sg_init_one(&ccmd, vbuf->buf, vbuf->size);
>  	sgs[0] = &ccmd;
> @@ -490,6 +491,8 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
>  
>  	if (notify)
>  		virtqueue_notify(vq);
> +
> +	drm_dev_exit(idx);
>  }
>  
>  /* just create gem objects for userspace and long lived objects,
> -- 
> 2.18.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
