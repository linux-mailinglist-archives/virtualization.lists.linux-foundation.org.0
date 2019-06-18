Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 874954A36E
	for <lists.virtualization@lfdr.de>; Tue, 18 Jun 2019 16:07:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 99496E47;
	Tue, 18 Jun 2019 14:07:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5DCAAB7A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:07:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C0643822
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:07:08 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id m10so21942837edv.6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kbjXiDHUcs03Ham95m0Whx0OgVZ5j2550aVQnPTfdxQ=;
	b=XjzjnU228yADptN7urnRtwf8Ole5zcytiEo9ewubNXfcudMgl6XJCKZLzRyF6DK60v
	r0lXIvAbGBB3ijq69WVn9MUKU9OXLTsAtICIh3LWg6xWSLwVd9duS4BDQdd94/O/UjBN
	Gf1rHG7pIdcfWWxcH62s7t4gajFPKygSMxMBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=kbjXiDHUcs03Ham95m0Whx0OgVZ5j2550aVQnPTfdxQ=;
	b=lqTRGsquWk9Cwr+esFIuF45Av+iqRWk9gfl2tKFgDJkB859yXPZ1yYf9F/9h38CRo6
	wfdABlNST36Y+flgqfZKz6/oU0lUA2Gf5zbAoW0p2Jy6YkNv5Nuv2tcZRR9Xr989V+G7
	zh19RRqFrhjd7tcuTTBL2qrqobaBwICosN12yx+f1nzExsN/tBAHc5264xJmbqS17Gxs
	0efz9ddkAkArnIq5K8S8lqR6G4V4Lz7jI0a4dDqRfmDrsorEzoVT1iGXLD2o8zvzf5lD
	RUxIG7eVYhGol3JueRervQnDVZI3dKph7OuXzAct197rJOntVN/aBytPJj41Ajv0vHZk
	MGAA==
X-Gm-Message-State: APjAAAWSFVFoAjWdmhlwD6E3VFNs4W2TYVuaNDchekzVje88ec/hpyKd
	/ApFFjjMCiEU+H9yRaQaio6E1A==
X-Google-Smtp-Source: APXvYqybQkv2LSTpbVQqBNG0vU3Pn6LJz77TNlXyMjfN4HiYSdsBYRstxuDZf20J7rLw9S/ZVFFw7Q==
X-Received: by 2002:a50:900d:: with SMTP id b13mr93026672eda.289.1560866827421;
	Tue, 18 Jun 2019 07:07:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	b25sm4631135ede.34.2019.06.18.07.07.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 07:07:06 -0700 (PDT)
Date: Tue, 18 Jun 2019 16:07:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to
	gem helper.
Message-ID: <20190618140704.GA12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190618135821.8644-1-kraxel@redhat.com>
	<20190618135821.8644-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618135821.8644-3-kraxel@redhat.com>
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

On Tue, Jun 18, 2019 at 03:58:10PM +0200, Gerd Hoffmann wrote:
> Use drm_gem_reservation_object_wait() in virtio_gpu_wait_ioctl().
> This also makes the ioctl run lockless.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Nit: Missing the v2 changelog here.
-Daniel

> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index ac60be9b5c19..313c770ea2c5 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -464,23 +464,19 @@ static int virtio_gpu_wait_ioctl(struct drm_device *dev, void *data,
>  			    struct drm_file *file)
>  {
>  	struct drm_virtgpu_3d_wait *args = data;
> -	struct drm_gem_object *gobj = NULL;
> -	struct virtio_gpu_object *qobj = NULL;
> +	struct drm_gem_object *obj;
> +	long timeout = 15 * HZ;
>  	int ret;
> -	bool nowait = false;
>  
> -	gobj = drm_gem_object_lookup(file, args->handle);
> -	if (gobj == NULL)
> -		return -ENOENT;
> +	if (args->flags & VIRTGPU_WAIT_NOWAIT) {
> +		obj = drm_gem_object_lookup(file, args->handle);
> +		ret = reservation_object_test_signaled_rcu(obj->resv, true);
> +		drm_gem_object_put_unlocked(obj);
> +		return ret ? 0 : -EBUSY;
> +	}
>  
> -	qobj = gem_to_virtio_gpu_obj(gobj);
> -
> -	if (args->flags & VIRTGPU_WAIT_NOWAIT)
> -		nowait = true;
> -	ret = virtio_gpu_object_wait(qobj, nowait);
> -
> -	drm_gem_object_put_unlocked(gobj);
> -	return ret;
> +	return drm_gem_reservation_object_wait(file, args->handle,
> +					       true, timeout);
>  }
>  
>  static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
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
