Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C675EB1952
	for <lists.virtualization@lfdr.de>; Fri, 13 Sep 2019 10:07:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 22A73B65;
	Fri, 13 Sep 2019 08:07:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0D7B8B2F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 13 Sep 2019 08:07:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9DED07DB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 13 Sep 2019 08:07:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7EFF30655F9;
	Fri, 13 Sep 2019 08:07:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
	[10.36.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E23360C63;
	Fri, 13 Sep 2019 08:07:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6171A9D75; Fri, 13 Sep 2019 10:07:07 +0200 (CEST)
Date: Fri, 13 Sep 2019 10:07:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH] drm/virtio: Export resource handles via DMA-buf API
Message-ID: <20190913080707.unhyoezesvfhx5np@sirius.home.kraxel.org>
References: <20190912094121.228435-1-tfiga@chromium.org>
	<20190912123821.rraib5entkcxt5p5@sirius.home.kraxel.org>
	<CAAFQd5AFXfu7ysFCi1XQS61DK8nbSk5-=UHkvpYWDtFae5YQ6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5AFXfu7ysFCi1XQS61DK8nbSk5-=UHkvpYWDtFae5YQ6Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 13 Sep 2019 08:07:09 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Zach Reizner <zachr@chromium.org>, David Airlie <airlied@linux.ie>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org,
	Keiichi Watanabe <keiichiw@chromium.org>, stevensd@chromium.org,
	Daniel Vetter <daniel@ffwll.ch>,
	=?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
	Pawel Osciak <posciak@chromium.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

  Hi,

> > > To seamlessly enable buffer sharing with drivers using such frameworks,
> > > make the virtio-gpu driver expose the resource handle as the DMA address
> > > of the buffer returned from the DMA-buf mapping operation.  Arguably, the
> > > resource handle is a kind of DMA address already, as it is the buffer
> > > identifier that the device needs to access the backing memory, which is
> > > exactly the same role a DMA address provides for native devices.
> 
> First of all, thanks for taking a look at this.
> 
> > No.  A scatter list has guest dma addresses, period.  Stuffing something
> > else into a scatterlist is asking for trouble, things will go seriously
> > wrong when someone tries to use such a fake scatterlist as real scatterlist.
> 
> What is a "guest dma address"? The definition of a DMA address in the
> Linux DMA API is an address internal to the DMA master address space.
> For virtio, the resource handle namespace may be such an address
> space.

No.  DMA master address space in virtual machines is pretty much the
same it is on physical machines.  So, on x86 without iommu, identical
to (guest) physical address space.  You can't re-define it like that.

> However, we could as well introduce a separate DMA address
> space if resource handles are not the right way to refer to the memory
> from other virtio devices.

s/other virtio devices/other devices/

dma-bufs are for buffer sharing between devices, not limited to virtio.
You can't re-define that in some virtio-specific way.

> > Also note that "the DMA address of the buffer" is bonkers in virtio-gpu
> > context.  virtio-gpu resources are not required to be physically
> > contigous in memory, so typically you actually need a scatter list to
> > describe them.
> 
> There is no such requirement even on a bare metal system, see any
> system that has an IOMMU, which is typical on ARM/ARM64. The DMA
> address space must be contiguous only from the DMA master point of
> view.

Yes, the iommu (if present) could remap your scatterlist that way.  You
can't depend on that though.

What is the plan here?  Host-side buffer sharing I guess?  So you are
looking for some way to pass buffer handles from the guest to the host,
even in case those buffers are not created by your driver but imported
from somewhere else?

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
