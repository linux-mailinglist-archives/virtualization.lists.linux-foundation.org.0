Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 51464128E95
	for <lists.virtualization@lfdr.de>; Sun, 22 Dec 2019 15:57:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCBCA862E1;
	Sun, 22 Dec 2019 14:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HTzrRZXo9vIw; Sun, 22 Dec 2019 14:57:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57A28860A2;
	Sun, 22 Dec 2019 14:57:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B181C0881;
	Sun, 22 Dec 2019 14:57:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 095AAC0881
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 14:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 00BA285AB3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 14:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuyXmx2wzl+L
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 14:57:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8FEEF85A5B
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577026671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e63r31MTLSpTW749sLIQEcCg9+hahBZpdCxIHQv87Ww=;
 b=N9sjJQMj0UVIlouAK+NeseSv/Wewb4TmvX109JBpO7J0P0Vywp0H5DPfkB0Ku85sftHo6x
 bJhqMWEoqdO5y9xOuO5+JR+rKgs4RbrxteW6Gpi8IK3JO1Ll26xmiK1Jzb4ucrx/A4Vm9i
 6P8FLJYrYLdzKwoBCc5HA4YsqSVidHo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-_0SagKp-NuKVPecYmx87ng-1; Sun, 22 Dec 2019 09:57:48 -0500
Received: by mail-qk1-f198.google.com with SMTP id f22so6526219qka.10
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 06:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e63r31MTLSpTW749sLIQEcCg9+hahBZpdCxIHQv87Ww=;
 b=Oi10deAjF3jrTYr/PFSX9XWVcq3acHpZ5PSLAJ4pcNXP5+3hQkMlUmZ3mIS3Hh7MPM
 OPnh3uWve0b6XACd0Ba/dmD+uXoRcMQn4hCJdEeMGJpHG751ObsGgb42jpF9LQghj/nH
 Mil16x/meLHobpBeW+lAxhU08EqrHeCF8HBqhs5nJnZV8oFPBru5KUXWmVGaEMmSoB4V
 mTOo6mBfsdOMzyML2cZGJ10ZKD4NUxUcHWlGnsaoMcH0r4vvnP+J/jEEJ5f/45oaIC4K
 Gio4Yei/dogZoNM7jrFiXjNyBBqZBczAX/zOJESpwVtQLrGSgJ0ytZEKr2HsAc418g3b
 rkCA==
X-Gm-Message-State: APjAAAUbak28HaZgBfeedAw/KAg3bHXR6OP40wv4EWSYhrDzdKI3iiuR
 CV+q3lJm5LTDXasAzaoEQtOcf1eG9h6tXE0NFJuHpnPFMtthtFkJEbPJGycObiuQ8HmyPlU0IOB
 qkviPTxyOkwK/6CMumgL2PAguRpTfd1LalwC/SfR3OA==
X-Received: by 2002:a37:bf82:: with SMTP id
 p124mr22638144qkf.337.1577026667437; 
 Sun, 22 Dec 2019 06:57:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyM0Abz6Ox5MaLbLTFwyJa02psvOO2jAr8dQ4L6rx0NnmJEwwdcKL3D1+P/GkUyRJpTUWsicQ==
X-Received: by 2002:a37:bf82:: with SMTP id
 p124mr22638124qkf.337.1577026667107; 
 Sun, 22 Dec 2019 06:57:47 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id k22sm4907268qkg.80.2019.12.22.06.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 06:57:46 -0800 (PST)
Date: Sun, 22 Dec 2019 09:57:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net] virtio-net: Skip set_features on non-cvq devices
Message-ID: <20191222095141-mutt-send-email-mst@kernel.org>
References: <20191220212207.76726-1-adelva@google.com>
 <CA+FuTSewMaRTe51jOJtD-VHcp4Ct+c=11-9SxenULHwQuokamw@mail.gmail.com>
 <20191222080754-mutt-send-email-mst@kernel.org>
 <CA+FuTSd4vd9wS0sHmAk=Ys2-OwZarAHT3TNFzg7c7+2Dsott=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+FuTSd4vd9wS0sHmAk=Ys2-OwZarAHT3TNFzg7c7+2Dsott=g@mail.gmail.com>
X-MC-Unique: _0SagKp-NuKVPecYmx87ng-1
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

