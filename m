Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B00204084DD
	for <lists.virtualization@lfdr.de>; Mon, 13 Sep 2021 08:41:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55E05402C3;
	Mon, 13 Sep 2021 06:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMKeZN_0ppVc; Mon, 13 Sep 2021 06:41:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 99E56402BA;
	Mon, 13 Sep 2021 06:41:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2953FC000D;
	Mon, 13 Sep 2021 06:41:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01792C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D77BB81815
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KP5o8YhFNxOV
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:41:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20B9081770
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631515301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A7ak6bO3ZbDQcmYe8pOAt6ZN28nqsiJpqhbYVS/xAd8=;
 b=Bi/FrQ+oSW56U5+7pve/eXIb/NYx8LSX+aUvrpNS/lSzRZ0eT0xC8N6Hj+gUHCKqhjI73H
 M1r9lKWyVlsl2k3k/Dl7nkAqFQBGVylXhxHOZ+YF3G2qAHAfnRDHY3IAz6pDz4s3fi/WRb
 7Acyzlt+0z1VFjqfQPRzvPy6IuO+J6c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-vyTyGu8VMeGDeejibdlcoQ-1; Mon, 13 Sep 2021 02:41:39 -0400
X-MC-Unique: vyTyGu8VMeGDeejibdlcoQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 a27-20020a5d457b000000b0015b11fccc5eso2291734wrc.10
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Sep 2021 23:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A7ak6bO3ZbDQcmYe8pOAt6ZN28nqsiJpqhbYVS/xAd8=;
 b=sTgsGhwL/DOtYNYPWp2eZc5HxaJvkhmZLOYXhRZNnF5BAM3FwhfySG2AUF+W9wX70r
 MY/e+b03d4CUuSRkRJNZNaHtj/BHXkVb8dSFVLqlMbKObDTnjLHWEW6O6pwZz2bOQMoU
 BVfgW+Iaei6beLaCX4nVrgT0/oM08xQdbv/Y1UQx0qxo61yyn+WXvDvsU2Qzz99gZBrX
 MR5JkiKvJMhdR4Blx9PLmr7H1fbl270Z5LT8G8o9as5qCC4g39drXUKlI0eiPYTKjPym
 2zHbXqFJsfJAkNpz3f0zOFM3nU4QsSZLhMeq5+NhpDTnJn5Bfn6Zx8/sxQFEwMo3RK8H
 oMkw==
X-Gm-Message-State: AOAM532xIayt5eahJXBdc2UjH7P/E6zVvJ2m7sKmagfJtY9aIYBYSrQV
 aLcp86bpYJznMYFzJfp69FnFnj5LKqcfS6MGYPy5KQJmXYpLlYoaRxYCfPRi6t/ZP+9sqN7Zw2S
 cHjjN9blpXtD5CbKP/ETXioFoGGDvKAJvdRUUoif3kw==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr10577226wrj.270.1631515298310; 
 Sun, 12 Sep 2021 23:41:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsD+bT8UWlKmgvA78K+/pI1lMXq4Gz36uYronKSczbZYhYO104bBjXmMrJqzweRJ9POQwkcg==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr10577212wrj.270.1631515298130; 
 Sun, 12 Sep 2021 23:41:38 -0700 (PDT)
Received: from redhat.com ([2.55.27.174])
 by smtp.gmail.com with ESMTPSA id z7sm8061280wre.72.2021.09.12.23.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 23:41:37 -0700 (PDT)
Date: Mon, 13 Sep 2021 02:41:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 7/9] virtio-pci: harden INTX interrupts
Message-ID: <20210913023757-mutt-send-email-mst@kernel.org>
References: <20210913055353.35219-1-jasowang@redhat.com>
 <20210913055353.35219-8-jasowang@redhat.com>
 <20210913022824-mutt-send-email-mst@kernel.org>
 <CACGkMEtnmLzQDNVYnAYSsEmjjRJVDhuK6VNj56S__zU9+5-JQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtnmLzQDNVYnAYSsEmjjRJVDhuK6VNj56S__zU9+5-JQQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Hetzelt,
 Felicitas" <f.hetzelt@tu-berlin.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, "kaplan,
 david" <david.kaplan@amd.com>,
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

