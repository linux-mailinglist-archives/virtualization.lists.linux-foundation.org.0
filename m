Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D148248511
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 16:15:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DE829D48;
	Mon, 17 Jun 2019 14:15:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BC2FBD48
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:15:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 221AF2C3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:15:24 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m10so16405937edv.6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AYvx+hKlTuvWdDRT83rsHG30d0GVUlP5mRSGQAA1z4U=;
	b=lOeUzLD7n4PAtFX3vYOFGYkqrgu1sQCyqQDXWzLTWLqikYvglRb+IKFBJMleJ1aRe1
	UUg9US9oUwADsm26SYW+wJ25BZAAesxu1FDsxn85zKoHf4riEK0CY2fJ21aza++votM/
	cvZKlJSnYsfAAnUWrTLrv/MCX9rZqWZ2l8HUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=AYvx+hKlTuvWdDRT83rsHG30d0GVUlP5mRSGQAA1z4U=;
	b=Bd2McptRbOOp64WXLJ95lxyOgXrAibZ9d3voArv9KuPY0v73do8sGmQ2uRzfr0fil1
	3/f0SASqaUfZPKckHNbuZoOEUBJQpq3Y9c9hWLmPCFXmr7gQvJXgz4sMUochMTyrrB5w
	Gfag7j5DETLNYuBizt80A14v1RIQT34CIO0zp4GoU5gOQ/NHaKl4uj/qGhYdpymGzoDQ
	5/4frGwN9EgJaNUadvLpX8zv3r+TbSESRR9+2H96s0QqadWEGDvX8wg3BvSeRD8xUIad
	0YI28nhcBYlEKiDDfLeV6E3BWLMgMIPOgVilaOxGkOJ7gowMBP02Wfs+CD/Af9aOLIif
	wMCw==
X-Gm-Message-State: APjAAAVXTtJ2lmMaDq43itd0Zy5hKJiozkFxQieXwKfdnH3z93xwXCLI
	IZ9qmTAYPuQYLwI6S/uCtOA//Q==
X-Google-Smtp-Source: APXvYqwaIDiXPlRgUHNg3kWDu2WCWsswz9JWV+a6jzhjA5v+QP6d6ZCANJoULcIqQzttt4TspRFMiQ==
X-Received: by 2002:a17:906:4356:: with SMTP id
	z22mr98657350ejm.56.1560780922674; 
	Mon, 17 Jun 2019 07:15:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	u15sm3735567edi.10.2019.06.17.07.15.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 07:15:19 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:15:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/4] drm/virtio: switch virtio_gpu_wait_ioctl() to gem
	helper.
Message-ID: <20190617141516.GF12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
	<20190617111406.14765-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617111406.14765-3-kraxel@redhat.com>
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

On Mon, Jun 17, 2019 at 01:14:04PM +0200, Gerd Hoffmann wrote:
> Use drm_gem_reservation_object_wait() in virtio_gpu_wait_ioctl().

Would be good to mention here that with this the wait becomes lockless, we
don't call ttm_bo_reserve/unreserve anymore.

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index c0ba1ead740f..e38a6bb46cc7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -464,23 +464,13 @@ static int virtio_gpu_wait_ioctl(struct drm_device *dev, void *data,
>  			    struct drm_file *file)
>  {
>  	struct drm_virtgpu_3d_wait *args = data;
> -	struct drm_gem_object *gobj = NULL;
> -	struct virtio_gpu_object *qobj = NULL;
> -	int ret;
> -	bool nowait = false;
> -
> -	gobj = drm_gem_object_lookup(file, args->handle);
> -	if (gobj == NULL)
> -		return -ENOENT;
> -
> -	qobj = gem_to_virtio_gpu_obj(gobj);
> +	long timeout = 15 * HZ;
>  
>  	if (args->flags & VIRTGPU_WAIT_NOWAIT)
> -		nowait = true;
> -	ret = virtio_gpu_object_wait(qobj, nowait);
> +		timeout = 0;

timeout of 0 gets upgrade to a 1 jiffy wait, which is probably not what
you want here. You need to open-code ttm_bo_wait here and call
reservation_object_test_signaled_rcu() for this case.

With that fixed Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
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
