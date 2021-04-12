Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC6C35C450
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 12:45:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06526402C2;
	Mon, 12 Apr 2021 10:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNGZek_c5mNB; Mon, 12 Apr 2021 10:45:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75AA1402C3;
	Mon, 12 Apr 2021 10:45:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B043C000A;
	Mon, 12 Apr 2021 10:45:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E573C000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 10:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C12F402C1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 10:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BSoqyP7qG-MU
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 10:45:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EA3C402C0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 10:45:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 374F36134F;
 Mon, 12 Apr 2021 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618224319;
 bh=/yFjMUiGPFNWMalqJeYQqR6ZQK8rTlZ0JOYyZI10Zdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uZy2CKXyxIM6LSMKsoGOrwjzJ/dzK4T3EygMvD1b5iY/Y9IS6+Iws23AYOEqSIrj6
 OdpJPAmBiJdx7juSCPSIRT56CER2Da7apU5bnf2PxfAHx9gY1c0uUPdOpivELFu2Mg
 eOOyS9JYEFqX0MDAtR5HdMr2QM1flv+b/ucccMOc=
Date: Mon, 12 Apr 2021 12:45:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 5.10 055/188] virtio_net: Do not pull payload in skb->head
Message-ID: <YHQkvAOytk+rH+LB@kroah.com>
References: <20210412084013.643370347@linuxfoundation.org>
 <20210412084015.479443671@linuxfoundation.org>
 <20210412051010-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412051010-mutt-send-email-mst@kernel.org>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>
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

On Mon, Apr 12, 2021 at 05:11:40AM -0400, Michael S. Tsirkin wrote:
> On Mon, Apr 12, 2021 at 10:39:29AM +0200, Greg Kroah-Hartman wrote:
> > From: Eric Dumazet <edumazet@google.com>
> > 
> > commit 0f6925b3e8da0dbbb52447ca8a8b42b371aac7db upstream.
> > 
> > Xuan Zhuo reported that commit 3226b158e67c ("net: avoid 32 x truesize
> > under-estimation for tiny skbs") brought  a ~10% performance drop.
> > 
> > The reason for the performance drop was that GRO was forced
> > to chain sk_buff (using skb_shinfo(skb)->frag_list), which
> > uses more memory but also cause packet consumers to go over
> > a lot of overhead handling all the tiny skbs.
> > 
> > It turns out that virtio_net page_to_skb() has a wrong strategy :
> > It allocates skbs with GOOD_COPY_LEN (128) bytes in skb->head, then
> > copies 128 bytes from the page, before feeding the packet to GRO stack.
> > 
> > This was suboptimal before commit 3226b158e67c ("net: avoid 32 x truesize
> > under-estimation for tiny skbs") because GRO was using 2 frags per MSS,
> > meaning we were not packing MSS with 100% efficiency.
> > 
> > Fix is to pull only the ethernet header in page_to_skb()
> > 
> > Then, we change virtio_net_hdr_to_skb() to pull the missing
> > headers, instead of assuming they were already pulled by callers.
> > 
> > This fixes the performance regression, but could also allow virtio_net
> > to accept packets with more than 128bytes of headers.
> > 
> > Many thanks to Xuan Zhuo for his report, and his tests/help.
> > 
> > Fixes: 3226b158e67c ("net: avoid 32 x truesize under-estimation for tiny skbs")
> > Reported-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Link: https://www.spinics.net/lists/netdev/msg731397.html
> > Co-Developed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Signed-off-by: Eric Dumazet <edumazet@google.com>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: virtualization@lists.linux-foundation.org
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > Signed-off-by: David S. Miller <davem@davemloft.net>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> 
> 
> Note that an issue related to this patch was recently reported.
> It's quite possible that the root cause is a bug elsewhere
> in the kernel, but it probably makes sense to defer the backport
> until we know more ...

Thanks, I'll go drop it from all 4 queues.  If you all find out that all
is good, and it should be added back, please let us at stable@vger know
about it.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
