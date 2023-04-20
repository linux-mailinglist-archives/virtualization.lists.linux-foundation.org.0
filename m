Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA66E8A41
	for <lists.virtualization@lfdr.de>; Thu, 20 Apr 2023 08:19:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE8C61484;
	Thu, 20 Apr 2023 06:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AE8C61484
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CchdnWCr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZL2vYW13Lc0; Thu, 20 Apr 2023 06:19:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 91B476FE84;
	Thu, 20 Apr 2023 06:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B476FE84
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2375C008C;
	Thu, 20 Apr 2023 06:19:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 372D5C002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Apr 2023 06:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0554B81FFD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Apr 2023 06:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0554B81FFD
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CchdnWCr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZBJ7OYBFvNh
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Apr 2023 06:19:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E0481E50
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65E0481E50
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Apr 2023 06:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iio26VJpJRdZbT3LCeDlyblhDb21r5nBGeAdJ5hJHCA=; b=CchdnWCr9CoA9dNOaN+BPu7viz
 H7/xVIId2VWy2+Axj09fAVt9qFvn9p7inlFjF7xopbDdzlGJcaT6IfYX4r1yJbgmcn98vwcsMl/kI
 GW/wKr3C9H6Y7xdQNPX8jvEf/kGEvGEfPZ+gzrIKUZVcJZrSpdKAvBSp2lMjaO/U9ySItCRHQzmMX
 /X1mNz7Q3ZUNhf/rzZ9LylJj20eEmb2nNTXGcokaebCF1jlQJXQqEsAhJuMve5EmeTxtG6Zdj+PaI
 ZInes1YaR2hPLg/unIxVTqOk7upRieNtQsvCUDR9QFO+hq6BYh3Uz3GRAqJ4Dww84AmxNnHY5D1cM
 egFZojtQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1ppNda-007Aah-2E; Thu, 20 Apr 2023 06:19:22 +0000
Date: Wed, 19 Apr 2023 23:19:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next] xsk: introduce xsk_dma_ops
Message-ID: <ZEDZaitjcX+egzvf@infradead.org>
References: <20230417115610.7763a87c@kernel.org>
 <20230417115753.7fb64b68@kernel.org>
 <CACGkMEtPNPXFThHt4aNm4g-fC1DqTLcDnB_iBWb9-cAOHMYV_A@mail.gmail.com>
 <20230417181950.5db68526@kernel.org>
 <1681784379.909136-2-xuanzhuo@linux.alibaba.com>
 <20230417195400.482cfe75@kernel.org>
 <ZD4kMOym15pFcjq+@infradead.org>
 <20230417231947.3972f1a8@kernel.org>
 <ZD95RY9PjVRi7qz3@infradead.org>
 <20230419094506.2658b73f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419094506.2658b73f@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, bpf@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Apr 19, 2023 at 09:45:06AM -0700, Jakub Kicinski wrote:
> > Can you explain what the actual use case is?
> > 
> > From the original patchset I suspect it is dma mapping something very
> > long term and then maybe doing syncs on it as needed?
> 
> In this case yes, pinned user memory, it gets sliced up into MTU sized
> chunks, fed into an Rx queue of a device, and user can see packets
> without any copies.

How long is the life time of these mappings?  Because dma_map_*
assumes a temporary mapping and not one that is pinned bascically
forever.

> Quite similar use case #2 is upcoming io_uring / "direct placement"
> patches (former from Meta, latter for Google) which will try to receive
> just the TCP data into pinned user memory.

I don't think we can just long term pin user memory here.  E.g. for
confidential computing cases we can't even ever do DMA straight to
userspace.  I had that conversation with Meta's block folks who
want to do something similar with io_uring and the only option is an
an allocator for memory that is known DMAable, e.g. through dma-bufs.

You guys really all need to get together and come up with a scheme
that actually works instead of piling these hacks over hacks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
