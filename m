Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB6130832
	for <lists.virtualization@lfdr.de>; Sun,  5 Jan 2020 14:14:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C644185C1D;
	Sun,  5 Jan 2020 13:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89yDLre256zH; Sun,  5 Jan 2020 13:14:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B51B85BC4;
	Sun,  5 Jan 2020 13:14:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16D94C0881;
	Sun,  5 Jan 2020 13:14:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74ACDC0881
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6981D84E10
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbCjpWzbZGOR
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:14:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1220D84E0C
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578230041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fk09R+kHO6037bNMYCslAmNwggGNiJ8jA8PAG3EtmFs=;
 b=XJ+ErH8cBMNy3fS0OYK5UnKI7ouPXgcSm+asY9xO1SqvG/hcKX8+2DBVFIQnGuq/tycJyn
 58u8m+GDtnzKqacpZMMOE4XhlTk0zVEizBHgq4zG19Yza1tWZuRJRK3E3em93SSe+8S96U
 TUJTmCNGtF/3Y/EqufqBTHWFzU4hJFo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-oMYylXDLO0uO5c9mlJXRvg-1; Sun, 05 Jan 2020 08:13:58 -0500
Received: by mail-qv1-f70.google.com with SMTP id v3so27099085qvm.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jan 2020 05:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fk09R+kHO6037bNMYCslAmNwggGNiJ8jA8PAG3EtmFs=;
 b=k6D9WQjplfP70rbbPcEq1S/b7hvtT7XBnrDLj3WvHNdWrKHQZZKCuDP235s7iTOiXz
 xKO7rNjDdLfRu6swvsTBeV4lueo8LNkmvXpBSVDVmwXNzH4IeABCvurGKr0N8MnIqVaR
 By6pu3WDoTNgiLTXRx9Gkjvu3V3yDbWgMZTZQi9s9GmL7hxL0agX0/MhsYCD5ZTGpl5O
 WjPTBDPEiheHd41elwEhPv9d96O3Py6shUIatPa1qzGaVKGNXQS/RNVeyG7Z7wX0Fq2M
 MpljbHS5nw64KiBjDY83tw/26uyYfu+GSe0W5+RDaRUu06gSGaLGnVRL+DLjOYFBtgUB
 zn9A==
X-Gm-Message-State: APjAAAUEA5xvp0V39fi/7mboe5+I3D3u7cIdKes7YxiSm5GZQ44LpMcU
 xVJLIeKenLVfSoqV51U6vzWkSaHbbWalb7vL0JtSYAxzK06IDq3RgUkXUSd/16+EX2+kwr1UUvs
 vRkC4uufXeN/iGeMZtkQBQrbQakME3lnCi2NTCC9HhQ==
X-Received: by 2002:ae9:f506:: with SMTP id o6mr78042890qkg.41.1578230038399; 
 Sun, 05 Jan 2020 05:13:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqwoXz/f/iqq3z8FG3FiucFEok/9LI9Kxgvo8Jiz3Je6GuMniFX8+AsyEWxkXA1oSkfBFTLFwA==
X-Received: by 2002:ae9:f506:: with SMTP id o6mr78042873qkg.41.1578230038128; 
 Sun, 05 Jan 2020 05:13:58 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id g21sm19193743qkl.116.2020.01.05.05.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 05:13:57 -0800 (PST)
Date: Sun, 5 Jan 2020 08:13:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alistair Delva <adelva@google.com>
Subject: Re: [PATCH net] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
Message-ID: <20200105081312-mutt-send-email-mst@kernel.org>
References: <20191223140322.20013-1-mst@redhat.com>
 <CANDihLHPk5khpv-f-M+qhkzgTkygAts38GGb-HChg-VL2bo+Uw@mail.gmail.com>
 <CA+FuTSfq5v3-0VYmTG7YFFUqT8uG53eXXhqc8WvVvMbp3s0nvA@mail.gmail.com>
 <CA+FuTScwwajN2ny2w8EBkBQd191Eb1ZsrRhbh3=5eQervArnEA@mail.gmail.com>
 <CANDihLFv+DJYOD1m_Z3CKuxoXG-z4zPy_Tc2eoggq1KRo+GeWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANDihLFv+DJYOD1m_Z3CKuxoXG-z4zPy_Tc2eoggq1KRo+GeWw@mail.gmail.com>
X-MC-Unique: oMYylXDLO0uO5c9mlJXRvg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
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

On Mon, Dec 23, 2019 at 12:21:56PM -0800, Alistair Delva wrote:
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

Should this return error here?

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

This is just my

    virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ

right?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
