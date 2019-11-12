Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C3F8C0C
	for <lists.virtualization@lfdr.de>; Tue, 12 Nov 2019 10:40:44 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F1F7FCC7;
	Tue, 12 Nov 2019 09:40:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 18EB2941
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 09:40:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 14FE6623
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 09:40:34 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z19so2165291wmk.3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 01:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ejx/kqQy3kcUiiFlaD/FPSSHJrxrW00iUrEoU2xAx90=;
	b=lWbjKPSh3T/bDqJI/OHcdLlHvZS5ZQztXcO2OXBpY5i56aD1VdfCigUlZJ3ECo8PkX
	c5BD6/OUUkowHGZ0krgx5x2QCrVgAaZYg8lbDU4ZKdFofGst8i6HqOXyIbBwSmdeZoYl
	d1iLL7m24zo7aI/7PXf4CBZRYc/omP54nwyD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=ejx/kqQy3kcUiiFlaD/FPSSHJrxrW00iUrEoU2xAx90=;
	b=heHwTrZrCCy+oIw7FMBXc0060l4V0Y4Yxb1zdqFxctQX4wdC7ARYJP7jM0Kc373JuV
	ocfHc+B/A7BJ85P9EnoLdg7FC1IZPF0Uiinz8/x3GdUaPeilGrtR4xAD/1WM5UdER90r
	03ZjaIT8MAwtKVoMhnQC4gjpIloO5dEfTOmrsfJQoHGeCxX/lcW6Kgb+Giqb/SXS0k5K
	1WIfA4zzeq9MT/FYAf1RgFtcWyJzMhzoWV412f9SY/BvjZKl2qSpXCQei+uS28N5grMm
	0YEmGcRqIvBYTS8wsU2f4n6GEv1fN1GUB73+L08WZx4dNpJOWlkBbDaJbwVa1aW5as6R
	4l3w==
X-Gm-Message-State: APjAAAWxA3+3Z2jCH2Wyb/NT/c/9V+OK1hTOjCY3qVTg+2NWs7/C9yyg
	7A3wfCVgvaARJPjxtOBu67OnsQ==
X-Google-Smtp-Source: APXvYqwrO8bU+BJYM7oebMXYjkT49Im67i7AQuC63Zqgak8bgNrt+yEN/H6dPBWSj91L92X3BD5VAw==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr2985572wmf.162.1573551633503;
	Tue, 12 Nov 2019 01:40:33 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
	[212.51.149.96]) by smtp.gmail.com with ESMTPSA id
	62sm26900378wre.38.2019.11.12.01.40.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 01:40:32 -0800 (PST)
Date: Tue, 12 Nov 2019 10:40:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] drm/virtgpu: fix double unregistration
Message-ID: <20191112094031.GF23790@phenom.ffwll.local>
Mail-Followup-To: Chuhong Yuan <hslester96@gmail.com>,
	David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
References: <20191109075417.29808-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191109075417.29808-1-hslester96@gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel@ffwll.ch>
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

On Sat, Nov 09, 2019 at 03:54:17PM +0800, Chuhong Yuan wrote:
> drm_put_dev also calls drm_dev_unregister, so dev will be unregistered
> twice.
> Replace it with drm_dev_put to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Nice catch, I'll apply.

Since this is so confusing, we actually have a todo to remove drm_put_dev
completely from the codebase (and open-code it with explicit
unregister+put). Want to do that little patch series to update the
remaining few drivers and then remove drm_put_dev from core code?

Thanks, Daniel

> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 0fc32fa0b3c0..fccc24e21af8 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -138,7 +138,7 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
>  
>  	drm_dev_unregister(dev);
>  	virtio_gpu_deinit(dev);
> -	drm_put_dev(dev);
> +	drm_dev_put(dev);
>  }
>  
>  static void virtio_gpu_config_changed(struct virtio_device *vdev)
> -- 
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
