Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A557903
	for <lists.virtualization@lfdr.de>; Thu, 27 Jun 2019 03:44:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1D806E4A;
	Thu, 27 Jun 2019 01:44:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0800FE38
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 01:44:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4624D3D0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 01:44:18 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id e3so1070419ioc.12
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 18:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IVLoUld7/lLKRDbgWpz0xiwtJpJGN7k4zpCN89qfViE=;
	b=byaCzKT3UVddOch9VFfpQbxefGQOoI6Z9Axaqzm7YnqZhjK98Tp70vnm+wE6BndkP1
	poXW0TaHsRcTu2zhHnFXuo1H1/AyhtUhodfFc8CKHoSi05OmD/vHm5RLikKe1ju/zud7
	tz6+N3lcXwYoVVJntjMHWfaFpbIkxT1LBETSuJdxbv3P0hGRuJB1k2Z3tHsElCT753pf
	au1kOlJehQvXzJO2EBWOkGvYeJIcC4YXBx8hZD5wvhn+TWd4b+lYu4MsM6qlBrWcxwvH
	Rzu+Q/NsFfltFQsTM+XKVxwZeUQ0w6tf4gaIqsZQBOhogdHBycCZ5ISJF7vLDm+jzXio
	kU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IVLoUld7/lLKRDbgWpz0xiwtJpJGN7k4zpCN89qfViE=;
	b=qNSuo/PImLS6pIJpSJC5wCElYROBqObQ48vzRDlPqE1no4tGfzGmSI7xMOwooN3By0
	yUvAPbrYZVWC4Z0Vjg9KyfcOJq2ndpFtiOc6Bp9IVVYQaNdyU16GGMqUyLBIO6bnCDzd
	s/W2kB0M+sOlbJG/hmy0zrxDvez0UEEpSp4W+lrrXy2TJ6DzcSYwNp2qIbS/EeYmVClh
	IzLQy9pLHA5gu83GGg0bTIn31QqrXmF2g1vjxgcM7UaO/FXBB8NMqhTLnEnZ6UijmGHr
	kAIOl5xd23jBHcr6FEpu8vGtHG+FKg30tHm/hlzVH0k++by82F/2LIrlylGawVds0HyD
	B5WQ==
X-Gm-Message-State: APjAAAXHhbP16D+9IYiaMa/Jznz4ZWLKpAAs78Ce1qx61VTtS3nimDpr
	7mMPGtAP9ieNYlVCY9FQA9639OkXwsMqpfj1fC8=
X-Google-Smtp-Source: APXvYqzeyk1++LiQqiw4mTL53VBEsVorrQfeS97UZJfC8Gtih+94j3yl/LbN13G78fr4/xzEelg44+lTDTyYJdx3tnw=
X-Received: by 2002:a5d:8e08:: with SMTP id e8mr1577465iod.139.1561599857443; 
	Wed, 26 Jun 2019 18:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
	<20190620060726.926-10-kraxel@redhat.com>
