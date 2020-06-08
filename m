Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA221F1332
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 09:08:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C98FA868FF;
	Mon,  8 Jun 2020 07:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mM-SsYBhMbo6; Mon,  8 Jun 2020 07:08:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9FA4386852;
	Mon,  8 Jun 2020 07:08:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E97DC016F;
	Mon,  8 Jun 2020 07:08:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52862C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4252620510
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3AfNgPis3v76
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:08:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 5DE3B204A8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591600091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wizDwfwyoMPPXV4GkKbxmYvGh2D3w1K1LtMuM+YAACM=;
 b=c7QAzb+8vc+37HVzJSIMlX8sP3lTCp2E3Y95Q9rettJgJ7hLVpkMNKl8zHtfO1MeF7BMPI
 hrAdjXKc/sURCiZ9Ka4q/PMNDirOSi4mBYqAQsXvu7FM/DsOOwkWjPbY3ERXPBq1Zc4R+A
 /RbaYelrqUAA7LGczgFBOhYyVndcLLM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-ZvKHRhiBNLGX0-6DNk5oXQ-1; Mon, 08 Jun 2020 03:08:08 -0400
X-MC-Unique: ZvKHRhiBNLGX0-6DNk5oXQ-1
Received: by mail-wm1-f70.google.com with SMTP id b65so4877408wmb.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 00:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wizDwfwyoMPPXV4GkKbxmYvGh2D3w1K1LtMuM+YAACM=;
 b=RUe9ddmpIcVp+MPQC3F+JZr9mn0msFpPnda1h+lekSO+e2eqt4/M9OphE9KraBZEk7
 fAsMg4ij5kNZudE9V8ko2XKIMvE6In0JuUgrVD1lJ34RjdKdJ6vU7iOhMDZESUfdUOOO
 k1b2GSwk/Kk9IPL4IheuFbeSr/tPKk9SQONB4Faq777fG1BHtVysVbp4kPALP8Okg3pZ
 //4Dy9WhBfelVs/2EfWIzjBLPsu2h9w3P16NONBJydtR5zoAI6EeAEDqpiT+zdWfEJH4
 zPCrq1ymcd88a9/iMtMjppI26UUsY3nfgLR0By9u7m1icKHbDOKgAG9Nnt66M7827JYE
 J3RA==
X-Gm-Message-State: AOAM531dbV5bzDevv4VQ5VbcwbBXcg4xG4erR6q1RsdJ+uWnzAvGzp79
 va8F6z6l+4XE8kWabYc52a83ffEBMSSL/tq6a3Ys6yEhMY6pmK9wKDO23kbpXxqnIPS3mxQ+aVs
 ODYAfTot+hu+NYmlDVJvcotJ/458E0CKCdSK7ejGJug==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr21994660wrw.343.1591600087648; 
 Mon, 08 Jun 2020 00:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGXpbzzaidmlnwd5ycIBSHFuqY9ai9qcMz+leuBEUc2i8LDNf3lxQQHaqRmYeHsaCi3Ivgmg==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr21994630wrw.343.1591600087357; 
 Mon, 08 Jun 2020 00:08:07 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 x205sm22956704wmx.21.2020.06.08.00.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 00:08:06 -0700 (PDT)
Date: Mon, 8 Jun 2020 03:08:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] virtio_mem: prevent overflow with subblock size
Message-ID: <20200608030423-mutt-send-email-mst@kernel.org>
References: <20200608061406.709211-1-mst@redhat.com>
 <0930c9d0-0708-c079-29bd-b80d4e3ce446@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0930c9d0-0708-c079-29bd-b80d4e3ce446@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 teawater <teawaterz@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Mon, Jun 08, 2020 at 08:58:31AM +0200, David Hildenbrand wrote:
> On 08.06.20 08:14, Michael S. Tsirkin wrote:
> > If subblock size is large (e.g. 1G) 32 bit math involving it
> > can overflow. Rather than try to catch all instances of that,
> > let's tweak block size to 64 bit.
> 
> I fail to see where we could actually trigger an overflow. The reported
> warning looked like a false positive to me.


So

    const uint64_t size = count * vm->subblock_size;

is it unreasonable for count to be 4K with subblock_size being 1M?

