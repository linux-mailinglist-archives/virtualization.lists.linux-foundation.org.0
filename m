Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2545746E2CD
	for <lists.virtualization@lfdr.de>; Thu,  9 Dec 2021 07:56:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FE4E402B0;
	Thu,  9 Dec 2021 06:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0X75YN0YF71G; Thu,  9 Dec 2021 06:56:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B1E554012A;
	Thu,  9 Dec 2021 06:56:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A6EEC0012;
	Thu,  9 Dec 2021 06:56:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF340C0012
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 06:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE5CE60769
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 06:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYb4zT1PD2ES
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 06:55:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0582C6074A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 06:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639032957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/fb62qxVVfvgceW+7mro5MbYtbA/njW6uOUzofuzKQ0=;
 b=UxFqxRvhXqyOcAKDfeSZkzHInE3CqoJixcBoQvKLX0BH9MzwYwSJ/DQkxvEoEK/OWH0qGn
 KAWfxAiwCCg5BKxZLZ1WZwEBrSTKY8aMHXmYUyA5yWrbuPO959l2XmDG0WX4tiVp5nb0ej
 SHCh01oe2Z/86Y/9ydX6V2v9wIVQX1o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-6TPGVHlqNfmabqHFhyynmg-1; Thu, 09 Dec 2021 01:55:55 -0500
X-MC-Unique: 6TPGVHlqNfmabqHFhyynmg-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so2056528wmb.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Dec 2021 22:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/fb62qxVVfvgceW+7mro5MbYtbA/njW6uOUzofuzKQ0=;
 b=4M13yCEhMPfqXUMc8sOnE94xbf91Uiks9lOH1+ul2v+TGFSHf/8pMkywZwk+LHW2Ln
 TmMrf7H2V2Nmv8lvGbhDIQLxQ6iMsZuAudExQtWlVr5f3U3E6VhohGxuZ2w/cliTvoMN
 7rc6le/oDHxmVWiAwsQaVnqd4tpMAaDH9vLagAWEsQ8x+omn0H3qMiFr0t/XaritgB+t
 1heSORkBoUg6BSYCmy/kwlZJ1JophzChBKcbpBXei68qyBTHlSTz0PTw1v40wzaYCHAP
 g356jPfrWTy1dsHxrBqV+W4DdcGHkZC1Q6vLFmL+nwvsUpPdjq+bndMTiattBfUDfDxg
 BtWQ==
X-Gm-Message-State: AOAM530g3e27OT81zSMoBpBe3W5kpHsUI7rXjHGIiVsrdu5FAooQfYjT
 E2gJV3lcQ63nm/Tj6UZoT3LpTzw3FfUGZfIaDpfwKzU2XjB6OEbxJc46v8RQI5Bqm2I+sQVHis9
 sAdLxJ4BvRTOZ47U3TsS4Y75w1+4UcSA/p9tVyf5hnQ==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr4835613wmj.30.1639032954445; 
 Wed, 08 Dec 2021 22:55:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFjgkHORRhDzdGFhtR2vh0mcJ117Rtzn0FOi+3LPmzp4mLAvIEY2WhtWYopTY+U6sr6lywbQ==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr4835591wmj.30.1639032954203; 
 Wed, 08 Dec 2021 22:55:54 -0800 (PST)
Received: from redhat.com ([2.55.18.120])
 by smtp.gmail.com with ESMTPSA id l26sm4927855wms.15.2021.12.08.22.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 22:55:53 -0800 (PST)
Date: Thu, 9 Dec 2021 01:55:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] virtio-mmio: harden interrupt
Message-ID: <20211209015205-mutt-send-email-mst@kernel.org>
References: <20211126044102.18374-1-jasowang@redhat.com>
 <20211208151801-mutt-send-email-mst@kernel.org>
 <CACGkMEs-ah8VAULcDumPH_u9C2DZQh9SKJ_2bykX5aBCTxnwsA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEs-ah8VAULcDumPH_u9C2DZQh9SKJ_2bykX5aBCTxnwsA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Thu, Dec 09, 2021 at 10:06:34AM +0800, Jason Wang wrote:
