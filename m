Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4A15389B
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 20:02:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCE3985E83;
	Wed,  5 Feb 2020 19:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqiIuGmGFWWR; Wed,  5 Feb 2020 19:02:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA74085E5C;
	Wed,  5 Feb 2020 19:02:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A2E7C0175;
	Wed,  5 Feb 2020 19:02:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A46EC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 19:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 88B1D85E5C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 19:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0mtswtz2VkM
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 19:02:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A837885E27
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 19:02:31 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id p8so2780241iln.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 11:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFFmVcVESEfwSn2A/244mgSc36NuR/2W0Tkvm0b+8y8=;
 b=OkchdjsZNX5fOzLnoUuy87cUuoKByubZ2zqOERnwR9hKX8hukkCmV8HCsiT0Arwhqh
 O3u9tIDy2LybmWCTmCT2t6gZkyGkqHAe44Iz/NgWrgghuk72FiEkhGsKXBwAe7MREQnP
 9O3smUse0EtCi7RJE2RRNhWI3fQMJwh3UhJhHutolJpbCE+w4TSFfGqPpxdb7kG51xYS
 W2ZpdBe8R0FeOw5HfCQLhmkt6rPo1ibCRSBEg6/O4W7XUwE6nvpNca5Whcb6Cy40v5ip
 34/JEifRWbqP0vThcUQFmYe7iD4JZsM8IbEXOmS2lfT02z3oNYd4U3NS9p3e9u99LbDr
 yI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFFmVcVESEfwSn2A/244mgSc36NuR/2W0Tkvm0b+8y8=;
 b=jI8jAWAd27K0sGBp2rJjvFshBeo27MG/s/3K17x8pkdwb6NpmUiDlgE+W9V18OKbbK
 eYrL4lt/boPC/kqBCwnClCJlhwL+hH1Gs3HwrZMRRUhymyCO6A2fldQfn/N8vtaH75Ii
 gbzFSf4wHi74GhMYb6fa+Y5+krYJVZEhZvqKm+l49P7cxg+Imv2Oo3n+1q7f7kKPVZJ6
 xeUNqOu4vBi/wJks5G7K5KLIWRkMya+vts7jAssz5sP+XlZpmGnAqJpa99t+AZ1fA/4b
 U7c88R76VLFJS+T6qOAEftI4iDzPzNn6CcfPQgRJI4J0coO8tLv4i25iaP2koxaaP69Y
 tpPg==
X-Gm-Message-State: APjAAAWwFAXy9+ebZOl4VmwI/euh5SnBtNn8DsshViPphledQu9Aaw41
 5KiJvf2FgD+8wia3ir3hSisIPm1Mf7hoYLizSbk=
X-Google-Smtp-Source: APXvYqyp9wuSn6/5IMsbRVub/R5YxR28vshgim22WfgXtRPHIQYjj4RUu6bWJWFTvDN/70errdbBVIhzy+NuDtuJv0s=
X-Received: by 2002:a92:9ac5:: with SMTP id c66mr35877612ill.232.1580929350686; 
 Wed, 05 Feb 2020 11:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20200205105955.28143-1-kraxel@redhat.com>
 <20200205105955.28143-3-kraxel@redhat.com>
