Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A218D12A874
	for <lists.virtualization@lfdr.de>; Wed, 25 Dec 2019 17:02:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7020283DA4;
	Wed, 25 Dec 2019 16:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6q1nhVOaoyX; Wed, 25 Dec 2019 16:02:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CAA5681DFB;
	Wed, 25 Dec 2019 16:02:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96985C0881;
	Wed, 25 Dec 2019 16:02:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47B76C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Dec 2019 16:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37D6384547
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Dec 2019 16:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvdRrPeK7cS6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Dec 2019 16:02:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DA470844A1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Dec 2019 16:02:44 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id x138so9418751ywd.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Dec 2019 08:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xbjdKFYnRPE22MuPGqmxVrHVoC1Lr//HPWCd1VnKDIc=;
 b=TIBIumMRVZUUukwX9fjUvDYs638HJM1vhjJBtoz3hhtjI9JpCxNz9wiphndtw0uO9J
 A5mZg/srdnxEKPDQtVZjLAC1WuG315ExhtWfz3lacmEuv6N+NKBEgrVbcanGjXcVhQFF
 a+pqL3jAW8c9HhS5xojaTTX45jQe6zd0khDbcvsJ2dGIGyARRWuD6WgMh1qeFDkVEz/T
 7E6+MB9mYtokUybi1I+c6VtfU9QTf4wYJkl0g1zcOwyq92bsiAnm81apo/9BpEQ1je4y
 xhWqJ16mVdBAnK4nt4JjDM7WY5XlOMfLygIYUzoHm7Q9e5R8wp2BtSdTbp5w5nl41/kP
 7iYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xbjdKFYnRPE22MuPGqmxVrHVoC1Lr//HPWCd1VnKDIc=;
 b=ft4aRQ1P2ds4RXXaWZ8mug0U1rhQlbZy1GqOFBfspnSytOhi658RHqb9KiZix6rEYt
 BbS83NGyo7H7c1u+gq93jSpM1Hhs3M0rQsVToctLafZgB1EY9JxiKcnIAOl6oJ2f8mIY
 k2aq6YQgTXiP9P3hyiH9zOTO9XCAjh7YSwf5J4VALuY8O4aZ65/g8thm6shbw6kyUIZM
 Krb2tERbTwVtqx5m1UTxkF+A5ax0QKsqmPYJ52alFR7w/hbyQMNtqM0OPnGLMKVKFiO4
 077s2yIL/PNT8skKSmgBzft65nwLp5yxtLcQSU5y1FMrM6KrGIx/cSZqFEVKdvc1uVDh
 oQ9g==
X-Gm-Message-State: APjAAAU4WECCpYHunmTTEW6KRFiqYm+ZJnnkl3uexLSyq7ZYy+rOQJu8
 BDoUnYQrRn+uHovdXZU8SzlwtOK5
X-Google-Smtp-Source: APXvYqyzJJRa4MjstchJSCDcFc+K+G+B+H2zU19Z/7R4pjsZ60AV+izrUygMTeY1a7f/q8o8oXJLgw==
X-Received: by 2002:a0d:dd56:: with SMTP id g83mr29530634ywe.174.1577289763149; 
 Wed, 25 Dec 2019 08:02:43 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id k133sm10863940ywc.9.2019.12.25.08.02.41
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Dec 2019 08:02:41 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id b145so9383941yba.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Dec 2019 08:02:41 -0800 (PST)
X-Received: by 2002:a5b:c43:: with SMTP id d3mr30180493ybr.203.1577289760699; 
 Wed, 25 Dec 2019 08:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20191223140322.20013-1-mst@redhat.com>
 <CANDihLHPk5khpv-f-M+qhkzgTkygAts38GGb-HChg-VL2bo+Uw@mail.gmail.com>
 <CA+FuTSfq5v3-0VYmTG7YFFUqT8uG53eXXhqc8WvVvMbp3s0nvA@mail.gmail.com>
 <CA+FuTScwwajN2ny2w8EBkBQd191Eb1ZsrRhbh3=5eQervArnEA@mail.gmail.com>
 <CANDihLFv+DJYOD1m_Z3CKuxoXG-z4zPy_Tc2eoggq1KRo+GeWw@mail.gmail.com>
In-Reply-To: <CANDihLFv+DJYOD1m_Z3CKuxoXG-z4zPy_Tc2eoggq1KRo+GeWw@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 25 Dec 2019 11:02:03 -0500
X-Gmail-Original-Message-ID: <CA+FuTSfrg9eOee6sxR-oSb4sfK2-FbQh7A0y3YJOjf+pTmSjxA@mail.gmail.com>
Message-ID: <CA+FuTSfrg9eOee6sxR-oSb4sfK2-FbQh7A0y3YJOjf+pTmSjxA@mail.gmail.com>
Subject: Re: [PATCH net] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
To: Alistair Delva <adelva@google.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>
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

