Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446A54F1DC
	for <lists.virtualization@lfdr.de>; Fri, 17 Jun 2022 09:26:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E944026D;
	Fri, 17 Jun 2022 07:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E944026D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXjfQeo2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDjqvsvjwzXZ; Fri, 17 Jun 2022 07:26:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0A20240215;
	Fri, 17 Jun 2022 07:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A20240215
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A5E9C0081;
	Fri, 17 Jun 2022 07:26:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7FA1C002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jun 2022 07:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE5E940992
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jun 2022 07:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE5E940992
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXjfQeo2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CBqTjjuNdHS
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jun 2022 07:26:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A616409B0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A616409B0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jun 2022 07:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655450791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Iu/s42wp+qsyfjUf6qFhVRmLIMF9CUYhOzwLe4yIuY=;
 b=UXjfQeo2eirjnRay2CT2ij46ceoeHfGNPvOZ2F+Rh1rd6rV5ykbwEDi26Ncw1recuAN4Wb
 ITn2+gIpuYBUCRPxU04kXFc+8ttNlnyqwHVUsTxnC/u0MJXmRWdAhCAfxAaP+X+oyrQgA/
 foz0a0bwJBNZC3fwGWxbPGfX/a5huXw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-Ucz4iszCMqKcQNmvLWyg_A-1; Fri, 17 Jun 2022 03:26:29 -0400
X-MC-Unique: Ucz4iszCMqKcQNmvLWyg_A-1
Received: by mail-lf1-f70.google.com with SMTP id
 m13-20020a0565120a8d00b0047f44d0bf91so1955973lfu.16
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jun 2022 00:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Iu/s42wp+qsyfjUf6qFhVRmLIMF9CUYhOzwLe4yIuY=;
 b=mJy3slVKdXILp2xPbAdrpVsb1KcLbooo4Yu3QYILI2SGAWmD+xOcMSLa2AXWaJ6V6F
 DsRTlF/7+6Hp93GVX+akpKMomdIiFVarmA1XeBF1UxEKNt0IkPw/S95jipCSQm902B7I
 5USa53/6y0iF/z/LcaqJqmKTvxjcgEY03Aet/ox9ideHVwB3MfCsYWxdsA4KnG8H3kL2
 64wMDQPm3TRg8mCMoE98TJbs4tz9j7ZH+DhR4bLGIqd/sfjfN66uihBdGAYRkLbhdWSz
 mHbxXgPrGYZn5+l0KcnwpVNtPeJhNCdS0qXtA3TZuf3SPLqu8NxY/rfiNoi/sRXB06qM
 lwIw==
X-Gm-Message-State: AJIora8NsToS+0ICqZGsJcPskIUFGv4BlBOCJwswbcHKy3TBQgCoLfhq
 Bxepar4jdk9UygSJi4nFgPPdvyvER17lThDTdmH9QdBz7JT5QXU3Cb9gQinirIR6DANtEAEqh0D
 PeZW0001FcbR9msvU9QNVGJqM77SXSSo0fnvzYDLEQfmIkVU5PMdbf5BmvA==
X-Received: by 2002:a05:6512:5cc:b0:47a:bf7:f1ab with SMTP id
 o12-20020a05651205cc00b0047a0bf7f1abmr4844045lfo.397.1655450788075; 
 Fri, 17 Jun 2022 00:26:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEJGzU5rEMfw5fJkPX8F2uqE0jtrbrHWEmsbS65iVN8aFCcCqs5w0dMYKaMEwtehkY1nRyY384aORDGiZWsTs=
