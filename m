Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDB811A05B
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 02:07:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9F29B228BA;
	Wed, 11 Dec 2019 01:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUxKl0kviwRW; Wed, 11 Dec 2019 01:07:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CE8EE204A8;
	Wed, 11 Dec 2019 01:07:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3485C0881;
	Wed, 11 Dec 2019 01:07:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D60EC0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 01:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 180F086DDB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 01:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9kacsEsbPJB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 01:06:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2199886D85
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 01:06:58 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id e10so21999300ljj.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 17:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3U5Ton5GkI2QD9NYugFaf5BRq2pqUxCkGGQRfb840Q=;
 b=R5p8cM1REpNhwNG/S5JozlDrfWJgObKwfHJFLWfvYis1Ng08mRoAMlI0ycQSAeEcd6
 zeaPJeZGj7VhZvnEdIa+scrFuK0MppI/lpyBTfgIMcgTtliSBQrIhjZP5YFFE3kQCxWM
 fnMjAPdttTJzRAwTscCs7zhgii0RJlQ54lIy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3U5Ton5GkI2QD9NYugFaf5BRq2pqUxCkGGQRfb840Q=;
 b=aE9Ly/LHxIiDi99S9gzH8Cpk6wfBVd1ma20NuKTTR+m3/h8iNMjgndYrp5txoa21D6
 Olj7nsI5zWAOFMoNJl6fKU9Ea+NOaXjJ4Y7Dw2in0zmL0euJrwyzFbGRx15xjm4rme6U
 duzSbWL7MfsLFZpP0RMzAyUYnSoxPDSmuZzB2DMrKNLovcFhF0eny3DJ/PdWDm3+DfDY
 3q2WCcTV/PIfunmh9nOefRJis6a9zypODnfjRA5r3qw/tfFxfUfVyKw7Vpn6W/fG+zSw
 0/AQPFdMGBshFmDyDLxGZaPY2KxZmf+1bsQbFh6HDeM4IPadDdIUIxZ8cemfjzrDi52J
 +MfQ==
X-Gm-Message-State: APjAAAXs9z4LY0Bgm3cOuNFNJ1ocnZLFklRo/Pbr9YEXmlfydHxt1/t5
 BZnGP3VgClp17YHBkXXFf2L5K386wPU=
X-Google-Smtp-Source: APXvYqwFG+OCBQvQA9YFe5p55MP40fvaDFNpOcXkTAIap1IwTN0VdphiTSMbwJYC6+PEiAa/hye1Og==
X-Received: by 2002:a2e:94c8:: with SMTP id r8mr152051ljh.28.1576026415763;
 Tue, 10 Dec 2019 17:06:55 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id v2sm98480ljv.70.2019.12.10.17.06.53
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 17:06:54 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id v201so15259828lfa.11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 17:06:53 -0800 (PST)
X-Received: by 2002:a05:6512:1dd:: with SMTP id
 f29mr478455lfp.106.1576026413534; 
 Tue, 10 Dec 2019 17:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20191210085759.14763-1-kraxel@redhat.com>
In-Reply-To: <20191210085759.14763-1-kraxel@redhat.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 10 Dec 2019 17:06:42 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=prUDgkPjZdB9QcA9XHdcBCQSPcf4mBL75LG8QJ4D=0Q@mail.gmail.com>
Message-ID: <CAAfnVB=prUDgkPjZdB9QcA9XHdcBCQSPcf4mBL75LG8QJ4D=0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix mmap page attributes
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
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

On Tue, Dec 10, 2019 at 12:58 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> virtio-gpu uses cached mappings.  shmem helpers use writecombine though.
> So roll our own mmap function, wrapping drm_gem_shmem_mmap(), to tweak
> vm_page_prot accordingly.
>
> Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 017a9e0fc3bb..158610902054 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -75,6 +75,22 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
>         drm_gem_shmem_free_object(obj);
>  }
>
> +static int virtio_gpu_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +       pgprot_t prot;
> +       int ret;
> +
> +       ret = drm_gem_shmem_mmap(obj, vma);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* virtio-gpu needs normal caching, so clear writecombine */
> +       prot = vm_get_page_prot(vma->vm_flags);
> +       prot = pgprot_decrypted(prot);
> +       vma->vm_page_prot = prot;
> +       return 0;
> +}
> +
>  static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
>         .free = virtio_gpu_free_object,
>         .open = virtio_gpu_gem_object_open,
> @@ -86,7 +102,7 @@ static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
>         .get_sg_table = drm_gem_shmem_get_sg_table,
>         .vmap = drm_gem_shmem_vmap,

Do we need vmap/vmunap?  It seems optionable and also uses non-cacheable memory?

>         .vunmap = drm_gem_shmem_vunmap,
> -       .mmap = &drm_gem_shmem_mmap,
> +       .mmap = &virtio_gpu_gem_mmap,

Why the &virtio_gpu_gem_mmap?  Shouldn't just virtio_gpu_gem_mmap work?



>  };
>
>  struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
