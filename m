Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C43640847D
	for <lists.virtualization@lfdr.de>; Mon, 13 Sep 2021 08:08:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 081D040233;
	Mon, 13 Sep 2021 06:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhEBNqY6-I1B; Mon, 13 Sep 2021 06:08:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2D817401EF;
	Mon, 13 Sep 2021 06:08:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A39C3C0022;
	Mon, 13 Sep 2021 06:08:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9764BC000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FE4C4041E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxKTAilCxTa2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:08:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A57964041A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631513298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H3hy39aR4W35XwAnR6w4lMHYQiAg4avzwmB3IQ+RBLg=;
 b=IvKjUFYiZg3N7+/rG56O0L1yi+kz2dzYEvUUbyrv7rF9CQHH5WFf2OyfRn/f0DdMOUTvtG
 68sYeVGE36FrVDPnQ+dRfRt6Fly4S7xjN6JwRPq0AetyrKS9d8A7kUDHGCt73Zmvhnrm2K
 quxNeB3WDzTuwsitXxCHBnzOBx9Ecyk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-MFFgCj_vOqarSvpmQIOMmA-1; Mon, 13 Sep 2021 02:08:15 -0400
X-MC-Unique: MFFgCj_vOqarSvpmQIOMmA-1
Received: by mail-lj1-f197.google.com with SMTP id
 192-20020a2e05c90000b02901b91e6a0ebaso3678069ljf.13
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Sep 2021 23:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H3hy39aR4W35XwAnR6w4lMHYQiAg4avzwmB3IQ+RBLg=;
 b=fG/qvhZBSBQi5FYqJBmH3DkzDLbOCSs5htVUVLGmMDakTo1Gva50uPRu16q1Yh1CM1
 rkBq3VPn+AYeGqu06TndUVeWomz1oLuC878Livs6xeSxNb+wQMHMKWFfZ8EO4DYFREPs
 /3N3UTYBwPdju2PyZ6e5BpZ1nqMXwSKnY9QWm4R07V3jMKLToV4ZZPrl8yUnokK2jiaM
 j8DQ6LpXviKhxOE8KJdJzbRrZ7z1FybfWne7DLKvb56upXVJfRX/qVpETRz2SxsCkumy
 rnNTIrfnytgsqm+9JaJKepdgxs2ankbvY0qYE4g8KwJbWRtZmTl3p2f7FzHghzP8cbK/
 UfLg==
X-Gm-Message-State: AOAM533pME2YjJZRNySbY3tHAGetZ6l5ZnGoXsZfPGq26gfKd+3tsO1W
 LfAS4ri9FE0ijpfkPPQCN01kixomVYIxVFZUW5q4/UYx8IMfxAdC1on+q2xTUB89VHw/rKzqdTu
 vezDzO5EigQZQ1GN8y2Xv2Fvqdgm2uzJpM2uOkp6+9vZaTvZkrOlvMHdrrA==
X-Received: by 2002:a05:6512:110b:: with SMTP id
 l11mr7678195lfg.199.1631513293577; 
 Sun, 12 Sep 2021 23:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0Fy6hG7tOupTebTd6qmGV02QwYb1U9T+fAMtnI9Pi/sMIS4hZztZy7p4G3Xy3c5B4i+kOLvARZ6EoA8e+sG8=
X-Received: by 2002:a05:6512:110b:: with SMTP id
 l11mr7678168lfg.199.1631513293305; 
 Sun, 12 Sep 2021 23:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210913055353.35219-1-jasowang@redhat.com>
 <20210913055353.35219-7-jasowang@redhat.com>
 <20210913015711-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210913015711-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Sep 2021 14:08:02 +0800
Message-ID: <CACGkMEva2j57tG=-QYG7NdgEV28i-gpBReRR+UX7YwrHzRWydw@mail.gmail.com>
Subject: Re: [PATCH 6/9] virtio_pci: harden MSI-X interrupts
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, "kaplan,
 david" <david.kaplan@amd.com>, Peter Zijlstra <peterz@infradead.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 James E J Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Hetzelt, Felicitas" <f.hetzelt@tu-berlin.de>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Richard Henderson <rth@twiddle.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sean Christopherson <seanjc@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, pbonzini <pbonzini@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>
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

