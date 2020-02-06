Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B1D154B17
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 19:28:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B591A21FA9;
	Thu,  6 Feb 2020 18:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFb2yovsgg-L; Thu,  6 Feb 2020 18:28:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 698CA203BD;
	Thu,  6 Feb 2020 18:28:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D531C013E;
	Thu,  6 Feb 2020 18:28:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEF2AC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B7A11869BF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrh-xGi-23FX
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:28:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1311686937
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:28:08 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id x2so5946459ila.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 10:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HW00T6Osm6WH4TyAw4D1VjVNdK7xc2XqYCF6kdJYx0=;
 b=p+tk1qgQXb5MKd11ClypwRaVeIVdMZ4K2SD+LwlQ7GOM6fhKhbWva4FwPXvXOTGMWa
 DGj8rNa/PNMeIRlw+JnrjTPWtpL4lkNNMO0F2m1NFve1Mneh8erKwo0pr9ACTGBf0Vx/
 1tPD/PXcE5bZ+8XAs8F37YkCFMsK7kdgusMnmj/JbLNUbQ2uAbCjEQRNElvlZiM7vAmI
 hdtGWwONx5WxJtut7/1nJyAgCfCxMcaMSEMFbn8v+wHLLKQ0eL0O9jdW42FJ23ngwG67
 KqVjIWWUxrQrCwIXxNmORZcMn8+m2aXsWHSimGL+rqAVaKBGxBqOVapp1JP3jfje4pwJ
 Iw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HW00T6Osm6WH4TyAw4D1VjVNdK7xc2XqYCF6kdJYx0=;
 b=QkGHCBlVOhpCcqbRXi7Ka2tlb85Re4wVgmjhjMmPL/jgSQFANJ3KdJoAetDBLznAer
 4xEZiIdXim9i9NRE27YBYOkIaT6Y4X364ZeUiLysxTPNJEPFu2JTxW/F69rEFX98uVvg
 kMfeAL8E92371EDutq5Xh3H/FTsgeWoDWSBFx5cTpUoFg3z3wmn0sBXmx01zS0wGBKrK
 2Fx0JqBjgiSjnmD+ORwrPDMTIAcNaVFgYP+urW9ii6Mts9VXe5WZby1vQIhe4r1wyL3g
 xMCirngNs4YvihwOKkGv0VR8QogQ89A60BAcFWVKEBXvwfHWlZ1cZHfc3YGNXu22tvOG
 lwMg==
X-Gm-Message-State: APjAAAUkkOv85ezVnkv419iTWDV+f+wRdMAhYjTYU46vWDVu5B5MUKKY
 27U0e0NAuOmNYyri1BvHi1pmvxKzDLz+NA7c+bA=
X-Google-Smtp-Source: APXvYqyZHwa2nq6KKqKvIuJYn93vumUv6IBXrHaKHhs6sEs86YWEhSWwob0M4z8F+GAhJSeeCgWniAlw4vBvHBIWArM=
X-Received: by 2002:a5e:df06:: with SMTP id f6mr34797002ioq.84.1581013687236; 
 Thu, 06 Feb 2020 10:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20200206111416.31269-1-kraxel@redhat.com>
In-Reply-To: <20200206111416.31269-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 6 Feb 2020 10:27:56 -0800
Message-ID: <CAPaKu7Tfp-thov9xCe-Gbq1zZe_uvDAno8SV_3tc=tU0gse=uA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix ring free check
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

On Thu, Feb 6, 2020 at 3:14 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> If the virtio device supports indirect ring descriptors we need only one
> ring entry for the whole command.  Take that into account when checking
> whenever the virtqueue has enough free entries for our command.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 41e475fbd67b..a2ec09dba530 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -328,7 +328,8 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>  {
>         struct virtqueue *vq = vgdev->ctrlq.vq;
>         bool notify = false;
> -       int ret;
> +       bool indirect;
> +       int vqcnt, ret;
>
>  again:
>         spin_lock(&vgdev->ctrlq.qlock);
> @@ -341,9 +342,11 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>                 return;
>         }
>
> -       if (vq->num_free < elemcnt) {
> +       indirect = virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC);
> +       vqcnt = indirect ? 1 : elemcnt;
Is the feature dynamic and require the lock held?  If not, the result
can be cached and the fixup can happen before grabbing the lock

  if (vgdev->has_indirect_desc)
    elemcnt = 1;

Either way, patch is

  Reviewed-by: Chia-I Wu <olvaffe@gmail.com>


> +       if (vq->num_free < vqcnt) {
>                 spin_unlock(&vgdev->ctrlq.qlock);
> -               wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
> +               wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= vqcnt);
>                 goto again;
>         }
>
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
