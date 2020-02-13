Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FB815CAC0
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 19:54:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 82E5187FF7;
	Thu, 13 Feb 2020 18:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZczRHXBLzL1; Thu, 13 Feb 2020 18:54:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D09BB87F71;
	Thu, 13 Feb 2020 18:54:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B67B5C0177;
	Thu, 13 Feb 2020 18:54:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6994EC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 18:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 55736868B4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 18:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjRw2rgvgcJ1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 18:54:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2F66786879
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 18:54:33 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id f70so5875881ill.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 10:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bRoElX6JuGSJIj1nzDEkGjFX2yatSmfvyb68/4mK0og=;
 b=KuFXWeFq0mYsucnXtEil4E8uJ/Xi9I8NFtS2D8Nq96ybHLSqVX3cFY/M54teo+zphX
 8Q+vqenQIgFsq8dmQMXw3ZmpsdTUAwPivpn+7DoDNxs33VG0bt4EL4MZs0CaLxuCCLQC
 BvDCnlVtrNTMZosO8DIxQVYaG1bHk04W/CfOjWw0T26357uN55rpZ+etDHcZAOfWgF3y
 PkKoBqpCWGE4usla6USJnXEklQP99luo5rprwn5EvvXoKO6HURlR+gMQJlQ/HNas5q7g
 iuefhdaHNMK9XZkv7BVrGXJNMutQvtTgtkimqb5M0PlEZbHRmiy9DPXnQohL6Qkm4NYw
 B8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bRoElX6JuGSJIj1nzDEkGjFX2yatSmfvyb68/4mK0og=;
 b=Q8gdzaGd3nK81BMQjU0p7Jb/ovhM7/YuDRxS7lRe9R42Lf4n7Zv1Q9hsEyoO9BqNQY
 +/loF3NQyR1TrCmeROVGlObBBiiduCT/XrlIE2KxibI6FXNXAMrTgxOUNdf0Hpvx75qX
 UfyD69fQMy4A9PSZ/3g30cwl8MT57MPO5fW280Osr0l/l2QolONxbxBkW7d5NSrqsiO9
 +dyTjYgw9sOmPK6vtk4FOxPelLB2wtoSSdhRibE01YxSvfHo/g4AcOwZOkDfE6wJZO9W
 7A4cUGZehBOOqCadoiv8rUYVBm/TYYBT6x7oSC2GT1JP5GlYxpQUeFwVLseH2SlXy8fA
 XTgg==
X-Gm-Message-State: APjAAAXJMs3+bVMXFARgEjq9xp+VByxIv5MCDFuAJiJ5OBT3iIaeU7CV
 eR5lSq9GvB76WH2jofW7LXoHarb3qLXYLai8G/g=
X-Google-Smtp-Source: APXvYqx18+9TYWouF+4cCT1KAMj8Zzdhy8YqKGILwwfJrRQPAlQk3MAbpmKQbgGXEpXBEPCMFAe+q5YqXY1DKL8W66k=
X-Received: by 2002:a92:9ac5:: with SMTP id c66mr18208254ill.232.1581620072485; 
 Thu, 13 Feb 2020 10:54:32 -0800 (PST)
MIME-Version: 1.0
References: <20200213132203.23441-1-kraxel@redhat.com>
 <20200213132203.23441-4-kraxel@redhat.com>
In-Reply-To: <20200213132203.23441-4-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 13 Feb 2020 10:54:21 -0800
Message-ID: <CAPaKu7TgvBtgPuJaeesCUP4zxDOO=xxtun48P=bT0VBF4-dNFg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/virtio: batch resource creation
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

On Thu, Feb 13, 2020 at 5:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Move virtio_gpu_notify() to higher-level functions for
> virtio_gpu_cmd_create_resource(), virtio_gpu_cmd_resource_create_3d()
> and virtio_gpu_cmd_resource_attach_backing().
>
> virtio_gpu_object_create() will batch commands and notify only once when
> creating a resource.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
>  drivers/gpu/drm/virtio/virtgpu_vq.c     | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 8870ee23ff2b..65d6834d3c74 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -224,6 +224,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                 return ret;
The virtqueue might become full without ever being notified on errors.
We should notify on errors, or better yet, virtio_gpu_queue_ctrl_sgs
should notify before waiting.


>         }
>
> +       virtio_gpu_notify(vgdev);
>         *bo_ptr = bo;
>         return 0;
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 9d4ca0fafa5f..778b7acf2f7f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -514,7 +514,6 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>         cmd_p->height = cpu_to_le32(params->height);
>
>         virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
> -       virtio_gpu_notify(vgdev);
>         bo->created = true;
>  }
>
> @@ -643,7 +642,6 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
>         vbuf->data_size = sizeof(*ents) * nents;
>
>         virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
> -       virtio_gpu_notify(vgdev);
>  }
>
>  static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
> @@ -1010,7 +1008,6 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
>         cmd_p->flags = cpu_to_le32(params->flags);
>
>         virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
> -       virtio_gpu_notify(vgdev);
>
>         bo->created = true;
>  }
> --
> 2.18.2
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