X-Received: by 2002:a05:6512:5cc:b0:47a:bf7:f1ab with SMTP id
 o12-20020a05651205cc00b0047a0bf7f1abmr4844017lfo.397.1655450787766; Fri, 17
 Jun 2022 00:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACGkMEsT_fWdPxN1cTWOX=vu-ntp3Xo4j46-ZKALeSXr7DmJFQ@mail.gmail.com>
 <20220613045606-mutt-send-email-mst@kernel.org>
 <CACGkMEtAQck7Nr6SP_pD0MGT3njnwZSyT=xPyYzUU3c5GNNM_w@mail.gmail.com>
 <CACGkMEvUFJkC=mnvL2PSH6-3RMcJUk84f-9X46JVcj2vTAr4SQ@mail.gmail.com>
 <20220613052644-mutt-send-email-mst@kernel.org>
 <CACGkMEstGvhETXThuwO+tLVBuRgQb8uC_6DdAM8ZxOi5UKBRbg@mail.gmail.com>
 <20220614114839-mutt-send-email-mst@kernel.org>
 <CACGkMEthExrqFNkOzLGwaffvHw=Tc3MXPtTTiRsnpFDGKPRP=A@mail.gmail.com>
 <20220616130945-mutt-send-email-mst@kernel.org>
 <CACGkMEuSX-wg-VQzVLRhE_9wmQVpCQo5cxQ-by3N6v7gaBNsrg@mail.gmail.com>
 <20220617013147-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220617013147-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 17 Jun 2022 15:26:16 +0800
Message-ID: <CACGkMEuaxpgGt38anCYfQfy_OOKf0HCmSonC7cBD9-jrgWQ+Ow@mail.gmail.com>
Subject: Re: [PATCH V6 8/9] virtio: harden vring IRQ
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Peter Zijlstra <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Cindy Lu <lulu@redhat.com>,
 Marc Zyngier <maz@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 eperezma <eperezma@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-s390@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 virtualization <virtualization@lists.linux-foundation.org>,
 conghui.chen@intel.com, Cristian Marussi <cristian.marussi@arm.com>,
 pankaj.gupta.linux@gmail.com, Mathieu Poirier <mathieu.poirier@linaro.org>,
 netdev <netdev@vger.kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
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

