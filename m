Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D83AC3913E6
	for <lists.virtualization@lfdr.de>; Wed, 26 May 2021 11:41:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A0A4400E9;
	Wed, 26 May 2021 09:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvMmYTfazjhz; Wed, 26 May 2021 09:41:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 894A040208;
	Wed, 26 May 2021 09:41:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27DE3C0001;
	Wed, 26 May 2021 09:41:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 499F1C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2423A401B9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJVsVjKMAfHD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:41:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9FB8400CA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622022074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XjoV8p+F6OWqp3hLqtsXYBnqBR0X08OEsrzw0sYFRVE=;
 b=cRAjdsE92XEDIOiHiNPsGL/VRQwi6vSkHBFjvaatmhOKlHXHyKtBKRlG2phKuE/ub25VnS
 QJCQMYwL1+qyZAEanYqBeQTQs0Z43wu1Qc/dv+5p/GDmXTQvGQBBOhc06N0HeNgFMc0lHA
 3GmTMOCWKArQS7D1r6eJ1QcApp/gv3A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-xATnLiXXN-6rKsia8Z-3ug-1; Wed, 26 May 2021 05:41:07 -0400
X-MC-Unique: xATnLiXXN-6rKsia8Z-3ug-1
Received: by mail-wr1-f71.google.com with SMTP id
 d12-20020adfc3cc0000b029011166e2f1a7so115843wrg.19
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 02:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XjoV8p+F6OWqp3hLqtsXYBnqBR0X08OEsrzw0sYFRVE=;
 b=EWYmYrfDq5bdJTG5W507iIrQ04u4PoeC4d60hMwM0YxOhAvhM5rJvYQAXKfmdqVnMM
 j7Ryl4sY9ZlMUM344ukBtZNZkGiEVL9BaUkx3V2+zjWQakZrisigOGK8vPfLH9OR+K68
 ypgYVFPDEMcXID/d0xfq79BhlHZFg2BNw/PFHc4MBusb2ENPoniUuw3XcCVJtLKEJGnB
 RCcJZYi4yqlE2fRrtXrN9HbY/tvMDpfF5uFvs92DxhJLEGXKIkO42kWUbv/UUuqD7T0N
 8Fd5BklzoskViu/LoIovWCJX3Ak4w1psLsFkwdzf9q3RR8dh1voIzzMW4ZJNG2HeK7oT
 epQA==
X-Gm-Message-State: AOAM531SOgtcF6yQBt+txErPIm7s2zGNwDsrlKiEXXpmxA4ooObyJRY4
 6uKhQh7CooWvojdxBCu+23/1Lf+eUc1dr8H9Rq8upLA7KQYv0LvO+MoP1inEStMFgX7XISBvRr0
 Zsib9FFlSz43f2mcwlwtoXpxiPvyv4ZiFYNyo4L9d5Q==
X-Received: by 2002:adf:8b4a:: with SMTP id v10mr31499604wra.274.1622022066167; 
 Wed, 26 May 2021 02:41:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW/cuv0naBlqtl7chypXlnSQ5qmZEi1JlOiND6HRPFeLjWfZH1IO1iQZHr1hQGG/e2BRmlEA==
X-Received: by 2002:adf:8b4a:: with SMTP id v10mr31499569wra.274.1622022065872; 
 Wed, 26 May 2021 02:41:05 -0700 (PDT)
Received: from redhat.com ([2a10:8006:fcda:0:90d:c7e7:9e26:b297])
 by smtp.gmail.com with ESMTPSA id x16sm19214719wrp.6.2021.05.26.02.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 02:41:05 -0700 (PDT)
Date: Wed, 26 May 2021 05:41:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC v3] virtio-vsock: add description for datagram type
Message-ID: <20210526053954-mutt-send-email-mst@kernel.org>
References: <20210522234440.2594048-1-jiang.wang@bytedance.com>
 <20210526090057.n3r4tf7cvmlgtiak@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210526090057.n3r4tf7cvmlgtiak@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: cong.wang@bytedance.com, duanxiongchun@bytedance.com,
 Jiang Wang <jiang.wang@bytedance.com>, cohuck@redhat.com,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 chaiwen.cc@bytedance.com, stefanha@redhat.com,
 virtio-comment@lists.oasis-open.org, asias@redhat.com,
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

