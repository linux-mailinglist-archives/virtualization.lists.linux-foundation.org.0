Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F6412900E
	for <lists.virtualization@lfdr.de>; Sun, 22 Dec 2019 22:45:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0E569860F1;
	Sun, 22 Dec 2019 21:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZvvMDLe-BoN; Sun, 22 Dec 2019 21:45:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2119F860A3;
	Sun, 22 Dec 2019 21:45:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F01EFC1D88;
	Sun, 22 Dec 2019 21:45:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14F0CC0881
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 21:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F18B6860A3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 21:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bS4XIFpZeITh
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 21:45:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BFDBC860A2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 21:45:12 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id x138so6425688ywd.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 13:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pDTERE46Ukh/qp7y0ED6mwyJ9I6XhbhmdLdtOkOE1GE=;
 b=dgeNYfZEYSI379GGcFviK2n2x5pbdbIv3DXP37yy47dzQ4t3mmeyksw7Wz8m5akQO1
 xRTur96mrV8out8qodni/pV+2brQUO6fLKUyp/JmNNpGgbPqrJ6MVDjqxuyunwh/q5Vg
 zNAYMpmsPwIR8nEOsCAG3JONQ62QEaRtZqa2v4rkxZRBCR8BYHHVy4AJxE7ZZzT/0r50
 k9uklsX77QvXYsOWE/n5yHsuai49G2WmIAuLIHrCSlHZkY3+94aujsmCFQPVO2K9nZnj
 SDTQs/lTaRi/gveRoBbs+GDNvh/ycA7SbjxxiZy3hs72s9B7BPsK6BZxuHbsBZsr8SMn
 Cqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pDTERE46Ukh/qp7y0ED6mwyJ9I6XhbhmdLdtOkOE1GE=;
 b=e1Ihu65TNS63dQfWfekZt0/NBweNzQUyDbO3WXe9kTXzd93qAwkQ+7Z6a1yP/de1ls
 H0RGl69abrZwwTXpcXnREXUEf4mKjbMYBq/czvedawxguhfGjz85OvJjVQvJbQkvZlAJ
 wxpjaVBWlYXMsLcMHyWXNX6wqSBqhyZ5xFokOBp7KWPKg3XQTxiSZlzU8BDR73Fj8A9V
 zYo+zPak0CEW5nzxAsy6m/Gu/OHxKa8X83kLgRmPZTfdFNgkgrXOTW+YUCWlODHBZizv
 Xh/rdNHCKvkuYhIHILoA/m5VijhXL0mUtXoyS2Kf7xdOePGHTxx52vYA9rqaRpR71Lzx
 RQaw==
X-Gm-Message-State: APjAAAW/v/qZtMYPa2Gz3lvEN6l17BtlkefUaTveD+vbSS18VDQ46soZ
 R3z/2UyrEQ+Jcfham30AlQx2ziTa
X-Google-Smtp-Source: APXvYqxxRJoyWDyBY4bVjAkScwY8gsfewoixpacOVWlxzn6zDFbVulfqy0I4NtmYDFyIcRpmAqKi2w==
X-Received: by 2002:a81:488b:: with SMTP id
 v133mr18258910ywa.362.1577051110636; 
 Sun, 22 Dec 2019 13:45:10 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id q189sm6954144ywb.15.2019.12.22.13.45.09
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Dec 2019 13:45:09 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id f136so3259674ybg.11
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 13:45:09 -0800 (PST)
X-Received: by 2002:a25:d117:: with SMTP id i23mr13318404ybg.139.1577051108521; 
 Sun, 22 Dec 2019 13:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20191220212207.76726-1-adelva@google.com>
 <CA+FuTSewMaRTe51jOJtD-VHcp4Ct+c=11-9SxenULHwQuokamw@mail.gmail.com>
 <20191222080754-mutt-send-email-mst@kernel.org>
 <CA+FuTSd4vd9wS0sHmAk=Ys2-OwZarAHT3TNFzg7c7+2Dsott=g@mail.gmail.com>
 <20191222095141-mutt-send-email-mst@kernel.org>
 <CA+FuTScTcMqU4dKXNKCbjYJ8A-eVGp5eDNihAkq106YKTvTqDw@mail.gmail.com>
 <20191222160850-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191222160850-mutt-send-email-mst@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Sun, 22 Dec 2019 16:44:31 -0500
X-Gmail-Original-Message-ID: <CA+FuTSerJ1Xhsmo2bFvTDohzmLsY5foOartO8ZjZEaK1vTTOcw@mail.gmail.com>
Message-ID: <CA+FuTSerJ1Xhsmo2bFvTDohzmLsY5foOartO8ZjZEaK1vTTOcw@mail.gmail.com>
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