> On Thu, Dec 9, 2021 at 4:27 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Nov 26, 2021 at 12:41:02PM +0800, Jason Wang wrote:
> > > This patch tries to make sure the virtio interrupt handler for MMIO
> > > won't be called after a reset and before virtio_device_ready(). We
> > > can't use IRQF_NO_AUTOEN since we're using shared interrupt
> > > (IRQF_SHARED). So this patch tracks the interrupt enabling status in a
> > > new intr_soft_enabled variable and toggle it during in
> > > vm_disable/enable_interrupts(). The MMIO interrupt handler will check
> > > intr_soft_enabled before processing the actual interrupt.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > > Changes since V1:
> > > - Silent compling warnings
> > >  drivers/virtio/virtio_mmio.c | 37 ++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >
> > > diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> > > index 56128b9c46eb..c517afdd2cc5 100644
> > > --- a/drivers/virtio/virtio_mmio.c
> > > +++ b/drivers/virtio/virtio_mmio.c
> > > @@ -90,6 +90,7 @@ struct virtio_mmio_device {
> > >       /* a list of queues so we can dispatch IRQs */
> > >       spinlock_t lock;
> > >       struct list_head virtqueues;
> > > +     bool intr_soft_enabled;
> > >  };
> > >
> > >  struct virtio_mmio_vq_info {
> > > @@ -100,7 +101,37 @@ struct virtio_mmio_vq_info {
> > >       struct list_head node;
> > >  };
> > >
> > > +/* disable irq handlers */
> > > +static void vm_disable_cbs(struct virtio_device *vdev)
> > > +{
> > > +     struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
> > > +     int irq = platform_get_irq(vm_dev->pdev, 0);
> > >
> > > +     /*
> > > +      * The below synchronize() guarantees that any
> > > +      * interrupt for this line arriving after
> > > +      * synchronize_irq() has completed is guaranteed to see
> > > +      * intx_soft_enabled == false.
> > > +      */
> > > +     WRITE_ONCE(vm_dev->intr_soft_enabled, false);
> > > +     synchronize_irq(irq);
> > > +}
> > > +
> > > +/* enable irq handlers */
> > > +static void vm_enable_cbs(struct virtio_device *vdev)
> > > +{
> > > +     struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
> > > +     int irq = platform_get_irq(vm_dev->pdev, 0);
> > > +
> > > +     disable_irq(irq);
> > > +     /*
> > > +      * The above disable_irq() provides TSO ordering and
> > > +      * as such promotes the below store to store-release.
> > > +      */
> > > +     WRITE_ONCE(vm_dev->intr_soft_enabled, true);
> > > +     enable_irq(irq);
> > > +     return;
> > > +}
> > >
> > >  /* Configuration interface */
> > >
> > > @@ -262,6 +293,8 @@ static void vm_reset(struct virtio_device *vdev)
> > >
> > >       /* 0 status means a reset. */
> > >       writel(0, vm_dev->base + VIRTIO_MMIO_STATUS);
> >
> > There was a discussion about reading status to make sure it is clear.
> > The spec says we should, this can't hurt as a further hardening measure.
> > In fact, let's do it in the core maybe? Spec says it applies to all
> > devices ...
> 
> We can do that, but I'm not sure if we break some existing device.

Hmm. Have anything specific in mind?

> >
> > > +     /* Disable VQ/configuration callbacks. */
> > > +     vm_disable_cbs(vdev);
> > >  }
> > >
> > >
> > > @@ -288,6 +321,9 @@ static irqreturn_t vm_interrupt(int irq, void *opaque)
> > >       unsigned long flags;
> > >       irqreturn_t ret = IRQ_NONE;
> > >
> > > +     if (!READ_ONCE(vm_dev->intr_soft_enabled))
> > > +             return IRQ_NONE;
> > > +
> >
> > So if the write is seen before reset happened (should not happen, but we
> > are talking a buggy device) then it won't be acknowledged and device
> > will keep pulling the interrupt. I think as long as we are hardening
> > this, let's go the full mile and try to avoid DoS if we can, do the
> > check before invoking the callback, but do not skip the read.
> > Whether to still return IRQ_NONE is a good question.
> 
> Did you mean something like this:
> 
>         /* Read and acknowledge interrupts */
>         status = readl(vm_dev->base + VIRTIO_MMIO_INTERRUPT_STATUS);
>         writel(status, vm_dev->base + VIRTIO_MMIO_INTERRUPT_ACK);
> 
>         if (status)
>                 ret = IRQ_HANDLED;
> 
>        if (!READ_ONCE(vm_dev->intr_soft_enabled))
>                return ret;
> 
> Thanks

Maybe. Or is

        if (!READ_ONCE(vm_dev->intr_soft_enabled))
                return IRQ_NONE;

better here?


> >
> >
> >
> >
> > >       /* Read and acknowledge interrupts */
> > >       status = readl(vm_dev->base + VIRTIO_MMIO_INTERRUPT_STATUS);
> > >       writel(status, vm_dev->base + VIRTIO_MMIO_INTERRUPT_ACK);
> > > @@ -529,6 +565,7 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
> > >  }
> > >
> > >  static const struct virtio_config_ops virtio_mmio_config_ops = {
> > > +     .enable_cbs     = vm_enable_cbs,
> > >       .get            = vm_get,
> > >       .set            = vm_set,
> > >       .generation     = vm_generation,
> > > --
> > > 2.25.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
