Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFEB42D334
	for <lists.virtualization@lfdr.de>; Thu, 14 Oct 2021 09:05:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46375405D4;
	Thu, 14 Oct 2021 07:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A58mFUrMYhLV; Thu, 14 Oct 2021 07:04:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C327A40591;
	Thu, 14 Oct 2021 07:04:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64DFAC000D;
	Thu, 14 Oct 2021 07:04:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BA77C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 07:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BC1D801ED
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 07:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePpPlx6O5SB8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 07:04:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6334B801D8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 07:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634195092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a7bz6Gz7aVimD4FyPuTMkxvGqg/oYQXtXsJKtO+9XI0=;
 b=KYBiV51LEFL+5ZuM3EV8GfbsxXEa8caDCGHBzL74af3pp8qWp/TEBy4rwQjmnu5YGcKN+h
 1JK1Q8b18oVVSlVhnnICBNxuoOvLowISDychbkQYgYDnZZ3GlY/yK8/z/BAF7OUTGGbI6v
 Yy9ijmrzgxefI3q0XeRj+catgKNdeTs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-5JnjSqbLPTq1dWIvlRan_A-1; Thu, 14 Oct 2021 03:04:51 -0400
X-MC-Unique: 5JnjSqbLPTq1dWIvlRan_A-1
Received: by mail-ed1-f69.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so4358092edv.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 00:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a7bz6Gz7aVimD4FyPuTMkxvGqg/oYQXtXsJKtO+9XI0=;
 b=ujRvzE+FRnsIgQpfBXI1y3cUAdn6JV5+jhtpImbtj4F2IXdPz1GonF9xbQ8zCIsCmZ
 li+7wayCXLEwLvKRFTV+sqAn2rzcIP61zclXxK8yY45rUBaeKStdZoLlXlKYqwH8jMSr
 F86k5vICFm8nBhVKZhlik7HODolrZMsAJSrvBRcY2xq4N5OcxEuu0oD1A7dEsGF2jgAD
 kyv+SuzMcYt4y7zJ858vPTMSkjaUwDkAauGQjxLge+/gSC4jAfEllsC18Ftg5vd7kTXd
 Cy7hG7zL5NQo0ICq0OklNsUnKYRaiGaar8x0PD7746fR/OrtbGkSQJmQVoPwxP0nyow5
 PbxQ==
X-Gm-Message-State: AOAM531J6yGZgAyzdIPruR262UnWaQ/qJle3OR43f6gFOuD4QjcYdDDR
 n/mJ6NJFZHcMuL3/XAVEUakcD4nCMviryplvuFU7kUBsNBA/wWt/Bt7L2Ef5t1rlWFOI4cgMLdG
 j4plhcko2zuAz6QdzG3edcbq+UsBCv6RHuP3Z8f/T8A==
X-Received: by 2002:a05:6402:411:: with SMTP id
 q17mr6284507edv.35.1634195090339; 
 Thu, 14 Oct 2021 00:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyugxCELhdn4PpU0RYHVJE9ovN0GJTgH/CN0F5hx6YOmtjJJNhJY+8lQ9P71wM3RL9cmOdolw==
X-Received: by 2002:a05:6402:411:: with SMTP id
 q17mr6284484edv.35.1634195090189; 
 Thu, 14 Oct 2021 00:04:50 -0700 (PDT)
Received: from redhat.com ([2.55.16.227])
 by smtp.gmail.com with ESMTPSA id k9sm976238edl.41.2021.10.14.00.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 00:04:49 -0700 (PDT)
Date: Thu, 14 Oct 2021 03:04:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 07/12] virtio-pci: harden INTX interrupts
Message-ID: <20211014025815-mutt-send-email-mst@kernel.org>
References: <20211012065227.9953-1-jasowang@redhat.com>
 <20211012065227.9953-8-jasowang@redhat.com>
 <20211013053627-mutt-send-email-mst@kernel.org>
 <CACGkMEuRHKJv73oKFNetcBkPSFj034te7N_AJZdRbHe0ObU4Gw@mail.gmail.com>
 <20211014014551-mutt-send-email-mst@kernel.org>
 <CACGkMEvB4sMPmMmPQmHFasGLwktyXuCenQKGuoajmoFQYJJeBQ@mail.gmail.com>
 <20211014022438-mutt-send-email-mst@kernel.org>
 <CACGkMEsPiHee5A=JymA+RpaN+xqbpw=hU=or29hrHCDk=TK+Hw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsPiHee5A=JymA+RpaN+xqbpw=hU=or29hrHCDk=TK+Hw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "Paul E . McKenney" <paulmck@kernel.org>, "kaplan,
 david" <david.kaplan@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 "Hetzelt, Felicitas" <f.hetzelt@tu-berlin.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
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

