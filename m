Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B4128E83
	for <lists.virtualization@lfdr.de>; Sun, 22 Dec 2019 15:22:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B5C86877DB;
	Sun, 22 Dec 2019 14:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1D3W5B8UaQe; Sun, 22 Dec 2019 14:22:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 08C1D8762E;
	Sun, 22 Dec 2019 14:22:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D78C8C0881;
	Sun, 22 Dec 2019 14:22:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFF6AC0881
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 14:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DC410875F9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 14:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdefOI5dccpD
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 14:22:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4DE4F8744A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 14:22:24 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id a124so6115129ybg.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THlA5NTI//lyv3s+FDTGj24TVhpc+hcbOPPNoSPH/Lk=;
 b=snZO3dXqyqSCfewSRq7k/W6Hof51qOQGHUhEr6BLG1eluc8fcNpJM9hx9e9/dIA4+J
 1ir1E4CAapLT7ILyy9d6nzvJ0uXzOp6r3eSK5YmS3z2fkT6bTWDoNy3yFj0G3M8pUa9g
 EP67rPa+PVNAjksE6j4THtMGTTHecod6rSf58ABnZvzvTklG6lMb8KAUojMKbmKMyKt6
 UXHJsily4aV7pneanM3ywb/SaToB8htimqDPpkuDB8HQB5p5wZAyG9+rQ2CMOFjAFlCw
 xg+FiHLOYmqVNXVO3a6deF9/Tyx6/vZU/NXurFKlPCvjXtB8FLX/nn4//LFYBQAOQPcG
 oe4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THlA5NTI//lyv3s+FDTGj24TVhpc+hcbOPPNoSPH/Lk=;
 b=Jqrg/2uVj98N0hdb+OKRKgxX/7g4GTxWb23NzDZJx43rhLuuMxMs5e5WcON79kVBdg
 DlU7QaiQPmKtSIiTlARLAtQJ7brISSshYH1uZZ6ie2duVLEW0EG1QeOY9PU2Ld39jDeM
 V25m3cz8b7nV/zX6rucfQJD79H5Z5P11ObEoIz4hVzVCALJNVcDZb3xDtIAYWBhTUIfN
 6Gj7a8OKN++wCCEk3TctrgD5y+mnMYZmVWHxO3vrtOAAogHhvGl65LXQxXODFT1qtZyj
 vQURVtdyaelvTArccoN0dWwkNEJh/oiIYCXz08wQNaOcDnbIUjha41JinFQfog4T16/G
 uSpw==
X-Gm-Message-State: APjAAAXj9AtuvaDK2TZo2YhTYwuhU5HtgkbIuU/GMBq/4XKyyZ24RLDL
 MRyshzsnBh1V7XNEvUht5R6vLkKu
X-Google-Smtp-Source: APXvYqxAe792lk8BSZKYxERxVyHMBC5E37zv8uajBX6GcyRQuVdHFVr2d4PFyqwPYX4FAUugW8r/qw==
X-Received: by 2002:a25:7645:: with SMTP id r66mr16811266ybc.363.1577024542741; 
 Sun, 22 Dec 2019 06:22:22 -0800 (PST)
Received: from mail-yw1-f46.google.com (mail-yw1-f46.google.com.
 [209.85.161.46])
 by smtp.gmail.com with ESMTPSA id q185sm6467118ywh.61.2019.12.22.06.22.20
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Dec 2019 06:22:21 -0800 (PST)
Received: by mail-yw1-f46.google.com with SMTP id t141so6144774ywc.11
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 06:22:20 -0800 (PST)
X-Received: by 2002:a0d:e886:: with SMTP id
 r128mr18295532ywe.357.1577024540362; 
 Sun, 22 Dec 2019 06:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20191220212207.76726-1-adelva@google.com>
 <CA+FuTSewMaRTe51jOJtD-VHcp4Ct+c=11-9SxenULHwQuokamw@mail.gmail.com>
 <20191222080754-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191222080754-mutt-send-email-mst@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Sun, 22 Dec 2019 09:21:43 -0500
X-Gmail-Original-Message-ID: <CA+FuTSd4vd9wS0sHmAk=Ys2-OwZarAHT3TNFzg7c7+2Dsott=g@mail.gmail.com>
Message-ID: <CA+FuTSd4vd9wS0sHmAk=Ys2-OwZarAHT3TNFzg7c7+2Dsott=g@mail.gmail.com>
Subject: Re: [PATCH net] virtio-net: Skip set_features on non-cvq devices
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alistair Delva <adelva@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
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

