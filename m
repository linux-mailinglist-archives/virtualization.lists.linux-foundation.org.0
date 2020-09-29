Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824C27BDE1
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 09:20:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 164BA86685;
	Tue, 29 Sep 2020 07:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMlyGiMXw8Xf; Tue, 29 Sep 2020 07:20:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E9D3D864E0;
	Tue, 29 Sep 2020 07:20:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE883C016F;
	Tue, 29 Sep 2020 07:20:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B134C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1622E86FC7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UaneYtzfFMKi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:20:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 70F4286FC5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:20:16 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id e22so5211667edq.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 00:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8AfVIM7nj1s2C0M9w5fBluTPef3EMqzRWiiH1JKPFg=;
 b=UAS8pwDuEKmzmaCwLryEJ41G/kriWG32BblW26Q+0RCqfG5JKnJBzel3h+K6MjxzQ2
 OVLs9/yDWFMXp7x15xx1WgGcYKBuCPpYZYaRGXzypavfSywtu5z3YRio01+Dm/OEvT4w
 dQDJdg1rGWgM+fKO9WLIXsbkR8ZTLoOGRj9R/xz7pNlHb+7bA62GUemhW2xfhiY3VX6/
 y28Rmr+WK96t142eBHVrxaMQ5Y3gy3lKrWpN2XfTOn71kQ3PXQH+gSiVXmovZyRFhVaH
 JcJX0i75v/xoF5FRfw5+uMdsVVl7fpVTq03efJo0rjlOTuCWSt7kIk3eKzk4fwtmJibW
 f1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8AfVIM7nj1s2C0M9w5fBluTPef3EMqzRWiiH1JKPFg=;
 b=X0KrJ0ezmRtLZp6vHP74jU0lW8s6LCSbVO8UsDO5w0+UH3C8cwnetS+VvjFs1LhQbq
 QDSaw+Wtv5edmzXXEnMB4GZPh6Cm4/J07TuF8jc1xw+nP2qxOGzDrqHa0OLo2IP8OZ3s
 SOwoYikkHP8LObg+hY4dmmOScz86eNQ27NH8gGEYEd4KJmKIn4jmT1B+TiVpvMbV6d5l
 U0wWiOFDiBus6qoKZnDZpqgQ9fMRGR8iBWt4ujfOGuCZ6HtgVabvF/xF2+cqY17mfXIB
 r96JCrDOOze4LSsZWy0JYZxQiZwMO2Jy9T1t2vWwh8t1I5egx601bpLlr5WABl98/Wx6
 6bzw==
X-Gm-Message-State: AOAM5327qcBiOFqeOqtvKDFxeLkNlJUeHujHP9/OJC0EWIZOkFz310ln
 CR+G2thmYCD8ojr9165f+o0v2XS2mFlZ+TCZD/E=
X-Google-Smtp-Source: ABdhPJx6wh40oMhel4yV9yYghsAjTEx9I/nGf0Jd2jWwUt6dweX3wyJfEFhxf/CLbS5o3vN62ZeBgbX3kKEYBowi8Mw=
X-Received: by 2002:a05:6402:1353:: with SMTP id
 y19mr1778136edw.71.1601364014949; 
 Tue, 29 Sep 2020 00:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200928033915.82810-1-xiangxia.m.yue@gmail.com>
 <20200928033915.82810-2-xiangxia.m.yue@gmail.com>
 <20200928152142-mutt-send-email-mst@kernel.org>
 <CAMDZJNVUVm9y2NV5ZGHzrPoEaDF4PZEGWVFEx9g6sF3U-1Rm0Q@mail.gmail.com>
 <20200929015427-mutt-send-email-mst@kernel.org>
 <CAMDZJNX94out3B_puYy+zbdotDwU=qZKG2=sMfyoj9o5nnewmA@mail.gmail.com>
 <20200929022138-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200929022138-mutt-send-email-mst@kernel.org>
From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Date: Tue, 29 Sep 2020 15:17:50 +0800
Message-ID: <CAMDZJNVzKc-Wb13Z5ocz_4DHqP_ZMzM1sO1GWmmKhNUKMuP9PQ@mail.gmail.com>
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

