Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD3A55B903
	for <lists.virtualization@lfdr.de>; Mon, 27 Jun 2022 11:52:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32B86415A5;
	Mon, 27 Jun 2022 09:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32B86415A5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a2iihYPH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WE_m1gYs7MwC; Mon, 27 Jun 2022 09:52:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 18F55418C9;
	Mon, 27 Jun 2022 09:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18F55418C9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28B57C007E;
	Mon, 27 Jun 2022 09:52:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4AD3C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 09:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A061660B0F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 09:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A061660B0F
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=a2iihYPH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUXd32iokDu3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 09:52:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43A6460B0B
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43A6460B0B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656323556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FA4/e7nzPal3eOwEx0TnFAtrjsOunXWeNfCJ/Hz8a2U=;
 b=a2iihYPHZCzxkdUUsW2fxnJiyHELP/kD0q6+omFfZpiYSrZ7OiurQ1N8PKVvYeCme+H4LP
 JdWk3288iUIO7loDgRd6V5UrW8XJt/p8t+/bWKNQmy5zM4zkfqFe84Lc1kvSWCfSVg4823
 jRepUH4eoCHTJ/Bi5k7QXj9zgXwFpEw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-9BcwmBE-Pom4HdGJn0rT8w-1; Mon, 27 Jun 2022 05:52:34 -0400
X-MC-Unique: 9BcwmBE-Pom4HdGJn0rT8w-1
Received: by mail-wm1-f71.google.com with SMTP id
 k32-20020a05600c1ca000b0039c4cf75023so7074688wms.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 02:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FA4/e7nzPal3eOwEx0TnFAtrjsOunXWeNfCJ/Hz8a2U=;
 b=fjHf2ynBvEYryTb45o+/eSNoj1RRI9P74rzGb76/OlpHX1+npJ+d5PJw3PgoD9wfZK
 cOEwDPxpfuzWiIgxh4aq0qc8LJgJchanwWpP5FFeXFDTF+BnL/H4Tat8vfF3+hrKQGiy
 KGaPwKMtHzr08dFYfv2qnT9VFDdae3rOiH5eCADKg2VxyknfRyL6jlFbEuCSoR85eHH9
 FrHBEcDEljakcWSyHXtn2Q5KRlksH/9FVZtC7M6ATsCKpHSxMojiCnPBmlBUcZXEmEDt
 k6zeg4Hd/SjfKJMwty1B54NdBSk71GzzkmET9qOSD/yh1lTZKOLg7a6Zqagorg4cWz2J
 4W+g==
X-Gm-Message-State: AJIora8t/Ryr+I/+HNJp3QjC5Q28ffguMAdZE0HhkZ+G3Mj/u6Ewz5v7
 +rSF74ynirXSur4MGEq05cBbQ1Ba3emer3HMUy3hLW3ZzcVqn+XBp8RuYZYVvXsNu7IzmVDMy3g
 t/TsbKCFiyTqdsjA+yXzYAPLocHA9i/hjD6LVRq0PRw==
X-Received: by 2002:a05:6000:5c5:b0:21b:9b11:9128 with SMTP id
 bh5-20020a05600005c500b0021b9b119128mr11703383wrb.492.1656323553153; 
 Mon, 27 Jun 2022 02:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sCxfv3KriW5BqnNxFUoTxKqQuPPHKNNy+QToEfQnWFhS08FguZ0weFalXCc3i4zDfmqBw1gQ==
X-Received: by 2002:a05:6000:5c5:b0:21b:9b11:9128 with SMTP id
 bh5-20020a05600005c500b0021b9b119128mr11703360wrb.492.1656323552827; 
 Mon, 27 Jun 2022 02:52:32 -0700 (PDT)
Received: from redhat.com ([2.54.45.90]) by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b0021b9a4a75e2sm9888998wrr.30.2022.06.27.02.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:52:32 -0700 (PDT)
Date: Mon, 27 Jun 2022 05:52:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3] virtio: disable notification hardening by default
Message-ID: <20220627053820-mutt-send-email-mst@kernel.org>
References: <20220622012940.21441-1-jasowang@redhat.com>
 <20220622025047-mutt-send-email-mst@kernel.org>
 <CACGkMEtJY2ioD0L8ifTrCPatG6-NqQ01V=d2L1FeoweKV74LaA@mail.gmail.com>
 <20220624022622-mutt-send-email-mst@kernel.org>
 <CACGkMEuurobpUWmDL8zmZ6T6Ygc0OEMx6vx2EDCSoGNnZQ0r-w@mail.gmail.com>
 <20220627024049-mutt-send-email-mst@kernel.org>
 <CACGkMEvrDXDN7FH1vKoYCob2rkxUsctE_=g61kzHSZ8tNNr6vA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvrDXDN7FH1vKoYCob2rkxUsctE_=g61kzHSZ8tNNr6vA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Mon, Jun 27, 2022 at 04:11:18PM +0800, Jason Wang wrote:
