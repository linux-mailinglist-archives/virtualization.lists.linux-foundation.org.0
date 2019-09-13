Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 59017B1BF2
	for <lists.virtualization@lfdr.de>; Fri, 13 Sep 2019 13:05:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BD7BDF97;
	Fri, 13 Sep 2019 11:05:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5F611F8D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 13 Sep 2019 11:05:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D923282B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 13 Sep 2019 11:05:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CBED10C0929;
	Fri, 13 Sep 2019 11:05:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
	[10.36.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB91608C2;
	Fri, 13 Sep 2019 11:05:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 71D0445CD; Fri, 13 Sep 2019 13:05:44 +0200 (CEST)
Date: Fri, 13 Sep 2019 13:05:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH] drm/virtio: Export resource handles via DMA-buf API
Message-ID: <20190913110544.htmslqt4yzejugs4@sirius.home.kraxel.org>
References: <20190912094121.228435-1-tfiga@chromium.org>
	<20190912123821.rraib5entkcxt5p5@sirius.home.kraxel.org>
	<CAAFQd5AFXfu7ysFCi1XQS61DK8nbSk5-=UHkvpYWDtFae5YQ6Q@mail.gmail.com>
	<20190913080707.unhyoezesvfhx5np@sirius.home.kraxel.org>
	<CAAFQd5BUKdWkp7zvhLHyY+rjcwVLYXk1NKsrrfhoOHT_68T==Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5BUKdWkp7zvhLHyY+rjcwVLYXk1NKsrrfhoOHT_68T==Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.66]);
	Fri, 13 Sep 2019 11:05:46 +0000 (UTC)
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

> > No.  DMA master address space in virtual machines is pretty much the
> > same it is on physical machines.  So, on x86 without iommu, identical
> > to (guest) physical address space.  You can't re-define it like that.
> 
> That's not true. Even on x86 without iommu the DMA address space can
> be different from the physical address space.

On a standard pc (like the ones emulated by qemu) that is the case.
It's different on !x86, it also changes with a iommu being present.

But that is not the main point here.  The point is the dma master
address already has a definition and you can't simply change that.

> That could be still just
> a simple addition/subtraction by constant, but still, the two are
> explicitly defined without any guarantees about a simple mapping
> between one or another existing.

Sure.

> "A CPU cannot reference a dma_addr_t directly because there may be
> translation between its physical
> address space and the DMA address space."

Also note that dma address space is device-specific.  In case a iommu
is present in the system you can have *multiple* dma address spaces,
separating (groups of) devices from each other.  So passing a dma
address from one device to another isn't going to work.

> > > However, we could as well introduce a separate DMA address
> > > space if resource handles are not the right way to refer to the memory
> > > from other virtio devices.
> >
> > s/other virtio devices/other devices/
> >
> > dma-bufs are for buffer sharing between devices, not limited to virtio.
> > You can't re-define that in some virtio-specific way.
> >
> 
> We don't need to limit this to virtio devices only. In fact I actually
> foresee this having a use case with the emulated USB host controller,
> which isn't a virtio device.

What exactly?

> That said, I deliberately referred to virtio to keep the scope of the
> problem in control. If there is a solution that could work without
> such assumption, I'm more than open to discuss it, of course.

But it might lead to taking virtio-specific (or virtualization-specific)
shortcuts which will hurt in the long run ...

> As per my understanding of the DMA address, anything that lets the DMA
> master access the target memory would qualify and there would be no
> need for an IOMMU in between.

Yes.  But that DMA address is already defined by the platform, you can't
freely re-define it.  Well, you sort-of can when you design your own
virtual iommu for qemu.  But even then you can't just pass around magic
cookies masqueraded as dma address.  You have to make sure they actually
form an address space, without buffers overlapping, ...

> Exactly. The very specific first scenario that we want to start with
> is allocating host memory through virtio-gpu and using that memory
> both as output of a video decoder and as input (texture) to Virgil3D.
> The memory needs to be specifically allocated by the host as only the
> host can know the requirements for memory allocation of the video
> decode accelerator hardware.

So you probably have some virtio-video-decoder.  You allocate a gpu
buffer, export it as dma-buf, import it into the decoder, then let the
video decoder render to it.  Right?

Using dmabufs makes sense for sure.  But we need an separate field in
struct dma_buf for an (optional) host dmabuf identifier, we can't just
hijack the dma address.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
