Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F4979063D
	for <lists.virtualization@lfdr.de>; Sat,  2 Sep 2023 10:35:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A6383AD2;
	Sat,  2 Sep 2023 08:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A6383AD2
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TiKxkF29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjLghBGyFBgE; Sat,  2 Sep 2023 08:35:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9ECF983ACF;
	Sat,  2 Sep 2023 08:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECF983ACF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1AAEC008C;
	Sat,  2 Sep 2023 08:35:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D517C0032
 for <virtualization@lists.linux-foundation.org>;
 Sat,  2 Sep 2023 08:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C827360BC1
 for <virtualization@lists.linux-foundation.org>;
 Sat,  2 Sep 2023 08:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C827360BC1
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=TiKxkF29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGtGKzQsVYcC
 for <virtualization@lists.linux-foundation.org>;
 Sat,  2 Sep 2023 08:35:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2DC060BB0
 for <virtualization@lists.linux-foundation.org>;
 Sat,  2 Sep 2023 08:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2DC060BB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693643733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tx/R4Ypx48aYWYb22H8fWrmat8EAEjJNpuQqM8wuIOk=;
 b=TiKxkF29hti+p/odHnOGHsw06IEmr0r1ZOZhc7BQiqswWKRhfTy98enttpiWuVHgfMttP5
 Kr2s3DC6bK4DiofDGIXMZkwgZXlYJYskGK+62eAMke9SQlvUAW4k076/zl7uEYgieRUMyP
 y+tgOvwgBidp3BuILG859EHOJZ/VGws=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-PzUU60ndNSeaJlcNwv9bLA-1; Sat, 02 Sep 2023 04:35:31 -0400
X-MC-Unique: PzUU60ndNSeaJlcNwv9bLA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2bcec24e8f8so31637521fa.1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 02 Sep 2023 01:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693643730; x=1694248530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tx/R4Ypx48aYWYb22H8fWrmat8EAEjJNpuQqM8wuIOk=;
 b=BZ8en8K6Qq4xImK7arE6E6xjx8sz1hX0jgbIK6/ouiriN59THXG6d12SXH3IVQeaEF
 n77AKoOuhNVXeaHJ49z3SyNu0p+389x6bUcf7sBh60+LMIuexc+jzXdNTrrwFk8PAgp9
 +UX/SnMacgEqVgh+IYvU7TDELuAbgI1P4gxuXUZuuT3coCdLkSavHoq3IupZHubAfQzR
 mqvITltVMekIMbnDkYGHsWL01vbnBjoBIQZa7zuwW8KM/91UpORfd6X/J884cqkpyOVg
 WTfLTm7RW3IaiZWWlKI4qJ1xQNVR5YKZkEE246Q0zJcxZTAfCT8FnZvjUYvNCcaQB31N
 MXcA==
X-Gm-Message-State: AOJu0YxcT3SjmfzTChR66Gp3cRyIjitSFGq9wkck3GWOQu6TNfLI/MD2
 mEHmt2ifjLlnwySLlhEVFCC+kbSJdP9XeswWQhB+gbNfoEmBdc5fxRUtN/LnxzPlxS4TOcMpPpc
 GZed366k35r9bNYBl9Cm3+dE3AMzEmTxjPbmbVIfALA==
X-Received: by 2002:a2e:9a8e:0:b0:2bc:b0ae:a9e5 with SMTP id
 p14-20020a2e9a8e000000b002bcb0aea9e5mr3448378lji.42.1693643730053; 
 Sat, 02 Sep 2023 01:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3zcbVZ6d3LCJHvU3yrSQgputZFAf847TTrPCn81lmpiszvcgxiC7s0VltNhGdY9owoKzF9w==
X-Received: by 2002:a2e:9a8e:0:b0:2bc:b0ae:a9e5 with SMTP id
 p14-20020a2e9a8e000000b002bcb0aea9e5mr3448365lji.42.1693643729668; 
 Sat, 02 Sep 2023 01:35:29 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f2:b100:fba1:19ce:4f7b:4008])
 by smtp.gmail.com with ESMTPSA id
 d6-20020adff2c6000000b0031980783d78sm7817569wrp.54.2023.09.02.01.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Sep 2023 01:35:28 -0700 (PDT)
Date: Sat, 2 Sep 2023 04:35:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH] virtio-vsock: add VIRTIO_VSOCK_F_DGRAM feature bit
Message-ID: <20230902043334-mutt-send-email-mst@kernel.org>
References: <20230829212945.3420727-1-bobby.eshleman@bytedance.com>
 <h6wtvcglyw55enk6shdogbfnw3m6zbmb4lv65uhznpwzqjw5sc@vc7clkjbxfep>
 <ZPLAip/TWqvWZ0hv@bullseye>
