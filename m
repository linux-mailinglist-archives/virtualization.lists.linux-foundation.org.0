Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3083871F3
	for <lists.virtualization@lfdr.de>; Tue, 18 May 2021 08:33:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DD71405B7;
	Tue, 18 May 2021 06:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nk0pDA9YwkDJ; Tue, 18 May 2021 06:33:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6241340569;
	Tue, 18 May 2021 06:33:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D96D2C0001;
	Tue, 18 May 2021 06:33:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BC82C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 06:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC40B83B33
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 06:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i6453TZweNQM
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 06:33:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91FEF83955
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 May 2021 06:33:18 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id z3so8789009oib.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 May 2021 23:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I/nOqogCBKj8Jo7Rsll9I66GD7iEvIt5ciCccCoZlEs=;
 b=efso70W53jkPpp58wUOr49Ntk4YT0Tdc8wXwaFC1cR7+cc0IFUuQkV6CbuSUcoxVMG
 9CzgwIhjfiiFDfYRZNgqBRyHNFfZ3THqgEPS4PsK+k2FZCOapxeStrQV3Y7PqKsbcaXt
 3X3uGqISsLdwjxItwKZHSJ4J85lcy+kW6feqTlSZD3No5J4orNDS+AXA0Ce2IFRF+Bip
 Q4Ip7mZ0TipDErgmLGeVDxctDJdSi1tyH/BgfpaMLuxsnkV5X+8oQimDusXXQ0jf06j9
 KxT42ndCUuFTDGAQta6a4qjS5F/E8aoVGgq5GYlhLwbklK4ZpLO1bS6BQE48NzFiOnTC
 EHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I/nOqogCBKj8Jo7Rsll9I66GD7iEvIt5ciCccCoZlEs=;
 b=BAKzaqpPqqgApmFp676j+n6bp/nYRgd2rMrL7TRqlgOKhVmOwDD1evHX1vqnLvh9lQ
 EXFW5WuwfsolVWgMKlpqafpmihe+BMibqqCF8LqbpkQfv7bbhYqTPyEsK++4fGO5JxoW
 6Etu8DlVHcFyDacl/m3i0y0VBZduofREl68Ce3yQAQ9zVNrmJhqzPFyAmHtcXj47q82X
 IFG0UB4KrneN2R4jWDRZRlFDVyn/G+Ed6fkcymR259ZSqUdPcEsYyf6ZQYLv5JD5+0dY
 YCDUSha6hb0cLUvyolamBZjPYkTTwQcGW+Ybj6jMBm5VmAGOc+ParxcGupk4i08mfNKk
 rVyg==
X-Gm-Message-State: AOAM5309X+xahHyuS4ytXd2ktXzv7Kb1yIqzoaL5yDpg0A9+ZP+xO5UR
 7epJMdQcdyL+WMtywv7d1n3Puqy5W6fXItCq+wVVpw==
X-Google-Smtp-Source: ABdhPJyXuN6Re7o2UA119O3TaXWxZasTalN/bhhBmv6HsX0gOMzmDNGBw2/q8yqAkZU4yOgXyl+7l4nc4N1/K3xiTYA=
X-Received: by 2002:aca:d417:: with SMTP id l23mr2805816oig.97.1621319597357; 
 Mon, 17 May 2021 23:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAP_N_Z9xPgyf=au4VD+fXF8iorZHHk7Q4-CbJCOVUeupG4v4sw@mail.gmail.com>
 <20210504161651.3b6fhi64d7g3jui4@steredhat>
 <CAP_N_Z_cYjTCUpmLAW0xskUM_kAi=8e7iU8RXsMRnYWOxhA5OA@mail.gmail.com>
 <20210505104933.wgdn4gw56kle2mec@steredhat>
 <CAP_N_Z_DN+SYZ3E52HGdcmSfopBoNayKVzUdH7Nc2jUK5nfmLA@mail.gmail.com>
 <CAP_N_Z9yZ4ydXaEn1e=70pDh3FyDjrrxgzis4YTfyDoZ5c8k+g@mail.gmail.com>
 <20210510145055.y7mxqaq4zggajz5a@steredhat>
 <CAP_N_Z94Pi4k8Dv6cHR0CZ9RTLJeQ3VWQoQgLTCWE4k+A01xbg@mail.gmail.com>
 <20210514151701.6fp27qanjseom4tl@steredhat>
 <CAP_N_Z8CGx83D7yperR3OhMb-6YVrADxbZxocxSbpz9czKoO=w@mail.gmail.com>
 <20210517110208.lippuk4rv57cn6hj@steredhat>
In-Reply-To: <20210517110208.lippuk4rv57cn6hj@steredhat>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Mon, 17 May 2021 23:33:06 -0700
Message-ID: <CAP_N_Z9hC7a4pKVP=MM1+Nk0fgNECTUfCB-at09mD9EpW03Ukg@mail.gmail.com>
Subject: Re: Re: [RFC v2] virtio-vsock: add description for datagram type
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: cong.wang@bytedance.com, Xiongchun Duan <duanxiongchun@bytedance.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
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

