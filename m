Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4D7129039
	for <lists.virtualization@lfdr.de>; Mon, 23 Dec 2019 00:15:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3E23E2038F;
	Sun, 22 Dec 2019 23:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yNQFkMRtkB5l; Sun, 22 Dec 2019 23:14:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D251520364;
	Sun, 22 Dec 2019 23:14:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3DDCC0881;
	Sun, 22 Dec 2019 23:14:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CEE0C18DC
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 23:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 79CD72038B
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 23:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvJA-paM+Vv4
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 23:14:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id A3C1320364
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 23:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577056494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oacqaIqkVqhvmYjRIHRg1RTNOe+DCAG/JEc5cTwcxTs=;
 b=YhUq0yc50aQ4KAHkEDFTQXzTO561ruB12etAJI2gF7Jq6Nsgt1K27PpsfVAoEvwYidFmQ1
 /de+h+LL0ucwaX46we6jyd/4xlHwh8hTbb9wJSnyIwfnanAXlffXOQVaACRn+IiZsZ9+ON
 74FnAKMv+7oeDbEjcw6uzRalw9J1lB0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-UaHH03fZMw6N1cevreDVMQ-1; Sun, 22 Dec 2019 18:14:53 -0500
Received: by mail-qv1-f71.google.com with SMTP id v3so4507700qvm.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 15:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oacqaIqkVqhvmYjRIHRg1RTNOe+DCAG/JEc5cTwcxTs=;
 b=aq0qwWGryCDobvsBBQh118b+J0sLuXNFrSirooFg+nr7DwwL0bLS9VzwWwhzhLXIQr
 J+18oFas1nVLRhjlIPkBLbYZ/Ea99lKp2HIQ9Q9JoOz9U++fithYxWMicBdRHMUk477G
 2CIBqjeYgdpM/laOH4UougtydnrIs5N20JI0z8oeD6rho2KjcOZ8J2YiI96oExxZ/TM+
 QWvf5ahazslfJjjKSNar6aA0mtAU/d1tzKn5ZNGKJ6CSq+befOq/0a26D0vWozAf6YsB
 EcoyiukRpcHrheLdQvbC++I7Qj+hV3XfBE3j1Oangd+XJ+owoyQ5IfBmXC0izzECeCL+
 iKFQ==
X-Gm-Message-State: APjAAAXZEgEW+J2j+a5+PJpaFl+fNbNQic2qne58tUKE6Et+F+8juD8t
 J0qqNZy7tvfvknLihqQe60a55XxFRvT5W83OGLjTa9rsFOTRWf1mooSGRZW5n5A6Kv4qRlyisfG
 co2vAtrXbibgtq+cix7Vf+KpJx9FlwNkDcu/N/DxHcQ==
X-Received: by 2002:ac8:3946:: with SMTP id t6mr21041535qtb.278.1577056492054; 
 Sun, 22 Dec 2019 15:14:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxs81afcv9O3ZCF9nqLaJj5XXKZoOJCYrgwMPzMSLIGEEKLPHmVO8N3ATJGdBb252/7DG1Ydw==
X-Received: by 2002:ac8:3946:: with SMTP id t6mr21041528qtb.278.1577056491818; 
 Sun, 22 Dec 2019 15:14:51 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id a144sm5339061qkc.30.2019.12.22.15.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 15:14:51 -0800 (PST)
Date: Sun, 22 Dec 2019 18:14:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net] virtio-net: Skip set_features on non-cvq devices
Message-ID: <20191222181341-mutt-send-email-mst@kernel.org>
References: <20191220212207.76726-1-adelva@google.com>
 <CA+FuTSewMaRTe51jOJtD-VHcp4Ct+c=11-9SxenULHwQuokamw@mail.gmail.com>
 <20191222080754-mutt-send-email-mst@kernel.org>
 <CA+FuTSd4vd9wS0sHmAk=Ys2-OwZarAHT3TNFzg7c7+2Dsott=g@mail.gmail.com>
 <20191222095141-mutt-send-email-mst@kernel.org>
 <CA+FuTScTcMqU4dKXNKCbjYJ8A-eVGp5eDNihAkq106YKTvTqDw@mail.gmail.com>
 <20191222160850-mutt-send-email-mst@kernel.org>
 <CA+FuTSerJ1Xhsmo2bFvTDohzmLsY5foOartO8ZjZEaK1vTTOcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+FuTSerJ1Xhsmo2bFvTDohzmLsY5foOartO8ZjZEaK1vTTOcw@mail.gmail.com>
X-MC-Unique: UaHH03fZMw6N1cevreDVMQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Alistair Delva <adelva@google.com>,
 Network Development <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, kernel-team@android.com,
 "David S . Miller" <davem@davemloft.net>
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

