Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ACE548319
	for <lists.virtualization@lfdr.de>; Mon, 13 Jun 2022 11:28:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FCE341604;
	Mon, 13 Jun 2022 09:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5ZYNlEmrxla; Mon, 13 Jun 2022 09:28:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1CB1E4161E;
	Mon, 13 Jun 2022 09:28:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62B23C0081;
	Mon, 13 Jun 2022 09:28:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1464DC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jun 2022 09:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0348C607BC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jun 2022 09:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jODlUj9ZFTb
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jun 2022 09:28:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7800A6061B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jun 2022 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655112485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2nn+23e8/YcXqa3zZDXdt2e26IdoAgB+/lGnAeSUV5U=;
 b=LqORi320vCn2nR/VZdGiukYcsGJ6BkqwOhVm5QX9zHgbJ5EFHNbl/Lc5hDHWhorm7wezmr
 XPkKp9xCUqiYAFNj0r1KUPGRDgzoEVRBdWfSIv1QtVf0sOo/p1/S4n/LqsBnO6hibU9ZpO
 5Q8HVW2Gw0XTuVwLKnympbnMsrLUZzs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-1rhzgShYMKyv6gOclvGZQw-1; Mon, 13 Jun 2022 05:28:03 -0400
X-MC-Unique: 1rhzgShYMKyv6gOclvGZQw-1
Received: by mail-ed1-f70.google.com with SMTP id
 x15-20020a05640226cf00b004318eab9feaso3633853edd.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jun 2022 02:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2nn+23e8/YcXqa3zZDXdt2e26IdoAgB+/lGnAeSUV5U=;
 b=uO3jUNmHu0sDtBbIhFywN1keInGzTXaENZCAok3IuP6v1JXbjCntJsMu0SIH6RPh0P
 yaaDW8pwxKq3/2YjDrL1ktao9uZQ6DqmYR9QVVxJ8IkYS9Fl1DmQ3h32zWC2dRLrbLT4
 gERDye1rfdZuViAbJKKUpvHDp1QJGoZB3sHpxg95GAeRpA2j6jAEgVwSvwzk91kFyMpO
 xfJzUAPwYdhvVn1xL9hjtvXaNCp0DfgLmEyHA8B/ONBfFjGHTP2RF53KusWVQbOY+Ut+
 gYxh0Q+Xxip9bbESDGWKt8IF08Ae2+HHW8g79kpbIJexRCeTZFskgAtRc3V4q9qgxYyL
 lmvg==
X-Gm-Message-State: AOAM532HlPX0XugTSIMQOs6Rg2J0aI67dLl0trE3FAREgpb/Ig4s1I0h
 fVXc9bP3aPUq8RQ0S8ormPZTZrmWTRmYduC6EJfPRFHy2zr8wOLN+trNca8KqLyBsHHM2/7L6S2
 75P4cvyCiuYPSXY9Xx4mzClMV792WTUpf/MnXqiKlZA==
X-Received: by 2002:a17:906:72c5:b0:711:d2cb:28b0 with SMTP id
 m5-20020a17090672c500b00711d2cb28b0mr33988945ejl.229.1655112482502; 
 Mon, 13 Jun 2022 02:28:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoanNHzdE7z/rxDV6q8BRDYhnhO/jlyFDR77cGzs7yekmd1V75CPi8wPvJA1z+L4fSwkJ4dg==
X-Received: by 2002:a17:906:72c5:b0:711:d2cb:28b0 with SMTP id
 m5-20020a17090672c500b00711d2cb28b0mr33988921ejl.229.1655112482208; 
 Mon, 13 Jun 2022 02:28:02 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:107c:be5a:1a30:9f6d:4400:4adc])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a50ec84000000b0042617ba63basm4508287edr.68.2022.06.13.02.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 02:28:01 -0700 (PDT)
