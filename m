Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C73804EBA7B
	for <lists.virtualization@lfdr.de>; Wed, 30 Mar 2022 07:54:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5941640C7D;
	Wed, 30 Mar 2022 05:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFkI4vCfScPd; Wed, 30 Mar 2022 05:54:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3EF4340C78;
	Wed, 30 Mar 2022 05:54:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB757C0082;
	Wed, 30 Mar 2022 05:54:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32D49C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 05:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2080A40A99
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 05:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6E9v5M9BGOn
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 05:54:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76553400FD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 05:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648619652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVsfLIjaXVHRjlgHHU/X3KRhVkvoNRG+1HdUV0rs4vg=;
 b=KOYhwZhweRdtqF2mzpCNnkJ6UEEioEtxxPN3gzNV0dYHraGDsYYAZeH9gqcWgPcKFmo23g
 2tXYxPgLgcjeiA3rkAJjKufKylTQ55zAG3cYQF0rE55XBPzdNVVinx/WBlsTpBGOPMYcTE
 HMGpm9EAVhYBKWhcoNAserjNvxMJobM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-4uQY9EtSOVek58peNGsEjQ-1; Wed, 30 Mar 2022 01:54:10 -0400
X-MC-Unique: 4uQY9EtSOVek58peNGsEjQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 133-20020a2e098b000000b00249b89dadfbso5961411ljj.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Mar 2022 22:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LVsfLIjaXVHRjlgHHU/X3KRhVkvoNRG+1HdUV0rs4vg=;
 b=OAN0jnDLUmna8RpTnTuRkjWBS/JpF0vgkIXzHcZkNnN3qBc2H1eax8PJQt3cO3M175
 9ZnSOxyeCJ0l2nQha+u/8xongbgiAoGUV58kQ78ENcXyzvzg0E0FjnFV3x1Z2eF/5b1X
 oqSxgghqvha4XP3sj8LCA3DUK0CLoZFgqvVjBYLl4+J0UsS3FHCHSqDLqRM99T+bP5zo
 frzSuZAa+4NUz9qNil+liKbwVGA3uze5ehIABPE4K9fVzeJcEm4hC6HhdzwLTB4wcHbv
 3EeGQBYngAf36Yg3Ca9lwqJCBbJUUgmGfVM6puZmol83Sv9OoIB5zeLmWe+8/ALUyIq+
 Wshg==
X-Gm-Message-State: AOAM533uPgtCMjH3R5iLbZdIOOzMHOkxlGaKJe+Ki46wJiiCABi75G2c
 A9PbqtFCBKIfI1FeurAChCkfIdv1Erso2jaMAogwYyxpzOisylnPWeL+rtZNVuA837EYNQr5067
 i8dROJpsJckcCEhJDAY5/XHTs9ro6n2O8ioVu12Bwu7rnBYqms1cHIdSzpw==
X-Received: by 2002:a05:651c:892:b0:249:9e23:15 with SMTP id
 d18-20020a05651c089200b002499e230015mr5499812ljq.492.1648619649027; 
 Tue, 29 Mar 2022 22:54:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvNcZ55LUIpXGLU1dB75RUK36K4gRhHPfOnEx/C2N6Ggtw9uE63j3+CcpEV35Nk8PVHggsSBFJX7hwz6pATbA=
X-Received: by 2002:a05:651c:892:b0:249:9e23:15 with SMTP id
 d18-20020a05651c089200b002499e230015mr5499796ljq.492.1648619648636; Tue, 29
 Mar 2022 22:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220325050947-mutt-send-email-mst@kernel.org>
 <CACGkMEvioAVMmB+ab2xXB2YPECtwi1J55u8mRRk9-JAjFSZ8vg@mail.gmail.com>
 <20220325060659-mutt-send-email-mst@kernel.org>
 <CACGkMEu4mRfNbJXJtAFzhyd55fD7phUDKnVtYW0aqRnQmT_bYw@mail.gmail.com>
 <20220328015757-mutt-send-email-mst@kernel.org>
 <CACGkMEu+fax6YYwhfbc1yoSxv6o1FTQyrOheVTmUfqGvmbAEfA@mail.gmail.com>
 <20220328062452-mutt-send-email-mst@kernel.org>
 <CACGkMEtDybY_ZnQkkfuSkx8eMZKoMAe+pnEwyetuS2cmzRVFgw@mail.gmail.com>
 <20220329100111-mutt-send-email-mst@kernel.org>
 <CACGkMEvDTX5JG1OrOi5cbPquFfXRZ87kc+2OO1P80RagN1XhpA@mail.gmail.com>
 <20220330010949-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220330010949-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 13:53:57 +0800
