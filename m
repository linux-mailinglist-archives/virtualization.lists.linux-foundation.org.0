Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B8175950
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 12:16:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0AE4884368;
	Mon,  2 Mar 2020 11:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IrvGH3t-dWO; Mon,  2 Mar 2020 11:16:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 079B785CBB;
	Mon,  2 Mar 2020 11:16:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F13BCC013E;
	Mon,  2 Mar 2020 11:16:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99558C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 83612850EA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QqO6XWyHBUu9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:16:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B0E05850E1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583147775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=umbLYwhPWxfWOXkX5gvhj2TCibBswbVscPss66YGx1c=;
 b=JA7KzeyqWl9Mq/C/bAg0yn8P7kXPFayMa/h6CQhNudhxZ1O7ZXuNFxcjCRlcjiI9iegYHA
 5hEz8dQD2I6NeeRjCzhpO0SlpllV7eoO7WEeGgcNIgfzGHtN+SpmkkO/FgwAKZdl99uv5U
 ahTAgMqUrQSXGW3mhgGqET6C6unuz/8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-cgnqMIPKMzCWrEPmoq2nRQ-1; Mon, 02 Mar 2020 06:16:13 -0500
X-MC-Unique: cgnqMIPKMzCWrEPmoq2nRQ-1
Received: by mail-qk1-f200.google.com with SMTP id z124so8553549qkd.20
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 03:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=umbLYwhPWxfWOXkX5gvhj2TCibBswbVscPss66YGx1c=;
 b=G2f2w332GtLkhkY1cikKKRbiRuW6WbhkBouhiqH7ZczC7ON4sWKxj022PT8wyOXQqb
 /c3VhETkbYKVGmeYBpVUbU/xSZI9ZWjE2IOiBFLIyllOFo9Kx2vjoyYqCgVaqn+GDWvw
 qSPxL1fofwPnwk4an+iCoCETB7hsTfN3N18dvH6AdZeyd98jg2G27cZnFmHYhR8hLcbd
 tmmHBgICsaVTk3eNF09JrElyx4zeet7z46wbp83kYsoM0k7Spy/D+VcSXc+xAwQM0beQ
 x64YoTFF2CQXE/sxG8i8m+XbMtip0l4H+/zxIeSG1UsG8ONEceI9aHjGRXmcXJPOAgMb
 74pA==
X-Gm-Message-State: APjAAAXnLIHvGhNADIuIa1EdMz0dQEVWy73Yk7R6IQx45s/pXXhLBZEt
 NjYErU3SbnjgR7NrqVLxnkG9dvALCR4JbzESo4dMuC7FyhoQvkjXirGoZ60+iER86GECmR+t62U
 ldgV7FiqeeqICgPxwDophO5CA9WrDyLDaLVjQLYpR7A==
X-Received: by 2002:a37:4f93:: with SMTP id
 d141mr15300004qkb.125.1583147772975; 
 Mon, 02 Mar 2020 03:16:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqw37mRm8RQ5OwQWrA3Tw95Zs3ZfsyQXSy1ROgOhIMbb5VGK1q4sALItcgU02yvFe+sfPN8ezA==
X-Received: by 2002:a37:4f93:: with SMTP id
 d141mr15299986qkb.125.1583147772684; 
 Mon, 02 Mar 2020 03:16:12 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id w41sm10092944qtj.49.2020.03.02.03.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 03:16:11 -0800 (PST)
Date: Mon, 2 Mar 2020 06:16:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v3 2/3] virtio-net: Introduce RSS receive steering feature
Message-ID: <20200302061549-mutt-send-email-mst@kernel.org>
References: <20200301143302.8556-1-yuri.benditovich@daynix.com>
 <20200301143302.8556-3-yuri.benditovich@daynix.com>
 <20200301145811-mutt-send-email-mst@kernel.org>
 <CAOEp5Oc07THyvZghMBjns=aTVEPMxb4w6LFGFtUsS93h4xsSJQ@mail.gmail.com>
 <20200302055359-mutt-send-email-mst@kernel.org>
 <CAOEp5Oc8p6b4eDKOQoNfoER2UKNGwN6HrbVqvY+qgFwHev4qcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOEp5Oc8p6b4eDKOQoNfoER2UKNGwN6HrbVqvY+qgFwHev4qcQ@mail.gmail.com>
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

On Mon, Mar 02, 2020 at 12:58:34PM +0200, Yuri Benditovich wrote:
> All the classes of commands are defined without indentation.
> All the commands are defined with indentation of 1 space.
> Only the last one (VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET at the end of
> the file) does not have an indentation.

OK then, sorry about the noise.

