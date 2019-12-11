Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1FA11BC76
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 20:04:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0FE8822EDD;
	Wed, 11 Dec 2019 19:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26kmM7zy7XIa; Wed, 11 Dec 2019 19:04:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 38993232FA;
	Wed, 11 Dec 2019 19:04:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 191FBC0881;
	Wed, 11 Dec 2019 19:04:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18FA3C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 19:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 085EC232FA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 19:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFjnN9nCeo5k
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 19:04:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 72DC722EDD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 19:04:11 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t17so20366974ilm.13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 11:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f1nlOc2n0b1t3obc3rKWIj5ixOjOEEj0+iZqrVipp9o=;
 b=D/1GyM9K41JOlRCD7lN5eU3vWpokEaPbOKAJ6/7sgnF2lgivSxP9Z7lmUx2lOjkZcu
 8jzg7Oh1qQ+jx1kIuLADi92d6wgC/Ho+yXkpv+EOzB02v3tA1EbfQSiP3ZC8yFJ1nXkc
 K6xhywDMCxsFgD/SftI9531KFjj999GO2h/5sdvutSW9i2eEXlrdUJHkZL7V65YPp6cL
 MypyIKnKw7hoh+0/isjG3MchY1pyX3aFaDRwhD720csf7KtAvEFeRmjs8lb6TDJoD19V
 PjuQdELCfa1r1/aD8M91Op+GfPLwqzlONrX3ZWrJmbL8+bAdX20m5V90dGsLIOSirdTi
 MJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f1nlOc2n0b1t3obc3rKWIj5ixOjOEEj0+iZqrVipp9o=;
 b=Z6K7opJnFgUq1RaiJuQpSTAwTDWDqXMq3dJRzaN5si2mlR8HC808mUqZq17KKqwp9R
 HNGQVQeI7qEY+DAPQ3vHxl8Q8LfLV/5a6APFGLs0PPTl/p7QDdMAAzmIpB+qI6u6LZfm
 8fV0QbDA9JjKRJiQK5vUvvnYSvh6nWPbi3vlY4b4RbLuvHFNGVhZJZBW+BiBDCK2ZKR4
 dJ2zlwtcqHGt4yJcF/i1ez90LvxyqjQTx2gpA1jvgDnebt07G3k7pYacsyuYbxWJUNED
 bGaFmhx0TsvF69Ggm5LqScayx+Nm+Icv7f0U7MntO6hfMGPrWHYMfeNib7EmvQtAvX+Z
 Rp1g==
X-Gm-Message-State: APjAAAXEjAs4JoUGXUgZr13QtauLv8sqHUzkYQ6/0TnKl/iobTF4+Fwa
 0kDEwcVSpqQ94cnpmTbqIPfKS+ux5+bkLoM+QI0=
X-Google-Smtp-Source: APXvYqxPNqI/M/Od5Srqmugr+fhahB2I9e8NKlqPiAdGKQBh8UdtL9bsnU5VG3zxSSFDPjHZfJ8AxYuPb8Qe6AeW2VA=
X-Received: by 2002:a92:84ce:: with SMTP id y75mr4470966ilk.93.1576091050492; 
 Wed, 11 Dec 2019 11:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20191211084216.25405-1-kraxel@redhat.com>
 <20191211084216.25405-4-kraxel@redhat.com>
In-Reply-To: <20191211084216.25405-4-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 11 Dec 2019 11:03:59 -0800
Message-ID: <CAPaKu7Tv2tGOW+Ns9yRQ0t9-Bk43wtV5KEh72fZuvPaX7Dy_gQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] virtio-gpu: use damage info for display updates.
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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

On Wed, Dec 11, 2019 at 12:42 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 41 +++++++++++++++-----------
>  1 file changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index 2e0d14e005db..1a0fbbb91ec7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -24,6 +24,7 @@
>   */
>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_plane_helper.h>
>
> @@ -103,22 +104,26 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>  }
>
>  static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
> -                                     struct virtio_gpu_object *bo,
> -                                     struct drm_plane_state *state)
> +                                     struct drm_plane_state *state,
> +                                     struct drm_rect *rect)
>  {
> +       struct virtio_gpu_object *bo =
> +               gem_to_virtio_gpu_obj(state->fb->obj[0]);
>         struct virtio_gpu_object_array *objs;
> +       uint32_t w = rect->x2 - rect->x1;
> +       uint32_t h = rect->y2 - rect->y1;
> +       uint32_t x = rect->x1 + (state->src_x >> 16);
> +       uint32_t y = rect->y1 + (state->src_y >> 16);
> +       uint32_t off = x * state->fb->format->cpp[0] +
> +               y * state->fb->pitches[0];
>
>         objs = virtio_gpu_array_alloc(1);
>         if (!objs)
>                 return;
>         virtio_gpu_array_add_obj(objs, &bo->base.base);
> -       virtio_gpu_cmd_transfer_to_host_2d
> -               (vgdev, 0,
> -                state->src_w >> 16,
> -                state->src_h >> 16,
> -                state->src_x >> 16,
> -                state->src_y >> 16,
> -                objs, NULL);
> +
> +       virtio_gpu_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
> +                                          objs, NULL);
>  }
>
>  static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
> @@ -127,8 +132,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>         struct drm_device *dev = plane->dev;
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct virtio_gpu_output *output = NULL;
> -       struct virtio_gpu_framebuffer *vgfb;
>         struct virtio_gpu_object *bo;
> +       struct drm_rect rect;
>
>         if (plane->state->crtc)
>                 output = drm_crtc_to_virtio_gpu_output(plane->state->crtc);
> @@ -146,12 +151,14 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>                 return;
>         }
>
> +       if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
> +               return;
> +
>         virtio_gpu_disable_notify(vgdev);
>
> -       vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
> -       bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> +       bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
>         if (bo->dumb)
> -               virtio_gpu_update_dumb_bo(vgdev, bo, plane->state);
> +               virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
>
>         if (plane->state->fb != old_state->fb) {
>                 DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
> @@ -171,10 +178,10 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>         }
>
>         virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
> -                                     plane->state->src_x >> 16,
> -                                     plane->state->src_y >> 16,
> -                                     plane->state->src_w >> 16,
> -                                     plane->state->src_h >> 16);
> +                                     (plane->state->src_x >> 16) + rect.x1,
> +                                     (plane->state->src_y >> 16) + rect.y1,
Digging into drm_atomic_helper_damage_merged, it seems rect uses
absolute values and is not relative to src_{x,y}.

> +                                     rect.x2 - rect.x1,
> +                                     rect.y2 - rect.y1);
>
>         virtio_gpu_enable_notify(vgdev);
>  }
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
