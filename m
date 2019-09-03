Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 66864A7075
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 18:39:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 90519D9F;
	Tue,  3 Sep 2019 16:39:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 92EA7CBA
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 16:39:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 138F188E
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 16:39:35 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id b136so13278266iof.3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JzftJXzoOTFgbjF3xTbUoWc131CYvIfGIZLcafzYJHs=;
	b=jRpQzv72f0HZUJvx5o8Tjjf1nGxAfyjIBUkYXUQHDIflZYZp5Y3OWrgG3NoATvrbIT
	99h1T7plhj3mbL68RFdH+otunF0AX/njw29m+8yntWCKN3b25UO9S9youqKfZwYlrGLy
	HyfBZy3AQeRmy9xGVhAVntJcGG7A4s/zhBMA1dNM0TYfVYJxF58st0I5w+UuZN6B8bSi
	dqwntQuIcjlQhaZEODpPQW7i4W4uZjPrh7KGdWfUMa+8dOjqp0zHbKnlW8gjuLcI29Ed
	t35dGdAd1t8hQ2rYkwqjPRHste2w+ZGJ4xnrRCe5P6EJLYUKf7E16RCtNjlE0UlfJkLg
	ALvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JzftJXzoOTFgbjF3xTbUoWc131CYvIfGIZLcafzYJHs=;
	b=PA7C486z39K0PXfrDOsD/BAGMcrSITx1l3FnD4Kcn/mItLTZm9AWFW9tR59PmwTEYb
	DF8hpis6dgtYjz76fsYmLMKEFnGElXOoHAozxrdd/9DkgfXrUgPY/kxgIvYTGhyqzGzU
	FVug+FxH4EMkCyyio4IJeMz7l053zhLZmYKCNTapGSIZG8hXmb/qFdxTtjpLvrK82eIJ
	4gCG1RHOBHXQl0+DJnSPVkiMWmvcFnio1nReQHLw9TrmUpI/iULDwNH0IrcIoU2xRhGJ
	NDIZRWGSCgxzsJbJ2qfFp1NUDoE3yEPz7xZVi/7b6YT3aAwhelsU95X//gnZIfN5fZWs
	ipWA==
X-Gm-Message-State: APjAAAXBScBobSOvLYvAzNXZqxs3th27+mNmXGpkler8ehz+yIe4nhDO
	TsPwLYpUuj+oi5xPQbhglzZsZvAKJzNAXIORK9s=
X-Google-Smtp-Source: APXvYqxFcxaXizUfkzAkarARBL9OQt+CU3nnchi5sZTg5CAf54xc5ETUf7QWVo7WdxDzekz2H/nhunhKKyEH9Q13vNM=
X-Received: by 2002:a6b:6d0f:: with SMTP id a15mr20477540iod.278.1567528774230;
	Tue, 03 Sep 2019 09:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190830060116.10476-1-kraxel@redhat.com>
In-Reply-To: <20190830060116.10476-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 3 Sep 2019 09:39:23 -0700
Message-ID: <CAPaKu7TuBg0pAKJrvWAG4B0dWjKuGh_HwMKS4JoktS8q_NwOyg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: add worker for object release
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

On Thu, Aug 29, 2019 at 11:01 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Move object release into a separate worker.  Releasing objects requires
> sending commands to the host.  Doing that in the dequeue worker will
> cause deadlocks in case the command queue gets filled up, because the
> dequeue worker is also the one which will free up slots in the command
> queue.
>
> Reported-by: Chia-I Wu <olvaffe@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h |  8 ++++++++
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c |  6 ++++++
>  drivers/gpu/drm/virtio/virtgpu_vq.c  |  2 +-
>  4 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index fb35831ed351..314e02f94d9c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -78,6 +78,7 @@ struct virtio_gpu_object {
>
>  struct virtio_gpu_object_array {
>         struct ww_acquire_ctx ticket;
> +       struct list_head next;
>         u32 nents, total;
>         struct drm_gem_object *objs[];
>  };
> @@ -197,6 +198,10 @@ struct virtio_gpu_device {
>
>         struct work_struct config_changed_work;
>
> +       struct work_struct obj_free_work;
> +       spinlock_t obj_free_lock;
> +       struct list_head obj_free_list;
> +
>         struct virtio_gpu_drv_capset *capsets;
>         uint32_t num_capsets;
>         struct list_head cap_cache;
> @@ -246,6 +251,9 @@ void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
>  void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
>                                 struct dma_fence *fence);
>  void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
> +void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
> +                                      struct virtio_gpu_object_array *objs);
> +void virtio_gpu_array_put_free_work(struct work_struct *work);
>
>  /* virtio vg */
>  int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index b812094ae916..4c1f579edfb3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -239,3 +239,30 @@ void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
>                 drm_gem_object_put_unlocked(objs->objs[i]);
>         virtio_gpu_array_free(objs);
>  }
> +
> +void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
> +                                      struct virtio_gpu_object_array *objs)
> +{
> +       spin_lock(&vgdev->obj_free_lock);
> +       list_add_tail(&objs->next, &vgdev->obj_free_list);
> +       spin_unlock(&vgdev->obj_free_lock);
> +       schedule_work(&vgdev->obj_free_work);
> +}
> +
> +void virtio_gpu_array_put_free_work(struct work_struct *work)
> +{
> +       struct virtio_gpu_device *vgdev =
> +               container_of(work, struct virtio_gpu_device, obj_free_work);
> +       struct virtio_gpu_object_array *objs;
> +
> +       spin_lock(&vgdev->obj_free_lock);
> +       while (!list_empty(&vgdev->obj_free_list)) {
> +               objs = list_first_entry(&vgdev->obj_free_list,
> +                                       struct virtio_gpu_object_array, next);
> +               list_del(&objs->next);
> +               spin_unlock(&vgdev->obj_free_lock);
> +               virtio_gpu_array_put_free(objs);
> +               spin_lock(&vgdev->obj_free_lock);
> +       }
> +       spin_unlock(&vgdev->obj_free_lock);
> +}
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 231c4e27b3b3..0b3cdb0d83b0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -147,6 +147,11 @@ int virtio_gpu_init(struct drm_device *dev)
>         INIT_WORK(&vgdev->config_changed_work,
>                   virtio_gpu_config_changed_work_func);
>
> +       INIT_WORK(&vgdev->obj_free_work,
> +                 virtio_gpu_array_put_free_work);
> +       INIT_LIST_HEAD(&vgdev->obj_free_list);
> +       spin_lock_init(&vgdev->obj_free_lock);
> +
>  #ifdef __LITTLE_ENDIAN
>         if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
>                 vgdev->has_virgl_3d = true;
> @@ -226,6 +231,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
>  {
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>
> +       flush_work(&vgdev->obj_free_work);
>         vgdev->vqs_ready = false;
>         flush_work(&vgdev->ctrlq.dequeue_work);
>         flush_work(&vgdev->cursorq.dequeue_work);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index ecf57df965b0..595fa6ec2d58 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -227,7 +227,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
>
>         list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
>                 if (entry->objs)
> -                       virtio_gpu_array_put_free(entry->objs);
> +                       virtio_gpu_array_put_free_delayed(vgdev, entry->objs);
>                 list_del(&entry->list);
>                 free_vbuf(vgdev, entry);
>         }
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
