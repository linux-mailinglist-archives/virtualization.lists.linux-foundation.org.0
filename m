Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CD141388ED3
	for <lists.virtualization@lfdr.de>; Wed, 19 May 2021 15:18:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 670F64063D;
	Wed, 19 May 2021 13:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUBOdCeA3Cq1; Wed, 19 May 2021 13:18:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5C2406A9;
	Wed, 19 May 2021 13:18:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DB13C0001;
	Wed, 19 May 2021 13:18:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5B63C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C42B383DDD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VptLRKAZiu2u
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:17:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A766083E31
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:17:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0UZQFB7T_1621430275; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0UZQFB7T_1621430275) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 19 May 2021 21:17:55 +0800
MIME-Version: 1.0
Message-Id: <1621430043.1216998-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio: Introduce a new kick interface
 virtqueue_kick_try()
Date: Wed, 19 May 2021 21:14:03 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Michael S. Tsirkin <mst@redhat.com>
In-Reply-To: <20210519083900-mutt-send-email-mst@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
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

On Wed, 19 May 2021 08:44:01 -0400, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Wed, May 19, 2021 at 07:47:57PM +0800, Xuan Zhuo wrote:
> > Unlike virtqueue_kick(), virtqueue_kick_try() returns true only when the
> > kick is successful. In virtio-net, we want to count the number of kicks.
> > So we need an interface that can perceive whether the kick is actually
> > executed.
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >  drivers/net/virtio_net.c     |  8 ++++----
> >  drivers/virtio/virtio_ring.c | 20 ++++++++++++++++++++
> >  include/linux/virtio.h       |  2 ++
> >  3 files changed, 26 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 9b6a4a875c55..167697030cb6 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -617,7 +617,7 @@ static int virtnet_xdp_xmit(struct net_device *dev,
> >  	ret = nxmit;
> >
> >  	if (flags & XDP_XMIT_FLUSH) {
> > -		if (virtqueue_kick_prepare(sq->vq) && virtqueue_notify(sq->vq))
> > +		if (virtqueue_kick_try(sq->vq))
> >  			kicks = 1;
> >  	}
> >  out:
> > @@ -1325,7 +1325,7 @@ static bool try_fill_recv(struct virtnet_info *vi, struct receive_queue *rq,
> >  		if (err)
> >  			break;
> >  	} while (rq->vq->num_free);
> > -	if (virtqueue_kick_prepare(rq->vq) && virtqueue_notify(rq->vq)) {
> > +	if (virtqueue_kick_try(rq->vq)) {
> >  		unsigned long flags;
> >
> >  		flags = u64_stats_update_begin_irqsave(&rq->stats.syncp);
> > @@ -1533,7 +1533,7 @@ static int virtnet_poll(struct napi_struct *napi, int budget)
> >
> >  	if (xdp_xmit & VIRTIO_XDP_TX) {
> >  		sq = virtnet_xdp_get_sq(vi);
> > -		if (virtqueue_kick_prepare(sq->vq) && virtqueue_notify(sq->vq)) {
> > +		if (virtqueue_kick_try(sq->vq)) {
> >  			u64_stats_update_begin(&sq->stats.syncp);
> >  			sq->stats.kicks++;
> >  			u64_stats_update_end(&sq->stats.syncp);
> > @@ -1710,7 +1710,7 @@ static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
> >  	}
> >
> >  	if (kick || netif_xmit_stopped(txq)) {
> > -		if (virtqueue_kick_prepare(sq->vq) && virtqueue_notify(sq->vq)) {
> > +		if (virtqueue_kick_try(sq->vq)) {
> >  			u64_stats_update_begin(&sq->stats.syncp);
> >  			sq->stats.kicks++;
> >  			u64_stats_update_end(&sq->stats.syncp);
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index 71e16b53e9c1..1462be756875 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -1874,6 +1874,26 @@ bool virtqueue_kick(struct virtqueue *vq)
> >  }
> >  EXPORT_SYMBOL_GPL(virtqueue_kick);
> >
> > +/**
> > + * virtqueue_kick_try - try update after add_buf
> > + * @vq: the struct virtqueue
> > + *
> > + * After one or more virtqueue_add_* calls, invoke this to kick
> > + * the other side.
> > + *
> > + * Caller must ensure we don't call this with other virtqueue
> > + * operations at the same time (except where noted).
> > + *
> > + * Returns true if kick success, otherwise false.
>
> so what is the difference between this and virtqueue_kick
> which says
>
>  * Returns false if kick failed, otherwise true.

Calling virtqueue_kick, we can only know whether there is a kick failure, we
don't know whether kick is called. It may return true, but kick is not called.

virtqueue_kick_try() returns true only if the kick is successful, so that we can
know whether kick has been called based on the return value, so as to count the
number of kick calls.

Thanks.

>
>
>
>
>
>
>
> > + */
> > +bool virtqueue_kick_try(struct virtqueue *vq)
> > +{
> > +	if (virtqueue_kick_prepare(vq) && virtqueue_notify(vq))
> > +		return true;
> > +	return false;
> > +}
> > +EXPORT_SYMBOL_GPL(virtqueue_kick_try);
> > +
> >  /**
> >   * virtqueue_get_buf - get the next used buffer
> >   * @_vq: the struct virtqueue we're talking about.
> > diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> > index b1894e0323fa..45cd6a0af24d 100644
> > --- a/include/linux/virtio.h
> > +++ b/include/linux/virtio.h
> > @@ -59,6 +59,8 @@ int virtqueue_add_sgs(struct virtqueue *vq,
> >
> >  bool virtqueue_kick(struct virtqueue *vq);
> >
> > +bool virtqueue_kick_try(struct virtqueue *vq);
> > +
> >  bool virtqueue_kick_prepare(struct virtqueue *vq);
> >
> >  bool virtqueue_notify(struct virtqueue *vq);
> > --
> > 2.31.0
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
