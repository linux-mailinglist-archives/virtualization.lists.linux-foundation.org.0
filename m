Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA6A55BDEB
	for <lists.virtualization@lfdr.de>; Tue, 28 Jun 2022 05:49:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 485F0607FF;
	Tue, 28 Jun 2022 03:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485F0607FF
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rq2fBQEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3dWfD-uNHDs; Tue, 28 Jun 2022 03:49:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6920260BCF;
	Tue, 28 Jun 2022 03:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6920260BCF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B7DFC007E;
	Tue, 28 Jun 2022 03:49:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A72AFC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 03:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FCCD81B98
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 03:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FCCD81B98
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rq2fBQEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFjz-KuTkQfB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 03:49:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E7181767
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95E7181767
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 03:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656388167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c9yCtS+drfAuIgO28s2jBKYE19OGa/tXTPZ1XT4r6wQ=;
 b=Rq2fBQEFlWT4F9rTPKKum15cE+VSEUHRaGs5MxWe/0I6TIgvTO2m2KEjfcEH+1UzeXQ21Y
 /2MJuFGjuyMouaZBbFTFBUJrYFT1gJhXWNrrbYFxBuRQscASkZXKf5X05Kqspx69oWblLR
 uj63+OeJhMUX5NESGmKH+a1M28VI0w0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-j3edPi5gO0igZ1n8Q9Z9eQ-1; Mon, 27 Jun 2022 23:49:25 -0400
X-MC-Unique: j3edPi5gO0igZ1n8Q9Z9eQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 i3-20020a056512318300b0047f86b47910so5616433lfe.14
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 20:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c9yCtS+drfAuIgO28s2jBKYE19OGa/tXTPZ1XT4r6wQ=;
 b=iaC3LXe0Arq8zYdefF2/PPvjWBhjxrlPneFV8O6Jk4TSOthD9ByTV1J+n9dM10u3mm
 YBBHTN6zisM6okHAr6VsFlEAtfk9rBtgE4L3tX06btAFJrDTpKAnJ0ZIwZmADrZ64BsA
 eEc3sDAsG5aKiVm4m3Uv18+eNFISNBB/xzrJggn4IKWdyy8a6Ay/oCOEK9aZynJbNZfQ
 sMrX2SO3TJskLAzDG6oNCzKCtjk8mnJRO1DQEaJU5HRAUt+vOzaJbm7teTsFIhsVnXv/
 6jzWmvgLkj+qDzpa8wXQ4kdNYezqDtSOPucXPSc+sJAicAtA+ihhDEs1mcEVGgFDOh/H
 rhKw==
X-Gm-Message-State: AJIora9OGp/ZKy5oUGhpSKYHhJlKHcWww4cdrLIdZseYgoqnUFbZTJal
 jrcgAcU8elf1fK0VAOzeiIZseJ0wKuKbS4KLKBwnDze0Je6Q5uWlKE7ZY2Ho7ZgJUVqc2ywjK/2
 S7D0yBAmQ+ixVMAPQfEQ7EldG/JduRcRh1QXuJaKwteORI+09NlndZJ+edg==
X-Received: by 2002:a05:6512:13a5:b0:47d:c1d9:dea8 with SMTP id
 p37-20020a05651213a500b0047dc1d9dea8mr10091783lfa.442.1656388163839; 
 Mon, 27 Jun 2022 20:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umr3Agu31nyCeIAKw/LnJ4iT6H6X6wKAUsqFLq9/ybr2sYEI7g08RoHACqL8Z+mo6fU+DBjnB4/Ejb1DTaVdI=
X-Received: by 2002:a05:6512:13a5:b0:47d:c1d9:dea8 with SMTP id
 p37-20020a05651213a500b0047dc1d9dea8mr10091766lfa.442.1656388163451; Mon, 27
 Jun 2022 20:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220622012940.21441-1-jasowang@redhat.com>
 <20220622025047-mutt-send-email-mst@kernel.org>
 <CACGkMEtJY2ioD0L8ifTrCPatG6-NqQ01V=d2L1FeoweKV74LaA@mail.gmail.com>
 <20220624022622-mutt-send-email-mst@kernel.org>
 <CACGkMEuurobpUWmDL8zmZ6T6Ygc0OEMx6vx2EDCSoGNnZQ0r-w@mail.gmail.com>
 <20220627024049-mutt-send-email-mst@kernel.org>
 <CACGkMEvrDXDN7FH1vKoYCob2rkxUsctE_=g61kzHSZ8tNNr6vA@mail.gmail.com>
 <20220627053820-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220627053820-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 28 Jun 2022 11:49:12 +0800
