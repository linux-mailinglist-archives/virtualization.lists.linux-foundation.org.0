Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7781F559377
	for <lists.virtualization@lfdr.de>; Fri, 24 Jun 2022 08:32:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08E0641B30;
	Fri, 24 Jun 2022 06:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E0641B30
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TrhPxSnN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3n0Fv8eyM_r; Fri, 24 Jun 2022 06:31:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 23F2242573;
	Fri, 24 Jun 2022 06:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23F2242573
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71378C0081;
	Fri, 24 Jun 2022 06:31:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 280ECC002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 06:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E94BF848AD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 06:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94BF848AD
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=TrhPxSnN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbiRsEyjaybT
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 06:31:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F23ED848AC
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F23ED848AC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 06:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656052314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fkwre6WoTaZ3HcBGKyAfeqBPtQ+kpW2QzG2weDAdapc=;
 b=TrhPxSnNbmwPQFVobh95xt8FQnfueDEpAg9bdRWsXqSjmpDGr+R/Cmkg6EMAyG3uCq1lhM
 Sdli+14Srnb8HC2/8ylfqSDnfJloKl12Oepe7DMUnwD8BlWVPkN683p3B8LxfTvO+RXHd4
 daCwYStVBMGbOaT04V9x3HBcwCaXKqw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-lFgkMjusPXeNASckDKZe2g-1; Fri, 24 Jun 2022 02:31:53 -0400
X-MC-Unique: lFgkMjusPXeNASckDKZe2g-1
Received: by mail-wm1-f71.google.com with SMTP id
 i5-20020a1c3b05000000b003a02b027e53so2581833wma.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 23:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fkwre6WoTaZ3HcBGKyAfeqBPtQ+kpW2QzG2weDAdapc=;
 b=5hENqgCk4Cybm0I1hbbi54C9cYpDVw2CzCKrP4E06PD3XpjSVae0mwTxv94rMG6JrQ
 T1ZYyaOpf23FCBDz2eNYGNt4h9CEusQRiH89K6DIgT4cfagtEpLp6BIX7FqEyiQf9XMf
 p7wBhKUcMbDw+FZHyH+AzQQDbQpDmCqBVEc8ZeXs1IY2jUZg8dmIJR22+r8/p2yPfyNX
 zv/zq34R8+HKZuyLME+Yj+fdF0p2aUFBJklKVfCtS99HliC7NMIIIiBVl6JvJicYFonN
 h/dzzaqn3IXuFTPTx94wI8ptiSH6Sb/eZY9mMfdSoYXfzUSu1hzssXJeESEH4RGrBLBb
 bbaQ==
X-Gm-Message-State: AJIora/8dbNcueUr0XYce+Kgf4kS/xPxr1ioRAmYfg75GQdXLThFgq6g
 6E80KeclE+TjGdkFZLjWwEsGIttiFoVyF+wgtTiwTbanzpTPqMQR5we/IjXj4Vv83dRpJeaj6ag
 xC3ciFZDMvWHYCXk7hm8r8SqgdZP9/0CTdaHZHid28g==
X-Received: by 2002:a5d:6481:0:b0:219:8930:6e48 with SMTP id
 o1-20020a5d6481000000b0021989306e48mr11516423wri.574.1656052312304; 
 Thu, 23 Jun 2022 23:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vRwBTxtgCODqWGWtTx/7SSJNNx7vYLqsQ5RQvPSrwfQn6gMWJQbS/U+j9i6mC+QbxjMDDN1g==
X-Received: by 2002:a5d:6481:0:b0:219:8930:6e48 with SMTP id
 o1-20020a5d6481000000b0021989306e48mr11516397wri.574.1656052311996; 
 Thu, 23 Jun 2022 23:31:51 -0700 (PDT)
