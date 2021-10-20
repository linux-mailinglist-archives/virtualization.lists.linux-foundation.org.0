Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5A143437E
	for <lists.virtualization@lfdr.de>; Wed, 20 Oct 2021 04:22:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF5683083;
	Wed, 20 Oct 2021 02:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9uiDmrDNaetQ; Wed, 20 Oct 2021 02:22:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3495083005;
	Wed, 20 Oct 2021 02:22:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C41ECC0022;
	Wed, 20 Oct 2021 02:22:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F02ECC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 02:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9593400DA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 02:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuN7g9L-qhE8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 02:21:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C93B40018
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 02:21:56 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0Ut.Y3KM_1634696513; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Ut.Y3KM_1634696513) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 20 Oct 2021 10:21:53 +0800
MIME-Version: 1.0
message-id: <1634696386.1682892-1-xuanzhuo@linux.alibaba.com>
subject: Re: [PATCH v4 2/2] virtio_ring: check desc == NULL when using
 indirect with packed
date: Wed, 20 Oct 2021 10:19:46 +0800
from: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
to: Michael S. Tsirkin <mst@redhat.com>
in-reply-to: <20211019091947-mutt-send-email-mst@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Tiwei Bie <tiwei.bie@intel.com>,
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

On Tue, 19 Oct 2021 09:21:51 -0400, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Tue, Oct 19, 2021 at 07:52:35PM +0800, Xuan Zhuo wrote:
> > When using indirect with packed, we don't check for allocation failures.
> > This patch checks that and fall back on direct.
> >
> > Fixes: 1ce9e6055fa ("virtio_ring: introduce packed ring support")
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >  drivers/virtio/virtio_ring.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index 91a46c4da87d..44a03b6e4dc4 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -1065,6 +1065,9 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
> >
> >  	head = vq->packed.next_avail_idx;
> >  	desc = alloc_indirect_packed(total_sg, gfp);
> > +	if (!desc)
> > +		/* fall back on direct */
>
> this comment belongs in virtqueue_add_packed right after
> return.
>
> > +		return -EAGAIN;
> >
>
> -ENOMEM surely?

virtqueue_add_indirect_packed() will return -ENOMEM when dma mmap fails, so we
have to choose a different error code.

Thanks.

>
> >  	if (unlikely(vq->vq.num_free < 1)) {
> >  		pr_debug("Can't add buf len 1 - avail = 0\n");
> > @@ -1176,6 +1179,7 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
> >  	unsigned int i, n, c, descs_used, err_idx;
> >  	__le16 head_flags, flags;
> >  	u16 head, id, prev, curr, avail_used_flags;
> > +	int err;
> >
> >  	START_USE(vq);
> >
> > @@ -1191,9 +1195,12 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
> >
> >  	BUG_ON(total_sg == 0);
> >
> > -	if (virtqueue_use_indirect(_vq, total_sg))
> > -		return virtqueue_add_indirect_packed(vq, sgs, total_sg,
> > -				out_sgs, in_sgs, data, gfp);
> > +	if (virtqueue_use_indirect(_vq, total_sg)) {
> > +		err = virtqueue_add_indirect_packed(vq, sgs, total_sg, out_sgs,
> > +						    in_sgs, data, gfp);
> > +		if (err != -EAGAIN)
> > +			return err;
> > +	}
> >
> >  	head = vq->packed.next_avail_idx;
> >  	avail_used_flags = vq->packed.avail_used_flags;
> > --
> > 2.31.0
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