Message-ID: <CACGkMEvcs+9_SHmO1s3nyzgU7oq7jhU2gircVVR3KDsGDikh5Q@mail.gmail.com>
Subject: Re: [PATCH V3] virtio: disable notification hardening by default
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-s390@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Ben Hutchings <ben@decadent.org.uk>
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

On Mon, Jun 27, 2022 at 5:52 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jun 27, 2022 at 04:11:18PM +0800, Jason Wang wrote:
> > On Mon, Jun 27, 2022 at 3:33 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Jun 27, 2022 at 10:50:17AM +0800, Jason Wang wrote:
> > > > On Fri, Jun 24, 2022 at 2:31 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Wed, Jun 22, 2022 at 03:09:31PM +0800, Jason Wang wrote:
> > > > > > On Wed, Jun 22, 2022 at 3:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jun 22, 2022 at 09:29:40AM +0800, Jason Wang wrote:
> > > > > > > > We try to harden virtio device notifications in 8b4ec69d7e09 ("virtio:
> > > > > > > > harden vring IRQ"). It works with the assumption that the driver or
> > > > > > > > core can properly call virtio_device_ready() at the right
> > > > > > > > place. Unfortunately, this seems to be not true and uncover various
> > > > > > > > bugs of the existing drivers, mainly the issue of using
> > > > > > > > virtio_device_ready() incorrectly.
> > > > > > > >
> > > > > > > > So let's having a Kconfig option and disable it by default. It gives
> > > > > > > > us a breath to fix the drivers and then we can consider to enable it
> > > > > > > > by default.
> > > > > > > >
> > > > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > >
> > > > > > >
> > > > > > > OK I will queue, but I think the problem is fundamental.
> > > > > >
> > > > > > If I understand correctly, you want some core IRQ work?
> > > > >
> > > > > Yes.
> > > > >
> > > > > > As discussed
> > > > > > before, it doesn't solve all the problems, we still need to do per
> > > > > > driver audit.
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > Maybe, but we don't need to tie things to device_ready then.
> > > > > We can do
> > > > >
> > > > > - disable irqs
> > > > > - device ready
> > > > > - setup everything
> > > > > - enable irqs
> > > > >
> > > > >
> > > > > and this works for most things, the only issue is
> > > > > this deadlocks if "setup everything" waits for interrupts.
> > > > >
> > > > >
> > > > > With the current approach there's really no good time:
> > > > > 1.- setup everything
> > > > > - device ready
> > > > >
> > > > > can cause kicks before device is ready
> > > > >
> > > > > 2.- device ready
> > > > > - setup everything
> > > > >
> > > > > can cause callbacks before setup.
> > > > >
> > > > > So I prefer the 1. and fix the hardening in the core.
> > > >
> > > > So my question is:
> > > >
> > > > 1) do similar hardening like config interrupt
> > > > or
> > > > 2) per transport notification work (e.g for PCI core IRQ work)
> > > >
> > > > 1) seems easier and universal, but we pay little overhead which could
> > > > be eliminated by the config option.
> > >
> > > I doubt 1 is easy and I am not even sure core IRQ changes will help.
> >
> > Core IRQ won't help in 1), the changes are limited in the virtio.
> >
> > > My concern with adding overhead is that I'm not sure these are not just
> > > wasted CPU cycles.  We spent a bunch of time on irq hardening and so far
> > > we are still at the "all drivers need to be fixed" stage.
> >
> > It's not the fault of hardening but the drivers. The hardening just
> > expose those bugs.
>
> Heh. Yea sure. But things work fine for people. What is the chance
> your review found and fixed all driver bugs?

I don't/can't audit all bugs but the race between open/close against
ready/reset. It looks to me a good chance to fix them all but if you
think differently, let me know