> On Mon, Jun 27, 2022 at 3:33 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 27, 2022 at 10:50:17AM +0800, Jason Wang wrote:
> > > On Fri, Jun 24, 2022 at 2:31 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Jun 22, 2022 at 03:09:31PM +0800, Jason Wang wrote:
> > > > > On Wed, Jun 22, 2022 at 3:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Wed, Jun 22, 2022 at 09:29:40AM +0800, Jason Wang wrote:
> > > > > > > We try to harden virtio device notifications in 8b4ec69d7e09 ("virtio:
> > > > > > > harden vring IRQ"). It works with the assumption that the driver or
> > > > > > > core can properly call virtio_device_ready() at the right
> > > > > > > place. Unfortunately, this seems to be not true and uncover various
> > > > > > > bugs of the existing drivers, mainly the issue of using
> > > > > > > virtio_device_ready() incorrectly.
> > > > > > >
> > > > > > > So let's having a Kconfig option and disable it by default. It gives
> > > > > > > us a breath to fix the drivers and then we can consider to enable it
> > > > > > > by default.
> > > > > > >
> > > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > >
> > > > > >
> > > > > > OK I will queue, but I think the problem is fundamental.
> > > > >
> > > > > If I understand correctly, you want some core IRQ work?
> > > >
> > > > Yes.
> > > >
> > > > > As discussed
> > > > > before, it doesn't solve all the problems, we still need to do per
> > > > > driver audit.
> > > > >
> > > > > Thanks
> > > >
> > > > Maybe, but we don't need to tie things to device_ready then.
> > > > We can do
> > > >
> > > > - disable irqs
> > > > - device ready
> > > > - setup everything
> > > > - enable irqs
> > > >
> > > >
> > > > and this works for most things, the only issue is
> > > > this deadlocks if "setup everything" waits for interrupts.
> > > >
> > > >
> > > > With the current approach there's really no good time:
> > > > 1.- setup everything
> > > > - device ready
> > > >
> > > > can cause kicks before device is ready
> > > >
> > > > 2.- device ready
> > > > - setup everything
> > > >
> > > > can cause callbacks before setup.
> > > >
> > > > So I prefer the 1. and fix the hardening in the core.
> > >
> > > So my question is:
> > >
> > > 1) do similar hardening like config interrupt
> > > or
> > > 2) per transport notification work (e.g for PCI core IRQ work)
> > >
> > > 1) seems easier and universal, but we pay little overhead which could
> > > be eliminated by the config option.
> >
> > I doubt 1 is easy and I am not even sure core IRQ changes will help.
> 
> Core IRQ won't help in 1), the changes are limited in the virtio.
> 
> > My concern with adding overhead is that I'm not sure these are not just
> > wasted CPU cycles.  We spent a bunch of time on irq hardening and so far
> > we are still at the "all drivers need to be fixed" stage.
> 
> It's not the fault of hardening but the drivers. The hardening just
> expose those bugs.

Heh. Yea sure. But things work fine for people. What is the chance
your review found and fixed all driver bugs? After two attempts
I don't feel like hoping audit will fix all bugs.


> >
> > The reason config was kind of easy is that config interrupt is rarely
> > vital for device function so arbitrarily deferring that does not lead to
> > deadlocks - what you are trying to do with VQ interrupts is
> > fundamentally different. Things are especially bad if we just drop
> > an interrupt but deferring can lead to problems too.
> 
> I'm not sure I see the difference, disable_irq() stuffs also delay the
> interrupt processing until enable_irq().


Absolutely. I am not at all sure disable_irq fixes all problems.

> >
> > Consider as an example
> >     virtio-net: fix race between ndo_open() and virtio_device_ready()
> > if you just defer vq interrupts you get deadlocks.
> >
> >
> 
> I don't see a deadlock here, maybe you can show more detail on this?

What I mean is this: if we revert the above commit, things still
work (out of spec, but still). If we revert and defer interrupts until
device ready then ndo_open that triggers before device ready deadlocks.


> >
> > So, thinking about all this, how about a simple per vq flag meaning
> > "this vq was kicked since reset"?
> 
> And ignore the notification if vq is not kicked? It sounds like the
> callback needs to be synchronized with the kick.

Note we only need to synchronize it when it changes, which is
only during initialization and reset.


