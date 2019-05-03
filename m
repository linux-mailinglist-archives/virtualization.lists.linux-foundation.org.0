Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E0313260
	for <lists.virtualization@lfdr.de>; Fri,  3 May 2019 18:42:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2BB113A62;
	Fri,  3 May 2019 16:42:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5E0A83A5B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 16:41:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D93AF756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 16:41:09 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id q14so10173147itk.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 03 May 2019 09:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fjLoGVU1gaH6UfBmo61XmqKTUT9KNrV65aNqszwWgfM=;
	b=UjsUVC5iF4LqG2oy2Fm/ty3L+OVTzO7Q9pu8WST7JLtlmqUcvycVQaowzWwK8cBNA1
	3/cE8gzLPDRvY/Cdu/FXqVqs1fWaO7sWYqX1Zlv1W9f2TkLRuIT696Hs0aiNsE67DapD
	5LWVUIYJ9GD2e5kf5BVXRJqTlR8K30tHtJ+7VmHvjg7q7tiB7Y13GZrGiS3o5TpYNwCV
	8wPd9lsIcELP0qtfG5Jyi7bnWTmO/QFzwQKZ6GWVjHU1PFt53mB/vo0V/0hBslFfLsLR
	oVmZYAkMwI1n7BH0GYrKQAjGHJ4IOy5QA4pt9zbRrWMqbXIv7jDWlkd2SdFMkH9q3eGW
	+5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fjLoGVU1gaH6UfBmo61XmqKTUT9KNrV65aNqszwWgfM=;
	b=ZZj4etr6Hk9pdH6cGAr7Hwmu6nUjeC8vBa8yDz/h1FwQJd1SDkTkNOpP3UjIdYh+D8
	yl9jc0FskVsw9cqg2q3whdMrTmS4LK0H+l8sqJG33qwG8gESdPNAZMKQ7tliBFKqoMd/
	jTGJlVlS3NgW+qmUlSUuYnSE/u5jgIIR6P0WOCpvUWkXFXRNY2zoZ8oplfbeL6yCaJkA
	EoDz9T2NIspLVYaxzhHCE7bn90Q8C6GeQWAJcQ4uhUQIjfIdZ7yYgg5jRoc2PdIVozQn
	EYi583ziLL8TKJaY+fge9WfjdARxOc6+Ccm0a6DETcjf2SDRmv4Ay9Y9D1JxL6lqnviT
	M/SQ==
X-Gm-Message-State: APjAAAVpdXNYNtCw3bh9FAi7Qgzh9cHTgy5lJhhb6TiD9SpJhp9G35ZG
	0c/UtohYyl0vbuIVmw5atg+V9uVQdfWm/rAAYDk=
X-Google-Smtp-Source: APXvYqwlBSYQlISp0r6yiSxEkv5WvdDoLXFua6M0BKcjdBpadMAOqsRgC+U4oGHSsAWc7wjocOGcQ6Ri66hnffjOIss=
X-Received: by 2002:a24:e517:: with SMTP id g23mr7579662iti.113.1556901669124; 
	Fri, 03 May 2019 09:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190503163804.31922-1-robert.foss@collabora.com>
In-Reply-To: <20190503163804.31922-1-robert.foss@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 May 2019 09:40:58 -0700
Message-ID: <CAPaKu7SfkUN4FBQ5Xm3zfdvvbcvBAWDz0k2FVdn8TNZWwiV-tg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Remove redundant return type
To: Robert Foss <robert.foss@collabora.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
	NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, Emil Velikov <emil.velikov@collabora.com>
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

On Fri, May 3, 2019 at 9:38 AM Robert Foss <robert.foss@collabora.com> wrote:
>
> virtio_gpu_fence_emit() always returns 0, since it
> has no error paths.
>
> Consequently no calls for virtio_gpu_fence_emit()
> use the return value, and it can be removed.
>
> Signed-off-by: Robert Foss <robert.foss@collabora.com>
> Suggested-by: Emil Velikov <emil.velikov@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>
> This patch was suggested in this email thread:
>
> [PATCH] drm/virtio: allocate fences with GFP_KERNEL
> https://www.spinics.net/lists/dri-devel/msg208536.html
>
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 +-
>  drivers/gpu/drm/virtio/virtgpu_fence.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index d577cb76f5ad..9bc56887fbdb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -334,7 +334,7 @@ int virtio_gpu_mmap(struct file *filp, struct vm_area_struct *vma);
>  /* virtio_gpu_fence.c */
>  struct virtio_gpu_fence *virtio_gpu_fence_alloc(
>         struct virtio_gpu_device *vgdev);
> -int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
> +void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
>                           struct virtio_gpu_ctrl_hdr *cmd_hdr,
>                           struct virtio_gpu_fence *fence);
>  void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
> index 21bd4c4a32d1..e0744ac768cc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
> @@ -81,7 +81,7 @@ struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
>         return fence;
>  }
>
> -int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
> +void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
>                           struct virtio_gpu_ctrl_hdr *cmd_hdr,
>                           struct virtio_gpu_fence *fence)
>  {
> @@ -96,7 +96,6 @@ int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
>
>         cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
>         cmd_hdr->fence_id = cpu_to_le64(fence->seq);
> -       return 0;
>  }
>
>  void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
> --
> 2.20.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
