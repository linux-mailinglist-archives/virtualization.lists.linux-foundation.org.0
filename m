Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 598364084D7
	for <lists.virtualization@lfdr.de>; Mon, 13 Sep 2021 08:40:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C287B40249;
	Mon, 13 Sep 2021 06:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZ2ZGM-VOUP7; Mon, 13 Sep 2021 06:40:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 50A0E40233;
	Mon, 13 Sep 2021 06:40:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2117C0022;
	Mon, 13 Sep 2021 06:40:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 607C0C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DE4B607A2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IAKBiqx3zzc
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:40:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E5E5606CF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 06:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631515225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SNxZ6jfEB10N8bQSVi6FJlKI5Z8SzdhMdny04tYpht8=;
 b=X0exopsUf8Epl9Y2R/+xIDd6B4Jg50JIQy6yfNG39j+mJ7OqUK8Z68CARlqUIvxauYZIxU
 xa0d6duppsDgSPN1a2ukGkJboYXS5x0QqTZNEiUpUG1oOuDdcXV07fCbuPBEeoJnuVtMqz
 iXG8/xxNRzWftB90czZfUfBUImmVrUw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-4C0kWB7bMx6AttDbf8-lZA-1; Mon, 13 Sep 2021 02:40:22 -0400
X-MC-Unique: 4C0kWB7bMx6AttDbf8-lZA-1
Received: by mail-lj1-f200.google.com with SMTP id
 p11-20020a2ea40b000000b001d68cffb055so3736175ljn.6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Sep 2021 23:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SNxZ6jfEB10N8bQSVi6FJlKI5Z8SzdhMdny04tYpht8=;
 b=Ah+PRKUlFeZZSLCg0aKtjMReVCt8BDIwRcRq2su7EqmOrYKmoj/8lUT01qMV5LYwno
 72rvsaisX7aaARYx+Jc4f4eBZ2kNkZqXouECxjwluo1z5XeFrB3eUfEbtANi+fnLjSnY
 pdEW91ibp4LIgYCqtlAd4tuM7ifRn9S3pGQ9R015Flnk81Z2Kb4ftP+6t25F+FNfdMTa
 jKrNxhuXSFfEDETIVZnwTxhSJiVeNzvbG+XpwTg/5JnD2Q8VW5bNXocD1L8vQls5W6IM
 kyMOJz2sdSmQLQ1T4sDhPJXdoqUc0jyj+lxH0A6isowxmIReRBJIhZj0Z84oXxGtM/dF
 fABw==
X-Gm-Message-State: AOAM531vWqiwA6vw8S8MrxZTv1VJnRt5kGZv+5gvdNAHmPqnY/MZ+zr0
 +dLXQgbcsePvNzQ+tiFA3OtjyslOWTIreEqtU7dLsQVgKIaeRFKtxtc1kPoYhszYlQem5eHcygl
 cDtdum8EjwjEpb62vq5pJhuRInh3Ef9iPJJnMpH8MvWZbqlUJ9Ij/FVMqbw==
X-Received: by 2002:a05:651c:b09:: with SMTP id
 b9mr9047006ljr.307.1631515220979; 
 Sun, 12 Sep 2021 23:40:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0g4ZtKt366bShruOpPC8FbnDMpMosrO9a0LtyFIWOpuNLnVfP2k62Agqw3j6tdkQr3IW2xNdlviEYUy7A4GQ=
X-Received: by 2002:a05:651c:b09:: with SMTP id
 b9mr9046985ljr.307.1631515220704; 
 Sun, 12 Sep 2021 23:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210913055353.35219-1-jasowang@redhat.com>
 <20210913055353.35219-10-jasowang@redhat.com>
 <20210913023428-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210913023428-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Sep 2021 14:40:09 +0800
Message-ID: <CACGkMEsqFbnog3jktR0Ms-u75yHfo8zKO-SC66iN2fLZ185XWQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] virtio_ring: validate used buffer length
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Hetzelt,
 Felicitas" <f.hetzelt@tu-berlin.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, "kaplan,
 david" <david.kaplan@amd.com>,
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

On Mon, Sep 13, 2021 at 2:36 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Sep 13, 2021 at 01:53:53PM +0800, Jason Wang wrote:
> > This patch validate the used buffer length provided by the device
> > before trying to use it. This is done by record the in buffer length
> > in a new field in desc_state structure during virtqueue_add(), then we
> > can fail the virtqueue_get_buf() when we find the device is trying to
> > give us a used buffer length which is greater than the in buffer
> > length.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
>
> Hmm this was proposed in the past. The overhead here is
> not negligeable, so I'd like to know more -
> when is it a problem if the used len is too big?

One example is: https://github.com/fuzzsa/fuzzsa-bugs/blob/master/virtio_rng.md

And there would be more I guess.

> Don't the affected drivers already track the length somewhere
> and so can validated it without the extra cost in
> virtio core?

Probably, but this requires the changes in each device driver. And it
would be easily forgotten if new drivers are introduced?