> >
> > If driver does not kick then it's not ready to get callbacks, right?
> >
> > Sounds quite clean, but we need to think through memory ordering
> > concerns - I guess it's only when we change the value so
> >         if (!vq->kicked) {
> >                 vq->kicked = true;
> >                 mb();
> >         }
> >
> > will do the trick, right?
> 
> There's no much difference with the existing approach:
> 
> 1) your proposal implicitly makes callbacks ready in virtqueue_kick()
> 2) my proposal explicitly makes callbacks ready via virtio_device_ready()
> 
> Both require careful auditing of all the existing drivers to make sure
> no kick before DRIVER_OK.

Jason, kick before DRIVER_OK is out of spec, sure. But it is unrelated
to hardening and in absence of config interrupts is generally easily
fixed just by sticking virtio_device_ready early in initialization.
With the current approach one has to *also* not do virtio_device_ready
too early - and it's really tricky.

With the proposal I think that we don't need to fix all drivers and
in my eyes that is a huge advantage because frankly I'm fine with
more work on strict spec compliance taking more than expected
but I would like the hardening work to finally be done.
I am not sure the amount of effort expended on the hardening here is
proportionate to the benefit it provides.



> >
> > need to think about the reset path - it already synchronizes callbacks
> > and already can lose interrupts so we just need to clear vq->kicked
> > before that, right?
> 
> Probably.
> 
> >
> >
> > > 2) seems require more work in the IRQ core and it can not work for all
> > > transports (e.g vDPA would be kind of difficult)
> > >
> > > Thanks
> >
> > Hmm I don't really get why would it be difficult.
> > VDPA is mostly PCI isn't it? With PCI both level INT#x and edge MSI
> > have interrupt masking support.
> 
> Yes, but consider the case of mlx5_vdpa, PCI stuff was hidden under
> the auxiliary bus. And that is the way another vendor will go.
> 
> Thanks

A bunch of callbacks will do it I guess.

