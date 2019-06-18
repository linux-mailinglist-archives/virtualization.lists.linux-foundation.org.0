Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6F44A3D9
	for <lists.virtualization@lfdr.de>; Tue, 18 Jun 2019 16:24:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4DC09E3D;
	Tue, 18 Jun 2019 14:24:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E79F7AD1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:24:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 84473891
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:24:27 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id w13so22049979eds.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uHnXFlY19ajG5XeU4b9Sa8dKBSgR+uGugZ79Ne3Ctiw=;
	b=acF128CBhxF2kvltkkX7fAoQeLnvbBcYHTDB+c8gopqzYOIsw9tTUJ9TFqlQIBtdsI
	zQ7Uznscg2mpVIHwI3qm21u+gRcRbt8R0sFUeDu8Ycy0Bvx2MmgX11qp5AOMBLjPvlfX
	rGEIWltU5HEOeqcOVjNzNnEtGRD6vsJyhCDrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=uHnXFlY19ajG5XeU4b9Sa8dKBSgR+uGugZ79Ne3Ctiw=;
	b=L9uqUDw5eMCIyr16OA8Xv1lvelUrF8H7I2j8kwBRU5ABC0ylBoBRz7jYqPpv5UtGnH
	LRbgIIeH8TITQD7Dz8wM/dczr9oiGBaqMRvnN1/+pPVjD31toBKiw6uMQtS1nd6PRnmm
	UzTXh2C+QPTMK1JcHThRLyDpH7SgK3yAtH0CaO2ctK//KT/F0Bq3txqvUMYgSCQNVbvf
	zwU7qFW3FYbC2IIYGyw9YRyTRp0aB7Nmf5pTySEXUQatfq1/8cSxKk9zXnKDRUbo5gYG
	85Um9m6dEa6KxFuzS8k1rV+H6Y5ISKR3JYy741QSQNTnGSCteAEOu9+f+3NGHp/lREfn
	WaTg==
X-Gm-Message-State: APjAAAVE9xVVqa6Nc2db58plgSEKgRMaDGf/4MciyVdxj5kQJ0v6kDiB
	AeMfkTO/CthfJ06NhRwad5AkAA==
X-Google-Smtp-Source: APXvYqxx5Ar/sJIj7A18c3YwjZinSwD1QAHaWKUNoAbyM4MPKWCKRVpPSd25DOefwPVv3Oq0Yp24Jw==
X-Received: by 2002:a17:906:924c:: with SMTP id
	c12mr37650490ejx.60.1560867866173; 
	Tue, 18 Jun 2019 07:24:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	w35sm2253983edd.32.2019.06.18.07.24.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 07:24:25 -0700 (PDT)
Date: Tue, 18 Jun 2019 16:24:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 08/12] drm/virtio: rework virtio_gpu_object_create
	fencing
Message-ID: <20190618142423.GE12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190618135821.8644-1-kraxel@redhat.com>
	<20190618135821.8644-9-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618135821.8644-9-kraxel@redhat.com>
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

On Tue, Jun 18, 2019 at 03:58:16PM +0200, Gerd Hoffmann wrote:
> Use gem reservation helpers and direct reservation_object_* calls
> instead of ttm.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 28 +++++++------------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 82bfbf983fd2..461f15f26517 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -141,34 +141,22 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  
>  	if (fence) {
>  		struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
> -		struct list_head validate_list;
> -		struct ttm_validate_buffer mainbuf;
> +		struct drm_gem_object *obj = &bo->gem_base;
>  		struct ww_acquire_ctx ticket;
>  		unsigned long irq_flags;
> -		bool signaled;
>  
> -		INIT_LIST_HEAD(&validate_list);
> -		memset(&mainbuf, 0, sizeof(struct ttm_validate_buffer));
> -
> -		/* use a gem reference since unref list undoes them */
> -		drm_gem_object_get(&bo->gem_base);
> -		mainbuf.bo = &bo->tbo;
> -		list_add(&mainbuf.head, &validate_list);
> -
> -		ret = virtio_gpu_object_list_validate(&ticket, &validate_list);
> +		drm_gem_object_get(obj);
> +		ret = drm_gem_lock_reservations(&obj, 1, &ticket);
>  		if (ret == 0) {
>  			spin_lock_irqsave(&drv->lock, irq_flags);
> -			signaled = virtio_fence_signaled(&fence->f);
> -			if (!signaled)
> +			if (!virtio_fence_signaled(&fence->f))
>  				/* virtio create command still in flight */
> -				ttm_eu_fence_buffer_objects(&ticket, &validate_list,
> -							    &fence->f);

Same issue with the refcounting gone wrong here as in the previous patch.
-Daniel

> +				reservation_object_add_excl_fence(obj->resv,
> +								  &fence->f);
>  			spin_unlock_irqrestore(&drv->lock, irq_flags);
> -			if (signaled)
> -				/* virtio create command finished */
> -				ttm_eu_backoff_reservation(&ticket, &validate_list);
>  		}
> -		virtio_gpu_unref_list(&validate_list);
> +		drm_gem_unlock_reservations(&obj, 1, &ticket);
> +		drm_gem_object_put_unlocked(obj);
>  	}
>  
>  	*bo_ptr = bo;
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