Received: from redhat.com ([2.55.188.216]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c35d500b003a02f957245sm5754978wmq.26.2022.06.23.23.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 23:31:51 -0700 (PDT)
Date: Fri, 24 Jun 2022 02:31:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3] virtio: disable notification hardening by default
Message-ID: <20220624022622-mutt-send-email-mst@kernel.org>
References: <20220622012940.21441-1-jasowang@redhat.com>
 <20220622025047-mutt-send-email-mst@kernel.org>
 <CACGkMEtJY2ioD0L8ifTrCPatG6-NqQ01V=d2L1FeoweKV74LaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtJY2ioD0L8ifTrCPatG6-NqQ01V=d2L1FeoweKV74LaA@mail.gmail.com>
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

On Wed, Jun 22, 2022 at 03:09:31PM +0800, Jason Wang wrote:
> On Wed, Jun 22, 2022 at 3:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Jun 22, 2022 at 09:29:40AM +0800, Jason Wang wrote:
> > > We try to harden virtio device notifications in 8b4ec69d7e09 ("virtio:
> > > harden vring IRQ"). It works with the assumption that the driver or
> > > core can properly call virtio_device_ready() at the right
> > > place. Unfortunately, this seems to be not true and uncover various
> > > bugs of the existing drivers, mainly the issue of using
> > > virtio_device_ready() incorrectly.
> > >
> > > So let's having a Kconfig option and disable it by default. It gives
> > > us a breath to fix the drivers and then we can consider to enable it
> > > by default.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> >
> >
> > OK I will queue, but I think the problem is fundamental.
> 
> If I understand correctly, you want some core IRQ work?

Yes.

> As discussed
> before, it doesn't solve all the problems, we still need to do per
> driver audit.
> 
> Thanks

Maybe, but we don't need to tie things to device_ready then.
We can do

- disable irqs
- device ready
- setup everything
- enable irqs


and this works for most things, the only issue is
this deadlocks if "setup everything" waits for interrupts.


With the current approach there's really no good time:
1.- setup everything
- device ready

can cause kicks before device is ready

2.- device ready
- setup everything

can cause callbacks before setup.

So I prefer the 1. and fix the hardening in the core.


> >
> >
> > > ---
> > > Changes since V2:
> > > - Tweak the Kconfig help
> > > - Add comment for the read_lock() pairing in virtio_ccw
> > > ---
> > >  drivers/s390/virtio/virtio_ccw.c |  9 ++++++++-
> > >  drivers/virtio/Kconfig           | 13 +++++++++++++
> > >  drivers/virtio/virtio.c          |  2 ++
> > >  drivers/virtio/virtio_ring.c     | 12 ++++++++++++
> > >  include/linux/virtio_config.h    |  2 ++
> > >  5 files changed, 37 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > > index 97e51c34e6cf..1f6a358f65f0 100644
> > > --- a/drivers/s390/virtio/virtio_ccw.c
> > > +++ b/drivers/s390/virtio/virtio_ccw.c
> > > @@ -1136,8 +1136,13 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
> > >                       vcdev->err = -EIO;
> > >       }
> > >       virtio_ccw_check_activity(vcdev, activity);
> > > -     /* Interrupts are disabled here */
> > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > > +     /*
> > > +      * Paried with virtio_ccw_synchronize_cbs() and interrupts are
> > > +      * disabled here.
> > > +      */
> > >       read_lock(&vcdev->irq_lock);
> > > +#endif
> > >       for_each_set_bit(i, indicators(vcdev),
> > >                        sizeof(*indicators(vcdev)) * BITS_PER_BYTE) {
> > >               /* The bit clear must happen before the vring kick. */
> > > @@ -1146,7 +1151,9 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
> > >               vq = virtio_ccw_vq_by_ind(vcdev, i);
> > >               vring_interrupt(0, vq);
> > >       }
> > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > >       read_unlock(&vcdev->irq_lock);
> > > +#endif
> > >       if (test_bit(0, indicators2(vcdev))) {
> > >               virtio_config_changed(&vcdev->vdev);
> > >               clear_bit(0, indicators2(vcdev));
> > > diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> > > index b5adf6abd241..c04f370a1e5c 100644
> > > --- a/drivers/virtio/Kconfig
> > > +++ b/drivers/virtio/Kconfig
> > > @@ -35,6 +35,19 @@ menuconfig VIRTIO_MENU
> > >
> > >  if VIRTIO_MENU
> > >
> > > +config VIRTIO_HARDEN_NOTIFICATION
> > > +        bool "Harden virtio notification"
> > > +        help
> > > +          Enable this to harden the device notifications and suppress
> > > +          those that happen at a time where notifications are illegal.
> > > +
> > > +          Experimental: Note that several drivers still have bugs that
> > > +          may cause crashes or hangs when correct handling of
> > > +          notifications is enforced; depending on the subset of
> > > +          drivers and devices you use, this may or may not work.
> > > +
> > > +          If unsure, say N.
> > > +
> > >  config VIRTIO_PCI
> > >       tristate "PCI driver for virtio devices"
> > >       depends on PCI
> > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > index ef04a96942bf..21dc08d2f32d 100644
> > > --- a/drivers/virtio/virtio.c
> > > +++ b/drivers/virtio/virtio.c
> > > @@ -220,6 +220,7 @@ static int virtio_features_ok(struct virtio_device *dev)
> > >   * */
> > >  void virtio_reset_device(struct virtio_device *dev)
> > >  {
> > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > >       /*
> > >        * The below virtio_synchronize_cbs() guarantees that any
> > >        * interrupt for this line arriving after
> > > @@ -228,6 +229,7 @@ void virtio_reset_device(struct virtio_device *dev)
> > >        */
> > >       virtio_break_device(dev);
> > >       virtio_synchronize_cbs(dev);
> > > +#endif
> > >
> > >       dev->config->reset(dev);
> > >  }
> > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > index 13a7348cedff..d9d3b6e201fb 100644
> > > --- a/drivers/virtio/virtio_ring.c
> > > +++ b/drivers/virtio/virtio_ring.c
> > > @@ -1688,7 +1688,11 @@ static struct virtqueue *vring_create_virtqueue_packed(
> > >       vq->we_own_ring = true;
> > >       vq->notify = notify;
> > >       vq->weak_barriers = weak_barriers;
> > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > >       vq->broken = true;
> > > +#else
> > > +     vq->broken = false;
> > > +#endif
> > >       vq->last_used_idx = 0;
> > >       vq->event_triggered = false;
> > >       vq->num_added = 0;
> > > @@ -2135,9 +2139,13 @@ irqreturn_t vring_interrupt(int irq, void *_vq)
> > >       }
> > >
> > >       if (unlikely(vq->broken)) {
> > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > >               dev_warn_once(&vq->vq.vdev->dev,
> > >                             "virtio vring IRQ raised before DRIVER_OK");
> > >               return IRQ_NONE;
> > > +#else
> > > +             return IRQ_HANDLED;
> > > +#endif
> > >       }
> > >
> > >       /* Just a hint for performance: so it's ok that this can be racy! */
> > > @@ -2180,7 +2188,11 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > >       vq->we_own_ring = false;
> > >       vq->notify = notify;
> > >       vq->weak_barriers = weak_barriers;
> > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > >       vq->broken = true;
> > > +#else
> > > +     vq->broken = false;
> > > +#endif
> > >       vq->last_used_idx = 0;
> > >       vq->event_triggered = false;
> > >       vq->num_added = 0;
> > > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> > > index 9a36051ceb76..d15c3cdda2d2 100644
> > > --- a/include/linux/virtio_config.h
> > > +++ b/include/linux/virtio_config.h
> > > @@ -257,6 +257,7 @@ void virtio_device_ready(struct virtio_device *dev)
> > >
> > >       WARN_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
> > >
> > > +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > >       /*
> > >        * The virtio_synchronize_cbs() makes sure vring_interrupt()
> > >        * will see the driver specific setup if it sees vq->broken
> > > @@ -264,6 +265,7 @@ void virtio_device_ready(struct virtio_device *dev)
> > >        */
> > >       virtio_synchronize_cbs(dev);
> > >       __virtio_unbreak_device(dev);
> > > +#endif
> > >       /*
> > >        * The transport should ensure the visibility of vq->broken
> > >        * before setting DRIVER_OK. See the comments for the transport
> > > --
> > > 2.25.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