In-Reply-To: <20190620060726.926-10-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Jun 2019 18:44:06 -0700
Message-ID: <CAPaKu7R0uwZtpaFTNKytjcAqdy3qSqr=tiL+pYzF443ZMcghcA@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] drm/virtio: rework virtio_gpu_object_create
	fencing
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
> Use gem reservation helpers and direct reservation_object_* calls
> instead of ttm.
>
> v3: Due to using the gem reservation object it is initialized and ready
> for use before calling ttm_bo_init, so we can also drop the tricky fence
> logic which checks whenever the command is in flight still.  We can
> simply fence our object before submitting the virtio command and be done
> with it.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  6 ++-
>  drivers/gpu/drm/virtio/virtgpu_object.c | 54 +++++++++----------------
>  drivers/gpu/drm/virtio/virtgpu_vq.c     |  8 +++-
>  3 files changed, 30 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 65f5ce41c341..5213d7f499eb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -267,7 +267,8 @@ void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>                                     struct virtio_gpu_object *bo,
>                                     struct virtio_gpu_object_params *params,
> -                                   struct virtio_gpu_fence *fence);
> +                                   struct virtio_gpu_fence *fence,
> +                                   struct virtio_gpu_object_array *objs);
Move objs before fence?
>  void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
>                                    uint32_t resource_id);
>  void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
> @@ -328,7 +329,8 @@ void
>  virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
>                                   struct virtio_gpu_object *bo,
>                                   struct virtio_gpu_object_params *params,
> -                                 struct virtio_gpu_fence *fence);
> +                                 struct virtio_gpu_fence *fence,
> +                                 struct virtio_gpu_object_array *objs);
>  void virtio_gpu_ctrl_ack(struct virtqueue *vq);
>  void virtio_gpu_cursor_ack(struct virtqueue *vq);
>  void virtio_gpu_fence_ack(struct virtqueue *vq);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 82bfbf983fd2..90642907aa5c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -97,6 +97,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                              struct virtio_gpu_object **bo_ptr,
>                              struct virtio_gpu_fence *fence)
>  {
> +       struct virtio_gpu_object_array *objs = NULL;
>         struct virtio_gpu_object *bo;
>         size_t acc_size;
>         int ret;
> @@ -123,10 +124,27 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>         }
>         bo->dumb = params->dumb;
>
> +       if (fence) {
> +               struct ww_acquire_ctx ticket;
> +
> +               objs = virtio_gpu_array_alloc(1);
> +               objs->objs[0] = &bo->gem_base;
> +               drm_gem_object_get(objs->objs[0]);
> +
> +               ret = drm_gem_lock_reservations(objs->objs, objs->nents,
> +                                               &ticket);
With only one object, we should be able to do a quick
reservation_object_lock_interruptible.
> +               if (ret == 0)
> +                       reservation_object_add_excl_fence(objs->objs[0]->resv,
> +                                                         &fence->f);
> +               drm_gem_unlock_reservations(objs->objs, objs->nents, &ticket);
These may need to be moved to after virtio_gpu_cmd_resource_create_3d.
> +       }
> +
>         if (params->virgl) {
> -               virtio_gpu_cmd_resource_create_3d(vgdev, bo, params, fence);
> +               virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
> +                                                 fence, objs);
>         } else {
> -               virtio_gpu_cmd_create_resource(vgdev, bo, params, fence);
> +               virtio_gpu_cmd_create_resource(vgdev, bo, params,
> +                                              fence, objs);
>         }
>
>         virtio_gpu_init_ttm_placement(bo);
> @@ -139,38 +157,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>         if (ret != 0)
>                 return ret;
>
> -       if (fence) {
> -               struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
> -               struct list_head validate_list;
> -               struct ttm_validate_buffer mainbuf;
> -               struct ww_acquire_ctx ticket;
> -               unsigned long irq_flags;
> -               bool signaled;
> -
> -               INIT_LIST_HEAD(&validate_list);
> -               memset(&mainbuf, 0, sizeof(struct ttm_validate_buffer));
> -
> -               /* use a gem reference since unref list undoes them */
> -               drm_gem_object_get(&bo->gem_base);
> -               mainbuf.bo = &bo->tbo;
> -               list_add(&mainbuf.head, &validate_list);
> -
> -               ret = virtio_gpu_object_list_validate(&ticket, &validate_list);
> -               if (ret == 0) {
> -                       spin_lock_irqsave(&drv->lock, irq_flags);
> -                       signaled = virtio_fence_signaled(&fence->f);
> -                       if (!signaled)
> -                               /* virtio create command still in flight */
> -                               ttm_eu_fence_buffer_objects(&ticket, &validate_list,
> -                                                           &fence->f);
> -                       spin_unlock_irqrestore(&drv->lock, irq_flags);
> -                       if (signaled)
> -                               /* virtio create command finished */
> -                               ttm_eu_backoff_reservation(&ticket, &validate_list);
> -               }
> -               virtio_gpu_unref_list(&validate_list);
> -       }
> -
>         *bo_ptr = bo;
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index dc2c2c003200..6e2b287a7e4b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -391,13 +391,15 @@ static int virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
>  void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>                                     struct virtio_gpu_object *bo,
>                                     struct virtio_gpu_object_params *params,
> -                                   struct virtio_gpu_fence *fence)
> +                                   struct virtio_gpu_fence *fence,
> +                                   struct virtio_gpu_object_array *objs)
>  {
>         struct virtio_gpu_resource_create_2d *cmd_p;
>         struct virtio_gpu_vbuffer *vbuf;
>
>         cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
>         memset(cmd_p, 0, sizeof(*cmd_p));
> +       vbuf->objs = objs;
>
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_2D);
>         cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> @@ -864,13 +866,15 @@ void
>  virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
>                                   struct virtio_gpu_object *bo,
>                                   struct virtio_gpu_object_params *params,
> -                                 struct virtio_gpu_fence *fence)
> +                                 struct virtio_gpu_fence *fence,
> +                                 struct virtio_gpu_object_array *objs)
>  {
>         struct virtio_gpu_resource_create_3d *cmd_p;
>         struct virtio_gpu_vbuffer *vbuf;
>
>         cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
>         memset(cmd_p, 0, sizeof(*cmd_p));
> +       vbuf->objs = objs;
>
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_3D);
>         cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
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
