Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C13772350B
	for <lists.virtualization@lfdr.de>; Tue,  6 Jun 2023 04:06:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B3061136;
	Tue,  6 Jun 2023 02:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7B3061136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O82YPIPPf77G; Tue,  6 Jun 2023 02:06:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1C5A660F9A;
	Tue,  6 Jun 2023 02:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C5A660F9A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56344C008C;
	Tue,  6 Jun 2023 02:06:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D98FEC0029
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jun 2023 02:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A062440463
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jun 2023 02:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A062440463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0iitDSgOduZ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jun 2023 02:06:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEE0240227
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEE0240227
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jun 2023 02:06:41 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VkU7C4n_1686017194; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VkU7C4n_1686017194) by smtp.aliyun-inc.com;
 Tue, 06 Jun 2023 10:06:35 +0800
Message-ID: <1686016872.3496485-3-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost v10 07/10] virtio_ring: introduce helpers for
 premapped
Date: Tue, 6 Jun 2023 10:01:12 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20230602092206.50108-1-xuanzhuo@linux.alibaba.com>
 <20230602092206.50108-8-xuanzhuo@linux.alibaba.com>
 <20230604094122-mutt-send-email-mst@kernel.org>
 <1685930811.137484-1-xuanzhuo@linux.alibaba.com>
 <20230605013658-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230605013658-mutt-send-email-mst@kernel.org>
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