On Mon, Sep 13, 2021 at 02:36:54PM +0800, Jason Wang wrote:
> On Mon, Sep 13, 2021 at 2:33 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Sep 13, 2021 at 01:53:51PM +0800, Jason Wang wrote:
> > > This patch tries to make sure the virtio interrupt handler for INTX
> > > won't be called after a reset and before virtio_device_ready(). We
> > > can't use IRQF_NO_AUTOEN since we're using shared interrupt
> > > (IRQF_SHARED). So this patch tracks the INTX enabling status in a new
> > > intx_soft_enabled variable and toggle it during in
> > > vp_disable/enable_vectors(). The INTX interrupt handler will check
> > > intx_soft_enabled before processing the actual interrupt.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> >
> >
> > Not all that excited about all the memory barriers for something
> > that should be an extremely rare event (for most kernels -
> > literally once per boot). Can't we do better?
> 
> I'm not sure, but do we need to care about the slow path (INTX)?

Otherwise we won't try to support this, right?

> (Or do you have a better approach?)
> 
> Thanks

Don't know really, maybe rcu or whatever?
But let's try to be much more specific - is there anything
specific we are trying to protect against here?



> >
> > > ---
> > >  drivers/virtio/virtio_pci_common.c | 18 ++++++++++++++++--
> > >  drivers/virtio/virtio_pci_common.h |  1 +
> > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> > > index 0b9523e6dd39..835197151dc1 100644
> > > --- a/drivers/virtio/virtio_pci_common.c
> > > +++ b/drivers/virtio/virtio_pci_common.c
> > > @@ -30,8 +30,12 @@ void vp_disable_vectors(struct virtio_device *vdev)
> > >       struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > >       int i;
> > >
> > > -     if (vp_dev->intx_enabled)
> > > +     if (vp_dev->intx_enabled) {
> > > +             vp_dev->intx_soft_enabled = false;
> > > +             /* ensure the vp_interrupt see this intx_soft_enabled value */
> > > +             smp_wmb();
> > >               synchronize_irq(vp_dev->pci_dev->irq);
> > > +     }
> > >
> > >       for (i = 0; i < vp_dev->msix_vectors; ++i)
> > >               disable_irq(pci_irq_vector(vp_dev->pci_dev, i));
> > > @@ -43,8 +47,12 @@ void vp_enable_vectors(struct virtio_device *vdev)
> > >       struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > >       int i;
> > >
> > > -     if (vp_dev->intx_enabled)
> > > +     if (vp_dev->intx_enabled) {
> > > +             vp_dev->intx_soft_enabled = true;
> > > +             /* ensure the vp_interrupt see this intx_soft_enabled value */
> > > +             smp_wmb();
> > >               return;
> > > +     }
> > >
> > >       for (i = 0; i < vp_dev->msix_vectors; ++i)
> > >               enable_irq(pci_irq_vector(vp_dev->pci_dev, i));
> > > @@ -97,6 +105,12 @@ static irqreturn_t vp_interrupt(int irq, void *opaque)
> > >       struct virtio_pci_device *vp_dev = opaque;
> > >       u8 isr;
> > >
> > > +     if (!vp_dev->intx_soft_enabled)
> > > +             return IRQ_NONE;
> > > +
> > > +     /* read intx_soft_enabled before read others */
> > > +     smp_rmb();
> > > +
> > >       /* reading the ISR has the effect of also clearing it so it's very
> > >        * important to save off the value. */
> > >       isr = ioread8(vp_dev->isr);
> > > diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
> > > index a235ce9ff6a5..3c06e0f92ee4 100644
> > > --- a/drivers/virtio/virtio_pci_common.h
> > > +++ b/drivers/virtio/virtio_pci_common.h
> > > @@ -64,6 +64,7 @@ struct virtio_pci_device {
> > >       /* MSI-X support */
> > >       int msix_enabled;
> > >       int intx_enabled;
> > > +     bool intx_soft_enabled;
> > >       cpumask_var_t *msix_affinity_masks;
> > >       /* Name strings for interrupts. This size should be enough,
> > >        * and I'm too lazy to allocate each name separately. */
> > > --
> > > 2.25.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
