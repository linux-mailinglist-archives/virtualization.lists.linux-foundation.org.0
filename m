Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D9129AA0
	for <lists.virtualization@lfdr.de>; Mon, 23 Dec 2019 20:57:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32251858B5;
	Mon, 23 Dec 2019 19:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2_MvY3b851R; Mon, 23 Dec 2019 19:57:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEBCA858D3;
	Mon, 23 Dec 2019 19:57:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AEBFC0881;
	Mon, 23 Dec 2019 19:57:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11D1BC0881
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 19:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 077AC86BE2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 19:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFQm7N9LBlfS
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 19:57:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2EB2D855C7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 19:57:26 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id i190so7503806ywc.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 11:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bb0+CNEtJ6KzyS3XvioZczGP2IemYKNu32wQAAEeIB8=;
 b=Yl084XD682EiZs1AIWmB7fpotrIpfWyb7NpNE13yI5PFnb6G9qiBMQnkvnnH9x60pn
 /4pB4HLcZ4d4nXqAs1Ln570UVdpINIwDpJllGfkvgbjKOIFf+gH0LQn7m/r6QKgg3tLe
 thKS93BdFAkhh8yrejEu0K4eIkb6wW3XiiVUpx1oq1JA3fhRwHgATHTrqdUKLbW2i+F3
 e54zL1rdaOl7Mf8m3jqLcqnpx03vch9VBhKB7bYfeX4qIsoQlGK0zHIoH90Eole8B2sz
 JXC4jRWnxQhG1QO6Sup1fSYaGzVSQpLknqZSWct0a8yWswXmvV8wA/BSiVKsFBFLLgGU
 akNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bb0+CNEtJ6KzyS3XvioZczGP2IemYKNu32wQAAEeIB8=;
 b=in0j2gRkaDShauC7tQL/ZXa6+it5/trx/y/BE3TwRuds+ZxdvTzxNNPA10FRI4Hj9l
 og/pOZEdJ9BHZ162B48t7fbfHaL0EHo7IfNk8ubE7OOPjG9xdqiFmagZOmj0+y3Hok74
 yxzqe4DxfU68Wju25+KmvwTBP5l9D8h/TmDxlyVvNahrbrZ7E71ZujRCsTOihg4jPdfY
 C0ZUFuwnckBXBT5JAg2yMubXiicEnlHFDNdviOh4q3Tk4oCOgae/UG/YqHPC9Lpv1QJJ
 umiMe1Pjj0F1gyL3e1+V5JkNIrD4huLjY6iGaZ3Sy1P17PULnWEE4JIcTSfUAZgi2iIc
 /oYg==
X-Gm-Message-State: APjAAAXdVcHzCHTYFSEhVUl/K/cWVagVAP2Z51H5+Ib3bjF4tUpCBD47
 vuFqoekr94PDRPT4Etqp/vMK7840
X-Google-Smtp-Source: APXvYqw0OBjv1vsYq94TzrWSE0oh4Stfs5WFr/mkE6Y2S+8hBbfr1z2iUBYn1qJoFSM3WNSdT/lHkw==
X-Received: by 2002:a81:451b:: with SMTP id s27mr24097521ywa.232.1577131044737; 
 Mon, 23 Dec 2019 11:57:24 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id z12sm8520921ywl.27.2019.12.23.11.57.23
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2019 11:57:24 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id v24so7447643ybd.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 11:57:23 -0800 (PST)
X-Received: by 2002:a25:d117:: with SMTP id i23mr16560523ybg.139.1577131043349; 
 Mon, 23 Dec 2019 11:57:23 -0800 (PST)
MIME-Version: 1.0
References: <20191223140322.20013-1-mst@redhat.com>
 <CANDihLHPk5khpv-f-M+qhkzgTkygAts38GGb-HChg-VL2bo+Uw@mail.gmail.com>
In-Reply-To: <CANDihLHPk5khpv-f-M+qhkzgTkygAts38GGb-HChg-VL2bo+Uw@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 23 Dec 2019 14:56:47 -0500
X-Gmail-Original-Message-ID: <CA+FuTSfq5v3-0VYmTG7YFFUqT8uG53eXXhqc8WvVvMbp3s0nvA@mail.gmail.com>
Message-ID: <CA+FuTSfq5v3-0VYmTG7YFFUqT8uG53eXXhqc8WvVvMbp3s0nvA@mail.gmail.com>
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

00fffe0ff0 DR7: 0000000000000400
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


Interesting. It's surprising that it is trying to configure a flag
that is not configurable, i.e., absent from dev->hw_features
after Michael's change.

> So either we need to ensure NETIF_F_LRO is never set, or

LRO might be available, just not configurable. Indeed this was what I
observed in the past.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