On Mon, Sep 13, 2021 at 2:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Sep 13, 2021 at 01:53:50PM +0800, Jason Wang wrote:
> > We used to synchronize pending MSI-X irq handlers via
> > synchronize_irq(), this may not work for the untrusted device which
> > may keep sending interrupts after reset which may lead unexpected
> > results. Similarly, we should not enable MSI-X interrupt until the
> > device is ready. So this patch fixes those two issues by:
> >
> > 1) switching to use disable_irq() to prevent the virtio interrupt
> >    handlers to be called after the device is reset.
> > 2) using IRQF_NO_AUTOEN and enable the MSI-X irq during .ready()
> >
> > This can make sure the virtio interrupt handler won't be called before
> > virtio_device_ready() and after reset.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
>
> I don't get the threat model here. Isn't disabling irqs done by the
> hypervisor anyway? Is there a reason to trust disable_irq but not
> device reset?

My understanding is that e.g in the case of SEV/TDX we don't trust the
hypervisor. So the hypervisor can keep sending interrupts even if the
device is reset. The guest can only trust its own software interrupt
management logic to avoid call virtio callback in this case.

Thanks

>
> Cc a bunch more people ...
>
>
> > ---
> >  drivers/virtio/virtio_pci_common.c | 27 +++++++++++++++++++++------
> >  drivers/virtio/virtio_pci_common.h |  6 ++++--
> >  drivers/virtio/virtio_pci_legacy.c |  5 +++--
> >  drivers/virtio/virtio_pci_modern.c |  6 ++++--
> >  4 files changed, 32 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> > index b35bb2d57f62..0b9523e6dd39 100644
> > --- a/drivers/virtio/virtio_pci_common.c
> > +++ b/drivers/virtio/virtio_pci_common.c
> > @@ -24,8 +24,8 @@ MODULE_PARM_DESC(force_legacy,
> >                "Force legacy mode for transitional virtio 1 devices");
> >  #endif
> >
> > -/* wait for pending irq handlers */
> > -void vp_synchronize_vectors(struct virtio_device *vdev)
> > +/* disable irq handlers */
> > +void vp_disable_vectors(struct virtio_device *vdev)
> >  {
> >       struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> >       int i;
> > @@ -34,7 +34,20 @@ void vp_synchronize_vectors(struct virtio_device *vdev)
> >               synchronize_irq(vp_dev->pci_dev->irq);
> >
> >       for (i = 0; i < vp_dev->msix_vectors; ++i)
> > -             synchronize_irq(pci_irq_vector(vp_dev->pci_dev, i));
> > +             disable_irq(pci_irq_vector(vp_dev->pci_dev, i));
> > +}
> > +
> > +/* enable irq handlers */
> > +void vp_enable_vectors(struct virtio_device *vdev)
> > +{
> > +     struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > +     int i;
> > +
> > +     if (vp_dev->intx_enabled)
> > +             return;
> > +
> > +     for (i = 0; i < vp_dev->msix_vectors; ++i)
> > +             enable_irq(pci_irq_vector(vp_dev->pci_dev, i));
> >  }
> >
> >  /* the notify function used when creating a virt queue */
> > @@ -141,7 +154,8 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
> >       snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
> >                "%s-config", name);
> >       err = request_irq(pci_irq_vector(vp_dev->pci_dev, v),
> > -                       vp_config_changed, 0, vp_dev->msix_names[v],
> > +                       vp_config_changed, IRQF_NO_AUTOEN,
> > +                       vp_dev->msix_names[v],
> >                         vp_dev);
> >       if (err)
> >               goto error;
> > @@ -160,7 +174,8 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
> >               snprintf(vp_dev->msix_names[v], sizeof *vp_dev->msix_names,
> >                        "%s-virtqueues", name);
> >               err = request_irq(pci_irq_vector(vp_dev->pci_dev, v),
> > -                               vp_vring_interrupt, 0, vp_dev->msix_names[v],
> > +                               vp_vring_interrupt, IRQF_NO_AUTOEN,
> > +                               vp_dev->msix_names[v],
> >                                 vp_dev);
> >               if (err)
> >                       goto error;
> > @@ -337,7 +352,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
> >                        "%s-%s",
> >                        dev_name(&vp_dev->vdev.dev), names[i]);
> >               err = request_irq(pci_irq_vector(vp_dev->pci_dev, msix_vec),
> > -                               vring_interrupt, 0,
> > +                               vring_interrupt, IRQF_NO_AUTOEN,
> >                                 vp_dev->msix_names[msix_vec],
> >                                 vqs[i]);
> >               if (err)
> > diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
> > index beec047a8f8d..a235ce9ff6a5 100644
> > --- a/drivers/virtio/virtio_pci_common.h
> > +++ b/drivers/virtio/virtio_pci_common.h
> > @@ -102,8 +102,10 @@ static struct virtio_pci_device *to_vp_device(struct virtio_device *vdev)
> >       return container_of(vdev, struct virtio_pci_device, vdev);
> >  }
> >
> > -/* wait for pending irq handlers */
> > -void vp_synchronize_vectors(struct virtio_device *vdev);
> > +/* disable irq handlers */
> > +void vp_disable_vectors(struct virtio_device *vdev);
> > +/* enable irq handlers */
> > +void vp_enable_vectors(struct virtio_device *vdev);
> >  /* the notify function used when creating a virt queue */
> >  bool vp_notify(struct virtqueue *vq);
> >  /* the config->del_vqs() implementation */
> > diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
> > index d62e9835aeec..bdf6bc667ab5 100644
> > --- a/drivers/virtio/virtio_pci_legacy.c
> > +++ b/drivers/virtio/virtio_pci_legacy.c
> > @@ -97,8 +97,8 @@ static void vp_reset(struct virtio_device *vdev)
> >       /* Flush out the status write, and flush in device writes,
> >        * including MSi-X interrupts, if any. */
> >       ioread8(vp_dev->ioaddr + VIRTIO_PCI_STATUS);
> > -     /* Flush pending VQ/configuration callbacks. */
> > -     vp_synchronize_vectors(vdev);
> > +     /* Disable VQ/configuration callbacks. */
> > +     vp_disable_vectors(vdev);
> >  }
> >
> >  static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
> > @@ -194,6 +194,7 @@ static void del_vq(struct virtio_pci_vq_info *info)
> >  }
> >
> >  static const struct virtio_config_ops virtio_pci_config_ops = {
> > +     .ready          = vp_enable_vectors,
> >       .get            = vp_get,
> >       .set            = vp_set,
> >       .get_status     = vp_get_status,
> > diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
> > index 30654d3a0b41..acf0f6b6381d 100644
> > --- a/drivers/virtio/virtio_pci_modern.c
> > +++ b/drivers/virtio/virtio_pci_modern.c
> > @@ -172,8 +172,8 @@ static void vp_reset(struct virtio_device *vdev)
> >        */
> >       while (vp_modern_get_status(mdev))
> >               msleep(1);
> > -     /* Flush pending VQ/configuration callbacks. */
> > -     vp_synchronize_vectors(vdev);
> > +     /* Disable VQ/configuration callbacks. */
> > +     vp_disable_vectors(vdev);
> >  }
> >
> >  static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
> > @@ -380,6 +380,7 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
> >  }
> >
> >  static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
> > +     .ready          = vp_enable_vectors,
> >       .get            = NULL,
> >       .set            = NULL,
> >       .generation     = vp_generation,
> > @@ -397,6 +398,7 @@ static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
> >  };
> >
> >  static const struct virtio_config_ops virtio_pci_config_ops = {
> > +     .ready          = vp_enable_vectors,
> >       .get            = vp_get,
> >       .set            = vp_set,
> >       .generation     = vp_generation,
> > --
> > 2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