On Fri, Jun 17, 2022 at 1:36 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jun 17, 2022 at 09:24:57AM +0800, Jason Wang wrote:
> > On Fri, Jun 17, 2022 at 1:11 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Jun 15, 2022 at 09:38:18AM +0800, Jason Wang wrote:
> > > > On Tue, Jun 14, 2022 at 11:49 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Tue, Jun 14, 2022 at 03:40:21PM +0800, Jason Wang wrote:
> > > > > > On Mon, Jun 13, 2022 at 5:28 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, Jun 13, 2022 at 05:14:59PM +0800, Jason Wang wrote:
> > > > > > > > On Mon, Jun 13, 2022 at 5:08 PM Jason Wang <jasowang@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, Jun 13, 2022 at 4:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Mon, Jun 13, 2022 at 04:51:08PM +0800, Jason Wang wrote:
> > > > > > > > > > > On Mon, Jun 13, 2022 at 4:19 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Mon, Jun 13, 2022 at 04:07:09PM +0800, Jason Wang wrote:
> > > > > > > > > > > > > On Mon, Jun 13, 2022 at 3:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Mon, Jun 13, 2022 at 01:26:59PM +0800, Jason Wang wrote:
> > > > > > > > > > > > > > > On Sat, Jun 11, 2022 at 1:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Fri, May 27, 2022 at 02:01:19PM +0800, Jason Wang wrote:
> > > > > > > > > > > > > > > > > This is a rework on the previous IRQ hardening that is done for
> > > > > > > > > > > > > > > > > virtio-pci where several drawbacks were found and were reverted:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > 1) try to use IRQF_NO_AUTOEN which is not friendly to affinity managed IRQ
> > > > > > > > > > > > > > > > >    that is used by some device such as virtio-blk
> > > > > > > > > > > > > > > > > 2) done only for PCI transport
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > The vq->broken is re-used in this patch for implementing the IRQ
> > > > > > > > > > > > > > > > > hardening. The vq->broken is set to true during both initialization
> > > > > > > > > > > > > > > > > and reset. And the vq->broken is set to false in
> > > > > > > > > > > > > > > > > virtio_device_ready(). Then vring_interrupt() can check and return
> > > > > > > > > > > > > > > > > when vq->broken is true. And in this case, switch to return IRQ_NONE
> > > > > > > > > > > > > > > > > to let the interrupt core aware of such invalid interrupt to prevent
> > > > > > > > > > > > > > > > > IRQ storm.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > The reason of using a per queue variable instead of a per device one
> > > > > > > > > > > > > > > > > is that we may need it for per queue reset hardening in the future.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Note that the hardening is only done for vring interrupt since the
> > > > > > > > > > > > > > > > > config interrupt hardening is already done in commit 22b7050a024d7
> > > > > > > > > > > > > > > > > ("virtio: defer config changed notifications"). But the method that is
> > > > > > > > > > > > > > > > > used by config interrupt can't be reused by the vring interrupt
> > > > > > > > > > > > > > > > > handler because it uses spinlock to do the synchronization which is
> > > > > > > > > > > > > > > > > expensive.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > > > > > > > > > > > > > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > > > > > > > > > > > > > > > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > > > > > > > > > > > > > > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > > > > > > > > > > > > > > Cc: Halil Pasic <pasic@linux.ibm.com>
> > > > > > > > > > > > > > > > > Cc: Cornelia Huck <cohuck@redhat.com>
> > > > > > > > > > > > > > > > > Cc: Vineeth Vijayan <vneethv@linux.ibm.com>
> > > > > > > > > > > > > > > > > Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> > > > > > > > > > > > > > > > > Cc: linux-s390@vger.kernel.org
> > > > > > > > > > > > > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Jason, I am really concerned by all the fallout.
> > > > > > > > > > > > > > > > I propose adding a flag to suppress the hardening -
> > > > > > > > > > > > > > > > this will be a debugging aid and a work around for
> > > > > > > > > > > > > > > > users if we find more buggy drivers.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > suppress_interrupt_hardening ?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I can post a patch but I'm afraid if we disable it by default, it
> > > > > > > > > > > > > > > won't be used by the users so there's no way for us to receive the bug
> > > > > > > > > > > > > > > report. Or we need a plan to enable it by default.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > It's rc2, how about waiting for 1 and 2 rc? Or it looks better if we
> > > > > > > > > > > > > > > simply warn instead of disable it by default.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I meant more like a flag in struct virtio_driver.
> > > > > > > > > > > > > > For now, could you audit all drivers which don't call _ready?
> > > > > > > > > > > > > > I found 5 of these:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > drivers/bluetooth/virtio_bt.c
> > > > > > > > > > > > >
> > > > > > > > > > > > > This driver seems to be fine, it doesn't use the device/vq in its probe().
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > But it calls hci_register_dev and that in turn queues all kind of
> > > > > > > > > > > > work. Also, can linux start using the device immediately after
> > > > > > > > > > > > it's registered?
> > > > > > > > > > >
> > > > > > > > > > > So I think the driver is allowed to queue before DRIVER_OK.
> > > > > > > > > >
> > > > > > > > > > it's not allowed to kick
> > > > > > > > >
> > > > > > > > > Yes.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > If yes,
> > > > > > > > > > > the only side effect is the delay of the tx interrupt after DRIVER_OK
> > > > > > > > > > > for a well behaved device.
> > > > > > > > > >
> > > > > > > > > > your patches drop the interrupt though, it won't be just delayed.
> > > > > > > > >
> > > > > > > > > For a well behaved device, it can only trigger the interrupt after DRIVER_OK.
> > > > > > > > >
> > > > > > > > > So for virtio bt, it works like:
> > > > > > > > >
> > > > > > > > > 1) driver queue buffer and kick
> > > > > > > > > 2) driver set DRIVER_OK
> > > > > > > > > 3) device start to process the buffer
> > > > > > > > > 4) device send an notification
> > > > > > > > >
> > > > > > > > > The only risk is that the virtqueue could be filled before DRIVER_OK,
> > > > > > > > > or anything I missed?
> > > > > > > >
> > > > > > > > btw, hci has an open and close method and we do rx refill in
> > > > > > > > hdev->open, so we're probably fine here.
> > > > > > > >
> > > > > > > > Thanks
> > > > > > >
> > > > > > >
> > > > > > > Sounds good. Now to audit the rest of them from this POV ;)
> > > > > >
> > > > > > Adding maintainers.
> > > > > >
> > > > > > >
> > > > > > >  drivers/i2c/busses/i2c-virtio.c
> > > > > >
> > > > > > It looks to me the device could be used immediately after
> > > > > > i2c_add_adapter() return. So we probably need to add
> > > > > > virtio_device_ready() before that. Fortunately, there's no rx vq in
> > > > > > i2c and the callback looks safe if the callback is called before the
> > > > > > i2c registration and after virtio_device_ready().
> > > > > >
> > > > > > >  drivers/net/caif/caif_virtio.c
> > > > > >
> > > > > > A networking device, RX is backed by vringh so we don't need to
> > > > > > refill. TX is backed by virtio and is available until ndo_open. So
> > > > > > it's fine to let the core to set DRIVER_OK after probe().
> > > > > >
> > > > > > >  drivers/nvdimm/virtio_pmem.c
> > > > > >
> > > > > > It doesn't use interrupt so far, so it has nothing to do with the IRQ hardening.
> > > > > >
> > > > > > But the device could be used by the subsystem immediately after
> > > > > > nvdimm_pmem_region_create(), this means the flush could be issued
> > > > > > before DRIVER_OK. We need virtio_device_ready() before. We don't have
> > > > > > a RX virtqueue and the callback looks safe if the callback is called
> > > > > > after virtio_device_ready() but before the nvdimm region creating.
> > > > > >
> > > > > > And it looks to me there's a race between the assignment of
> > > > > > provider_data and virtio_pmem_flush(). If the flush was issued before
> > > > > > the assignment we will end up with a NULL pointer dereference. This is
> > > > > > something we need to fix.
> > > > > >
> > > > > > >  arm_scmi
> > > > > >
> > > > > > It looks to me the singleton device could be used by SCMI immediately after
> > > > > >
> > > > > >         /* Ensure initialized scmi_vdev is visible */
> > > > > >         smp_store_mb(scmi_vdev, vdev);
> > > > > >
> > > > > > So we probably need to do virtio_device_ready() before that. It has an
> > > > > > optional rx queue but the filling is done after the above assignment,
> > > > > > so it's safe. And the callback looks safe is a callback is triggered
> > > > > > after virtio_device_ready() buy before the above assignment.
> > > > > >
> > > > > > >  virtio_rpmsg_bus.c
> > > > > > >
> > > > > >
> > > > > > This is somehow more complicated. It has an rx queue, the rx filling
> > > > > > is done before virtio_device_ready() but the kick is done after. And
> > > > > > it looks to me the device could be used by subsystem immediately
> > > > > > rpmsg_virtio_add_ctrl_dev() returns.
> > > > > >
> > > > > > This means, if we do virtio_device_ready() after
> > > > > > rpmsg_virtio_add_ctrl_dev(), we may get kick before DRIVER_OK. If we
> > > > > > do virtio_device_ready() before rpmsg_virtio_add_ctrl_dev(), there's a
> > > > > > race between the callbacks and rpmsg_virtio_add_ctrl_dev() that could
> > > > > > be exploited.
> > > > > >
> > > > > > It requires more thoughts.
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > I think at this point let's do it before so we at least do not
> > > > > get a regression with your patches, add a big comment and work
> > > > > on fixing properly in the next Linux version. Do you think you can
> > > > > commit to a full fix in the next linux version?
> > > >
> > > > I think it should be ok.
> > > >
> > > > If I understand you correctly, you meant to disable the hardening in
> > > > this release?
> > > >
> > > > (Actually, my understanding is that since we are developing mainline
> > > > instead of a downstream version with a hardening features, bug reports
> > > > are somehow expected, especially consider most of the bugs are not
> > > > related to hardening itself)
> > >
> > >
> > > Absolutely. Question is do you think we can fix everything by the
> > > release?
> >
> > Probably not, I'm auditing all the virtio drivers and it seems we have
> > many issues:
> >
> > 1) race between subsystem registration/use and virtio_device_ready()
> > 2) race between notifications and subsystem registerstiation/use
> >
> > And it looks to me even virtio-net has this race.
>
> Interesting. How does it look for virtio-net?

