Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DA7C6CA3
	for <lists.virtualization@lfdr.de>; Thu, 12 Oct 2023 13:45:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C5EE81EC9;
	Thu, 12 Oct 2023 11:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C5EE81EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RX6XT3GmY2cQ; Thu, 12 Oct 2023 11:45:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EBA5E81ECD;
	Thu, 12 Oct 2023 11:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBA5E81ECD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25044C0DD3;
	Thu, 12 Oct 2023 11:45:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6F79C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 11:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C257B81ECD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 11:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C257B81ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DRecEOVLLZB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 11:45:28 +0000 (UTC)
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF68B81EC9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 11:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF68B81EC9
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0Vu-YBhg_1697111118; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vu-YBhg_1697111118) by smtp.aliyun-inc.com;
 Thu, 12 Oct 2023 19:45:19 +0800
Message-ID: <1697110565.721146-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost 01/22] virtio_ring: virtqueue_set_dma_premapped
 support disable
Date: Thu, 12 Oct 2023 19:36:05 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20231011092728.105904-1-xuanzhuo@linux.alibaba.com>
 <20231011092728.105904-2-xuanzhuo@linux.alibaba.com>
 <20231012051416-mutt-send-email-mst@kernel.org>
 <1697102334.7060938-2-xuanzhuo@linux.alibaba.com>
 <20231012053812-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231012053812-mutt-send-email-mst@kernel.org>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

