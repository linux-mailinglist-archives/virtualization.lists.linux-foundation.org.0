Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5417F5EBF2
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 20:49:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 87B2AE56;
	Wed,  3 Jul 2019 18:49:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C368FE4F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 18:49:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EC51D87B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 18:49:38 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u13so2922188iop.0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vOJHNxNrUJcbXPhBSJt8NjTBq3wVRWhORLzxlkFU3q4=;
	b=Qn107EmQi5+WtL32SSZno+UhKn1noDIhaJ3Q9PRGiLqIq11TBxjmFrmHJD72fg26OH
	yXvaYUzjThNkVud2D6CLA9hwx2cB+aEKxUEZflZtShCszSxK7AY/HqVF7AIQfaSpKKcq
	aN1Y3ZXKk7QyfnRlcEuZw6XD6i0XYHKaSOY0uHMzJsvBgJzYKeNX0DtxvYSGa1d5aB0h
	eGSDdNMmXGa7D0VvLsNbR9x7rXllAypoGCtrPQ0Js4IVgw7n1FPZ+noTYtiGI+x0Ejfe
	GdG5mHFJ82Ep625i2HJP5kr3M8tkls4IaAwlviNlSvMW4PJsEaOj9Xn3hjpxmT0eLnED
	f0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vOJHNxNrUJcbXPhBSJt8NjTBq3wVRWhORLzxlkFU3q4=;
	b=SwYIuHlndOkaIwIoj5DdxDkO1sw0QRAVUm/3YB2ai7c8zLVj+Wos+eY7hiZhnqv8+1
	xirGafWMe5i1fWR6O50W/FrLU4cEWWEzCSJh0leNLqXb71MY5eRH8ym75XSgfDRYDchO
	MYLYUfGA8UdXclFdwWOLe0H7f0OnoG9hk4TsqyCCS29w5qHw1lVmWH/6KWntsVBMQRgo
	43W6xWyFBV4e+cPeTp7417SRDli5B+gU1EJvu/eEcNMR41tr1dMGdG8YqYBxSHB5eSft
	cjYmIQsw3fKmeA1qDdMDOMUFvRwD0Kozm9wDgAV/PTV7gLBg1D6UzkixfOcFed6rYcXa
	Tavg==
X-Gm-Message-State: APjAAAXcgmoCgRASJVz9OOFmW7Cm0mrS4P+mUyf8ePARy38zkuEFeO7U
	ATvL1CryjyzfVnBZGGYx8jmq2Ws9Uqq3pdoYjXo=
X-Google-Smtp-Source: APXvYqy3IxIBWg41G8y4QBK3sFV53uGtKBID9xEbGBJ7bVNOSiz+qncVjaqPBysyqbDnlC8ZgxVNT4XVrJo7PyRnfv4=
X-Received: by 2002:a02:c95a:: with SMTP id u26mr42314268jao.15.1562179778024; 
	Wed, 03 Jul 2019 11:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-9-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-9-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 3 Jul 2019 11:49:27 -0700
Message-ID: <CAPaKu7QP=A2kV_kqcT20Pmc831HviaBJN1RpOFoa=V1g6SmE_g@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
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

