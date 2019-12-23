Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B8129ABB
	for <lists.virtualization@lfdr.de>; Mon, 23 Dec 2019 21:13:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9217C85735;
	Mon, 23 Dec 2019 20:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDK4r-jn27YI; Mon, 23 Dec 2019 20:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60D2584AAD;
	Mon, 23 Dec 2019 20:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EF10C0881;
	Mon, 23 Dec 2019 20:13:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 560A1C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 20:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 406F384E5D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 20:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsW6gWe_GtUU
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 20:12:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7D17A848A0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 20:12:59 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id f136so4342954ybg.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 12:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hq48wF9NhqAaFGpnbg5sjL9dGZLXnI5W9HK7qIe6Fno=;
 b=d2HxwQKDPzhGn2LHQszYi+myVQHBF/f7O1+oD/srE9zlKJbYChBdWFSWGz/jrChDv/
 /ju7o45CYz4mT397h8IRzn9nJ3bxyyEBaIaAHUOt0Zvf3EcC9ciTHndroYj+T/wGI2dO
 VvQsgjZro8k0VH/LfN5OiItrifUfdG83gsT05J9Lt/R3N1BhcFX9iQ8IHw18PuabckMV
 W/C+yY63gY2Vzv9nEuMRhhyWAfl2ARn2Uip36Pklgyrf+D+NiQ1jCmRENV/7HNd6c+oz
 /kAvoQAhoItS9PQOCU/nDgozgycTvrPE0CJGfY8FXWx6X3d/znr0618xY2KQqRJqWZou
 5p7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hq48wF9NhqAaFGpnbg5sjL9dGZLXnI5W9HK7qIe6Fno=;
 b=Hre3N2lsTkQBAH9r620Sk8tNefy4tu6aNxWpf7QMVHPR+6Z75garwnT7WDbjPeOFJI
 2yxrY1Ys+gtFPmPjCEmlsDbdlz6i8IcMQHmWJ71aWoQpPESN37rq2p5UCi2DlzDO3YzK
 yrENjf5OIFc/WTiUd7lu2RkczppeTqVlZbgs4XhvyMTAgTUbHNtd042f1EtcKUbNr6AQ
 j01GBP2Wz7wCauvCbYT5a+L9UXocTX58donE7p+wv4yxqDxl9lEj0X3PWCETLNtDswrp
 acL75ZNPMye6Pc1YLEw+djCTPLXn3JldkMId1aiIxbCXINw3OeBV8RuX8xFgL/OUOwM3
 HJcQ==
X-Gm-Message-State: APjAAAUTaccuD8BjIFggAUNq3Caz9Oy4ay+0FjtTtw72V7CQmEUPgUaA
 I997YToNxMbPvgd4OtvVzSHL7AdF
X-Google-Smtp-Source: APXvYqz8mEymUSoWI8quyMsEneg0qHlBOfTmwClW2gjgZAbthThGhD2NG80pZ/r/d/+Ns9NBfXG6+Q==
X-Received: by 2002:a25:2397:: with SMTP id j145mr22658893ybj.37.1577131978112; 
 Mon, 23 Dec 2019 12:12:58 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id r66sm8742463ywr.50.2019.12.23.12.12.57
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2019 12:12:57 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id a2so7474445ybr.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 12:12:57 -0800 (PST)
X-Received: by 2002:a5b:c43:: with SMTP id d3mr22795971ybr.203.1577131976738; 
 Mon, 23 Dec 2019 12:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20191223140322.20013-1-mst@redhat.com>
 <CANDihLHPk5khpv-f-M+qhkzgTkygAts38GGb-HChg-VL2bo+Uw@mail.gmail.com>
 <CA+FuTSfq5v3-0VYmTG7YFFUqT8uG53eXXhqc8WvVvMbp3s0nvA@mail.gmail.com>
In-Reply-To: <CA+FuTSfq5v3-0VYmTG7YFFUqT8uG53eXXhqc8WvVvMbp3s0nvA@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 23 Dec 2019 15:12:20 -0500
X-Gmail-Original-Message-ID: <CA+FuTScwwajN2ny2w8EBkBQd191Eb1ZsrRhbh3=5eQervArnEA@mail.gmail.com>
Message-ID: <CA+FuTScwwajN2ny2w8EBkBQd191Eb1ZsrRhbh3=5eQervArnEA@mail.gmail.com>
Subject: Re: [PATCH net] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Alistair Delva <adelva@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
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

On Mon, Dec 23, 2019 at 2:56 PM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> 00fffe0ff0 DR7: 0000000000000400
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
> > > A similar crash will likely trigger when enabling XDP.
> > >
> > > Reported-by: Alistair Delva <adelva@google.com>
> > > Reported-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> > > Fixes: 3f93522ffab2 ("virtio-net: switch off offloads on demand if possible on XDP set")
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >
> > > Lightly tested.
> > >
> > > Alistair, could you please test and confirm that this resolves the
> > > crash for you?
> >
> > This patch doesn't work. The reason is that NETIF_F_LRO is also turned
> > on by TSO4/TSO6, which your patch didn't check for. So it ends up
> > going through the same path and crashing in the same way.
> >
> >         if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
> >             virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
> >                 dev->features |= NETIF_F_LRO;
> >
> > It sounds like this patch is fixing something slightly differently to
> > my patch fixed. virtnet_set_features() doesn't care about
> > GUEST_OFFLOADS, it only tests against NETIF_F_LRO. Even if "offloads"
> > is zero, it will call virtnet_set_guest_offloads(), which triggers the
> > crash.
>
>
> Interesting. It's surprising that it is trying to configure a flag
> that is not configurable, i.e., absent from dev->hw_features
> after Michael's change.
>
> > So either we need to ensure NETIF_F_LRO is never set, or
>
> LRO might be available, just not configurable. Indeed this was what I
> observed in the past.

dev_disable_lro expects that NETIF_F_LRO is always configurable. Which
I guess is a reasonable assumption, just not necessarily the case in
virtio_net.

So I think we need both patches. Correctly mark the feature as fixed
by removing from dev->hw_features and also ignore the request from
dev_disable_lro, which does not check for this.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
