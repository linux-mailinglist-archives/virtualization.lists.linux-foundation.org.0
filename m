Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68B7C4A88
	for <lists.virtualization@lfdr.de>; Wed, 11 Oct 2023 08:26:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5977E822F9;
	Wed, 11 Oct 2023 06:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5977E822F9
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4+XiOn1i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B07VRTz2720U; Wed, 11 Oct 2023 06:26:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1D37F82364;
	Wed, 11 Oct 2023 06:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D37F82364
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78273C0032;
	Wed, 11 Oct 2023 06:26:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 574C2C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Oct 2023 06:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31C25822F9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Oct 2023 06:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31C25822F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Rqe_3gSF3YG
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Oct 2023 06:26:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 026CE822E4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Oct 2023 06:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 026CE822E4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4TOV1kA6X694rm9ruej+eqRV9h5H17uvOOn7V5rjO4I=; b=4+XiOn1iSoIPsisa+mbG0VftqX
 xSUAvqRFyXdGPaZwxU/yOsDfFqvJ0ftzeP9CN8OgmCdDyq+pNVyo6O7xpULanhaIZLr2bbZrqXk4F
 DKgfU8QpeJmhBCXup2NYpeJ6wZl+pJ8qVfHDKF7oiNINTrWEXC5HtwlXYrCXoBXKue5zQoRM15xCl
 b6oZi6Xkbs07RaU//z+1OoKwk0Dru3gVgZ8rULTFTs5RwkPVQ0GF5xMC8IbqktGkrtevjE1Df0tUi
 IKP8066H+fK1QQh5vGfmbqQEC9AlpD6n7/VZ1r0n3oq/xO3RZXlKIWJOtvSguX1K3fSpeB2zba80j
 KRiBkZQA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qqSg6-00EyNL-0m; Wed, 11 Oct 2023 06:26:42 +0000
Date: Tue, 10 Oct 2023 23:26:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH vfio 10/11] vfio/virtio: Expose admin commands over
 virtio device
Message-ID: <ZSZAIl06akEvdExM@infradead.org>
References: <20230921124040.145386-11-yishaih@nvidia.com>
 <20230922055336-mutt-send-email-mst@kernel.org>
 <c3724e2f-7938-abf7-6aea-02bfb3881151@nvidia.com>
 <20230926072538-mutt-send-email-mst@kernel.org>
 <ZRpjClKM5mwY2NI0@infradead.org>
 <20231002151320.GA650762@nvidia.com>
 <ZR54shUxqgfIjg/p@infradead.org>
 <20231005111004.GK682044@nvidia.com>
 <ZSAG9cedvh+B0c0E@infradead.org> <20231010131031.GJ3952@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010131031.GJ3952@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 maorg@nvidia.com, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, jiri@nvidia.com, leonro@nvidia.com
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

On Tue, Oct 10, 2023 at 10:10:31AM -0300, Jason Gunthorpe wrote:
> We've talked around ideas like allowing the VF config space to do some
> of the work. For simple devices we could get away with 1 VF config
> space register. (VF config space is owned by the hypervisor, not the
> guest)

Which assumes you're actually using VFs and not multiple PFs, which
is a very limiting assumption.  It also limits your from actually
using DMA during the live migration process, which again is major
limitation once you have a non-tivial amount of state.

> SIOVr2 is discussing more a flexible RID mapping - there is a possible
> route where a "VF" could actually have two RIDs, a hypervisor RID and a
> guest RID.

Well, then you go down the SIOV route, which requires a complex driver
actually presenting the guest visible device anyway.

> It really is PCI limitations that force this design of making a PF
> driver do dual duty as a fully functionally normal device and act as a
> communication channel proxy to make a back channel into a SRIOV VF.
> 
> My view has always been that the VFIO live migration operations are
> executed logically within the VF as they only effect the VF.
> 
> So we have a logical design seperation where VFIO world owns the
> commands and the PF driver supplies the communication channel. This
> works well for devices that already have a robust RPC interface to
> their device FW.

