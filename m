Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F07A96D8
	for <lists.virtualization@lfdr.de>; Thu,  5 Sep 2019 01:11:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F25222CF;
	Wed,  4 Sep 2019 23:11:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D21D022C1
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 23:10:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2B14D831
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 23:10:42 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s21so394817ioa.1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 04 Sep 2019 16:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DB1rbzm8PF8Bwfs8Jp/tKsNhJPofsXR23GDzMzgP/Zo=;
	b=TWXBSs+rssh2KOR8Br4xQVWj2yPdts1caiQ8YeGZCkLygQUi3QXTp7bXtG8avLPfoY
	FU0qWwBUSFqJQ11YlGcYAyCc1LuOHBkMXnenhqK6bcrkpT40+xQVdSKLzHma7+CFHsNH
	DZE2H4wNyGmxrNjxgvrV/PEFzx79oncEEh/D3bItyY1amR4GCh4qqWlRADRT5zCrS1xz
	v9RL7oWNP1ZGT3CoxK7EoA/Xh83edIeMEIwa2Q5LX2O+a5xbwE8I0aEm9ioQHvqkHV6F
	cx90+SxExNmT98lEpdrmmEC1UE3oSt/btorqGtDplYJGoFnrKoF6bjyDNR9WrI8DSxLl
	l/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DB1rbzm8PF8Bwfs8Jp/tKsNhJPofsXR23GDzMzgP/Zo=;
	b=BCroEt01qGZUVNtSresgghf35rV52U+j6rXF+RHWOngRslk8eF/yG685AbGQ4hcrxw
	1ceK/e0vLToCGzgiF0ao6hDJKDHBkKIVNqyaadD9c0J6VlN/0JPsXR6R8nXMadMKw+Ga
	+3+99CjYfQMPupoE52kaEUzOMErtJQ242P9h77Haer7VZFwXZ4DiWfTViaaYhapkx2Ln
	yNn6vnF+zqdgUds4C9PSE9d0YiPGUK/CdjVJGyGk7QYPdKJhjhWMdA2/9AE6dSxXNdtg
	Vp9v72BDVTfc9LAhh2/jUulsOEuMAw46+3oXmASgYE3u49pAG3uXrlxoRV8AfR4lKPjc
	uU3g==
X-Gm-Message-State: APjAAAUtTMg6xxiEKbqZEGy9vmW96CTBzYmOGtN7pLv7zQJ/abtT7DgI
	O9/WHuiqW1m0NutoiNfXNe40njIALNXQ3lMQrXw=
X-Google-Smtp-Source: APXvYqy0jYg/Z8XA/MeoEAwnqZjsjs0eFej+KYg1PPMJWO6JB9B1AVaOVDMkjRWEP7D3sv6xexnbd1n0FFsKarY4fh4=
X-Received: by 2002:a6b:db0e:: with SMTP id t14mr546846ioc.93.1567638641383;
	Wed, 04 Sep 2019 16:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190904074828.32502-1-kraxel@redhat.com>
In-Reply-To: <20190904074828.32502-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 4 Sep 2019 16:10:30 -0700
Message-ID: <CAPaKu7RWiEr5n_DWcg0H2PPnRs9CUn-ZgQV3NYe8VrdZgEAhTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix command submission with objects but
	without fence.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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

On Wed, Sep 4, 2019 at 12:48 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Only call virtio_gpu_array_add_fence if we actually have a fence.
>
> Fixes: da758d51968a ("drm/virtio: rework virtio_gpu_execbuffer_ioctl fencing")
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 595fa6ec2d58..7fd2851f7b97 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -339,11 +339,12 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
>                 goto again;
>         }
>
> -       if (fence)
> +       if (fence) {
>                 virtio_gpu_fence_emit(vgdev, hdr, fence);
> -       if (vbuf->objs) {
> -               virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
> -               virtio_gpu_array_unlock_resv(vbuf->objs);
> +               if (vbuf->objs) {
> +                       virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
> +                       virtio_gpu_array_unlock_resv(vbuf->objs);
> +               }
This leaks when fence == NULL and vbuf->objs != NULL (which can really
happen IIRC... not at my desk to check).


>         }
>         notify = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
>         spin_unlock(&vgdev->ctrlq.qlock);
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
