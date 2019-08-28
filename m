Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 693F8A0C3A
	for <lists.virtualization@lfdr.de>; Wed, 28 Aug 2019 23:14:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5BD273897;
	Wed, 28 Aug 2019 21:14:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8C14C302F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 21:13:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2526F13A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 21:13:56 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s21so2560886ioa.1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 14:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n0DnwMkmLDWIJwSrLn8Xo+nBrgU3ut606yiaW7tsLmw=;
	b=WIWG1PDkVbjjjFnFPpFLjjxtVTRsYeL9XpsAkGxaDEIeAhcAamyPp68HluklgS3rQP
	C/5rt0po7h3H6Gf7/im0mdsHGo5rDctWgkNhkR9SFFcQ2giiCAvnQpbxtThQwkTa2htt
	hneadVzJncluLhLJBw/BMR67x6jSeSdegdVE2VtCwK/A96Wy7RvcQ6zKIeW4w0MQjz+9
	V4TWU2h4v0uKER3nm8/QWp7fJL2RYZHn+WvCAvu+lohvWO3gIKITjl9Bc7jM6BAWZgiU
	XiXVu9u9PfxR+WU3CUEBQFMiZj6jvaeMqaxYXRE+Q7tKwepQ0RWM3k/Bg5iAWg/1eUIv
	ihWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n0DnwMkmLDWIJwSrLn8Xo+nBrgU3ut606yiaW7tsLmw=;
	b=GajfzFGazfIqBLH4tcIzPD+oA/sJ1WLzOhyDt8bbqZyGyDnKYddV6OGHyHd0VT3KpZ
	SFrA+hG1kYefgjs5CXlv2H3reTcBfNkmJ2ykmofo6ofzcO/OXI4eXJCbXL1selYtnvJb
	69s9XcVxhtXaGJbDkAH/mtgjPQMNFIVqEo6cRKfLfFSNZMqS4u4ahI+BTtg+FM2M1W05
	waAixG8fHhuY3LSmABUSaGgctQMD3iH3zjAGGsNr80R47bAJ6hpdXXbdX49eEMXytPHM
	CxsaLTkVHKxqSIxRm+l2gWBo/gcO5N8uIX+ruC29ycQPxJ4wMRVaueh7yNQ2sidR2BrT
	RKQQ==
X-Gm-Message-State: APjAAAWRkcqjfZtEHVk1p46MZB9ciDQQsJ1FX87vQB9PSR2B8Nl/fNtW
	D+6YMeIHtlMOQE/8hoCul/KS/Mpe0d043IEq8Tk=
X-Google-Smtp-Source: APXvYqzMB/toxRqCkJ9PWvyQnMavsuq5vQlvJoKHZy+zVMpOjz1ploNu5L7LA5sr0YhCp5g4o3nI4y7/qsa67W4ChIM=
X-Received: by 2002:a6b:6f06:: with SMTP id k6mr1919196ioc.232.1567026835236; 
	Wed, 28 Aug 2019 14:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190823095503.2261-1-kraxel@redhat.com>
	<20190823095503.2261-3-kraxel@redhat.com>
In-Reply-To: <20190823095503.2261-3-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 28 Aug 2019 14:13:44 -0700
Message-ID: <CAPaKu7Tbv+JgPLy4GLDU8qwx-X7mA0eFT-Sjxb4CaV5Zr4beXA@mail.gmail.com>
Subject: Re: [PATCH v8 02/18] drm/virtio: switch virtio_gpu_wait_ioctl() to
	gem helper.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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

On Fri, Aug 23, 2019 at 2:55 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Use drm_gem_reservation_object_wait() in virtio_gpu_wait_ioctl().
> This also makes the ioctl run lockless.
>
> v5: handle lookup failure.
> v2: use reservation_object_test_signaled_rcu for VIRTGPU_WAIT_NOWAIT.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 0a88ef11b9d3..74b6bad01d7f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -466,23 +466,20 @@ static int virtio_gpu_wait_ioctl(struct drm_device *dev, void *data,
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
> +               if (obj == NULL)
> +                       return -ENOENT;
> +               ret = dma_resv_test_signaled_rcu(obj->resv, true);
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
> +       return drm_gem_dma_resv_wait(file, args->handle, true, timeout);
This changes the return value from -EBUSY to -ETIME when the wait
times out.  I think we can use dma_resv_wait_timeout_rcu directly
here.



>  }
>
>  static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
