Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9E4EBD4D
	for <lists.virtualization@lfdr.de>; Wed, 30 Mar 2022 11:11:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8310D60B75;
	Wed, 30 Mar 2022 09:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iais058xSz46; Wed, 30 Mar 2022 09:11:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3869860BFC;
	Wed, 30 Mar 2022 09:11:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87F87C0082;
	Wed, 30 Mar 2022 09:11:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C676C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 09:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 825D841C16
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 09:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPkVFr7B7Rdl
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 09:11:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF90E41C17
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 09:11:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R421e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V8d5iwz_1648631473; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V8d5iwz_1648631473) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 30 Mar 2022 17:11:14 +0800
Message-ID: <1648631012.1186295-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v2 0/9] virtio: support advance DMA
Date: Wed, 30 Mar 2022 17:03:32 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20220224110402.108161-1-xuanzhuo@linux.alibaba.com>
 <20220330023258-mutt-send-email-mst@kernel.org>
 <CACGkMEvESXv9PfMF9riPraX59j0BiLPfTgxuFVw1x0HWwjtYVQ@mail.gmail.com>
 <1648623508.9711535-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEvE_wUNa=DgumVErTjp5gF4QRMDn6eP7UbDpSfSJSBy2Q@mail.gmail.com>
In-Reply-To: <CACGkMEvE_wUNa=DgumVErTjp5gF4QRMDn6eP7UbDpSfSJSBy2Q@mail.gmail.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev <netdev@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Jakub Kicinski <kuba@kernel.org>,
 "open list:XDP \(eXpress Data Path\)" <bpf@vger.kernel.org>,
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

On Wed, 30 Mar 2022 16:38:18 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Wed, Mar 30, 2022 at 2:59 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >
> > On Wed, 30 Mar 2022 14:56:17 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > On Wed, Mar 30, 2022 at 2:34 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Thu, Feb 24, 2022 at 07:03:53PM +0800, Xuan Zhuo wrote:
> > > > > virtqueue_add() only supports virtual addresses, dma is completed in
> > > > > virtqueue_add().
> > > > >
> > > > > In some scenarios (such as the AF_XDP scenario), DMA is completed in advance, so
> > > > > it is necessary for us to support passing the DMA address to virtqueue_add().
> > > >
> > > > I picked up a couple of patches. Others are waiting for some acks
> > > > (Jason?) and improved commit logs for documentation.
> > >
> > > I will review them.
> >
> > hi, the core code of premapped, I will merge it into 'virtio pci support
> > VIRTIO_F_RING_RESET' because this function will be used when reusing the buffer
> > after resize.
>
> I still prefer not to do that.
>
> We can make rest work for resize first and add pre mapping on top. It
> will simplify the review.

Yes, I am also worried about the review problem, the number of my local resize
patch has reached 44 (including reuse bufs).

hi, Michael, can we implement resize on top of v8 first? (drop unused bufs directly)

Then we implement premmapd and reuse the bufs after resize.

We need to get the address (DMA address) and len from the reset ring and submit
it to the new vq through virtqueue_add(). So let virtqueue_add() support
premapped first.

Thanks.


>
> Thanks
>
> >
> > Thanks.
> >
> >
> > >
> > > Thanks
> > >
> > > >
> > > > Thanks!
> > > >
> > > > > v2:
> > > > >     1. rename predma -> premapped
> > > > >     2. virtio net xdp tx use virtio dma api
> > > > >
> > > > > v1:
> > > > >    1. All sgs requested at one time are required to be unified PREDMA, and several
> > > > >       of them are not supported to be PREDMA
> > > > >    2. virtio_dma_map() is removed from this patch set and will be submitted
> > > > >       together with the next time AF_XDP supports virtio dma
> > > > >    3. Added patch #2 #3 to remove the check for flags when performing unmap
> > > > >       indirect desc
> > > > >
> > > > > Xuan Zhuo (9):
> > > > >   virtio_ring: rename vring_unmap_state_packed() to
> > > > >     vring_unmap_extra_packed()
> > > > >   virtio_ring: remove flags check for unmap split indirect desc
> > > > >   virtio_ring: remove flags check for unmap packed indirect desc
> > > > >   virtio_ring: virtqueue_add() support premapped
> > > > >   virtio_ring: split: virtqueue_add_split() support premapped
> > > > >   virtio_ring: packed: virtqueue_add_packed() support premapped
> > > > >   virtio_ring: add api virtio_dma_map() for advance dma
> > > > >   virtio_ring: introduce virtqueue_add_outbuf_premapped()
> > > > >   virtio_net: xdp xmit use virtio dma api
> > > > >
> > > > >  drivers/net/virtio_net.c     |  42 +++++-
> > > > >  drivers/virtio/virtio_ring.c | 280 ++++++++++++++++++++++++++---------
> > > > >  include/linux/virtio.h       |  12 ++
> > > > >  3 files changed, 254 insertions(+), 80 deletions(-)
> > > > >
> > > > > --
> > > > > 2.31.0
> > > >
> > >
> >
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