On Sun, Dec 22, 2019 at 04:44:31PM -0500, Willem de Bruijn wrote:
> On Sun, Dec 22, 2019 at 4:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Dec 22, 2019 at 10:54:23AM -0500, Willem de Bruijn wrote:
> > > On Sun, Dec 22, 2019 at 9:57 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Sun, Dec 22, 2019 at 09:21:43AM -0500, Willem de Bruijn wrote:
> > > > > On Sun, Dec 22, 2019 at 8:11 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Fri, Dec 20, 2019 at 10:08:41PM -0500, Willem de Bruijn wrote:
> > > > > > > On Fri, Dec 20, 2019 at 4:22 PM Alistair Delva <adelva@google.com> wrote:
> > > > > > > >
> > > > > > > > On devices without control virtqueue support, such as the virtio_net
> > > > > > > > implementation in crosvm[1], attempting to configure LRO will panic the
> > > > > > > > kernel:
> > > > > > > >
> > > > > > > > kernel BUG at drivers/net/virtio_net.c:1591!
> > > > > > > > invalid opcode: 0000 [#1] PREEMPT SMP PTI
> > > > > > > > CPU: 1 PID: 483 Comm: Binder:330_1 Not tainted 5.4.5-01326-g19463e9acaac #1
> > > > > > > > Hardware name: ChromiumOS crosvm, BIOS 0
> > > > > > > > RIP: 0010:virtnet_send_command+0x15d/0x170 [virtio_net]
> > > > > > > > Code: d8 00 00 00 80 78 02 00 0f 94 c0 65 48 8b 0c 25 28 00 00 00 48 3b 4c 24 70 75 11 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b e8 ec a4 12 c8 66 90 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
> > > > > > > > RSP: 0018:ffffb97940e7bb50 EFLAGS: 00010246
> > > > > > > > RAX: ffffffffc0596020 RBX: ffffa0e1fc8ea840 RCX: 0000000000000017
> > > > > > > > RDX: ffffffffc0596110 RSI: 0000000000000011 RDI: 000000000000000d
> > > > > > > > RBP: ffffb97940e7bbf8 R08: ffffa0e1fc8ea0b0 R09: ffffa0e1fc8ea0b0
> > > > > > > > R10: ffffffffffffffff R11: ffffffffc0590940 R12: 0000000000000005
> > > > > > > > R13: ffffa0e1ffad2c00 R14: ffffb97940e7bc08 R15: 0000000000000000
> > > > > > > > FS:  0000000000000000(0000) GS:ffffa0e1fd100000(006b) knlGS:00000000e5ef7494
> > > > > > > > CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > > > > > > > CR2: 00000000e5eeb82c CR3: 0000000079b06001 CR4: 0000000000360ee0
> > > > > > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > > > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > > > > > > Call Trace:
> > > > > > > >  ? preempt_count_add+0x58/0xb0
> > > > > > > >  ? _raw_spin_lock_irqsave+0x36/0x70
> > > > > > > >  ? _raw_spin_unlock_irqrestore+0x1a/0x40
> > > > > > > >  ? __wake_up+0x70/0x190
> > > > > > > >  virtnet_set_features+0x90/0xf0 [virtio_net]
> > > > > > > >  __netdev_update_features+0x271/0x980
> > > > > > > >  ? nlmsg_notify+0x5b/0xa0
> > > > > > > >  dev_disable_lro+0x2b/0x190
> > > > > > > >  ? inet_netconf_notify_devconf+0xe2/0x120
> > > > > > > >  devinet_sysctl_forward+0x176/0x1e0
> > > > > > > >  proc_sys_call_handler+0x1f0/0x250
> > > > > > > >  proc_sys_write+0xf/0x20
> > > > > > > >  __vfs_write+0x3e/0x190
> > > > > > > >  ? __sb_start_write+0x6d/0xd0
> > > > > > > >  vfs_write+0xd3/0x190
> > > > > > > >  ksys_write+0x68/0xd0
> > > > > > > >  __ia32_sys_write+0x14/0x20
> > > > > > > >  do_fast_syscall_32+0x86/0xe0
> > > > > > > >  entry_SYSENTER_compat+0x7c/0x8e
> > > > > > > >
> > > > > > > > This happens because virtio_set_features() does not check the presence
> > > > > > > > of the control virtqueue feature, which is sanity checked by a BUG_ON
> > > > > > > > in virtnet_send_command().
> > > > > > > >
> > > > > > > > Fix this by skipping any feature processing if the control virtqueue is
> > > > > > > > missing. This should be OK for any future feature that is added, as
> > > > > > > > presumably all of them would require control virtqueue support to notify
> > > > > > > > the endpoint that offload etc. should begin.
> > > > > > > >
> > > > > > > > [1] https://chromium.googlesource.com/chromiumos/platform/crosvm/
> > > > > > > >
> > > > > > > > Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> > > > > > > > Cc: stable@vger.kernel.org [4.20+]
> > > > > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > > > > > Cc: David S. Miller <davem@davemloft.net>
> > > > > > > > Cc: kernel-team@android.com
> > > > > > > > Cc: virtualization@lists.linux-foundation.org
> > > > > > > > Cc: linux-kernel@vger.kernel.org
> > > > > > > > Signed-off-by: Alistair Delva <adelva@google.com>
> > > > > > >
> > > > > > > Thanks for debugging this, Alistair.
> > > > > > >
> > > > > > > > ---
> > > > > > > >  drivers/net/virtio_net.c | 3 +++
> > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > > > > > index 4d7d5434cc5d..709bcd34e485 100644
> > > > > > > > --- a/drivers/net/virtio_net.c
> > > > > > > > +++ b/drivers/net/virtio_net.c
> > > > > > > > @@ -2560,6 +2560,9 @@ static int virtnet_set_features(struct net_device *dev,
> > > > > > > >         u64 offloads;
> > > > > > > >         int err;
> > > > > > > >
> > > > > > > > +       if (!vi->has_cvq)
> > > > > > > > +               return 0;
> > > > > > > > +
> > > > > > >
> > > > > > > Instead of checking for this in virtnet_set_features, how about we
> > > > > > > make configurability contingent on cvq in virtnet_probe:
> > > > > > >
> > > > > > > -       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> > > > > > > +       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) &&
> > > > > > > +           virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> > > > > > >                 dev->hw_features |= NETIF_F_LRO;
> > > > > > >
> > > > > > > Based on this logic a little below in the same function
> > > > > > >
> > > > > > >         if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> > > > > > >                 vi->has_cvq = true;
> > > > > >
> > > > > >
> > > > > > This would be a regression on old hypervisors which didn't have
> > > > > > CTL VQ - suddenly they will lose offloads.
> > > > >
> > > > > dev->features still correctly displays whether offloads are enabled.
> > > > > Removing it from dev->hw_features just renders it non-configurable.
> > > >
> > > > Oh you are right. I confused it with dev->features.
> > > >
> > > > > Note that before the patch that is being fixed the offloads were
> > > > > enabled, but ethtool would show them as off.
> > > >
> > > > So the bug is in spec, it should have said
> > > > VIRTIO_NET_F_CTRL_GUEST_OFFLOADS depends on VIRTIO_NET_F_CTRL_VQ, but we
> > > > missed that part. We can and I guess should add this as a recommendation
> > > > but it's too late to make it a MUST.
> > > >
> > > > Meanwhile I would say it's cleanest to work around
> > > > this in virtnet_validate by clearing VIRTIO_NET_F_CTRL_GUEST_OFFLOADS
> > > > if VIRTIO_NET_F_CTRL_VQ is off, with a big comment explaining
> > > > it's a spec bug.
> > >
> > > Wouldn't that cause precisely the regression you were concerned about?
> >
> > Not sure how do you mean.  VIRTIO_NET_F_CTRL_GUEST_OFFLOADS simply can't
> > work without a ctrl vq. What's the point of keeping it on?
> 
> Ah, now I was mistaken. I thought that
> 
>     dev->features |= NETIF_F_LRO
> 
> was also contingent on VIRTIO_NET_F_CTRL_GUEST_OFFLOADS. But that's
> another (pair of) flag(s), of course
> 
>         if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
>             virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
>                 dev->features |= NETIF_F_LRO;
> 
> I wonder if this bug is then also triggered when enabling XDP, through
> virtnet_clear_guest_offloads. That predates LRO, so would deserve
> another Fixes tag.


Are you sure? I thought LRO has been there before xdp...

> 
> > > Workloads may now depend on LRO for cycle efficiency. Reverting to
> > > behavior before this patch (though now displaying the offload state
> > > correctly) is more conservative in that regard.
> >
> > Do you see a problem with the following (untested):
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 4d7d5434cc5d..7b8805b47f0d 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -2971,6 +2971,15 @@ static int virtnet_validate(struct virtio_device *vdev)
> >         if (!virtnet_validate_features(vdev))
> >                 return -EINVAL;
> >
> > +       /* VIRTIO_NET_F_CTRL_GUEST_OFFLOADS does not work without
> > +        * VIRTIO_NET_F_CTRL_VQ. Unfortunately spec forgot to
> > +        * specify that VIRTIO_NET_F_CTRL_GUEST_OFFLOADS depends
> > +        * on VIRTIO_NET_F_CTRL_VQ so devices can set the later but
> > +        * not the former.
> > +        */
> > +       if (!virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> > +                       __virtio_clear_bit(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS);
> > +
> >         if (virtio_has_feature(vdev, VIRTIO_NET_F_MTU)) {
> >                 int mtu = virtio_cread16(vdev,
> >                                          offsetof(struct virtio_net_config,
> >
> 
> Looks good to me!

Alstair could you pls try this patch and report?

Thanks!

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
