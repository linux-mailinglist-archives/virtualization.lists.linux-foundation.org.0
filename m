Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 547AC597FE1
	for <lists.virtualization@lfdr.de>; Thu, 18 Aug 2022 10:13:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8F7560BDE;
	Thu, 18 Aug 2022 08:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F7560BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeMO-_6tkMbA; Thu, 18 Aug 2022 08:13:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AB01260C27;
	Thu, 18 Aug 2022 08:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB01260C27
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E34D0C0078;
	Thu, 18 Aug 2022 08:13:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBD71C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Aug 2022 08:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC6684018
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Aug 2022 08:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEC6684018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-02E5Y2Oqav
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Aug 2022 08:13:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4EE281AEF
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4EE281AEF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Aug 2022 08:13:22 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VMa.3TX_1660810396; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VMa.3TX_1660810396) by smtp.aliyun-inc.com;
 Thu, 18 Aug 2022 16:13:16 +0800
Message-ID: <1660810363.7875404-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v2] virtio/virtio_pci_legacy: debug checking for queue size
Date: Thu, 18 Aug 2022 16:12:43 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20220818030404.128597-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEvTPLf=Lg_43jSHFuq12xZdYP_c21tsot3ns7sP=Yreag@mail.gmail.com>
In-Reply-To: <CACGkMEvTPLf=Lg_43jSHFuq12xZdYP_c21tsot3ns7sP=Yreag@mail.gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, 18 Aug 2022 16:10:45 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Thu, Aug 18, 2022 at 11:04 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >
> > Legacy virtio pci has no way to communicate a change in vq size to
> > the hypervisor. If ring sizes don't match hypervisor will happily
> > corrupt memory.
> >
> > We add a check to vring size before calling
> > vp_legacy_set_queue_address(). Checking the memory range directly is a
> > bit cumbersome.
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >
> > v2: replace BUG_ON with WARN_ON_ONCE. @Linus
> >
> >  drivers/virtio/virtio_pci_legacy.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
> > index 2257f1b3d8ae..091e73d74e94 100644
> > --- a/drivers/virtio/virtio_pci_legacy.c
> > +++ b/drivers/virtio/virtio_pci_legacy.c
> > @@ -146,6 +146,15 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
> >                 goto out_del_vq;
> >         }
> >
> > +       /* Legacy virtio pci has no way to communicate a change in vq size to
> > +        * the hypervisor. If ring sizes don't match hypervisor will happily
> > +        * corrupt memory.
> > +        */
> > +       if (WARN_ON_ONCE(num != virtqueue_get_vring_size(vq))) {
> > +               err = -EPERM;
> > +               goto out_del_vq;
> > +       }
>
> I wonder if it's better to have a num_min instead.


num_min?

What is that?

Thanks.

>
> Thanks
>
> > +
> >         /* activate the queue */
> >         vp_legacy_set_queue_address(&vp_dev->ldev, index, q_pfn);
> >
> > --
> > 2.31.0
> >
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
