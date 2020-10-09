Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8E288A00
	for <lists.virtualization@lfdr.de>; Fri,  9 Oct 2020 15:49:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3EC78772F;
	Fri,  9 Oct 2020 13:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnKaiskF8rdM; Fri,  9 Oct 2020 13:49:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 576F287726;
	Fri,  9 Oct 2020 13:49:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33715C0051;
	Fri,  9 Oct 2020 13:49:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15D85C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 13:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0A97087723
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 13:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WPP7I7us8lvS
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 13:49:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 574FD87720
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 13:49:11 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id h74so2139193vkh.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 09 Oct 2020 06:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xcgKUFX7XcfbXXXU6IJ8NOQNoF8tX9KNcM10Wer9NFI=;
 b=kSKaUhS3NF5+0MnqrqG9Tel/yOhnje8J8LUX20QIIO1+893CAXqRgMBxJze3kQg/8u
 widPuRn+6Dp5zw54npeh3GsawVMM6PeHoCbgz7meCFpMhRNt+bymJyiirARl9GDrITp6
 kDXW75ppyUFTLQ10FaZPWu7PrbKCTe7NJHIrI00AjU3V+Gxo3WJuIMMNna8XD0+ammj+
 uEripBxUzRLpsOOH86oJsmyHGzmEAlFefiqXEakMNMJd5JOUiXaxIwieJFuh7oxd1oFP
 kP7YlFj/5wTwAnXnSt86BL8y6d3pV0lckICiIxxgTK/QzYrIssrf7XCswZ3UkDmd/PZI
 +mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xcgKUFX7XcfbXXXU6IJ8NOQNoF8tX9KNcM10Wer9NFI=;
 b=d9znvyREXBy7I4uNic9C4ZRoFCkn9nU0HYPJodepR6hhgXN4rvlbnrFJjeogicsgrS
 mS51srMg7RSWYjtOTz7+uhcLhvucm/nv4ep70taqrRaMn6JUuj6aYe9kBK1JwWA1+bcm
 QYfO2kOHfZEiR1DWtaQSSfOaU9J1tEYX88wQUx39c7S9tSUj2mTmJG9qbOVBH5Sn4tAV
 PrqZfrHuALzOAfzRI4sSWm3ezDFKgOXBP9RfiDIbCrWfK/xRE0ZcGrzlJvPyUq9mXT+s
 TsBQKbxSi1Dxx8gQNS1B72IgKhHPcW0nA5aPrfrSX1Y2hcTuVXM7R51ckopbx7zmu5wl
 QJGg==
X-Gm-Message-State: AOAM533vDDK5wzs12jpZ2J/E3uxfcyJPYe/ErhD1eYrVgxK5Ag0pl1l0
 MLJdIVAZJ33dkqOl88M6U2T4m5+YhCc=
X-Google-Smtp-Source: ABdhPJzw+j9mqWRRvGmZ7ZdPIRtFB96z+assp4AMmTLkuTLIOsFHW5HeI81bO3VDCX98j2R+zZicig==
X-Received: by 2002:a05:6122:1079:: with SMTP id
 k25mr7207731vko.22.1602251349362; 
 Fri, 09 Oct 2020 06:49:09 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182])
 by smtp.gmail.com with ESMTPSA id a22sm595481vsh.13.2020.10.09.06.49.07
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 06:49:08 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id l23so1084149vkm.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 09 Oct 2020 06:49:07 -0700 (PDT)
X-Received: by 2002:a1f:ae85:: with SMTP id x127mr4312160vke.8.1602251347387; 
 Fri, 09 Oct 2020 06:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200930020300.62245-1-xiangxia.m.yue@gmail.com>
 <CA+FuTSed1GsGp8a=GnHqV-HUcsOSZ0tb0NCe8360S8Md3MbS3g@mail.gmail.com>
 <CAMDZJNWX=3ikS5f0H+xD-dByW2=JHXjvk1=R=CkDLt0TW-orTg@mail.gmail.com>
