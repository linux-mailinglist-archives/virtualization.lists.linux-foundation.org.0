Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68F128E02
	for <lists.virtualization@lfdr.de>; Sun, 22 Dec 2019 14:11:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2636E204CC;
	Sun, 22 Dec 2019 13:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5w8tdvd3kzfE; Sun, 22 Dec 2019 13:11:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EFCD4204BE;
	Sun, 22 Dec 2019 13:11:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4B63C1D88;
	Sun, 22 Dec 2019 13:11:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F25C8C0881
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 13:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E047E87E7B
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 13:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrI5WTQiH0EZ
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 13:11:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F008F87E25
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 13:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577020285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7gCpuLlUP9MlgLBoutsCmLPmUqjnC7xAMqI1v5Bo+1w=;
 b=FPsdNs3uakJO6c+R+ngcd+hFT6bH5ScecW38qtzs61pUd0Tw7yd6kfjjymHMoPgSx5I5KY
 8lvLQAccngEkDgCzTy0JjA+WrdKY3VSooq4dFHGmdRb3iePxe6/vE5q81O3sYkalXG/4ol
 wpQWEkLO5Zvj+BnxuJEJdKyLXpEI9m0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-0A3x84QUPoqX0a_HM2N-vw-1; Sun, 22 Dec 2019 08:11:23 -0500
Received: by mail-qt1-f200.google.com with SMTP id 38so1968422qty.15
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 05:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gCpuLlUP9MlgLBoutsCmLPmUqjnC7xAMqI1v5Bo+1w=;
 b=q/dJwGOx4x8wduFePF1s/maeJDSEFdlcNq8c0YdJJ45VAWr+UOWFYWlSddGoSJ/jAf
 lKSXnHPvm17/HexU38Y0V+OEmkL1opT1SF/O8akXh7TFaK5LJjKgC5DdmFqErPurHWwU
 T8j2aE3yXbT+vp7ZgL1k9cBzCkNS7vg4XudsLJljdf2Gisg3u2IIkRVyi6lhod8B2u4Z
 mR2fad8DUgqaDArVq/7+4g7R79p7N0chrBog1gkSkLK5W1kbt8zbOmDu9ahVVAR6KaN/
 lAOGqEyaQ01VyeIBeKTYmpTwtw3Weio/GFP8RErecJyuft+y3RCl+a/pR+0CIl5VZ31s
 7jOA==
X-Gm-Message-State: APjAAAX+xSMwRAIlzcn0n/P4cds6oyvCcq9Uajr/iAHIMdd7/Ku/r8nJ
 ExpxnaEz8+aldbJx/yiCkxClM7CBocjs1pQ0QBhaUeXbc34qzJZB5uVSONnoEJUVYlV7wUL56Ir
 NK3XVOSRMLQxDZGOD9mb+vhoRuc97l1du4M9Pmdniyg==
X-Received: by 2002:a05:6214:10c1:: with SMTP id
 r1mr20617242qvs.70.1577020282491; 
 Sun, 22 Dec 2019 05:11:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCAU9CXtW80vVj3OFrSpP2mW5I9KhywcWXV5k/a4ppQvGMJznMPni9g9ftzf6gofObYt4oXA==
X-Received: by 2002:a05:6214:10c1:: with SMTP id
 r1mr20617225qvs.70.1577020282261; 
 Sun, 22 Dec 2019 05:11:22 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id t38sm5308551qta.78.2019.12.22.05.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 05:11:21 -0800 (PST)
Date: Sun, 22 Dec 2019 08:11:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net] virtio-net: Skip set_features on non-cvq devices
Message-ID: <20191222080754-mutt-send-email-mst@kernel.org>
References: <20191220212207.76726-1-adelva@google.com>
 <CA+FuTSewMaRTe51jOJtD-VHcp4Ct+c=11-9SxenULHwQuokamw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+FuTSewMaRTe51jOJtD-VHcp4Ct+c=11-9SxenULHwQuokamw@mail.gmail.com>
X-MC-Unique: 0A3x84QUPoqX0a_HM2N-vw-1
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