On Tue, Jul 2, 2019 at 7:19 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Rework fencing workflow, starting with virtio_gpu_execbuffer_ioctl.
> Stop using ttm helpers, use the virtio_gpu_array_* helpers (which work
> on the reservation objects directly) instead.
>
> New workflow:
>
>  (1) All gem objects needed by a command are added to a
>      virtio_gpu_object_array.
>  (2) All reservation objects will be locked (virtio_gpu_array_lock_resv).
>  (3) virtio_gpu_fence_emit() completes fence initialization.
>  (4) fence gets added to the objects, reservation objects are unlocked
>      (virtio_gpu_array_add_fence, virtio_gpu_array_unlock_resv).
>  (5) virtio command is submitted to the host.
>  (6) The completion callback (virtio_gpu_dequeue_ctrl_func)
>      will drop object references and free virtio_gpu_object_array.
>
> v6: rewrite most of the patch.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 56 +++++++++-----------------
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 21 +++++++---
>  3 files changed, 38 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index abb078a5dedf..98511d1dfff2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -121,9 +121,9 @@ struct virtio_gpu_vbuffer {
>
>         char *resp_buf;
>         int resp_size;
> -
>         virtio_gpu_resp_cb resp_cb;
>
> +       struct virtio_gpu_object_array *objs;
>         struct list_head list;
>  };
>
> @@ -318,7 +318,9 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
>                                             uint32_t resource_id);
>  void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
>                            void *data, uint32_t data_size,
> -                          uint32_t ctx_id, struct virtio_gpu_fence *fence);
> +                          uint32_t ctx_id,
> +                          struct virtio_gpu_object_array *objs,
> +                          struct virtio_gpu_fence *fence);
>  void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
>                                           uint32_t resource_id, uint32_t ctx_id,
>                                           uint64_t offset, uint32_t level,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 0caff3fa623e..9735d7e5899b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -105,16 +105,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>         struct drm_virtgpu_execbuffer *exbuf = data;
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
> -       struct drm_gem_object *gobj;
>         struct virtio_gpu_fence *out_fence;
> -       struct virtio_gpu_object *qobj;
>         int ret;
>         uint32_t *bo_handles = NULL;
>         void __user *user_bo_handles = NULL;
> -       struct list_head validate_list;
> -       struct ttm_validate_buffer *buflist = NULL;
> -       int i;
> -       struct ww_acquire_ctx ticket;
> +       struct virtio_gpu_object_array *buflist = NULL;
>         struct sync_file *sync_file;
>         int in_fence_fd = exbuf->fence_fd;
>         int out_fence_fd = -1;
> @@ -155,15 +150,10 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>                         return out_fence_fd;
>         }
>
> -       INIT_LIST_HEAD(&validate_list);
>         if (exbuf->num_bo_handles) {
> -
>                 bo_handles = kvmalloc_array(exbuf->num_bo_handles,
> -                                          sizeof(uint32_t), GFP_KERNEL);
> -               buflist = kvmalloc_array(exbuf->num_bo_handles,
> -                                          sizeof(struct ttm_validate_buffer),
> -                                          GFP_KERNEL | __GFP_ZERO);
> -               if (!bo_handles || !buflist) {
> +                                           sizeof(uint32_t), GFP_KERNEL);
> +               if (!bo_handles) {
>                         ret = -ENOMEM;
>                         goto out_unused_fd;
>                 }
> @@ -175,25 +165,21 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>                         goto out_unused_fd;
>                 }
>
> -               for (i = 0; i < exbuf->num_bo_handles; i++) {
> -                       gobj = drm_gem_object_lookup(drm_file, bo_handles[i]);
> -                       if (!gobj) {
> -                               ret = -ENOENT;
> -                               goto out_unused_fd;
> -                       }
> -
> -                       qobj = gem_to_virtio_gpu_obj(gobj);
> -                       buflist[i].bo = &qobj->tbo;
> -
> -                       list_add(&buflist[i].head, &validate_list);
> +               buflist = virtio_gpu_array_from_handles(drm_file, bo_handles,
> +                                                       exbuf->num_bo_handles);
> +               if (!buflist) {
> +                       ret = -ENOENT;
> +                       goto out_unused_fd;
>                 }
>                 kvfree(bo_handles);
>                 bo_handles = NULL;
>         }
>
> -       ret = virtio_gpu_object_list_validate(&ticket, &validate_list);
> -       if (ret)
> -               goto out_free;
> +       if (buflist) {
> +               ret = virtio_gpu_array_lock_resv(buflist);
> +               if (ret)
> +                       goto out_unused_fd;
> +       }
>
>         buf = memdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
>         if (IS_ERR(buf)) {
> @@ -220,24 +206,18 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>         }
>
>         virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
> -                             vfpriv->ctx_id, out_fence);
> -
> -       ttm_eu_fence_buffer_objects(&ticket, &validate_list, &out_fence->f);
> -
> -       /* fence the command bo */
> -       virtio_gpu_unref_list(&validate_list);
> -       kvfree(buflist);
> +                             vfpriv->ctx_id, buflist, out_fence);
>         return 0;
>
>  out_memdup:
>         kfree(buf);
>  out_unresv:
> -       ttm_eu_backoff_reservation(&ticket, &validate_list);
> -out_free:
> -       virtio_gpu_unref_list(&validate_list);
> +       if (buflist)
> +               virtio_gpu_array_unlock_resv(buflist);
>  out_unused_fd:
>         kvfree(bo_handles);
> -       kvfree(buflist);
> +       if (buflist)
> +               virtio_gpu_array_put_free(buflist);
>
>         if (out_fence_fd >= 0)
>                 put_unused_fd(out_fence_fd);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 6c1a90717535..dbe329801e84 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -191,7 +191,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
>         } while (!virtqueue_enable_cb(vgdev->ctrlq.vq));
>         spin_unlock(&vgdev->ctrlq.qlock);
>
> -       list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
> +       list_for_each_entry(entry, &reclaim_list, list) {
>                 resp = (struct virtio_gpu_ctrl_hdr *)entry->resp_buf;
>
>                 trace_virtio_gpu_cmd_response(vgdev->ctrlq.vq, resp);
> @@ -218,14 +218,18 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
>                 }
>                 if (entry->resp_cb)
>                         entry->resp_cb(vgdev, entry);
> -
> -               list_del(&entry->list);
> -               free_vbuf(vgdev, entry);
>         }
>         wake_up(&vgdev->ctrlq.ack_queue);
>
>         if (fence_id)
>                 virtio_gpu_fence_event_process(vgdev, fence_id);
> +
> +       list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
> +               if (entry->objs)
> +                       virtio_gpu_array_put_free(entry->objs);
> +               list_del(&entry->list);
> +               free_vbuf(vgdev, entry);
> +       }
>  }
>
>  void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
> @@ -337,6 +341,10 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
>
>         if (fence)
>                 virtio_gpu_fence_emit(vgdev, hdr, fence);
> +       if (vbuf->objs) {
> +               virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
> +               virtio_gpu_array_unlock_resv(vbuf->objs);
> +       }
This is with the spinlock held.  Maybe we should move the
virtio_gpu_array_unlock_resv call out of the critical section.

I am actually more concerned about virtio_gpu_array_add_fence, but it
is also harder to move.  Should we add a kref to the object array?

This bothers me because I recently ran into a CPU-bound game with very
bad lock contention here.

>         rc = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
>         spin_unlock(&vgdev->ctrlq.qlock);
>         return rc;
> @@ -939,7 +947,9 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
>
>  void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
>                            void *data, uint32_t data_size,
> -                          uint32_t ctx_id, struct virtio_gpu_fence *fence)
> +                          uint32_t ctx_id,
> +                          struct virtio_gpu_object_array *objs,
> +                          struct virtio_gpu_fence *fence)
>  {
>         struct virtio_gpu_cmd_submit *cmd_p;
>         struct virtio_gpu_vbuffer *vbuf;
> @@ -949,6 +959,7 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
>
>         vbuf->data_buf = data;
>         vbuf->data_size = data_size;
> +       vbuf->objs = objs;
>
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_SUBMIT_3D);
>         cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