> >
> >
> > > >
> > > >
> > > > > >
> > > > > >
> > > > > > > ---
> > > > > > > Changes since V2:
> > > > > > > - Tweak the Kconfig help
> > > > > > > - Add comment for the read_lock() pairing in virtio_ccw
> > > > > > > ---
> > > > > > >  drivers/s390/virtio/virtio_ccw.c |  9 ++++++++-
> > > > > > >  drivers/virtio/Kconfig           | 13 +++++++++++++
> > > > > > >  drivers/virtio/virtio.c          |  2 ++
> > > > > > >  drivers/virtio/virtio_ring.c     | 12 ++++++++++++
> > > > > > >  include/linux/virtio_config.h    |  2 ++
> > > > > > >  5 files changed, 37 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > index 97e51c34e6cf..1f6a358f65f0 100644
> > > > > > > --- a/drivers/s390/virtio/virtio_ccw.c
> > > > > > > +++ b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > @@ -1136,8 +1136,13 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
> > > > > > >                       vcdev->err = -EIO;
> > > > > > >       }
> > > > > > >       virtio_ccw_check_activity(vcdev, activity);
> > > > > > > -     /* Interrupts are disabled here */
> > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > > +     /*
> > > > > > > +      * Paried with virtio_ccw_synchronize_cbs() and interrupts are
> > > > > > > +      * disabled here.
> > > > > > > +      */
> > > > > > >       read_lock(&vcdev->irq_lock);
> > > > > > > +#endif
> > > > > > >       for_each_set_bit(i, indicators(vcdev),
> > > > > > >                        sizeof(*indicators(vcdev)) * BITS_PER_BYTE) {
> > > > > > >               /* The bit clear must happen before the vring kick. */
> > > > > > > @@ -1146,7 +1151,9 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
> > > > > > >               vq = virtio_ccw_vq_by_ind(vcdev, i);
> > > > > > >               vring_interrupt(0, vq);
> > > > > > >       }
> > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > >       read_unlock(&vcdev->irq_lock);
> > > > > > > +#endif
> > > > > > >       if (test_bit(0, indicators2(vcdev))) {
> > > > > > >               virtio_config_changed(&vcdev->vdev);
> > > > > > >               clear_bit(0, indicators2(vcdev));
> > > > > > > diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> > > > > > > index b5adf6abd241..c04f370a1e5c 100644
> > > > > > > --- a/drivers/virtio/Kconfig
> > > > > > > +++ b/drivers/virtio/Kconfig
> > > > > > > @@ -35,6 +35,19 @@ menuconfig VIRTIO_MENU
> > > > > > >
> > > > > > >  if VIRTIO_MENU
> > > > > > >
> > > > > > > +config VIRTIO_HARDEN_NOTIFICATION
> > > > > > > +        bool "Harden virtio notification"
> > > > > > > +        help
> > > > > > > +          Enable this to harden the device notifications and suppress
> > > > > > > +          those that happen at a time where notifications are illegal.
> > > > > > > +
> > > > > > > +          Experimental: Note that several drivers still have bugs that
> > > > > > > +          may cause crashes or hangs when correct handling of
> > > > > > > +          notifications is enforced; depending on the subset of
> > > > > > > +          drivers and devices you use, this may or may not work.
> > > > > > > +
> > > > > > > +          If unsure, say N.
> > > > > > > +
> > > > > > >  config VIRTIO_PCI
> > > > > > >       tristate "PCI driver for virtio devices"
> > > > > > >       depends on PCI
> > > > > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > > > > index ef04a96942bf..21dc08d2f32d 100644
> > > > > > > --- a/drivers/virtio/virtio.c
> > > > > > > +++ b/drivers/virtio/virtio.c
> > > > > > > @@ -220,6 +220,7 @@ static int virtio_features_ok(struct virtio_device *dev)
> > > > > > >   * */
> > > > > > >  void virtio_reset_device(struct virtio_device *dev)
> > > > > > >  {
> > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > >       /*
> > > > > > >        * The below virtio_synchronize_cbs() guarantees that any
> > > > > > >        * interrupt for this line arriving after
> > > > > > > @@ -228,6 +229,7 @@ void virtio_reset_device(struct virtio_device *dev)
> > > > > > >        */
> > > > > > >       virtio_break_device(dev);
> > > > > > >       virtio_synchronize_cbs(dev);
> > > > > > > +#endif
> > > > > > >
> > > > > > >       dev->config->reset(dev);
> > > > > > >  }
> > > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > > index 13a7348cedff..d9d3b6e201fb 100644
> > > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > > @@ -1688,7 +1688,11 @@ static struct virtqueue *vring_create_virtqueue_packed(
> > > > > > >       vq->we_own_ring = true;
> > > > > > >       vq->notify = notify;
> > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > >       vq->broken = true;
> > > > > > > +#else
> > > > > > > +     vq->broken = false;
> > > > > > > +#endif
> > > > > > >       vq->last_used_idx = 0;
> > > > > > >       vq->event_triggered = false;
> > > > > > >       vq->num_added = 0;
> > > > > > > @@ -2135,9 +2139,13 @@ irqreturn_t vring_interrupt(int irq, void *_vq)
> > > > > > >       }
> > > > > > >
> > > > > > >       if (unlikely(vq->broken)) {
> > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > >               dev_warn_once(&vq->vq.vdev->dev,
> > > > > > >                             "virtio vring IRQ raised before DRIVER_OK");
> > > > > > >               return IRQ_NONE;
> > > > > > > +#else
> > > > > > > +             return IRQ_HANDLED;
> > > > > > > +#endif
> > > > > > >       }
> > > > > > >
> > > > > > >       /* Just a hint for performance: so it's ok that this can be racy! */
> > > > > > > @@ -2180,7 +2188,11 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > > > > > >       vq->we_own_ring = false;
> > > > > > >       vq->notify = notify;
> > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > >       vq->broken = true;
> > > > > > > +#else
> > > > > > > +     vq->broken = false;
> > > > > > > +#endif
> > > > > > >       vq->last_used_idx = 0;
> > > > > > >       vq->event_triggered = false;
> > > > > > >       vq->num_added = 0;
> > > > > > > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> > > > > > > index 9a36051ceb76..d15c3cdda2d2 100644
> > > > > > > --- a/include/linux/virtio_config.h
> > > > > > > +++ b/include/linux/virtio_config.h
> > > > > > > @@ -257,6 +257,7 @@ void virtio_device_ready(struct virtio_device *dev)
> > > > > > >
> > > > > > >       WARN_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > >
> > > > > > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > > > > >       /*
> > > > > > >        * The virtio_synchronize_cbs() makes sure vring_interrupt()
> > > > > > >        * will see the driver specific setup if it sees vq->broken
> > > > > > > @@ -264,6 +265,7 @@ void virtio_device_ready(struct virtio_device *dev)
> > > > > > >        */
> > > > > > >       virtio_synchronize_cbs(dev);
> > > > > > >       __virtio_unbreak_device(dev);
> > > > > > > +#endif
> > > > > > >       /*
> > > > > > >        * The transport should ensure the visibility of vq->broken
> > > > > > >        * before setting DRIVER_OK. See the comments for the transport
> > > > > > > --
> > > > > > > 2.25.1
> > > > > >
> > > >
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