On Fri, Dec 20, 2019 at 10:08:41PM -0500, Willem de Bruijn wrote:
> On Fri, Dec 20, 2019 at 4:22 PM Alistair Delva <adelva@google.com> wrote:
> >
> > On devices without control virtqueue support, such as the virtio_net
> > implementation in crosvm[1], attempting to configure LRO will panic the
> > kernel:
> >
> > kernel BUG at drivers/net/virtio_net.c:1591!
> > invalid opcode: 0000 [#1] PREEMPT SMP PTI
> > CPU: 1 PID: 483 Comm: Binder:330_1 Not tainted 5.4.5-01326-g19463e9acaac #1
> > Hardware name: ChromiumOS crosvm, BIOS 0
> > RIP: 0010:virtnet_send_command+0x15d/0x170 [virtio_net]
> > Code: d8 00 00 00 80 78 02 00 0f 94 c0 65 48 8b 0c 25 28 00 00 00 48 3b 4c 24 70 75 11 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b e8 ec a4 12 c8 66 90 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
> > RSP: 0018:ffffb97940e7bb50 EFLAGS: 00010246
> > RAX: ffffffffc0596020 RBX: ffffa0e1fc8ea840 RCX: 0000000000000017
> > RDX: ffffffffc0596110 RSI: 0000000000000011 RDI: 000000000000000d
> > RBP: ffffb97940e7bbf8 R08: ffffa0e1fc8ea0b0 R09: ffffa0e1fc8ea0b0
> > R10: ffffffffffffffff R11: ffffffffc0590940 R12: 0000000000000005
> > R13: ffffa0e1ffad2c00 R14: ffffb97940e7bc08 R15: 0000000000000000
> > FS:  0000000000000000(0000) GS:ffffa0e1fd100000(006b) knlGS:00000000e5ef7494
> > CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > CR2: 00000000e5eeb82c CR3: 0000000079b06001 CR4: 0000000000360ee0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  ? preempt_count_add+0x58/0xb0
> >  ? _raw_spin_lock_irqsave+0x36/0x70
> >  ? _raw_spin_unlock_irqrestore+0x1a/0x40
> >  ? __wake_up+0x70/0x190
> >  virtnet_set_features+0x90/0xf0 [virtio_net]
> >  __netdev_update_features+0x271/0x980
> >  ? nlmsg_notify+0x5b/0xa0
> >  dev_disable_lro+0x2b/0x190
> >  ? inet_netconf_notify_devconf+0xe2/0x120
> >  devinet_sysctl_forward+0x176/0x1e0
> >  proc_sys_call_handler+0x1f0/0x250
> >  proc_sys_write+0xf/0x20
> >  __vfs_write+0x3e/0x190
> >  ? __sb_start_write+0x6d/0xd0
> >  vfs_write+0xd3/0x190
> >  ksys_write+0x68/0xd0
> >  __ia32_sys_write+0x14/0x20
> >  do_fast_syscall_32+0x86/0xe0
> >  entry_SYSENTER_compat+0x7c/0x8e
> >
> > This happens because virtio_set_features() does not check the presence
> > of the control virtqueue feature, which is sanity checked by a BUG_ON
> > in virtnet_send_command().
> >
> > Fix this by skipping any feature processing if the control virtqueue is
> > missing. This should be OK for any future feature that is added, as
> > presumably all of them would require control virtqueue support to notify
> > the endpoint that offload etc. should begin.
> >
> > [1] https://chromium.googlesource.com/chromiumos/platform/crosvm/
> >
> > Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> > Cc: stable@vger.kernel.org [4.20+]
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: David S. Miller <davem@davemloft.net>
> > Cc: kernel-team@android.com
> > Cc: virtualization@lists.linux-foundation.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Alistair Delva <adelva@google.com>
> 
> Thanks for debugging this, Alistair.
> 
> > ---
> >  drivers/net/virtio_net.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 4d7d5434cc5d..709bcd34e485 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -2560,6 +2560,9 @@ static int virtnet_set_features(struct net_device *dev,
> >         u64 offloads;
> >         int err;
> >
> > +       if (!vi->has_cvq)
> > +               return 0;
> > +
> 
> Instead of checking for this in virtnet_set_features, how about we
> make configurability contingent on cvq in virtnet_probe:
> 
> -       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> +       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) &&
> +           virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
>                 dev->hw_features |= NETIF_F_LRO;
> 
> Based on this logic a little below in the same function
> 
>         if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
>                 vi->has_cvq = true;


This would be a regression on old hypervisors which didn't have
CTL VQ - suddenly they will lose offloads.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
