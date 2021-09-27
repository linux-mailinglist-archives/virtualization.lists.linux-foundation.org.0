Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0E9418DEE
	for <lists.virtualization@lfdr.de>; Mon, 27 Sep 2021 05:29:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05504402B5;
	Mon, 27 Sep 2021 03:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFCX6S4I70m2; Mon, 27 Sep 2021 03:29:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DEA6E40555;
	Mon, 27 Sep 2021 03:29:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61E56C001E;
	Mon, 27 Sep 2021 03:29:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A21FC000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 03:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0356E6063A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 03:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-vcMK8k6R9R
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 03:29:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC5D3605CB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 03:29:22 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0UpgQzEI_1632713359; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0UpgQzEI_1632713359) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 27 Sep 2021 11:29:19 +0800
MIME-Version: 1.0
message-id: <1632713121.4676855-1-xuanzhuo@linux.alibaba.com>
subject: Re: [PATCH] virtio_ring: check desc == NULL when packed and indirect
date: Mon, 27 Sep 2021 11:25:21 +0800
from: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
to: Jason Wang <jasowang@redhat.com>
in-reply-to: <CACGkMEtaXD=0zPoiLxrXbqBQPZF4ZLWvm_dNkSnf6s3H+-VRgA@mail.gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Tiwei Bie <tiwei.bie@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>
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

On Mon, 27 Sep 2021 11:20:16 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Mon, Sep 27, 2021 at 11:06 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >
> > In the case of packed, use indirect desc, since desc is allocated by
> > kmalloc_array(), we should check whether its return value is NULL.
> >
> > Fixes: 1ce9e6055fa ("virtio_ring: introduce packed ring support")
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >  drivers/virtio/virtio_ring.c | 27 ++++++++++++++++-----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index dd95dfd85e98..7dd381eae725 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -1050,21 +1050,20 @@ static struct vring_packed_desc *alloc_indirect_packed(unsigned int total_sg,
> >  }
> >
> >  static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
> > -                                      struct scatterlist *sgs[],
> > -                                      unsigned int total_sg,
> > -                                      unsigned int out_sgs,
> > -                                      unsigned int in_sgs,
> > -                                      void *data,
> > -                                      gfp_t gfp)
> > +                                        struct scatterlist *sgs[],
> > +                                        struct vring_packed_desc *desc,
> > +                                        unsigned int total_sg,
> > +                                        unsigned int out_sgs,
> > +                                        unsigned int in_sgs,
> > +                                        void *data,
> > +                                        gfp_t gfp)
>
> It looks to me the style changes are mixed with bug fix here.


I will make a separate patch for the next version.

>
> >  {
> > -       struct vring_packed_desc *desc;
> >         struct scatterlist *sg;
> >         unsigned int i, n, err_idx;
> >         u16 head, id;
> >         dma_addr_t addr;
> >
> >         head = vq->packed.next_avail_idx;
> > -       desc = alloc_indirect_packed(total_sg, gfp);
> >
> >         if (unlikely(vq->vq.num_free < 1)) {
> >                 pr_debug("Can't add buf len 1 - avail = 0\n");
> > @@ -1191,9 +1190,15 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
> >
> >         BUG_ON(total_sg == 0);
> >
> > -       if (virtqueue_use_indirect(_vq, total_sg))
> > -               return virtqueue_add_indirect_packed(vq, sgs, total_sg,
> > -                               out_sgs, in_sgs, data, gfp);
> > +       if (virtqueue_use_indirect(_vq, total_sg)) {
> > +               desc = alloc_indirect_packed(total_sg, gfp);
> > +               if (desc) {
> > +                       return virtqueue_add_indirect_packed(vq, sgs, desc,
> > +                                                            total_sg,
> > +                                                            out_sgs, in_sgs,
> > +                                                            data, gfp);
> > +               }
> > +       }
>
> Any reason that we can't fix virtqueue_add_indirect_packed()? It can
> help to reduce the changeset and ease the backport.

The purpose of this is to fall back to not using indirect when
alloc_indirect_packed returns NULL.

If we check the return value of alloc_indirect_packed() in
virtqueue_add_indirect_packed(), then MUST check the error returned by
virtqueue_add_indirect_packed() to determine whether to fall back to the mode
that does not use indirect.

Thanks.

>
> Thanks
>
> >
> >         head = vq->packed.next_avail_idx;
> >         avail_used_flags = vq->packed.avail_used_flags;
> > --
> > 2.31.0
> >
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
