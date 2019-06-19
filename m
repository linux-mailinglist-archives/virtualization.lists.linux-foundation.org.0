Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9B14B5AF
	for <lists.virtualization@lfdr.de>; Wed, 19 Jun 2019 11:57:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5C899D83;
	Wed, 19 Jun 2019 09:57:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 08579CA1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 09:57:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 548ADE6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 09:57:14 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w13so26328250eds.4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OYUOBbihdDezrYIpc84bsimr033/fNxizTudReyy9GE=;
	b=VooeCWO1OpfkqLQECa5vkxYQhv9QcgV0EEz4MtAZie/DQpFAzkLReYAKFordnWIKq2
	76y1DCcwaJOZMGb2KIbmbHVmjn2ZeqGGDGzFy8n7iIGwgAGZD/4OQpNyHxlqk/saUlUA
	Iu0+x1IlzIm74/Ap43c90NeDs0k6H3Sgq2zwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=OYUOBbihdDezrYIpc84bsimr033/fNxizTudReyy9GE=;
	b=JtDdBWrNq34yvgL420nyq3apX0rrFFcMLf/grSfDfzZEBPHrdF5zrEf/e2V8D5Unzr
	Dn+mJSocfTbVbwzlRH94/vGFmr2cVGdkDFK1cexqKB0kO5ENZ2wOv9as28wnIZN+IGAS
	svlj/7gM0q/MxaZN+ePx0/paeI+rYgTleuDxmVj3w0dU2hPQxNkGl/jSSV1SjjE/HpZx
	OPlgrFcdXg+poLcbvH8rqa8ijT7wZ8NpN2EpXGtcAuV/4L5mZeET5st+5FGbjH55ceBM
	gKTE5h5jPLzAKXZgzC1/k3fXE/3Jnq1GxcqExxfNyEbtZ5BLK0Z9xtv20Bbkm6vD4UN1
	jqiw==
X-Gm-Message-State: APjAAAVmPOjJ2GvR7rbRGStNgkez8g/ZQGB9jXrMDvdlzIfgfIFWPOXA
	Q1oTEpB4MXOQ4+59XSYyJ1T0Xg==
X-Google-Smtp-Source: APXvYqxmuZBxDErDZLmU5QeCx1tL6e44prW1irGwG0kDOxQYTRxd1JoAqkmtlD6HogrJKkLq+7r1aQ==
X-Received: by 2002:a50:b7e2:: with SMTP id i31mr83477702ede.229.1560938232780;
	Wed, 19 Jun 2019 02:57:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	e26sm3180489eje.29.2019.06.19.02.57.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 02:57:12 -0700 (PDT)
Date: Wed, 19 Jun 2019 11:57:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 07/12] drm/virtio: remove ttm calls from in
	virtio_gpu_object_{reserve,unreserve}
Message-ID: <20190619095708.GL12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190619090420.6667-1-kraxel@redhat.com>
	<20190619090420.6667-8-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619090420.6667-8-kraxel@redhat.com>
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

On Wed, Jun 19, 2019 at 11:04:15AM +0200, Gerd Hoffmann wrote:
> Call reservation_object_* directly instead
> of using ttm_bo_{reserve,unreserve}.
> 
> v3: check for EINTR too.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 06cc0e961df6..77ac69a8e6cc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -402,9 +402,9 @@ static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
>  {
>  	int r;
>  
> -	r = ttm_bo_reserve(&bo->tbo, true, false, NULL);
> +	r = reservation_object_lock_interruptible(bo->gem_base.resv, NULL);
>  	if (unlikely(r != 0)) {
> -		if (r != -ERESTARTSYS) {
> +		if (r != -ERESTARTSYS && r != -EINTR) {

You only need to check for EINTR I think. ttm_bo_reserv does the EINVAL ->
ERESTARTSYS remapping.
-Daniel

>  			struct virtio_gpu_device *qdev =
>  				bo->gem_base.dev->dev_private;
>  			dev_err(qdev->dev, "%p reserve failed\n", bo);
> @@ -416,7 +416,7 @@ static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
>  
>  static inline void virtio_gpu_object_unreserve(struct virtio_gpu_object *bo)
>  {
> -	ttm_bo_unreserve(&bo->tbo);
> +	reservation_object_unlock(bo->gem_base.resv);
>  }
>  
>  /* virgl debufs */
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
