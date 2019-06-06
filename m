Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338E3725E
	for <lists.virtualization@lfdr.de>; Thu,  6 Jun 2019 13:01:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2AB51C9B;
	Thu,  6 Jun 2019 11:01:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 248A5C59
	for <virtualization@lists.linux-foundation.org>;
	Thu,  6 Jun 2019 11:01:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 70D6034F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  6 Jun 2019 11:01:07 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id v129so916340vsb.11
	for <virtualization@lists.linux-foundation.org>;
	Thu, 06 Jun 2019 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZekiFWl9mslxTrTCyce83HsngFt4eZWdZDhWr1JguaA=;
	b=q19fqTlmHuauaIWqFmyCBVnkbv8/3k4Ef3kwJTClG2NftrbW2djG61Pmst/IZbSNxJ
	7meOiBZv42NVhCI1kzsfhEe5NjAkjcmqLQ8OnQnoyv/wAqtkP1NTK9mJJtAGys8u7Ftr
	EK/YVGY9CLDEzmP7gI+7JZ1snhAn7hXf71cC/TBJK/oo+oKBTZpeXA2YjYrFKXmAGTG8
	HskuUDD0gEwAFnXjfF2QOTPm/kD9NGGbAFra49mye2pPJtme1SqGznuddvbLi/yvhEai
	se+LUFXHNdx0x5ic74boqhvp3zIZ8kexDzXiUqOKpFSb9SvddEw2casUxk8R1gaGEZjB
	bjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZekiFWl9mslxTrTCyce83HsngFt4eZWdZDhWr1JguaA=;
	b=cyV9Cg4jj+MNW2CkC7AuIcvM6XJ1bd6T5aX8A2jPMXCAZQaVI0JVMIiBNd1lP5Hjml
	1yw81/cer/JGEftbFHgfuyMeNbTq7LswrmTSmGSUIAE9E0+Q3NqVY2Wl9EufeQOydd/w
	WCFVVhS5BkRa1Qi4bbVEx5t++k0s+7Wr2AmYw+xYUE5UIXz2Q9PIMd+HdJXL3XzesC2A
	n5Run5vcRK/DeZkq9uP4ZuMfsiE8Ut0h7uN1QXPtHkElRhNidER+Vyd4kTxEKW1UJGgB
	TZgTAwmvuUCG/1l/1+Va1NikeVjNbD4Sf/uA7OHKMMYE6Y9MHfa51uBNAUOOq3fa5JYW
	jyfw==
X-Gm-Message-State: APjAAAU3TyuKvCOfRGgghrLlTCnmW+hc+zn447iiB+elpGzlKb6FbLGN
	HMNK+2lEzD3u/lXoIXx+St4Icv9/QV48Me5mPpg=
X-Google-Smtp-Source: APXvYqyEP4Jyz+lQ5+kt7k6xv/fUY3LILA9dk5deHrlNkH0/W4r1XNGIRCVrdwHHSP4aPeIH8D9w56O/PQiikCKzbTQ=
X-Received: by 2002:a67:7fd8:: with SMTP id a207mr748723vsd.85.1559818866586; 
	Thu, 06 Jun 2019 04:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
	<20190527081741.14235-12-emil.l.velikov@gmail.com>
In-Reply-To: <20190527081741.14235-12-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 6 Jun 2019 11:59:15 +0100
Message-ID: <CACvgo51+WknrTjzEhc6EitJV5EA0f9SXznQMkw3Y_ixPHSOLPQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/virtio: drop DRM_AUTH usage from the driver
To: ML dri-devel <dri-devel@lists.freedesktop.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
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

On Mon, 27 May 2019 at 09:19, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> From: Emil Velikov <emil.velikov@collabora.com>
>
> The authentication can be circumvented, by design, by using the render
> node.
>
> From the driver POV there is no distinction between primary and render
> nodes, thus we can drop the token.
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 949a264985fc..e72626faba52 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -553,34 +553,34 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
>
>  struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
>         DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
> -                         DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +                         DRM_UNLOCKED | DRM_RENDER_ALLOW),
>
>         DRM_IOCTL_DEF_DRV(VIRTGPU_EXECBUFFER, virtio_gpu_execbuffer_ioctl,
> -                         DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +                         DRM_UNLOCKED | DRM_RENDER_ALLOW),
>
>         DRM_IOCTL_DEF_DRV(VIRTGPU_GETPARAM, virtio_gpu_getparam_ioctl,
> -                         DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +                         DRM_UNLOCKED | DRM_RENDER_ALLOW),
>
>         DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE,
>                           virtio_gpu_resource_create_ioctl,
> -                         DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +                         DRM_UNLOCKED | DRM_RENDER_ALLOW),
>
>         DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_INFO, virtio_gpu_resource_info_ioctl,
> -                         DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +                         DRM_UNLOCKED | DRM_RENDER_ALLOW),
>
>         /* make transfer async to the main ring? - no sure, can we
>          * thread these in the underlying GL
>          */
>         DRM_IOCTL_DEF_DRV(VIRTGPU_TRANSFER_FROM_HOST,
>                           virtio_gpu_transfer_from_host_ioctl,
> -                         DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +                         DRM_UNLOCKED | DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(VIRTGPU_TRANSFER_TO_HOST,
>                           virtio_gpu_transfer_to_host_ioctl,
> -                         DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +                         DRM_UNLOCKED | DRM_RENDER_ALLOW),
>
>         DRM_IOCTL_DEF_DRV(VIRTGPU_WAIT, virtio_gpu_wait_ioctl,
> -                         DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +                         DRM_UNLOCKED | DRM_RENDER_ALLOW),
>
>         DRM_IOCTL_DEF_DRV(VIRTGPU_GET_CAPS, virtio_gpu_get_caps_ioctl,
> -                         DRM_AUTH | DRM_UNLOCKED | DRM_RENDER_ALLOW),
> +                         DRM_UNLOCKED | DRM_RENDER_ALLOW),
>  };
> --
> 2.21.0
>

Humble poke?

Thanks,
Emil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
