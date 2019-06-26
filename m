Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC9057518
	for <lists.virtualization@lfdr.de>; Thu, 27 Jun 2019 01:55:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 41411CBB;
	Wed, 26 Jun 2019 23:55:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DDF6BCAA
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 23:55:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6F2F53D0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 23:55:33 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id e5so720726iok.4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 16:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WFOmBfL98emh/MYkHT7m04HAElQFNQEeVW5ROqlJL+Y=;
	b=WkdsB90003wZlIbZPOM6yLKQ8fZBLPGqZD10BWCj96jgkU45YwHT5zGBlN5RrS2PjH
	pieBPX2NOzAKAgDARKZwvKO71cNZl1UlkkjYQCJ8lj0+qHwNg2VtG2cJECKc5bjHTmwr
	Dg2ykRz1tGxTbqn45qfr393V2c2KX0AW7GsXwEdu8Q6I8bmrjyz6wikBj4K0vP3QtNDL
	jZOKCHdQbEhllLoUcNHcFkD+UjcVIANEc6MnGoYQIwF0nMdBe1+OFnWXoxpXl1QQf8x0
	Qi/y2bncdtk52+xsoJb4kKI+4BKc8ZN8XP0Ag9T+uKf8XV9Lhwtg4+3bygxI5ufL+jnq
	+uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WFOmBfL98emh/MYkHT7m04HAElQFNQEeVW5ROqlJL+Y=;
	b=jGoBYR2jR+Z6kwL/9MumSNF0hkiBiwSWkJQXCz+BJrmgWhYs5865VS0m4FYJhXD7Xc
	6LyzYuCiUU9ZIQyt3BFWD/mpduze6pS7ux9Ed09jivkgtGmc11F0DKVUHNUT8Op8WL/y
	NXs2QX82+7lAhME3Fkvzj/9tkQwP4cNqthN6izNuINfL1kM5SFnba0MOuqw1BnxjaZcY
	AmmlF2qLX+VlU4SXzBPWJzTX9QVLoH1xwvarnVcmXuMDJ06h76C7Lsl7j/lKgDA9clrf
	iSgdvOJQvOPL2GKFAG5XCdoDS0Q+TZ4e0dDxJkrd1v0ZtMmZP1wWQcPNMt33uK8ucv7t
	sUFw==
X-Gm-Message-State: APjAAAUEYkPUfgP4kpQ4+XAA6EBSWdsTx75O/QwmtSRvlwHB1T8/x49t
	XiKxqXJfSs5P/DAS2IBUhcUQ67jeYKb9cFqH8gU=
X-Google-Smtp-Source: APXvYqxJskAboHi/EJpGElxVyZ0pbUBPtkqfxFuTpUiQaqkNzIP0fuT6ddNPHhSVOlefT8unJ7Gyt/hPlYS+l8eheig=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr836507jah.140.1561593331304; 
	Wed, 26 Jun 2019 16:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
	<20190620060726.926-3-kraxel@redhat.com>
In-Reply-To: <20190620060726.926-3-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Jun 2019 16:55:20 -0700
Message-ID: <CAPaKu7RWpoRkTkoatdYHz6itHZFvUYgaBcQAXnSC2gDc+dFZxQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to
	gem helper.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
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

On Wed, Jun 19, 2019 at 11:07 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Use drm_gem_reservation_object_wait() in virtio_gpu_wait_ioctl().
> This also makes the ioctl run lockless.
The userspace has a BO cache to avoid freeing BOs immediately but to
reuse them on next allocations.  The BO cache checks if a BO is busy
before reuse, and I am seeing a big negative perf impact because of
slow virtio_gpu_wait_ioctl.  I wonder if this helps.


>
> v2: use reservation_object_test_signaled_rcu for VIRTGPU_WAIT_NOWAIT.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index ac60be9b5c19..313c770ea2c5 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -464,23 +464,19 @@ static int virtio_gpu_wait_ioctl(struct drm_device *dev, void *data,
>                             struct drm_file *file)
>  {
>         struct drm_virtgpu_3d_wait *args = data;
> -       struct drm_gem_object *gobj = NULL;
> -       struct virtio_gpu_object *qobj = NULL;
> +       struct drm_gem_object *obj;
> +       long timeout = 15 * HZ;
>         int ret;
> -       bool nowait = false;
>
> -       gobj = drm_gem_object_lookup(file, args->handle);
> -       if (gobj == NULL)
> -               return -ENOENT;
> +       if (args->flags & VIRTGPU_WAIT_NOWAIT) {
> +               obj = drm_gem_object_lookup(file, args->handle);
Don't we need a NULL check here?
> +               ret = reservation_object_test_signaled_rcu(obj->resv, true);
> +               drm_gem_object_put_unlocked(obj);
> +               return ret ? 0 : -EBUSY;
> +       }
>
> -       qobj = gem_to_virtio_gpu_obj(gobj);
> -
> -       if (args->flags & VIRTGPU_WAIT_NOWAIT)
> -               nowait = true;
> -       ret = virtio_gpu_object_wait(qobj, nowait);
> -
> -       drm_gem_object_put_unlocked(gobj);
> -       return ret;
> +       return drm_gem_reservation_object_wait(file, args->handle,
> +                                              true, timeout);
>  }
>
>  static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
