Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 465AE54B285
	for <lists.virtualization@lfdr.de>; Tue, 14 Jun 2022 15:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D5E3831DA;
	Tue, 14 Jun 2022 13:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GRkrrsjKpD9r; Tue, 14 Jun 2022 13:51:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8DC1983218;
	Tue, 14 Jun 2022 13:51:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0343EC0081;
	Tue, 14 Jun 2022 13:51:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F016C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 13:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 093D4405FB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 13:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVKGg-yT3fwU
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 13:50:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2995240A45
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655214628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rC7JOMI1kZcMJpGTESTDQGGnTI5MrJ9FfRJGMxs3Nig=;
 b=SMTQ2wMzsieZ4BzMZX+RruOAxs8FWOlIQEvk8o9H3agKDo8l6Bq8Q0RbhBK3yGpXzbJmTi
 lx5Jscsz2cYeroQsRxYrM61L1xeP28zgHNDKnBlcdboirqg/igEs+kU/YBI9lainij2myU
 t6Rv9fFiXMaxIvsDXWACmvGyqAuo6os=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-zh9QuzKUNIuQ2QmPLhOCHg-1; Tue, 14 Jun 2022 09:50:27 -0400
X-MC-Unique: zh9QuzKUNIuQ2QmPLhOCHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 2-20020a1c0202000000b0039c94528746so1415949wmc.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 06:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rC7JOMI1kZcMJpGTESTDQGGnTI5MrJ9FfRJGMxs3Nig=;
 b=vpt+RFVJApKQFmmpxz8HzNhoVK2zSjshJ8xc+C8f7Gm4EKaZ1Zhbq3yZ2/y0NDo/aF
 /cQHiIhBJUmdHIrV6NycQ1yt+ktgxpq+P4Lo1Df2+LmZ4t5xHlJMGryjukgCsJ1t2g1b
 sqXI3RbqDnqXPbTlgmxyeMll85a0MwCx0kDUidNVx9FxAP2nRPNcriA7k3bjM8qUuXk2
 5noQmP6h8Re3J9L/jVqK4Ts991BQRjqWJBQBatdpmDFp9S2r3fX4F370satPLr5NzCZb
 HBKqFjxtVlzYPZlMKVyGLonk+NVUY3zjo2ORmgIMXAFsDDkJ7mNh6CBE5pQ5VCpnZ3Ou
 wSTA==
X-Gm-Message-State: AOAM5317tmFTq1/yxwxsyqJtfiZvplEtRJwJy/Aenhes5+ai5Bikzgy6
 8mxBf0dbLh9AKtcOS58csBgROvm+Z+Mn5D02bybh+U6WoQwqwJUjGciJD0Tab4pdvAr4t55XH6O
 m/8KkNGctKUyV9NylLvi5FALOGpJ3gmYuieVA2l+8FQ==
X-Received: by 2002:a05:600c:22c6:b0:39c:4746:904e with SMTP id
 6-20020a05600c22c600b0039c4746904emr4264120wmg.93.1655214626293; 
 Tue, 14 Jun 2022 06:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNZOgm0yYWkV13BQrMW+0sKNa2faw5op84EzP+Xrv4rsL9QQ25CTwXY5TNZUf71KBq8SQ5vQ==
X-Received: by 2002:a05:600c:22c6:b0:39c:4746:904e with SMTP id
 6-20020a05600c22c600b0039c4746904emr4264075wmg.93.1655214625946; 
 Tue, 14 Jun 2022 06:50:25 -0700 (PDT)
