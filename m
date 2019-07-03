Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F1B5ED07
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 21:55:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CF5CDEAD;
	Wed,  3 Jul 2019 19:55:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 94102E81
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 19:55:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 126BC70D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 19:55:48 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u19so7743219ior.9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9+gyDIxwa9TKNSA922uniRSOmMo8WRarbz6ECjG6q3s=;
	b=EdSf/X0FJdhO5d/dqCKeohR6PLkXd7lN6xokNf99zWRQdnmYWcWce+jOKl5pHemrq4
	iGS3eTsFwup7Z3VqPObxCMsnwdJIcg+c05ouvYl76TLmjVBoXfuc3RumRz6ZlYt7/1uH
	19N/Oc+5fwNiUrQQ7eMZsBYMs3AeXaeJvlKKgFamv7C2QI72fQ2nD0PPvh3ljUAEqNn1
	U6NaUEuziTt2Pk45JkaPPWv2hWYg+yEHWRI6RGrDjHcF70QmBe8YpSQhmYZWdz7wVwbd
	Aam7FnqMWds4XJmER/e0GvKUke9xcmnhu3gNPRaP1aIabhKf5kPjXLj5yUeeNjOvYqwa
	lvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9+gyDIxwa9TKNSA922uniRSOmMo8WRarbz6ECjG6q3s=;
	b=Iil34G0Lhve4yVHbcFv+jeShWJooxQh94kK+zi0mJZPVypfHHDrUbI5RKzShTlYQw5
	GU3aaWzsj1S6EeR+tpokdW59+ccpVfo/LyRdfCdEj4qaBU6J2lqdX70/C+RbH79LRcWZ
	xRXttGuG7AbE+xevaKAf3v6s18tZ/gK/96AQWTAzLNT8eynfy+wfmbg3EeAKHLYxt9Q7
	kA6rzmWdSB/ZIPtNWnGJfcK1cZ+h/l7otW/OWprtl170o+6zwhthhPYN1WnQg51laq4j
	D9hCJYv+Sk92RddV0cCHYYJ0ilPOTjxtUsOGQBe5t0PU9FmBEkwLxw5aDhm6rZe0l208
	PlEg==
X-Gm-Message-State: APjAAAXDeJN72oJdDQxoZg8A7yKT6Qj5iiRgTK2j0eL0mO4hGQR7xwxK
	Vc+Pe9iKZCdGA+LQimlN+PEftCL0vHTCf27m7z0=
X-Google-Smtp-Source: APXvYqysnsagj5H3sQgd0ZlSzrPZ/TAw94axoBAK1MOwhKEvhW43PmH5vFtzDhnEtYdhFOOuqo2pQYj1ppGkEO+smcc=
X-Received: by 2002:a02:7121:: with SMTP id n33mr6312625jac.19.1562183747326; 
	Wed, 03 Jul 2019 12:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-16-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-16-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 3 Jul 2019 12:55:36 -0700
Message-ID: <CAPaKu7S0n=E7g0o2e6fEk1YjP+u=tsoV8upw7J=noSx88PgP+A@mail.gmail.com>
Subject: Re: [PATCH v6 15/18] drm/virtio: rework
	virtio_gpu_transfer_to_host_ioctl fencing
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
> Switch to the virtio_gpu_array_* helper workflow.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 43 ++++++++++++--------------
>  drivers/gpu/drm/virtio/virtgpu_vq.c    |  5 ++-
>  3 files changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 4df760ba018e..b1f63a21abb6 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -308,10 +308,10 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
>                                           struct virtio_gpu_object_array *objs,
>                                           struct virtio_gpu_fence *fence);
>  void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
> -                                       struct virtio_gpu_object *bo,
>                                         uint32_t ctx_id,
>                                         uint64_t offset, uint32_t level,
>                                         struct virtio_gpu_box *box,
> +                                       struct virtio_gpu_object_array *objs,
>                                         struct virtio_gpu_fence *fence);
>  void
>  virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 56182abdbf36..b220918df6a1 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -341,47 +341,44 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
>         struct drm_virtgpu_3d_transfer_to_host *args = data;
> -       struct drm_gem_object *gobj = NULL;
> -       struct virtio_gpu_object *qobj = NULL;
> +       struct virtio_gpu_object_array *objs;
>         struct virtio_gpu_fence *fence;
>         struct virtio_gpu_box box;
>         int ret;
>         u32 offset = args->offset;
>
> -       gobj = drm_gem_object_lookup(file, args->bo_handle);
> -       if (gobj == NULL)
> +       objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
> +       if (objs == NULL)
>                 return -ENOENT;
>
> -       qobj = gem_to_virtio_gpu_obj(gobj);
> -
> -       ret = virtio_gpu_object_reserve(qobj);
> -       if (ret)
> -               goto out;
> -
>         convert_to_hw_box(&box, &args->box);
>         if (!vgdev->has_virgl_3d) {
>                 virtio_gpu_cmd_transfer_to_host_2d
> -                       (vgdev, qobj, offset,
> +                       (vgdev, gem_to_virtio_gpu_obj(objs->objs[0]), offset,
>                          box.w, box.h, box.x, box.y, NULL);
> +               virtio_gpu_array_put_free(objs);
Don't we need this in non-3D case as well?
>         } else {
> +               ret = virtio_gpu_array_lock_resv(objs);
> +               if (ret != 0)
> +                       goto err_put_free;
> +
> +               ret = -ENOMEM;
>                 fence = virtio_gpu_fence_alloc(vgdev);
> -               if (!fence) {
> -                       ret = -ENOMEM;
> -                       goto out_unres;
> -               }
> +               if (!fence)
> +                       goto err_unlock;
> +
>                 virtio_gpu_cmd_transfer_to_host_3d
> -                       (vgdev, qobj,
> +                       (vgdev,
>                          vfpriv ? vfpriv->ctx_id : 0, offset,
> -                        args->level, &box, fence);
> -               reservation_object_add_excl_fence(qobj->base.base.resv,
> -                                                 &fence->f);
> +                        args->level, &box, objs, fence);
>                 dma_fence_put(&fence->f);
>         }
> +       return 0;
>
> -out_unres:
> -       virtio_gpu_object_unreserve(qobj);
> -out:
> -       drm_gem_object_put_unlocked(gobj);
> +err_unlock:
> +       virtio_gpu_array_unlock_resv(objs);
> +err_put_free:
> +       virtio_gpu_array_put_free(objs);
>         return ret;
>  }
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index bef7036f4508..1c0097de419a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -899,12 +899,13 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
>  }
>
>  void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
> -                                       struct virtio_gpu_object *bo,
>                                         uint32_t ctx_id,
>                                         uint64_t offset, uint32_t level,
>                                         struct virtio_gpu_box *box,
> +                                       struct virtio_gpu_object_array *objs,
>                                         struct virtio_gpu_fence *fence)
>  {
> +       struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
>         struct virtio_gpu_transfer_host_3d *cmd_p;
>         struct virtio_gpu_vbuffer *vbuf;
>         bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
> @@ -917,6 +918,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
>         cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
>         memset(cmd_p, 0, sizeof(*cmd_p));
>
> +       vbuf->objs = objs;
> +
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D);
>         cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
>         cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
