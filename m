Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C39738DF11
	for <lists.virtualization@lfdr.de>; Mon, 24 May 2021 04:07:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07BF0400F7;
	Mon, 24 May 2021 02:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJXZiXe61-7E; Mon, 24 May 2021 02:07:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3422400FE;
	Mon, 24 May 2021 02:07:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76C07C0001;
	Mon, 24 May 2021 02:07:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E8EFC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 02:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35E4360694
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 02:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjGLT-0s1S0g
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 02:07:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8160605A2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 02:07:07 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UZq363e_1621822023; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0UZq363e_1621822023) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 24 May 2021 10:07:03 +0800
MIME-Version: 1.0
Message-Id: <1621821978.04102-1-xuanzhuo@linux.alibaba.com>
Subject: Re: RE: [PATCH] virtio-net: fix the kzalloc/kfree mismatch problem
Date: Mon, 24 May 2021 10:06:18 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Guodeqing (A) <geffrey.guo@huawei.com>
In-Reply-To: <9e95be43a1c14065b9f339ee39cecd3c@huawei.com>
X-Mailing-List: netdev@vger.kernel.org
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, mst@redhat.com, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kuba@kernel.org,
 davem@davemloft.net
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

On Mon, 24 May 2021 01:48:53 +0000, Guodeqing (A) <geffrey.guo@huawei.com> wrote:
>
>
> > -----Original Message-----
> > From: Max Gurtovoy [mailto:mgurtovoy@nvidia.com]
> > Sent: Sunday, May 23, 2021 15:25
> > To: Guodeqing (A) <geffrey.guo@huawei.com>; mst@redhat.com
> > Cc: jasowang@redhat.com; davem@davemloft.net; kuba@kernel.org;
> > virtualization@lists.linux-foundation.org; netdev@vger.kernel.org
> > Subject: Re: [PATCH] virtio-net: fix the kzalloc/kfree mismatch problem
> >
> >
> > On 5/22/2021 11:02 AM, guodeqing wrote:
> > > If the virtio_net device does not suppurt the ctrl queue feature, the
> > > vi->ctrl was not allocated, so there is no need to free it.
> >
> > you don't need this check.
> >
> > from kfree doc:
> >
> > "If @objp is NULL, no operation is performed."
> >
> > This is not a bug. I've set vi->ctrl to be NULL in case !vi->has_cvq.
> >
> >
>   yes,  this is not a bug, the patch is just a optimization, because the vi->ctrl maybe
>   be freed which  was not allocated, this may give people a misunderstanding.
>   Thanks.


I think it may be enough to add a comment, and the code does not need to be
modified.

Thanks.

> > >
> > > Here I adjust the initialization sequence and the check of vi->has_cvq
> > > to slove this problem.
> > >
> > > Fixes: 	122b84a1267a ("virtio-net: don't allocate control_buf if not
> > supported")
> > > Signed-off-by: guodeqing <geffrey.guo@huawei.com>
> > > ---
> > >   drivers/net/virtio_net.c | 20 ++++++++++----------
> > >   1 file changed, 10 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c index
> > > 9b6a4a875c55..894f894d3a29 100644
> > > --- a/drivers/net/virtio_net.c
> > > +++ b/drivers/net/virtio_net.c
> > > @@ -2691,7 +2691,8 @@ static void virtnet_free_queues(struct
> > > virtnet_info *vi)
> > >
> > >   	kfree(vi->rq);
> > >   	kfree(vi->sq);
> > > -	kfree(vi->ctrl);
> > > +	if (vi->has_cvq)
> > > +		kfree(vi->ctrl);
> > >   }
> > >
> > >   static void _free_receive_bufs(struct virtnet_info *vi) @@ -2870,13
> > > +2871,6 @@ static int virtnet_alloc_queues(struct virtnet_info *vi)
> > >   {
> > >   	int i;
> > >
> > > -	if (vi->has_cvq) {
> > > -		vi->ctrl = kzalloc(sizeof(*vi->ctrl), GFP_KERNEL);
> > > -		if (!vi->ctrl)
> > > -			goto err_ctrl;
> > > -	} else {
> > > -		vi->ctrl = NULL;
> > > -	}
> > >   	vi->sq = kcalloc(vi->max_queue_pairs, sizeof(*vi->sq), GFP_KERNEL);
> > >   	if (!vi->sq)
> > >   		goto err_sq;
> > > @@ -2884,6 +2878,12 @@ static int virtnet_alloc_queues(struct
> > virtnet_info *vi)
> > >   	if (!vi->rq)
> > >   		goto err_rq;
> > >
> > > +	if (vi->has_cvq) {
> > > +		vi->ctrl = kzalloc(sizeof(*vi->ctrl), GFP_KERNEL);
> > > +		if (!vi->ctrl)
> > > +			goto err_ctrl;
> > > +	}
> > > +
> > >   	INIT_DELAYED_WORK(&vi->refill, refill_work);
> > >   	for (i = 0; i < vi->max_queue_pairs; i++) {
> > >   		vi->rq[i].pages = NULL;
> > > @@ -2902,11 +2902,11 @@ static int virtnet_alloc_queues(struct
> > > virtnet_info *vi)
> > >
> > >   	return 0;
> > >
> > > +err_ctrl:
> > > +	kfree(vi->rq);
> > >   err_rq:
> > >   	kfree(vi->sq);
> > >   err_sq:
> > > -	kfree(vi->ctrl);
> > > -err_ctrl:
> > >   	return -ENOMEM;
> > >   }
> > >
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
