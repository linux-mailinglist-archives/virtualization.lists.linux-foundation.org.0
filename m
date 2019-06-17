Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B848522
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 16:18:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C9763D81;
	Mon, 17 Jun 2019 14:18:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B7994B4B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:18:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 21FDF2C3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:18:24 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i11so16453782edq.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=255cRppfmUAELVuEBOpb3q7EnIYgii6r3uBAfeCWFHg=;
	b=QXZd0Hes9umi74jp07G814dRb7D+MKScfq/PvUjRyLM3zoC9fLVKkvWV5netvsA25k
	NUIsYDd14TDgOSfnvPb2WwyUPm83bP8nmQLJSaq/NYP2ZdXgIcMHoCO2X22RiLjgNXAc
	VYe43lVvPYBw1dig7MLt4yFnORiY0r9qeYQAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=255cRppfmUAELVuEBOpb3q7EnIYgii6r3uBAfeCWFHg=;
	b=tT/Km0hha5YEaqZhdhUlIK4AoDOJN1Cbfm8ZtqBRV3zDtBqHJmDvb79HhXr92E7tYF
	3oPJomvFyMrELgG5bNRLZZS8mR7ms83nvIxBVNdqEwkRURECcfzmpgpfYCJomVG6O37U
	CkGxrImX44XZIxQWohiOJyD3h+d6DuQV8OiGVhap3hLziSD7XRmJcWVcfCOtHRAsMNyz
	ioQRbCHgu/qEAMn5yEwXPmQi7OzhI7dc9XA/Ze2M2fRa056MFeNnW0+bYFuu6+4bNlw+
	mlO7tRc/LDAS3RF/2EDBhGCyZJVBlGV33DYROdS0KE3/PG4YIvGsbgNwpq3dzBItcFHO
	Y53g==
X-Gm-Message-State: APjAAAU3eWGkcB/i2ZUb+ZrwoAJzPtwNFwHMjSxH0xsvUEi8O6xaSAQf
	POqfmzn9m5KN3GY5ThJCIa9czQ==
X-Google-Smtp-Source: APXvYqxDQv3y3Qn61R/NUrw/NJLZtfJcmIB9+oQ+MQzul0tqmu/Xxh75ou9bVBEZdpcSUMhFOByM5g==
X-Received: by 2002:a17:906:644c:: with SMTP id
	l12mr45333686ejn.199.1560781102836; 
	Mon, 17 Jun 2019 07:18:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id f3sm2186344ejc.15.2019.06.17.07.18.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 07:18:21 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:18:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 4/4] drm/virtio: remove virtio_gpu_object_wait
Message-ID: <20190617141819.GH12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
	<20190617111406.14765-5-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617111406.14765-5-kraxel@redhat.com>
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

On Mon, Jun 17, 2019 at 01:14:06PM +0200, Gerd Hoffmann wrote:
> No users left.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  1 -
>  drivers/gpu/drm/virtio/virtgpu_object.c | 13 -------------
>  2 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 9e2d3062b01d..2cd96256ba37 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -364,7 +364,6 @@ int virtio_gpu_object_kmap(struct virtio_gpu_object *bo);
>  int virtio_gpu_object_get_sg_table(struct virtio_gpu_device *qdev,
>  				   struct virtio_gpu_object *bo);
>  void virtio_gpu_object_free_sg_table(struct virtio_gpu_object *bo);
> -int virtio_gpu_object_wait(struct virtio_gpu_object *bo, bool no_wait);
>  
>  /* virtgpu_prime.c */
>  struct sg_table *virtgpu_gem_prime_get_sg_table(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 242766d644a7..82bfbf983fd2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -233,16 +233,3 @@ void virtio_gpu_object_free_sg_table(struct virtio_gpu_object *bo)
>  	kfree(bo->pages);
>  	bo->pages = NULL;
>  }
> -
> -int virtio_gpu_object_wait(struct virtio_gpu_object *bo, bool no_wait)
> -{
> -	int r;
> -
> -	r = ttm_bo_reserve(&bo->tbo, true, no_wait, NULL);
> -	if (unlikely(r != 0))
> -		return r;
> -	r = ttm_bo_wait(&bo->tbo, true, no_wait);
> -	ttm_bo_unreserve(&bo->tbo);
> -	return r;
> -}
> -
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
