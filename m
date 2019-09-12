Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525EB1601
	for <lists.virtualization@lfdr.de>; Thu, 12 Sep 2019 23:46:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CA72BE28;
	Thu, 12 Sep 2019 21:46:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 32D5DE04
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 21:46:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CC03E6D6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 21:46:39 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k13so43267909ioj.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NiZR+n54kDStyi7gn0TCODjC223CXySNQ4QzYgLQl3E=;
	b=Au3S9WcEiw57y0AQRAbf5wuFCqoJIe+2VdZsVE2e6s0BHIIrx52K8kYnnAq0xDT++b
	v6LLSRBThw+1+gBkPcOsZ7X/tXgQkVNqloLOuoS/iG8Apn+JURt/X7lsT7ViS6a6kYwa
	KkUTSZvehBh9c+dFRz0QcX/OZRDVgwkPGwM/MkpXEjGBIyRuQw4iBQVdXXJVnUqkMNto
	42z1NOEIfhoPm5DyAtr/8kU0T1wE0NfTUZGtMVQrtF0gzxsja0j30OWxvu2BpP89jpDJ
	Jh+1PcmSRNYP1sWMCnhLRnypbEPhggXBpW0nH8G1CaEbXJ+OkS0abuEs2iUbUfR1j9YS
	vg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NiZR+n54kDStyi7gn0TCODjC223CXySNQ4QzYgLQl3E=;
	b=kKtFV1Y3bGbBQQ/41zopZAHdD3FoOCQoxmf5QGGJ6OfBvK0dxQH+/w1o1zKE+XjAJE
	7VzMpx9c4G/Mq/4kxqMvP63FgpN+8qPo5PvfZEiGqJKr3zJBR3VodDpHwwslUow4sLl2
	cUm1HcEBrluyBmbCmcqQY8jUpZcKeSVu5+TYrzNyN1EskdAPZv9O3zIC4GPslxOs3OMe
	BdiP4apFz6nrE8y8dn77FIjPSLPhDxGgICTZXh3fGPvCnti/lHBz6ptRBpA7Gp4A4rSm
	l13mXZqK7Qg63XCSHtqCGXbOyxU8si0JuT3SpXko55ZDvaMr/3VEvHnT4u59z4zcdWnV
	Mprg==
X-Gm-Message-State: APjAAAXdSiOeCPc5Gmpp/v8KgKzfYAv9JstiRkCHkgrNeO7MRkkWqJU5
	gP6Wi4CcrDiPYw7RkP2LZSYEdgJhXGOVQcL7Vzk=
X-Google-Smtp-Source: APXvYqwqasiwTqwYl+8S+TBPDrRVZlt18xiMscbny/PfY5KKeZ1UqdHopMngv1Rw1ZsObWSeAn5PZ/2D1YWLRXpqDr4=
X-Received: by 2002:a5e:c107:: with SMTP id v7mr7363007iol.200.1568324799015; 
	Thu, 12 Sep 2019 14:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190912160048.212495-1-davidriley@chromium.org>
In-Reply-To: <20190912160048.212495-1-davidriley@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 12 Sep 2019 14:46:28 -0700
Message-ID: <CAPaKu7RcJC-rZiYhqGeLeyu45ML6ymiycmWA+RjOq02u=PsK9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Fix warning in
	virtio_gpu_queue_fenced_ctrl_buffer.
To: David Riley <davidriley@chromium.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
	NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
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

On Thu, Sep 12, 2019 at 9:00 AM David Riley <davidriley@chromium.org> wrote:
>
> Fix warning introduced with commit e1218b8c0cc1
> ("drm/virtio: Use vmalloc for command buffer allocations.")
> from drm-misc-next.
>
> Signed-off-by: David Riley <davidriley@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 9f9b782dd332..80176f379ad5 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -358,7 +358,7 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
>                         sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
>                                              &outcnt);
>                         if (!sgt)
> -                               return -ENOMEM;
> +                               return;
>                         vout = sgt->sgl;
>                 } else {
>                         sg_init_one(&sg, vbuf->data_buf, vbuf->data_size);
> --
> 2.23.0.162.g0b9fbb3734-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