Received: from redhat.com ([147.235.216.28]) by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b002102e6b757csm14028929wrm.90.2022.06.14.06.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 06:50:25 -0700 (PDT)
Date: Tue, 14 Jun 2022 09:50:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V6 8/9] virtio: harden vring IRQ
Message-ID: <20220614094821-mutt-send-email-mst@kernel.org>
References: <CACGkMEtRP+0Xy63g0SF_y1avv=3rFv6P9+Z7kp9XBS5d+_py8w@mail.gmail.com>
 <20220613023337-mutt-send-email-mst@kernel.org>
 <CACGkMEs05ZisiPW+7H6Omp80MzmZWZCpc1mf5Vd99C3H-KUtgA@mail.gmail.com>
 <20220613041416-mutt-send-email-mst@kernel.org>
 <CACGkMEsT_fWdPxN1cTWOX=vu-ntp3Xo4j46-ZKALeSXr7DmJFQ@mail.gmail.com>
 <20220613045606-mutt-send-email-mst@kernel.org>
 <CACGkMEtAQck7Nr6SP_pD0MGT3njnwZSyT=xPyYzUU3c5GNNM_w@mail.gmail.com>
 <CACGkMEvUFJkC=mnvL2PSH6-3RMcJUk84f-9X46JVcj2vTAr4SQ@mail.gmail.com>
 <20220613052644-mutt-send-email-mst@kernel.org>
 <CACGkMEstGvhETXThuwO+tLVBuRgQb8uC_6DdAM8ZxOi5UKBRbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEstGvhETXThuwO+tLVBuRgQb8uC_6DdAM8ZxOi5UKBRbg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Peter Zijlstra <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Cindy Lu <lulu@redhat.com>,
 Marc Zyngier <maz@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 eperezma <eperezma@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-s390@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 virtualization <virtualization@lists.linux-foundation.org>,
 conghui.chen@intel.com, cristian.marussi@arm.com, pankaj.gupta.linux@gmail.com,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev <netdev@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, sudeep.holla@arm.com
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

