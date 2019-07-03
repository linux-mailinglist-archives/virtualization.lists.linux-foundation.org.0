Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF75EB0B
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 20:02:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3A880C64;
	Wed,  3 Jul 2019 18:02:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 56486265
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 18:02:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BE782834
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 18:02:44 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m24so6964368ioo.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 11:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8lGD5x0fixG7eCvn8wfznKG3XFZqIHDTN6YyrwUc2rM=;
	b=iKihlh6l1s6aC19KE31uBgziYsN9WXu+n6WlT9ZjzAHZ4SVHuBCDBhXOhvNAUqbZLT
	pRP80Lx1QFP2fg+pVhGmPiywK1bO3kKIVCxpp3ZKimuVdwbgsVkYrVgbSmOaBdiq88fC
	RGWeOE8MZFeEK8+FVZQgxWtYLP3lJYZhamHU6FTY32RqlOKiS1bM5q2UBnihIw8c6Pjy
	jHXVACNS232kKnLp2EeKqun+mQ5GWmNbF4WDKIH8HmG3v3pn0KkFDvk1b14AJBK2MQxw
	PxbHNwmDw87GzLgazKKbKTol2ZUxNaSLS1C6NYyegJE6QRDjgTF3QwY1zDW0WCv5eRHS
	FGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8lGD5x0fixG7eCvn8wfznKG3XFZqIHDTN6YyrwUc2rM=;
	b=N7XLyltCUr4cGb2yIkgfOL3Gtr3s/eiKJxiLleurTyITcXjU4deieZ81nnrMn+tQHP
	h5CgP8nfgAEp9ThIdpSMoxKp5x7U94B7crvXotun+1klngR5GtqVI9g+0u9EbjC45Z5W
	pHK4odrrm6Sk38A0laW2mOPrvoBtKCndcIAvyCIEOgl+hrfo5S3G37TZY1a2aE8TsNEF
	BRyoZ5a8A2xuC8gAugBX5WIT4vXUxvTEIpf7xzn1UNEBmGZu6CQWxtbxCO+R4l/li2if
	rrJ51xSsysAlwy4j9Nw0s7zMNww8w0iCHKQpsIvzJu80q7lZY+KQhIEdkHfnNZT8GN+P
	RhtA==
X-Gm-Message-State: APjAAAVugAJxWmaaEflwKFaOtlMqBYVBoOx5FT3aZ0nMlrT3+nXe5+/b
	vYQztci2FxR1yj+01AcQ2gYyiRadkgbs1A2gh7g=
X-Google-Smtp-Source: APXvYqwtsJYFM4tLDw4ftXCfYIpH9Xg25kh7AlfCvOCOFJ7kerq8S60yd5DQ+VmMExC39g3dDiCVCaM4o7CoCuOlUPI=
X-Received: by 2002:a5d:97d8:: with SMTP id k24mr38048015ios.84.1562176964009; 
	Wed, 03 Jul 2019 11:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-7-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-7-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 3 Jul 2019 11:02:33 -0700
Message-ID: <CAPaKu7RfLoB=K__wQd92=S20Mt0uqsfyU9oigr8CQ-=gH6OUuA@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] drm/virtio: remove ttm calls from in
	virtio_gpu_object_{reserve, unreserve}
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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

On Tue, Jul 2, 2019 at 7:19 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Call reservation_object_* directly instead
> of using ttm_bo_{reserve,unreserve}.
>
> v4: check for EINTR only.
> v3: check for EINTR too.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 06cc0e961df6..07f6001ea91e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -402,9 +402,9 @@ static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
>  {
>         int r;
>
> -       r = ttm_bo_reserve(&bo->tbo, true, false, NULL);
> +       r = reservation_object_lock_interruptible(bo->gem_base.resv, NULL);
Can you elaborate a bit about how TTM keeps the BOs alive in, for
example, virtio_gpu_transfer_from_host_ioctl?  In that function, only
three TTM functions are called: ttm_bo_reserve, ttm_bo_validate, and
ttm_bo_unreserve.  I am curious how they keep the BO alive.

>         if (unlikely(r != 0)) {
> -               if (r != -ERESTARTSYS) {
> +               if (r != -EINTR) {
>                         struct virtio_gpu_device *qdev =
>                                 bo->gem_base.dev->dev_private;
>                         dev_err(qdev->dev, "%p reserve failed\n", bo);
> @@ -416,7 +416,7 @@ static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
>
>  static inline void virtio_gpu_object_unreserve(struct virtio_gpu_object *bo)
>  {
> -       ttm_bo_unreserve(&bo->tbo);
> +       reservation_object_unlock(bo->gem_base.resv);
>  }
>
>  /* virgl debufs */
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