Date: Mon, 13 Jun 2022 05:27:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V6 8/9] virtio: harden vring IRQ
Message-ID: <20220613052644-mutt-send-email-mst@kernel.org>
References: <20220527060120.20964-9-jasowang@redhat.com>
 <20220611010747-mutt-send-email-mst@kernel.org>
 <CACGkMEtRP+0Xy63g0SF_y1avv=3rFv6P9+Z7kp9XBS5d+_py8w@mail.gmail.com>
 <20220613023337-mutt-send-email-mst@kernel.org>
 <CACGkMEs05ZisiPW+7H6Omp80MzmZWZCpc1mf5Vd99C3H-KUtgA@mail.gmail.com>
 <20220613041416-mutt-send-email-mst@kernel.org>
 <CACGkMEsT_fWdPxN1cTWOX=vu-ntp3Xo4j46-ZKALeSXr7DmJFQ@mail.gmail.com>
 <20220613045606-mutt-send-email-mst@kernel.org>
 <CACGkMEtAQck7Nr6SP_pD0MGT3njnwZSyT=xPyYzUU3c5GNNM_w@mail.gmail.com>
 <CACGkMEvUFJkC=mnvL2PSH6-3RMcJUk84f-9X46JVcj2vTAr4SQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvUFJkC=mnvL2PSH6-3RMcJUk84f-9X46JVcj2vTAr4SQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Peter Oberparleiter <oberpar@linux.ibm.com>, Cindy Lu <lulu@redhat.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Halil Pasic <pasic@linux.ibm.com>, eperezma <eperezma@redhat.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
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

On Mon, Jun 13, 2022 at 05:14:59PM +0800, Jason Wang wrote:
> On Mon, Jun 13, 2022 at 5:08 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Mon, Jun 13, 2022 at 4:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Jun 13, 2022 at 04:51:08PM +0800, Jason Wang wrote:
> > > > On Mon, Jun 13, 2022 at 4:19 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Mon, Jun 13, 2022 at 04:07:09PM +0800, Jason Wang wrote:
> > > > > > On Mon, Jun 13, 2022 at 3:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, Jun 13, 2022 at 01:26:59PM +0800, Jason Wang wrote:
> > > > > > > > On Sat, Jun 11, 2022 at 1:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, May 27, 2022 at 02:01:19PM +0800, Jason Wang wrote:
> > > > > > > > > > This is a rework on the previous IRQ hardening that is done for
> > > > > > > > > > virtio-pci where several drawbacks were found and were reverted:
> > > > > > > > > >
> > > > > > > > > > 1) try to use IRQF_NO_AUTOEN which is not friendly to affinity managed IRQ
> > > > > > > > > >    that is used by some device such as virtio-blk
> > > > > > > > > > 2) done only for PCI transport
> > > > > > > > > >
> > > > > > > > > > The vq->broken is re-used in this patch for implementing the IRQ
> > > > > > > > > > hardening. The vq->broken is set to true during both initialization
> > > > > > > > > > and reset. And the vq->broken is set to false in
> > > > > > > > > > virtio_device_ready(). Then vring_interrupt() can check and return
> > > > > > > > > > when vq->broken is true. And in this case, switch to return IRQ_NONE
> > > > > > > > > > to let the interrupt core aware of such invalid interrupt to prevent
> > > > > > > > > > IRQ storm.
> > > > > > > > > >
> > > > > > > > > > The reason of using a per queue variable instead of a per device one
> > > > > > > > > > is that we may need it for per queue reset hardening in the future.
> > > > > > > > > >
> > > > > > > > > > Note that the hardening is only done for vring interrupt since the
> > > > > > > > > > config interrupt hardening is already done in commit 22b7050a024d7
> > > > > > > > > > ("virtio: defer config changed notifications"). But the method that is
> > > > > > > > > > used by config interrupt can't be reused by the vring interrupt
> > > > > > > > > > handler because it uses spinlock to do the synchronization which is
> > > > > > > > > > expensive.
> > > > > > > > > >
> > > > > > > > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > > > > > > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > > > > > > > > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > > > > > > > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > > > > > > > Cc: Halil Pasic <pasic@linux.ibm.com>
> > > > > > > > > > Cc: Cornelia Huck <cohuck@redhat.com>
> > > > > > > > > > Cc: Vineeth Vijayan <vneethv@linux.ibm.com>
> > > > > > > > > > Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> > > > > > > > > > Cc: linux-s390@vger.kernel.org
> > > > > > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Jason, I am really concerned by all the fallout.
> > > > > > > > > I propose adding a flag to suppress the hardening -
> > > > > > > > > this will be a debugging aid and a work around for
> > > > > > > > > users if we find more buggy drivers.
> > > > > > > > >
> > > > > > > > > suppress_interrupt_hardening ?
> > > > > > > >
> > > > > > > > I can post a patch but I'm afraid if we disable it by default, it
> > > > > > > > won't be used by the users so there's no way for us to receive the bug
> > > > > > > > report. Or we need a plan to enable it by default.
> > > > > > > >
> > > > > > > > It's rc2, how about waiting for 1 and 2 rc? Or it looks better if we
> > > > > > > > simply warn instead of disable it by default.
> > > > > > > >
> > > > > > > > Thanks
> > > > > > >
> > > > > > > I meant more like a flag in struct virtio_driver.
> > > > > > > For now, could you audit all drivers which don't call _ready?
> > > > > > > I found 5 of these:
> > > > > > >
> > > > > > > drivers/bluetooth/virtio_bt.c
> > > > > >
> > > > > > This driver seems to be fine, it doesn't use the device/vq in its probe().
> > > > >
> > > > >
> > > > > But it calls hci_register_dev and that in turn queues all kind of
> > > > > work. Also, can linux start using the device immediately after
> > > > > it's registered?
> > > >
> > > > So I think the driver is allowed to queue before DRIVER_OK.
> > >
> > > it's not allowed to kick
> >
> > Yes.
> >
> > >
> > > > If yes,
> > > > the only side effect is the delay of the tx interrupt after DRIVER_OK
> > > > for a well behaved device.
> > >
> > > your patches drop the interrupt though, it won't be just delayed.
> >
> > For a well behaved device, it can only trigger the interrupt after DRIVER_OK.
> >
> > So for virtio bt, it works like:
> >
> > 1) driver queue buffer and kick
> > 2) driver set DRIVER_OK
> > 3) device start to process the buffer
> > 4) device send an notification
> >
> > The only risk is that the virtqueue could be filled before DRIVER_OK,
> > or anything I missed?
> 
> btw, hci has an open and close method and we do rx refill in
> hdev->open, so we're probably fine here.
> 
> Thanks


