Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C9969D829
	for <lists.virtualization@lfdr.de>; Tue, 21 Feb 2023 02:50:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80F824012A;
	Tue, 21 Feb 2023 01:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F824012A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XgHXPrjo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQ1fp1f7Uw2L; Tue, 21 Feb 2023 01:50:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A205740286;
	Tue, 21 Feb 2023 01:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A205740286
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBDDAC007C;
	Tue, 21 Feb 2023 01:50:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D79FAC002B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Feb 2023 01:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B295540286
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Feb 2023 01:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B295540286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cSsQMC16xxu
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Feb 2023 01:50:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34BB94012A
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34BB94012A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Feb 2023 01:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676944199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/DY70CMvS/TN+XutRMzZuXilGEBIVpnLBguHqem0b0=;
 b=XgHXPrjoHQLrAK5Al3GfoZRu3QUndLpsJ6VYq+qDmbzCJZJzUBNGwF7Su5FpYAnnRDUbJP
 PtshR+1VOJBXq+59NMR39KsQJgUXV/rawSTLOSyoSUPLa+94YHXAvGJtHdhn1qzRMwIgiZ
 6vX8PViC1nv0nAMdMy7ugx54L547h7Y=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-ieiHeTASNDq5Q472edTVFA-1; Mon, 20 Feb 2023 20:49:57 -0500
X-MC-Unique: ieiHeTASNDq5Q472edTVFA-1
Received: by mail-oo1-f71.google.com with SMTP id
 n10-20020a4ad12a000000b0051f97e7b7f9so583294oor.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Feb 2023 17:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i/DY70CMvS/TN+XutRMzZuXilGEBIVpnLBguHqem0b0=;
 b=meMXhlofbyLIeda42ZaDrFpD3b10QyPwyL1gn0vkY7E1G5SY6TLF1rIp1bPsaBRvsI
 xtsd4GID9ufpksJCMCbrWOkXdXzZbVnGgbzwA1erP38pFA1Ke2v0oIT8iYboL73rp2U6
 MIoFr41qMlLNkFODzqIB+5dUGWj/OKqW8LA61xwsfGNAFUh4mhSxKz2jXrFa2p8VOgHA
 0VDF3ZK7i1S/JdyvBXtHSKmbpXg74EgCTnCxVZ8NstAIxUnHFiWW5PTUrIoMtSXMyCmB
 O7K+2rhn5wdnpvb/e3fBWodGzMriEHa7VO1SxT/5HWSPffWHuzvj4jiRVIRvoIhg/J1N
 UGkw==
X-Gm-Message-State: AO0yUKVEM3BmjJ9DYqJRJi6ncQIvVPctN0e6cz49tbz5Rcz7c9fuo+8q
 SlihLOM27MuA50YUfgs22dA4H6KarT4GnEBuA2Dk5rgHO5DnMqdyP+NlKJoUkh/EzK07oQkymEF
 k6q3U8N3KopQh0uJaQnFxhoOWpWHt0WL+gDkIo7ffdb79o/e0i4vsg97jsQ==
X-Received: by 2002:a05:6808:1812:b0:37a:3ebc:d282 with SMTP id
 bh18-20020a056808181200b0037a3ebcd282mr1150679oib.217.1676944197026; 
 Mon, 20 Feb 2023 17:49:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/JC/w8xGl4FLSNEkpzuwA2HQ4Uc6GkccF1DKLQWZD17gnqaJRZbNqHuyjw+xQHZ4uS+Oka50myxD7PtSlmYW0=
X-Received: by 2002:a05:6808:1812:b0:37a:3ebc:d282 with SMTP id
 bh18-20020a056808181200b0037a3ebcd282mr1150677oib.217.1676944196675; Mon, 20
 Feb 2023 17:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20230214072704.126660-1-xuanzhuo@linux.alibaba.com>
 <20230214072704.126660-5-xuanzhuo@linux.alibaba.com>
 <CACGkMEvWG1VVPHQd64SsdB52tgimoN_Dd6QT2Uvc5S8Qmrdcow@mail.gmail.com>
 <1676875439.7257378-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1676875439.7257378-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Feb 2023 09:49:45 +0800
Message-ID: <CACGkMEstgYx3Z+_mCJUKh=551BXU23dgfEf6fYTYAbnZY3rmDA@mail.gmail.com>
Subject: Re: [PATCH vhost 04/10] virtio_ring: split: introduce
 virtqueue_add_split_premapped()
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
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

