Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 41797A3BD3
	for <lists.virtualization@lfdr.de>; Fri, 30 Aug 2019 18:20:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 926C46181;
	Fri, 30 Aug 2019 16:20:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A46B862FC
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 16:19:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 199071FB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 16:19:04 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id z3so15240083iog.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 09:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w1VMMJco1uH+7gtFzOB5by83AjJIvFL4o3Apj5/YJNA=;
	b=nENiS/VyEXHRx025qwtDHC7B40vtQACA9DwtXk0kv/9FwF3AeOgBJkq77x6jvmFvjs
	bzYNPzc77nwvLjvFPgWyFkX65UjwnlXMJLH6pO+I70ZfO3Z0KxkH8jWuB74LYSwacHt/
	2YfBOcJEPhu38TtqAUMXbf26f0dhW3qrFMyZqlsXfSpc4JJv0+uFiQIXZpVVmk9fdhll
	kR1Y6Ba8jCK+zD7ytmPJ7xj3Y+8Tr34tYJbXXyTLWsoAH99ow9nUzlfDM8GsCLuNII+0
	2+5adZQysZ7Tsjp0lDwyhA7VflExbg89vt+28XZVguYweHu6usRoe+RgfuyorRroZzNz
	377A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w1VMMJco1uH+7gtFzOB5by83AjJIvFL4o3Apj5/YJNA=;
	b=GPUZnNefjd0plgx0rKRYXNjOYPo6kZrn2NJATqzyowtl2ujeE0c6axhVEN+sQy+clv
	e9Z7WiOg26/0gaETQxqHJnVZARZzu2x/pKwE7AXlGdpkhNsMTrRqItcgWfHt3+i2rW8N
	V+tLEgHMQEQ6zGxgS1Iuv/zcbP48hFOSifDZYmk2czSJe6nAhdSSFdAzmaZDcRH9YcnS
	LOADFtFj28SvT8+2LSk5xL7gNcIA/HSoECY0jnYA6BPl5JzG5NYxtBxqShF4IN4tT2Mm
	aKpdSGS6Edk0GV4CdI4g7P2B4+gzv2gUi2uNj/IHNh07sb3EBPMaYQxcGR+z5cCPHLjy
	+dJA==
X-Gm-Message-State: APjAAAUHJDgTI0ps0hcv43PTrOiV3RKYUYGBqRcfFRq4uUxmcJra01bN
	9yW2C+JyZz8DgYf50LWHI/V9fKpLDCklPt/si2E=
X-Google-Smtp-Source: APXvYqznvBs3CPYadMdSVgMstRD/pTLJfgKeJkhXf83rAqLkjY03PW4FaWCTI+kNt47Vz4JhZouA4qHik7exlVpZG9s=
X-Received: by 2002:a6b:db0e:: with SMTP id t14mr14719253ioc.93.1567181943233; 
	Fri, 30 Aug 2019 09:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
In-Reply-To: <20190829212417.257397-1-davidriley@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 30 Aug 2019 09:18:52 -0700
Message-ID: <CAPaKu7SmqNLNDNNZr7c7gEi+ypAKdXJ3z5oYZFppk+53rsTygA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
To: David Riley <davidriley@chromium.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	=?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
	"open list:VIRTIO CORE,
	NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
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

On Thu, Aug 29, 2019 at 2:24 PM David Riley <davidriley@chromium.org> wrote:
>
> Userspace requested command buffer allocations could be too large
> to make as a contiguous allocation.  Use vmalloc if necessary to
> satisfy those allocations.
>
> Signed-off-by: David Riley <davidriley@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 74 ++++++++++++++++++++++++--
>  2 files changed, 73 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index ac60be9b5c19..a8732a8af766 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -195,7 +195,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>         if (ret)
>                 goto out_free;
>
> -       buf = memdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
> +       buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
>         if (IS_ERR(buf)) {
>                 ret = PTR_ERR(buf);
>                 goto out_unresv;
> @@ -230,7 +230,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>         return 0;
>
>  out_memdup:
> -       kfree(buf);
> +       kvfree(buf);
>  out_unresv:
>         ttm_eu_backoff_reservation(&ticket, &validate_list);
>  out_free:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 981ee16e3ee9..bcbc48b7284f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -154,7 +154,7 @@ static void free_vbuf(struct virtio_gpu_device *vgdev,
>  {
>         if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
>                 kfree(vbuf->resp_buf);
> -       kfree(vbuf->data_buf);
> +       kvfree(vbuf->data_buf);
>         kmem_cache_free(vgdev->vbufs, vbuf);
>  }
>
> @@ -251,6 +251,59 @@ void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
>         wake_up(&vgdev->cursorq.ack_queue);
>  }
>
> +/* How many bytes left in this page. */
> +static unsigned int rest_of_page(void *data)
> +{
> +       return PAGE_SIZE - offset_in_page(data);
> +}
> +
> +/* Create sg_table from a vmalloc'd buffer. */
> +static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size)
> +{
> +       int nents, ret, s, i;
> +       struct sg_table *sgt;
> +       struct scatterlist *sg;
> +       struct page *pg;
> +
> +       sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
> +       if (!sgt)
> +               return NULL;
> +
> +       nents = DIV_ROUND_UP(size, PAGE_SIZE) + 1;
> +       ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> +       if (ret) {
> +               kfree(sgt);
> +               return NULL;
> +       }
> +
> +       for_each_sg(sgt->sgl, sg, nents, i) {
> +               pg = vmalloc_to_page(data);
> +               if (!pg) {
> +                       sg_free_table(sgt);
> +                       kfree(sgt);
> +                       return NULL;
> +               }
> +
> +               s = rest_of_page(data);
> +               if (s > size)
> +                       s = size;
> +
> +               sg_set_page(sg, pg, s, offset_in_page(data));
> +
> +               size -= s;
> +               data += s;
> +
> +               if (size) {
> +                       sg_unmark_end(sg);
> +               } else {
> +                       sg_mark_end(sg);
> +                       break;
> +               }
> +       }
> +
> +       return sgt;
> +}
> +
>  static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
>                                                struct virtio_gpu_vbuffer *vbuf)
>                 __releases(&vgdev->ctrlq.qlock)
> @@ -260,6 +313,7 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
>         struct scatterlist *sgs[3], vcmd, vout, vresp;
>         int outcnt = 0, incnt = 0;
>         int ret;
> +       struct sg_table *sgt = NULL;
>
>         if (!vgdev->vqs_ready)
>                 return -ENODEV;
> @@ -269,8 +323,17 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
>         outcnt++;
>
>         if (vbuf->data_size) {
> -               sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
> -               sgs[outcnt + incnt] = &vout;
> +               if (is_vmalloc_addr(vbuf->data_buf)) {
> +                       spin_unlock(&vgdev->ctrlq.qlock);
> +                       sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size);
> +                       spin_lock(&vgdev->ctrlq.qlock);
> +                       if (!sgt)
> +                               return -ENOMEM;
> +                       sgs[outcnt + incnt] = sgt->sgl;
If the construction of sgs is no longer atomic, it should be moved out
of the critical section.
> +               } else {
> +                       sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
> +                       sgs[outcnt + incnt] = &vout;
> +               }
>                 outcnt++;
>         }
>
> @@ -294,6 +357,11 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
>                 virtqueue_kick(vq);
>         }
>
> +       if (sgt) {
> +               sg_free_table(sgt);
> +               kfree(sgt);
> +       }
> +
>         if (!ret)
>                 ret = vq->num_free;
>         return ret;
> --
> 2.23.0.187.g17f5b7556c-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