Message-ID: <CACGkMEt0rdJde0A=Wm4+ux6=qFU5MS586pV4eL0q3B3vC4dFcQ@mail.gmail.com>
Subject: Re:
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Keir Fraser <keirf@google.com>, linux-kernel <linux-kernel@vger.kernel.org>,
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

On Wed, Mar 30, 2022 at 1:14 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Mar 30, 2022 at 10:40:59AM +0800, Jason Wang wrote:
> > On Tue, Mar 29, 2022 at 10:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Mar 29, 2022 at 03:12:14PM +0800, Jason Wang wrote:
> > > > > > > > > And requesting irq commits all memory otherwise all drivers would be
> > > > > > > > > broken,
> > > > > > > >
> > > > > > > > So I think we might talk different issues:
> > > > > > > >
> > > > > > > > 1) Whether request_irq() commits the previous setups, I think the
> > > > > > > > answer is yes, since the spin_unlock of desc->lock (release) can
> > > > > > > > guarantee this though there seems no documentation around
> > > > > > > > request_irq() to say this.
> > > > > > > >
> > > > > > > > And I can see at least drivers/video/fbdev/omap2/omapfb/dss/dispc.c is
> > > > > > > > using smp_wmb() before the request_irq().
> > > > > > > >
> > > > > > > > And even if write is ordered we still need read to be ordered to be
> > > > > > > > paired with that.
> > > > >
> > > > > IMO it synchronizes with the CPU to which irq is
> > > > > delivered. Otherwise basically all drivers would be broken,
> > > > > wouldn't they be?
> > > >
> > > > I guess it's because most of the drivers don't care much about the
> > > > buggy/malicious device.  And most of the devices may require an extra
> > > > step to enable device IRQ after request_irq(). Or it's the charge of
> > > > the driver to do the synchronization.
> > >
> > > It is true that the use-case of malicious devices is somewhat boutique.
> > > But I think most drivers do want to have their hotplug routines to be
> > > robust, yes.
> > >
> > > > > I don't know whether it's correct on all platforms, but if not
> > > > > we need to fix request_irq.
> > > > >
> > > > > > > >
> > > > > > > > > if it doesn't it just needs to be fixed, not worked around in
> > > > > > > > > virtio.
> > > > > > > >
> > > > > > > > 2) virtio drivers might do a lot of setups between request_irq() and
> > > > > > > > virtio_device_ready():
> > > > > > > >
> > > > > > > > request_irq()
> > > > > > > > driver specific setups
> > > > > > > > virtio_device_ready()
> > > > > > > >
> > > > > > > > CPU 0 probe) request_irq()
> > > > > > > > CPU 1 IRQ handler) read the uninitialized variable
> > > > > > > > CPU 0 probe) driver specific setups
> > > > > > > > CPU 0 probe) smp_store_release(intr_soft_enabled, true), commit the setups
> > > > > > > > CPU 1 IRQ handler) read irq_soft_enable as true
> > > > > > > > CPU 1 IRQ handler) use the uninitialized variable
> > > > > > > >
> > > > > > > > Thanks
> > > > > > >
> > > > > > >
> > > > > > > As I said, virtio_device_ready needs to do synchronize_irq.
> > > > > > > That will guarantee all setup is visible to the specific IRQ,
> > > > > >
> > > > > > Only the interrupt after synchronize_irq() returns.
> > > > >
> > > > > Anything else is a buggy device though.
> > > >
> > > > Yes, but the goal of this patch is to prevent the possible attack from
> > > > buggy(malicious) devices.
> > >
> > > Right. However if a driver of a *buggy* device somehow sees driver_ok =
> > > false even though it's actually initialized, that is not a deal breaker
> > > as that does not open us up to an attack.
> > >
> > > > >
> > > > > > >this
> > > > > > > is what it's point is.
> > > > > >
> > > > > > What happens if an interrupt is raised in the middle like:
> > > > > >
> > > > > > smp_store_release(dev->irq_soft_enabled, true)
> > > > > > IRQ handler
> > > > > > synchornize_irq()
> > > > > >
> > > > > > If we don't enforce a reading order, the IRQ handler may still see the
> > > > > > uninitialized variable.
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > IMHO variables should be initialized before request_irq
> > > > > to a value meaning "not a valid interrupt".
> > > > > Specifically driver_ok = false.
> > > > > Handler in the scenario you describe will then see !driver_ok
> > > > > and exit immediately.
> > > >
> > > > So just to make sure we're on the same page.
> > > >
> > > > 1) virtio_reset_device() will set the driver_ok to false;
> > > > 2) virtio_device_ready() will set the driver_ok to true
> > > >
> > > > So for virtio drivers, it often did:
> > > >
> > > > 1) virtio_reset_device()
> > > > 2) find_vqs() which will call request_irq()
> > > > 3) other driver specific setups
> > > > 4) virtio_device_ready()
> > > >
> > > > In virtio_device_ready(), the patch perform the following currently:
> > > >
> > > > smp_store_release(driver_ok, true);
> > > > set_status(DRIVER_OK);
> > > >
> > > > Per your suggestion, to add synchronize_irq() after
> > > > smp_store_release() so we had
> > > >
> > > > smp_store_release(driver_ok, true);
> > > > synchornize_irq()
> > > > set_status(DRIVER_OK)
> > > >
> > > > Suppose there's a interrupt raised before the synchronize_irq(), if we do:
> > > >
> > > > if (READ_ONCE(driver_ok)) {
> > > >       vq->callback()
> > > > }
> > > >
> > > > It will see the driver_ok as true but how can we make sure
> > > > vq->callback sees the driver specific setups (3) above?
> > > >
> > > > And an example is virtio_scsi():
> > > >
> > > > virtio_reset_device()
> > > > virtscsi_probe()
> > > >     virtscsi_init()
> > > >         virtio_find_vqs()
> > > >         ...
> > > >         virtscsi_init_vq(&vscsi->event_vq, vqs[1])
> > > >     ....
> > > >     virtio_device_ready()
> > > >
> > > > In virtscsi_event_done():
> > > >
> > > > virtscsi_event_done():
> > > >     virtscsi_vq_done(vscsi, &vscsi->event_vq, ...);
> > > >
> > > > We need to make sure the even_done reads driver_ok before read vscsi->event_vq.
> > > >
> > > > Thanks
> > >
> > >
> > > See response by Thomas. A simple if (!dev->driver_ok) should be enough,
> > > it's all under a lock.
> >
> > Ordered through ACQUIRE+RELEASE actually since the irq handler is not
> > running under the lock.
> >
> > Another question, for synchronize_irq() do you prefer
> >
> > 1) transport specific callbacks
> > or
> > 2) a simple synchornize_rcu()
> >
> > Thanks
>
>
> 1) I think, and I'd add a wrapper so we can switch to 2 if we really
> want to. But for now synchronizing the specific irq is obviously designed to
> make any changes to memory visible to this irq. that
> seems cleaner and easier to understand than memory ordering tricks
> and relying on side effects of synchornize_rcu, even though
> internally this all boils down to memory ordering since
> memory is what's used to implement locks :).
> Not to mention, synchronize_irq just scales much better from performance
> POV.