On Sun, Dec 22, 2019 at 4:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Dec 22, 2019 at 10:54:23AM -0500, Willem de Bruijn wrote:
> > On Sun, Dec 22, 2019 at 9:57 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Sun, Dec 22, 2019 at 09:21:43AM -0500, Willem de Bruijn wrote:
> > > > On Sun, Dec 22, 2019 at 8:11 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Fri, Dec 20, 2019 at 10:08:41PM -0500, Willem de Bruijn wrote:
> > > > > > On Fri, Dec 20, 2019 at 4:22 PM Alistair Delva <adelva@google.com> wrote:
> > > > > > >
> > > > > > > On devices without control virtqueue support, such as the virtio_net
> > > > > > > implementation in crosvm[1], attempting to configure LRO will panic the
> > > > > > > kernel:
> > > > > > >
> > > > > > > kernel BUG at drivers/net/virtio_net.c:1591!
> > > > > > > invalid opcode: 0000 [#1] PREEMPT SMP PTI
> > > > > > > CPU: 1 PID: 483 Comm: Binder:330_1 Not tainted 5.4.5-01326-g19463e9acaac #1
> > > > > > > Hardware name: ChromiumOS crosvm, BIOS 0
> > > > > > > RIP: 0010:virtnet_send_command+0x15d/0x170 [virtio_net]
> > > > > > > Code: d8 00 00 00 80 78 02 00 0f 94 c0 65 48 8b 0c 25 28 00 00 00 48 3b 4c 24 70 75 11 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b e8 ec a4 12 c8 66 90 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
> > > > > > > RSP: 0018:ffffb97940e7bb50 EFLAGS: 00010246
> > > > > > > RAX: ffffffffc0596020 RBX: ffffa0e1fc8ea840 RCX: 0000000000000017
> > > > > > > RDX: ffffffffc0596110 RSI: 0000000000000011 RDI: 000000000000000d
> > > > > > > RBP: ffffb97940e7bbf8 R08: ffffa0e1fc8ea0b0 R09: ffffa0e1fc8ea0b0
> > > > > > > R10: ffffffffffffffff R11: ffffffffc0590940 R12: 0000000000000005
> > > > > > > R13: ffffa0e1ffad2c00 R14: ffffb97940e7bc08 R15: 0000000000000000
> > > > > > > FS:  0000000000000000(0000) GS:ffffa0e1fd100000(006b) knlGS:00000000e5ef7494
> > > > > > > CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > > > > > > CR2: 00000000e5eeb82c CR3: 0000000079b06001 CR4: 0000000000360ee0
> > > > > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > > > > > Call Trace:
> > > > > > >  ? preempt_count_add+0x58/0xb0
> > > > > > >  ? _raw_spin_lock_irqsave+0x36/0x70
> > > > > > >  ? _raw_spin_unlock_irqrestore+0x1a/0x40
> > > > > > >  ? __wake_up+0x70/0x190
> > > > > > >  virtnet_set_features+0x90/0xf0 [virtio_net]
> > > > > > >  __netdev_update_features+0x271/0x980
> > > > > > >  ? nlmsg_notify+0x5b/0xa0
> > > > > > >  dev_disable_lro+0x2b/0x190
> > > > > > >  ? inet_netconf_notify_devconf+0xe2/0x120
> > > > > > >  devinet_sysctl_forward+0x176/0x1e0
> > > > > > >  proc_sys_call_handler+0x1f0/0x250
> > > > > > >  proc_sys_write+0xf/0x20
> > > > > > >  __vfs_write+0x3e/0x190
> > > > > > >  ? __sb_start_write+0x6d/0xd0
> > > > > > >  vfs_write+0xd3/0x190
> > > > > > >  ksys_write+0x68/0xd0
> > > > > > >  __ia32_sys_write+0x14/0x20
> > > > > > >  do_fast_syscall_32+0x86/0xe0
> > > > > > >  entry_SYSENTER_compat+0x7c/0x8e
> > > > > > >
> > > > > > > This happens because virtio_set_features() does not check the presence
> > > > > > > of the control virtqueue feature, which is sanity checked by a BUG_ON
> > > > > > > in virtnet_send_command().
> > > > > > >
> > > > > > > Fix this by skipping any feature processing if the control virtqueue is
> > > > > > > missing. This should be OK for any future feature that is added, as
> > > > > > > presumably all of them would require control virtqueue support to notify
> > > > > > > the endpoint that offload etc. should begin.
> > > > > > >
> > > > > > > [1] https://chromium.googlesource.com/chromiumos/platform/crosvm/
> > > > > > >
> > > > > > > Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> > > > > > > Cc: stable@vger.kernel.org [4.20+]
> > > > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > > > > Cc: David S. Miller <davem@davemloft.net>
> > > > > > > Cc: kernel-team@android.com
> > > > > > > Cc: virtualization@lists.linux-foundation.org
> > > > > > > Cc: linux-kernel@vger.kernel.org
> > > > > > > Signed-off-by: Alistair Delva <adelva@google.com>
> > > > > >
> > > > > > Thanks for debugging this, Alistair.
> > > > > >
> > > > > > > ---
> > > > > > >  drivers/net/virtio_net.c | 3 +++
> > > > > > >  1 file changed, 3 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > > > > index 4d7d5434cc5d..709bcd34e485 100644
> > > > > > > --- a/drivers/net/virtio_net.c
> > > > > > > +++ b/drivers/net/virtio_net.c
> > > > > > > @@ -2560,6 +2560,9 @@ static int virtnet_set_features(struct net_device *dev,
> > > > > > >         u64 offloads;
> > > > > > >         int err;
> > > > > > >
> > > > > > > +       if (!vi->has_cvq)
> > > > > > > +               return 0;
> > > > > > > +
> > > > > >
> > > > > > Instead of checking for this in virtnet_set_features, how about we
> > > > > > make configurability contingent on cvq in virtnet_probe:
> > > > > >
> > > > > > -       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> > > > > > +       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) &&
> > > > > > +           virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> > > > > >                 dev->hw_features |= NETIF_F_LRO;
> > > > > >
> > > > > > Based on this logic a little below in the same function
> > > > > >
> > > > > >         if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> > > > > >                 vi->has_cvq = true;
> > > > >
> > > > >
> > > > > This would be a regression on old hypervisors which didn't have
> > > > > CTL VQ - suddenly they will lose offloads.
> > > >
> > > > dev->features still correctly displays whether offloads are enabled.
> > > > Removing it from dev->hw_features just renders it non-configurable.
> > >
> > > Oh you are right. I confused it with dev->features.
> > >
> > > > Note that before the patch that is being fixed the offloads were
> > > > enabled, but ethtool would show them as off.
> > >
> > > So the bug is in spec, it should have said
> > > VIRTIO_NET_F_CTRL_GUEST_OFFLOADS depends on VIRTIO_NET_F_CTRL_VQ, but we
> > > missed that part. We can and I guess should add this as a recommendation
> > > but it's too late to make it a MUST.
> > >
> > > Meanwhile I would say it's cleanest to work around
> > > this in virtnet_validate by clearing VIRTIO_NET_F_CTRL_GUEST_OFFLOADS
> > > if VIRTIO_NET_F_CTRL_VQ is off, with a big comment explaining
> > > it's a spec bug.
> >
> > Wouldn't that cause precisely the regression you were concerned about?
>
> Not sure how do you mean.  VIRTIO_NET_F_CTRL_GUEST_OFFLOADS simply can't
> work without a ctrl vq. What's the point of keeping it on?

Ah, now I was mistaken. I thought that

    dev->features |= NETIF_F_LRO

was also contingent on VIRTIO_NET_F_CTRL_GUEST_OFFLOADS. But that's
another (pair of) flag(s), of course

        if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
            virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
                dev->features |= NETIF_F_LRO;

I wonder if this bug is then also triggered when enabling XDP, through
virtnet_clear_guest_offloads. That predates LRO, so would deserve
another Fixes tag.

> > Workloads may now depend on LRO for cycle efficiency. Reverting to
> > behavior before this patch (though now displaying the offload state
> > correctly) is more conservative in that regard.
>
> Do you see a problem with the following (untested):
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 4d7d5434cc5d..7b8805b47f0d 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2971,6 +2971,15 @@ static int virtnet_validate(struct virtio_device *vdev)
>         if (!virtnet_validate_features(vdev))
>                 return -EINVAL;
>
> +       /* VIRTIO_NET_F_CTRL_GUEST_OFFLOADS does not work without
> +        * VIRTIO_NET_F_CTRL_VQ. Unfortunately spec forgot to
> +        * specify that VIRTIO_NET_F_CTRL_GUEST_OFFLOADS depends
> +        * on VIRTIO_NET_F_CTRL_VQ so devices can set the later but
> +        * not the former.
> +        */
> +       if (!virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> +                       __virtio_clear_bit(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS);
> +
>         if (virtio_has_feature(vdev, VIRTIO_NET_F_MTU)) {
>                 int mtu = virtio_cread16(vdev,
>                                          offsetof(struct virtio_net_config,
>

Looks good to me!
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