On Thu, Oct 14, 2021 at 02:32:19PM +0800, Jason Wang wrote:
> On Thu, Oct 14, 2021 at 2:26 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Oct 14, 2021 at 02:20:17PM +0800, Jason Wang wrote:
> > > On Thu, Oct 14, 2021 at 1:50 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Thu, Oct 14, 2021 at 10:35:48AM +0800, Jason Wang wrote:
> > > > > On Wed, Oct 13, 2021 at 5:42 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Tue, Oct 12, 2021 at 02:52:22PM +0800, Jason Wang wrote:
> > > > > > > This patch tries to make sure the virtio interrupt handler for INTX
> > > > > > > won't be called after a reset and before virtio_device_ready(). We
> > > > > > > can't use IRQF_NO_AUTOEN since we're using shared interrupt
> > > > > > > (IRQF_SHARED). So this patch tracks the INTX enabling status in a new
> > > > > > > intx_soft_enabled variable and toggle it during in
> > > > > > > vp_disable/enable_vectors(). The INTX interrupt handler will check
> > > > > > > intx_soft_enabled before processing the actual interrupt.
> > > > > > >
> > > > > > > Cc: Boqun Feng <boqun.feng@gmail.com>
> > > > > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > > > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > > > > > Cc: Paul E. McKenney <paulmck@kernel.org>
> > > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > > ---
> > > > > > >  drivers/virtio/virtio_pci_common.c | 24 ++++++++++++++++++++++--
> > > > > > >  drivers/virtio/virtio_pci_common.h |  1 +
> > > > > > >  2 files changed, 23 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> > > > > > > index 0b9523e6dd39..5ae6a2a4eb77 100644
> > > > > > > --- a/drivers/virtio/virtio_pci_common.c
> > > > > > > +++ b/drivers/virtio/virtio_pci_common.c
> > > > > > > @@ -30,8 +30,16 @@ void vp_disable_vectors(struct virtio_device *vdev)
> > > > > > >       struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > > > > > >       int i;
> > > > > > >
> > > > > > > -     if (vp_dev->intx_enabled)
> > > > > > > +     if (vp_dev->intx_enabled) {
> > > > > > > +             /*
> > > > > > > +              * The below synchronize() guarantees that any
> > > > > > > +              * interrupt for this line arriving after
> > > > > > > +              * synchronize_irq() has completed is guaranteed to see
> > > > > > > +              * intx_soft_enabled == false.
> > > > > > > +              */
> > > > > > > +             WRITE_ONCE(vp_dev->intx_soft_enabled, false);
> > > > > > >               synchronize_irq(vp_dev->pci_dev->irq);
> > > > > > > +     }
> > > > > > >
> > > > > > >       for (i = 0; i < vp_dev->msix_vectors; ++i)
> > > > > > >               disable_irq(pci_irq_vector(vp_dev->pci_dev, i));
> > > > > > > @@ -43,8 +51,16 @@ void vp_enable_vectors(struct virtio_device *vdev)
> > > > > > >       struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > > > > > >       int i;
> > > > > > >
> > > > > > > -     if (vp_dev->intx_enabled)
> > > > > > > +     if (vp_dev->intx_enabled) {
> > > > > > > +             disable_irq(vp_dev->pci_dev->irq);
> > > > > > > +             /*
> > > > > > > +              * The above disable_irq() provides TSO ordering and
> > > > > > > +              * as such promotes the below store to store-release.
> > > > > > > +              */
> > > > > > > +             WRITE_ONCE(vp_dev->intx_soft_enabled, true);
> > > > > > > +             enable_irq(vp_dev->pci_dev->irq);
> > > > > > >               return;
> > > > > > > +     }
> > > > > > >
> > > > > > >       for (i = 0; i < vp_dev->msix_vectors; ++i)
> > > > > > >               enable_irq(pci_irq_vector(vp_dev->pci_dev, i));
> > > > > > > @@ -97,6 +113,10 @@ static irqreturn_t vp_interrupt(int irq, void *opaque)
> > > > > > >       struct virtio_pci_device *vp_dev = opaque;
> > > > > > >       u8 isr;
> > > > > > >
> > > > > > > +     /* read intx_soft_enabled before read others */
> > > > > > > +     if (!smp_load_acquire(&vp_dev->intx_soft_enabled))
> > > > > > > +             return IRQ_NONE;
> > > > > > > +
> > > > > > >       /* reading the ISR has the effect of also clearing it so it's very
> > > > > > >        * important to save off the value. */
> > > > > > >       isr = ioread8(vp_dev->isr);
> > > > > >
> > > > > > I don't see why we need this ordering guarantee here.
> > > > > >
> > > > > > synchronize_irq above makes sure no interrupt handler
> > > > > > is in progress.
> > > > >
> > > > > Yes.
> > > > >
> > > > > > the handler itself thus does not need
> > > > > > any specific order, it is ok if intx_soft_enabled is read
> > > > > > after, not before the rest of it.
> > > > >
> > > > > But the interrupt could be raised after synchronize_irq() which may
> > > > > see a false of the intx_soft_enabled.
> > > >
> > > > You mean a "true" value right? false is what we are writing there.
> > >
> > > I meant that we want to not go for stuff like vq->callback after the
> > > synchronize_irq() after setting intx_soft_enabled to false. Otherwise
> > > we may get unexpected results like use after free. Host can craft ISR
> > > in this case.
> > > >
> > > > Are you sure it can happen? I think that synchronize_irq makes the value
> > > > visible on all CPUs running the irq.
> > >
> > > Yes, so the false is visible by vp_interrupt(), we can't do the other
> > > task before we check intx_soft_enabled.
> >
> > But the order does not matter. synchronize_irq will make sure
> > everything is visible.
> 
> Not the thing that happens after synchronize_irq().
> 
> E.g for remove_vq_common():
> 
> static void remove_vq_common(struct virtnet_info *vi)
> {
>         vi->vdev->config->reset(vi->vdev);
> 
>         /* Free unused buffers in both send and recv, if any. */
>         free_unused_bufs(vi);
> 
>         free_receive_bufs(vi);
> 
>         free_receive_page_frags(vi);
> 
>         virtnet_del_vqs(vi);
> }
> 
> The interrupt could be raised by the device after .reset().
> 
> Thanks

