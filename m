Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 712A23FFB69
	for <lists.virtualization@lfdr.de>; Fri,  3 Sep 2021 09:58:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEE17406B9;
	Fri,  3 Sep 2021 07:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBtS8CmwxbNU; Fri,  3 Sep 2021 07:58:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1441840762;
	Fri,  3 Sep 2021 07:58:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A35AEC001A;
	Fri,  3 Sep 2021 07:58:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05B75C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Sep 2021 07:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0139E61536
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Sep 2021 07:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxRLCVClGSKY
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Sep 2021 07:58:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7A04614EB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Sep 2021 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630655893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Czt2hzeAS34XxG7pU55XozMlL/oTM6g0elbY9j1CGs=;
 b=Fvtm7fBHX2dBeT9wKXhlzTvPpcqmPflOmDpLEEQ4YUgimoEiCYybz2wMBVzYhlMwKY6Aq8
 JwJOI+Kw1G0h91zmrQ/+uAX6/i5DzhnSFutUUlQiOiVmJs435g7vtB8F9+ixsJ7GN3M4xn
 OJKvv/a5HBV97iV7dCcppJj0qVH+XHk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-nLKUVGgEPaWiE6sy9CSZ7A-1; Fri, 03 Sep 2021 03:58:12 -0400
X-MC-Unique: nLKUVGgEPaWiE6sy9CSZ7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so1603013wmc.9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Sep 2021 00:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Czt2hzeAS34XxG7pU55XozMlL/oTM6g0elbY9j1CGs=;
 b=XVdTeMz0C/E9buzMOv347jLwYqMzxZNBgVWFT34GGiFMY9HfuZUWB0OdHeBuBkREIm
 9eMw6uKAgg1n5YPfYgZwgOXEzcLlHC1yqWfRfHkjSByg2brhdIr/2AtdsgNI/Ko4EvEu
 LXlomyq+xrZhLIW/+C1MwPRxOMupJDBtxdjdyTcF9/cfgVLwHAo/koHAARuXg3kpmlXW
 TtdobGfwSOk8yOJ7M2gikK3PHSoWC0IiwXx2Y+5rkcXuI0b3j9J9FmlNjNtma3IpSAFD
 FhFHLU74DnGLgLdGScXLq3nkqMtYICfapXj78e5UL65p09h3TMJS7+lTEdONPtMdeDGv
 nCow==
X-Gm-Message-State: AOAM532yiPN1vnc8C1wPPs/q2q08M9L/ra7rSHp4USRo2l24yz32Fyjk
 2UqN6ElQA3inzOQacgOkzMoDalQw3g4l7wrJX5laKingLVdiuIFJf83yQkmImSX77QaTRKcIJdg
 UbzpyBp8xnT8aCJBOy3mTB8EaMmfDa9mSx/VVfPwd7g==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr7014212wme.149.1630655891144; 
 Fri, 03 Sep 2021 00:58:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlQeKtOfuq7uhYna3re392zCgXjMjtA6EpI7gHLbi6xcZq5lPK3qURbsqUsogWvo+VZmeAvw==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr7014170wme.149.1630655890733; 
 Fri, 03 Sep 2021 00:58:10 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207f:7f47:ccd3:7600:6a2d:c5a])
 by smtp.gmail.com with ESMTPSA id n66sm3445119wmn.2.2021.09.03.00.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 00:58:10 -0700 (PDT)
Date: Fri, 3 Sep 2021 03:58:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [External] Re: [virtio-comment] [PATCH v5] virtio-vsock: add
 description for datagram type
Message-ID: <20210903035741-mutt-send-email-mst@kernel.org>
References: <20210610181203.979686-1-jiang.wang@bytedance.com>
 <20210831211205-mutt-send-email-mst@kernel.org>
 <CAP_N_Z_3mtE5AedbU=u6cKpu8rpVUD09shQPYB-5-=zV1uOdww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z_3mtE5AedbU=u6cKpu8rpVUD09shQPYB-5-=zV1uOdww@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Cong Wang <cong.wang@bytedance.com>,
 Xiongchun Duan <duanxiongchun@bytedance.com>, cohuck@redhat.com,
 virtualization@lists.linux-foundation.org,
 Yongji Xie <xieyongji@bytedance.com>,
 =?utf-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org,
 asias@redhat.com, Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jorgen Hansen <jhansen@vmware.com>
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

