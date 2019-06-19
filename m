Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0B4B68D
	for <lists.virtualization@lfdr.de>; Wed, 19 Jun 2019 12:55:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C730EFC8;
	Wed, 19 Jun 2019 10:55:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 06E3AFC3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 10:55:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 617BCE6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 10:55:49 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r12so24351532edo.5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XdKjQFlqc/Q5NG+TosVNuzBQ5q1pFNnMu9irob0Brm0=;
	b=TG/JK0xKXjriwqgBw8cF41pSSLLme+TnHnULLKVFltVObM+DBW7ii5OQBU587ewcUL
	CekLOuXDtRbkH2jrQPgPrFxp6hh5nzpM/EndSk/C4/eNmNj/3t3FnYKFGwkks9eDwAWb
	XBruiYUUm9LC06kmZZ3Nc6S8HcC7B1c6XJ+ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=XdKjQFlqc/Q5NG+TosVNuzBQ5q1pFNnMu9irob0Brm0=;
	b=Vgmb2gmGKKpVRKMB93GNp13mka3BJ2VisocaCQAeUE4ojtSm9pqw1lt+8iQWn+wFfy
	p9I0giCdVXFMQBt0WZN/s0doR4f3fFWxrMVIPWWACTRBEHp5PMTkKesVtV+PEqy/auhc
	dSceYu8H94IfZ5FASDUqQtE4QwCHJiY51RqYIbIkoR9rGh10hlsP1gw3LYIVK5JDIlJ0
	tAZkMnkfN6CWT3+bX9wjbczoew60aE6PV/0rm+UI27JVMOYIadiVZ1v+bln+6N8XR8h2
	GXEPXlEXb4FcgonVAjjXgxBj5PhXYkVpCJ9FI80wk34WkiGXKp/zSk1XNe5PLnYz+JhA
	7Xng==
X-Gm-Message-State: APjAAAVZWpv5AZ3JP61TtMxtlGBDtTm0RbPG9Gq83dYIFyOHdHaFQAJz
	Bg3Qb7FnHEnojaZgsaq22lZ6uA==
X-Google-Smtp-Source: APXvYqxbjH7iT/XwqoXc7vNkC8vrzVel8iukb4rPT+Y5xARzuliTDpYTj3ZbNZYgkEs3Hvc6tZtY2A==
X-Received: by 2002:a05:6402:6cb:: with SMTP id
	n11mr17462574edy.101.1560941748065; 
	Wed, 19 Jun 2019 03:55:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	l50sm5687128edb.77.2019.06.19.03.55.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 03:55:47 -0700 (PDT)
Date: Wed, 19 Jun 2019 12:55:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 06/12] drm/virtio: drop no_wait argument from
	virtio_gpu_object_reserve
Message-ID: <20190619105543.GN12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190619090420.6667-1-kraxel@redhat.com>
	<20190619090420.6667-7-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619090420.6667-7-kraxel@redhat.com>
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

On Wed, Jun 19, 2019 at 11:04:14AM +0200, Gerd Hoffmann wrote:
> All callers pass no_wait = false.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 5 ++---
>  drivers/gpu/drm/virtio/virtgpu_gem.c   | 4 ++--
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 ++--
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 2cd96256ba37..06cc0e961df6 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -398,12 +398,11 @@ static inline u64 virtio_gpu_object_mmap_offset(struct virtio_gpu_object *bo)
>  	return drm_vma_node_offset_addr(&bo->tbo.vma_node);
>  }
>  
> -static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo,
> -					 bool no_wait)
> +static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
>  {
>  	int r;
>  
> -	r = ttm_bo_reserve(&bo->tbo, true, no_wait, NULL);
> +	r = ttm_bo_reserve(&bo->tbo, true, false, NULL);
>  	if (unlikely(r != 0)) {
>  		if (r != -ERESTARTSYS) {
>  			struct virtio_gpu_device *qdev =
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 1e49e08dd545..9c9ad3b14080 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -140,7 +140,7 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
>  	if (!vgdev->has_virgl_3d)
>  		return 0;
>  
> -	r = virtio_gpu_object_reserve(qobj, false);
> +	r = virtio_gpu_object_reserve(qobj);
>  	if (r)
>  		return r;
>  
> @@ -161,7 +161,7 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
>  	if (!vgdev->has_virgl_3d)
>  		return;
>  
> -	r = virtio_gpu_object_reserve(qobj, false);
> +	r = virtio_gpu_object_reserve(qobj);
>  	if (r)
>  		return;
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 313c770ea2c5..5cffd2e54c04 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -375,7 +375,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
>  
>  	qobj = gem_to_virtio_gpu_obj(gobj);
>  
> -	ret = virtio_gpu_object_reserve(qobj, false);
> +	ret = virtio_gpu_object_reserve(qobj);
>  	if (ret)
>  		goto out;
>  
> @@ -425,7 +425,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
>  
>  	qobj = gem_to_virtio_gpu_obj(gobj);
>  
> -	ret = virtio_gpu_object_reserve(qobj, false);
> +	ret = virtio_gpu_object_reserve(qobj);
>  	if (ret)
>  		goto out;
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
