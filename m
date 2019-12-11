Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918611BBB1
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 19:27:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57F2186356;
	Wed, 11 Dec 2019 18:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IsSEq2e0qN-6; Wed, 11 Dec 2019 18:27:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF3E886193;
	Wed, 11 Dec 2019 18:27:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91719C0881;
	Wed, 11 Dec 2019 18:27:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90BE4C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 18:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8C9B686356
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 18:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjx3WbkV1eoU
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 18:27:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3202586193
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 18:27:51 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c16so23693345ioh.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 10:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mzDObby2jR84VqCAR2NNwsNmUH6L34aJzVs2dTgYaFM=;
 b=SQutmLP/sTlMS+zEASMFyKHYZa5f7ZvuA3wQ6jac0fGgK7KhPy0pJYlK9Ep86yG+qw
 wzyZcPvXgatCP1WzKGQ9qaWIfawy6sjA+myEUnoItidWjoBwaXzm6GzH8/YNDPrFYuNi
 KI1ImvVwYFkcjW2tTODNRvj/3xdCFvtFVcraGylloS+K8e19bwK5TLnyt3JKe/jYM7/q
 MRhQX0c6GfsJx/dvNnwivAkIfnoi4aXV/lLLKOWOsYzeiFLRupKYp1Z3i6jc9iTsZ9d8
 sdmC37PlxSS1zykHsxTjLMi/rf/gqm3CKQU1vUKQHLuQbovcOtO8cKbIH3pwgCb1Qyxe
 Y4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzDObby2jR84VqCAR2NNwsNmUH6L34aJzVs2dTgYaFM=;
 b=AakQ97L44ZXL0yr9gTiakzrkLh7w7Vxj8GrbxoFQAov3CFF6GQyuokaXUTZGuXEc41
 LxBV7CXMUm0C0I+rqf4gUorS/6xEyDiK8ClW8zlkwbV2bAVbUvjb+JCemb72EYV1laBR
 sXl//Tmpvrjzi3QQOPU2MXIt8JgX60+oK8nbARgQ8wiLlb8e1jjdCYITQUSrar6jLOqN
 B7zndHG8dZlgmvf8FJ+YYPrK+TngbDz1Mzg0w9LT2l6489RhKOHHWTkGETvAkVP6ibDa
 sS/i6BWz9qShBvKoVkKf1O5a1dOgVAI1Tw9ZdZLuEMwf2PfQtN3wnLSW90f9bsuAqygC
 ofDA==
X-Gm-Message-State: APjAAAVCgoTqfvwkOriR4vrHSnP91nDMLMt7wI/z73+W4kuvjc8eVaE0
 lCX/ytTY0J48F+dgdW7JYZo1RYRmvIg+G/BOzmE=
X-Google-Smtp-Source: APXvYqzr/oijDkWCcNuhvBnIVjwCPuuM7oI1QguAVqVj6YMeD8ttf/i0DbRLSFLpONolcFkrV56yhH2S3xvlzv460ao=
X-Received: by 2002:a6b:1455:: with SMTP id 82mr3759846iou.200.1576088870232; 
 Wed, 11 Dec 2019 10:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20191211084216.25405-1-kraxel@redhat.com>
 <20191211084216.25405-2-kraxel@redhat.com>
In-Reply-To: <20191211084216.25405-2-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 11 Dec 2019 10:27:39 -0800
Message-ID: <CAPaKu7TyMPt4Wpq9FoWyTJSppURrz9XuFqD4fmFg6aX_9p+jtw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/virtio: skip set_scanout if framebuffer didn't
 change
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
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 31 ++++++++++++++------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index bc4bc4475a8c..a0f91658c2bc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -151,20 +151,23 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>         if (bo->dumb)
>                 virtio_gpu_update_dumb_bo(vgdev, bo, plane->state);
>
> -       DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
> -                 bo->hw_res_handle,
> -                 plane->state->crtc_w, plane->state->crtc_h,
> -                 plane->state->crtc_x, plane->state->crtc_y,
> -                 plane->state->src_w >> 16,
> -                 plane->state->src_h >> 16,
> -                 plane->state->src_x >> 16,
> -                 plane->state->src_y >> 16);
> -       virtio_gpu_cmd_set_scanout(vgdev, output->index,
> -                                  bo->hw_res_handle,
> -                                  plane->state->src_w >> 16,
> -                                  plane->state->src_h >> 16,
> -                                  plane->state->src_x >> 16,
> -                                  plane->state->src_y >> 16);
> +       if (plane->state->fb != old_state->fb) {
Should we check src_{w,h,x,y} as well?
> +               DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
> +                         bo->hw_res_handle,
> +                         plane->state->crtc_w, plane->state->crtc_h,
> +                         plane->state->crtc_x, plane->state->crtc_y,
> +                         plane->state->src_w >> 16,
> +                         plane->state->src_h >> 16,
> +                         plane->state->src_x >> 16,
> +                         plane->state->src_y >> 16);
> +               virtio_gpu_cmd_set_scanout(vgdev, output->index,
> +                                          bo->hw_res_handle,
> +                                          plane->state->src_w >> 16,
> +                                          plane->state->src_h >> 16,
> +                                          plane->state->src_x >> 16,
> +                                          plane->state->src_y >> 16);
> +       }
> +
>         virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
>                                       plane->state->src_x >> 16,
>                                       plane->state->src_y >> 16,
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