MIME-Version: 1.0
In-Reply-To: <ZPLAip/TWqvWZ0hv@bullseye>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, cong.wang@bytedance.com,
 Bobby Eshleman <bobby.eshleman@bytedance.com>, jiang.wang@bytedance.com,
 cohuck@redhat.com, virtualization@lists.linux-foundation.org,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
 arseny.krasnov@kaspersky.com
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

On Sat, Sep 02, 2023 at 04:56:42AM +0000, Bobby Eshleman wrote:
> On Fri, Sep 01, 2023 at 02:45:14PM +0200, Stefano Garzarella wrote:
> > On Tue, Aug 29, 2023 at 09:29:45PM +0000, Bobby Eshleman wrote:
> > > This adds support for datagrams to the virtio-vsock device.
> > > 
> > > virtio-vsock already supports stream and seqpacket types. The existing
> > > message types and header fields are extended to support datagrams.
> > > Semantic differences between the flow types are stated, as well as any
> > > additional requirements for devices and drivers implementing this
> > > feature.
> > > 
> > > Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
> > > ---
> > > device-types/vsock/description.tex | 95 +++++++++++++++++++++++++++---
> > > 1 file changed, 88 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> > > index 7d91d159872f..638dca8e5da1 100644
> > > --- a/device-types/vsock/description.tex
> > > +++ b/device-types/vsock/description.tex
> > > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> > > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> > > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> > > +\item[VIRTIO_VSOCK_F_DGRAM (3)] datagram socket type is supported.
> > > \end{description}
> > > 
> > > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> > > @@ -167,17 +168,22 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> > > consists of a (cid, port number) tuple. The header fields used for this are
> > > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> > > 
> > > -Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> > > -for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
> > > +
> > > +Currently stream, seqpacket, and datagram sockets are supported. \field{type} is
> > > +1 (VIRTIO_VSOCK_TYPE_STREAM) for stream socket types, 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for
> > > +seqpacket socket types, and 3 (VIRTIO_VSOCK_TYPE_DGRAM) for datagram socket types.
> > > 
> > > \begin{lstlisting}
> > > #define VIRTIO_VSOCK_TYPE_STREAM    1
> > > #define VIRTIO_VSOCK_TYPE_SEQPACKET 2
> > > +#define VIRTIO_VSOCK_TYPE_DGRAM     3
> > > \end{lstlisting}
> > > 
> > > Stream sockets provide in-order, guaranteed, connection-oriented delivery
> > > without message boundaries. Seqpacket sockets provide in-order, guaranteed,
> > > -connection-oriented delivery with message and record boundaries.
> > > +connection-oriented delivery with message and record boundaries. Datagram
> > > +sockets provide connection-less, best-effort delivery of messages, with no
> > > +order or reliability guarantees.
> > > 
> > > \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> > > \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
> > > @@ -203,16 +209,19 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> > > previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This allows
> > > communicating updates any time a change in buffer space occurs.
> > > 
> > > +\field{buf_alloc} and \field{fwd_cnt} are reserved for future use by datagram
> > > +sockets. These fields are not used for datagram buffer space management.
> > > +
> > > \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> > > -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > > -sufficient free buffer space for the payload.
> > > +For stream and seqpacket flows, VIRTIO_VSOCK_OP_RW data packets MUST only be
> > > +transmitted when the peer has sufficient free buffer space for the payload.
> > > 
> > > All packets associated with a stream flow MUST contain valid information in
> > > \field{buf_alloc} and \field{fwd_cnt} fields.
> > > 
> > > \devicenormative{\paragraph}{Device Operation: Buffer Space
> > > Management}{Device Types / Socket Device / Device Operation / Buffer
> > > Space Management}
> > > -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > > -sufficient free buffer space for the payload.
> > > +For stream and seqpacket flows, VIRTIO_VSOCK_OP_RW data packets MUST only be
> > > +transmitted when the peer has sufficient free buffer space for the payload.
> > > 
> > > All packets associated with a stream flow MUST contain valid information in
> > > \field{buf_alloc} and \field{fwd_cnt} fields.
> > > @@ -299,6 +308,78 @@ \subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Devic
> > > #define VIRTIO_VSOCK_SEQ_EOR (1 << 1)
> > > \end{lstlisting}
> > > 
> > > +\subsubsection{Datagram Sockets}\label{sec:Device Types / Socket Device / Device Operation / Datagram Sockets}
> > > +
> > > +\drivernormative{\paragraph}{Device Operation: Packet Fragmentation}{Device Types / Socket Device / Datagram Sockets / Fragmentation}
> > > +
> > > +Drivers MAY disassemble packets into smaller fragments. If drivers fragment a
> > > +packet, they MUST follow the fragmentation rules described in section
> > > +\ref{sec:Device Types / Socket Device / Device Operation / Datagram Sockets / Fragmentation}.
> > > +
> > > +Drivers MUST support assembly of received packet fragments according to the
> > > +fragmentation rules described in section
> > > +\ref{sec:Device Types / Socket Device / Device Operation / Datagram
> > > Sockets / Fragmentation}.
> > > +
> > > +\devicenormative{\paragraph}{Device Operation: Packet Fragmentation}{Device Types / Socket Device / Datagram Sockets / Fragmentation}
> > > +
> > > +Devices MAY disassemble packets into smaller fragments. If devices fragment a
> > > +packet, they MUST follow the fragmentation rules described in section
> > > +\ref{sec:Device Types / Socket Device / Device Operation / Datagram Sockets / Fragmentation}.
> > > +
> > > +Devices MUST support assembly of received packet fragments according to the
> > > +fragmentation rules described in section
> > > +\ref{sec:Device Types / Socket Device / Device Operation / Datagram Sockets / Fragmentation}.
> > > +
> > > +\drivernormative{\paragraph}{Device Operation: Packet Dropping}{Device Types / Socket Device / Datagram Sockets / Dropping}
> > > +
> > > +The driver MAY drop received packets with no notification to the device. This
> > > +can happen if, for example, there are insufficient resources or no socket
> > > +exists for the destination address.
> > > +
> > > +\devicenormative{\paragraph}{Device Operation: Packet Dropping}{Device Types / Socket Device / Datagram Sockets / Dropping}
> > > +
> > > +The device MAY drop received packets with no notification to the driver. This
> > > +can happen if, for example, there are insufficient resources or no socket
> > > +exists for the destination address.
> > 
> > Should we provide some notification if the socket does not exist at the
> > destination?
> > 
> 
> Yes, I think so. I believe a start/stop congestion notification scheme
> actually manages this issue well.
> 
> For example, the source begins sending packets to a destination.
> 
> The destination finds that there exists no socket for that destination
> address. The destination sends a "stop" notification to the source that
> contains the address in question. Meanwhile, packets are still coming in
> but they are being dropped.
> 
> The source receives the "stop" notification with the address and adds it
> to the "stopped destinations" list. Any new packet destination address
> will be compared to that list. Any matches will be dropped before
> sending (and ideally, before wasting time allocating the packet).
> 
> Only when a socket is bound to an address that matches a "stopped"
> address does the destination send a "start" notification to any source
> it has previusly sent a "stop" notification to.
> 
> Once "start" is received, flow may resume as normal.