> On Mon, Mar 2, 2020 at 12:54 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Mar 02, 2020 at 10:53:14AM +0200, Yuri Benditovich wrote:
> > > On Sun, Mar 1, 2020 at 9:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Sun, Mar 01, 2020 at 04:33:01PM +0200, Yuri Benditovich wrote:
> > > > > RSS (Receive-side scaling) defines hash calculation
> > > > > rules and decision on receive virtqueue according to
> > > > > the calculated hash, provided mask to apply and
> > > > > provided indirection table containing indices of
> > > > > receive virqueues. The driver sends the control
> > > > > command to enable multiqueue and provide parameters
> > > > > for receive steering.
> > > > >
> > > > > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > > > > ---
> > > > >  include/uapi/linux/virtio_net.h | 42 +++++++++++++++++++++++++++++++--
> > > > >  1 file changed, 40 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> > > > > index 19e76b3e3a64..188ad3eecdc8 100644
> > > > > --- a/include/uapi/linux/virtio_net.h
> > > > > +++ b/include/uapi/linux/virtio_net.h
> > > > > @@ -57,6 +57,7 @@
> > > > >                                        * Steering */
> > > > >  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23        /* Set MAC address */
> > > > >
> > > > > +#define VIRTIO_NET_F_RSS       60    /* Supports RSS RX steering */
> > > > >  #define VIRTIO_NET_F_RSC_EXT   61    /* extended coalescing info */
> > > > >  #define VIRTIO_NET_F_STANDBY   62    /* Act as standby for another device
> > > > >                                        * with the same MAC.
> > > > > @@ -70,6 +71,17 @@
> > > > >  #define VIRTIO_NET_S_LINK_UP 1       /* Link is up */
> > > > >  #define VIRTIO_NET_S_ANNOUNCE        2       /* Announcement is needed */
> > > > >
> > > > > +/* supported/enabled hash types */
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv4          (1 << 0)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4         (1 << 1)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4         (1 << 2)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv6          (1 << 3)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6         (1 << 4)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6         (1 << 5)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX         (1 << 6)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX        (1 << 7)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX        (1 << 8)
> > > > > +
> > > > >  struct virtio_net_config {
> > > > >       /* The config defining mac address (if VIRTIO_NET_F_MAC) */
> > > > >       __u8 mac[ETH_ALEN];
> > > > > @@ -93,6 +105,12 @@ struct virtio_net_config {
> > > > >        * Any other value stands for unknown.
> > > > >        */
> > > > >       __u8 duplex;
> > > > > +     /* maximum size of RSS key */
> > > > > +     __u8 rss_max_key_size;
> > > > > +     /* maximum number of indirection table entries */
> > > > > +     __le16 rss_max_indirection_table_length;
> > > > > +     /* bitmask of supported VIRTIO_NET_RSS_HASH_ types */
> > > > > +     __le32 supported_hash_types;
> > > > >  } __attribute__((packed));
> > > > >
> > > > >  /*
> > > > > @@ -246,7 +264,9 @@ struct virtio_net_ctrl_mac {
> > > > >
> > > > >  /*
> > > > >   * Control Receive Flow Steering
> > > > > - *
> > > > > + */
> > > > > +#define VIRTIO_NET_CTRL_MQ   4
> > > > > +/*
> > > > >   * The command VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
> > > > >   * enables Receive Flow Steering, specifying the number of the transmit and
> > > > >   * receive queues that will be used. After the command is consumed and acked by
> > > > > @@ -259,11 +279,29 @@ struct virtio_net_ctrl_mq {
> > > > >       __virtio16 virtqueue_pairs;
> > > > >  };
> > > > >
> > > > > -#define VIRTIO_NET_CTRL_MQ   4
> > > > >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0
> > > > >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN        1
> > > > >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX        0x8000
> > > > >
> > > > > +/*
> > > > > + * The command VIRTIO_NET_CTRL_MQ_RSS_CONFIG has the same effect as
> > > > > + * VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET does and additionally configures
> > > > > + * the receive steering to use a hash calculated for incoming packet
> > > > > + * to decide on receive virtqueue to place the packet. The command
> > > > > + * also provides parameters to calculate a hash and receive virtqueue.
> > > > > + */
> > > > > +struct virtio_net_rss_config {
> > > > > +     __le32 hash_types;
> > > > > +     __le16 indirection_table_mask;
> > > > > +     __le16 unclassified_queue;
> > > > > +     __le16 indirection_table[1/* + indirection_table_mask */];
> > > > > +     __le16 max_tx_vq;
> > > > > +     __u8 hash_key_length;
> > > > > +     __u8 hash_key_data[/* hash_key_length */];
> > > > > +};
> > > > > +
> > > > > + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
> > > > > +
> > > >
> > > >
> > > > Extra space here.
> > >
> > > Where exactly you want to remove the empty line?
> > > The format here is exactly as in other places:
> > > comment - structure - space - command - space
> >
> > + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
> >
> > should be
> >
> > +#define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
> >
> > >
> > > >
> > > > >  /*
> > > > >   * Control network offloads
> > > > >   *
> > > > > --
> > > > > 2.17.1
> > > >
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
