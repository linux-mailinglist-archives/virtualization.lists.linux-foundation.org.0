Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B146E392
	for <lists.virtualization@lfdr.de>; Thu,  9 Dec 2021 08:57:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A9B607C9;
	Thu,  9 Dec 2021 07:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-S26gGlq6Bv; Thu,  9 Dec 2021 07:57:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CCF6960777;
	Thu,  9 Dec 2021 07:57:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7BACC0071;
	Thu,  9 Dec 2021 07:57:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 793B7C0012
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 07:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66BC36076C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 07:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOq3hbOOZzyk
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 07:57:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AB0A60769
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 07:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639036662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OCchJqXlkcPKFU5BGgoX3zpc0zrMK5iqRL4iPWX0udg=;
 b=Puf2zSZwQpI/Ojmd0fz8hyuyeFwrs/zrW7MmlnwPc/U3OC/UYgml96DQuVwMGttrMcAfY2
 3sYPXZCsvCKBqbwfJC08AOhwGdynBWVvtu8MSmMgTSdFrJNuciEryRXQY2Dn7vTMR+AMGD
 RzU19tISXvpsD7PGMdreeO7gCHlJBxc=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-xFgAlmaGPA6zgdXQZRW1qA-1; Thu, 09 Dec 2021 02:57:41 -0500
X-MC-Unique: xFgAlmaGPA6zgdXQZRW1qA-1
Received: by mail-lf1-f72.google.com with SMTP id
 s11-20020a195e0b000000b0041c0a47fb77so2292165lfb.20
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Dec 2021 23:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCchJqXlkcPKFU5BGgoX3zpc0zrMK5iqRL4iPWX0udg=;
 b=vTW0RQyAONggRSzUutm1Ggh5lqejRXx+RlZws8EemeWy6WI0ksTJls2ID06L8XlYEi
 xcSrwY0dwatyUsfwTbXvFIB7CVC8GFXNOl3C/OgKJbZcHpQw++zi06Zl1ghk6YlroVHC
 PBH105Y6itKQhjupi8rcoT/IvDfq4/d7RVrFX1VTONMYON7nG/9gnRol2oa5pRyaGeko
 Lgn3FXyvkMOh8+25uACJH67h50Rfw29cS6F+w0Cdm0+2JdkSnWSVM3DMCZ4gfqLRFDle
 pG2BllXFhTUYoq44eo3TLp8rGjkXFVswPdaoR/uBmNdyQOrvYlbRc77zGGyqFHfFMANX
 SdHw==
X-Gm-Message-State: AOAM533//tL/l51wRrO7Xi2AQ3N2yMN+THZUg2jny8bRAO9NsKnKR7Xy
 L8O9BrNEIjngU36XOTdfJ1kZ8JpW5jHOII9LE14AzXObd4rS+d1EMgLxCOwb/Y6tsjxAmIfe08J
 6B3vC571lYj6I86mzuzSaI7OgbgKgid6NMnmb/DrnC1ubp2kydRWKI147pQ==
X-Received: by 2002:a2e:915a:: with SMTP id q26mr4464191ljg.277.1639036659850; 
 Wed, 08 Dec 2021 23:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlrR2u2AzX8ydVKKQ6AlXap6y6RZ+sD0Jjw3+YUukSsKKUjBU09U/YBMhNgB1VKj/LJTNTrklmuM7IzfjUSkY=
X-Received: by 2002:a2e:915a:: with SMTP id q26mr4464165ljg.277.1639036659555; 
 Wed, 08 Dec 2021 23:57:39 -0800 (PST)
MIME-Version: 1.0
References: <20211126044102.18374-1-jasowang@redhat.com>
 <20211208151801-mutt-send-email-mst@kernel.org>
 <CACGkMEs-ah8VAULcDumPH_u9C2DZQh9SKJ_2bykX5aBCTxnwsA@mail.gmail.com>
 <20211209015205-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211209015205-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Dec 2021 15:57:28 +0800
Message-ID: <CACGkMEu89hnGKgQBSuwCA1FPkwpFyXX-MTsuHwUu3vEP2p-EVw@mail.gmail.com>
Subject: Re: [PATCH V2] virtio-mmio: harden interrupt
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>
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

