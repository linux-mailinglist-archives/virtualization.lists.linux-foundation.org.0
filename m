Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D56DD034
	for <lists.virtualization@lfdr.de>; Tue, 11 Apr 2023 05:31:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33E9B4178F;
	Tue, 11 Apr 2023 03:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33E9B4178F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zG5Zy8Hq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T87rkP2VA1SN; Tue, 11 Apr 2023 03:31:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D9D4D409A6;
	Tue, 11 Apr 2023 03:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D4D409A6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DB50C008C;
	Tue, 11 Apr 2023 03:31:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56A10C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 03:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 226DB41916
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 03:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 226DB41916
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zG5Zy8Hq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrrcadptJ7ZE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 03:31:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D61C341765
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D61C341765
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 03:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cy0xopHldLSOdKVBmXjzFGG+VG+GtUQx+wixnN71Caw=; b=zG5Zy8Hqzj4siArevpRMdsShED
 DueNf63fbgsM3m1nsb1V8ijzHE4n5fXTNIHzuJ0zIWY8Mz3u7BZrVWPwDaYyt4RCyO597NObC2dpD
 0Rf4sbATNNFbDOIB52yzkEqV6+EZJn75UB5segMNo4i29SC8qB5TLHf6XWR+qDjoderg+zhiVL36J
 PiKwYDRhwsNtyTT6VBm5K8jMiJQwnhQ8vA/SOqf/cQt8s7YHegd5f4Na3lHjOLKcudJcenrhlAFUk
 EzVyABdLAv/rEN2YRiJ9DBCqOnPfI5phpP1wA0GRd5rRJoQxshh/TraxTFgxAw9Npx4D1H13icH8v
 i2hDIlzw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pm4jP-00GKT8-0P; Tue, 11 Apr 2023 03:31:43 +0000
Date: Mon, 10 Apr 2023 20:31:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH vhost v6 08/11] virtio_ring: introduce virtqueue_dma_dev()
Message-ID: <ZDTUn6TUqzrF06mr@infradead.org>
References: <20230327040536.48338-1-xuanzhuo@linux.alibaba.com>
 <20230327040536.48338-9-xuanzhuo@linux.alibaba.com>
 <73a24f95-b779-44ac-be28-45b35d1bf540@roeck-us.net>
 <20230407064634-mutt-send-email-mst@kernel.org>
 <1681097397.338332-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEvLLbGTuF1sVSse1RBssvsTR40+P5eBzYkrYnqF7EO3Jw@mail.gmail.com>
 <ZDQq0pDVkr8TvoTM@infradead.org>
 <1681178179.2350223-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEskNEwD0_AZgoDLS2RBv9cpbH5u1q01=cDuawV0NbhK_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACGkMEskNEwD0_AZgoDLS2RBv9cpbH5u1q01=cDuawV0NbhK_w@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Christoph Hellwig <hch@infradead.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 virtualization@lists.linux-foundation.org, Guenter Roeck <linux@roeck-us.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Tue, Apr 11, 2023 at 10:09:40AM +0800, Jason Wang wrote:
> We want to support AF_XDP for virtio-net. It means AF_XDP needs to
> know the dma device to perform DMA mapping. So we introduce a helper
> to expose the dma dev of the virtio device.

The whole virtio architecture is based around the core code doing
the DMA mapping.  I can't see how you can just export a helper to
expose the dma device.  You'd have to complete rework the layering
of the virtio code if you want to do it in the upper level drivers.
And why would you want to do this?  The low-level code is the only
piece that can actually know if you need to do a dma mapping.  All
the kernel subsystems that don't do it inside the low-level drivers
or helpers closely associtated are a giant and hard to fix map
(see usb for the prime exhibit).

So the first question is:  why do you want this for XF_ADP, and
the next question will be how to do that without making a complete
mess.

> This works fine as long as VIRTIO_F_ACCESS_PLATFORM is negotiated. But
> when it is not, the virtio driver needs to use a physical address so
> we want to expose the virtio device without dma_ops in the hope that
> it will go for direct mapping where the physical address is used. But
> it may not work on some specific setups (arches that assume an IOMMU
> or have arch dma ops).

The DMA device for virtio_pci is the underlying PCI device, always.
!VIRTIO_F_ACCESS_PLATFORM means there is no dma device at all.  Because
of all these things you can't just expose a pointer to the dma_device
as that is just a completely wrong way of thinking about the problem.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