> > 
> > It ripples through UAPI which is an ABI change, but it's not too late to
> > make it, and it will allow supporting >4Gbyte blocks while might
> > become necessary down the road.
> > 
> 
> This might break cloud-hypervisor, who's already implementing this
> protocol upstream (ccing Hui).
> https://github.com/cloud-hypervisor/cloud-hypervisor/blob/master/vm-virtio/src/mem.rs
> 
> (blocks in the gigabyte range were never the original intention of
> virtio-mem, but I am not completely opposed to that)


So in that case, can you code up validation in the probe function?


> > Fixes: 5f1f79bbc9e26 ("virtio-mem: Paravirtualized memory hotplug")
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  drivers/virtio/virtio_mem.c     | 14 +++++++-------
> >  include/uapi/linux/virtio_mem.h |  4 ++--
> >  2 files changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> > index 2f357142ea5e..7b1bece8a331 100644
> > --- a/drivers/virtio/virtio_mem.c
> > +++ b/drivers/virtio/virtio_mem.c
> > @@ -77,7 +77,7 @@ struct virtio_mem {
> >  	uint64_t requested_size;
> >  
> >  	/* The device block size (for communicating with the device). */
> > -	uint32_t device_block_size;
> > +	uint64_t device_block_size;
> >  	/* The translated node id. NUMA_NO_NODE in case not specified. */
> >  	int nid;
> >  	/* Physical start address of the memory region. */
> > @@ -86,7 +86,7 @@ struct virtio_mem {
> >  	uint64_t region_size;
> >  
> >  	/* The subblock size. */
> > -	uint32_t subblock_size;
> > +	uint64_t subblock_size;
> >  	/* The number of subblocks per memory block. */
> >  	uint32_t nb_sb_per_mb;
> >  
> > @@ -1698,9 +1698,9 @@ static int virtio_mem_init(struct virtio_mem *vm)
> >  	 * - At least the device block size.
> >  	 * In the worst case, a single subblock per memory block.
> >  	 */
> > -	vm->subblock_size = PAGE_SIZE * 1u << max_t(uint32_t, MAX_ORDER - 1,
> > -						    pageblock_order);
> > -	vm->subblock_size = max_t(uint32_t, vm->device_block_size,
> > +	vm->subblock_size = PAGE_SIZE * 1ul << max_t(uint32_t, MAX_ORDER - 1,
> > +						     pageblock_order);
> > +	vm->subblock_size = max_t(uint64_t, vm->device_block_size,
> >  				  vm->subblock_size);
> >  	vm->nb_sb_per_mb = memory_block_size_bytes() / vm->subblock_size;
> >  
> > @@ -1713,8 +1713,8 @@ static int virtio_mem_init(struct virtio_mem *vm)
> >  
> >  	dev_info(&vm->vdev->dev, "start address: 0x%llx", vm->addr);
> >  	dev_info(&vm->vdev->dev, "region size: 0x%llx", vm->region_size);
> > -	dev_info(&vm->vdev->dev, "device block size: 0x%x",
> > -		 vm->device_block_size);
> > +	dev_info(&vm->vdev->dev, "device block size: 0x%llx",
> > +		 (unsigned long long)vm->device_block_size);
> >  	dev_info(&vm->vdev->dev, "memory block size: 0x%lx",
> >  		 memory_block_size_bytes());
> >  	dev_info(&vm->vdev->dev, "subblock size: 0x%x",
> > diff --git a/include/uapi/linux/virtio_mem.h b/include/uapi/linux/virtio_mem.h
> > index a455c488a995..a9ffe041843c 100644
> > --- a/include/uapi/linux/virtio_mem.h
> > +++ b/include/uapi/linux/virtio_mem.h
> > @@ -185,10 +185,10 @@ struct virtio_mem_resp {
> >  
> >  struct virtio_mem_config {
> >  	/* Block size and alignment. Cannot change. */
> > -	__u32 block_size;
> > +	__u64 block_size;
> >  	/* Valid with VIRTIO_MEM_F_ACPI_PXM. Cannot change. */
> >  	__u16 node_id;
> > -	__u16 padding;
> > +	__u8 padding[6];
> >  	/* Start address of the memory region. Cannot change. */
> >  	__u64 addr;
> >  	/* Region size (maximum). Cannot change. */
> > 
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