On Thu, Dec 9, 2021 at 2:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Dec 09, 2021 at 10:06:34AM +0800, Jason Wang wrote:
> > On Thu, Dec 9, 2021 at 4:27 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Fri, Nov 26, 2021 at 12:41:02PM +0800, Jason Wang wrote:
> > > > This patch tries to make sure the virtio interrupt handler for MMIO
> > > > won't be called after a reset and before virtio_device_ready(). We
> > > > can't use IRQF_NO_AUTOEN since we're using shared interrupt
> > > > (IRQF_SHARED). So this patch tracks the interrupt enabling status in a
> > > > new intr_soft_enabled variable and toggle it during in
> > > > vm_disable/enable_interrupts(). The MMIO interrupt handler will check
> > > > intr_soft_enabled before processing the actual interrupt.
> > > >
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > ---
> > > > Changes since V1:
> > > > - Silent compling warnings
> > > >  drivers/virtio/virtio_mmio.c | 37 ++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 37 insertions(+)
> > > >
> > > > diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> > > > index 56128b9c46eb..c517afdd2cc5 100644
> > > > --- a/drivers/virtio/virtio_mmio.c
> > > > +++ b/drivers/virtio/virtio_mmio.c
> > > > @@ -90,6 +90,7 @@ struct virtio_mmio_device {
> > > >       /* a list of queues so we can dispatch IRQs */
> > > >       spinlock_t lock;
> > > >       struct list_head virtqueues;
> > > > +     bool intr_soft_enabled;
> > > >  };
> > > >
> > > >  struct virtio_mmio_vq_info {
> > > > @@ -100,7 +101,37 @@ struct virtio_mmio_vq_info {
> > > >       struct list_head node;
> > > >  };
> > > >
> > > > +/* disable irq handlers */
> > > > +static void vm_disable_cbs(struct virtio_device *vdev)
> > > > +{
> > > > +     struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
> > > > +     int irq = platform_get_irq(vm_dev->pdev, 0);
> > > >
> > > > +     /*
> > > > +      * The below synchronize() guarantees that any
> > > > +      * interrupt for this line arriving after
> > > > +      * synchronize_irq() has completed is guaranteed to see
> > > > +      * intx_soft_enabled == false.
> > > > +      */
> > > > +     WRITE_ONCE(vm_dev->intr_soft_enabled, false);
> > > > +     synchronize_irq(irq);
> > > > +}
> > > > +
> > > > +/* enable irq handlers */
> > > > +static void vm_enable_cbs(struct virtio_device *vdev)
> > > > +{
> > > > +     struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
> > > > +     int irq = platform_get_irq(vm_dev->pdev, 0);
> > > > +
> > > > +     disable_irq(irq);
> > > > +     /*
> > > > +      * The above disable_irq() provides TSO ordering and
> > > > +      * as such promotes the below store to store-release.
> > > > +      */
> > > > +     WRITE_ONCE(vm_dev->intr_soft_enabled, true);
> > > > +     enable_irq(irq);
> > > > +     return;
> > > > +}
> > > >
> > > >  /* Configuration interface */
> > > >
> > > > @@ -262,6 +293,8 @@ static void vm_reset(struct virtio_device *vdev)
> > > >
> > > >       /* 0 status means a reset. */
> > > >       writel(0, vm_dev->base + VIRTIO_MMIO_STATUS);
> > >
> > > There was a discussion about reading status to make sure it is clear.
> > > The spec says we should, this can't hurt as a further hardening measure.
> > > In fact, let's do it in the core maybe? Spec says it applies to all
> > > devices ...
> >
> > We can do that, but I'm not sure if we break some existing device.
>
> Hmm. Have anything specific in mind?

No, I can send a patch to do that.

>
> > >
> > > > +     /* Disable VQ/configuration callbacks. */
> > > > +     vm_disable_cbs(vdev);
> > > >  }
> > > >
> > > >
> > > > @@ -288,6 +321,9 @@ static irqreturn_t vm_interrupt(int irq, void *opaque)
> > > >       unsigned long flags;
> > > >       irqreturn_t ret = IRQ_NONE;
> > > >
> > > > +     if (!READ_ONCE(vm_dev->intr_soft_enabled))
> > > > +             return IRQ_NONE;
> > > > +
> > >
> > > So if the write is seen before reset happened (should not happen, but we
> > > are talking a buggy device) then it won't be acknowledged and device
> > > will keep pulling the interrupt. I think as long as we are hardening
> > > this, let's go the full mile and try to avoid DoS if we can, do the
> > > check before invoking the callback, but do not skip the read.
> > > Whether to still return IRQ_NONE is a good question.
> >
> > Did you mean something like this:
> >
> >         /* Read and acknowledge interrupts */
> >         status = readl(vm_dev->base + VIRTIO_MMIO_INTERRUPT_STATUS);
> >         writel(status, vm_dev->base + VIRTIO_MMIO_INTERRUPT_ACK);
> >
> >         if (status)
> >                 ret = IRQ_HANDLED;
> >
> >        if (!READ_ONCE(vm_dev->intr_soft_enabled))
> >                return ret;
> >
> > Thanks
>
> Maybe. Or is
>
>         if (!READ_ONCE(vm_dev->intr_soft_enabled))
>                 return IRQ_NONE;
>
> better here?

Yes, I just paste part of the code, the ret is initialized to IRQ_NONE.

Thanks

>
>
> > >
> > >
> > >
> > >
> > > >       /* Read and acknowledge interrupts */
> > > >       status = readl(vm_dev->base + VIRTIO_MMIO_INTERRUPT_STATUS);
> > > >       writel(status, vm_dev->base + VIRTIO_MMIO_INTERRUPT_ACK);
> > > > @@ -529,6 +565,7 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
> > > >  }
> > > >
> > > >  static const struct virtio_config_ops virtio_mmio_config_ops = {
> > > > +     .enable_cbs     = vm_enable_cbs,
> > > >       .get            = vm_get,
> > > >       .set            = vm_set,
> > > >       .generation     = vm_generation,
> > > > --
> > > > 2.25.1
> > >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