Ok. Let me try to do that in V2.

Thanks

>
>
> > >
> > > > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > We use smp_store_relase()
> > > > > > > > > > > > to make sure the driver commits the setup before enabling the irq. It
> > > > > > > > > > > > means the read needs to be ordered as well in vring_interrupt().
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > Although I couldn't find anything about this in memory-barriers.txt
> > > > > > > > > > > > > which surprises me.
> > > > > > > > > > > > >
> > > > > > > > > > > > > CC Paul to help make sure I'm right.
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > To avoid breaking legacy device which can send IRQ before DRIVER_OK, a
> > > > > > > > > > > > > > > > module parameter is introduced to enable the hardening so function
> > > > > > > > > > > > > > > > hardening is disabled by default.
> > > > > > > > > > > > > > > Which devices are these? How come they send an interrupt before there
> > > > > > > > > > > > > > > are any buffers in any queues?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I copied this from the commit log for 22b7050a024d7
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > "
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >     This change will also benefit old hypervisors (before 2009)
> > > > > > > > > > > > > >     that send interrupts without checking DRIVER_OK: previously,
> > > > > > > > > > > > > >     the callback could race with driver-specific initialization.
> > > > > > > > > > > > > > "
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > If this is only for config interrupt, I can remove the above log.
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > This is only for config interrupt.
> > > > > > > > > > > >
> > > > > > > > > > > > Ok.
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Note that the hardening is only done for vring interrupt since the
> > > > > > > > > > > > > > > > config interrupt hardening is already done in commit 22b7050a024d7
> > > > > > > > > > > > > > > > ("virtio: defer config changed notifications"). But the method that is
> > > > > > > > > > > > > > > > used by config interrupt can't be reused by the vring interrupt
> > > > > > > > > > > > > > > > handler because it uses spinlock to do the synchronization which is
> > > > > > > > > > > > > > > > expensive.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > >   drivers/virtio/virtio.c       | 19 +++++++++++++++++++
> > > > > > > > > > > > > > > >   drivers/virtio/virtio_ring.c  |  9 ++++++++-
> > > > > > > > > > > > > > > >   include/linux/virtio.h        |  4 ++++
> > > > > > > > > > > > > > > >   include/linux/virtio_config.h | 25 +++++++++++++++++++++++++
> > > > > > > > > > > > > > > >   4 files changed, 56 insertions(+), 1 deletion(-)
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > > > > > > > > > > > > > index 8dde44ea044a..85e331efa9cc 100644
> > > > > > > > > > > > > > > > --- a/drivers/virtio/virtio.c
> > > > > > > > > > > > > > > > +++ b/drivers/virtio/virtio.c
> > > > > > > > > > > > > > > > @@ -7,6 +7,12 @@
> > > > > > > > > > > > > > > >   #include <linux/of.h>
> > > > > > > > > > > > > > > >   #include <uapi/linux/virtio_ids.h>
> > > > > > > > > > > > > > > > +static bool irq_hardening = false;
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > +module_param(irq_hardening, bool, 0444);
> > > > > > > > > > > > > > > > +MODULE_PARM_DESC(irq_hardening,
> > > > > > > > > > > > > > > > +          "Disalbe IRQ software processing when it is not expected");
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > >   /* Unique numbering for virtio devices. */
> > > > > > > > > > > > > > > >   static DEFINE_IDA(virtio_index_ida);
> > > > > > > > > > > > > > > > @@ -220,6 +226,15 @@ static int virtio_features_ok(struct virtio_device *dev)
> > > > > > > > > > > > > > > >    * */
> > > > > > > > > > > > > > > >   void virtio_reset_device(struct virtio_device *dev)
> > > > > > > > > > > > > > > >   {
> > > > > > > > > > > > > > > > + /*
> > > > > > > > > > > > > > > > +  * The below synchronize_rcu() guarantees that any
> > > > > > > > > > > > > > > > +  * interrupt for this line arriving after
> > > > > > > > > > > > > > > > +  * synchronize_rcu() has completed is guaranteed to see
> > > > > > > > > > > > > > > > +  * irq_soft_enabled == false.
> > > > > > > > > > > > > > > News to me I did not know synchronize_rcu has anything to do
> > > > > > > > > > > > > > > with interrupts. Did not you intend to use synchronize_irq?
> > > > > > > > > > > > > > > I am not even 100% sure synchronize_rcu is by design a memory barrier
> > > > > > > > > > > > > > > though it's most likely is ...
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > According to the comment above tree RCU version of synchronize_rcu():
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > """
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >  * RCU read-side critical sections are delimited by rcu_read_lock()
> > > > > > > > > > > > > >  * and rcu_read_unlock(), and may be nested.  In addition, but only in
> > > > > > > > > > > > > >  * v5.0 and later, regions of code across which interrupts, preemption,
> > > > > > > > > > > > > >  * or softirqs have been disabled also serve as RCU read-side critical
> > > > > > > > > > > > > >  * sections.  This includes hardware interrupt handlers, softirq handlers,
> > > > > > > > > > > > > >  * and NMI handlers.
> > > > > > > > > > > > > > """
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So interrupt handlers are treated as read-side critical sections.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > And it has the comment for explain the barrier:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > """
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >  * Note that this guarantee implies further memory-ordering guarantees.
> > > > > > > > > > > > > >  * On systems with more than one CPU, when synchronize_rcu() returns,
> > > > > > > > > > > > > >  * each CPU is guaranteed to have executed a full memory barrier since
> > > > > > > > > > > > > >  * the end of its last RCU read-side critical section whose beginning
> > > > > > > > > > > > > >  * preceded the call to synchronize_rcu().  In addition, each CPU having
> > > > > > > > > > > > > > """
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So on SMP it provides a full barrier. And for UP/tiny RCU we don't need the
> > > > > > > > > > > > > > barrier, if the interrupt come after WRITE_ONCE() it will see the
> > > > > > > > > > > > > > irq_soft_enabled as false.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > You are right. So then
> > > > > > > > > > > > > 1. I do not think we need load_acquire - why is it needed? Just
> > > > > > > > > > > > >    READ_ONCE should do.
> > > > > > > > > > > >
> > > > > > > > > > > > See above.
> > > > > > > > > > > >
> > > > > > > > > > > > > 2. isn't synchronize_irq also doing the same thing?
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Yes, but it requires a config ops since the IRQ knowledge is transport specific.
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > +  */
> > > > > > > > > > > > > > > > + WRITE_ONCE(dev->irq_soft_enabled, false);
> > > > > > > > > > > > > > > > + synchronize_rcu();
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > >           dev->config->reset(dev);
> > > > > > > > > > > > > > > >   }
> > > > > > > > > > > > > > > >   EXPORT_SYMBOL_GPL(virtio_reset_device);
> > > > > > > > > > > > > > > Please add comment explaining where it will be enabled.
> > > > > > > > > > > > > > > Also, we *really* don't need to synch if it was already disabled,
> > > > > > > > > > > > > > > let's not add useless overhead to the boot sequence.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Ok.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > @@ -427,6 +442,10 @@ int register_virtio_device(struct virtio_device *dev)
> > > > > > > > > > > > > > > >           spin_lock_init(&dev->config_lock);
> > > > > > > > > > > > > > > >           dev->config_enabled = false;
> > > > > > > > > > > > > > > >           dev->config_change_pending = false;
> > > > > > > > > > > > > > > > + dev->irq_soft_check = irq_hardening;
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > + if (dev->irq_soft_check)
> > > > > > > > > > > > > > > > +         dev_info(&dev->dev, "IRQ hardening is enabled\n");
> > > > > > > > > > > > > > > >           /* We always start by resetting the device, in case a previous
> > > > > > > > > > > > > > > >            * driver messed it up.  This also tests that code path a little. */
> > > > > > > > > > > > > > > one of the points of hardening is it's also helpful for buggy
> > > > > > > > > > > > > > > devices. this flag defeats the purpose.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Do you mean:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > 1) we need something like config_enable? This seems not easy to be
> > > > > > > > > > > > > > implemented without obvious overhead, mainly the synchronize with the
> > > > > > > > > > > > > > interrupt handlers
> > > > > > > > > > > > >
> > > > > > > > > > > > > But synchronize is only on tear-down path. That is not critical for any
> > > > > > > > > > > > > users at the moment, even less than probe.
> > > > > > > > > > > >
> > > > > > > > > > > > I meant if we have vq->irq_pending, we need to call vring_interrupt()
> > > > > > > > > > > > in the virtio_device_ready() and synchronize the IRQ handlers with
> > > > > > > > > > > > spinlock or others.
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > 2) enable this by default, so I don't object, but this may have some risk
> > > > > > > > > > > > > > for old hypervisors
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > The risk if there's a driver adding buffers without setting DRIVER_OK.
> > > > > > > > > > > >
> > > > > > > > > > > > Probably not, we have devices that accept random inputs from outside,
> > > > > > > > > > > > net, console, input etc. I've done a round of audits of the Qemu
> > > > > > > > > > > > codes. They look all fine since day0.
> > > > > > > > > > > >
> > > > > > > > > > > > > So with this approach, how about we rename the flag "driver_ok"?
> > > > > > > > > > > > > And then add_buf can actually test it and BUG_ON if not there  (at least
> > > > > > > > > > > > > in the debug build).
> > > > > > > > > > > >
> > > > > > > > > > > > This looks like a hardening of the driver in the core instead of the
> > > > > > > > > > > > device. I think it can be done but in a separate series.
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > And going down from there, how about we cache status in the
> > > > > > > > > > > > > device? Then we don't need to keep re-reading it every time,
> > > > > > > > > > > > > speeding boot up a tiny bit.
> > > > > > > > > > > >
> > > > > > > > > > > > I don't fully understand here, actually spec requires status to be
> > > > > > > > > > > > read back for validation in many cases.
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > > > > > > > > > > > index 962f1477b1fa..0170f8c784d8 100644
> > > > > > > > > > > > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > > > > > > > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > > > > > > > > > > > @@ -2144,10 +2144,17 @@ static inline bool more_used(const struct vring_virtqueue *vq)
> > > > > > > > > > > > > > > >           return vq->packed_ring ? more_used_packed(vq) : more_used_split(vq);
> > > > > > > > > > > > > > > >   }
> > > > > > > > > > > > > > > > -irqreturn_t vring_interrupt(int irq, void *_vq)
> > > > > > > > > > > > > > > > +irqreturn_t vring_interrupt(int irq, void *v)
> > > > > > > > > > > > > > > >   {
> > > > > > > > > > > > > > > > + struct virtqueue *_vq = v;
> > > > > > > > > > > > > > > > + struct virtio_device *vdev = _vq->vdev;
> > > > > > > > > > > > > > > >           struct vring_virtqueue *vq = to_vvq(_vq);
> > > > > > > > > > > > > > > > + if (!virtio_irq_soft_enabled(vdev)) {
> > > > > > > > > > > > > > > > +         dev_warn_once(&vdev->dev, "virtio vring IRQ raised before DRIVER_OK");
> > > > > > > > > > > > > > > > +         return IRQ_NONE;
> > > > > > > > > > > > > > > > + }
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > >           if (!more_used(vq)) {
> > > > > > > > > > > > > > > >                   pr_debug("virtqueue interrupt with no work for %p\n", vq);
> > > > > > > > > > > > > > > >                   return IRQ_NONE;
> > > > > > > > > > > > > > > > diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> > > > > > > > > > > > > > > > index 5464f398912a..957d6ad604ac 100644
> > > > > > > > > > > > > > > > --- a/include/linux/virtio.h
> > > > > > > > > > > > > > > > +++ b/include/linux/virtio.h
> > > > > > > > > > > > > > > > @@ -95,6 +95,8 @@ dma_addr_t virtqueue_get_used_addr(struct virtqueue *vq);
> > > > > > > > > > > > > > > >    * @failed: saved value for VIRTIO_CONFIG_S_FAILED bit (for restore)
> > > > > > > > > > > > > > > >    * @config_enabled: configuration change reporting enabled
> > > > > > > > > > > > > > > >    * @config_change_pending: configuration change reported while disabled
> > > > > > > > > > > > > > > > + * @irq_soft_check: whether or not to check @irq_soft_enabled
> > > > > > > > > > > > > > > > + * @irq_soft_enabled: callbacks enabled
> > > > > > > > > > > > > > > >    * @config_lock: protects configuration change reporting
> > > > > > > > > > > > > > > >    * @dev: underlying device.
> > > > > > > > > > > > > > > >    * @id: the device type identification (used to match it with a driver).
> > > > > > > > > > > > > > > > @@ -109,6 +111,8 @@ struct virtio_device {
> > > > > > > > > > > > > > > >           bool failed;
> > > > > > > > > > > > > > > >           bool config_enabled;
> > > > > > > > > > > > > > > >           bool config_change_pending;
> > > > > > > > > > > > > > > > + bool irq_soft_check;
> > > > > > > > > > > > > > > > + bool irq_soft_enabled;
> > > > > > > > > > > > > > > >           spinlock_t config_lock;
> > > > > > > > > > > > > > > >           spinlock_t vqs_list_lock; /* Protects VQs list access */
> > > > > > > > > > > > > > > >           struct device dev;
> > > > > > > > > > > > > > > > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> > > > > > > > > > > > > > > > index dafdc7f48c01..9c1b61f2e525 100644
> > > > > > > > > > > > > > > > --- a/include/linux/virtio_config.h
> > > > > > > > > > > > > > > > +++ b/include/linux/virtio_config.h
> > > > > > > > > > > > > > > > @@ -174,6 +174,24 @@ static inline bool virtio_has_feature(const struct virtio_device *vdev,
> > > > > > > > > > > > > > > >           return __virtio_test_bit(vdev, fbit);
> > > > > > > > > > > > > > > >   }
> > > > > > > > > > > > > > > > +/*
> > > > > > > > > > > > > > > > + * virtio_irq_soft_enabled: whether we can execute callbacks
> > > > > > > > > > > > > > > > + * @vdev: the device
> > > > > > > > > > > > > > > > + */
> > > > > > > > > > > > > > > > +static inline bool virtio_irq_soft_enabled(const struct virtio_device *vdev)
> > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > + if (!vdev->irq_soft_check)
> > > > > > > > > > > > > > > > +         return true;
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > + /*
> > > > > > > > > > > > > > > > +  * Read irq_soft_enabled before reading other device specific
> > > > > > > > > > > > > > > > +  * data. Paried with smp_store_relase() in
> > > > > > > > > > > > > > > paired
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Will fix.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > +  * virtio_device_ready() and WRITE_ONCE()/synchronize_rcu() in
> > > > > > > > > > > > > > > > +  * virtio_reset_device().
> > > > > > > > > > > > > > > > +  */
> > > > > > > > > > > > > > > > + return smp_load_acquire(&vdev->irq_soft_enabled);
> > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > >   /**
> > > > > > > > > > > > > > > >    * virtio_has_dma_quirk - determine whether this device has the DMA quirk
> > > > > > > > > > > > > > > >    * @vdev: the device
> > > > > > > > > > > > > > > > @@ -236,6 +254,13 @@ void virtio_device_ready(struct virtio_device *dev)
> > > > > > > > > > > > > > > >           if (dev->config->enable_cbs)
> > > > > > > > > > > > > > > >                     dev->config->enable_cbs(dev);
> > > > > > > > > > > > > > > > + /*
> > > > > > > > > > > > > > > > +  * Commit the driver setup before enabling the virtqueue
> > > > > > > > > > > > > > > > +  * callbacks. Paried with smp_load_acuqire() in
> > > > > > > > > > > > > > > > +  * virtio_irq_soft_enabled()
> > > > > > > > > > > > > > > > +  */
> > > > > > > > > > > > > > > > + smp_store_release(&dev->irq_soft_enabled, true);
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > >           BUG_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > > > > > > > > > > >           dev->config->set_status(dev, status | VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > > > > > > > > > > >   }
> > > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > > 2.25.1
> > > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > >
> > >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
