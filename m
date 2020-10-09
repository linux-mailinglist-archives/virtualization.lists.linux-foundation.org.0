Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F025D287FF3
	for <lists.virtualization@lfdr.de>; Fri,  9 Oct 2020 03:19:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 758F987686;
	Fri,  9 Oct 2020 01:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2pf1zrP6Kqx; Fri,  9 Oct 2020 01:19:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AD47487685;
	Fri,  9 Oct 2020 01:19:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B524C0051;
	Fri,  9 Oct 2020 01:19:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 860B8C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 01:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7A76987561
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 01:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBQ5I8+DJecO
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 01:19:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7989F8755D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 01:19:48 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id t25so10681593ejd.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 08 Oct 2020 18:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2HTm3KOv0Z8HJoze2OjkAd2YBNF85LGZH52VXfPgqs=;
 b=WDNgefohu7er2tk3/lc9Cg3sXN5aHkGNuZ1BLbvwZ2uL3FPN8vb+FOfRJFg5l7LM5d
 w7bwicv7RuLWhMvXg/yeH1GQkRwbqT1CrqFDGsp8O+fCeg08TaGVwgsxvJt7xI++iTlp
 eml5xLno2Nv2wi0qwpWub9x/r5T63NohjSrhstlanAEWAJ+xHDCOQPQ5NwJGO6HH2vik
 ssbLXoSloVED/6ZJxHSgPBuwyqvgtGnaZPBW0M5XX4Zqxga2DV28yMVkS0yZ62Dtq1ze
 yap3zArJVoaU3RPxz9s1VT96T+N1zZFKgei68SBrNyWijWizC4GHL6ivYbfNxCb9cF1Z
 aFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2HTm3KOv0Z8HJoze2OjkAd2YBNF85LGZH52VXfPgqs=;
 b=NjAEUufhk006CWrUCAlQCl4YKBx7dHbY4iWTys80lE2Xh0p3dJrIyP245EeAriINxb
 ArYd9lnXmLmDfZN9Y/J3kpboH8Ny871ap1kTRye5/fo0gSZ2cwKhfi/M9qIWiAQmZtUN
 4xZpYROhBA9OM3U/vxPlyhby2evDyJv/olBUKqXSwqp7uoQjmmyWeZRu9BUDUmM+pine
 ic07oUN1Im9kyO13dilXaV6kpOCYsarVpHOFmXriNqrGX/vj1UjHu44bixmU6JXLq0Be
 fkgVME8Hr46UXXYIWfjEyfjcVCcxzayB2LJQwh53mLngt2i9Bl56xGPRSC/jz9ISwLXW
 FpxQ==
X-Gm-Message-State: AOAM530d3ChiIcccU6EilBFHY41ZhD+/gmvNLA7l7UiE+puqm31dypOl
 snNDBmFQuVu8K/LGMGg6YqHtTCLK82C+h3Yk844=
X-Google-Smtp-Source: ABdhPJxCRQCoklODuoDgiWCBO3W1quztLP50pmXq22Yavm2mLJO4Lpjxq0l0zEMXa1xkRWmNM/VMUIy6ixMIPpZ9gd4=
X-Received: by 2002:a17:906:490d:: with SMTP id
 b13mr11549213ejq.122.1602206386937; 
 Thu, 08 Oct 2020 18:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200930020300.62245-1-xiangxia.m.yue@gmail.com>
 <CA+FuTSed1GsGp8a=GnHqV-HUcsOSZ0tb0NCe8360S8Md3MbS3g@mail.gmail.com>
In-Reply-To: <CA+FuTSed1GsGp8a=GnHqV-HUcsOSZ0tb0NCe8360S8Md3MbS3g@mail.gmail.com>
From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Date: Fri, 9 Oct 2020 09:16:14 +0800
Message-ID: <CAMDZJNWX=3ikS5f0H+xD-dByW2=JHXjvk1=R=CkDLt0TW-orTg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] virtio-net: ethtool configurable RXCSUM
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Network Development <netdev@vger.kernel.org>,
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

On Wed, Sep 30, 2020 at 6:05 PM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Wed, Sep 30, 2020 at 4:05 AM <xiangxia.m.yue@gmail.com> wrote:
> >
> > From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> >
> > Allow user configuring RXCSUM separately with ethtool -K,
> > reusing the existing virtnet_set_guest_offloads helper
> > that configures RXCSUM for XDP. This is conditional on
> > VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> >
> > If Rx checksum is disabled, LRO should also be disabled.
> >
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
>
> The first patch was merged into net.
>
> Please wait until that is merged into net-next, as this depends on the
> other patch.
>
> > ---
> > v2:
> > * LRO depends the rx csum
> > * remove the unnecessary check
> > ---
> >  drivers/net/virtio_net.c | 49 ++++++++++++++++++++++++++++++----------
> >  1 file changed, 37 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 21b71148c532..5407a0106771 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -68,6 +68,8 @@ static const unsigned long guest_offloads[] = {
> >                                 (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
> >                                 (1ULL << VIRTIO_NET_F_GUEST_UFO))
> >
> > +#define GUEST_OFFLOAD_CSUM_MASK (1ULL << VIRTIO_NET_F_GUEST_CSUM)
> > +
> >  struct virtnet_stat_desc {
> >         char desc[ETH_GSTRING_LEN];
> >         size_t offset;
> > @@ -2522,29 +2524,49 @@ static int virtnet_get_phys_port_name(struct net_device *dev, char *buf,
> >         return 0;
> >  }
> >
> > +static netdev_features_t virtnet_fix_features(struct net_device *netdev,
> > +                                             netdev_features_t features)
> > +{
> > +       /* If Rx checksum is disabled, LRO should also be disabled.
> > +        * That is life. :)
>
> Please remove this second line.
OK
> > +        */
> > +       if (!(features & NETIF_F_RXCSUM))
> > +               features &= ~NETIF_F_LRO;
> > +
> > +       return features;
> > +}
> > +
> >  static int virtnet_set_features(struct net_device *dev,
> >                                 netdev_features_t features)
> >  {
> >         struct virtnet_info *vi = netdev_priv(dev);
> > -       u64 offloads;
> > +       u64 offloads = vi->guest_offloads &
> > +                      vi->guest_offloads_capable;
>
> When can vi->guest_offloads have bits set outside the mask of
> vi->guest_offloads_capable?
In this case, we can use only vi->guest_offloads. and
guest_offloads_capable will not be used any more.
so should we remove guest_offloads_capable ?


-- 
Best regards, Tonghao
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
