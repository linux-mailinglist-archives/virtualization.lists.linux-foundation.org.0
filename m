Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4F27BE71
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 09:55:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 45777870AF;
	Tue, 29 Sep 2020 07:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdwEh6Mh1woY; Tue, 29 Sep 2020 07:55:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF59A870A7;
	Tue, 29 Sep 2020 07:55:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D4C7C016F;
	Tue, 29 Sep 2020 07:55:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8485C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C06368709C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9CEInp1Ka4B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:55:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0679887093
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:55:17 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id gr14so13704317ejb.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 00:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UYWbaC8aE126T5Hj/W5A6qSb9Eu6WNag0875Och8Hj8=;
 b=q3UY85kYH/ftJxjf4HUMlmXQB7aWGNGt7k7K6R9t9xSBktnKPbi0m8m0njP6xlXI83
 +A/aVV1pirG8rIao8b48e76AgHA0h70IdhiZrDHEyfBEf9IfJQ0AtFNo6bjENIR40SR8
 QxdwkVNQeG36EubJFVnVTf4/KD00+aC1Ax1KCxY0FGVPgwvChlSnmqkTsCaEGzVUb+F8
 dpctKQxtnHOFE60/qfm/f7AHJ4KSHs0nZBNPcYct9MKIlVzBsFzqWWyii0vRlBE05I8a
 Y7DHIYlIveaJNz6Uu6KID27kBjfLxS92aGJ63zlE7ertHe8UY9j8AIAr0GIbyxRLBTUG
 8DoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UYWbaC8aE126T5Hj/W5A6qSb9Eu6WNag0875Och8Hj8=;
 b=B0w1KgAHEPNtskLuZTOarRVzdSpa1zsl8W+TsOFqApuaxWaTbeR1v7li/bFa6I3HTZ
 UvcwbyBQuwWaeEIR59m/+oomHg3ah8fkjjTZeC8GQFuBsxVGFI0HGKi/xUnSNIyfrZ1u
 vsQ3mkK2Hn1Q6LqrM7j1QfUACCKrwp5j5P5yz/rQslojCrhceCujeoAyxlkxPclLkKal
 cdQZpDRDdkZp5hvS34KOOyHbKRIQSk4M0OKBG9ksZFdg8JUnkInvVFjOLtW1LrhjNkkR
 V4jv9a3jMl7xnT/JMHShhr05gFBFODkJqz8YZ6oTtv95JGHhY9aLxIqT1M+KJ6x/BLfC
 1aiw==
X-Gm-Message-State: AOAM533N1Jm17zgp8ywBHuh6mDGBb14c+xkY3wGsKrvL82L0LknlK6jo
 ObxFUkVtMTcmKYM20Hv1TsxPcQnKHjkdE+SsxTA=
X-Google-Smtp-Source: ABdhPJw2blRXVy3vvgyOw6gmyB/cgS0V0ZxGeeOpOq/evab2dKaH7d40B5QYi38OVhBibn7wVpzHZbHEsjYhUFK2N6w=
X-Received: by 2002:a17:906:1690:: with SMTP id
 s16mr2587774ejd.122.1601366115502; 
 Tue, 29 Sep 2020 00:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200929015806.19171-1-xiangxia.m.yue@gmail.com>
 <CA+FuTSebRQ=2VfT0KnM6ChjMg0j3NWJDPwn9S=aQk8tbNrUt6w@mail.gmail.com>
In-Reply-To: <CA+FuTSebRQ=2VfT0KnM6ChjMg0j3NWJDPwn9S=aQk8tbNrUt6w@mail.gmail.com>
From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Date: Tue, 29 Sep 2020 15:52:50 +0800
Message-ID: <CAMDZJNW=hEEcsJy1gUEwrnERRgH3kRBkEuDtcPwPdfXr91eTGg@mail.gmail.com>
Subject: Re: [PATCH net v2] virtio-net: don't disable guest csum when disable
 LRO
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

On Tue, Sep 29, 2020 at 3:32 PM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Tue, Sep 29, 2020 at 4:00 AM <xiangxia.m.yue@gmail.com> wrote:
> >
> > From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> >
> > Open vSwitch and Linux bridge will disable LRO of the interface
> > when this interface added to them. Now when disable the LRO, the
> > virtio-net csum is disable too. That drops the forwarding performance.
>
> I had focused on the code previously.
>
> The s/w checksum verification cost is significant in a VM with traffic
> to local destinations. A bridge does not verify transport layer
> checksums OTOH?
Hi Willem.
No, think about GRO(In the GRO we don't know packets will be forwarded
to other ports or to local). The call tree as below:
   + 5.41% secondary_startup_64
   - 1.22% ret_from_fork
....
        net_rx_action
        napi_poll
        virtnet_poll
        virtnet_receive
        napi_gro_receive
        dev_gro_receive
        inet_gro_receive
        tcp4_gro_receive
        __skb_gro_checksum_complete
        skb_checksum
        __skb_checksum
        csum_partial
        do_csum
   - 1.13% do_csum

$ brctl show
bridge name bridge id STP enabled interfaces
br0 8000.001122330001 no eth1
eth2


> > Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > ---
> > v2:
> > * change the fix-tag
> > ---
> >  drivers/net/virtio_net.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 7145c83c6c8c..21b71148c532 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -63,6 +63,11 @@ static const unsigned long guest_offloads[] = {
> >         VIRTIO_NET_F_GUEST_CSUM
> >  };
> >
> > +#define GUEST_OFFLOAD_LRO_MASK ((1ULL << VIRTIO_NET_F_GUEST_TSO4) | \
> > +                               (1ULL << VIRTIO_NET_F_GUEST_TSO6) | \
> > +                               (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
> > +                               (1ULL << VIRTIO_NET_F_GUEST_UFO))
> > +
> >  struct virtnet_stat_desc {
> >         char desc[ETH_GSTRING_LEN];
> >         size_t offset;
> > @@ -2531,7 +2536,8 @@ static int virtnet_set_features(struct net_device *dev,
> >                 if (features & NETIF_F_LRO)
> >                         offloads = vi->guest_offloads_capable;
> >                 else
> > -                       offloads = 0;
> > +                       offloads = vi->guest_offloads_capable &
> > +                                  ~GUEST_OFFLOAD_LRO_MASK;
> >
> >                 err = virtnet_set_guest_offloads(vi, offloads);
> >                 if (err)
> > --
> > 2.23.0
> >



-- 
Best regards, Tonghao
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