Will post a patch soon.

>
> > So I think I will post a patch to disable this like below for this release.
>
>
> However please do post patches that add device_ready as appropriate.
> This is basic spec compliance.

Working on this.

>
> Also do you think we should do a full revert? Maybe a Kconfig option is
> ok for now.

Yes, Kconfig should be fine.

Patch will be posted soon.

Thanks

>
>
> > > At least for rpmsg we don't seem to have a handle on it yet.
> >
> > Yes.
> >
> > >
> > >
> > > > Thanks
> > > >
> > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > index 13a7348cedff..7ef3115efbad 100644
> > > > --- a/drivers/virtio/virtio_ring.c
> > > > +++ b/drivers/virtio/virtio_ring.c
> > > > @@ -1688,7 +1688,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
> > > >         vq->we_own_ring = true;
> > > >         vq->notify = notify;
> > > >         vq->weak_barriers = weak_barriers;
> > > > -       vq->broken = true;
> > > > +       vq->broken = false;
> > > >         vq->last_used_idx = 0;
> > > >         vq->event_triggered = false;
> > > >         vq->num_added = 0;
> > >
> > >
> > > and drop it on reset?
> >
> > Right.
> >
> > Thanks
> >
> > >
> > > > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > If not, we need to clarify it in the spec
> > > > > > > > > > > and call virtio_device_ready() before subsystem registration.
> > > > > > > > > >
> > > > > > > > > > hmm, i don't get what we need to clarify
> > > > > > > > >
> > > > > > > > > E.g the driver is not allowed to kick or after DRIVER_OK should the
> > > > > > > > > device only process the buffer after a kick after DRIVER_OK (I think
> > > > > > > > > no)?
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > > drivers/gpu/drm/virtio/virtgpu_drv.c
> > > > > > > > > > > > >
> > > > > > > > > > > > > It calles virtio_device_ready() in virtio_gpu_init(), and it looks to
> > > > > > > > > > > > > me the code is correct.
> > > > > > > > > > > >
> > > > > > > > > > > > OK.
> > > > > > > > > > > >
> > > > > > > > > > > > > > drivers/i2c/busses/i2c-virtio.c
> > > > > > > > > > > > > > drivers/net/caif/caif_virtio.c
> > > > > > > > > > > > > > drivers/nvdimm/virtio_pmem.c
> > > > > > > > > > > > >
> > > > > > > > > > > > > The above looks fine and we have three more:
> > > > > > > > > > > > >
> > > > > > > > > > > > > arm_scmi: probe() doesn't use vq
> > > > > > > > > > > > > mac80211_hwsim.c: doesn't use vq (only fill rx), but it kicks the rx,
> > > > > > > > > > > > > it looks to me we need a device_ready before the kick.
> > > > > > > > > > > > > virtio_rpmsg_bus.c: doesn't use vq
> > > > > > > > > > > > >
> > > > > > > > > > > > > I will post a patch for mac80211_hwsim.c.
> > > > > > > > > > > > > Thanks
> > > > > > > > > > > >
> > > > > > > > > > > > Same comments for all of the above. Might linux not start using the
> > > > > > > > > > > > device once it's registered?
> > > > > > > > > > >
> > > > > > > > > > > It depends on the specific subsystem.
> > > > > > > > > > >
> > > > > > > > > > > For the subsystem that can't use the device immediately, calling
> > > > > > > > > > > virtio_device_ready() after the subsystem's registration should be
> > > > > > > > > > > fine. E.g for the networking subsystem, the TX won't happen if
> > > > > > > > > > > ndo_open() is not called, calling virtio_device_ready() after
> > > > > > > > > > > netdev_register() seems to be fine.
> > > > > > > > > >
> > > > > > > > > > exactly
> > > > > > > > > >
> > > > > > > > > > > For the subsystem that can use the device immediately, if the
> > > > > > > > > > > subsystem does not depend on the result of a request in the probe to
> > > > > > > > > > > proceed, we are still fine. Since those requests will be proceed after
> > > > > > > > > > > DRIVER_OK.
> > > > > > > > > >
> > > > > > > > > > Well first won't driver code normally kick as well?
> > > > > > > > >
> > > > > > > > > Kick itself is not blocked.
> > > > > > > > >
> > > > > > > > > > And without kick, won't everything just be blocked?
> > > > > > > > >
> > > > > > > > > It depends on the subsystem. E.g driver can choose to use a callback
> > > > > > > > > instead of polling the used buffer in the probe.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > For the rest we need to do virtio_device_ready() before registration.
> > > > > > > > > > >
> > > > > > > > > > > Thanks
> > > > > > > > > >
> > > > > > > > > > Then we can get an interrupt for an unregistered device.
> > > > > > > > >
> > > > > > > > > It depends on the device. For the device that doesn't have an rx queue
> > > > > > > > > (or device to driver queue), we are fine:
> > > > > > > > >
> > > > > > > > > E.g in virtio-blk:
> > > > > > > > >
> > > > > > > > >         virtio_device_ready(vdev);
> > > > > > > > >
> > > > > > > > >         err = device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
> > > > > > > > >         if (err)
> > > > > > > > >                 goto out_cleanup_disk;
> > > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > >  drivers/s390/virtio/virtio_ccw.c       |  4 ++++
> > > > > > > > > > > > > > > > >  drivers/virtio/virtio.c                | 15 ++++++++++++---
> > > > > > > > > > > > > > > > >  drivers/virtio/virtio_mmio.c           |  5 +++++
> > > > > > > > > > > > > > > > >  drivers/virtio/virtio_pci_modern_dev.c |  5 +++++
> > > > > > > > > > > > > > > > >  drivers/virtio/virtio_ring.c           | 11 +++++++----
> > > > > > > > > > > > > > > > >  include/linux/virtio_config.h          | 20 ++++++++++++++++++++
> > > > > > > > > > > > > > > > >  6 files changed, 53 insertions(+), 7 deletions(-)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > > > > > > > > > > index c188e4f20ca3..97e51c34e6cf 100644
> > > > > > > > > > > > > > > > > --- a/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > > > > > > > > > > +++ b/drivers/s390/virtio/virtio_ccw.c
> > > > > > > > > > > > > > > > > @@ -971,6 +971,10 @@ static void virtio_ccw_set_status(struct virtio_device *vdev, u8 status)
> > > > > > > > > > > > > > > > >       ccw->flags = 0;
> > > > > > > > > > > > > > > > >       ccw->count = sizeof(status);
> > > > > > > > > > > > > > > > >       ccw->cda = (__u32)(unsigned long)&vcdev->dma_area->status;
> > > > > > > > > > > > > > > > > +     /* We use ssch for setting the status which is a serializing
> > > > > > > > > > > > > > > > > +      * instruction that guarantees the memory writes have
> > > > > > > > > > > > > > > > > +      * completed before ssch.
> > > > > > > > > > > > > > > > > +      */
> > > > > > > > > > > > > > > > >       ret = ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_WRITE_STATUS);
> > > > > > > > > > > > > > > > >       /* Write failed? We assume status is unchanged. */
> > > > > > > > > > > > > > > > >       if (ret)
> > > > > > > > > > > > > > > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > > > > > > > > > > > > > > index aa1eb5132767..95fac4c97c8b 100644
> > > > > > > > > > > > > > > > > --- a/drivers/virtio/virtio.c
> > > > > > > > > > > > > > > > > +++ b/drivers/virtio/virtio.c
> > > > > > > > > > > > > > > > > @@ -220,6 +220,15 @@ static int virtio_features_ok(struct virtio_device *dev)
> > > > > > > > > > > > > > > > >   * */
> > > > > > > > > > > > > > > > >  void virtio_reset_device(struct virtio_device *dev)
> > > > > > > > > > > > > > > > >  {
> > > > > > > > > > > > > > > > > +     /*
> > > > > > > > > > > > > > > > > +      * The below virtio_synchronize_cbs() guarantees that any
> > > > > > > > > > > > > > > > > +      * interrupt for this line arriving after
> > > > > > > > > > > > > > > > > +      * virtio_synchronize_vqs() has completed is guaranteed to see
> > > > > > > > > > > > > > > > > +      * vq->broken as true.
> > > > > > > > > > > > > > > > > +      */
> > > > > > > > > > > > > > > > > +     virtio_break_device(dev);
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > So make this conditional
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +     virtio_synchronize_cbs(dev);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >       dev->config->reset(dev);
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >  EXPORT_SYMBOL_GPL(virtio_reset_device);
> > > > > > > > > > > > > > > > > @@ -428,6 +437,9 @@ int register_virtio_device(struct virtio_device *dev)
> > > > > > > > > > > > > > > > >       dev->config_enabled = false;
> > > > > > > > > > > > > > > > >       dev->config_change_pending = false;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +     INIT_LIST_HEAD(&dev->vqs);
> > > > > > > > > > > > > > > > > +     spin_lock_init(&dev->vqs_list_lock);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > >       /* We always start by resetting the device, in case a previous
> > > > > > > > > > > > > > > > >        * driver messed it up.  This also tests that code path a little. */
> > > > > > > > > > > > > > > > >       virtio_reset_device(dev);
> > > > > > > > > > > > > > > > > @@ -435,9 +447,6 @@ int register_virtio_device(struct virtio_device *dev)
> > > > > > > > > > > > > > > > >       /* Acknowledge that we've seen the device. */
> > > > > > > > > > > > > > > > >       virtio_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     INIT_LIST_HEAD(&dev->vqs);
> > > > > > > > > > > > > > > > > -     spin_lock_init(&dev->vqs_list_lock);
> > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > >       /*
> > > > > > > > > > > > > > > > >        * device_add() causes the bus infrastructure to look for a matching
> > > > > > > > > > > > > > > > >        * driver.
> > > > > > > > > > > > > > > > > diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> > > > > > > > > > > > > > > > > index c9699a59f93c..f9a36bc7ac27 100644
> > > > > > > > > > > > > > > > > --- a/drivers/virtio/virtio_mmio.c
> > > > > > > > > > > > > > > > > +++ b/drivers/virtio/virtio_mmio.c
> > > > > > > > > > > > > > > > > @@ -253,6 +253,11 @@ static void vm_set_status(struct virtio_device *vdev, u8 status)
> > > > > > > > > > > > > > > > >       /* We should never be setting status to 0. */
> > > > > > > > > > > > > > > > >       BUG_ON(status == 0);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +     /*
> > > > > > > > > > > > > > > > > +      * Per memory-barriers.txt, wmb() is not needed to guarantee
> > > > > > > > > > > > > > > > > +      * that the the cache coherent memory writes have completed
> > > > > > > > > > > > > > > > > +      * before writing to the MMIO region.
> > > > > > > > > > > > > > > > > +      */
> > > > > > > > > > > > > > > > >       writel(status, vm_dev->base + VIRTIO_MMIO_STATUS);
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
> > > > > > > > > > > > > > > > > index 4093f9cca7a6..a0fa14f28a7f 100644
> > > > > > > > > > > > > > > > > --- a/drivers/virtio/virtio_pci_modern_dev.c
> > > > > > > > > > > > > > > > > +++ b/drivers/virtio/virtio_pci_modern_dev.c
> > > > > > > > > > > > > > > > > @@ -467,6 +467,11 @@ void vp_modern_set_status(struct virtio_pci_modern_device *mdev,
> > > > > > > > > > > > > > > > >  {
> > > > > > > > > > > > > > > > >       struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > +     /*
> > > > > > > > > > > > > > > > > +      * Per memory-barriers.txt, wmb() is not needed to guarantee
> > > > > > > > > > > > > > > > > +      * that the the cache coherent memory writes have completed
> > > > > > > > > > > > > > > > > +      * before writing to the MMIO region.
> > > > > > > > > > > > > > > > > +      */
> > > > > > > > > > > > > > > > >       vp_iowrite8(status, &cfg->device_status);
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >  EXPORT_SYMBOL_GPL(vp_modern_set_status);
> > > > > > > > > > > > > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > > > > > > > > > > > > index 9c231e1fded7..13a7348cedff 100644
> > > > > > > > > > > > > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > > > > > > > > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > > > > > > > > > > > > @@ -1688,7 +1688,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
> > > > > > > > > > > > > > > > >       vq->we_own_ring = true;
> > > > > > > > > > > > > > > > >       vq->notify = notify;
> > > > > > > > > > > > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > > > > > > > > > > > -     vq->broken = false;
> > > > > > > > > > > > > > > > > +     vq->broken = true;
> > > > > > > > > > > > > > > > >       vq->last_used_idx = 0;
> > > > > > > > > > > > > > > > >       vq->event_triggered = false;
> > > > > > > > > > > > > > > > >       vq->num_added = 0;
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > and make this conditional
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > @@ -2134,8 +2134,11 @@ irqreturn_t vring_interrupt(int irq, void *_vq)
> > > > > > > > > > > > > > > > >               return IRQ_NONE;
> > > > > > > > > > > > > > > > >       }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > -     if (unlikely(vq->broken))
> > > > > > > > > > > > > > > > > -             return IRQ_HANDLED;
> > > > > > > > > > > > > > > > > +     if (unlikely(vq->broken)) {
> > > > > > > > > > > > > > > > > +             dev_warn_once(&vq->vq.vdev->dev,
> > > > > > > > > > > > > > > > > +                           "virtio vring IRQ raised before DRIVER_OK");
> > > > > > > > > > > > > > > > > +             return IRQ_NONE;
> > > > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       /* Just a hint for performance: so it's ok that this can be racy! */
> > > > > > > > > > > > > > > > >       if (vq->event)
> > > > > > > > > > > > > > > > > @@ -2177,7 +2180,7 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > > > > > > > > > > > > > > > >       vq->we_own_ring = false;
> > > > > > > > > > > > > > > > >       vq->notify = notify;
> > > > > > > > > > > > > > > > >       vq->weak_barriers = weak_barriers;
> > > > > > > > > > > > > > > > > -     vq->broken = false;
> > > > > > > > > > > > > > > > > +     vq->broken = true;
> > > > > > > > > > > > > > > > >       vq->last_used_idx = 0;
> > > > > > > > > > > > > > > > >       vq->event_triggered = false;
> > > > > > > > > > > > > > > > >       vq->num_added = 0;
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > and make this conditional
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> > > > > > > > > > > > > > > > > index 25be018810a7..d4edfd7d91bb 100644
> > > > > > > > > > > > > > > > > --- a/include/linux/virtio_config.h
> > > > > > > > > > > > > > > > > +++ b/include/linux/virtio_config.h
> > > > > > > > > > > > > > > > > @@ -256,6 +256,26 @@ void virtio_device_ready(struct virtio_device *dev)
> > > > > > > > > > > > > > > > >       unsigned status = dev->config->get_status(dev);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       BUG_ON(status & VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +     /*
> > > > > > > > > > > > > > > > > +      * The virtio_synchronize_cbs() makes sure vring_interrupt()
> > > > > > > > > > > > > > > > > +      * will see the driver specific setup if it sees vq->broken
> > > > > > > > > > > > > > > > > +      * as false (even if the notifications come before DRIVER_OK).
> > > > > > > > > > > > > > > > > +      */
> > > > > > > > > > > > > > > > > +     virtio_synchronize_cbs(dev);
> > > > > > > > > > > > > > > > > +     __virtio_unbreak_device(dev);
> > > > > > > > > > > > > > > > > +     /*
> > > > > > > > > > > > > > > > > +      * The transport should ensure the visibility of vq->broken
> > > > > > > > > > > > > > > > > +      * before setting DRIVER_OK. See the comments for the transport
> > > > > > > > > > > > > > > > > +      * specific set_status() method.
> > > > > > > > > > > > > > > > > +      *
> > > > > > > > > > > > > > > > > +      * A well behaved device will only notify a virtqueue after
> > > > > > > > > > > > > > > > > +      * DRIVER_OK, this means the device should "see" the coherenct
> > > > > > > > > > > > > > > > > +      * memory write that set vq->broken as false which is done by
> > > > > > > > > > > > > > > > > +      * the driver when it sees DRIVER_OK, then the following
> > > > > > > > > > > > > > > > > +      * driver's vring_interrupt() will see vq->broken as false so
> > > > > > > > > > > > > > > > > +      * we won't lose any notification.
> > > > > > > > > > > > > > > > > +      */
> > > > > > > > > > > > > > > > >       dev->config->set_status(dev, status | VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > > > 2.25.1
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > >
> > > > > > >
> > > > >
> > >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
