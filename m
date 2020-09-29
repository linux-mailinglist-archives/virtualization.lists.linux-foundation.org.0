Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EA727BCDF
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 08:13:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8E35C204FA;
	Tue, 29 Sep 2020 06:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLEo+nsgyOEQ; Tue, 29 Sep 2020 06:13:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 161341FEAB;
	Tue, 29 Sep 2020 06:13:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F103FC0051;
	Tue, 29 Sep 2020 06:13:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D73DC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 06:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7566786F7B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 06:13:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yj8XEh29d7Ys
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 06:13:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7C96F86F8A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 06:13:22 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id o8so13293735ejb.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 23:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZQeJtUz9oxtcF3AII4Hqcc/QpKUTP2g6qGeW5Urmq0I=;
 b=nBZQYxXCJ5aazG+q/85PjLWtHRPzEk7XO1uDWS68z5y9f48xkhHnG9VEKt6Yg5IvXy
 e7Go8s82VzvoZt4zuowmTfu8o47yIMkT1i9Ph7sSadp1jDqlf/lj0+3H0yOTzDeqytBE
 YNkTL8Uy82uHIYH3qEmXCAWGe/rVtlc5e3yhMo8lr66QQg11mU2qRqVbY9D5lijIWT4f
 n8y2fv5TZsZviAowujqa/rNvTlAHPKDfAdoaHnscjZM/nbEKWlH6DeTGG8+0pM7ODCYm
 9BK7ShD2EBU4qFYfmMcnBh2ESKtmi1SiYdsCCPQomF7smkA/8l5nv0/pbHXxGQc0DlGW
 /+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZQeJtUz9oxtcF3AII4Hqcc/QpKUTP2g6qGeW5Urmq0I=;
 b=ir9musqun2/PdH7prazA5XlaB+UAFI9jXXghGpMiWTSA5ufxfRdrG7qYJnzJy4/dtT
 PH8SFA4lQoa777G5YqqScmc11jX6kHUkvt7MzjKVu9IZLxlT3/FzJhmuhC1wY7rdy7Gf
 W+8llt0nUYP9gESou2frcE6gZW++eoSqx1Vo5l8jjvL+jMJ8kOUD47W1XUAZyGlI6/kD
 vjUiKrsy/vV+mEtMNasD4k0/EaZ9CfaIwKeM9fLmELhzgN6snLBZhnVL4OJ5EbjzC2Q8
 fN/BKEw5zpfJ/uDLB5Hw8h6po/LjwABHHRgQg7Ba9CXusrNSjZX3tX7gh4r+ZVdkFdrp
 97XQ==
X-Gm-Message-State: AOAM530kdL+pWniYSnzx5il7RELG5B9uDna6I2juy7MlABa3E2ulddJx
 IHCuBimHF0i7lqamZ3Wa79miOMf4B+2wBvMVyjk=
X-Google-Smtp-Source: ABdhPJyPjo91Rzi99gEGORlWXAADe8p7c7AQJz08VR9iIZZXHtPM3T/PvOEnyBaR0PzodljuIbaBoPlzEj67XoTNthA=
X-Received: by 2002:a17:906:1690:: with SMTP id
 s16mr2271575ejd.122.1601360000885; 
 Mon, 28 Sep 2020 23:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200928033915.82810-1-xiangxia.m.yue@gmail.com>
 <20200928033915.82810-2-xiangxia.m.yue@gmail.com>
 <20200928152142-mutt-send-email-mst@kernel.org>
 <CAMDZJNVUVm9y2NV5ZGHzrPoEaDF4PZEGWVFEx9g6sF3U-1Rm0Q@mail.gmail.com>
 <20200929015427-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200929015427-mutt-send-email-mst@kernel.org>
From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Date: Tue, 29 Sep 2020 14:10:56 +0800
Message-ID: <CAMDZJNX94out3B_puYy+zbdotDwU=qZKG2=sMfyoj9o5nnewmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] virtio-net: ethtool configurable RXCSUM
To: "Michael S. Tsirkin" <mst@redhat.com>
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

