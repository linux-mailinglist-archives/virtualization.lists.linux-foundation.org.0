Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E472F27BD0E
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 08:22:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A02F686E64;
	Tue, 29 Sep 2020 06:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-4C5ogpzo35; Tue, 29 Sep 2020 06:22:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0E2F386F8A;
	Tue, 29 Sep 2020 06:22:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7E7EC0051;
	Tue, 29 Sep 2020 06:22:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3970FC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 06:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2863E86F66
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 06:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGkh1fV-M2mD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 06:22:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 560F286E64
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 06:22:43 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601360562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OZL2UTL2NRgnTLjhHE1qMWT9IHTxaDPA0n06CGHk4AQ=;
 b=hBli/ohmPAEaPAo8R880DdFI1Q7a+Owtvwru/4HH56pbDVqEqVe3d3mBIC19ql6NkX7ozB
 39XyUE68DYHNFMzmjkwICNXLLTbMD/u/KvxD/vFs2/xAOmN0GIEmxowA7YIo9or1E8k/tt
 RCPv6mqxz54UqK87Cx38wrZObWKj2H8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-ex2DtosEORaj48JMCB_Rkw-1; Tue, 29 Sep 2020 02:22:39 -0400
X-MC-Unique: ex2DtosEORaj48JMCB_Rkw-1
Received: by mail-wm1-f69.google.com with SMTP id x6so1407923wmi.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 23:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OZL2UTL2NRgnTLjhHE1qMWT9IHTxaDPA0n06CGHk4AQ=;
 b=cjDV3gV9+UvucDK30OZ357sIdBBPVwSJb93zlrZXMty82CEfJlY87Cg1WOotfHiLwm
 /451eM6Dvv8vJVBscihJrNE/KpZdHAYbzbut5SXHGt/2IeFoHlyF/7Y8tnXlGnTFho+i
 r0nPd4rAjOWSXRpkNM02S162lgwtlmOy6Vqx++VkEJOFtW76DG0c38XYLaA51z2ORbid
 1qjQhprwow3XiFux8RyEgJENVNwFf7/RNh8TJE0py1/IFoWc3iau+9Dhhp/SbJrCYQpj
 THpTi+OuoQsttqwWPfgqgt8pmC9aWbZc1i4O77FWfiOi5kdnH8P9nkkPgR4JzJ9oiNrZ
 b1TQ==
X-Gm-Message-State: AOAM533VYwG2s7muFgZiayqTJw4Scwq59+LtWyuB2auIHcUQyffEZ7D/
 kn8JCKdXDYrV7zTH06b53VPDNuV83sFaYaMRPBt7vjcC/0yYw0xE8hHhh631+e//3iM20TqO8q0
 4CieAG1Sg3XFCDRmETEVPwKszAem/VyPDyAbbaTfIyw==
X-Received: by 2002:a1c:9894:: with SMTP id a142mr2543030wme.167.1601360558610; 
 Mon, 28 Sep 2020 23:22:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIS5SNKKKtZ5VRm/6T5hn5KAH0Cg7LbJVKGKre8/WZIcIt53l2bXqInmMfqBG/CD7ilCzX1g==
X-Received: by 2002:a1c:9894:: with SMTP id a142mr2543006wme.167.1601360558415; 
 Mon, 28 Sep 2020 23:22:38 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id k8sm4517984wrl.42.2020.09.28.23.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 23:22:37 -0700 (PDT)
Date: Tue, 29 Sep 2020 02:22:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Subject: Re: [PATCH 2/2] virtio-net: ethtool configurable RXCSUM
Message-ID: <20200929022138-mutt-send-email-mst@kernel.org>
References: <20200928033915.82810-1-xiangxia.m.yue@gmail.com>
 <20200928033915.82810-2-xiangxia.m.yue@gmail.com>
 <20200928152142-mutt-send-email-mst@kernel.org>
 <CAMDZJNVUVm9y2NV5ZGHzrPoEaDF4PZEGWVFEx9g6sF3U-1Rm0Q@mail.gmail.com>
 <20200929015427-mutt-send-email-mst@kernel.org>
 <CAMDZJNX94out3B_puYy+zbdotDwU=qZKG2=sMfyoj9o5nnewmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMDZJNX94out3B_puYy+zbdotDwU=qZKG2=sMfyoj9o5nnewmA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Linux Kernel Network Developers <netdev@vger.kernel.org>,
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