Hmm that's insufficient unfortunately.  According to our bylaws we need
the original contributor to send it to
virtio-comment@lists.oasis-open.org

Jiang can you do it pls? Pls note it's a subscriber-only list.

Thanks!


On Wed, May 26, 2021 at 11:00:57AM +0200, Stefano Garzarella wrote:
> Hi Jiang,
> I think we should discuss this changes on
> virtio-comment@lists.oasis-open.org, so I CCed the list.
> 
> 
> On Sat, May 22, 2021 at 11:44:40PM +0000, Jiang Wang wrote:
> > From: "jiang.wang" <jiang.wang@bytedance.com>
> > 
> > Add supports for datagram type for virtio-vsock. Datagram
> > sockets are connectionless and unreliable. To avoid contention
> > with stream and other sockets, add two more virtqueues and
> > a new feature bit to identify if those two new queues exist or not.
> > 
> > Also add descriptions for resource management of datagram, which
> > does not use the existing credit update mechanism associated with
> > stream sockets.
> > 
> > Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> > ---
> > V2: addressed the comments for the previous version.
> > V3: add description for the mergeable receive buffer.
> > 
> > virtio-vsock.tex | 137 +++++++++++++++++++++++++++++++++++++++++++++++++------
> > 1 file changed, 124 insertions(+), 13 deletions(-)
> > 
> > diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> > index da7e641..7eb3596 100644
> > --- a/virtio-vsock.tex
> > +++ b/virtio-vsock.tex
> > @@ -9,14 +9,36 @@ \subsection{Device ID}\label{sec:Device Types / Socket Device / Device ID}
> > 
> > \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
> > \begin{description}
> > -\item[0] rx
> > -\item[1] tx
> > +\item[0] stream rx
> > +\item[1] stream tx
> > +\item[2] datagram rx
> > +\item[3] datagram tx
> > +\item[4] event
> > +\end{description}
> > +The virtio socket device uses 5 queues if feature bit VIRTIO_VSOCK_F_DRGAM is set. Otherwise, it
> > +only uses 3 queues, as the following.
> > +
> > +\begin{description}
> > +\item[0] stream rx
> > +\item[1] stream tx
> > \item[2] event
> > \end{description}
> > 
> > +When behavior differs between stream and datagram rx/tx virtqueues
> > +their full names are used. Common behavior is simply described in
> > +terms of rx/tx virtqueues and applies to both stream and datagram
> > +virtqueues.
> > +
> > \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > 
> > -There are currently no feature bits defined for this device.
> > +\begin{description}
> > +\item[VIRTIO_VSOCK_F_DGRAM (0)] Device has support for datagram socket type.
> > +\end{description}
> 
> As suggested by Michael here [1] we should add also a feature bit for
> stream, and maybe is better to reserve bit 0 for it.
> 
> Arseny already sent an implementation of SEQPACKET using bit 1 for
> VIRTIO_VSOCK_F_SEQPACKET, so I think we can use bit 2 for DGRAM and bit 3
> for MRG_RXBUF.
> 
> [1]
> https://lists.oasis-open.org/archives/virtio-comment/202104/msg00016.html
> 
> > +
> > +\begin{description}
> > +\item[VIRTIO_VSOCK_F_MRG_RXBUF (1)] Driver can merge receive buffers.
> > +\end{description}
> > +
> > 
> > \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
> > 
> > @@ -64,6 +86,8 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> > 
> > Packets transmitted or received contain a header before the payload:
> > 
> > +If feature VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the following header.
> > +
> > \begin{lstlisting}
> > struct virtio_vsock_hdr {
> > 	le64 src_cid;
> > @@ -79,6 +103,15 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> > };
> > \end{lstlisting}
> > 
> > +If feature VIRTIO_VSOCK_F_MRG_RXBUF is negotianted, use the following header.
> > +\begin{lstlisting}
> > +struct virtio_vsock_hdr_mrg_rxbuf {
> > +	struct virtio_vsock_hdr hdr;
> > +	le16 num_buffers;
> > +};
> > +\end{lstlisting}
> > +
> > +
> > The upper 32 bits of src_cid and dst_cid are reserved and zeroed.
> > 
> > Most packets simply transfer data but control packets are also used for
> > @@ -107,6 +140,9 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> > 
> > \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
> > 
> > +Flow control applies to stream sockets; datagram sockets do not have
> > +flow control.
> > +
> > The tx virtqueue carries packets initiated by applications and replies to
> > received packets.  The rx virtqueue carries packets initiated by the device and
> > replies to previously transmitted packets.
> > @@ -140,12 +176,15 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> > consists of a (cid, port number) tuple. The header fields used for this are
> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and
> > \field{dst_port}.
> > 
> > -Currently only stream sockets are supported. \field{type} is 1 for stream
> > -socket types.
> > +Currently stream and datagram (dgram) sockets are supported. \field{type} is 1 for stream
> > +socket types. \field{type} is 3 for dgram socket types.
> > 
> > Stream sockets provide in-order, guaranteed, connection-oriented
> > delivery
> > without message boundaries.
> > 
> > +Datagram sockets provide unordered, unreliable, connectionless messages
> > +with message boundaries and a maximum length.
> > +
> > \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> > \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
> > stream sockets. The guest and the device publish how much buffer space is
> > @@ -162,7 +201,7 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> > u32 peer_free = peer_buf_alloc - (tx_cnt - peer_fwd_cnt);
> > \end{lstlisting}
> > 
> > -If there is insufficient buffer space, the sender waits until virtqueue
> > buffers
> > +For stream sockets, if there is insufficient buffer space, the sender waits until virtqueue buffers
> > are returned and checks \field{buf_alloc} and \field{fwd_cnt} again. Sending
> > the VIRTIO_VSOCK_OP_CREDIT_REQUEST packet queries how much buffer space is
> > available. The reply to this query is a VIRTIO_VSOCK_OP_CREDIT_UPDATE
> > packet.
> > @@ -170,22 +209,52 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> > previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This allows
> > communicating updates any time a change in buffer space occurs.
> > 
> > +Unlike stream sockets, dgram sockets do not use VIRTIO_VSOCK_OP_CREDIT_UPDATE or
> > +VIRTIO_VSOCK_OP_CREDIT_REQUEST packets. The dgram buffer management
> > +is split to two parts: tx side and rx side. For the tx side, if the
> > +virtqueue is full, the packet will be dropped.
> > +For the rx side, dgram also uses the \field{buf_alloc}. If it is full, the packet
> > +is dropped by the receiver.
> > +
> > +\drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
> > +\begin{itemize}
> > +\item If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, the driver SHOULD populate the receive queue(s)
> > +      with buffers of at least 1526 bytes for stream sockets and 4096 bytes for datagram sockets.
> > +\item If VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, each buffer MUST be at
> > +least the size of the struct virtio_vsock_hdr.
>                                ^
>                                Should it be virtio_vsock_hdr_mrg_rxbuf?
> 
> > +\end{itemize}
> > +
> > +\begin{note}
> > +Obviously each buffer can be split across multiple descriptor elements.
> > +\end{note}
> > +
> > +\devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
> > +The device MUST set \field{num_buffers} to the number of descriptors used when
> > +transmitting the  packet.
> > +
> > +The device MUST use only a single descriptor if
> > VIRTIO_VSOCK_F_MRG_RXBUF
> > +is not negotiated.
> > +
> > \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> > -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > -sufficient free buffer space for the payload.
> > +For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > +sufficient free buffer space for the payload. For dgram sockets, VIRTIO_VSOCK_OP_RW data packets
> > +MAY be transmitted when the peer rx buffer is full. Then the packet will be dropped by the peer,
> > +and driver will not get any notification.
> > 
> > All packets associated with a stream flow MUST contain valid information in
> > \field{buf_alloc} and \field{fwd_cnt} fields.
> > 
> > \devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> > -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > -sufficient free buffer space for the payload.
> > +For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> > +sufficient free buffer space for the payload. For dgram sockets, VIRTIO_VSOCK_OP_RW data packets
> > +MAY be transmitted when the peer rx buffer is full. Then the packet
> > will be dropped by the peer,
> > +and the device will not get any notification.
> > 
> > All packets associated with a stream flow MUST contain valid information
> > in
> > \field{buf_alloc} and \field{fwd_cnt} fields.
> > 
> > \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / Device Operation / Receive and Transmit}
> > -The driver queues outgoing packets on the tx virtqueue and incoming packet
> > +The driver queues outgoing packets on the tx virtqueue and allocates incoming packet
> > receive buffers on the rx virtqueue. Packets are of the following form:
> > 
> > \begin{lstlisting}
> > @@ -198,21 +267,55 @@ \subsubsection{Receive and
> > Transmit}\label{sec:Device Types / Socket Device / De
> > Virtqueue buffers for outgoing packets are read-only. Virtqueue buffers
> > for
> > incoming packets are write-only.
> > 
> > +When transmitting packets to the device, \field{num_buffers} is not used.
> 
> Should we add a new `struct virtio_vsock_packet` description used when
> VIRTIO_VSOCK_F_MRG_RXBUF is negotiated?
> 
> > +
> > +\begin{enumerate}
> > +\item \field{num_buffers} indicates how many descriptors
> > +  this packet is spread over (including this one): this will
> > +  always be 1 if VIRTIO_VSOCK_F_MRG_RXBUF was not negotiated.
> 
> If VIRTIO_VSOCK_F_MRG_RXBUF was not negotiated, we use only virtio_vsock_hdr
> where there isn't `num_buffers`, so it is not clear to me this statement.
> 
> > +  This allows receipt of large packets without having to allocate large
> > +  buffers: a packet that does not fit in a single buffer can flow
> > +  over to the next buffer, and so on. In this case, there will be
> > +  at least \field{num_buffers} used buffers in the virtqueue, and the device
> > +  chains them together to form a single packet in a way similar to
> > +  how it would store it in a single buffer spread over multiple
> > +  descriptors.
> > +  The other buffers will not begin with a struct virtio_vsock_hdr.
> > +
> > +\item If
> > +  \field{num_buffers} is one, then the entire packet will be
> > +  contained within this buffer, immediately following the struct
> > +  virtio_vsock_hdr.
> > +\end{enumerate}
> > +
> > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> > 
> > The \field{guest_cid} configuration field MUST be used as the source CID when
> > sending outgoing packets.
> > 
> > -A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> > +For stream and datagram sockets, A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> > unknown \field{type} value.
> > 
> > \devicenormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> > 
> > The \field{guest_cid} configuration field MUST NOT contain a reserved CID as listed in \ref{sec:Device Types / Socket Device / Device configuration layout}.
> > 
> > -A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> > +For stream and datagram sockets, A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> > unknown \field{type} value.
> > 
> > +If VIRTIO_VSOCK_F_MRG_RXBUF has been negotiated, the device MUST set
> > +\field{num_buffers} to indicate the number of buffers
> > +the packet (including the header) is spread over.
> > +
> > +If a receive packet is spread over multiple buffers, the device
> > +MUST use all buffers but the last (i.e. the first $\field{num_buffers} -
> > +1$ buffers) completely up to the full length of each buffer
> > +supplied by the driver.
> > +
> > +The device MUST use all buffers used by a single receive
> > +packet together, such that at least \field{num_buffers} are
> > +observed by driver as used.
> > +
> > \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device Operation / Stream Sockets}
> > 
> > Connections are established by sending a VIRTIO_VSOCK_OP_REQUEST packet. If a
> > @@ -240,6 +343,14 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> > destination) address tuple for a new connection while the other peer is still
> > processing the old connection.
> > 
> > +\subsubsection{Datagram Sockets}\label{sec:Device Types / Socket Device / Device Operation / Datagram Sockets}
> > +
> > +Datagram (dgram) sockets are connectionless and unreliable. The sender
> > just sends
> > +a message to the peer and hopes it will be delivered. A VIRTIO_VSOCK_OP_RST reply is sent if
> > +a receiving socket does not exist on the destination.
> > +If the transmission or receiving buffers are full, the packets
> > +are dropped.
> > +
> > \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Operation / Device Events}
> > 
> > Certain events are communicated by the device to the driver using the event
> > -- 
> > 2.11.0
> > 
> 
> Thanks,
> Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