That's why your patches set intx_soft_enabled to false within reset.
Then you sync so all other CPUs see the false value.
Then it's ok to proceed with reset.
What does the interrupt handler *do* with the value
does not matter as long as it sees that it is false.

OTOH if you are really worried about spectre type speculative attacks,
that is a different matter, and would force us to stick expensive
barriers around hardware accessible buffers just like we have in
copy_XXX_user. I am not sure this is in scope for TDX, and
certainly out of scope for regular driver ardening.
If yes worth hiding that behind a kernel option.


> >
> > > >
> > > > > In this case we still need the
> > > > > make sure intx_soft_enbled to be read first instead of allowing other
> > > > > operations to be done first, otherwise the intx_soft_enabled is
> > > > > meaningless.
> > > > >
> > > > > Thanks
> > > >
> > > > If intx_soft_enbled were not visible after synchronize_irq then
> > > > it does not matter in which order we read it wrt other values,
> > > > it still wouldn't work right.
> > >
> > > Yes.
> > >
> > > Thanks
> >
> >
> > We are agreed then? No need for a barrier here, READ_ONCE is enough?
> >
> > > >
> > > > > >
> > > > > > Just READ_ONCE should be enough, and we can drop the comment.
> > > > > >
> > > > > >
> > > > > > > diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
> > > > > > > index a235ce9ff6a5..3c06e0f92ee4 100644
> > > > > > > --- a/drivers/virtio/virtio_pci_common.h
> > > > > > > +++ b/drivers/virtio/virtio_pci_common.h
> > > > > > > @@ -64,6 +64,7 @@ struct virtio_pci_device {
> > > > > > >       /* MSI-X support */
> > > > > > >       int msix_enabled;
> > > > > > >       int intx_enabled;
> > > > > > > +     bool intx_soft_enabled;
> > > > > > >       cpumask_var_t *msix_affinity_masks;
> > > > > > >       /* Name strings for interrupts. This size should be enough,
> > > > > > >        * and I'm too lazy to allocate each name separately. */
> > > > > > > --
> > > > > > > 2.25.1
> > > > > >
> > > >
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