On Sun, Dec 22, 2019 at 8:11 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Dec 20, 2019 at 10:08:41PM -0500, Willem de Bruijn wrote:
> > On Fri, Dec 20, 2019 at 4:22 PM Alistair Delva <adelva@google.com> wrote:
> > >
> > > On devices without control virtqueue support, such as the virtio_net
> > > implementation in crosvm[1], attempting to configure LRO will panic the
> > > kernel:
> > >
> > > kernel BUG at drivers/net/virtio_net.c:1591!
> > > invalid opcode: 0000 [#1] PREEMPT SMP PTI
> > > CPU: 1 PID: 483 Comm: Binder:330_1 Not tainted 5.4.5-01326-g19463e9acaac #1
> > > Hardware name: ChromiumOS crosvm, BIOS 0
> > > RIP: 0010:virtnet_send_command+0x15d/0x170 [virtio_net]
> > > Code: d8 00 00 00 80 78 02 00 0f 94 c0 65 48 8b 0c 25 28 00 00 00 48 3b 4c 24 70 75 11 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b e8 ec a4 12 c8 66 90 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
> > > RSP: 0018:ffffb97940e7bb50 EFLAGS: 00010246
> > > RAX: ffffffffc0596020 RBX: ffffa0e1fc8ea840 RCX: 0000000000000017
> > > RDX: ffffffffc0596110 RSI: 0000000000000011 RDI: 000000000000000d
> > > RBP: ffffb97940e7bbf8 R08: ffffa0e1fc8ea0b0 R09: ffffa0e1fc8ea0b0
> > > R10: ffffffffffffffff R11: ffffffffc0590940 R12: 0000000000000005
> > > R13: ffffa0e1ffad2c00 R14: ffffb97940e7bc08 R15: 0000000000000000
> > > FS:  0000000000000000(0000) GS:ffffa0e1fd100000(006b) knlGS:00000000e5ef7494
> > > CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > > CR2: 00000000e5eeb82c CR3: 0000000079b06001 CR4: 0000000000360ee0
> > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > Call Trace:
> > >  ? preempt_count_add+0x58/0xb0
> > >  ? _raw_spin_lock_irqsave+0x36/0x70
> > >  ? _raw_spin_unlock_irqrestore+0x1a/0x40
> > >  ? __wake_up+0x70/0x190
> > >  virtnet_set_features+0x90/0xf0 [virtio_net]
> > >  __netdev_update_features+0x271/0x980
> > >  ? nlmsg_notify+0x5b/0xa0
> > >  dev_disable_lro+0x2b/0x190
> > >  ? inet_netconf_notify_devconf+0xe2/0x120
> > >  devinet_sysctl_forward+0x176/0x1e0
> > >  proc_sys_call_handler+0x1f0/0x250
> > >  proc_sys_write+0xf/0x20
> > >  __vfs_write+0x3e/0x190
> > >  ? __sb_start_write+0x6d/0xd0
> > >  vfs_write+0xd3/0x190
> > >  ksys_write+0x68/0xd0
> > >  __ia32_sys_write+0x14/0x20
> > >  do_fast_syscall_32+0x86/0xe0
> > >  entry_SYSENTER_compat+0x7c/0x8e
> > >
> > > This happens because virtio_set_features() does not check the presence
> > > of the control virtqueue feature, which is sanity checked by a BUG_ON
> > > in virtnet_send_command().
> > >
> > > Fix this by skipping any feature processing if the control virtqueue is
> > > missing. This should be OK for any future feature that is added, as
> > > presumably all of them would require control virtqueue support to notify
> > > the endpoint that offload etc. should begin.
> > >
> > > [1] https://chromium.googlesource.com/chromiumos/platform/crosvm/
> > >
> > > Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> > > Cc: stable@vger.kernel.org [4.20+]
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Jason Wang <jasowang@redhat.com>
> > > Cc: David S. Miller <davem@davemloft.net>
> > > Cc: kernel-team@android.com
> > > Cc: virtualization@lists.linux-foundation.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Signed-off-by: Alistair Delva <adelva@google.com>
> >
> > Thanks for debugging this, Alistair.
> >
> > > ---
> > >  drivers/net/virtio_net.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > index 4d7d5434cc5d..709bcd34e485 100644
> > > --- a/drivers/net/virtio_net.c
> > > +++ b/drivers/net/virtio_net.c
> > > @@ -2560,6 +2560,9 @@ static int virtnet_set_features(struct net_device *dev,
> > >         u64 offloads;
> > >         int err;
> > >
> > > +       if (!vi->has_cvq)
> > > +               return 0;
> > > +
> >
> > Instead of checking for this in virtnet_set_features, how about we
> > make configurability contingent on cvq in virtnet_probe:
> >
> > -       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> > +       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) &&
> > +           virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> >                 dev->hw_features |= NETIF_F_LRO;
> >
> > Based on this logic a little below in the same function
> >
> >         if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> >                 vi->has_cvq = true;
>
>
> This would be a regression on old hypervisors which didn't have
> CTL VQ - suddenly they will lose offloads.

dev->features still correctly displays whether offloads are enabled.
Removing it from dev->hw_features just renders it non-configurable.

Note that before the patch that is being fixed the offloads were
enabled, but ethtool would show them as off.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