Thanks

>
> > ---
> >  drivers/virtio/virtio_ring.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index d2ca0a7365f8..b8374a6144f3 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -69,6 +69,7 @@
> >  struct vring_desc_state_split {
> >       void *data;                     /* Data for callback. */
> >       struct vring_desc *indir_desc;  /* Indirect descriptor, if any. */
> > +     u64 buflen;                     /* In buffer length */
> >  };
> >
> >  struct vring_desc_state_packed {
> > @@ -76,6 +77,7 @@ struct vring_desc_state_packed {
> >       struct vring_packed_desc *indir_desc; /* Indirect descriptor, if any. */
> >       u16 num;                        /* Descriptor list length. */
> >       u16 last;                       /* The last desc state in a list. */
> > +     u64 buflen;                     /* In buffer length */
> >  };
> >
> >  struct vring_desc_extra {
> > @@ -490,6 +492,7 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
> >       unsigned int i, n, avail, descs_used, prev, err_idx;
> >       int head;
> >       bool indirect;
> > +     u64 buflen = 0;
> >
> >       START_USE(vq);
> >
> > @@ -571,6 +574,7 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
> >                                                    VRING_DESC_F_NEXT |
> >                                                    VRING_DESC_F_WRITE,
> >                                                    indirect);
> > +                     buflen += sg->length;
> >               }
> >       }
> >       /* Last one doesn't continue. */
> > @@ -605,6 +609,7 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
> >
> >       /* Store token and indirect buffer state. */
> >       vq->split.desc_state[head].data = data;
> > +     vq->split.desc_state[head].buflen = buflen;
> >       if (indirect)
> >               vq->split.desc_state[head].indir_desc = desc;
> >       else
> > @@ -784,6 +789,11 @@ static void *virtqueue_get_buf_ctx_split(struct virtqueue *_vq,
> >               BAD_RING(vq, "id %u is not a head!\n", i);
> >               return NULL;
> >       }
> > +     if (unlikely(*len > vq->split.desc_state[i].buflen)) {
> > +             BAD_RING(vq, "used len %d is larger than in buflen %lld\n",
> > +                     *len, vq->split.desc_state[i].buflen);
> > +             return NULL;
> > +     }
> >
> >       /* detach_buf_split clears data, so grab it now. */
> >       ret = vq->split.desc_state[i].data;
> > @@ -1062,6 +1072,7 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
> >       unsigned int i, n, err_idx;
> >       u16 head, id;
> >       dma_addr_t addr;
> > +     u64 buflen = 0;
> >
> >       head = vq->packed.next_avail_idx;
> >       desc = alloc_indirect_packed(total_sg, gfp);
> > @@ -1089,6 +1100,8 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
> >                       desc[i].addr = cpu_to_le64(addr);
> >                       desc[i].len = cpu_to_le32(sg->length);
> >                       i++;
> > +                     if (n >= out_sgs)
> > +                             buflen += sg->length;
> >               }
> >       }
> >
> > @@ -1141,6 +1154,7 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
> >       vq->packed.desc_state[id].data = data;
> >       vq->packed.desc_state[id].indir_desc = desc;
> >       vq->packed.desc_state[id].last = id;
> > +     vq->packed.desc_state[id].buflen = buflen;
> >
> >       vq->num_added += 1;
> >
> > @@ -1176,6 +1190,7 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
> >       unsigned int i, n, c, descs_used, err_idx;
> >       __le16 head_flags, flags;
> >       u16 head, id, prev, curr, avail_used_flags;
> > +     u64 buflen = 0;
> >
> >       START_USE(vq);
> >
> > @@ -1250,6 +1265,8 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
> >                                       1 << VRING_PACKED_DESC_F_AVAIL |
> >                                       1 << VRING_PACKED_DESC_F_USED;
> >                       }
> > +                     if (n >= out_sgs)
> > +                             buflen += sg->length;
> >               }
> >       }
> >
> > @@ -1268,6 +1285,7 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
> >       vq->packed.desc_state[id].data = data;
> >       vq->packed.desc_state[id].indir_desc = ctx;
> >       vq->packed.desc_state[id].last = prev;
> > +     vq->packed.desc_state[id].buflen = buflen;
> >
> >       /*
> >        * A driver MUST NOT make the first descriptor in the list
> > @@ -1455,6 +1473,11 @@ static void *virtqueue_get_buf_ctx_packed(struct virtqueue *_vq,
> >               BAD_RING(vq, "id %u is not a head!\n", id);
> >               return NULL;
> >       }
> > +     if (unlikely(*len > vq->packed.desc_state[id].buflen)) {
> > +             BAD_RING(vq, "used len %d is larger than in buflen %lld\n",
> > +                     *len, vq->packed.desc_state[id].buflen);
> > +             return NULL;
> > +     }
> >
> >       /* detach_buf_packed clears data, so grab it now. */
> >       ret = vq->packed.desc_state[id].data;
> > --
> > 2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
