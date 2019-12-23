Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC84129A8C
	for <lists.virtualization@lfdr.de>; Mon, 23 Dec 2019 20:44:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D421185EF5;
	Mon, 23 Dec 2019 19:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZj6S8kLjjr6; Mon, 23 Dec 2019 19:44:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17B1585DF5;
	Mon, 23 Dec 2019 19:44:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E70FEC0881;
	Mon, 23 Dec 2019 19:44:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1CB3C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 19:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E6D0587766
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 19:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ys1maP8Svsz8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 19:44:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A5E4F86C1D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 19:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577130281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6hiZO/2nsJ7n9l1wD6X3vJp8AQVSxMX1y8tQwa38MZw=;
 b=YE0AjybWKt1rl7JWhkqvvlerMqkTQrAuCh8y1Gf1PZMrlrL/t3q3FCSgyiiFKiQpQsa+t8
 f0yiicJUgeEO5aEqYiA4/vZTxPg1MQS4ctjMgwd/YIbuOOnIAiuBpNu7zi7SGXuUYuUgbI
 Dmd1S1txsatibe5Yt7iYmYH/AtGMKMM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-CkT48V-rMmewEVtGWC6ciw-1; Mon, 23 Dec 2019 14:44:39 -0500
Received: by mail-wr1-f69.google.com with SMTP id 90so8411949wrq.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 11:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6hiZO/2nsJ7n9l1wD6X3vJp8AQVSxMX1y8tQwa38MZw=;
 b=QOCwKOZIA8f5yfpsv3Pl7iwzpImaFv7Aa8qy9NTbNaKGWTfefTK3oMp+3EfbNkXTKU
 6v2LpoELn98aZVNfC4gB+htXTwlui+F9TQxrtONJBPSg4yaottD7saMXIwqoW900mKUF
 5kNn7D4YUs2vypLfvjTFaVcGVsIey30tk/l7vWg7wTBCtqTSkccZvgvxLvzxpNqYJCPE
 g8VY+GzCzjSwqfcauGsatRRpe8S5SR2+WFhDRLY0tUkm0ul9Y3zKaM7YeWxR++Od0m2/
 vGlZHCl9PiODjl/4TZmBWlyQjATe6+IWHeYQmZUTc+DSAcfwPSK+ZSbl8jHzDY/uOwtO
 5hng==
X-Gm-Message-State: APjAAAV/Fn9FhBSGiAkvzowXqZ59KWO/8iW+BAiKFjiXznrF02VmKdkK
 vC9fhx1ohdSWQh2p1H3ujYnFtSkXo308kTSRoT0aW3Rd+uieL2F2n/7P/VGH+t2OkWB2dGEMxTy
 Il6oJDazyUj/5rKPrjj2phdxik2RnFBwbUIb5Y28v0A==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr460615wma.106.1577130278075;
 Mon, 23 Dec 2019 11:44:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqwICgsE7jbNlGF6m2Z9/h/dtbBgs+jfPke3AmEg4s2qmIl2rehBOvgGqwh2ezNiEOiHW542XQ==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr460594wma.106.1577130277777;
 Mon, 23 Dec 2019 11:44:37 -0800 (PST)
Received: from redhat.com ([37.26.146.251])
 by smtp.gmail.com with ESMTPSA id t1sm356133wma.43.2019.12.23.11.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 11:44:37 -0800 (PST)
Date: Mon, 23 Dec 2019 14:44:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alistair Delva <adelva@google.com>
Subject: Re: [PATCH net] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
Message-ID: <20191223143942-mutt-send-email-mst@kernel.org>
References: <20191223140322.20013-1-mst@redhat.com>
 <CANDihLHPk5khpv-f-M+qhkzgTkygAts38GGb-HChg-VL2bo+Uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANDihLHPk5khpv-f-M+qhkzgTkygAts38GGb-HChg-VL2bo+Uw@mail.gmail.com>
X-MC-Unique: CkT48V-rMmewEVtGWC6ciw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org,
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

