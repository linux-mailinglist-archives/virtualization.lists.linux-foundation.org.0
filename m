Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E94841BF50
	for <lists.virtualization@lfdr.de>; Wed, 29 Sep 2021 08:50:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FF2415B0;
	Wed, 29 Sep 2021 06:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPVyz1RSyEWQ; Wed, 29 Sep 2021 06:50:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B936A415DF;
	Wed, 29 Sep 2021 06:50:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5280AC000D;
	Wed, 29 Sep 2021 06:50:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97B8FC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 06:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79C1360687
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 06:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbbo6OTbxbIW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 06:50:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5A3260663
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 06:50:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DD8B61381;
 Wed, 29 Sep 2021 06:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632898219;
 bh=E1m+fcLpD0Wlj72IN6jL13t8OONZeJk7RLRYa9nXCnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=thUQUgjdkd2q1v1WgiwyLfEk8z9PaoyVaRp7H0aeQt3uAjG4qO6mQfzZ/JcXvQqA6
 RGfczIsLJfoKeOBC2UlY2roFcUnhZTGuSLxrohw6wNUFJa5KkeUJWzc9o5nuYGcjzk
 crdOQno+axKIQ/YGfQjx1PJOpWwbkf5NPBDY6l+G+jzExSNPAIoAUgc0+v15Ns9kYw
 qbbBbnHKYzKAmUAArGI21o7VsJ+DLSJHNZefybT0OaSs6XHHwW//6EUpnqD96/h+P7
 74a94bUgtpr5DIHOXDKCJbeHIEzxuFWvtl8DC2koIIKTlUV/i5N6xCw4r3NM8zb3Wv
 wQA5DCtRPATBA==
Date: Wed, 29 Sep 2021 09:50:15 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH 2/2] virtio-blk: set NUMA affinity for a tagset
Message-ID: <YVQMp4aIBJNi9qrH@unreal>
References: <20210926145518.64164-1-mgurtovoy@nvidia.com>
 <20210926145518.64164-2-mgurtovoy@nvidia.com>
 <YVGsMsIjD2+aS3eC@unreal>
 <0c155679-e1db-3d1e-2b4e-a0f12ce5950c@nvidia.com>
 <YVIMIFxjRcfDDub4@unreal>
 <f8de7c19-9f04-a458-6c1d-8133a83aa93f@nvidia.com>
 <YVNCflMxWh4m7ewU@unreal>
 <f0cc8cb4-92dc-f5f9-ea50-aa312ac6a056@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0cc8cb4-92dc-f5f9-ea50-aa312ac6a056@nvidia.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org, mst@redhat.com,
 israelr@nvidia.com, virtualization@lists.linux-foundation.org,
 hch@infradead.org, nitzanc@nvidia.com, stefanha@redhat.com, oren@nvidia.com,
 Yaron Gepstein <yarong@nvidia.com>
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

On Wed, Sep 29, 2021 at 02:28:08AM +0300, Max Gurtovoy wrote:
> 
> On 9/28/2021 7:27 PM, Leon Romanovsky wrote:
> > On Tue, Sep 28, 2021 at 06:59:15PM +0300, Max Gurtovoy wrote:
> > > On 9/27/2021 9:23 PM, Leon Romanovsky wrote:
> > > > On Mon, Sep 27, 2021 at 08:25:09PM +0300, Max Gurtovoy wrote:
> > > > > On 9/27/2021 2:34 PM, Leon Romanovsky wrote:
> > > > > > On Sun, Sep 26, 2021 at 05:55:18PM +0300, Max Gurtovoy wrote:
> > > > > > > To optimize performance, set the affinity of the block device tagset
> > > > > > > according to the virtio device affinity.
> > > > > > > 
> > > > > > > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > > > > > ---
> > > > > > >     drivers/block/virtio_blk.c | 2 +-
> > > > > > >     1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > > > > > index 9b3bd083b411..1c68c3e0ebf9 100644
> > > > > > > --- a/drivers/block/virtio_blk.c
> > > > > > > +++ b/drivers/block/virtio_blk.c
> > > > > > > @@ -774,7 +774,7 @@ static int virtblk_probe(struct virtio_device *vdev)
> > > > > > >     	memset(&vblk->tag_set, 0, sizeof(vblk->tag_set));
> > > > > > >     	vblk->tag_set.ops = &virtio_mq_ops;
> > > > > > >     	vblk->tag_set.queue_depth = queue_depth;
> > > > > > > -	vblk->tag_set.numa_node = NUMA_NO_NODE;
> > > > > > > +	vblk->tag_set.numa_node = virtio_dev_to_node(vdev);
> > > > > > I afraid that by doing it, you will increase chances to see OOM, because
> > > > > > in NUMA_NO_NODE, MM will try allocate memory in whole system, while in
> > > > > > the latter mode only on specific NUMA which can be depleted.
> > > > > This is a common methodology we use in the block layer and in NVMe subsystem
> > > > > and we don't afraid of the OOM issue you raised.
> > > > There are many reasons for that, but we are talking about virtio here
> > > > and not about NVMe.
> > > Ok. what reasons ?
> > For example, NVMe are physical devices that rely on DMA operations,
> > PCI connectivity e.t.c to operate. Such systems indeed can benefit from
> > NUMA locality hints. At the end, these devices are physically connected
> > to that NUMA node.
> 
> FYI Virtio devices are also physical devices that have PCI interface and
> rely on DMA operations.
> 
> from virtio spec: "Virtio devices use normal bus mechanisms of interrupts
> and DMA which should be familiar
> to any device driver author".