On Tue, Sep 29, 2020 at 02:10:56PM +0800, Tonghao Zhang wrote:
> On Tue, Sep 29, 2020 at 1:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Sep 29, 2020 at 09:45:24AM +0800, Tonghao Zhang wrote:
> > > On Tue, Sep 29, 2020 at 3:25 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Sep 28, 2020 at 11:39:15AM +0800, xiangxia.m.yue@gmail.com wrote:
> > > > > From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > > > >
> > > > > Allow user configuring RXCSUM separately with ethtool -K,
> > > > > reusing the existing virtnet_set_guest_offloads helper
> > > > > that configures RXCSUM for XDP. This is conditional on
> > > > > VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> > > > >
> > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > > Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > > > > ---
> > > > >  drivers/net/virtio_net.c | 40 ++++++++++++++++++++++++++++------------
> > > > >  1 file changed, 28 insertions(+), 12 deletions(-)
> > > > >
> > > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > > index 21b71148c532..2e3af0b2c281 100644
> > > > > --- a/drivers/net/virtio_net.c
> > > > > +++ b/drivers/net/virtio_net.c
> > > > > @@ -68,6 +68,8 @@ static const unsigned long guest_offloads[] = {
> > > > >                               (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
> > > > >                               (1ULL << VIRTIO_NET_F_GUEST_UFO))
> > > > >
> > > > > +#define GUEST_OFFLOAD_CSUM_MASK (1ULL << VIRTIO_NET_F_GUEST_CSUM)
> > > > > +
> > > > >  struct virtnet_stat_desc {
> > > > >       char desc[ETH_GSTRING_LEN];
> > > > >       size_t offset;
> > > > > @@ -2526,25 +2528,37 @@ static int virtnet_set_features(struct net_device *dev,
> > > > >                               netdev_features_t features)
> > > > >  {
> > > > >       struct virtnet_info *vi = netdev_priv(dev);
> > > > > -     u64 offloads;
> > > > > +     u64 offloads = vi->guest_offloads &
> > > > > +                    vi->guest_offloads_capable;
> > > > >       int err;
> > > > >
> > > > > -     if ((dev->features ^ features) & NETIF_F_LRO) {
> > > > > -             if (vi->xdp_queue_pairs)
> > > > > -                     return -EBUSY;
> > > > > +     /* Don't allow configuration while XDP is active. */
> > > > > +     if (vi->xdp_queue_pairs)
> > > > > +             return -EBUSY;
> > > > >
> > > > > +     if ((dev->features ^ features) & NETIF_F_LRO) {
> > > > >               if (features & NETIF_F_LRO)
> > > > > -                     offloads = vi->guest_offloads_capable;
> > > > > +                     offloads |= GUEST_OFFLOAD_LRO_MASK;
> > > > >               else
> > > > > -                     offloads = vi->guest_offloads_capable &
> > > > > -                                ~GUEST_OFFLOAD_LRO_MASK;
> > > > > +                     offloads &= ~GUEST_OFFLOAD_LRO_MASK;
> > > > > +     }
> > > > >
> > > > > -             err = virtnet_set_guest_offloads(vi, offloads);
> > > > > -             if (err)
> > > > > -                     return err;
> > > > > -             vi->guest_offloads = offloads;
> > > > > +     if ((dev->features ^ features) & NETIF_F_RXCSUM) {
> > > > > +             if (features & NETIF_F_RXCSUM)
> > > > > +                     offloads |= GUEST_OFFLOAD_CSUM_MASK;
> > > > > +             else
> > > > > +                     offloads &= ~GUEST_OFFLOAD_CSUM_MASK;
> > > > >       }
> > > > >
> > > > > +     if (offloads == (vi->guest_offloads &
> > > > > +                      vi->guest_offloads_capable))
> > > > > +             return 0;
> > > >
> > > > Hmm, what exactly does this do?
> > > If the features(lro, rxcsum) we supported, are not changed, it is not
> > > necessary to invoke virtnet_set_guest_offloads.
> >
> > okay, could you describe the cases where this triggers in a bit more
> > detail pls?
> Hi
> As I known,  when we run che commands show as below:
> ethtool -K eth1 sg off
> ethtool -K eth1 tso off
> 
> In that case, we will not invoke virtnet_set_guest_offloads.

How about initialization though? E.g. it looks like guest_offloads
is 0-initialized, won't this skip the first command to disable
offloads?

> > > > > +
> > > > > +     err = virtnet_set_guest_offloads(vi, offloads);
> > > > > +     if (err)
> > > > > +             return err;
> > > > > +
> > > > > +     vi->guest_offloads = offloads;
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > @@ -3013,8 +3027,10 @@ static int virtnet_probe(struct virtio_device *vdev)
> > > > >       if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
> > > > >           virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
> > > > >               dev->features |= NETIF_F_LRO;
> > > > > -     if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> > > > > +     if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS)) {
> > > > > +             dev->hw_features |= NETIF_F_RXCSUM;
> > > > >               dev->hw_features |= NETIF_F_LRO;
> > > > > +     }
> > > > >
> > > > >       dev->vlan_features = dev->features;
> > > > >
> > > > > --
> > > > > 2.23.0
> > > >
> > >
> > >
> > > --
> > > Best regards, Tonghao
> >
> 
> 
> -- 
> Best regards, Tonghao

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
