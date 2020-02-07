Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D50571558BF
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 14:49:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77E9A81EFA;
	Fri,  7 Feb 2020 13:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GN3HoDfzrKGy; Fri,  7 Feb 2020 13:49:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A83D186C34;
	Fri,  7 Feb 2020 13:49:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B23AC013E;
	Fri,  7 Feb 2020 13:49:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFCEAC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ADF5E86407
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3DoNflPcFNkG
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:49:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D4E54863F2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:49:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u6so2801918wrt.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 07 Feb 2020 05:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=MwvFxS4AH5H+msf0RBllxFFr08FoXJrYwxPsNlpLaEQ=;
 b=Pxid3V/7oELCUAVYCAbBRfGbPfOEsMJg8xXN1JTmemsVv3TBTsWlXcSfrdQoBNhuTH
 1m8yIGCff9hZmpc9wEG1dS08c6ZquRHQJiToOViW2rUGp43mSk7n65o7JvuvZVSW4auZ
 cbn0VAjrrFJZ60AFoGtwm9WzugYsnujFLchNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=MwvFxS4AH5H+msf0RBllxFFr08FoXJrYwxPsNlpLaEQ=;
 b=iWewZ3IZqqYSU2YqhpvP4AlTh7gtPsnmpPyieQcrO2GEtMJ2GlZfLCzeH5jw8r+NuM
 Ipa2gvhiMmEdz4BdrDh13AryZ0j61LpAK288ZiAKhScMTM+jfJg3GFj1HwE6tQD9ledx
 yFMdlxXEO/6sVaWTZ/cxdrP7pvD0XPinYS1jEZYi7ktgyq8Gfpn5B21GS2zaSf7VM6m3
 hgZLd8LCmDAnxw4Kx5M2ODIcmyzy4lBYDbT0DqiBjxo9YKBRv8vmMCRj7qCJQxjEjWex
 Kd8dqbYZF71TpVke5mevg3oH9Mz31q83bLR8yK97AjivYAivai0R/2B3IHeOvHrMp9AM
 4SmA==
X-Gm-Message-State: APjAAAUYzB57B7C4r+42w/zRPTaggU/qPvo+/IyLcOgx81FiOk5rt0sa
 ieOlFv4SfKUW/0sYNw3Vd9kRDg==
X-Google-Smtp-Source: APXvYqwb7z6otNJpnpWZ2LemuyPi/rvqLye9AzCkf4YZs9lQDPxX/bMBWeZASc7vHTbBKNFsZlr8hQ==
X-Received: by 2002:adf:90ee:: with SMTP id i101mr4772714wri.417.1581083346294; 
 Fri, 07 Feb 2020 05:49:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r14sm3360107wrj.26.2020.02.07.05.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 05:49:05 -0800 (PST)
Date: Fri, 7 Feb 2020 14:49:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: add drm_driver.release callback.
Message-ID: <20200207134903.GD43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org,
 olvaffe@gmail.com, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200207121420.26222-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207121420.26222-1-kraxel@redhat.com>
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

On Fri, Feb 07, 2020 at 01:14:20PM +0100, Gerd Hoffmann wrote:
> Split virtio_gpu_deinit(), move the drm shutdown and release to
> virtio_gpu_release().  Also free vbufs in case we can't queue them.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h | 1 +
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 4 ++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c | 5 +++++
>  drivers/gpu/drm/virtio/virtgpu_vq.c  | 9 ++++++++-
>  4 files changed, 18 insertions(+), 1 deletion(-)
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
> +{
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
>  
>  	virtio_gpu_modeset_fini(vgdev);

This calls drm_atomic_helper_shutdown, probably want that in the remove
hook?  Everything else looks like it's in the right spot. So with that
call moved into the top of the deinit function above this is:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


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
