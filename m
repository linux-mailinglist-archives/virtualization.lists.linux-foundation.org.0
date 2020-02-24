Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F73F16B3CD
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 23:23:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A655485D5C;
	Mon, 24 Feb 2020 22:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKxRDutYc7DY; Mon, 24 Feb 2020 22:23:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3061386378;
	Mon, 24 Feb 2020 22:23:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E937DC0177;
	Mon, 24 Feb 2020 22:23:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82486C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 22:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7854D861D2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 22:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NduBa7shwn+b
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 22:23:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A0D3885D5C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 22:23:01 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id u26so5445102ybd.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 14:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iIizJAEddYE5v2sRf7GK1m99egmUw1JIn0Bcjp91PV4=;
 b=OO0BIgOyMX6u0FWjNR04H+ROmegaW4ctwdstMEDamEI8u5ZW9lr8B8ps9XTHmNQWMm
 QZPw9guviba7sZsZoV5oSIUzmyztDGhVTrQiwYUe4Wg4mWUI5WRJ++YGBIHa1U+aGqee
 QGDQyTYFzemFM1GhfhzLW1uYFAd5spj36Ad2ViMf2Tjv6MRy4BBgLtKI9v7NUZj6cO2f
 XyhLn1YKMjAp3XlZVg6BqqrDonQR6TK5swVL+nr31U6MM7xAqjYpHCV6lCn0L6y7N8JN
 dyHPOBbobLB0rCyzfofj3n9R9LcfBRcWTi5yexgeSA/9ILM6QabFUQUNKuQt4bu9UjuI
 WW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iIizJAEddYE5v2sRf7GK1m99egmUw1JIn0Bcjp91PV4=;
 b=j6zSeO41oO1BftoW1mSS/8L6lgfQUWyJ4pm2tvlFPDdYk7vDMdCEqIHCW8qb0e5sVc
 uJHBEXjRU2I0TZn/EGvX/GcJbiuLtGbIDynZe+ka+lTLmQGzdUeAu7lRlsTqgiFCYUSe
 Z/B572CG7MOMqRc2l2moRfCAEWaeEDkJdhjIft/t7NPvK5PDb67QM35bNBTuWuYHk4l+
 eayQh3GAxN2tZX8NPqbpmrBA6+qnyQzYhg57QZsngK5n5aKyQJ1BqxyOYFjbWwtgfMxt
 rswdRITpg0LqRZTa+BQGMXFSZkgJ2hNiU2qc7zvtFJ8uMeJxeJZ6W4jXZVIVg+alRGAe
 8O4A==
X-Gm-Message-State: APjAAAXKrQYIqHNOYmj1FHJPfX3rYQKsMStLiaPqM5WklNhCk5VrrQ9O
 4hWIwhB9RuzHtaR5oYzn9SD5ZFdJ
X-Google-Smtp-Source: APXvYqyYdnuJ+lz1r39soJgIje5vGd4h3Ez7/NKkzZcR+uWnFng7OYTRb0Uj44HsNVZanhdx120gtw==
X-Received: by 2002:a25:df09:: with SMTP id w9mr8412334ybg.515.1582582979895; 
 Mon, 24 Feb 2020 14:22:59 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id g29sm5932006ywk.31.2020.02.24.14.22.59
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 14:22:59 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id n131so5410214ybg.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 14:22:59 -0800 (PST)
X-Received: by 2002:a25:1042:: with SMTP id 63mr47817640ybq.165.1582582977755; 
 Mon, 24 Feb 2020 14:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
 <CA+FuTSd8P6uQnwisZEh7+nfowW9qKLBEvA4GPg+xUkjBa-6TDA@mail.gmail.com>
 <4e7757cf-148e-4585-b358-3b38f391275d@cambridgegreys.com>
 <CA+FuTSdOCJZCVS4xohx+BQmkmq8JALnK=gGc0=qy1TbjY707ag@mail.gmail.com>
 <93cb2b3f-6cae-8cf1-5fab-93fa34c14628@cambridgegreys.com>
In-Reply-To: <93cb2b3f-6cae-8cf1-5fab-93fa34c14628@cambridgegreys.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 24 Feb 2020 17:22:21 -0500
X-Gmail-Original-Message-ID: <CA+FuTScEXRwYtFzn-jtFhV0dNKNQqKPBwCWaNORJW=ERU=izMA@mail.gmail.com>
Message-ID: <CA+FuTScEXRwYtFzn-jtFhV0dNKNQqKPBwCWaNORJW=ERU=izMA@mail.gmail.com>
Subject: Re: [PATCH v3] virtio: Work around frames incorrectly marked as gso
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Eric Dumazet <eric.dumazet@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>, linux-um@lists.infradead.org,
 virtualization@lists.linux-foundation.org
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