On Mon, 5 Jun 2023 01:38:48 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Mon, Jun 05, 2023 at 10:06:51AM +0800, Xuan Zhuo wrote:
> > On Sun, 4 Jun 2023 09:45:14 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Fri, Jun 02, 2023 at 05:22:03PM +0800, Xuan Zhuo wrote:
> > > > This patch introduces three helpers for premapped mode.
> > > >
> > > > * virtqueue_get_buf_premapped
> > > > * virtqueue_detach_unused_buf_premapped
> > > >
> > > > The above helpers work like the non-premapped funcs. But a cursor is
> > > > passed.
> > > >
> > > > virtqueue_detach is used to get the dma info of the last buf by
> > > >   cursor.
> > >
> > > This isn't very clear from the description but virtqueue_detach is
> > > also introduced by this patch as opposed to being used.
> > >
> > >
> > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > ---
> > > >  drivers/virtio/virtio_ring.c | 83 ++++++++++++++++++++++++++++++++++++
> > > >  include/linux/virtio.h       | 10 +++++
> > > >  2 files changed, 93 insertions(+)
> > > >
> > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > index cbc22daae7e1..6771b9661798 100644
> > > > --- a/drivers/virtio/virtio_ring.c
> > > > +++ b/drivers/virtio/virtio_ring.c
> > > > @@ -2555,6 +2555,66 @@ void *virtqueue_get_buf(struct virtqueue *_vq, unsigned int *len)
> > > >  	return virtqueue_get_buf_ctx(_vq, len, NULL);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(virtqueue_get_buf);
> > > > +
> > > > +/**
> > > > + * virtqueue_get_buf_premapped - get the next used buffer
> > > > + * @_vq: the struct virtqueue we're talking about.
> > > > + * @len: the length written into the buffer
> > > > + * @ctx: extra context for the token
> > > > + * @cursor: detach cursor
> > > > + *
> > > > + * If the device wrote data into the buffer, @len will be set to the
> > > > + * amount written.  This means you don't need to clear the buffer
> > > > + * beforehand to ensure there's no data leakage in the case of short
> > > > + * writes.
> > > > + *
> > > > + * Caller must ensure we don't call this with other virtqueue
> > > > + * operations at the same time (except where noted).
> > > > + *
> > > > + * This is used for the premapped vq. The cursor is passed by the dirver, that
> > > > + * is used for virtqueue_detach. That will be initialized by virtio core
> > > > + * internally.
> > > > + *
> > > > + * Returns NULL if there are no used buffers, or the "data" token
> > > > + * handed to virtqueue_add_*().
> > > > + */
> > > > +void *virtqueue_get_buf_premapped(struct virtqueue *_vq, unsigned int *len,
> > > > +				  void **ctx,
> > > > +				  struct virtqueue_detach_cursor *cursor)
> > > > +{
> > > > +	struct vring_virtqueue *vq = to_vvq(_vq);
> > > > +
> > > > +	return vq->packed_ring ? virtqueue_get_buf_ctx_packed(_vq, len, ctx, cursor) :
> > > > +				 virtqueue_get_buf_ctx_split(_vq, len, ctx, cursor);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(virtqueue_get_buf_premapped);
> > > > +
> > > > +/**
> > > > + * virtqueue_detach - get the dma info of last buf
> > >
> > > detach what from what then?
> > > I am guessing this is not the only thing this function does?
> > > sounds like a bad name for a function.
> >
> > Let me think of a good name
> >
> > >
> > > > + * @_vq: the struct virtqueue we're talking about.
> > > > + * @cursor: detach cursor
> > > > + * @addr: the dma address
> > >
> > > what address?  it's the 1st time you mention an address ...
> >
> > Will fix.
> >
> >
> > >
> > > > + * @len: the length of the dma address
> > > > + * @dir: the direction of the dma address
> > > > + *
> > > > + * This is used for the premapped vq. The cursor is initialized by
> > > > + * virtqueue_get_buf_premapped or virtqueue_detach_unused_buf_premapped.
> > > > + *
> > > > + * Returns:
> > > > + * -EAGAIN: there are more dma info, this function should be called more.
> > >
> > > here too, pls don't return -EAGAIN not in an error case.
> > > something like "1" will do.
> >
> > While I agree with you, -EAGAIN seems to be a commonly used method.
>
> Where is it used like this? A typical use is e.g. in read(2):
>
>       EAGAIN The file descriptor fd refers to a file other than a socket and has been marked nonblocking (O_NONBLOCK), and  the  read
>               would block.  See open(2) for further details on the O_NONBLOCK flag.
>
> a better analog here is read filling up all its buffer, in which
> case it returns the # of bytes returned.


Rethink about this, I confused some scenarios. I should return a value to
indicate there is more data. "1" might be a good choice

Will fix.

Thanks.

>
>
> > How about we
> > return EAGAIN instead of -EAGAIN ?
> >
> > Thanks.
> >
> >
> >
> > >
> > > > + * -EINVAL: the process is done, should not call this function
> > > > + * 0: no more dma info
> > > > + */
> > > > +int virtqueue_detach(struct virtqueue *_vq, struct virtqueue_detach_cursor *cursor,
> > > > +		     dma_addr_t *addr, u32 *len, enum dma_data_direction *dir)
> > > > +{
> > > > +	struct vring_virtqueue *vq = to_vvq(_vq);
> > > > +
> > > > +	return vq->packed_ring ? virtqueue_detach_packed(_vq, cursor, addr, len, dir) :
> > > > +				 virtqueue_detach_split(_vq, cursor, addr, len, dir);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(virtqueue_detach);
> > > > +
> > > >  /**
> > > >   * virtqueue_disable_cb - disable callbacks
> > > >   * @_vq: the struct virtqueue we're talking about.
> > > > @@ -2682,6 +2742,29 @@ void *virtqueue_detach_unused_buf(struct virtqueue *_vq)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(virtqueue_detach_unused_buf);
> > > >
> > > > +/**
> > > > + * virtqueue_detach_unused_buf_premapped - detach first unused buffer
> > > > + * @_vq: the struct virtqueue we're talking about.
> > > > + * @cursor: detach cursor
> > > > + *
> > > > + * This is used for the premapped vq. The cursor is passed by the dirver, that
> > > > + * is used for virtqueue_detach. That will be initialized by virtio core
> > > > + * internally.
> > > > + *
> > > > + * Returns NULL or the "data" token handed to virtqueue_add_*().
> > > > + * This is not valid on an active queue; it is useful for device
> > > > + * shutdown or the reset queue.
> > > > + */
> > > > +void *virtqueue_detach_unused_buf_premapped(struct virtqueue *_vq,
> > > > +					    struct virtqueue_detach_cursor *cursor)
> > > > +{
> > > > +	struct vring_virtqueue *vq = to_vvq(_vq);
> > > > +
> > > > +	return vq->packed_ring ? virtqueue_detach_unused_buf_packed(_vq, cursor) :
> > > > +				 virtqueue_detach_unused_buf_split(_vq, cursor);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(virtqueue_detach_unused_buf_premapped);
> > > > +
> > > >  static inline bool more_used(const struct vring_virtqueue *vq)
> > > >  {
> > > >  	return vq->packed_ring ? more_used_packed(vq) : more_used_split(vq);
> > > > diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> > > > index 7f137c7a9034..0a11c5b32fe5 100644
> > > > --- a/include/linux/virtio.h
> > > > +++ b/include/linux/virtio.h
> > > > @@ -3,6 +3,7 @@
> > > >  #define _LINUX_VIRTIO_H
> > > >  /* Everything a virtio driver needs to work with any particular virtio
> > > >   * implementation. */
> > > > +#include <linux/dma-mapping.h>
> > > >  #include <linux/types.h>
> > > >  #include <linux/scatterlist.h>
> > > >  #include <linux/spinlock.h>
> > > > @@ -88,6 +89,10 @@ void *virtqueue_get_buf(struct virtqueue *vq, unsigned int *len);
> > > >  void *virtqueue_get_buf_ctx(struct virtqueue *vq, unsigned int *len,
> > > >  			    void **ctx);
> > > >
> > > > +void *virtqueue_get_buf_premapped(struct virtqueue *_vq, unsigned int *len,
> > > > +				  void **ctx,
> > > > +				  struct virtqueue_detach_cursor *cursor);
> > > > +
> > > >  void virtqueue_disable_cb(struct virtqueue *vq);
> > > >
> > > >  bool virtqueue_enable_cb(struct virtqueue *vq);
> > > > @@ -101,6 +106,8 @@ bool virtqueue_poll(struct virtqueue *vq, unsigned);
> > > >  bool virtqueue_enable_cb_delayed(struct virtqueue *vq);
> > > >
> > > >  void *virtqueue_detach_unused_buf(struct virtqueue *vq);
> > > > +void *virtqueue_detach_unused_buf_premapped(struct virtqueue *_vq,
> > > > +					    struct virtqueue_detach_cursor *cursor);
> > > >
> > > >  unsigned int virtqueue_get_vring_size(const struct virtqueue *vq);
> > > >
> > > > @@ -114,6 +121,9 @@ dma_addr_t virtqueue_get_used_addr(const struct virtqueue *vq);
> > > >  int virtqueue_resize(struct virtqueue *vq, u32 num,
> > > >  		     void (*recycle)(struct virtqueue *vq, void *buf));
> > > >
> > > > +int virtqueue_detach(struct virtqueue *_vq, struct virtqueue_detach_cursor *cursor,
> > > > +		     dma_addr_t *addr, u32 *len, enum dma_data_direction *dir);
> > > > +
> > > >  /**
> > > >   * struct virtio_device - representation of a device using virtio
> > > >   * @index: unique position on the virtio bus
> > > > --
> > > > 2.32.0.3.g01195cf9f
> > >
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