Again, dropping as control flow tactic has a bunch of problems.
Blocking senders sounds more reasonable.


> > > +
> > > +\paragraph{Datagram Fragmentation}\label{sec:Device Types / Socket Device / Device Operation / Datagram Sockets / Fragmentation}
> > > +
> > > +\field{flags} may have the following bit set:
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_VSOCK_DGRAM_EOM (1 << 0)
> > > +\end{lstlisting}
> > > +
> > > +When the header \field{flags} field bit VIRTIO_VSOCK_DGRAM_EOM (bit 0) is set,
> > > +it indicates that the current payload is the end of a datagram fragment
> > > OR that
> > > +the current payload is an entire datagram packet.
> > 
> > In the destination, if we discard some fragments, then could we
> > reconstruct a different datagram from the one sent?
> > 
> > Is that anything acceptable?
> > 
> 
> Dropping fragments should be explicitly disallowed. The sender is
> explicitly disallowed from NOT placing fragments on the virtqueue, but I
> see that I am missing the piece that states that they may not be dropped
> on the receive side.
> 
> I think it is worth mentioning that implicit in this spec is that
> socket-to-socket dgram communication is unreliable, but device-to-driver
> (and vice versa) is still reliable. That is, we can rely at least on the
> virtqueues to work... and if they fail then the device/driver can simply
> requeue (think send_pkt_queue in Linux)... so there is some reliability
> at the lowest layer.

Well you have this weird timeout thing for some reason.

> > Thanks,
> > Stefano
> > 
> 
> Thanks!
> Bobby

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