On Mon, Feb 24, 2020 at 4:00 PM Anton Ivanov
<anton.ivanov@cambridgegreys.com> wrote:
>
> On 24/02/2020 20:20, Willem de Bruijn wrote:
> > On Mon, Feb 24, 2020 at 2:55 PM Anton Ivanov
> > <anton.ivanov@cambridgegreys.com> wrote:
> >> On 24/02/2020 19:27, Willem de Bruijn wrote:
> >>> On Mon, Feb 24, 2020 at 8:26 AM <anton.ivanov@cambridgegreys.com> wrote:
> >>>> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> >>>>
> >>>> Some of the locally generated frames marked as GSO which
> >>>> arrive at virtio_net_hdr_from_skb() have no GSO_TYPE, no
> >>>> fragments (data_len = 0) and length significantly shorter
> >>>> than the MTU (752 in my experiments).
> >>> Do we understand how these packets are generated?
> >> No, we have not been able to trace them.
> >>
> >> The only thing we know is that this is specific to locally generated
> >> packets. Something arriving from the network does not show this.
> >>
> >>> Else it seems this
> >>> might be papering over a deeper problem.
> >>>
> >>> The stack should not create GSO packets less than or equal to
> >>> skb_shinfo(skb)->gso_size. See for instance the check in
> >>> tcp_gso_segment after pulling the tcp header:
> >>>
> >>>           mss = skb_shinfo(skb)->gso_size;
> >>>           if (unlikely(skb->len <= mss))
> >>>                   goto out;
> >>>
> >>> What is the gso_type, and does it include SKB_GSO_DODGY?
> >>>
> >>
> >> 0 - not set.
> > Thanks for the follow-up details. Is this something that you can trigger easily?
>
> Yes, if you have a UML instance handy.
>
> Running iperf between the host and a UML guest using raw socket
> transport triggers it immediately.
>
> This is my UML command line:
>
> vmlinux mem=2048M umid=OPX \
>      ubd0=OPX-3.0-Work.img \
> vec0:transport=raw,ifname=p-veth0,depth=128,gro=1,mac=92:9b:36:5e:38:69 \
>      root=/dev/ubda ro con=null con0=null,fd:2 con1=fd:0,fd:1
>
> p-right is a part of a vEth pair:
>
> ip link add l-veth0 type veth peer name p-veth0 && ifconfig p-veth0 up
>
> iperf server is on host, iperf -c in the guest.
>
> >
> > An skb_dump() + dump_stack() when the packet socket gets such a
> > packet may point us to the root cause and fix that.
>
> We tried dump stack, it was not informative - it was just the recvmmsg
> call stack coming from the UML until it hits the relevant recv bit in
> af_packet - it does not tell us where the packet is coming from.
>
> Quoting from the message earlier in the thread:
>
> [ 2334.180854] Call Trace:
> [ 2334.181947]  dump_stack+0x5c/0x80
> [ 2334.183021]  packet_recvmsg.cold+0x23/0x49
> [ 2334.184063]  ___sys_recvmsg+0xe1/0x1f0
> [ 2334.185034]  ? packet_poll+0xca/0x130
> [ 2334.186014]  ? sock_poll+0x77/0xb0
> [ 2334.186977]  ? ep_item_poll.isra.0+0x3f/0xb0
> [ 2334.187936]  ? ep_send_events_proc+0xf1/0x240
> [ 2334.188901]  ? dequeue_signal+0xdb/0x180
> [ 2334.189848]  do_recvmmsg+0xc8/0x2d0
> [ 2334.190728]  ? ep_poll+0x8c/0x470
> [ 2334.191581]  __sys_recvmmsg+0x108/0x150
> [ 2334.192441]  __x64_sys_recvmmsg+0x25/0x30
> [ 2334.193346]  do_syscall_64+0x53/0x140
> [ 2334.194262]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

That makes sense. skb_dump might show more interesting details about
the packet. From the previous thread, these are assumed to be TCP
packets?

I had missed the original thread. If the packet has

    sinfo(skb)->gso_size = 752.
    skb->len = 818

then this is a GSO packet. Even though UML will correctly process it
as a normal 818 B packet if psock_rcv pretends that it is, treating it
like that is not strictly correct. A related question is how the setup
arrived at that low MTU size, assuming that is not explicitly
configured that low.

As of commit 51466a7545b7 ("tcp: fill shinfo->gso_type at last
moment") tcp unconditionally sets gso_type, even for non gso packets.
So either this is not a tcp packet or the field gets zeroed somewhere
along the way. I could not quickly find a possible path to
skb_gso_reset or a raw write.

It may be useful to insert tests for this condition (skb_is_gso(skb)
&& !skb_shinfo(skb)->gso_type) that call skb_dump at other points in
the network stack. For instance in __ip_queue_xmit and
__dev_queue_xmit.

Since skb segmentation fails in tcp_gso_segment for such packets, it
may also be informative to disable TSO on the veth device and see if
the test fails.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