On Mon, Dec 23, 2019 at 3:22 PM Alistair Delva <adelva@google.com> wrote:
>
> On Mon, Dec 23, 2019 at 12:12 PM Willem de Bruijn
> <willemdebruijn.kernel@gmail.com> wrote:
> >
> > On Mon, Dec 23, 2019 at 2:56 PM Willem de Bruijn
> > <willemdebruijn.kernel@gmail.com> wrote:
> > >
> > > 00fffe0ff0 DR7: 0000000000000400
> > > > > Call Trace:
> > > > >  ? preempt_count_add+0x58/0xb0
> > > > >  ? _raw_spin_lock_irqsave+0x36/0x70
> > > > >  ? _raw_spin_unlock_irqrestore+0x1a/0x40
> > > > >  ? __wake_up+0x70/0x190
> > > > >  virtnet_set_features+0x90/0xf0 [virtio_net]
> > > > >  __netdev_update_features+0x271/0x980
> > > > >  ? nlmsg_notify+0x5b/0xa0
> > > > >  dev_disable_lro+0x2b/0x190
> > > > >  ? inet_netconf_notify_devconf+0xe2/0x120
> > > > >  devinet_sysctl_forward+0x176/0x1e0
> > > > >  proc_sys_call_handler+0x1f0/0x250
> > > > >  proc_sys_write+0xf/0x20
> > > > >  __vfs_write+0x3e/0x190
> > > > >  ? __sb_start_write+0x6d/0xd0
> > > > >  vfs_write+0xd3/0x190
> > > > >  ksys_write+0x68/0xd0
> > > > >  __ia32_sys_write+0x14/0x20
> > > > >  do_fast_syscall_32+0x86/0xe0
> > > > >  entry_SYSENTER_compat+0x7c/0x8e
> > > > >
> > > > > A similar crash will likely trigger when enabling XDP.
> > > > >
> > > > > Reported-by: Alistair Delva <adelva@google.com>
> > > > > Reported-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> > > > > Fixes: 3f93522ffab2 ("virtio-net: switch off offloads on demand if possible on XDP set")
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > ---
> > > > >
> > > > > Lightly tested.
> > > > >
> > > > > Alistair, could you please test and confirm that this resolves the
> > > > > crash for you?
> > > >
> > > > This patch doesn't work. The reason is that NETIF_F_LRO is also turned
> > > > on by TSO4/TSO6, which your patch didn't check for. So it ends up
> > > > going through the same path and crashing in the same way.
> > > >
> > > >         if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
> > > >             virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
> > > >                 dev->features |= NETIF_F_LRO;
> > > >
> > > > It sounds like this patch is fixing something slightly differently to
> > > > my patch fixed. virtnet_set_features() doesn't care about
> > > > GUEST_OFFLOADS, it only tests against NETIF_F_LRO. Even if "offloads"
> > > > is zero, it will call virtnet_set_guest_offloads(), which triggers the
> > > > crash.
> > >
> > >
> > > Interesting. It's surprising that it is trying to configure a flag
> > > that is not configurable, i.e., absent from dev->hw_features
> > > after Michael's change.
> > >
> > > > So either we need to ensure NETIF_F_LRO is never set, or
> > >
> > > LRO might be available, just not configurable. Indeed this was what I
> > > observed in the past.
> >
> > dev_disable_lro expects that NETIF_F_LRO is always configurable. Which
> > I guess is a reasonable assumption, just not necessarily the case in
> > virtio_net.
> >
> > So I think we need both patches. Correctly mark the feature as fixed
> > by removing from dev->hw_features and also ignore the request from
> > dev_disable_lro, which does not check for this.
>
> Something like this maybe:
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 4d7d5434cc5d..0556f42b0fb5 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2560,6 +2560,9 @@ static int virtnet_set_features(struct net_device *dev,
>         u64 offloads;
>         int err;
>
> +       if (!virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> +               return 0;
> +
>         if ((dev->features ^ features) & NETIF_F_LRO) {
>                 if (vi->xdp_queue_pairs)
>                         return -EBUSY;
> @@ -2971,6 +2974,15 @@ static int virtnet_validate(struct virtio_device *vdev)
>         if (!virtnet_validate_features(vdev))
>                 return -EINVAL;
>
> +       /* VIRTIO_NET_F_CTRL_GUEST_OFFLOADS does not work without
> +        * VIRTIO_NET_F_CTRL_VQ. However the virtio spec does not
> +        * specify that VIRTIO_NET_F_CTRL_GUEST_OFFLOADS depends
> +        * on VIRTIO_NET_F_CTRL_VQ so devices can set the later but
> +        * not the former.
> +        */
> +       if (!virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> +               __virtio_clear_bit(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS);
> +
>         if (virtio_has_feature(vdev, VIRTIO_NET_F_MTU)) {
>                 int mtu = virtio_cread16(vdev,
>                                          offsetof(struct virtio_net_config,

I think we need three separate patches.

- disable guest offloads if VQ is absent
- remove LRO from hw_features if guest offloads are absent

This should fix the ethtool path.  But there is a separate path to
disable LRO through dev_disable_lro (from bond enslave, xdp install,
sysctl -n net.ipv.ip_forward=1, ..) that assumes LRO is always
configurable. So we cannot work around needing a patch to
virtset_set_features.

After a long detour, I think your original submission is fine for
that.

Perhaps with a comment in the commit that it is needed even
if the feature is absent from hw_features for dev_disable_lro.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
