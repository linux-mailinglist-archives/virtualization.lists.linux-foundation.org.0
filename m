Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F345D564
	for <lists.virtualization@lfdr.de>; Thu, 25 Nov 2021 08:26:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 450494019B;
	Thu, 25 Nov 2021 07:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GjPHme-OHn1; Thu, 25 Nov 2021 07:26:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CAB1E40018;
	Thu, 25 Nov 2021 07:26:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36B84C000A;
	Thu, 25 Nov 2021 07:26:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABFC6C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Nov 2021 07:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C6DA608E7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Nov 2021 07:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVo09xd6WwtJ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Nov 2021 07:26:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D405F608DD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Nov 2021 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637825196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qcQBaxPrWoK+s8IJkbSpQ1TtEOZWtV7cWrhtg/atf2k=;
 b=WryuN92IzcFggkBFXdFroOHflbAd18p0CNN0uq4bIZS1QFrP+PvNmfZIph1kt+Ix+ke+wt
 hVM76/6HH9OEWZhXf05XCk2do5JdKSQxwYn7C3ck7RH5BBPt0ICRtdktgdoJErOIdd33ku
 LKvBsAMqSyzumHvi9jZ5kt38ll3gHQ8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-ygDkw6rfMBeVF-CpXpttBg-1; Thu, 25 Nov 2021 02:26:35 -0500
X-MC-Unique: ygDkw6rfMBeVF-CpXpttBg-1
Received: by mail-lf1-f70.google.com with SMTP id
 f15-20020a056512228f00b004037c0ab223so2774723lfu.16
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 23:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qcQBaxPrWoK+s8IJkbSpQ1TtEOZWtV7cWrhtg/atf2k=;
 b=5BQ3dmdb5bD0mmCZKlIvLWfkAB/0I+uB2RQRURQDw3zClg1X3DbIj5jTEXx2pFzIVQ
 szOjRXoujXAxvF9SNYdRYYgtajFXNflxRf/weEVn/c4zQTXRU/xOZYnd8vxl4U7SNt7v
 Q0ExBSeYnkcoBJdxe0M3UoF2PDsZ0BtSEoTckbQPT/GtFof0FQSasSIWVLfKfETFKDvX
 R1xQmBBRy2yip8/2GcPdfctGSKoHJDrPYD/uOyrvBshJfD+Wm3iVL43zROIBrUs5oeZo
 A79gcoxmAVCI7IGxnVXUACz5zOugPWNpBvmHIVJBXqZ9+zzqNaYHMrRAqG2qp96TCizE
 BrEA==
X-Gm-Message-State: AOAM533y5FhOLsaPjvLFpDxdTy6uPFHRNqO8gT4AE4r/AFq49VmiKcNz
 1JU/vEeh8i81UtodeD1WVGrQ9roYMU2XGk33uFjGibr2/LxBeTNIY30rlcQvCMVJ6b8RENnGf3W
 V30safw0Xl9nup2RKZJ13xBnbOoNNaBNXlUyJsfqpaO5NWmJuYNSwT9khgg==
X-Received: by 2002:ac2:518b:: with SMTP id u11mr21748975lfi.498.1637825193839; 
 Wed, 24 Nov 2021 23:26:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNyYx1OYUVPgYpWOwMuorz+qrA1sL59W2uyRoPP3zmJkmu6y4BVf7Hf9NYZ/Zi5jWVVN818TqMHNpEnVm7VRk=
X-Received: by 2002:ac2:518b:: with SMTP id u11mr21748967lfi.498.1637825193649; 
 Wed, 24 Nov 2021 23:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20211125060547.11961-1-jasowang@redhat.com>
 <20211125070939.GC211101@mtl-vdi-166.wap.labs.mlnx>
 <CACGkMEsNsQ_XWTvdjaCEdo8sYaLew24zU1UUCJrokM-Koxj4fw@mail.gmail.com>
 <20211125072040.GA213301@mtl-vdi-166.wap.labs.mlnx>
In-Reply-To: <20211125072040.GA213301@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Nov 2021 15:26:22 +0800
Message-ID: <CACGkMEuYWoL4x5o_OO2a27X4Ah8Y2ggBjy0XFHe3Onmj4RhFFg@mail.gmail.com>
Subject: Re: [PATCH net] virtio-net: enable big mode correctly
To: Eli Cohen <elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev <netdev@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, mst <mst@redhat.com>
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

On Thu, Nov 25, 2021 at 3:20 PM Eli Cohen <elic@nvidia.com> wrote:
>
> On Thu, Nov 25, 2021 at 03:15:33PM +0800, Jason Wang wrote:
> > On Thu, Nov 25, 2021 at 3:09 PM Eli Cohen <elic@nvidia.com> wrote:
> > >
> > > On Thu, Nov 25, 2021 at 02:05:47PM +0800, Jason Wang wrote:
> > > > When VIRTIO_NET_F_MTU feature is not negotiated, we assume a very
> > > > large max_mtu. In this case, using small packet mode is not correct
> > > > since it may breaks the networking when MTU is grater than
> > > > ETH_DATA_LEN.
> > > >
> > > > To have a quick fix, simply enable the big packet mode when
> > > > VIRTIO_NET_F_MTU is not negotiated. We can do optimization on top.
> > > >
> > > > Reported-by: Eli Cohen <elic@nvidia.com>
> > > > Cc: Eli Cohen <elic@nvidia.com>
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > ---
> > > >  drivers/net/virtio_net.c | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > index 7c43bfc1ce44..83ae3ef5eb11 100644
> > > > --- a/drivers/net/virtio_net.c
> > > > +++ b/drivers/net/virtio_net.c
> > > > @@ -3200,11 +3200,12 @@ static int virtnet_probe(struct virtio_device *vdev)
> > > >               dev->mtu = mtu;
> > > >               dev->max_mtu = mtu;
> > > >
> > > > -             /* TODO: size buffers correctly in this case. */
> > > > -             if (dev->mtu > ETH_DATA_LEN)
> > > > -                     vi->big_packets = true;
> > > >       }
> > > >
> > > > +     /* TODO: size buffers correctly in this case. */
> > > > +     if (dev->max_mtu > ETH_DATA_LEN)
> > > > +             vi->big_packets = true;
> > > > +
> > >
> > > If VIRTIO_NET_F_MTU is provided, then dev->max_mtu is going to equal
> > > ETH_DATA_LEN (will be set in ether_setup()) so I don't think it will set
> > > big_packets to true.
> >
> > I may miss something, the dev->max_mtu is just assigned to the mtu
> > value read from the config space in the code block above  (inside the
> > feature check of VIRTIO_NET_F_MTU).
>
> Sorry, I meant "If VIRTIO_NET_F_MTU is ***NOT*** provided". In that case
> dev->max_mtu eauals ETH_DATA_LEN so you won't set vi->big_packets to
> true.

I see but in this case, the above assignment:

        /* MTU range: 68 - 65535 */
        dev->min_mtu = MIN_MTU;
        dev->max_mtu = MAX_MTU;

happens after alloc_etherdev_mq() which calls ether_setup(), so we are
probably fine here.

Thanks

>
> >
> > Thanks
> >
> > >
> > >
> > > >       if (vi->any_header_sg)
> > > >               dev->needed_headroom = vi->hdr_len;
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