On Mon, Feb 20, 2023 at 2:56 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> On Mon, 20 Feb 2023 13:38:13 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > On Tue, Feb 14, 2023 at 3:27 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > >
> > > virtqueue_add_split() only supports virtual addresses, dma is completed
> > > in virtqueue_add_split().
> > >
> > > In some scenarios (such as the AF_XDP scenario), the memory is allocated
> > > and DMA is completed in advance, so it is necessary for us to support
> > > passing the DMA address to virtio core.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >  drivers/virtio/virtio_ring.c | 100 +++++++++++++++++++++++++++++++++--
> > >  include/linux/virtio.h       |   5 ++
> > >  2 files changed, 100 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > index 47b6f9152f9f..a31155abe101 100644
> > > --- a/drivers/virtio/virtio_ring.c
> > > +++ b/drivers/virtio/virtio_ring.c
> > > @@ -70,6 +70,7 @@
> > >  struct vring_desc_state_split {
> > >         void *data;                     /* Data for callback. */
> > >         struct vring_desc *indir_desc;  /* Indirect descriptor, if any. */
> > > +       bool premapped;
> >
> > Better with a comment.
> >
> > Not native speaker, but "dma_addr" might be better?
> >
> > >  };
> > >
> > >  struct vring_desc_state_packed {
> > > @@ -440,7 +441,7 @@ static void vring_unmap_one_split_indirect(const struct vring_virtqueue *vq,
> > >  }
> > >
> > >  static unsigned int vring_unmap_one_split(const struct vring_virtqueue *vq,
> > > -                                         unsigned int i)
> > > +                                         unsigned int i, bool premapped)
> > >  {
> > >         struct vring_desc_extra *extra = vq->split.desc_extra;
> > >         u16 flags;
> > > @@ -457,6 +458,9 @@ static unsigned int vring_unmap_one_split(const struct vring_virtqueue *vq,
> > >                                  (flags & VRING_DESC_F_WRITE) ?
> > >                                  DMA_FROM_DEVICE : DMA_TO_DEVICE);
> > >         } else {
> > > +               if (premapped)
> > > +                       goto out;
> > > +
> > >                 dma_unmap_page(vring_dma_dev(vq),
> > >                                extra[i].addr,
> > >                                extra[i].len,
> > > @@ -788,6 +792,47 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
> > >         return err;
> > >  }
> > >
> > > +static inline int virtqueue_add_split_premapped(struct virtqueue *_vq,
> > > +                                               struct scatterlist *sgs[],
> > > +                                               unsigned int total_sg,
> > > +                                               unsigned int out_sgs,
> > > +                                               unsigned int in_sgs,
> > > +                                               void *data,
> > > +                                               void *ctx,
> > > +                                               gfp_t gfp)
> > > +{
> > > +       struct vring_virtqueue *vq = to_vvq(_vq);
> > > +       struct vring_desc *desc;
> > > +       int head;
> > > +       int err;
> > > +
> > > +       START_USE(vq);
> > > +
> > > +       /* check vq state and try to alloc desc for indirect. */
> > > +       err = virtqueue_add_split_prepare(vq, total_sg, out_sgs, data, ctx, gfp, &desc);
> > > +       if (err)
> > > +               goto end;
> > > +
> > > +       head = vq->free_head;
> > > +       err = virtqueue_add_split_vring(vq, sgs, total_sg, out_sgs, in_sgs, desc);
> > > +       if (err)
> > > +               goto err;
> > > +
> > > +       /* Store token and indirect buffer state. */
> > > +       vq->split.desc_state[head].data = data;
> > > +       vq->split.desc_state[head].indir_desc = desc ? desc : ctx;
> > > +       vq->split.desc_state[head].premapped = true;
> >
> > This function duplicates most of the logic of virtqueue_add_split()
> > let's unify it.
>
> I want to know that the __virtqueue_add_split is the original
> virtqueue_add_split or my refactor virtqueue_add_split?

It's basically just the virtqueue_add_split_premapped() but with a
boolean to say if it is premapped.

>
> >
> > probably:
> >
> > __virtqueue_add_split(..., bool premapped);
> > virtqueue_add_split()
> > {
> >     __virtqueue_add_split(..., false);
> > }
> >
> > virtqueue_add_split_premapped()
> > {
> >    __virtqueue_add_split(..., true);
> > }
>
> I am trying to reduce the inspection of premapped.
>
> In fact, this is Michael's request, although I am not particularly sure that my
> implementation has met his requirements.
>
> https://lore.kernel.org/all/20230203041006-mutt-send-email-mst@kernel.org/

I think there should be no conflict,  the use of premapped was limited
to the above two functions?

Thanks

>
> Thanks.
>
>
> >
> > ?
> >
> > And so did for packed (patch 5).
> >
> > Thanks
> >
> >
> >
> > > +
> > > +       goto end;
> > > +
> > > +err:
> > > +       kfree(desc);
> > > +
> > > +end:
> > > +       END_USE(vq);
> > > +       return err;
> > > +}
> > > +
> > >  static bool virtqueue_kick_prepare_split(struct virtqueue *_vq)
> > >  {
> > >         struct vring_virtqueue *vq = to_vvq(_vq);
> > > @@ -824,20 +869,23 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
> > >  {
> > >         unsigned int i, j;
> > >         __virtio16 nextflag = cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F_NEXT);
> > > +       bool premapped;
> > >
> > >         /* Clear data ptr. */
> > >         vq->split.desc_state[head].data = NULL;
> > >
> > > +       premapped = vq->split.desc_state[head].premapped;
> > > +
> > >         /* Put back on free list: unmap first-level descriptors and find end */
> > >         i = head;
> > >
> > >         while (vq->split.vring.desc[i].flags & nextflag) {
> > > -               vring_unmap_one_split(vq, i);
> > > +               vring_unmap_one_split(vq, i, premapped);
> > >                 i = vq->split.desc_extra[i].next;
> > >                 vq->vq.num_free++;
> > >         }
> > >
> > > -       vring_unmap_one_split(vq, i);
> > > +       vring_unmap_one_split(vq, i, premapped);
> > >         vq->split.desc_extra[i].next = vq->free_head;
> > >         vq->free_head = head;
> > >
> > > @@ -859,8 +907,10 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
> > >                                 VRING_DESC_F_INDIRECT));
> > >                 BUG_ON(len == 0 || len % sizeof(struct vring_desc));
> > >
> > > -               for (j = 0; j < len / sizeof(struct vring_desc); j++)
> > > -                       vring_unmap_one_split_indirect(vq, &indir_desc[j]);
> > > +               if (!premapped) {
> > > +                       for (j = 0; j < len / sizeof(struct vring_desc); j++)
> > > +                               vring_unmap_one_split_indirect(vq, &indir_desc[j]);
> > > +               }
> > >
> > >                 kfree(indir_desc);
> > >                 vq->split.desc_state[head].indir_desc = NULL;
> > > @@ -2204,6 +2254,21 @@ static inline int virtqueue_add(struct virtqueue *_vq,
> > >                                         out_sgs, in_sgs, data, ctx, gfp);
> > >  }
> > >
> > > +static inline int virtqueue_add_premapped(struct virtqueue *_vq,
> > > +                                         struct scatterlist *sgs[],
> > > +                                         unsigned int total_sg,
> > > +                                         unsigned int out_sgs,
> > > +                                         unsigned int in_sgs,
> > > +                                         void *data,
> > > +                                         void *ctx,
> > > +                                         gfp_t gfp)
> > > +{
> > > +       struct vring_virtqueue *vq = to_vvq(_vq);
> > > +
> > > +       return virtqueue_add_split_premapped(_vq, sgs, total_sg, out_sgs,
> > > +                                            in_sgs, data, ctx, gfp);
> > > +}
> > > +
> > >  /**
> > >   * virtqueue_add_sgs - expose buffers to other end
> > >   * @_vq: the struct virtqueue we're talking about.
> > > @@ -2261,6 +2326,31 @@ int virtqueue_add_outbuf(struct virtqueue *vq,
> > >  }
> > >  EXPORT_SYMBOL_GPL(virtqueue_add_outbuf);
> > >
> > > +/**
> > > + * virtqueue_add_outbuf_premapped - expose output buffers to other end
> > > + * @vq: the struct virtqueue we're talking about.
> > > + * @sg: scatterlist (must be well-formed and terminated!)
> > > + * @num: the number of entries in @sg readable by other side
> > > + * @data: the token identifying the buffer.
> > > + * @gfp: how to do memory allocations (if necessary).
> > > + *
> > > + * Caller must ensure we don't call this with other virtqueue operations
> > > + * at the same time (except where noted).
> > > + *
> > > + * It is required that all addrs have completed DMA operations. And use
> > > + * sg->dma_address, sg->length to pass addr and length.
> > > + *
> > > + * Returns zero or a negative error (ie. ENOSPC, ENOMEM, EIO).
> > > + */
> > > +int virtqueue_add_outbuf_premapped(struct virtqueue *vq,
> > > +                                  struct scatterlist *sg, unsigned int num,
> > > +                                  void *data,
> > > +                                  gfp_t gfp)
> > > +{
> > > +       return virtqueue_add_premapped(vq, &sg, num, 1, 0, data, NULL, gfp);
> > > +}
> > > +EXPORT_SYMBOL_GPL(virtqueue_add_outbuf_premapped);
> > > +
> > >  /**
> > >   * virtqueue_add_inbuf - expose input buffers to other end
> > >   * @vq: the struct virtqueue we're talking about.
> > > diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> > > index dcab9c7e8784..d8b472a7dcae 100644
> > > --- a/include/linux/virtio.h
> > > +++ b/include/linux/virtio.h
> > > @@ -43,6 +43,11 @@ int virtqueue_add_outbuf(struct virtqueue *vq,
> > >                          void *data,
> > >                          gfp_t gfp);
> > >
> > > +int virtqueue_add_outbuf_premapped(struct virtqueue *vq,
> > > +                                  struct scatterlist *sg, unsigned int num,
> > > +                                  void *data,
> > > +                                  gfp_t gfp);
> > > +
> > >  int virtqueue_add_inbuf(struct virtqueue *vq,
> > >                         struct scatterlist sg[], unsigned int num,
> > >                         void *data,
> > > --
> > > 2.32.0.3.g01195cf9f
> > >
> >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