In-Reply-To: <20200205105955.28143-3-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 5 Feb 2020 11:02:19 -0800
Message-ID: <CAPaKu7SCk_3yeTtzFTTU_y-tyo8EDS7vR8i+mk829=0D-UjLQA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/virtio: resource teardown tweaks
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
> Add new virtio_gpu_cleanup_object() helper function for object cleanup.
> Wire up callback function for resource unref, do cleanup from callback
> when we know the host stopped using the resource.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  3 ++-
>  drivers/gpu/drm/virtio/virtgpu_object.c | 19 ++++++++++----
>  drivers/gpu/drm/virtio/virtgpu_vq.c     | 35 ++++++++++++++++++++++---
>  3 files changed, 48 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 7e69c06e168e..372dd248cf02 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -262,7 +262,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>                                     struct virtio_gpu_object_array *objs,
>                                     struct virtio_gpu_fence *fence);
>  void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
> -                                  uint32_t resource_id);
> +                                  struct virtio_gpu_object *bo);
>  void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
>                                         uint64_t offset,
>                                         uint32_t width, uint32_t height,
> @@ -355,6 +355,7 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
>                                     u64 last_seq);
>
>  /* virtio_gpu_object */
> +void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
>  struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
>                                                 size_t size);
>  int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 017a9e0fc3bb..28a161af7503 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -61,6 +61,14 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
>         }
>  }
>
> +void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
> +{
> +       struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
> +
> +       virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
> +       drm_gem_shmem_free_object(&bo->base.base);
> +}
> +
>  static void virtio_gpu_free_object(struct drm_gem_object *obj)
>  {
>         struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> @@ -68,11 +76,12 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
>
>         if (bo->pages)
>                 virtio_gpu_object_detach(vgdev, bo);
> -       if (bo->created)
> -               virtio_gpu_cmd_unref_resource(vgdev, bo->hw_res_handle);
> -       virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
> -
> -       drm_gem_shmem_free_object(obj);
> +       if (bo->created) {
> +               virtio_gpu_cmd_unref_resource(vgdev, bo);
> +               /* completion handler calls virtio_gpu_cleanup_object() */
nitpick: we don't need this comment when virtio_gpu_cmd_unref_cb is
defined by this file and passed to virtio_gpu_cmd_unref_resource.

I happen to be looking at our error handling paths.  I think we want
virtio_gpu_queue_fenced_ctrl_buffer to call vbuf->resp_cb on errors.


> +               return;
> +       }
> +       virtio_gpu_cleanup_object(bo);
>  }
>
>  static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 6d6d55dc384e..6e8097e4c214 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -152,6 +152,15 @@ static void *virtio_gpu_alloc_cmd(struct virtio_gpu_device *vgdev,
>                                          sizeof(struct virtio_gpu_ctrl_hdr), NULL);
>  }
>
> +static void *virtio_gpu_alloc_cmd_cb(struct virtio_gpu_device *vgdev,
> +                                    struct virtio_gpu_vbuffer **vbuffer_p,
> +                                    int size,
> +                                    virtio_gpu_resp_cb cb)
> +{
> +       return virtio_gpu_alloc_cmd_resp(vgdev, cb, vbuffer_p, size,
> +                                        sizeof(struct virtio_gpu_ctrl_hdr), NULL);
> +}
> +
>  static void free_vbuf(struct virtio_gpu_device *vgdev,
>                       struct virtio_gpu_vbuffer *vbuf)
>  {
> @@ -494,17 +503,37 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>         bo->created = true;
>  }
>
> +static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
> +                                   struct virtio_gpu_vbuffer *vbuf)
> +{
> +       struct virtio_gpu_object *bo;
> +
> +       bo = gem_to_virtio_gpu_obj(vbuf->objs->objs[0]);
> +       kfree(vbuf->objs);
> +       vbuf->objs = NULL;
> +
> +       virtio_gpu_cleanup_object(bo);
> +}
> +
>  void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
> -                                  uint32_t resource_id)
> +                                  struct virtio_gpu_object *bo)
>  {
>         struct virtio_gpu_resource_unref *cmd_p;
>         struct virtio_gpu_vbuffer *vbuf;
>
> -       cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
> +       cmd_p = virtio_gpu_alloc_cmd_cb(vgdev, &vbuf, sizeof(*cmd_p),
> +                                       virtio_gpu_cmd_unref_cb);
>         memset(cmd_p, 0, sizeof(*cmd_p));
>
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNREF);
> -       cmd_p->resource_id = cpu_to_le32(resource_id);
> +       cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> +
> +       /*
> +        * We are in the release callback and do NOT want refcount
> +        * bo, so do NOT use virtio_gpu_array_add_obj().
> +        */
> +       vbuf->objs = virtio_gpu_array_alloc(1);
> +       vbuf->objs->objs[0] = &bo->base.base
This is an abuse of obj array.  Add "void *private_data;" to
virtio_gpu_vbuffer and use that maybe?

Otherwise, simply

  // abuse objs field to pass our private data; must reset in the resp_cb
  vbuf->objs = (virtio_gpu_object_array *) bo;

makes it easier to see what is going on.


>
>         virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
>  }
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