On Sun, Dec 22, 2019 at 09:21:43AM -0500, Willem de Bruijn wrote:
> On Sun, Dec 22, 2019 at 8:11 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Dec 20, 2019 at 10:08:41PM -0500, Willem de Bruijn wrote:
> > > On Fri, Dec 20, 2019 at 4:22 PM Alistair Delva <adelva@google.com> wrote:
> > > >
> > > > On devices without control virtqueue support, such as the virtio_net
> > > > implementation in crosvm[1], attempting to configure LRO will panic the
> > > > kernel:
> > > >
> > > > kernel BUG at drivers/net/virtio_net.c:1591!
> > > > invalid opcode: 0000 [#1] PREEMPT SMP PTI
> > > > CPU: 1 PID: 483 Comm: Binder:330_1 Not tainted 5.4.5-01326-g19463e9acaac #1
> > > > Hardware name: ChromiumOS crosvm, BIOS 0
> > > > RIP: 0010:virtnet_send_command+0x15d/0x170 [virtio_net]
> > > > Code: d8 00 00 00 80 78 02 00 0f 94 c0 65 48 8b 0c 25 28 00 00 00 48 3b 4c 24 70 75 11 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b e8 ec a4 12 c8 66 90 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
> > > > RSP: 0018:ffffb97940e7bb50 EFLAGS: 00010246
> > > > RAX: ffffffffc0596020 RBX: ffffa0e1fc8ea840 RCX: 0000000000000017
> > > > RDX: ffffffffc0596110 RSI: 0000000000000011 RDI: 000000000000000d
> > > > RBP: ffffb97940e7bbf8 R08: ffffa0e1fc8ea0b0 R09: ffffa0e1fc8ea0b0
> > > > R10: ffffffffffffffff R11: ffffffffc0590940 R12: 0000000000000005
> > > > R13: ffffa0e1ffad2c00 R14: ffffb97940e7bc08 R15: 0000000000000000
> > > > FS:  0000000000000000(0000) GS:ffffa0e1fd100000(006b) knlGS:00000000e5ef7494
> > > > CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > > > CR2: 00000000e5eeb82c CR3: 0000000079b06001 CR4: 0000000000360ee0
> > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > > Call Trace:
> > > >  ? preempt_count_add+0x58/0xb0
> > > >  ? _raw_spin_lock_irqsave+0x36/0x70
> > > >  ? _raw_spin_unlock_irqrestore+0x1a/0x40
> > > >  ? __wake_up+0x70/0x190
> > > >  virtnet_set_features+0x90/0xf0 [virtio_net]
> > > >  __netdev_update_features+0x271/0x980
> > > >  ? nlmsg_notify+0x5b/0xa0
> > > >  dev_disable_lro+0x2b/0x190
> > > >  ? inet_netconf_notify_devconf+0xe2/0x120
> > > >  devinet_sysctl_forward+0x176/0x1e0
> > > >  proc_sys_call_handler+0x1f0/0x250
> > > >  proc_sys_write+0xf/0x20
> > > >  __vfs_write+0x3e/0x190
> > > >  ? __sb_start_write+0x6d/0xd0
> > > >  vfs_write+0xd3/0x190
> > > >  ksys_write+0x68/0xd0
> > > >  __ia32_sys_write+0x14/0x20
> > > >  do_fast_syscall_32+0x86/0xe0
> > > >  entry_SYSENTER_compat+0x7c/0x8e
> > > >
> > > > This happens because virtio_set_features() does not check the presence
> > > > of the control virtqueue feature, which is sanity checked by a BUG_ON
> > > > in virtnet_send_command().
> > > >
> > > > Fix this by skipping any feature processing if the control virtqueue is
> > > > missing. This should be OK for any future feature that is added, as
> > > > presumably all of them would require control virtqueue support to notify
> > > > the endpoint that offload etc. should begin.
> > > >
> > > > [1] https://chromium.googlesource.com/chromiumos/platform/crosvm/
> > > >
> > > > Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> > > > Cc: stable@vger.kernel.org [4.20+]
> > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > Cc: David S. Miller <davem@davemloft.net>
> > > > Cc: kernel-team@android.com
> > > > Cc: virtualization@lists.linux-foundation.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Signed-off-by: Alistair Delva <adelva@google.com>
> > >
> > > Thanks for debugging this, Alistair.
> > >
> > > > ---
> > > >  drivers/net/virtio_net.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > index 4d7d5434cc5d..709bcd34e485 100644
> > > > --- a/drivers/net/virtio_net.c
> > > > +++ b/drivers/net/virtio_net.c
> > > > @@ -2560,6 +2560,9 @@ static int virtnet_set_features(struct net_device *dev,
> > > >         u64 offloads;
> > > >         int err;
> > > >
> > > > +       if (!vi->has_cvq)
> > > > +               return 0;
> > > > +
> > >
> > > Instead of checking for this in virtnet_set_features, how about we
> > > make configurability contingent on cvq in virtnet_probe:
> > >
> > > -       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
> > > +       if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) &&
> > > +           virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> > >                 dev->hw_features |= NETIF_F_LRO;
> > >
> > > Based on this logic a little below in the same function
> > >
> > >         if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> > >                 vi->has_cvq = true;
> >
> >
> > This would be a regression on old hypervisors which didn't have
> > CTL VQ - suddenly they will lose offloads.
> 
> dev->features still correctly displays whether offloads are enabled.
> Removing it from dev->hw_features just renders it non-configurable.

Oh you are right. I confused it with dev->features.

> Note that before the patch that is being fixed the offloads were
> enabled, but ethtool would show them as off.

So the bug is in spec, it should have said
VIRTIO_NET_F_CTRL_GUEST_OFFLOADS depends on VIRTIO_NET_F_CTRL_VQ, but we
missed that part. We can and I guess should add this as a recommendation
but it's too late to make it a MUST.

Meanwhile I would say it's cleanest to work around
this in virtnet_validate by clearing VIRTIO_NET_F_CTRL_GUEST_OFFLOADS
if VIRTIO_NET_F_CTRL_VQ is off, with a big comment explaining
it's a spec bug.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
