Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F09D8D2
	for <lists.virtualization@lfdr.de>; Tue, 27 Aug 2019 00:06:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 81F9414B7;
	Mon, 26 Aug 2019 22:06:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0520114AF
	for <virtualization@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 22:06:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9C6F18A7
	for <virtualization@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 22:06:19 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id z3so41355578iog.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 15:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j2+X7ZLdUUxNkcBQNBfyLlM7Bq5bjsdY0IjjmtqCq8s=;
	b=lQSN7pQhTCM28br9rSgxowCmfZmsljVskLhGMUN8q9JRAPHK5tkMcdA4AhKA+ezKGf
	qcEEG70QEoiTsJhZkfOW57KexZaK/Np9tIm3WFU1t0QflRoTMSSWKK6EKoa/oeZECM9v
	fgpa1tg+tGUUhSa43lab1By1HWWM78GpZ1C8BjBzh9x6I0UTiFwAHzrUCuxuNCjvJSLn
	vn+AI5TRT8NmBBGBr8ySszqREymrYNaOgZp5QoY5dt7BZKnH361RVhA5ON3uoxJSEwV8
	Nb/+SsuAVFcRCdMd9bkdDoor3f5LDZapyZbl7ErJI+Gvy8Uqa29OSSHCZ3EjSRZ8QJdd
	q4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j2+X7ZLdUUxNkcBQNBfyLlM7Bq5bjsdY0IjjmtqCq8s=;
	b=X1eu9y3H/jmMjHWrmvEbZXPjugbGHrffoi3LuSi9QpEy9qYiQTzQ/3Qw5wJ3y6zp4Y
	I4DQ2eM1bh4Obr5dy5Uwv6N0hIo3XXgvkaLJAuoFfDWc6veT5HOyYXAX0vf4fCvznhSB
	sF7AmQCfI9a39SCe9zv22MNDJu5q7Kd73ygQEqtMYCRnclINqG94wGrIrh7Tgp3BCNUI
	W3QZYljIdZbAOprIdaHtsXWQ8ECgacEXPv9YbJSii2swgPFi6g/Vc5Jf0Xi1jIbGU9UJ
	joRu+tdexq2npo9aquN7tlhvDT976tVJNF8HdYhe6Iy37XfvyKjJXEjtspLJ6F8rBzJV
	qIGg==
X-Gm-Message-State: APjAAAVqlS0iXBkJNotgVMcBrxZFj/xJ7kjjYfYM4ndZcuXdu6+6qa3q
	ATrI4hAO/fnhaJbOAmXJNdVj4Jf0N9dNax+AATY=
X-Google-Smtp-Source: APXvYqwcYevweKqMNjHTJ83mj+kVwgsdYNMqCFj1IF88/5p1L/AzW1r6mX95/4ulDgCHTIUECfPGxzod9HEYB/twqAs=
X-Received: by 2002:a5e:df06:: with SMTP id f6mr16773354ioq.93.1566857178737; 
	Mon, 26 Aug 2019 15:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190822102614.18164-1-kraxel@redhat.com>
In-Reply-To: <20190822102614.18164-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 26 Aug 2019 15:06:07 -0700
Message-ID: <CAPaKu7Q+T1qf4jboXSV-jsXHrvqSxG+MrJGJzFf7qNisaZj3Wg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: make resource id workaround runtime
	switchable.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
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

On Thu, Aug 22, 2019 at 3:26 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Also update the comment with a reference to the virglrenderer fix.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 44 ++++++++++++++-----------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index b2da31310d24..e98aaa00578d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -27,34 +27,38 @@
>
>  #include "virtgpu_drv.h"
>
> +static int virtio_gpu_virglrenderer_workaround = 1;
> +module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
> +
>  static int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
>                                        uint32_t *resid)
>  {
> -#if 0
> -       int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
> -
> -       if (handle < 0)
> -               return handle;
> -#else
> -       static int handle;
> -
> -       /*
> -        * FIXME: dirty hack to avoid re-using IDs, virglrenderer
> -        * can't deal with that.  Needs fixing in virglrenderer, also
> -        * should figure a better way to handle that in the guest.
> -        */
> -       handle++;
> -#endif
> -
> -       *resid = handle + 1;
> +       if (virtio_gpu_virglrenderer_workaround) {
> +               /*
> +                * Hack to avoid re-using resource IDs.
> +                *
> +                * virglrenderer versions up to (and including) 0.7.0
> +                * can't deal with that.  virglrenderer commit
> +                * "f91a9dd35715 Fix unlinking resources from hash
> +                * table." (Feb 2019) fixes the bug.
> +                */
> +               static int handle;
> +               handle++;
> +               *resid = handle + 1;
> +       } else {
> +               int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
> +               if (handle < 0)
> +                       return handle;
> +               *resid = handle + 1;
> +       }
>         return 0;
>  }
>
>  static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t id)
>  {
> -#if 0
> -       ida_free(&vgdev->resource_ida, id - 1);
> -#endif
> +       if (!virtio_gpu_virglrenderer_workaround) {
> +               ida_free(&vgdev->resource_ida, id - 1);
> +       }
>  }
>
>  static void virtio_gpu_ttm_bo_destroy(struct ttm_buffer_object *tbo)
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
