Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA629F08C
	for <lists.virtualization@lfdr.de>; Tue, 27 Aug 2019 18:45:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9142C192E;
	Tue, 27 Aug 2019 16:45:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A2CCE1926
	for <virtualization@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 16:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2C62E42D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 16:45:39 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id p12so47898101iog.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bgEZL7FHXVC38tkVb8BiSRS9kzc42h1C+rKp2AsOFAo=;
	b=T6sitAXXsulHPQdxWkBxQoQ5ma3ksEOLb1V/hrE/6RubIs6kJkFPQSGzCSYd/uGPXe
	rgQU8z5g7+cFRG1QF7yW25qsZURMuJMXmyb9xujtNB8s3WQe1gVLdlRtRfNRyOCg75iu
	Rti4wabkh6aPySTaup/hsr7t4vvn0h5ZHCRepu/NOuHzMVwVRuJ25j0lSKQevAVXEoJ7
	ewe34JV3U7tris/s7XI2ZwwfYV3drOlobjk0Kf86c0BDwMmsN1akmTeeUjv8ZMLks6re
	8SWY68KxAnL5hZADc6L82KxM9iSsdCaIIsTFwC+bvxjIhnzKtigG2D/6woMhYUs7FAl8
	KHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bgEZL7FHXVC38tkVb8BiSRS9kzc42h1C+rKp2AsOFAo=;
	b=GnMQYaOlBXuuBcUVTZRp/cpP5Q5l7W2Nfg/o9VvkYd659eOY3QyPke7ZApYEFpKwtb
	Ep1574Pioz/WtHhJ2ck6bmKr9NRQfCPKZrzocEStrXjJUOJd8XDHOakyMY9vZGmy9hIs
	j3zdC+jxzgZ7HgDJBHQSXYgSsW1F46fCFKtCH5Wsuw4ogZ9Ne+yNs3poNHfTF9Uw9dVX
	jtwH6Vxg7Mcgw87JNsu1NtDwGSgUPUE6qpElb+rcavExOYoJAF2f3sPmj/Q8lX5p3/zc
	cYL5Mbba4C+t9dy8NpPviq15QZHddBLz7eIqNHcERsbH9J037+JRlMsD1978zmzVSb+1
	zTYg==
X-Gm-Message-State: APjAAAXjYf5zFV8EKFJLwCESFELbvOLPDm1CpnV4s6A6zN8yqDPHQJrP
	++3CVyCyVRbe7rpFHNmJjirXPsGircfL/atCgMo=
X-Google-Smtp-Source: APXvYqwMDuQ1qPyVS6ef0qkkeTM17FDw8fs2kRk6HNwsBmCQAJLs9dkPFKkpzSV5F8vJTpvLB0sUGUBT0Atm2qMcXC0=
X-Received: by 2002:a6b:6f06:: with SMTP id k6mr33986129ioc.232.1566924338329; 
	Tue, 27 Aug 2019 09:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190813082509.29324-1-kraxel@redhat.com>
	<20190813082509.29324-3-kraxel@redhat.com>
In-Reply-To: <20190813082509.29324-3-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 27 Aug 2019 09:45:27 -0700
Message-ID: <CAPaKu7T2AA83wLchMDmLEEb-VgvdfCP3_Dz8drrH9hptgXPn9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/virtio: notify virtqueues without holding spinlock
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
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

On Tue, Aug 13, 2019 at 1:25 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Split virtqueue_kick() call into virtqueue_kick_prepare(), which
> requires serialization, and virtqueue_notify(), which does not.  Move
> the virtqueue_notify() call out of the critical section protected by the
> queue lock.  This avoids triggering a vmexit while holding the lock and
> thereby fixes a rather bad spinlock contention.
>
> Suggested-by: Chia-I Wu <olvaffe@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Series is

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index ca91e83ffaef..e41c96143342 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -252,7 +252,7 @@ void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
>         wake_up(&vgdev->cursorq.ack_queue);
>  }
>
> -static void virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
> +static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
>                                                 struct virtio_gpu_vbuffer *vbuf)
>                 __releases(&vgdev->ctrlq.qlock)
>                 __acquires(&vgdev->ctrlq.qlock)
> @@ -260,10 +260,11 @@ static void virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
>         struct virtqueue *vq = vgdev->ctrlq.vq;
>         struct scatterlist *sgs[3], vcmd, vout, vresp;
>         int outcnt = 0, incnt = 0;
> +       bool notify = false;
>         int ret;
>
>         if (!vgdev->vqs_ready)
> -               return;
> +               return notify;
>
>         sg_init_one(&vcmd, vbuf->buf, vbuf->size);
>         sgs[outcnt + incnt] = &vcmd;
> @@ -292,16 +293,21 @@ static void virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
>                 trace_virtio_gpu_cmd_queue(vq,
>                         (struct virtio_gpu_ctrl_hdr *)vbuf->buf);
>
> -               virtqueue_kick(vq);
> +               notify = virtqueue_kick_prepare(vq);
>         }
> +       return notify;
>  }
>
>  static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
>                                          struct virtio_gpu_vbuffer *vbuf)
>  {
> +       bool notify;
> +
>         spin_lock(&vgdev->ctrlq.qlock);
> -       virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
> +       notify = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
>         spin_unlock(&vgdev->ctrlq.qlock);
> +       if (notify)
> +               virtqueue_notify(vgdev->ctrlq.vq);
>  }
>
>  static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
> @@ -310,6 +316,7 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
>                                                 struct virtio_gpu_fence *fence)
>  {
>         struct virtqueue *vq = vgdev->ctrlq.vq;
> +       bool notify;
>
>  again:
>         spin_lock(&vgdev->ctrlq.qlock);
> @@ -330,8 +337,10 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
>
>         if (fence)
>                 virtio_gpu_fence_emit(vgdev, hdr, fence);
> -       virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
> +       notify = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
>         spin_unlock(&vgdev->ctrlq.qlock);
> +       if (notify)
> +               virtqueue_notify(vgdev->ctrlq.vq);
>  }
>
>  static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
> @@ -339,6 +348,7 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
>  {
>         struct virtqueue *vq = vgdev->cursorq.vq;
>         struct scatterlist *sgs[1], ccmd;
> +       bool notify;
>         int ret;
>         int outcnt;
>
> @@ -361,10 +371,13 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
>                 trace_virtio_gpu_cmd_queue(vq,
>                         (struct virtio_gpu_ctrl_hdr *)vbuf->buf);
>
> -               virtqueue_kick(vq);
> +               notify = virtqueue_kick_prepare(vq);
>         }
>
>         spin_unlock(&vgdev->cursorq.qlock);
> +
> +       if (notify)
> +               virtqueue_notify(vq);
>  }
>
>  /* just create gem objects for userspace and long lived objects,
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
