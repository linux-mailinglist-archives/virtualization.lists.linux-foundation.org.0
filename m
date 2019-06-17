Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A86484EC
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 16:08:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 82FDAD80;
	Mon, 17 Jun 2019 14:08:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 959D9ACC
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:08:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C694C7E9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:08:30 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a14so16323660edv.12
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QclIRmGgE6e1NwC0LyK0y/gOsKzmfG48w5Q/Ut94Q+k=;
	b=YyLeBzVYVYsicyyTQaxOj8/wVRXFIWW/Pk135d0I16nxXxId1a6hq5l4MbpdrVDb1q
	6K00J3TChDALBDD04GdAyKBMsE45rcW3gx1uphcbzC7nmtufgwJsA9J9KKokP6xZk8RF
	IokXKwK/8xTC7O5fOi/xUwQMKRgUFj4H+SzJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=QclIRmGgE6e1NwC0LyK0y/gOsKzmfG48w5Q/Ut94Q+k=;
	b=nEADu76bDj2hWcoJz/z4XFei9sx/fXh2eSd99mqvnW2lhsg9YcLCg2spvEt5TYRpKL
	FbM6QOMJAJTlquD7K0+0davjxVPDgZ9zFnQc4rL1CAbG8lm8Umlxf1t7f0AuYSw3cCaP
	tFLt/BwC91L1qMOpQbD/kETE5yci9S9+kHVMXNKPcuhYoc63IW/8nu8cFOMUqm9T8MX2
	aDID7C+O+fkC+U+58zUJArG7jh2AFp6hkS7Zpi2LWqLKYfchm7ia6oSoyzIfRKQnM8ff
	kbvdr1hzkkzMvNPxtZg1G6KHutNNEC4vwRnAt7UHnhZdYquIEfVqfK9iAm98bqHTqMek
	L/3g==
X-Gm-Message-State: APjAAAUW+rQKw2VTVVVjXV4yxHNrqaqxpGqbQwDU/6ebY90l8RycWOu7
	xf0ut2h0/QQP/u2ggWhlGFhTgw==
X-Google-Smtp-Source: APXvYqxFgofUOrCrJe8Zusip83q+AIHX7wVQGYRBZyLeOZT0aLmRPes/a8REwHA8Uo/EXqXeQFakrw==
X-Received: by 2002:a05:6402:8d7:: with SMTP id
	d23mr76998441edz.17.1560780509384; 
	Mon, 17 Jun 2019 07:08:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id y3sm3688780edr.27.2019.06.17.07.08.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 07:08:27 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:08:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/4] drm/virtio: pass gem reservation object to ttm init
Message-ID: <20190617140825.GD12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
	<20190617111406.14765-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617111406.14765-2-kraxel@redhat.com>
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

On Mon, Jun 17, 2019 at 01:14:03PM +0200, Gerd Hoffmann wrote:
> With this gem and ttm will use the same reservation object,
> so mixing and matching ttm / gem reservation helpers should
> work fine.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

While doing my prime doc+cleanup series I wondered whether we should do
this for everyone, and perhaps even remove ttm_bo.ttm_resv. Only driver
which doesn't yet have a gem_bo embedded in the same allocation is vmwgfx,
and that would be easy to fix by adding a vmwgfx_resv somehwere.

Anyway, looks like a solid start into the convergence story.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index b2da31310d24..242766d644a7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -132,7 +132,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  	virtio_gpu_init_ttm_placement(bo);
>  	ret = ttm_bo_init(&vgdev->mman.bdev, &bo->tbo, params->size,
>  			  ttm_bo_type_device, &bo->placement, 0,
> -			  true, acc_size, NULL, NULL,
> +			  true, acc_size, NULL,
> +			  bo->gem_base.resv,
>  			  &virtio_gpu_ttm_bo_destroy);
>  	/* ttm_bo_init failure will call the destroy */
>  	if (ret != 0)
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