On Mon, May 17, 2021 at 4:02 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Fri, May 14, 2021 at 11:55:29AM -0700, Jiang Wang . wrote:
> >On Fri, May 14, 2021 at 8:17 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >> On Thu, May 13, 2021 at 04:26:03PM -0700, Jiang Wang . wrote:
>
> [...]
>
> >> >I see. I will add some limit to dgram packets. Also, when the
> >> >virtqueues
> >> >are shared between stream and dgram, both of them need to grab a lock
> >> >before using the virtqueue, so one will not completely block another one.
> >>
> >> I'm not worried about the concurrent access that we definitely need to
> >> handle with a lock, but more about the uncontrolled packet sending that
> >> dgram might have, flooding the queues and preventing others from
> >> communicating.
> >
> >That is a valid concern. Let me explain how I would handle that if we
> >don't add two new virtqueues. For dgram, I also add a dgram_send_pkt_list,
> >which is similar to send_pkt_list for stream (and seqpacket). But there
> >is one difference. The dgram_send_pkt_list has a maximum size setting,
> >and keep tracking how many pkts are in the list. The track number
> >(dgram_send_pkt_list_size) is  increased when a packet is added
> >to the list and is decreased when a packet
> >is removed from the list and added to the virtqueue. In
> >virtio_transport_send_pkt, if the current
> >dgram_send_pkt_list_size is equal
> >to the maximum ( let's say 128), then it will not add to the
> >dgram_send_pkt_list and return an error to the application.
>
> For stream socket, we have the send_pkt_list and the send worker because
> the virtqueue can be full and the transmitter needs to wait available
> slots, because we can't discard packets.
>
> For dgram I think we don't need this, so we can avoid the
> dgram_send_pkt_list and directly enqueue packets in the virtqueue.
>
> If there are no slots available, we can simply drop the packet.
> In this way we don't have to put limits other than the available space
> in the virtqueue.

I considered this approach before. One question not clear to me is
whether we should call virtqueue_kick for every dgram packet. If I
am not wrong, each virtqueue_kick will lead to a vm_exit to the host.
If we call virtqueue_kick() for each dgram packet, the performance
might be bad when there are lots of packets. One idea is to set
a threshold and a timer to call virtqueue_kick(). When there are
lots of packets, we wait until a threshold. When there are few packets,
the timer will make sure those packets will be delivered not too late.

Any other ideas for virtqueue_kick? If the threshold plus timer is fine,
I can go this direction too.

> >
> >In this way, the number of pending dgram pkts to be sent is limited.
> >Then both stream and dgram sockets will compete to hold a lock
> >for the tx virtqueue. Depending on the linux scheduler, this competition
> >will be somewhat fair. As a result, dgram will not block stream completely.
> >It will compete and share the virtqueue with stream, but stream
> >can still send some pkts.
> >
> >Basically, the virtqueue becomes a first-come first-serve resource for
> >the stream and dgram. When both stream and dgram applications
> >have lots of data to send, dgram_send_pkt_list and send_pkt_list
> >will still be a limited size, and each will have some chance to send out
> >the data via virtqueue.  Does this address your concern?
> >
> >
> >> So having 2 dedicated queues could avoid a credit mechanism at all for
> >> connection-less sockets, and simply the receiver discards packets that
> >> it can't handle.
> >
> >With 2 dedicated queues, we still need some kind of accounting for
> >the dgram. Like the dgram_send_pkt_size I mentioned above.  Otherwise,
> >it will cause OOM. It is not a real credit mechanism, but code is similar
> >with or without 2 dedicated queues in my current prototype.
>
> I think in both cases we don't need an accounting, but we can drop
> packets if the virtqueue is full.
>
> It's still not clear to me where OOM may occur. Can you elaborate on
> this?

OOM depending on the implementation details. If we keep
dgram_send_pkt_list, and put no limitation,  it may increase indefinitely
and cause OOM. As long as we have some limitations or drop packets
quickly, then we should be fine.

> >
> >For receiver discarding packets part, could you explain more? I think
> >receiver discarding pkts code also is same with or without 2 dedicated
> >queues.
>
> Yep.
>
> > Both will use can_enqueue = virtio_transport_inc_rx_pkt(vvs, pkt);
> >to check if a packet should be discarded or not.
>
> I don't think we can use virtio_transport_inc_rx_pkt() for dgram.
> This is based on the credit mechanism (e.g. buf_alloc) that works when
> you have a connection oriented socket.
>
> With dgram you can have multiple transmitter for a single socket, so how
> we can exchange that information?
>
In my view, we don't need to exchange that information. Buf_alloc for
dgram is local to a receiving socket. The sending sockets do not know
about that. For receiving socket, it just checks if there is still buffer
available to decide to drop a packet or not. If multiple transmitter
send to a single socket, they will share the same buf_alloc, and packets
will be dropped randomly for those transmitters.

> If we reuse the VMCI implementation with skbuff, the sk_receive_skb()
> already checks if the sk_rcvbuf is full and discards the packet in this
> case, so we don't need an internal rx_queue.

OK.

> Maybe someday we should convert stream to skbuff too, it would make our
> lives easier.
>
Yeah.  I remember the original virtio vsock patch did use skb, but somehow
it  did not use skb anymore when merging to the upstream, not sure why.

Thanks,

Jiang

> Thanks,
> Stefano
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