> After two attempts
> I don't feel like hoping audit will fix all bugs.

I've started the auditing and have 15+ patches in the queue. (only
covers bluetooth, console, pmem, virtio-net and caif). Spotting the
issue is not hard but the testing, It would take at least the time of
one release to finalize I guess.

>
>
> > >
> > > The reason config was kind of easy is that config interrupt is rarely
> > > vital for device function so arbitrarily deferring that does not lead to
> > > deadlocks - what you are trying to do with VQ interrupts is
> > > fundamentally different. Things are especially bad if we just drop
> > > an interrupt but deferring can lead to problems too.
> >
> > I'm not sure I see the difference, disable_irq() stuffs also delay the
> > interrupt processing until enable_irq().
>
>
> Absolutely. I am not at all sure disable_irq fixes all problems.
>
> > >
> > > Consider as an example
> > >     virtio-net: fix race between ndo_open() and virtio_device_ready()
> > > if you just defer vq interrupts you get deadlocks.
> > >
> > >
> >
> > I don't see a deadlock here, maybe you can show more detail on this?
>
> What I mean is this: if we revert the above commit, things still
> work (out of spec, but still). If we revert and defer interrupts until
> device ready then ndo_open that triggers before device ready deadlocks.

Ok, I guess you meant on a hypervisor that is strictly written with spec.

>
>
> > >
> > > So, thinking about all this, how about a simple per vq flag meaning
> > > "this vq was kicked since reset"?
> >
> > And ignore the notification if vq is not kicked? It sounds like the
> > callback needs to be synchronized with the kick.
>
> Note we only need to synchronize it when it changes, which is
> only during initialization and reset.

Yes.

>
>
> > >
> > > If driver does not kick then it's not ready to get callbacks, right?
> > >
> > > Sounds quite clean, but we need to think through memory ordering
> > > concerns - I guess it's only when we change the value so
> > >         if (!vq->kicked) {
> > >                 vq->kicked = true;
> > >                 mb();
> > >         }
> > >
> > > will do the trick, right?
> >
> > There's no much difference with the existing approach:
> >
> > 1) your proposal implicitly makes callbacks ready in virtqueue_kick()
> > 2) my proposal explicitly makes callbacks ready via virtio_device_ready()
> >
> > Both require careful auditing of all the existing drivers to make sure
> > no kick before DRIVER_OK.
>
> Jason, kick before DRIVER_OK is out of spec, sure. But it is unrelated
> to hardening

Yes but with your proposal, it seems to couple kick with DRIVER_OK somehow.

> and in absence of config interrupts is generally easily
> fixed just by sticking virtio_device_ready early in initialization.

So if the kick is done before the subsystem registration, there's
still a window in the middle (assuming we stick virtio_device_ready()
early):

virtio_device_ready()
virtqueue_kick()
/* the window */
subsystem_registration()

And during remove(), we get another window:

subsysrem_unregistration()
/* the window */
virtio_device_reset()

if we do reset before, we may end up with other issues like deadlock.

So I think it's probably very hard to fix issues only at the virtio
core since we need subsystem specific knowledge to make sure
everything is synchronized.

> With the current approach one has to *also* not do virtio_device_ready
> too early - and it's really tricky.

Not sure how much we differ here, during the probe driver can just
place the virtio_device_ready() after the kick.

>
> With the proposal I think that we don't need to fix all drivers and
> in my eyes that is a huge advantage because frankly I'm fine with
> more work on strict spec compliance taking more than expected
> but I would like the hardening work to finally be done.

Ok, but what I meant is, with your proposal if a buggy drive kicks
before DRIVER_OK, it suppresses the effect of hardening?

> I am not sure the amount of effort expended on the hardening here is
> proportionate to the benefit it provides.

Probably, but we received those bug reports from the confidential
computing guys.

Or can we choose to go another way, let the kconfig option enabled for
TDX/SEV, and then fix the bugs only if it is reported?