In-Reply-To: <CAMDZJNWX=3ikS5f0H+xD-dByW2=JHXjvk1=R=CkDLt0TW-orTg@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Fri, 9 Oct 2020 09:48:31 -0400
X-Gmail-Original-Message-ID: <CA+FuTSeVRhM+q_WuWvBDMk+Ao61y+iJWTukpoLzNCHGfYG9=UA@mail.gmail.com>
Message-ID: <CA+FuTSeVRhM+q_WuWvBDMk+Ao61y+iJWTukpoLzNCHGfYG9=UA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] virtio-net: ethtool configurable RXCSUM
To: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Cc: Network Development <netdev@vger.kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Thu, Oct 8, 2020 at 9:19 PM Tonghao Zhang <xiangxia.m.yue@gmail.com> wrote:
>
> On Wed, Sep 30, 2020 at 6:05 PM Willem de Bruijn
> <willemdebruijn.kernel@gmail.com> wrote:
> >
> > On Wed, Sep 30, 2020 at 4:05 AM <xiangxia.m.yue@gmail.com> wrote:
> > >
> > > From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > >
> > > Allow user configuring RXCSUM separately with ethtool -K,
> > > reusing the existing virtnet_set_guest_offloads helper
> > > that configures RXCSUM for XDP. This is conditional on
> > > VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> > >
> > > If Rx checksum is disabled, LRO should also be disabled.
> > >
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Jason Wang <jasowang@redhat.com>
> > > Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> >
> > The first patch was merged into net.
> >
> > Please wait until that is merged into net-next, as this depends on the
> > other patch.
> >
> > > ---
> > > v2:
> > > * LRO depends the rx csum
> > > * remove the unnecessary check
> > > ---
> > >  drivers/net/virtio_net.c | 49 ++++++++++++++++++++++++++++++----------
> > >  1 file changed, 37 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > index 21b71148c532..5407a0106771 100644
> > > --- a/drivers/net/virtio_net.c
> > > +++ b/drivers/net/virtio_net.c
> > > @@ -68,6 +68,8 @@ static const unsigned long guest_offloads[] = {
> > >                                 (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
> > >                                 (1ULL << VIRTIO_NET_F_GUEST_UFO))
> > >
> > > +#define GUEST_OFFLOAD_CSUM_MASK (1ULL << VIRTIO_NET_F_GUEST_CSUM)
> > > +
> > >  struct virtnet_stat_desc {
> > >         char desc[ETH_GSTRING_LEN];
> > >         size_t offset;
> > > @@ -2522,29 +2524,49 @@ static int virtnet_get_phys_port_name(struct net_device *dev, char *buf,
> > >         return 0;
> > >  }
> > >
> > > +static netdev_features_t virtnet_fix_features(struct net_device *netdev,
> > > +                                             netdev_features_t features)
> > > +{
> > > +       /* If Rx checksum is disabled, LRO should also be disabled.
> > > +        * That is life. :)
> >
> > Please remove this second line.
> OK
> > > +        */
> > > +       if (!(features & NETIF_F_RXCSUM))
> > > +               features &= ~NETIF_F_LRO;
> > > +
> > > +       return features;
> > > +}
> > > +
> > >  static int virtnet_set_features(struct net_device *dev,
> > >                                 netdev_features_t features)
> > >  {
> > >         struct virtnet_info *vi = netdev_priv(dev);
> > > -       u64 offloads;
> > > +       u64 offloads = vi->guest_offloads &
> > > +                      vi->guest_offloads_capable;
> >
> > When can vi->guest_offloads have bits set outside the mask of
> > vi->guest_offloads_capable?
> In this case, we can use only vi->guest_offloads. and
> guest_offloads_capable will not be used any more.
> so should we remove guest_offloads_capable ?

That bitmap stores the capabilities of the device as learned at
initial device probe. I don't see how it can be removed.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
