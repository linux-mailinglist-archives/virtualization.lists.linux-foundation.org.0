Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFB17564F
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 09:53:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 880F38738A;
	Mon,  2 Mar 2020 08:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGZNHoevv0Ol; Mon,  2 Mar 2020 08:53:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39CA487356;
	Mon,  2 Mar 2020 08:53:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2784AC013E;
	Mon,  2 Mar 2020 08:53:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5DFCC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 08:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D22EC857C2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 08:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9btEZMxlaSI6
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 08:53:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0ABEB84DCD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 08:53:27 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id l5so10525527ywd.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 00:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J9M0oBKN1OQnBWGJPk3lWi6DUIW2zQCCN42nNOnH9q4=;
 b=RvPPIlWxEzXPSYQKBCE6Xsn9KoqF0QFiB+UGlVcm/4DyUQV+qKg1uHLIv8wdRGLx2W
 mtulw6HLFDhhKT71chmt13bwWGF48MASKyp2DYbAtI3kC7dYxJ3sCAkfa42MgVzk0Qd0
 3r8NyrKd3IKjTv1uxuCJSNZpuz7mjfuG+iUmDUCIArjpn+lfmrDRzhWonDa0y7kteChi
 uWucQA2YXB9k0aS5YRtUeg+i9P/PDjQDi6EGs+CE5XqQGsygmgyxLQhFOvPeaxjlU6bG
 oLtfU1Qf0+z7hDA9vQpZ3C01jxoKTu1ZQK/RHN15RSqTvn4WAij8LdpRjLh0avyCXo5E
 YKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J9M0oBKN1OQnBWGJPk3lWi6DUIW2zQCCN42nNOnH9q4=;
 b=Tbg0o069zVjo0Nssw7l/3SpnByQ8RSgW4B2B+xc5tR31dcjEfv/s4BSDdtvdxz6y9E
 J6WEGNpXmhMn2HTgcKKaxwCNkZ1JQ3JY4+O6TRQcBAQk0FTVkIU4He+MiQlCCfCDeBdD
 IP0sSxpFfnU841MywucJVAcq5mx7Id1dv3ozZo/nJvI1Zj7slTCNFqf50tNBXkPbCKf5
 Jc7wTMVDdEy1OXqtCE7BHmMl9yuk0dYDqE7OvSJ4G/J/HmXsT1MAiFCOEAvIpFHJ5Etu
 BXC6Q4MVrRSvBG9KzJAAj1Jc1hEJvK2PfFsVlBq/FuyC3hh5PheiCxt6iX55Fte8mZDd
 pz8A==
X-Gm-Message-State: ANhLgQ2su5LfepbF1ILDMIT5XyfIt4HGCQm7Bd1oblt9s7sh0duHURCA
 buprCcS+J+HtabNPtivkWSbATCu6H7lBFVL2oT9RkA==
X-Google-Smtp-Source: ADFU+vs+98yuAZb/4vcpynxksSVpHYPTpcb4O7pd+ReOP2xeKEezddDfFEqhgHL+gYnnNGGZCg3H0FetvOu/dlBPhzY=
X-Received: by 2002:a0d:ffc2:: with SMTP id p185mr811323ywf.496.1583139205976; 
 Mon, 02 Mar 2020 00:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20200301143302.8556-1-yuri.benditovich@daynix.com>
 <20200301143302.8556-3-yuri.benditovich@daynix.com>
 <20200301145811-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200301145811-mutt-send-email-mst@kernel.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 2 Mar 2020 10:53:14 +0200
