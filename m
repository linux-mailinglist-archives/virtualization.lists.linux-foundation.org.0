Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD64C3BCA
	for <lists.virtualization@lfdr.de>; Fri, 25 Feb 2022 03:40:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262C1417CC;
	Fri, 25 Feb 2022 02:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWZ4ezoK60Vd; Fri, 25 Feb 2022 02:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C0943417D0;
	Fri, 25 Feb 2022 02:40:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 061A8C0036;
	Fri, 25 Feb 2022 02:40:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85AE2C0011
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Feb 2022 02:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 707BF40480
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Feb 2022 02:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_KBqvsMsP98
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Feb 2022 02:40:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 685D0403C4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Feb 2022 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645756810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tizsj4bPO0QBsPJAqUXEPjagkzoPs8d5YiCjb2hGNHY=;
 b=U6WYaJqXGG0hekQ9c2fGiXbKJwW60zLsaGpXuwm44YrkPP/yawJFCh3gxmSJMxfT4n0wBI
 dixDpmanVlSBIYc3BBOGEBQK+g6nJ12wmix/5MM+zB1ghU9/3QWW6KaG+sjEsbcB20fWeh
 VA/J8WOeGqVucT2zrCLl+pBJgNlea9o=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-cqO_UO9wNWa_VWXii_HNvw-1; Thu, 24 Feb 2022 21:40:08 -0500
X-MC-Unique: cqO_UO9wNWa_VWXii_HNvw-1
Received: by mail-lj1-f197.google.com with SMTP id
 b27-20020a2ebc1b000000b00246209c497dso2004001ljf.11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 18:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tizsj4bPO0QBsPJAqUXEPjagkzoPs8d5YiCjb2hGNHY=;
 b=LEOG3V4YR1wvoBuodunyPMK6W2+9Uea9I6yAhVHQeczYB4kf1aMbvNVApJKwWNSxHT
 Rm6X9RKhZlCO5xI4TS3rCe1zERA9wlYHr5HyXrLkDBhZnU8LlyE9/YfaqhOFbPAAUuXB
 JX7JidXSZ3EG7An9uqdHK39ifNpKTKmyMOhlkrUh+s3VBXF4Aw5907jVWyWOmMTXmr9T
 1BjWwXRo5Uxoeg28ZWLaJisYBNWZzJv6RIJ1577drYDMqwuXBcIi1sy9dGQA8gb5h1hv
 1c/B9d1PseODbvt6gSVojeurXjJ9gXWWPNsxyyeFmi5jTol9boaRf7xOPLXXCEcMUR4V
 +ttQ==
X-Gm-Message-State: AOAM533zxmgcf/zd+TXaxylYFTtPX5ZCvW5FohYYQfl8sEAdKC2lFW23
 E3Jfw9YyHkSVS2KNRS3CWhB+o8daPQcM6xB9g9WaKLihpqcQQAKV2kysIi7lae9az+2b/Qa7gPp
 8bX6wfQW89+gdDb1XF/iT0tjShjlLgKXw7WWNHpvkC+hTumGGdwSm/3OMDA==
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr3522651lfd.190.1645756807198; 
 Thu, 24 Feb 2022 18:40:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUbmQTASv2aaxGJpDDBbqtehfsoN38J/JU91xlQJLh9nHs3fmoj+R4Z3CnVsXjhWW+FAg32LXS48NmxeCSc5s=
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr3522640lfd.190.1645756806989; Thu, 24
 Feb 2022 18:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20211108081324.14204-1-jasowang@redhat.com>
 <CACGkMEucnZPt_dhaSXCegeFE0gs=dSDfv7CJSq4HCW_4a4XfGg@mail.gmail.com>
 <20220223020452-mutt-send-email-mst@kernel.org>
 <CACGkMEu2UkOpGHJyKGzjJHMa3RmOoCmqD1iD_nh+pVcT63BQqA@mail.gmail.com>
 <CACGkMEuu-Q83aBm0ijGr8AhP9C0tjxzvuHKvnY4HaArL5d2eoQ@mail.gmail.com>
 <20220224122533-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220224122533-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Feb 2022 10:39:56 +0800
Message-ID: <CACGkMEtCNpwH5zmA7yySJSZ9sRqJB+zKDJN9xgva0SxCPAz3-Q@mail.gmail.com>
Subject: Re: [PATCH] virtio_ring: aovid reading flag from the descriptor ring
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
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

On Fri, Feb 25, 2022 at 1:26 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Feb 23, 2022 at 03:50:07PM +0800, Jason Wang wrote:
> > On Wed, Feb 23, 2022 at 3:34 PM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Wed, Feb 23, 2022 at 3:08 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Feb 23, 2022 at 11:19:03AM +0800, Jason Wang wrote:
> > > > > On Mon, Nov 8, 2021 at 4:13 PM Jason Wang <jasowang@redhat.com> wrote:
> > > > > >
> > > > > > Commit 72b5e8958738 ("virtio-ring: store DMA metadata in desc_extra
> > > > > > for split virtqueue") tries to make it possible for the driver to not
> > > > > > read from the descriptor ring to prevent the device from corrupting
> > > > > > the descriptor ring. But it still read the descriptor flag from the
> > > > > > descriptor ring during buffer detach.
> > > > > >
> > > > > > This patch fixes by always store the descriptor flag no matter whether
> > > > > > DMA API is used and then we can avoid reading descriptor flag from the
> > > > > > descriptor ring. This eliminates the possibly of unexpected next
> > > > > > descriptor caused by the wrong flag (e.g the next flag).
> > > > > >
> > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > >
> > > > > Michael, any comment for this?
> > > > >
> > > > > Thanks
> > > >
> > > > I don't exactly see why we should care without DMA API, it seems
> > > > cleaner not to poke at the array one extra time.
> > >
> > > I think the answer is that we have any special care about the DMA API
> >
> > I meant "we haven't had" actually.
> >
> > Thanks
>
> I'm just asking what's better for performance. An extra write in the
> first chunk has a cost. Want to test and see?

I will do it.

Thanks

>
> > > for all other places that are using desc_extra.
> > >
> > > Thanks
> > >
> > >
> > > >
> > > > > > ---
> > > > > >  drivers/virtio/virtio_ring.c | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > index 00f64f2f8b72..28734f4e57d3 100644
> > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > @@ -583,7 +583,7 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
> > > > > >         }
> > > > > >         /* Last one doesn't continue. */
> > > > > >         desc[prev].flags &= cpu_to_virtio16(_vq->vdev, ~VRING_DESC_F_NEXT);
> > > > > > -       if (!indirect && vq->use_dma_api)
> > > > > > +       if (!indirect)
> > > > > >                 vq->split.desc_extra[prev & (vq->split.vring.num - 1)].flags &=
> > > > > >                         ~VRING_DESC_F_NEXT;
> > > > > >
> > > > > > @@ -713,7 +713,7 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
> > > > > >         /* Put back on free list: unmap first-level descriptors and find end */
> > > > > >         i = head;
> > > > > >
> > > > > > -       while (vq->split.vring.desc[i].flags & nextflag) {
> > > > > > +       while (vq->split.desc_extra[i].flags & nextflag) {
> > > > > >                 vring_unmap_one_split(vq, i);
> > > > > >                 i = vq->split.desc_extra[i].next;
> > > > > >                 vq->vq.num_free++;
> > > > > > --
> > > > > > 2.25.1
> > > > > >
> > > >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