On Mon, Dec 23, 2019 at 09:40:11AM -0800, Alistair Delva wrote:
> Hi Michael,
> 
> On Mon, Dec 23, 2019 at 6:09 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The only way for guest to control offloads (as enabled by
> > VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) is by sending commands
> > through CTRL_VQ. So it does not make sense to
> > acknowledge VIRTIO_NET_F_CTRL_GUEST_OFFLOADS without
> > VIRTIO_NET_F_CTRL_VQ.
> >
> > The spec does not outlaw devices with such a configuration,
> > but Linux assumed that with VIRTIO_NET_F_CTRL_GUEST_OFFLOADS
> > control vq is always there, resulting in the following crash
> > when configuring LRO:
> >
> > kernel BUG at drivers/net/virtio_net.c:1591!
> > invalid opcode: 0000 [#1] PREEMPT SMP PTI
> > CPU: 1 PID: 483 Comm: Binder:330_1 Not tainted 5.4.5-01326-g19463e9acaac #1
> > Hardware name: ChromiumOS crosvm, BIOS 0
> > RIP: 0010:virtnet_send_command+0x15d/0x170 [virtio_net]
> > Code: d8 00 00 00 80 78 02 00 0f 94 c0 65 48 8b 0c 25 28 00 00 00 48 3b 4c 24 70 75 11 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d
> > +c3 <0f> 0b e8 ec a4 12 c8 66 90 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
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
> > A similar crash will likely trigger when enabling XDP.
> >
> > Reported-by: Alistair Delva <adelva@google.com>
> > Reported-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> > Fixes: 3f93522ffab2 ("virtio-net: switch off offloads on demand if possible on XDP set")
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >
> > Lightly tested.
> >
> > Alistair, could you please test and confirm that this resolves the
> > crash for you?
> 
> This patch doesn't work. The reason is that NETIF_F_LRO is also turned
> on by TSO4/TSO6, which your patch didn't check for. So it ends up
> going through the same path and crashing in the same way.
> 
>         if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
>             virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
>                 dev->features |= NETIF_F_LRO;
> 
> It sounds like this patch is fixing something slightly differently to
> my patch fixed. virtnet_set_features() doesn't care about
> GUEST_OFFLOADS, it only tests against NETIF_F_LRO. Even if "offloads"
> is zero, it will call virtnet_set_guest_offloads(), which triggers the
> crash.

Oh wait a second. You mean when we try to clear the offloads, right?

> So either we need to ensure NETIF_F_LRO is never set, or
> virtnet_set_features needs to be updated to check for GUEST_OFFLOADS,
> right?

So we have:
static int virtnet_set_features(struct net_device *dev,
                                netdev_features_t features)
{
        struct virtnet_info *vi = netdev_priv(dev);
        u64 offloads;
        int err;

        if ((dev->features ^ features) & NETIF_F_LRO) {
                if (vi->xdp_queue_pairs)
                        return -EBUSY;

                if (features & NETIF_F_LRO)
                        offloads = vi->guest_offloads_capable;
                else
                        offloads = 0;

                err = virtnet_set_guest_offloads(vi, offloads);
                if (err)
                        return err;
                vi->guest_offloads = offloads;
        }

        return 0;
}

and

static int virtnet_set_guest_offloads(struct virtnet_info *vi, u64 offloads)
{
        struct scatterlist sg;
        vi->ctrl->offloads = cpu_to_virtio64(vi->vdev, offloads);

        sg_init_one(&sg, &vi->ctrl->offloads, sizeof(vi->ctrl->offloads));

        if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_GUEST_OFFLOADS,
                                  VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET, &sg)) {
                dev_warn(&vi->dev->dev, "Fail to set guest offload.\n");
                return -EINVAL;
        }

        return 0;
}

finally

static bool virtnet_send_command(struct virtnet_info *vi, u8 class, u8 cmd,
                                 struct scatterlist *out)
{
        struct scatterlist *sgs[4], hdr, stat;
        unsigned out_num = 0, tmp;

        /* Caller should know better */
        BUG_ON(!virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VQ));

        vi->ctrl->status = ~0;

...
}

so return false here and we should be good right?


> > Dave, after testing confirms the fix, pls queue up for stable.
> >
> >
> >  drivers/net/virtio_net.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
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
> > +        * VIRTIO_NET_F_CTRL_VQ. However the virtio spec does not
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
> > --
> > MST
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