On Thu, 12 Oct 2023 05:40:38 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Thu, Oct 12, 2023 at 05:18:54PM +0800, Xuan Zhuo wrote:
> > On Thu, 12 Oct 2023 05:15:52 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Wed, Oct 11, 2023 at 05:27:07PM +0800, Xuan Zhuo wrote:
> > > > virtqueue_set_dma_premapped() adds a new parameter to disable the
> > > > virtqueue premapped mode.
> > > >
> > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > ---
> > > >  drivers/net/virtio_net.c     |  2 +-
> > > >  drivers/virtio/virtio_ring.c | 11 ++++++++---
> > > >  include/linux/virtio.h       |  2 +-
> > > >  3 files changed, 10 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > index fe7f314d65c9..6b5f47ebf9b2 100644
> > > > --- a/drivers/net/virtio_net.c
> > > > +++ b/drivers/net/virtio_net.c
> > > > @@ -737,7 +737,7 @@ static void virtnet_rq_set_premapped(struct virtnet_info *vi)
> > > >  		return;
> > > >
> > > >  	for (i = 0; i < vi->max_queue_pairs; i++) {
> > > > -		if (virtqueue_set_dma_premapped(vi->rq[i].vq))
> > > > +		if (virtqueue_set_dma_premapped(vi->rq[i].vq, true))
> > > >  			continue;
> > > >
> > > >  		vi->rq[i].do_dma = true;
> > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > index 51d8f3299c10..b3ded56722f4 100644
> > > > --- a/drivers/virtio/virtio_ring.c
> > > > +++ b/drivers/virtio/virtio_ring.c
> > > > @@ -2784,7 +2784,7 @@ EXPORT_SYMBOL_GPL(virtqueue_resize);
> > > >   * 0: success.
> > > >   * -EINVAL: vring does not use the dma api, so we can not enable premapped mode.
> > > >   */
> > > > -int virtqueue_set_dma_premapped(struct virtqueue *_vq)
> > > > +int virtqueue_set_dma_premapped(struct virtqueue *_vq, bool mode)
> > > >  {
> > > >  	struct vring_virtqueue *vq = to_vvq(_vq);
> > > >  	u32 num;
> > > > @@ -2803,8 +2803,13 @@ int virtqueue_set_dma_premapped(struct virtqueue *_vq)
> > > >  		return -EINVAL;
> > > >  	}
> > > >
> > > > -	vq->premapped = true;
> > > > -	vq->do_unmap = false;
> > > > +	if (mode) {
> > > > +		vq->premapped = true;
> > > > +		vq->do_unmap = false;
> > > > +	} else {
> > > > +		vq->premapped = false;
> > > > +		vq->do_unmap = vq->use_dma_api;
> > > > +	}
> > > >
> > > >  	END_USE(vq);
> > > >
> > > > diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> > > > index 4cc614a38376..1cf7b004348b 100644
> > > > --- a/include/linux/virtio.h
> > > > +++ b/include/linux/virtio.h
> > > > @@ -81,7 +81,7 @@ bool virtqueue_enable_cb(struct virtqueue *vq);
> > > >
> > > >  unsigned virtqueue_enable_cb_prepare(struct virtqueue *vq);
> > > >
> > > > -int virtqueue_set_dma_premapped(struct virtqueue *_vq);
> > > > +int virtqueue_set_dma_premapped(struct virtqueue *_vq, bool mode);
> > > >
> > > >  bool virtqueue_poll(struct virtqueue *vq, unsigned);
> > >
> > > Wait a sec I thought we never change premapped. If you make this
> > > dynamic don't you need a bunch of locking?
> > > Or maybe queue is empty when you change this?
> > > If yes pls add a bunch of BUG_ON checks to make sure this is not misused.
> >
> >
> > Actually, this api is called immediately after the vq init or vq reset.
> >
> > We already have such a check.
> >
> > Thanks.
> >
> > /**
> >  * virtqueue_set_dma_premapped - set the vring premapped mode
> >  * @_vq: the struct virtqueue we're talking about.
> >  *
> >  * Enable the premapped mode of the vq.
> >  *
> >  * The vring in premapped mode does not do dma internally, so the driver must
> >  * do dma mapping in advance. The driver must pass the dma_address through
> >  * dma_address of scatterlist. When the driver got a used buffer from
> >  * the vring, it has to unmap the dma address.
> >  *
> >  * This function must be called immediately after creating the vq, or after vq
> >  * reset, and before adding any buffers to it.
> >  *
> >  * Caller must ensure we don't call this with other virtqueue operations
> >  * at the same time (except where noted).
> >  *
> >  * Returns zero or a negative error.
> >  * 0: success.
> >  * -EINVAL: vring does not use the dma api, so we can not enable premapped mode.
> >  */
> > int virtqueue_set_dma_premapped(struct virtqueue *_vq, bool mode)
> > {
> > 	struct vring_virtqueue *vq = to_vvq(_vq);
> > 	u32 num;
> >
> > 	START_USE(vq);
> >
> > 	num = vq->packed_ring ? vq->packed.vring.num : vq->split.vring.num;
> >
> > -->	if (num != vq->vq.num_free) {
> > 		END_USE(vq);
> > 		return -EINVAL;
> > 	}
>
> But it turns out virtnet_rq_set_premapped actually just ignores errors.
> So returning EINVAL here does nothing caller just proceeds?
> And checking num_free without locks is never safe anyway.

The premise of all this is that this is called immediately after reset or init.
So here, this error doesn't occur, so I didn't check.

Regarding the lock issue, there will be no race for either rq or sq.
rq is called after init vq, and there is no race at this time.

In this patch set, sq is called during reset, and there will be no race.
So I think it's safe.

> I think the point is that this never triggers then just BUG_ON.
>

Yes, I agree, it would be better to use BUG_ON.

The next verion will remove this commit, because I will put the patch set
to the net-next. So I will not let the premapped to be dynamic.

About the BUG_ON, I will post a patch to fix that.

Thanks.


>
> >
> > 	if (!vq->use_dma_api) {
> > 		END_USE(vq);
> > 		return -EINVAL;
> > 	}
> >
> > 	if (mode) {
> > 		vq->premapped = true;
> > 		vq->do_unmap = false;
> > 	} else {
> > 		vq->premapped = false;
> > 		vq->do_unmap = vq->use_dma_api;
> > 	}
> >
> > 	END_USE(vq);
> >
> > 	return 0;
> > }
> > EXPORT_SYMBOL_GPL(virtqueue_set_dma_premapped);
> >
> >
> > >
> > >
> > > > --
> > > > 2.32.0.3.g01195cf9f
> > >
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
