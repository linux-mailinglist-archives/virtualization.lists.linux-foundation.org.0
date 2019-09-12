Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F0B1606
	for <lists.virtualization@lfdr.de>; Thu, 12 Sep 2019 23:48:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 25530E24;
	Thu, 12 Sep 2019 21:48:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F68CE04
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 21:47:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3A1076D6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 21:47:59 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f12so58406529iog.12
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Nsh9wMtR+piWKMVssRxEW2CCDveInH3zQuunz33C6pw=;
	b=HvE2JMW9DzbOnl+GJq4DI6qFxnw9TBb1eNu3XAJmXzaj7H21B/fTsn/qhRSoMS6r0Y
	jqt72xjKycAC7WPfc0t8jkHr3Pky0s11I8NjLHyrolMES9x+IWJsc7wYD2hG/9Fes2Ik
	nGxgHcJfhQISv8I2FcUw/ng61z1YORiGfiVeASwoda5a4J8R39JWJdAfEasQhs2ItKW2
	6ynBtqYv3FAA1LDnwigBmH9w4Hb+X8d1qIG1FA+MiZAQQ6DAgKekp9P5XVlaB2BCBRM9
	E80xav8My8RbT71tBoGsurjYpBALHN/v+wfEkBrRyqL82xOzLAxYFiPDUdsY1QX+WZnB
	JZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Nsh9wMtR+piWKMVssRxEW2CCDveInH3zQuunz33C6pw=;
	b=J6iDp96VY7DzxVZCDKk2Bszee0E0l3kpSvRTZkmMQt5sa8leZ3m7gtb5jojrkj5rOd
	yq80I0cqXzXN+Se2Fg8za6AxZVroXAbme6Z9EXA+F+trOZSlV+VCqIRCo4ra/mCdhWYj
	x8nm7Z0UnQYA8dyqA82OzktIRcM+KEPpslts/WyHki1ehULnhfkT9z+Dpltl/NHAw1h/
	J8x3q4IpEQ+eUaAL0Tcz9PM6oFYW6iIdGrp3oSAzmYTDXPUbr2+FBY8XI4O6mknxhJVc
	VjNwT803FjBS094qwLGUab9rrnd7SZ/4AcEFUGu0Ts5/N6HbX+lTh5hRb+Gc62mlOrhg
	+y9w==
X-Gm-Message-State: APjAAAVji6QLrBhlxkIuV2tLDm9Y2lION8VumLIP79xqhMOCl2n8YwYu
	/WuDdYhKb7ZjFTtr8OdD8QeLndJlGNjq5kjt3RHf0plm
X-Google-Smtp-Source: APXvYqzNx4+RAMwUP0AmKza386+UJ1O8aCkriLtdGYKB0a3YLsBG+HWOAjyS4JOKf/XHHXzSp5FmG2p5vw1yFzQk8as=
X-Received: by 2002:a6b:db0e:: with SMTP id t14mr7016055ioc.93.1568324878498; 
	Thu, 12 Sep 2019 14:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190912114627.20176-1-kraxel@redhat.com>
In-Reply-To: <20190912114627.20176-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 12 Sep 2019 14:47:47 -0700
Message-ID: <CAPaKu7T_TrCUEyjthshTjr_=uDQs+iJuPV68QYmmDJ7vodR35Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: enable prime mmap support
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

On Thu, Sep 12, 2019 at 4:46 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 0c9553ea9f3f..96c240dbf452 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -200,6 +200,7 @@ static struct drm_driver driver = {
>  #endif
>         .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> +       .gem_prime_mmap = drm_gem_prime_mmap,
>         .gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
>
>         .gem_create_object = virtio_gpu_create_object,
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