Yes, this is how bus in Linux is implemented, there is nothing new here. 

> 
> Also we develop virtio HW at NVIDIA for blk and net devices with our SNAP
> technology.
> 
> These devices are connected via PCI bus to the host.

How all these related to general virtio-blk implementation?

> 
> We also support SRIOV.
> 
> Same it true also for paravirt devices that are emulated by QEMU but still
> the guest sees them as PCI devices.

Yes, the key word here - "emulated".

> 
> > 
> > In our case, virtio-blk is a software interface that doesn't have all
> > these limitations. On the contrary, the virtio-blk can be created on one
> > CPU and moved later to be close to the QEMU which can run on another NUMA
> > node.
> 
> Not at all. virtio is HW interface.

Virtio are para-virtualized devices that are represented as HW interfaces
in the guest OS. They are not needed to be real devices in the hypervisor,
which is my (and probably most of the world) use case.

My QEMU command line contains something like that: "-drive file=IMAGE.img,if=virtio"

> 
> I don't understand what are you saying here ?
> 
> > 
> > Also this patch increases chances to get OOM by factor of NUMA nodes.
> 
> This is common practice in Linux for storage drivers. Why does it bothers
> you at all ?

Do I need a reason to ask for a clarification for publicly posted patch
in open mailing list?

I use virtio and care about it.

> 
> I already decreased the memory footprint for virtio blk devices.

As I wrote before, you decreased by several KB, but by this patch you
limited available memory in magnitudes.

> 
> 
> > Before your patch, the virtio_blk can allocate from X memory, after your
> > patch it will be X/NUMB_NUMA_NODES.
> 
> So go ahead and change all the block layer if it bothers you so much.
> 
> Also please change the NVMe subsystem when you do it.

I suggest less radical approach - don't take patches without proven
benefit.

We are in 2021, let's rely on NUMA node policy.

> 
> And lets see what the community will say.

Stephen asked you for performance data too. I'm not alone here.

> 
> > In addition, it has all chances to even hurt performance.
> > 
> > So yes, post v2, but as Stefan and I asked, please provide supportive
> > performance results, because what was done for another subsystem doesn't
> > mean that it will be applicable here.
> 
> I will measure the perf but even if we wont see an improvement since it
> might not be the bottleneck, this changes should be merged since this is the
> way the block layer is optimized.

This is not acceptance criteria to merge patches.

> 
> This is a micro optimization that commonly used also in other subsystem. And
> non of your above reasons (PCI, SW device, DMA) is true.

Every subsystem is different, in some it makes sense, in others it doesn't.

We (RDMA) had very long discussion (together with perf data) and heavily tailored
test to measure influence of per-node allocations and guess what? We didn't see
any performance advantage.

https://lore.kernel.org/linux-rdma/c34a864803f9bbd33d3f856a6ba2dd595ab708a7.1620729033.git.leonro@nvidia.com/

> 
> Virtio blk device is in 99% a PCI device (paravirt or real HW) exactly like
> any other PCI device you are familiar with.
> 
> It's connected physically to some slot, it has a BAR, MMIO, configuration
> space, etc..

In general case, it is far from being true.

> 
> Thanks.
> 
> > 
> > Thanks
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
