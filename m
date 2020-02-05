Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61415397A
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 21:20:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26FBE85E47;
	Wed,  5 Feb 2020 20:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z6IqVvlSe1eF; Wed,  5 Feb 2020 20:20:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB35C85DDB;
	Wed,  5 Feb 2020 20:20:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87BEFC0174;
	Wed,  5 Feb 2020 20:20:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B7C7C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 20:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 60CFB204E9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 20:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fx7PLQzKhBFt
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 20:20:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F8432043F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 20:20:24 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id f10so3010875ils.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 12:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JlLlxcQrpMkFUoU3hq5dL+E4UdUH5CDEd0YwvUejnVU=;
 b=oxenJqq82hLbOY7iPrO4DykFZo5N5e0MnyDP4aMCZ4rNnPVzW7PVckpP2qD7MWebBl
 Al2LFHbYZUmY6P3jBNPQTFTJATaNYQgghy5BquPjuhetKLPYg9SYNadMl/MB5nl7p4qg
 fP4YnhAj3q8n1AbMRpiGqJzn+4OeEEOrK6Re9bVBJ1d/IuaQkN3rb6jYEWcjVskRYLp5
 vWHG9YVnk4VtWVbENO1Fy3klZ4pRRQAwj+tfauQTnQrm5eYUVWtjg7IuVHH6cFLXArQ9
 PWBduhU9ZJSz1uDA/+UGLI7zagtMps7gLmNwuAHjyETzuhbO2L6Wzt2/DjinPhcQ6ge4
 Q1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JlLlxcQrpMkFUoU3hq5dL+E4UdUH5CDEd0YwvUejnVU=;
 b=VutpRy5FYsvR67bUOVq0AmIDG2vkG+wTZkIGbVEcWMWrNiHMGW07l6/10DbrGW8Pui
 guSEAWSJ8MAQta/uWHtrkJc8VWvvMykU5SQfwyFbOevX+ht6TXnMqPnk7IBohtXw7rgE
 1GP53f+rZaPyP6q9puuNFKPeglfwa+qr9Jqto/LwvBvc1Jh9+LGHlQ5BP/R3tJBHflJA
 nsya481xYED1cLXbfUA1d1/ETkf00BA70NJ5swtLZz09SXeXQxbe/PWy4uBpUuMtvWXR
 LOdqA/DQN86ZV0OiMvuYs5vkkMKwqzwCs+/8XmNtpNgZ+h8RdEYxOBoJxg6WR5lPvtI/
 6EHQ==
X-Gm-Message-State: APjAAAU0ePOAHzdr3IaBDuTB+KD4sb2+TX/G10S//B8PEietcY7gbgdj
 lm7D+idgtavFt+LuNBtzsMlW6tI6607HlZPgEaE=
X-Google-Smtp-Source: APXvYqxFqY4hqvCjpu5bLrtVB9HF9X+Oiknt2AoIL2F6QzIYDbfIIZTO59osj5M/WRh4O2BVdm/STxVTgQlIrA90kSA=
X-Received: by 2002:a92:9e97:: with SMTP id s23mr29405150ilk.139.1580934023820; 
 Wed, 05 Feb 2020 12:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20200205102552.21409-1-kraxel@redhat.com>
In-Reply-To: <20200205102552.21409-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 5 Feb 2020 12:20:12 -0800
Message-ID: <CAPaKu7SyqZU=ov4Atbedie6AGC52he0QQJZnGqr545mG-U7vvg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: ratelimit error logging
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

On Wed, Feb 5, 2020 at 2:26 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Avoid flooding the log in case we screw up badly.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 5914e79d3429..83f22933c3bb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -212,9 +212,9 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
>                         if (resp->type >= cpu_to_le32(VIRTIO_GPU_RESP_ERR_UNSPEC)) {
>                                 struct virtio_gpu_ctrl_hdr *cmd;
>                                 cmd = (struct virtio_gpu_ctrl_hdr *)entry->buf;
> -                               DRM_ERROR("response 0x%x (command 0x%x)\n",
> -                                         le32_to_cpu(resp->type),
> -                                         le32_to_cpu(cmd->type));
> +                               DRM_ERROR_RATELIMITED("response 0x%x (command 0x%x)\n",
> +                                                     le32_to_cpu(resp->type),
> +                                                     le32_to_cpu(cmd->type));
>                         } else
>                                 DRM_DEBUG("response 0x%x\n", le32_to_cpu(resp->type));
>                 }
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