>
>
>
> > >
> > > need to think about the reset path - it already synchronizes callbacks
> > > and already can lose interrupts so we just need to clear vq->kicked
> > > before that, right?
> >
> > Probably.
> >
> > >
> > >
> > > > 2) seems require more work in the IRQ core and it can not work for all
> > > > transports (e.g vDPA would be kind of difficult)
> > > >
> > > > Thanks
> > >
> > > Hmm I don't really get why would it be difficult.
> > > VDPA is mostly PCI isn't it? With PCI both level INT#x and edge MSI
> > > have interrupt masking support.
> >
> > Yes, but consider the case of mlx5_vdpa, PCI stuff was hidden under
> > the auxiliary bus. And that is the way another vendor will go.
> >
> > Thanks
>
> A bunch of callbacks will do it I guess.

Possible but looks like a layer violation, I think auxiliary stuff
wants to hide the underlayer architecture. That is why I tend to do it
in the virtio core. And actually, transport is freed to implement
another layer of those synchronization if it wants.

Thanks

>
> > >
> > >
> > > > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > > > ---
> > > > > > > > Changes since V2:
> > > > > > > > - Tweak the Kconfig help
> > > > > > > > - Add comment for the read_lock() pairing in virtio_ccw
> > > > > > > > ---
> > > > > > > >  drivers/s390/virtio/virtio_ccw.c |  9 ++++++++-
> > > > > > > >  drivers/virtio/Kconfig           | 13 +++++++++++++
> > > > > > > >  drivers/virtio/virtio.c          |  2 ++
> > > > > > > >  drivers/virtio/virtio_ring.c     | 12 ++++++++++++
> > > > > > > >  include/linux/virtio_config.h    |  2 ++
> > > > > > > >  5 files changed, 37 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > index 97e51c34e6cf..1f6a358f65f0 100644
> > > > > > > > --- a/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > +++ b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > @@ -1136,8 +1136,13 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
> > > > > > > >                       vcdev->err = -EIO;
> > > > > > > >       }
> > > > > > > >       virtio_ccw_check_activity(vcdev, activity);
> > > > > > > > -     /* Interrupts are disabled here */
> > > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > > > +     /*
> > > > > > > > +      * Paried with virtio_ccw_synchronize_cbs() and interrupts are
> > > > > > > > +      * disabled here.
> > > > > > > > +      */
> > > > > > > >       read_lock(&vcdev->irq_lock);
> > > > > > > > +#endif
> > > > > > > >       for_each_set_bit(i, indicators(vcdev),
> > > > > > > >                        sizeof(*indicators(vcdev)) * BITS_PER_BYTE) {
> > > > > > > >               /* The bit clear must happen before the vring kick. */
> > > > > > > > @@ -1146,7 +1151,9 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
> > > > > > > >               vq = virtio_ccw_vq_by_ind(vcdev, i);
> > > > > > > >               vring_interrupt(0, vq);
> > > > > > > >       }
> > > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > > >       read_unlock(&vcdev->irq_lock);
> > > > > > > > +#endif
> > > > > > > >       if (test_bit(0, indicators2(vcdev))) {
> > > > > > > >               virtio_config_changed(&vcdev->vdev);
> > > > > > > >               clear_bit(0, indicators2(vcdev));
> > > > > > > > diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> > > > > > > > index b5adf6abd241..c04f370a1e5c 100644
> > > > > > > > --- a/drivers/virtio/Kconfig
> > > > > > > > +++ b/drivers/virtio/Kconfig
> > > > > > > > @@ -35,6 +35,19 @@ menuconfig VIRTIO_MENU
> > > > > > > >
> > > > > > > >  if VIRTIO_MENU
> > > > > > > >
> > > > > > > > +config VIRTIO_HARDEN_NOTIFICATION
> > > > > > > > +        bool "Harden virtio notification"
> > > > > > > > +        help
> > > > > > > > +          Enable this to harden the device notifications and suppress
> > > > > > > > +          those that happen at a time where notifications are illegal.
> > > > > > > > +
> > > > > > > > +          Experimental: Note that several drivers still have bugs that
> > > > > > > > +          may cause crashes or hangs when correct handling of
> > > > > > > > +          notifications is enforced; depending on the subset of
> > > > > > > > +          drivers and devices you use, this may or may not work.
> > > > > > > > +
> > > > > > > > +          If unsure, say N.
> > > > > > > > +
> > > > > > > >  config VIRTIO_PCI
> > > > > > > >       tristate "PCI driver for virtio devices"
> > > > > > > >       depends on PCI
> > > > > > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > > > > > index ef04a96942bf..21dc08d2f32d 100644
> > > > > > > > --- a/drivers/virtio/virtio.c
> > > > > > > > +++ b/drivers/virtio/virtio.c
> > > > > > > > @@ -220,6 +220,7 @@ static int virtio_features_ok(struct virtio_device *dev)
> > > > > > > >   * */
> > > > > > > >  void virtio_reset_device(struct virtio_device *dev)
> > > > > > > >  {
> > > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > > >       /*
> > > > > > > >        * The below virtio_synchronize_cbs() guarantees that any
> > > > > > > >        * interrupt for this line arriving after
> > > > > > > > @@ -228,6 +229,7 @@ void virtio_reset_device(struct virtio_device *dev)
> > > > > > > >        */
> > > > > > > >       virtio_break_device(dev);
> > > > > > > >       virtio_synchronize_cbs(dev);
> > > > > > > > +#endif
> > > > > > > >
> > > > > > > >       dev->config->reset(dev);
> > > > > > > >  }
> > > > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > > > index 13a7348cedff..d9d3b6e201fb 100644
> > > > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > > > @@ -1688,7 +1688,11 @@ static struct virtqueue *vring_create_virtqueue_packed(
> > > > > > > >       vq->we_own_ring = true;
> > > > > > > >       vq->notify = notify;
> > > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > > >       vq->broken = true;
> > > > > > > > +#else
> > > > > > > > +     vq->broken = false;
> > > > > > > > +#endif
> > > > > > > >       vq->last_used_idx = 0;
> > > > > > > >       vq->event_triggered = false;
> > > > > > > >       vq->num_added = 0;
> > > > > > > > @@ -2135,9 +2139,13 @@ irqreturn_t vring_interrupt(int irq, void *_vq)
> > > > > > > >       }
> > > > > > > >
> > > > > > > >       if (unlikely(vq->broken)) {
> > > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > > >               dev_warn_once(&vq->vq.vdev->dev,
> > > > > > > >                             "virtio vring IRQ raised before DRIVER_OK");
> > > > > > > >               return IRQ_NONE;
> > > > > > > > +#else
> > > > > > > > +             return IRQ_HANDLED;
> > > > > > > > +#endif
> > > > > > > >       }
> > > > > > > >
> > > > > > > >       /* Just a hint for performance: so it's ok that this can be racy! */
> > > > > > > > @@ -2180,7 +2188,11 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > > > > > > >       vq->we_own_ring = false;
> > > > > > > >       vq->notify = notify;
> > > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > > >       vq->broken = true;
> > > > > > > > +#else
> > > > > > > > +     vq->broken = false;
> > > > > > > > +#endif
> > > > > > > >       vq->last_used_idx = 0;
> > > > > > > >       vq->event_triggered = false;
> > > > > > > >       vq->num_added = 0;
> > > > > > > > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> > > > > > > > index 9a36051ceb76..d15c3cdda2d2 100644
> > > > > > > > --- a/include/linux/virtio_config.h
> > > > > > > > +++ b/include/linux/virtio_config.h
> > > > > > > > @@ -257,6 +257,7 @@ void virtio_device_ready(struct virtio_device *dev)
> > > > > > > >
> > > > > > > >       WARN_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > > >
> > > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > > >       /*
> > > > > > > >        * The virtio_synchronize_cbs() makes sure vring_interrupt()
> > > > > > > >        * will see the driver specific setup if it sees vq->broken
> > > > > > > > @@ -264,6 +265,7 @@ void virtio_device_ready(struct virtio_device *dev)
> > > > > > > >        */
> > > > > > > >       virtio_synchronize_cbs(dev);
> > > > > > > >       __virtio_unbreak_device(dev);
> > > > > > > > +#endif
> > > > > > > >       /*
> > > > > > > >        * The transport should ensure the visibility of vq->broken
> > > > > > > >        * before setting DRIVER_OK. See the comments for the transport
> > > > > > > > --
> > > > > > > > 2.25.1
> > > > > > >
> > > > >
> > >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
