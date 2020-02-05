Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 390EB15395C
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 20:57:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D48BB85EA5;
	Wed,  5 Feb 2020 19:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdPGRLikUKZK; Wed,  5 Feb 2020 19:57:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E8D0685EA4;
	Wed,  5 Feb 2020 19:57:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C95D1C0174;
	Wed,  5 Feb 2020 19:57:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D37AC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 19:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0B19886190
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 19:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTkwRU-t3DeF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 19:57:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 429D485F8E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 19:57:15 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m25so3559989ioo.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 11:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8DT/JDkCyTz3eJT+UFCcTHz+yBESFEOpQDShsbicZo=;
 b=WUu4aa27JwL7uv2P/L4c3Ok+FyuKnqJGHLzGZYjJt9q/DSazi89aSuNF5QF2wicVsv
 ebLtKMEBEsZTeJWcdtGUvwZRlzQ6lkH9tS6lvboxehjdvt+GgWZOI0X3pYDwY5fbUwlk
 66EQ3KGTsAybDLyF43WaeikkWK6NTpmVU9U5LF4og2RqArCzJtLfT9K6EN7ncauORJV3
 viR4bsYex8C8aof2HDO8Bn+/YKScoZj0PNhkb249dkiQ/jhxzlJQ0woYy1wUNij+nC3p
 ddfQqM4Yu9A2zOMqInce5lbterdjRi4WoVxM6b1kcH5v/XULCALRXlK6AJmKiK5hABpP
 2K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8DT/JDkCyTz3eJT+UFCcTHz+yBESFEOpQDShsbicZo=;
 b=pqgkTTTgxx4BXN596TLF1hhjFO/T650B8xQUZ3P889viM2B4DctexRBmrexyx4YgNt
 eV4N2w7MtmYWZwbeS0P/kvpa0LsmxMWYrp0jUBZBQQNwYD8nGsEt1Ee85o9V5XeBxpid
 o6zKp2kzxZ1oDbz/XjHnY1SNGo0Rb/zCGf2YR2Vj/TyZAUpYNXa5kw+MUN25fXbUFsTv
 92swf4H1IcqJwwLo5Wn0YO6ieptmLCnjVDSuzsFlnSkuUFw4oyMdz7CzCCQgM16OC8Bs
 DU72Cb79wXUF1aIeCNZR7Tl6n6xvRTLN4PrNrnwVWEcDV5imVQmCFbRy3mz1bW3e2PJ/
 6rVw==
X-Gm-Message-State: APjAAAU2uQWNa4B0H+DFlDNQtbxcmyZ2vtahe84StmuynuNqT9IXyz9c
 smUFO9hJEjcm1M43nNbEzF/xUDpAm3IJ7fifE+8=
X-Google-Smtp-Source: APXvYqzzljsWEvyAgqshuVvQI0+bwWGkLOy/+bGZ3qsxtX0LFjmImFZkCekHNQSV/qnqvg1jI5PMWdsyBC7Y9123Vas=
X-Received: by 2002:a6b:e705:: with SMTP id b5mr31341286ioh.139.1580932634363; 
 Wed, 05 Feb 2020 11:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20200205105955.28143-1-kraxel@redhat.com>
 <20200205105955.28143-5-kraxel@redhat.com>