On Tue, Sep 29, 2020 at 2:22 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Sep 29, 2020 at 02:10:56PM +0800, Tonghao Zhang wrote:
> > On Tue, Sep 29, 2020 at 1:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Sep 29, 2020 at 09:45:24AM +0800, Tonghao Zhang wrote:
> > > > On Tue, Sep 29, 2020 at 3:25 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Mon, Sep 28, 2020 at 11:39:15AM +0800, xiangxia.m.yue@gmail.com wrote:
> > > > > > From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > > > > >
> > > > > > Allow user configuring RXCSUM separately with ethtool -K,
> > > > > > reusing the existing virtnet_set_guest_offloads helper
> > > > > > that configures RXCSUM for XDP. This is conditional on
> > > > > > VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> > > > > >
> > > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > > > Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > > > > > ---
> > > > > >  drivers/net/virtio_net.c | 40 ++++++++++++++++++++++++++++------------
> > > > > >  1 file changed, 28 insertions(+), 12 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > > > index 21b71148c532..2e3af0b2c281 100644
> > > > > > --- a/drivers/net/virtio_net.c
> > > > > > +++ b/drivers/net/virtio_net.c
> > > > > > @@ -68,6 +68,8 @@ static const unsigned long guest_offloads[] = {
> > > > > >                               (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
> > > > > >                               (1ULL << VIRTIO_NET_F_GUEST_UFO))
> > > > > >
> > > > > > +#define GUEST_OFFLOAD_CSUM_MASK (1ULL << VIRTIO_NET_F_GUEST_CSUM)
> > > > > > +
> > > > > >  struct virtnet_stat_desc {
> > > > > >       char desc[ETH_GSTRING_LEN];
> > > > > >       size_t offset;
> > > > > > @@ -2526,25 +2528,37 @@ static int virtnet_set_features(struct net_device *dev,
> > > > > >                               netdev_features_t features)
> > > > > >  {
> > > > > >       struct virtnet_info *vi = netdev_priv(dev);
> > > > > > -     u64 offloads;
> > > > > > +     u64 offloads = vi->guest_offloads &
> > > > > > +                    vi->guest_offloads_capable;
> > > > > >       int err;
> > > > > >
> > > > > > -     if ((dev->features ^ features) & NETIF_F_LRO) {
> > > > > > -             if (vi->xdp_queue_pairs)
> > > > > > -                     return -EBUSY;
> > > > > > +     /* Don't allow configuration while XDP is active. */
> > > > > > +     if (vi->xdp_queue_pairs)
> > > > > > +             return -EBUSY;
> > > > > >
> > > > > > +     if ((dev->features ^ features) & NETIF_F_LRO) {
> > > > > >               if (features & NETIF_F_LRO)
> > > > > > -                     offloads = vi->guest_offloads_capable;
> > > > > > +                     offloads |= GUEST_OFFLOAD_LRO_MASK;
> > > > > >               else
> > > > > > -                     offloads = vi->guest_offloads_capable &
> > > > > > -                                ~GUEST_OFFLOAD_LRO_MASK;
> > > > > > +                     offloads &= ~GUEST_OFFLOAD_LRO_MASK;
> > > > > > +     }
> > > > > >
> > > > > > -             err = virtnet_set_guest_offloads(vi, offloads);
> > > > > > -             if (err)
> > > > > > -                     return err;
> > > > > > -             vi->guest_offloads = offloads;
> > > > > > +     if ((dev->features ^ features) & NETIF_F_RXCSUM) {
> > > > > > +             if (features & NETIF_F_RXCSUM)
> > > > > > +                     offloads |= GUEST_OFFLOAD_CSUM_MASK;
> > > > > > +             else
> > > > > > +                     offloads &= ~GUEST_OFFLOAD_CSUM_MASK;
> > > > > >       }
> > > > > >
> > > > > > +     if (offloads == (vi->guest_offloads &
> > > > > > +                      vi->guest_offloads_capable))
> > > > > > +             return 0;
> > > > >
> > > > > Hmm, what exactly does this do?
> > > > If the features(lro, rxcsum) we supported, are not changed, it is not
> > > > necessary to invoke virtnet_set_guest_offloads.
> > >
> > > okay, could you describe the cases where this triggers in a bit more
> > > detail pls?
> > Hi
> > As I known,  when we run che commands show as below:
> > ethtool -K eth1 sg off
> > ethtool -K eth1 tso off
> >
> > In that case, we will not invoke virtnet_set_guest_offloads.
>
> How about initialization though? E.g. it looks like guest_offloads
> is 0-initialized, won't this skip the first command to disable
> offloads?
I guest you mean that: if guest_offloads == 0, and run the command
"ethtool -K eth1 sg off", that will disable offload ?
In that patch
u64 offloads = vi->guest_offloads & vi->guest_offloads_capable; // offload = 0
.....
 if (offloads == (vi->guest_offloads & vi->guest_offloads_capable)) //
if offload not changed, offload == 0, and (vi->guest_offloads &
vi->guest_offloads_capable) == 0.
        return 0;

virtnet_set_guest_offloads // that will not be invoked, so will not
disable offload

> > > > > > +
> > > > > > +     err = virtnet_set_guest_offloads(vi, offloads);
> > > > > > +     if (err)
> > > > > > +             return err;
> > > > > > +
> > > > > > +     vi->guest_offloads = offloads;
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > @@ -3013,8 +3027,10 @@ static int virtnet_probe(struct virtio_device *vdev)
> > > > > >       if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
> > > > > >           virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
> > > > > >               dev->features |= NETIF_F_LRO;
> > > > > > -     if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> > > > > > +     if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS)) {
> > > > > > +             dev->hw_features |= NETIF_F_RXCSUM;
> > > > > >               dev->hw_features |= NETIF_F_LRO;
> > > > > > +     }
> > > > > >
> > > > > >       dev->vlan_features = dev->features;
> > > > > >
> > > > > > --
> > > > > > 2.23.0
> > > > >
> > > >
> > > >
> > > > --
> > > > Best regards, Tonghao
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