On Tue, Aug 31, 2021 at 06:24:34PM -0700, Jiang Wang . wrote:
> On Tue, Aug 31, 2021 at 6:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jun 10, 2021 at 06:12:03PM +0000, Jiang Wang wrote:
> > > Add supports for datagram type for virtio-vsock. Datagram
> > > sockets are connectionless and unreliable. To avoid contention
> > > with stream and other sockets, add two more virtqueues and
> > > a new feature bit to identify if those two new queues exist or not.
> > >
> > > Also add descriptions for resource management of datagram, which
> > > does not use the existing credit update mechanism associated with
> > > stream sockets.
> > >
> > > Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> >
> > Is this going anywhere? Linux with this included was just released but
> > if no one has the cycles to work on the spec then it's not too late to
> > disable the guest code in a stable@ patch.
> >
> 
> Hi Michael,
> 
> I am still working on this (fixing the migration issue), but would
> like to know if there are any more
> comments or not.  I did not notice any commits related to vsock
> dgram merged to Linux kernel, could you show me the commit link?
> 
> Thanks and regards,
> 
> Jiang

My bad I was thinking of seqpacket. I see that description
was not posted as well, so all is well.

> > > ---
> > >
> > > V2: addressed the comments for the previous version.
> > > V3: add description for the mergeable receive buffer.
> > > V4: add a feature bit for stream and reserver a bit for seqpacket.
> > > Fix mrg_rxbuf related sentences.
> > > V5: removed mergeable rx buffer part. It will go to a
> > > separate patch. Fixed comments about tx, rx, feature bit etc.
> > >
> > >  virtio-vsock.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++++---------
> > >  1 file changed, 60 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> > > index da7e641..26a62ac 100644
> > > --- a/virtio-vsock.tex
> > > +++ b/virtio-vsock.tex
> > > @@ -9,14 +9,37 @@ \subsection{Device ID}\label{sec:Device Types / Socket Device / Device ID}
> > >
> > >  \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
> > >  \begin{description}
> > > -\item[0] rx
> > > -\item[1] tx
> > > +\item[0] stream rx
> > > +\item[1] stream tx
> > > +\item[2] datagram rx
> > > +\item[3] datagram tx
> > > +\item[4] event
> > > +\end{description}
> > > +The virtio socket device uses 5 queues if feature bit VIRTIO_VSOCK_F_DRGAM is set. Otherwise, it
> > > +only uses 3 queues, as the following.
> > > +
> > > +\begin{description}
> > > +\item[0] stream rx
> > > +\item[1] stream tx
> > >  \item[2] event
> > >  \end{description}
> > >
> > > +When behavior differs between stream and datagram rx/tx virtqueues
> > > +their full names are used. Common behavior is simply described in
> > > +terms of rx/tx virtqueues and applies to both stream and datagram
> > > +virtqueues.
> > > +
> > >  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > >
> > > -There are currently no feature bits defined for this device.
> > > +\begin{description}
> > > +\item[VIRTIO_VSOCK_F_STREAM (0)] Device has support for stream socket type.
> > > +\end{description}
> > > +
> > > +\begin{description}
> > > +\item[VIRTIO_VSOCK_F_DGRAM (2)] Device has support for datagram socket type.
> > > +\end{description}
> > > +
> > > +If no feature bits are defined, assume device only supports stream socket type.
> > >
> > >  \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
> > >
> > > @@ -107,6 +130,9 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> > >
> > >  \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
> > >
> > > +Flow control applies to stream sockets; datagram sockets do not have
> > > +flow control.
> > > +
> > >  The tx virtqueue carries packets initiated by applications and replies to
> > >  received packets.  The rx virtqueue carries packets initiated by the device and
> > >  replies to previously transmitted packets.
> > > @@ -140,12 +166,15 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> > >  consists of a (cid, port number) tuple. The header fields used for this are
> > >  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> > >
> > > -Currently only stream sockets are supported. \field{type} is 1 for stream
> > > -socket types.
> > > +Currently stream and datagram (dgram) sockets are supported. \field{type} is 1 for stream
> > > +socket types. \field{type} is 3 for dgram socket types.
> > >
> > >  Stream sockets provide in-order, guaranteed, connection-oriented delivery
> > >  without message boundaries.
> > >
> > > +Datagram sockets provide unordered, unreliable, connectionless messages
> > > +with message boundaries and a maximum length.
> > > +
> > >  \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> > >  \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
> > >  stream sockets. The guest and the device publish how much buffer space is
> > > @@ -162,7 +191,7 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> > >  u32 peer_free = peer_buf_alloc - (tx_cnt - peer_fwd_cnt);
> > >  \end{lstlisting}
> > >
> > > -If there is insufficient buffer space, the sender waits until virtqueue buffers
> > > +For stream sockets, if there is insufficient buffer space, the sender waits until virtqueue buffers
> > >  are returned and checks \field{buf_alloc} and \field{fwd_cnt} again. Sending
> > >  the VIRTIO_VSOCK_OP_CREDIT_REQUEST packet queries how much buffer space is
> > >  available. The reply to this query is a VIRTIO_VSOCK_OP_CREDIT_UPDATE packet.
> > > @@ -170,22 +199,33 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> > >  previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This allows
> > >  communicating updates any time a change in buffer space occurs.
> > >
> > > +Unlike stream sockets, dgram sockets do not use VIRTIO_VSOCK_OP_CREDIT_UPDATE or
> > > +VIRTIO_VSOCK_OP_CREDIT_REQUEST packets. The dgram buffer management
> > > +is split to two parts: sender side and receiver side. For the sender side, if the
> > > +virtqueue is full, the packet will be dropped.
> > > +For the receiver side, the packet is dropped by the receiver if there is no space in the
> > > +receive buffer.
> > > +
> > >  \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> > > -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > > -sufficient free buffer space for the payload.
> > > +For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > > +sufficient free buffer space for the payload. For dgram sockets, VIRTIO_VSOCK_OP_RW data packets
> > > +MAY be transmitted when the peer rx buffer is full. Then the packet will be dropped by the peer,
> > > +and driver will not get any notification.
> > >
> > >  All packets associated with a stream flow MUST contain valid information in
> > >  \field{buf_alloc} and \field{fwd_cnt} fields.
> > >
> > >  \devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> > > -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > > -sufficient free buffer space for the payload.
> > > +For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > > +sufficient free buffer space for the payload. For dgram sockets, VIRTIO_VSOCK_OP_RW data packets
> > > +MAY be transmitted when the peer rx buffer is full. Then the packet will be dropped by the peer,
> > > +and the device will not get any notification.
> > >
> > >  All packets associated with a stream flow MUST contain valid information in
> > >  \field{buf_alloc} and \field{fwd_cnt} fields.
> > >
> > >  \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / Device Operation / Receive and Transmit}
> > > -The driver queues outgoing packets on the tx virtqueue and incoming packet
> > > +The driver queues outgoing packets on the tx virtqueue and allocates incoming packet
> > >  receive buffers on the rx virtqueue. Packets are of the following form:
> > >
> > >  \begin{lstlisting}
> > > @@ -195,6 +235,7 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> > >  };
> > >  \end{lstlisting}
> > >
> > > +
> > >  Virtqueue buffers for outgoing packets are read-only. Virtqueue buffers for
> > >  incoming packets are write-only.
> > >
> > > @@ -240,6 +281,14 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> > >  destination) address tuple for a new connection while the other peer is still
> > >  processing the old connection.
> > >
> > > +\subsubsection{Datagram Sockets}\label{sec:Device Types / Socket Device / Device Operation / Datagram Sockets}
> > > +
> > > +Datagram (dgram) sockets are connectionless and unreliable. The sender just sends
> > > +a message to the peer and hopes it will be delivered. A VIRTIO_VSOCK_OP_RST reply is sent if
> > > +a receiving socket does not exist on the destination.
> > > +If the transmission or receiving buffers are full, the packets
> > > +are dropped.
> > > +
> > >  \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Operation / Device Events}
> > >
> > >  Certain events are communicated by the device to the driver using the event
> > > --
> > > 2.11.0
> > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