On Tue, Sep 29, 2020 at 1:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Sep 29, 2020 at 09:45:24AM +0800, Tonghao Zhang wrote:
> > On Tue, Sep 29, 2020 at 3:25 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Sep 28, 2020 at 11:39:15AM +0800, xiangxia.m.yue@gmail.com wrote:
> > > > From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > > >
> > > > Allow user configuring RXCSUM separately with ethtool -K,
> > > > reusing the existing virtnet_set_guest_offloads helper
> > > > that configures RXCSUM for XDP. This is conditional on
> > > > VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> > > >
> > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > > > ---
> > > >  drivers/net/virtio_net.c | 40 ++++++++++++++++++++++++++++------------
> > > >  1 file changed, 28 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > index 21b71148c532..2e3af0b2c281 100644
> > > > --- a/drivers/net/virtio_net.c
> > > > +++ b/drivers/net/virtio_net.c
> > > > @@ -68,6 +68,8 @@ static const unsigned long guest_offloads[] = {
> > > >                               (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
> > > >                               (1ULL << VIRTIO_NET_F_GUEST_UFO))
> > > >
> > > > +#define GUEST_OFFLOAD_CSUM_MASK (1ULL << VIRTIO_NET_F_GUEST_CSUM)
> > > > +
> > > >  struct virtnet_stat_desc {
> > > >       char desc[ETH_GSTRING_LEN];
> > > >       size_t offset;
> > > > @@ -2526,25 +2528,37 @@ static int virtnet_set_features(struct net_device *dev,
> > > >                               netdev_features_t features)
> > > >  {
> > > >       struct virtnet_info *vi = netdev_priv(dev);
> > > > -     u64 offloads;
> > > > +     u64 offloads = vi->guest_offloads &
> > > > +                    vi->guest_offloads_capable;
> > > >       int err;
> > > >
> > > > -     if ((dev->features ^ features) & NETIF_F_LRO) {
> > > > -             if (vi->xdp_queue_pairs)
> > > > -                     return -EBUSY;
> > > > +     /* Don't allow configuration while XDP is active. */
> > > > +     if (vi->xdp_queue_pairs)
> > > > +             return -EBUSY;
> > > >
> > > > +     if ((dev->features ^ features) & NETIF_F_LRO) {
> > > >               if (features & NETIF_F_LRO)
> > > > -                     offloads = vi->guest_offloads_capable;
> > > > +                     offloads |= GUEST_OFFLOAD_LRO_MASK;
> > > >               else
> > > > -                     offloads = vi->guest_offloads_capable &
> > > > -                                ~GUEST_OFFLOAD_LRO_MASK;
> > > > +                     offloads &= ~GUEST_OFFLOAD_LRO_MASK;
> > > > +     }
> > > >
> > > > -             err = virtnet_set_guest_offloads(vi, offloads);
> > > > -             if (err)
> > > > -                     return err;
> > > > -             vi->guest_offloads = offloads;
> > > > +     if ((dev->features ^ features) & NETIF_F_RXCSUM) {
> > > > +             if (features & NETIF_F_RXCSUM)
> > > > +                     offloads |= GUEST_OFFLOAD_CSUM_MASK;
> > > > +             else
> > > > +                     offloads &= ~GUEST_OFFLOAD_CSUM_MASK;
> > > >       }
> > > >
> > > > +     if (offloads == (vi->guest_offloads &
> > > > +                      vi->guest_offloads_capable))
> > > > +             return 0;
> > >
> > > Hmm, what exactly does this do?
> > If the features(lro, rxcsum) we supported, are not changed, it is not
> > necessary to invoke virtnet_set_guest_offloads.
>
> okay, could you describe the cases where this triggers in a bit more
> detail pls?
Hi
As I known,  when we run che commands show as below:
ethtool -K eth1 sg off
ethtool -K eth1 tso off

In that case, we will not invoke virtnet_set_guest_offloads.

> > > > +
> > > > +     err = virtnet_set_guest_offloads(vi, offloads);
> > > > +     if (err)
> > > > +             return err;
> > > > +
> > > > +     vi->guest_offloads = offloads;
> > > >       return 0;
> > > >  }
> > > >
> > > > @@ -3013,8 +3027,10 @@ static int virtnet_probe(struct virtio_device *vdev)
> > > >       if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
> > > >           virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
> > > >               dev->features |= NETIF_F_LRO;
> > > > -     if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> > > > +     if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS)) {
> > > > +             dev->hw_features |= NETIF_F_RXCSUM;
> > > >               dev->hw_features |= NETIF_F_LRO;
> > > > +     }
> > > >
> > > >       dev->vlan_features = dev->features;
> > > >
> > > > --
> > > > 2.23.0
> > >
> >
> >
> > --
> > Best regards, Tonghao
>


-- 
Best regards, Tonghao
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