Message-ID: <CAOEp5Oc07THyvZghMBjns=aTVEPMxb4w6LFGFtUsS93h4xsSJQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] virtio-net: Introduce RSS receive steering feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yan Vugenfirer <yan@daynix.com>, virtio-dev@lists.oasis-open.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Sun, Mar 1, 2020 at 9:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Mar 01, 2020 at 04:33:01PM +0200, Yuri Benditovich wrote:
> > RSS (Receive-side scaling) defines hash calculation
> > rules and decision on receive virtqueue according to
> > the calculated hash, provided mask to apply and
> > provided indirection table containing indices of
> > receive virqueues. The driver sends the control
> > command to enable multiqueue and provide parameters
> > for receive steering.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > ---
> >  include/uapi/linux/virtio_net.h | 42 +++++++++++++++++++++++++++++++--
> >  1 file changed, 40 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> > index 19e76b3e3a64..188ad3eecdc8 100644
> > --- a/include/uapi/linux/virtio_net.h
> > +++ b/include/uapi/linux/virtio_net.h
> > @@ -57,6 +57,7 @@
> >                                        * Steering */
> >  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23        /* Set MAC address */
> >
> > +#define VIRTIO_NET_F_RSS       60    /* Supports RSS RX steering */
> >  #define VIRTIO_NET_F_RSC_EXT   61    /* extended coalescing info */
> >  #define VIRTIO_NET_F_STANDBY   62    /* Act as standby for another device
> >                                        * with the same MAC.
> > @@ -70,6 +71,17 @@
> >  #define VIRTIO_NET_S_LINK_UP 1       /* Link is up */
> >  #define VIRTIO_NET_S_ANNOUNCE        2       /* Announcement is needed */
> >
> > +/* supported/enabled hash types */
> > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv4          (1 << 0)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4         (1 << 1)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4         (1 << 2)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv6          (1 << 3)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6         (1 << 4)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6         (1 << 5)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX         (1 << 6)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX        (1 << 7)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX        (1 << 8)
> > +
> >  struct virtio_net_config {
> >       /* The config defining mac address (if VIRTIO_NET_F_MAC) */
> >       __u8 mac[ETH_ALEN];
> > @@ -93,6 +105,12 @@ struct virtio_net_config {
> >        * Any other value stands for unknown.
> >        */
> >       __u8 duplex;
> > +     /* maximum size of RSS key */
> > +     __u8 rss_max_key_size;
> > +     /* maximum number of indirection table entries */
> > +     __le16 rss_max_indirection_table_length;
> > +     /* bitmask of supported VIRTIO_NET_RSS_HASH_ types */
> > +     __le32 supported_hash_types;
> >  } __attribute__((packed));
> >
> >  /*
> > @@ -246,7 +264,9 @@ struct virtio_net_ctrl_mac {
> >
> >  /*
> >   * Control Receive Flow Steering
> > - *
> > + */
> > +#define VIRTIO_NET_CTRL_MQ   4
> > +/*
> >   * The command VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
> >   * enables Receive Flow Steering, specifying the number of the transmit and
> >   * receive queues that will be used. After the command is consumed and acked by
> > @@ -259,11 +279,29 @@ struct virtio_net_ctrl_mq {
> >       __virtio16 virtqueue_pairs;
> >  };
> >
> > -#define VIRTIO_NET_CTRL_MQ   4
> >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0
> >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN        1
> >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX        0x8000
> >
> > +/*
> > + * The command VIRTIO_NET_CTRL_MQ_RSS_CONFIG has the same effect as
> > + * VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET does and additionally configures
> > + * the receive steering to use a hash calculated for incoming packet
> > + * to decide on receive virtqueue to place the packet. The command
> > + * also provides parameters to calculate a hash and receive virtqueue.
> > + */
> > +struct virtio_net_rss_config {
> > +     __le32 hash_types;
> > +     __le16 indirection_table_mask;
> > +     __le16 unclassified_queue;
> > +     __le16 indirection_table[1/* + indirection_table_mask */];
> > +     __le16 max_tx_vq;
> > +     __u8 hash_key_length;
> > +     __u8 hash_key_data[/* hash_key_length */];
> > +};
> > +
> > + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
> > +
>
>
> Extra space here.

Where exactly you want to remove the empty line?
The format here is exactly as in other places:
comment - structure - space - command - space


>
> >  /*
> >   * Control network offloads
> >   *
> > --
> > 2.17.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