On Tue, Jun 14, 2022 at 03:40:21PM +0800, Jason Wang wrote:
> On Mon, Jun 13, 2022 at 5:28 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 13, 2022 at 05:14:59PM +0800, Jason Wang wrote:
> > > On Mon, Jun 13, 2022 at 5:08 PM Jason Wang <jasowang@redhat.com> wrote:
> > > >
> > > > On Mon, Jun 13, 2022 at 4:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Mon, Jun 13, 2022 at 04:51:08PM +0800, Jason Wang wrote:
> > > > > > On Mon, Jun 13, 2022 at 4:19 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, Jun 13, 2022 at 04:07:09PM +0800, Jason Wang wrote:
> > > > > > > > On Mon, Jun 13, 2022 at 3:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, Jun 13, 2022 at 01:26:59PM +0800, Jason Wang wrote:
> > > > > > > > > > On Sat, Jun 11, 2022 at 1:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Fri, May 27, 2022 at 02:01:19PM +0800, Jason Wang wrote:
> > > > > > > > > > > > This is a rework on the previous IRQ hardening that is done for
> > > > > > > > > > > > virtio-pci where several drawbacks were found and were reverted:
> > > > > > > > > > > >
> > > > > > > > > > > > 1) try to use IRQF_NO_AUTOEN which is not friendly to affinity managed IRQ
> > > > > > > > > > > >    that is used by some device such as virtio-blk
> > > > > > > > > > > > 2) done only for PCI transport
> > > > > > > > > > > >
> > > > > > > > > > > > The vq->broken is re-used in this patch for implementing the IRQ
> > > > > > > > > > > > hardening. The vq->broken is set to true during both initialization
> > > > > > > > > > > > and reset. And the vq->broken is set to false in
> > > > > > > > > > > > virtio_device_ready(). Then vring_interrupt() can check and return
> > > > > > > > > > > > when vq->broken is true. And in this case, switch to return IRQ_NONE
> > > > > > > > > > > > to let the interrupt core aware of such invalid interrupt to prevent
> > > > > > > > > > > > IRQ storm.
> > > > > > > > > > > >
> > > > > > > > > > > > The reason of using a per queue variable instead of a per device one
> > > > > > > > > > > > is that we may need it for per queue reset hardening in the future.
> > > > > > > > > > > >
> > > > > > > > > > > > Note that the hardening is only done for vring interrupt since the
> > > > > > > > > > > > config interrupt hardening is already done in commit 22b7050a024d7
> > > > > > > > > > > > ("virtio: defer config changed notifications"). But the method that is
> > > > > > > > > > > > used by config interrupt can't be reused by the vring interrupt
> > > > > > > > > > > > handler because it uses spinlock to do the synchronization which is
> > > > > > > > > > > > expensive.
> > > > > > > > > > > >
> > > > > > > > > > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > > > > > > > > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > > > > > > > > > > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > > > > > > > > > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > > > > > > > > > Cc: Halil Pasic <pasic@linux.ibm.com>
> > > > > > > > > > > > Cc: Cornelia Huck <cohuck@redhat.com>
> > > > > > > > > > > > Cc: Vineeth Vijayan <vneethv@linux.ibm.com>
> > > > > > > > > > > > Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> > > > > > > > > > > > Cc: linux-s390@vger.kernel.org
> > > > > > > > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Jason, I am really concerned by all the fallout.
> > > > > > > > > > > I propose adding a flag to suppress the hardening -
> > > > > > > > > > > this will be a debugging aid and a work around for
> > > > > > > > > > > users if we find more buggy drivers.
> > > > > > > > > > >
> > > > > > > > > > > suppress_interrupt_hardening ?
> > > > > > > > > >
> > > > > > > > > > I can post a patch but I'm afraid if we disable it by default, it
> > > > > > > > > > won't be used by the users so there's no way for us to receive the bug
> > > > > > > > > > report. Or we need a plan to enable it by default.
> > > > > > > > > >
> > > > > > > > > > It's rc2, how about waiting for 1 and 2 rc? Or it looks better if we
> > > > > > > > > > simply warn instead of disable it by default.
> > > > > > > > > >
> > > > > > > > > > Thanks
> > > > > > > > >
> > > > > > > > > I meant more like a flag in struct virtio_driver.
> > > > > > > > > For now, could you audit all drivers which don't call _ready?
> > > > > > > > > I found 5 of these:
> > > > > > > > >
> > > > > > > > > drivers/bluetooth/virtio_bt.c
> > > > > > > >
> > > > > > > > This driver seems to be fine, it doesn't use the device/vq in its probe().
> > > > > > >
> > > > > > >
> > > > > > > But it calls hci_register_dev and that in turn queues all kind of
> > > > > > > work. Also, can linux start using the device immediately after
> > > > > > > it's registered?
> > > > > >
> > > > > > So I think the driver is allowed to queue before DRIVER_OK.
> > > > >
> > > > > it's not allowed to kick
> > > >
> > > > Yes.
> > > >
> > > > >
> > > > > > If yes,
> > > > > > the only side effect is the delay of the tx interrupt after DRIVER_OK
> > > > > > for a well behaved device.
> > > > >
> > > > > your patches drop the interrupt though, it won't be just delayed.
> > > >
> > > > For a well behaved device, it can only trigger the interrupt after DRIVER_OK.
> > > >
> > > > So for virtio bt, it works like:
> > > >
> > > > 1) driver queue buffer and kick
> > > > 2) driver set DRIVER_OK
> > > > 3) device start to process the buffer
> > > > 4) device send an notification
> > > >
> > > > The only risk is that the virtqueue could be filled before DRIVER_OK,
> > > > or anything I missed?
> > >
> > > btw, hci has an open and close method and we do rx refill in
> > > hdev->open, so we're probably fine here.
> > >
> > > Thanks
> >
> >
> > Sounds good. Now to audit the rest of them from this POV ;)
> 
> Adding maintainers.
> 
> >
> >  drivers/i2c/busses/i2c-virtio.c
> 
> It looks to me the device could be used immediately after
> i2c_add_adapter() return. So we probably need to add
> virtio_device_ready() before that. Fortunately, there's no rx vq in
> i2c and the callback looks safe if the callback is called before the
> i2c registration and after virtio_device_ready().
> 
> >  drivers/net/caif/caif_virtio.c
> 
> A networking device, RX is backed by vringh so we don't need to
> refill. TX is backed by virtio and is available until ndo_open. So
> it's fine to let the core to set DRIVER_OK after probe().

How about we just add an explicit ready in the driver anyway?
I think the implicit ready is just creating a mess as people
tend to forget to think about it.

