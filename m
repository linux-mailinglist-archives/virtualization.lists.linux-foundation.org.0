Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D03611758B9
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 11:54:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7CD07854E7;
	Mon,  2 Mar 2020 10:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id viUqzn2GIKK5; Mon,  2 Mar 2020 10:54:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CE35E8485E;
	Mon,  2 Mar 2020 10:54:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1E57C013E;
	Mon,  2 Mar 2020 10:54:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32D37C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 10:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1C3E3875BB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 10:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4TV5iEtZtA7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 10:54:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BBEBB871DE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 10:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583146474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DS3NWQ9cQZuAYyDOGt+oLTmTRBDkn8Neek7FpfWpHKQ=;
 b=FhtT68/nbcZELELSV6GEFAr7Hz+S6hVvNLF2F2f1TxBlPpSWXLIVHGV5xVNaS23v6cETLg
 c+h/wrjORSABIcOUNHiKXJqZpU6YW4Q0t0cgEm2yKUHZCHLVFDbIwPX/EBxmn6Xrq/rGld
 X2rYMoTmpslbg7n52ynLNZriVILcc00=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-otA_upFyMBmKSBiM2YqPYA-1; Mon, 02 Mar 2020 05:54:32 -0500
X-MC-Unique: otA_upFyMBmKSBiM2YqPYA-1
Received: by mail-qk1-f200.google.com with SMTP id 206so8499282qkd.21
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 02:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DS3NWQ9cQZuAYyDOGt+oLTmTRBDkn8Neek7FpfWpHKQ=;
 b=SIBUPuqFQJzb/K4VeXNTi6ux3qqQ1VQAhXR2vYUD/0WlhBGvrxnNX+RCKtYgVQbq4D
 Ue0yy5yGK0l/8anOGOeojBkXtZW70dDBIRvHN3Zo+imqZcn7AL04iZGUqd/SaXgBPen/
 WqzO8ToM2gxeoI0+/hPLYk4dorMCDVcAm731jOdJ9hI9WeJQfFCtZXXL66OVWw+Ug7x7
 3KI8ezGxM763jjvp4aAuAW5SzyxtwtgX2649Ng35CWcLKrR0Q/yj8jxAVry3viHtt6FL
 tAX8WW9DSr2B17rM5FLPswkUtD5xppfD+nPn3TIwcZB5Q8M5X666Uk6FhLe6kuvjieUm
 EwbQ==
X-Gm-Message-State: ANhLgQ3Qi+Sq+2FINWkYy4MtyM0+sKhR6wn6Bns0UTM+M0L88Ugoa1SZ
 wJG59NY7cyeP12mW1Wkhh4yGZOAmDvzz1hxOO5ogbIPIyityTIMmUEvA6XtBwXs2/z27rnDXrPA
 Y9FM7yKKCK38i7IgwDJu7v4mMnqSiVhXrZTx7+db4dg==
X-Received: by 2002:a05:620a:16bc:: with SMTP id
 s28mr1342470qkj.287.1583146472258; 
 Mon, 02 Mar 2020 02:54:32 -0800 (PST)
X-Google-Smtp-Source: ADFU+vup8HPdMgwSzdoLfE1pDvNx1J0XvHumaV92Kmmf/VaJEAY+1B7FvFVVmkt1M600jZFlM6U5dg==
X-Received: by 2002:a05:620a:16bc:: with SMTP id
 s28mr1342454qkj.287.1583146471947; 
 Mon, 02 Mar 2020 02:54:31 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id a187sm9906648qkc.61.2020.03.02.02.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 02:54:31 -0800 (PST)
Date: Mon, 2 Mar 2020 05:54:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v3 2/3] virtio-net: Introduce RSS receive steering feature
Message-ID: <20200302055359-mutt-send-email-mst@kernel.org>
References: <20200301143302.8556-1-yuri.benditovich@daynix.com>
 <20200301143302.8556-3-yuri.benditovich@daynix.com>
 <20200301145811-mutt-send-email-mst@kernel.org>
 <CAOEp5Oc07THyvZghMBjns=aTVEPMxb4w6LFGFtUsS93h4xsSJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOEp5Oc07THyvZghMBjns=aTVEPMxb4w6LFGFtUsS93h4xsSJQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Mon, Mar 02, 2020 at 10:53:14AM +0200, Yuri Benditovich wrote:
> On Sun, Mar 1, 2020 at 9:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Mar 01, 2020 at 04:33:01PM +0200, Yuri Benditovich wrote:
> > > RSS (Receive-side scaling) defines hash calculation
> > > rules and decision on receive virtqueue according to
> > > the calculated hash, provided mask to apply and
> > > provided indirection table containing indices of
> > > receive virqueues. The driver sends the control
> > > command to enable multiqueue and provide parameters
> > > for receive steering.
> > >
> > > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > > ---
> > >  include/uapi/linux/virtio_net.h | 42 +++++++++++++++++++++++++++++++--
> > >  1 file changed, 40 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> > > index 19e76b3e3a64..188ad3eecdc8 100644
> > > --- a/include/uapi/linux/virtio_net.h
> > > +++ b/include/uapi/linux/virtio_net.h
> > > @@ -57,6 +57,7 @@
> > >                                        * Steering */
> > >  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23        /* Set MAC address */
> > >
> > > +#define VIRTIO_NET_F_RSS       60    /* Supports RSS RX steering */
> > >  #define VIRTIO_NET_F_RSC_EXT   61    /* extended coalescing info */
> > >  #define VIRTIO_NET_F_STANDBY   62    /* Act as standby for another device
> > >                                        * with the same MAC.
> > > @@ -70,6 +71,17 @@
> > >  #define VIRTIO_NET_S_LINK_UP 1       /* Link is up */
> > >  #define VIRTIO_NET_S_ANNOUNCE        2       /* Announcement is needed */
> > >
> > > +/* supported/enabled hash types */
> > > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv4          (1 << 0)
> > > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4         (1 << 1)
> > > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4         (1 << 2)
> > > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv6          (1 << 3)
> > > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6         (1 << 4)
> > > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6         (1 << 5)
> > > +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX         (1 << 6)
> > > +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX        (1 << 7)
> > > +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX        (1 << 8)
> > > +
> > >  struct virtio_net_config {
> > >       /* The config defining mac address (if VIRTIO_NET_F_MAC) */
> > >       __u8 mac[ETH_ALEN];
> > > @@ -93,6 +105,12 @@ struct virtio_net_config {
> > >        * Any other value stands for unknown.
> > >        */
> > >       __u8 duplex;
> > > +     /* maximum size of RSS key */
> > > +     __u8 rss_max_key_size;
> > > +     /* maximum number of indirection table entries */
> > > +     __le16 rss_max_indirection_table_length;
> > > +     /* bitmask of supported VIRTIO_NET_RSS_HASH_ types */
> > > +     __le32 supported_hash_types;
> > >  } __attribute__((packed));
> > >
> > >  /*
> > > @@ -246,7 +264,9 @@ struct virtio_net_ctrl_mac {
> > >
> > >  /*
> > >   * Control Receive Flow Steering
> > > - *
> > > + */
> > > +#define VIRTIO_NET_CTRL_MQ   4
> > > +/*
> > >   * The command VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
> > >   * enables Receive Flow Steering, specifying the number of the transmit and
> > >   * receive queues that will be used. After the command is consumed and acked by
> > > @@ -259,11 +279,29 @@ struct virtio_net_ctrl_mq {
> > >       __virtio16 virtqueue_pairs;
> > >  };
> > >
> > > -#define VIRTIO_NET_CTRL_MQ   4
> > >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0
> > >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN        1
> > >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX        0x8000
> > >
> > > +/*
> > > + * The command VIRTIO_NET_CTRL_MQ_RSS_CONFIG has the same effect as
> > > + * VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET does and additionally configures
> > > + * the receive steering to use a hash calculated for incoming packet
> > > + * to decide on receive virtqueue to place the packet. The command
> > > + * also provides parameters to calculate a hash and receive virtqueue.
> > > + */
> > > +struct virtio_net_rss_config {
> > > +     __le32 hash_types;
> > > +     __le16 indirection_table_mask;
> > > +     __le16 unclassified_queue;
> > > +     __le16 indirection_table[1/* + indirection_table_mask */];
> > > +     __le16 max_tx_vq;
> > > +     __u8 hash_key_length;
> > > +     __u8 hash_key_data[/* hash_key_length */];
> > > +};
> > > +
> > > + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
> > > +
> >
> >
> > Extra space here.
> 
> Where exactly you want to remove the empty line?
> The format here is exactly as in other places:
> comment - structure - space - command - space

+ #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1

should be

+#define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1

> 
> >
> > >  /*
> > >   * Control network offloads
> > >   *
> > > --
> > > 2.17.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