Independent of my above points on the doubts on VF-controlled live
migration for PCe device I absolutely agree with your that the Linux
abstraction and user interface should be VF based.  Which further
reinforeces my point that the VFIO driver for the controlled function
(PF or VF) and the Linux driver for the controlling function (better
be a PF in practice) must be very tightly integrated.  And the best
way to do that is to export the vfio nodes from the Linux driver
that knowns the hardware and not split out into a separate one.

> > The driver that knows this hardware.  In this case the virtio subsystem,
> > in case of nvme the nvme driver, and in case of mlx5 the mlx5 driver.
> 
> But those are drivers operating the HW to create kernel devices. Here
> we need a VFIO device. They can't co-exist, if you switch mlx5 from
> normal to vfio you have to tear down the entire normal driver.

Yes, absolutey.  And if we're smart enough we structure it in a way
that we never even initialize the bits of the driver only needed for
the normal kernel consumers.

> > No.  That layout logically follows from what codebase the functionality
> > is part of, though.
> 
> I don't understand what we are talking about really. Where do you
> imagine the vfio_register_XX() goes?

In the driver controlling the hardware.  E.g. for virtio in
driver/virtio/ and for nvme in drivers/nvme/ and for mlx5
in the mlx5 driver directory.

> > > I don't know what "fake-legacy" even means, VFIO is not legacy.
> > 
> > The driver we're talking about in this thread fakes up a virtio_pci
> > legacy devie to the guest on top of a "modern" virtio_pci device.
> 
> I'm not sure I'd use the word fake, inb/outb are always trapped
> operations in VMs. If the device provided a real IO BAR then VFIO
> common code would trap and relay inb/outb to the device.
> 
> All this is doing is changing the inb/outb relay from using a physical
> IO BAR to a DMA command ring.
> 
> The motivation is simply because normal IO BAR space is incredibly
> limited and you can't get enough SRIOV functions when using it.

The fake is not meant as a judgement.  But it creates a virtio-legacy
device that in this form does not exist in hardware.  That's what
I call fake.  If you prefer a different term that's fine with me too.

> > > There is alot of code in VFIO and the VMM side to take a VF and turn
> > > it into a vPCI function. You can't just trivially duplicate VFIO in a
> > > dozen drivers without creating a giant mess.
> > 
> > I do not advocate for duplicating it.  But the code that calls this
> > functionality belongs into the driver that deals with the compound
> > device that we're doing this work for.
> 
> On one hand, I don't really care - we can put the code where people
> like.
> 
> However - the Intel GPU VFIO driver is such a bad experiance I don't
> want to encourage people to make VFIO drivers, or code that is only
> used by VFIO drivers, that are not under drivers/vfio review.

We can and should require vfio review for users of the vfio API.
But to be honest code placement was not the problem with i915.  The
problem was that the mdev APIs (under drivers/vfio) were a complete
trainwreck when it was written, and that the driver had a horrible
hypervisor API abstraction.

> Be aware, there is a significant performance concern here. If you want
> to create 1000 VFIO devices (this is a real thing), we *can't* probe a
> normal driver first, it is too slow. We need a path that goes directly
> from creating the RIDs to turning those RIDs into VFIO.

And by calling the vfio funtions from mlx5 you get this easily.

But I think you're totally mixing things up here anyway.

For mdev/SIOV like flows you must call vfio APIs from the main
driver anyway, as there is no pci_dev to probe on anyway.  That's
what i915 does btw.

For "classic" vfio that requires a pci_dev (or $otherbus_dev) we need
to have a similar flow.  And I think the best way is to have the
bus-level attribute on the device and/or a device-specific side band
protocol to device how new functions are probed.  With that you
avoid all the duplicate PCI IDs for the binding, and actually allow to
sanely establush a communication channel between the functions.
Because without that there is no way to know how any two functions
related.  The driver might think they know, but there's all kinds of
whacky PCI passthough schemes that will break such a logic.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