Sounds good. Now to audit the rest of them from this POV ;)

 drivers/i2c/busses/i2c-virtio.c
 drivers/net/caif/caif_virtio.c
 drivers/nvdimm/virtio_pmem.c
 arm_scmi
 virtio_rpmsg_bus.c



> >
> > >
> > > > If not, we need to clarify it in the spec
> > > > and call virtio_device_ready() before subsystem registration.
> > >
> > > hmm, i don't get what we need to clarify
> >
> > E.g the driver is not allowed to kick or after DRIVER_OK should the
> > device only process the buffer after a kick after DRIVER_OK (I think
> > no)?
> >
> > >
> > > > >
> > > > >
> > > > > > > drivers/gpu/drm/virtio/virtgpu_drv.c
> > > > > >
> > > > > > It calles virtio_device_ready() in virtio_gpu_init(), and it looks to
> > > > > > me the code is correct.
> > > > >
> > > > > OK.
> > > > >
> > > > > > > drivers/i2c/busses/i2c-virtio.c
> > > > > > > drivers/net/caif/caif_virtio.c
> > > > > > > drivers/nvdimm/virtio_pmem.c
> > > > > >
> > > > > > The above looks fine and we have three more:
> > > > > >
> > > > > > arm_scmi: probe() doesn't use vq
> > > > > > mac80211_hwsim.c: doesn't use vq (only fill rx), but it kicks the rx,
> > > > > > it looks to me we need a device_ready before the kick.
> > > > > > virtio_rpmsg_bus.c: doesn't use vq
> > > > > >
> > > > > > I will post a patch for mac80211_hwsim.c.
> > > > > > Thanks
> > > > >
> > > > > Same comments for all of the above. Might linux not start using the
> > > > > device once it's registered?
> > > >
> > > > It depends on the specific subsystem.
> > > >
> > > > For the subsystem that can't use the device immediately, calling
> > > > virtio_device_ready() after the subsystem's registration should be
> > > > fine. E.g for the networking subsystem, the TX won't happen if
> > > > ndo_open() is not called, calling virtio_device_ready() after
> > > > netdev_register() seems to be fine.
> > >
> > > exactly
> > >
> > > > For the subsystem that can use the device immediately, if the
> > > > subsystem does not depend on the result of a request in the probe to
> > > > proceed, we are still fine. Since those requests will be proceed after
> > > > DRIVER_OK.
> > >
> > > Well first won't driver code normally kick as well?
> >
> > Kick itself is not blocked.
> >
> > > And without kick, won't everything just be blocked?
> >
> > It depends on the subsystem. E.g driver can choose to use a callback
> > instead of polling the used buffer in the probe.
> >
> > >
> > >
> > > > For the rest we need to do virtio_device_ready() before registration.
> > > >
> > > > Thanks
> > >
> > > Then we can get an interrupt for an unregistered device.
> >
> > It depends on the device. For the device that doesn't have an rx queue
> > (or device to driver queue), we are fine:
> >
> > E.g in virtio-blk:
> >
> >         virtio_device_ready(vdev);
> >
> >         err = device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
> >         if (err)
> >                 goto out_cleanup_disk;
> >
> > Thanks
> >
> > >
> > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > >  drivers/s390/virtio/virtio_ccw.c       |  4 ++++
> > > > > > > > > >  drivers/virtio/virtio.c                | 15 ++++++++++++---
> > > > > > > > > >  drivers/virtio/virtio_mmio.c           |  5 +++++
> > > > > > > > > >  drivers/virtio/virtio_pci_modern_dev.c |  5 +++++
> > > > > > > > > >  drivers/virtio/virtio_ring.c           | 11 +++++++----
> > > > > > > > > >  include/linux/virtio_config.h          | 20 ++++++++++++++++++++
> > > > > > > > > >  6 files changed, 53 insertions(+), 7 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > > > index c188e4f20ca3..97e51c34e6cf 100644
> > > > > > > > > > --- a/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > > > +++ b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > > > @@ -971,6 +971,10 @@ static void virtio_ccw_set_status(struct virtio_device *vdev, u8 status)
> > > > > > > > > >       ccw->flags = 0;
> > > > > > > > > >       ccw->count = sizeof(status);
> > > > > > > > > >       ccw->cda = (__u32)(unsigned long)&vcdev->dma_area->status;
> > > > > > > > > > +     /* We use ssch for setting the status which is a serializing
> > > > > > > > > > +      * instruction that guarantees the memory writes have
> > > > > > > > > > +      * completed before ssch.
> > > > > > > > > > +      */
> > > > > > > > > >       ret = ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_WRITE_STATUS);
> > > > > > > > > >       /* Write failed? We assume status is unchanged. */
> > > > > > > > > >       if (ret)
> > > > > > > > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > > > > > > > index aa1eb5132767..95fac4c97c8b 100644
> > > > > > > > > > --- a/drivers/virtio/virtio.c
> > > > > > > > > > +++ b/drivers/virtio/virtio.c
> > > > > > > > > > @@ -220,6 +220,15 @@ static int virtio_features_ok(struct virtio_device *dev)
> > > > > > > > > >   * */
> > > > > > > > > >  void virtio_reset_device(struct virtio_device *dev)
> > > > > > > > > >  {
> > > > > > > > > > +     /*
> > > > > > > > > > +      * The below virtio_synchronize_cbs() guarantees that any
> > > > > > > > > > +      * interrupt for this line arriving after
> > > > > > > > > > +      * virtio_synchronize_vqs() has completed is guaranteed to see
> > > > > > > > > > +      * vq->broken as true.
> > > > > > > > > > +      */
> > > > > > > > > > +     virtio_break_device(dev);
> > > > > > > > >
> > > > > > > > > So make this conditional
> > > > > > > > >
> > > > > > > > > > +     virtio_synchronize_cbs(dev);
> > > > > > > > > > +
> > > > > > > > > >       dev->config->reset(dev);
> > > > > > > > > >  }
> > > > > > > > > >  EXPORT_SYMBOL_GPL(virtio_reset_device);
> > > > > > > > > > @@ -428,6 +437,9 @@ int register_virtio_device(struct virtio_device *dev)
> > > > > > > > > >       dev->config_enabled = false;
> > > > > > > > > >       dev->config_change_pending = false;
> > > > > > > > > >
> > > > > > > > > > +     INIT_LIST_HEAD(&dev->vqs);
> > > > > > > > > > +     spin_lock_init(&dev->vqs_list_lock);
> > > > > > > > > > +
> > > > > > > > > >       /* We always start by resetting the device, in case a previous
> > > > > > > > > >        * driver messed it up.  This also tests that code path a little. */
> > > > > > > > > >       virtio_reset_device(dev);
> > > > > > > > > > @@ -435,9 +447,6 @@ int register_virtio_device(struct virtio_device *dev)
> > > > > > > > > >       /* Acknowledge that we've seen the device. */
> > > > > > > > > >       virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
> > > > > > > > > >
> > > > > > > > > > -     INIT_LIST_HEAD(&dev->vqs);
> > > > > > > > > > -     spin_lock_init(&dev->vqs_list_lock);
> > > > > > > > > > -
> > > > > > > > > >       /*
> > > > > > > > > >        * device_add() causes the bus infrastructure to look for a matching
> > > > > > > > > >        * driver.
> > > > > > > > > > diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> > > > > > > > > > index c9699a59f93c..f9a36bc7ac27 100644
> > > > > > > > > > --- a/drivers/virtio/virtio_mmio.c
> > > > > > > > > > +++ b/drivers/virtio/virtio_mmio.c
> > > > > > > > > > @@ -253,6 +253,11 @@ static void vm_set_status(struct virtio_device *vdev, u8 status)
> > > > > > > > > >       /* We should never be setting status to 0. */
> > > > > > > > > >       BUG_ON(status == 0);
> > > > > > > > > >
> > > > > > > > > > +     /*
> > > > > > > > > > +      * Per memory-barriers.txt, wmb() is not needed to guarantee
> > > > > > > > > > +      * that the the cache coherent memory writes have completed
> > > > > > > > > > +      * before writing to the MMIO region.
> > > > > > > > > > +      */
> > > > > > > > > >       writel(status, vm_dev->base + VIRTIO_MMIO_STATUS);
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
> > > > > > > > > > index 4093f9cca7a6..a0fa14f28a7f 100644
> > > > > > > > > > --- a/drivers/virtio/virtio_pci_modern_dev.c
> > > > > > > > > > +++ b/drivers/virtio/virtio_pci_modern_dev.c
> > > > > > > > > > @@ -467,6 +467,11 @@ void vp_modern_set_status(struct virtio_pci_modern_device *mdev,
> > > > > > > > > >  {
> > > > > > > > > >       struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
> > > > > > > > > >
> > > > > > > > > > +     /*
> > > > > > > > > > +      * Per memory-barriers.txt, wmb() is not needed to guarantee
> > > > > > > > > > +      * that the the cache coherent memory writes have completed
> > > > > > > > > > +      * before writing to the MMIO region.
> > > > > > > > > > +      */
> > > > > > > > > >       vp_iowrite8(status, &cfg->device_status);
> > > > > > > > > >  }
> > > > > > > > > >  EXPORT_SYMBOL_GPL(vp_modern_set_status);
> > > > > > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > > > > > index 9c231e1fded7..13a7348cedff 100644
> > > > > > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > > > > > @@ -1688,7 +1688,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
> > > > > > > > > >       vq->we_own_ring = true;
> > > > > > > > > >       vq->notify = notify;
> > > > > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > > > > -     vq->broken = false;
> > > > > > > > > > +     vq->broken = true;
> > > > > > > > > >       vq->last_used_idx = 0;
> > > > > > > > > >       vq->event_triggered = false;
> > > > > > > > > >       vq->num_added = 0;
> > > > > > > > >
> > > > > > > > > and make this conditional
> > > > > > > > >
> > > > > > > > > > @@ -2134,8 +2134,11 @@ irqreturn_t vring_interrupt(int irq, void *_vq)
> > > > > > > > > >               return IRQ_NONE;
> > > > > > > > > >       }
> > > > > > > > > >
> > > > > > > > > > -     if (unlikely(vq->broken))
> > > > > > > > > > -             return IRQ_HANDLED;
> > > > > > > > > > +     if (unlikely(vq->broken)) {
> > > > > > > > > > +             dev_warn_once(&vq->vq.vdev->dev,
> > > > > > > > > > +                           "virtio vring IRQ raised before DRIVER_OK");
> > > > > > > > > > +             return IRQ_NONE;
> > > > > > > > > > +     }
> > > > > > > > > >
> > > > > > > > > >       /* Just a hint for performance: so it's ok that this can be racy! */
> > > > > > > > > >       if (vq->event)
> > > > > > > > > > @@ -2177,7 +2180,7 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > > > > > > > > >       vq->we_own_ring = false;
> > > > > > > > > >       vq->notify = notify;
> > > > > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > > > > -     vq->broken = false;
> > > > > > > > > > +     vq->broken = true;
> > > > > > > > > >       vq->last_used_idx = 0;
> > > > > > > > > >       vq->event_triggered = false;
> > > > > > > > > >       vq->num_added = 0;
> > > > > > > > >
> > > > > > > > > and make this conditional
> > > > > > > > >
> > > > > > > > > > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> > > > > > > > > > index 25be018810a7..d4edfd7d91bb 100644
> > > > > > > > > > --- a/include/linux/virtio_config.h
> > > > > > > > > > +++ b/include/linux/virtio_config.h
> > > > > > > > > > @@ -256,6 +256,26 @@ void virtio_device_ready(struct virtio_device *dev)
> > > > > > > > > >       unsigned status = dev->config->get_status(dev);
> > > > > > > > > >
> > > > > > > > > >       BUG_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > > > > > +
> > > > > > > > > > +     /*
> > > > > > > > > > +      * The virtio_synchronize_cbs() makes sure vring_interrupt()
> > > > > > > > > > +      * will see the driver specific setup if it sees vq->broken
> > > > > > > > > > +      * as false (even if the notifications come before DRIVER_OK).
> > > > > > > > > > +      */
> > > > > > > > > > +     virtio_synchronize_cbs(dev);
> > > > > > > > > > +     __virtio_unbreak_device(dev);
> > > > > > > > > > +     /*
> > > > > > > > > > +      * The transport should ensure the visibility of vq->broken
> > > > > > > > > > +      * before setting DRIVER_OK. See the comments for the transport
> > > > > > > > > > +      * specific set_status() method.
> > > > > > > > > > +      *
> > > > > > > > > > +      * A well behaved device will only notify a virtqueue after
> > > > > > > > > > +      * DRIVER_OK, this means the device should "see" the coherenct
> > > > > > > > > > +      * memory write that set vq->broken as false which is done by
> > > > > > > > > > +      * the driver when it sees DRIVER_OK, then the following
> > > > > > > > > > +      * driver's vring_interrupt() will see vq->broken as false so
> > > > > > > > > > +      * we won't lose any notification.
> > > > > > > > > > +      */
> > > > > > > > > >       dev->config->set_status(dev, status | VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > 2.25.1
> > > > > > > > >
> > > > > > >
> > > > >
> > >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