In-Reply-To: <20200205105955.28143-5-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 5 Feb 2020 11:57:03 -0800
Message-ID: <CAPaKu7RxijC_oS4GPukS9wEe9gn8DPQgaGZKwG6g8M8xwTnsig@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/virtio: move virtio_gpu_mem_entry initialization
 to new function
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Gurchetan Singh <gurchetansingh@chromium.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Feb 5, 2020 at 3:00 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Introduce new virtio_gpu_object_shmem_init() helper function which will
> create the virtio_gpu_mem_entry array, containing the backing storage
> information for the host.  For the most path this just moves code from
> virtio_gpu_object_attach().
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  4 ++
>  drivers/gpu/drm/virtio/virtgpu_object.c | 49 +++++++++++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_vq.c     | 49 ++-----------------------
>  3 files changed, 56 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 15fb3c12f22f..be62a7469b04 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -71,6 +71,10 @@ struct virtio_gpu_object {
>
>         struct sg_table *pages;
>         uint32_t mapped;
> +
> +       struct virtio_gpu_mem_entry *ents;
> +       unsigned int nents;
> +
>         bool dumb;
>         bool created;
>  };
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index bce2b3d843fe..4e82e269a1f4 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -121,6 +121,49 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
>         return &bo->base.base;
>  }
>
> +static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
> +                                       struct virtio_gpu_object *bo)
> +{
> +       bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
> +       struct scatterlist *sg;
> +       int si, ret;
> +
> +       ret = drm_gem_shmem_pin(&bo->base.base);
> +       if (ret < 0)
> +               return -EINVAL;
> +
> +       bo->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
> +       if (bo->pages == NULL) {
> +               drm_gem_shmem_unpin(&bo->base.base);
> +               return -EINVAL;
> +       }
> +
> +       if (use_dma_api) {
> +               bo->mapped = dma_map_sg(vgdev->vdev->dev.parent,
> +                                        bo->pages->sgl, bo->pages->nents,
> +                                        DMA_TO_DEVICE);
> +               bo->nents = bo->mapped;
> +       } else {
> +               bo->nents = bo->pages->nents;
> +       }
> +
> +       bo->ents = kmalloc_array(bo->nents, sizeof(struct virtio_gpu_mem_entry),
> +                                GFP_KERNEL);
> +       if (!bo->ents) {
> +               DRM_ERROR("failed to allocate ent list\n");
> +               return -ENOMEM;
> +       }
> +
> +       for_each_sg(bo->pages->sgl, sg, bo->nents, si) {
> +               bo->ents[si].addr = cpu_to_le64(use_dma_api
> +                                               ? sg_dma_address(sg)
> +                                               : sg_phys(sg));
> +               bo->ents[si].length = cpu_to_le32(sg->length);
> +               bo->ents[si].padding = 0;
> +       }
> +       return 0;
> +}
> +
>  int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                              struct virtio_gpu_object_params *params,
>                              struct virtio_gpu_object **bo_ptr,
> @@ -165,6 +208,12 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                                                objs, fence);
>         }
>
> +       ret = virtio_gpu_object_shmem_init(vgdev, bo);
> +       if (ret != 0) {
> +               virtio_gpu_free_object(&shmem_obj->base);
> +               return ret;
> +       }
> +
>         ret = virtio_gpu_object_attach(vgdev, bo, NULL);
>         if (ret != 0) {
>                 virtio_gpu_free_object(&shmem_obj->base);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index e258186bedb2..7db91376f2f2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1081,54 +1081,11 @@ int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
>                              struct virtio_gpu_object *obj,
>                              struct virtio_gpu_fence *fence)
>  {
> -       bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
> -       struct virtio_gpu_mem_entry *ents;
> -       struct scatterlist *sg;
> -       int si, nents, ret;
> -
> -       if (WARN_ON_ONCE(!obj->created))
> -               return -EINVAL;
> -       if (WARN_ON_ONCE(obj->pages))
> -               return -EINVAL;
> -
> -       ret = drm_gem_shmem_pin(&obj->base.base);
> -       if (ret < 0)
> -               return -EINVAL;
> -
> -       obj->pages = drm_gem_shmem_get_sg_table(&obj->base.base);
> -       if (obj->pages == NULL) {
> -               drm_gem_shmem_unpin(&obj->base.base);
> -               return -EINVAL;
> -       }
> -
> -       if (use_dma_api) {
> -               obj->mapped = dma_map_sg(vgdev->vdev->dev.parent,
> -                                        obj->pages->sgl, obj->pages->nents,
> -                                        DMA_TO_DEVICE);
> -               nents = obj->mapped;
> -       } else {
> -               nents = obj->pages->nents;
> -       }
> -
> -       /* gets freed when the ring has consumed it */
> -       ents = kmalloc_array(nents, sizeof(struct virtio_gpu_mem_entry),
> -                            GFP_KERNEL);
> -       if (!ents) {
> -               DRM_ERROR("failed to allocate ent list\n");
> -               return -ENOMEM;
> -       }
> -
> -       for_each_sg(obj->pages->sgl, sg, nents, si) {
> -               ents[si].addr = cpu_to_le64(use_dma_api
> -                                           ? sg_dma_address(sg)
> -                                           : sg_phys(sg));
> -               ents[si].length = cpu_to_le32(sg->length);
> -               ents[si].padding = 0;
> -       }
> -
>         virtio_gpu_cmd_resource_attach_backing(vgdev, obj->hw_res_handle,
> -                                              ents, nents,
> +                                              obj->ents, obj->nents,
>                                                fence);
> +       obj->ents = NULL;
> +       obj->nents = 0;
Hm, if the entries are temporary, can we allocate and initialize them
in this function?

virtio_gpu_object_shmem_init will just pin and map pages.  Maybe
rename it to virtio_gpu_object_pin_pages (and add a helper
virtio_gpu_object_unpin_pages for use by virtio_gpu_cleanup_object).

Because we pin pages on object creation, virtio_gpu_gem_funcs does not
need to provide the optional pin/unpin hooks.

>         return 0;
>  }
>
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
