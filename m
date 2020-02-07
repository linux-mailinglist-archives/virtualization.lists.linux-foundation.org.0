Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3E11552BB
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 08:07:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B175287CD2;
	Fri,  7 Feb 2020 07:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiQJw35-8fAN; Fri,  7 Feb 2020 07:07:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1B4387D11;
	Fri,  7 Feb 2020 07:07:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B16E3C013E;
	Fri,  7 Feb 2020 07:07:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C279BC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AA81420421
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vy-Jj8mTZ2eF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:07:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by silver.osuosl.org (Postfix) with ESMTPS id C909A203B5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:07:39 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z16so1057868iod.11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 23:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fi9cuRdVpZSgrmjmcTsmxSYXnkK56wSAD8cgkFXFjqY=;
 b=GOZQ9nPFOSdqbLte2pDbaMgNEktQIGYkllAIVa6/gEXHF4fO2T7owOkENGAxg3H/V9
 JceazaFr86ZPcqZJCbYW/dz5qU6Oy2fbCJqtMIoYXY026tA6+rFXDlWu/nWH+/63mW5F
 77N6jmyap2Kbs9NPxAGGn5J3sj/xdMfV1zUmlRmC/aWu1EhJMlKsRmAPAe4B8/91nKpr
 gyTR/ACgn3VYQr9db2O4iwLgIDLBgCIbRcQxiOSI+IGkpAz3xmjVO5+6Sqc9fI6hBeZA
 Y7XOZMltEmSnLebh7rgWjpEUxSxu5sfPPy9YJ5o/710XH+4C9eGFPPOK7haF2FUkYiyV
 n54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fi9cuRdVpZSgrmjmcTsmxSYXnkK56wSAD8cgkFXFjqY=;
 b=W8laUP8drhY4JV5dWbo6K0cbWeqrG3zj6q9D8Tz4ms8Fw8mEUKjltdGA+LbhM7EmST
 KYoScctqvnRQB4ve8nR/6rI5Dk2mYq+WkeN3FgsNlOGpJGU9t1G0oHivSJH3zxhIcdBu
 Zqo5XrjB0aJEVSC+XZe9bOgbNaeQyF2enF5pogoIS11dYbvU21/ggJuTpGj3RfwJ9KWQ
 XAnpwrYHm9ghWCNKBOartP0yit5NynSxFtlR3CJjM49/6gIcGf9VvSWljBVYAWtkCffD
 +jyu01AMYReyKRobZtic46Af3Gk+HOqGIHl5mJNF11ppo7I9AUEp3saBf+9L6fsD5ijX
 NRwA==
X-Gm-Message-State: APjAAAUroK0oh6hCX+m9nuXlCgfphZkFrwkl0i688MjGbBsAAjgiEvZ/
 CEnCVe0ha3BqKDI624+3QU4EJToQ0Y7AsZOxITM=
X-Google-Smtp-Source: APXvYqyL4U+Y0Qvy1rn26gr/Unt4Zgd8TMPUJc0YmKynNBNEurpRo3qS4nm7f8ue9KuxlLv4Y03l5JOkGB1DGCL+sPU=
X-Received: by 2002:a02:a14f:: with SMTP id m15mr1989018jah.16.1581059258769; 
 Thu, 06 Feb 2020 23:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20200207064653.14403-1-kraxel@redhat.com>
In-Reply-To: <20200207064653.14403-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 6 Feb 2020 23:07:27 -0800
Message-ID: <CAPaKu7R25+P-wGdEy2PnPuukcRNSO1ai3hQKtOTSZEMOrwCL7g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: fix ring free check
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

On Thu, Feb 6, 2020 at 10:47 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> If the virtio device supports indirect ring descriptors we need only one
> ring entry for the whole command.  Take that into account when checking
> whenever the virtqueue has enough free entries for our command.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h     | 1 +
>  drivers/gpu/drm/virtio/virtgpu_debugfs.c | 1 +
>  drivers/gpu/drm/virtio/virtgpu_kms.c     | 3 +++
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 3 +++
>  4 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 7e69c06e168e..d278c8c50f39 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -193,6 +193,7 @@ struct virtio_gpu_device {
>
>         bool has_virgl_3d;
>         bool has_edid;
> +       bool has_indirect;
has_indirect_desc?  Either way,

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
>
>         struct work_struct config_changed_work;
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> index 5156e6b279db..e27120d512b0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> @@ -47,6 +47,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
>
>         virtio_add_bool(m, "virgl", vgdev->has_virgl_3d);
>         virtio_add_bool(m, "edid", vgdev->has_edid);
> +       virtio_add_bool(m, "indirect", vgdev->has_indirect);
>         virtio_add_int(m, "cap sets", vgdev->num_capsets);
>         virtio_add_int(m, "scanouts", vgdev->num_scanouts);
>         return 0;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 2f5773e43557..c1086df49816 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -159,6 +159,9 @@ int virtio_gpu_init(struct drm_device *dev)
>         if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
>                 vgdev->has_edid = true;
>         }
> +       if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
> +               vgdev->has_indirect = true;
> +       }
>
>         DRM_INFO("features: %cvirgl %cedid\n",
>                  vgdev->has_virgl_3d ? '+' : '-',
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 41e475fbd67b..cc02fc4bab2a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -330,6 +330,9 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>         bool notify = false;
>         int ret;
>
> +       if (vgdev->has_indirect)
> +               elemcnt = 1;
> +
>  again:
>         spin_lock(&vgdev->ctrlq.qlock);
>
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
