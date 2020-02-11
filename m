Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDFD158B54
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 09:36:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E90585247;
	Tue, 11 Feb 2020 08:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBtRZCHLuh63; Tue, 11 Feb 2020 08:36:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F64E8539A;
	Tue, 11 Feb 2020 08:36:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1746C07FE;
	Tue, 11 Feb 2020 08:35:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BFAAC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9811A85247
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ah_vPNgI17lW
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:35:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3270684430
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:35:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u6so11166389wrt.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 00:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hsu+gXyOgop18isowZZKKs2ga2iqsZd2LEer6p5GpPQ=;
 b=IkJTmHnBqkSeqUtyUWgNsTGgarFx+e3w/pLKfpfvylxwfnqItWne0uhDNuJjsmEQPz
 eBoEqm24oNpn2kKUaXmY2H/1Y0dafzRIrS2z5zJBlBsOw7nR8uxS1iuitDxWII11t6qQ
 I+F4zEX6w7lXT5sYkbD6O7gN4/WdTkZ7s9Arw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Hsu+gXyOgop18isowZZKKs2ga2iqsZd2LEer6p5GpPQ=;
 b=IadpHtwLHl8Z+kMgl5yd1EsEaVsnrp0XQJ9eaSAx3vckJfYae19oTjWbVftGyR1xhD
 a3QnXPPvAnhFOR4qJvsgpvYaDpLWdRRtd5YuQHQ+XTnRPNn5ALG7utjgN6m24Qw8mnEd
 Iw0t9mkd3zYtTWpYNQ1xCfsIzLLZLpJj7jUpnhmorlWI50etyZpamiPnA7O+OK4wQdry
 XTEpfxdq6HaO8vP5tvurYS/T6LnmiLYUEXWja40hPRKBk/qVwkFpeZPgV9bbQvlLRmz6
 dBvJnNi1bKXJErJMd4YF/6tajK8T4fwxcCY2qNNjHTxqrfe/ZP98wSY6bwYyCIXlNnkh
 QdrA==
X-Gm-Message-State: APjAAAUf5dh5+3HyUXc6AqVAY4KvZ/XUms080EeHSPfAq9sjhtQUbdjY
 2b02KWb9I4ZwZOrhbjP6bnspUQ==
X-Google-Smtp-Source: APXvYqx82fqKEARb5BEhakpp4jXR/7ODpujJp+tB36Tqmlvdm6DCSV3wY7lQglJNGOtDibcnh/t9Rg==
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr7476980wrw.313.1581410155601; 
 Tue, 11 Feb 2020 00:35:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b17sm4407581wrp.49.2020.02.11.00.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 00:35:55 -0800 (PST)
Date: Tue, 11 Feb 2020 09:35:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/virtio: add drm_driver.release callback.
Message-ID: <20200211083553.GU43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org,
 olvaffe@gmail.com, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200210100819.29761-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210100819.29761-1-kraxel@redhat.com>
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

On Mon, Feb 10, 2020 at 11:08:19AM +0100, Gerd Hoffmann wrote:
> Split virtio_gpu_deinit(), move the drm shutdown and release to
> virtio_gpu_release().  Also free vbufs in case we can't queue them.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h     | 1 +
>  drivers/gpu/drm/virtio/virtgpu_display.c | 1 -
>  drivers/gpu/drm/virtio/virtgpu_drv.c     | 4 ++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c     | 5 +++++
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 9 ++++++++-
>  5 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index d278c8c50f39..09a485b001e7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -217,6 +217,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
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
> index 8cf27af3ad53..664a741a3b0b 100644
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
> @@ -136,6 +137,7 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
>  	struct drm_device *dev = vdev->priv;
>  
>  	drm_dev_unregister(dev);
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
> index c1086df49816..b45d12e3db2a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -240,6 +240,11 @@ void virtio_gpu_deinit(struct drm_device *dev)
>  	flush_work(&vgdev->config_changed_work);
>  	vgdev->vdev->config->reset(vgdev->vdev);
>  	vgdev->vdev->config->del_vqs(vgdev->vdev);
> +}
> +
> +void virtio_gpu_release(struct drm_device *dev)

Split lgtm, but again I think you want drm_dev_enter/exit. And maybe a
changelog.
-Daniel

> +{
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
>  
>  	virtio_gpu_modeset_fini(vgdev);
>  	virtio_gpu_free_vbufs(vgdev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index cc02fc4bab2a..cc674b45f904 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -330,6 +330,11 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>  	bool notify = false;
>  	int ret;
>  
> +	if (!vgdev->vqs_ready) {
> +		free_vbuf(vgdev, vbuf);
> +		return;
> +	}
> +
>  	if (vgdev->has_indirect)
>  		elemcnt = 1;
>  
> @@ -462,8 +467,10 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
>  	int ret;
>  	int outcnt;
>  
> -	if (!vgdev->vqs_ready)
> +	if (!vgdev->vqs_ready) {
> +		free_vbuf(vgdev, vbuf);
>  		return;
> +	}
>  
>  	sg_init_one(&ccmd, vbuf->buf, vbuf->size);
>  	sgs[0] = &ccmd;
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
