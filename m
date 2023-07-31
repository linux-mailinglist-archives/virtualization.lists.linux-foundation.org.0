Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A9E768A1F
	for <lists.virtualization@lfdr.de>; Mon, 31 Jul 2023 04:46:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27BDD405A7;
	Mon, 31 Jul 2023 02:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27BDD405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GqdF0bPEYwuy; Mon, 31 Jul 2023 02:46:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A0C5040590;
	Mon, 31 Jul 2023 02:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0C5040590
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D44C0C008D;
	Mon, 31 Jul 2023 02:46:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B712C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Jul 2023 02:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6283740590
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Jul 2023 02:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6283740590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00FQqHWwuzVl
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Jul 2023 02:46:27 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94EC740564
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 Jul 2023 02:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94EC740564
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VoXLgUE_1690771579; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VoXLgUE_1690771579) by smtp.aliyun-inc.com;
 Mon, 31 Jul 2023 10:46:20 +0800
Message-ID: <1690770875.591743-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost v11 05/10] virtio_ring: introduce virtqueue_dma_dev()
Date: Mon, 31 Jul 2023 10:34:35 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jakub Kicinski <kuba@kernel.org>
References: <20230710034237.12391-1-xuanzhuo@linux.alibaba.com>
 <20230710034237.12391-6-xuanzhuo@linux.alibaba.com>
 <ZK/cxNHzI23I6efc@infradead.org>
 <20230713104805-mutt-send-email-mst@kernel.org>
 <ZLjSsmTfcpaL6H/I@infradead.org>
 <20230720131928-mutt-send-email-mst@kernel.org>
 <ZL6qPvd6X1CgUD4S@infradead.org>
 <1690251228.3455179-1-xuanzhuo@linux.alibaba.com>
 <20230725033321-mutt-send-email-mst@kernel.org>
 <1690283243.4048996-1-xuanzhuo@linux.alibaba.com>
 <1690524153.3603117-1-xuanzhuo@linux.alibaba.com>
 <20230728080305.5fe3737c@kernel.org>
In-Reply-To: <20230728080305.5fe3737c@kernel.org>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, Eric Dumazet <edumazet@google.com>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, 28 Jul 2023 08:03:05 -0700, Jakub Kicinski <kuba@kernel.org> wrote:
> On Fri, 28 Jul 2023 14:02:33 +0800 Xuan Zhuo wrote:
> > Hi guys, this topic is stuck again. How should I proceed with this work?
> >
> > Let me briefly summarize:
> > 1. The problem with adding virtio_dma_{map, sync} api is that, for AF_XDP and
> > the driver layer, we need to support these APIs. The current conclusion of
> > AF_XDP is no.
> >
> > 2. Set dma_set_mask_and_coherent, then we can use DMA API uniformly inside
> > driver. This idea seems to be inconsistent with the framework design of DMA. The
> > conclusion is no.
> >
> > 3. We noticed that if the virtio device supports VIRTIO_F_ACCESS_PLATFORM, it
> > uses DMA API. And this type of device is the future direction, so we only
> > support DMA premapped for this type of virtio device. The problem with this
> > solution is that virtqueue_dma_dev() only returns dev in some cases, because
> > VIRTIO_F_ACCESS_PLATFORM is supported in such cases. Otherwise NULL is returned.
> > This option is currently NO.
> >
> > So I'm wondering what should I do, from a DMA point of view, is there any
> > solution in case of using DMA API?
>
> I'd step back and ask you why do you want to use AF_XDP with virtio.

Or do you mean virtio vs virtio-net?
All I did with virtio was to get the virtio-net to support AF_XDP.

> Instead of bifurcating one virtio instance into different queues

That is not the key of our problem.

Even though we have a device that only works with AF_XDP,
it still has this DMA issues.

I think the current way(v11, v12) is a good solution, the only problem is that
if the device is old, we can not do dma with DMA APIs. Then we will not suppot
AF_XDP. I don't think it matters. But Christoph was a little worried.

Thanks.


> why
> not create a separate virtio instance?




_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