> >  drivers/nvdimm/virtio_pmem.c
> 
> It doesn't use interrupt so far, so it has nothing to do with the IRQ hardening.
> 
> But the device could be used by the subsystem immediately after
> nvdimm_pmem_region_create(), this means the flush could be issued
> before DRIVER_OK. We need virtio_device_ready() before. We don't have
> a RX virtqueue and the callback looks safe if the callback is called
> after virtio_device_ready() but before the nvdimm region creating.
> 
> And it looks to me there's a race between the assignment of
> provider_data and virtio_pmem_flush(). If the flush was issued before
> the assignment we will end up with a NULL pointer dereference. This is
> something we need to fix.
> 
> >  arm_scmi
> 
> It looks to me the singleton device could be used by SCMI immediately after
> 
>         /* Ensure initialized scmi_vdev is visible */
>         smp_store_mb(scmi_vdev, vdev);
> 
> So we probably need to do virtio_device_ready() before that. It has an
> optional rx queue but the filling is done after the above assignment,
> so it's safe. And the callback looks safe is a callback is triggered
> after virtio_device_ready() buy before the above assignment.
> 
> >  virtio_rpmsg_bus.c
> >
> 
> This is somehow more complicated. It has an rx queue, the rx filling
> is done before virtio_device_ready() but the kick is done after. And
> it looks to me the device could be used by subsystem immediately
> rpmsg_virtio_add_ctrl_dev() returns.
> 
> This means, if we do virtio_device_ready() after
> rpmsg_virtio_add_ctrl_dev(), we may get kick before DRIVER_OK. If we
> do virtio_device_ready() before rpmsg_virtio_add_ctrl_dev(), there's a
> race between the callbacks and rpmsg_virtio_add_ctrl_dev() that could
> be exploited.
> 
> It requires more thoughts.
> 
> Thanks
> 
> >
> >
> > > >
> > > > >
> > > > > > If not, we need to clarify it in the spec
> > > > > > and call virtio_device_ready() before subsystem registration.
> > > > >
> > > > > hmm, i don't get what we need to clarify
> > > >
> > > > E.g the driver is not allowed to kick or after DRIVER_OK should the
> > > > device only process the buffer after a kick after DRIVER_OK (I think
> > > > no)?
> > > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > > > > drivers/gpu/drm/virtio/virtgpu_drv.c
> > > > > > > >
> > > > > > > > It calles virtio_device_ready() in virtio_gpu_init(), and it looks to
> > > > > > > > me the code is correct.
> > > > > > >
> > > > > > > OK.
> > > > > > >
> > > > > > > > > drivers/i2c/busses/i2c-virtio.c
> > > > > > > > > drivers/net/caif/caif_virtio.c
> > > > > > > > > drivers/nvdimm/virtio_pmem.c
> > > > > > > >
> > > > > > > > The above looks fine and we have three more:
> > > > > > > >
> > > > > > > > arm_scmi: probe() doesn't use vq
> > > > > > > > mac80211_hwsim.c: doesn't use vq (only fill rx), but it kicks the rx,
> > > > > > > > it looks to me we need a device_ready before the kick.
> > > > > > > > virtio_rpmsg_bus.c: doesn't use vq
> > > > > > > >
> > > > > > > > I will post a patch for mac80211_hwsim.c.
> > > > > > > > Thanks
> > > > > > >
> > > > > > > Same comments for all of the above. Might linux not start using the
> > > > > > > device once it's registered?
> > > > > >
> > > > > > It depends on the specific subsystem.
> > > > > >
> > > > > > For the subsystem that can't use the device immediately, calling
> > > > > > virtio_device_ready() after the subsystem's registration should be
> > > > > > fine. E.g for the networking subsystem, the TX won't happen if
> > > > > > ndo_open() is not called, calling virtio_device_ready() after
> > > > > > netdev_register() seems to be fine.
> > > > >
> > > > > exactly
> > > > >
> > > > > > For the subsystem that can use the device immediately, if the
> > > > > > subsystem does not depend on the result of a request in the probe to
> > > > > > proceed, we are still fine. Since those requests will be proceed after
> > > > > > DRIVER_OK.
> > > > >
> > > > > Well first won't driver code normally kick as well?
> > > >
> > > > Kick itself is not blocked.
> > > >
> > > > > And without kick, won't everything just be blocked?
> > > >
> > > > It depends on the subsystem. E.g driver can choose to use a callback
> > > > instead of polling the used buffer in the probe.
> > > >
> > > > >
> > > > >
> > > > > > For the rest we need to do virtio_device_ready() before registration.
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > Then we can get an interrupt for an unregistered device.
> > > >
> > > > It depends on the device. For the device that doesn't have an rx queue
> > > > (or device to driver queue), we are fine:
> > > >
> > > > E.g in virtio-blk:
> > > >
> > > >         virtio_device_ready(vdev);
> > > >
> > > >         err = device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
> > > >         if (err)
> > > >                 goto out_cleanup_disk;
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > ---
> > > > > > > > > > > >  drivers/s390/virtio/virtio_ccw.c       |  4 ++++
> > > > > > > > > > > >  drivers/virtio/virtio.c                | 15 ++++++++++++---
> > > > > > > > > > > >  drivers/virtio/virtio_mmio.c           |  5 +++++
> > > > > > > > > > > >  drivers/virtio/virtio_pci_modern_dev.c |  5 +++++
> > > > > > > > > > > >  drivers/virtio/virtio_ring.c           | 11 +++++++----
> > > > > > > > > > > >  include/linux/virtio_config.h          | 20 ++++++++++++++++++++
> > > > > > > > > > > >  6 files changed, 53 insertions(+), 7 deletions(-)
> > > > > > > > > > > >
> > > > > > > > > > > > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > > > > > index c188e4f20ca3..97e51c34e6cf 100644
> > > > > > > > > > > > --- a/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > > > > > +++ b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > > > > > @@ -971,6 +971,10 @@ static void virtio_ccw_set_status(struct virtio_device *vdev, u8 status)
> > > > > > > > > > > >       ccw->flags = 0;
> > > > > > > > > > > >       ccw->count = sizeof(status);
> > > > > > > > > > > >       ccw->cda = (__u32)(unsigned long)&vcdev->dma_area->status;
> > > > > > > > > > > > +     /* We use ssch for setting the status which is a serializing
> > > > > > > > > > > > +      * instruction that guarantees the memory writes have
> > > > > > > > > > > > +      * completed before ssch.
> > > > > > > > > > > > +      */
> > > > > > > > > > > >       ret = ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_WRITE_STATUS);
> > > > > > > > > > > >       /* Write failed? We assume status is unchanged. */
> > > > > > > > > > > >       if (ret)
> > > > > > > > > > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > > > > > > > > > index aa1eb5132767..95fac4c97c8b 100644
> > > > > > > > > > > > --- a/drivers/virtio/virtio.c
> > > > > > > > > > > > +++ b/drivers/virtio/virtio.c
> > > > > > > > > > > > @@ -220,6 +220,15 @@ static int virtio_features_ok(struct virtio_device *dev)
> > > > > > > > > > > >   * */
> > > > > > > > > > > >  void virtio_reset_device(struct virtio_device *dev)
> > > > > > > > > > > >  {
> > > > > > > > > > > > +     /*
> > > > > > > > > > > > +      * The below virtio_synchronize_cbs() guarantees that any
> > > > > > > > > > > > +      * interrupt for this line arriving after
> > > > > > > > > > > > +      * virtio_synchronize_vqs() has completed is guaranteed to see
> > > > > > > > > > > > +      * vq->broken as true.
> > > > > > > > > > > > +      */
> > > > > > > > > > > > +     virtio_break_device(dev);
> > > > > > > > > > >
> > > > > > > > > > > So make this conditional
> > > > > > > > > > >
> > > > > > > > > > > > +     virtio_synchronize_cbs(dev);
> > > > > > > > > > > > +
> > > > > > > > > > > >       dev->config->reset(dev);
> > > > > > > > > > > >  }
> > > > > > > > > > > >  EXPORT_SYMBOL_GPL(virtio_reset_device);
> > > > > > > > > > > > @@ -428,6 +437,9 @@ int register_virtio_device(struct virtio_device *dev)
> > > > > > > > > > > >       dev->config_enabled = false;
> > > > > > > > > > > >       dev->config_change_pending = false;
> > > > > > > > > > > >
> > > > > > > > > > > > +     INIT_LIST_HEAD(&dev->vqs);
> > > > > > > > > > > > +     spin_lock_init(&dev->vqs_list_lock);
> > > > > > > > > > > > +
> > > > > > > > > > > >       /* We always start by resetting the device, in case a previous
> > > > > > > > > > > >        * driver messed it up.  This also tests that code path a little. */
> > > > > > > > > > > >       virtio_reset_device(dev);
> > > > > > > > > > > > @@ -435,9 +447,6 @@ int register_virtio_device(struct virtio_device *dev)
> > > > > > > > > > > >       /* Acknowledge that we've seen the device. */
> > > > > > > > > > > >       virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
> > > > > > > > > > > >
> > > > > > > > > > > > -     INIT_LIST_HEAD(&dev->vqs);
> > > > > > > > > > > > -     spin_lock_init(&dev->vqs_list_lock);
> > > > > > > > > > > > -
> > > > > > > > > > > >       /*
> > > > > > > > > > > >        * device_add() causes the bus infrastructure to look for a matching
> > > > > > > > > > > >        * driver.
> > > > > > > > > > > > diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> > > > > > > > > > > > index c9699a59f93c..f9a36bc7ac27 100644
> > > > > > > > > > > > --- a/drivers/virtio/virtio_mmio.c
> > > > > > > > > > > > +++ b/drivers/virtio/virtio_mmio.c
> > > > > > > > > > > > @@ -253,6 +253,11 @@ static void vm_set_status(struct virtio_device *vdev, u8 status)
> > > > > > > > > > > >       /* We should never be setting status to 0. */
> > > > > > > > > > > >       BUG_ON(status == 0);
> > > > > > > > > > > >
> > > > > > > > > > > > +     /*
> > > > > > > > > > > > +      * Per memory-barriers.txt, wmb() is not needed to guarantee
> > > > > > > > > > > > +      * that the the cache coherent memory writes have completed
> > > > > > > > > > > > +      * before writing to the MMIO region.
> > > > > > > > > > > > +      */
> > > > > > > > > > > >       writel(status, vm_dev->base + VIRTIO_MMIO_STATUS);
> > > > > > > > > > > >  }
> > > > > > > > > > > >
> > > > > > > > > > > > diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
> > > > > > > > > > > > index 4093f9cca7a6..a0fa14f28a7f 100644
> > > > > > > > > > > > --- a/drivers/virtio/virtio_pci_modern_dev.c
> > > > > > > > > > > > +++ b/drivers/virtio/virtio_pci_modern_dev.c
> > > > > > > > > > > > @@ -467,6 +467,11 @@ void vp_modern_set_status(struct virtio_pci_modern_device *mdev,
> > > > > > > > > > > >  {
> > > > > > > > > > > >       struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
> > > > > > > > > > > >
> > > > > > > > > > > > +     /*
> > > > > > > > > > > > +      * Per memory-barriers.txt, wmb() is not needed to guarantee
> > > > > > > > > > > > +      * that the the cache coherent memory writes have completed
> > > > > > > > > > > > +      * before writing to the MMIO region.
> > > > > > > > > > > > +      */
> > > > > > > > > > > >       vp_iowrite8(status, &cfg->device_status);
> > > > > > > > > > > >  }
> > > > > > > > > > > >  EXPORT_SYMBOL_GPL(vp_modern_set_status);
> > > > > > > > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > > > > > > > index 9c231e1fded7..13a7348cedff 100644
> > > > > > > > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > > > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > > > > > > > @@ -1688,7 +1688,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
> > > > > > > > > > > >       vq->we_own_ring = true;
> > > > > > > > > > > >       vq->notify = notify;
> > > > > > > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > > > > > > -     vq->broken = false;
> > > > > > > > > > > > +     vq->broken = true;
> > > > > > > > > > > >       vq->last_used_idx = 0;
> > > > > > > > > > > >       vq->event_triggered = false;
> > > > > > > > > > > >       vq->num_added = 0;
> > > > > > > > > > >
> > > > > > > > > > > and make this conditional
> > > > > > > > > > >
> > > > > > > > > > > > @@ -2134,8 +2134,11 @@ irqreturn_t vring_interrupt(int irq, void *_vq)
> > > > > > > > > > > >               return IRQ_NONE;
> > > > > > > > > > > >       }
> > > > > > > > > > > >
> > > > > > > > > > > > -     if (unlikely(vq->broken))
> > > > > > > > > > > > -             return IRQ_HANDLED;
> > > > > > > > > > > > +     if (unlikely(vq->broken)) {
> > > > > > > > > > > > +             dev_warn_once(&vq->vq.vdev->dev,
> > > > > > > > > > > > +                           "virtio vring IRQ raised before DRIVER_OK");
> > > > > > > > > > > > +             return IRQ_NONE;
> > > > > > > > > > > > +     }
> > > > > > > > > > > >
> > > > > > > > > > > >       /* Just a hint for performance: so it's ok that this can be racy! */
> > > > > > > > > > > >       if (vq->event)
> > > > > > > > > > > > @@ -2177,7 +2180,7 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > > > > > > > > > > >       vq->we_own_ring = false;
> > > > > > > > > > > >       vq->notify = notify;
> > > > > > > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > > > > > > -     vq->broken = false;
> > > > > > > > > > > > +     vq->broken = true;
> > > > > > > > > > > >       vq->last_used_idx = 0;
> > > > > > > > > > > >       vq->event_triggered = false;
> > > > > > > > > > > >       vq->num_added = 0;
> > > > > > > > > > >
> > > > > > > > > > > and make this conditional
> > > > > > > > > > >
> > > > > > > > > > > > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> > > > > > > > > > > > index 25be018810a7..d4edfd7d91bb 100644
> > > > > > > > > > > > --- a/include/linux/virtio_config.h
> > > > > > > > > > > > +++ b/include/linux/virtio_config.h
> > > > > > > > > > > > @@ -256,6 +256,26 @@ void virtio_device_ready(struct virtio_device *dev)
> > > > > > > > > > > >       unsigned status = dev->config->get_status(dev);
> > > > > > > > > > > >
> > > > > > > > > > > >       BUG_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > > > > > > > +
> > > > > > > > > > > > +     /*
> > > > > > > > > > > > +      * The virtio_synchronize_cbs() makes sure vring_interrupt()
> > > > > > > > > > > > +      * will see the driver specific setup if it sees vq->broken
> > > > > > > > > > > > +      * as false (even if the notifications come before DRIVER_OK).
> > > > > > > > > > > > +      */
> > > > > > > > > > > > +     virtio_synchronize_cbs(dev);
> > > > > > > > > > > > +     __virtio_unbreak_device(dev);
> > > > > > > > > > > > +     /*
> > > > > > > > > > > > +      * The transport should ensure the visibility of vq->broken
> > > > > > > > > > > > +      * before setting DRIVER_OK. See the comments for the transport
> > > > > > > > > > > > +      * specific set_status() method.
> > > > > > > > > > > > +      *
> > > > > > > > > > > > +      * A well behaved device will only notify a virtqueue after
> > > > > > > > > > > > +      * DRIVER_OK, this means the device should "see" the coherenct
> > > > > > > > > > > > +      * memory write that set vq->broken as false which is done by
> > > > > > > > > > > > +      * the driver when it sees DRIVER_OK, then the following
> > > > > > > > > > > > +      * driver's vring_interrupt() will see vq->broken as false so
> > > > > > > > > > > > +      * we won't lose any notification.
> > > > > > > > > > > > +      */
> > > > > > > > > > > >       dev->config->set_status(dev, status | VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > > > > > > >  }
> > > > > > > > > > > >
> > > > > > > > > > > > --
> > > > > > > > > > > > 2.25.1
> > > > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > >
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
