Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7035EE02
	for <lists.virtualization@lfdr.de>; Wed, 14 Apr 2021 09:07:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC247400F3;
	Wed, 14 Apr 2021 07:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CxyHhogtYpL; Wed, 14 Apr 2021 07:07:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 785BF400FA;
	Wed, 14 Apr 2021 07:07:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 075C1C0012;
	Wed, 14 Apr 2021 07:07:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 985FAC000A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 07:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AD5540F1B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 07:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ACey7rl1pV0A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 07:07:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B217540F12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 07:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618384048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dsz3AfcU+IM9cxANBcZkUwuLtQwGIyykS8NTAPByuJk=;
 b=g2HIlXUOgarN0LqbtmeBi+nTgkvc1ENPPvWpLsUbo0IlqJJV7nSQOiGuw4ifk3Z9ebZFdM
 c/k4Btax2iIPP1GwVmPe6Kg4lR4zWfa0K0LS8KjK1OtWpeL6TOgtUNZR+ahkfAmpSwcMRV
 Z1ykfLxbFaLcxbITPy2a2c0GC95zKkQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-hlHyWZMFMbu6eYQBT1yT_g-1; Wed, 14 Apr 2021 03:07:25 -0400
X-MC-Unique: hlHyWZMFMbu6eYQBT1yT_g-1
Received: by mail-ej1-f71.google.com with SMTP id t23so144890ejx.11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 00:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dsz3AfcU+IM9cxANBcZkUwuLtQwGIyykS8NTAPByuJk=;
 b=c0ci5g3+pWrSUDC5izG3qaNRt67+QLSe06GLRZ2e2cafcKmhfbukpBzRzqCkr+fMtc
 8YdDgGhwsd6WQuFaoEYLd3xNM3Z35kP3R2HFgNtU4YaZN+sWWA25EV5GtnpFeLY0MaL6
 Udz8DqA8IOWv6whUs0dZ38wQ/m5U7ycwkovYlNjVYLAfMnHwLOynn7Cc5kZYpIPwGvRz
 Nlm7VyVosTOyeEL5TCZzCn+80L6Ac6k+jv2hGH5E34HD83UaVVe21K7kr8FO1cOporUY
 k595GsOTWzT9aq4MdnHZ82U+0zEnqQtFHJ9T+9NAZRfsIidhyMTiTP/ocptQQSpHDJAS
 ro1w==
X-Gm-Message-State: AOAM531OqlHmr5ao2tGttkyHDM8Kd3TUjGThgQ7JQdnOwB6Eec0Jf9kH
 IOGYpVRevVwwXiSbam1lymXLX4eMGEnlU7xvBx7RKd+z3dE2QV/msInuDpgrd/Njeae/SUThz1y
 48/+kKTWtKNZbzIoFAp9PH75+Gd2aSly7PlZuiXSbvQ==
X-Received: by 2002:a17:907:9607:: with SMTP id
 gb7mr9544528ejc.380.1618384044586; 
 Wed, 14 Apr 2021 00:07:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5QiE6uCm2TYL+bkNQd0qQiIeAFptnvz6NFy0gaqCl0QUiJuVrBQsyiI/7T5+VgFW46ii49w==
X-Received: by 2002:a17:907:9607:: with SMTP id
 gb7mr9544501ejc.380.1618384044350; 
 Wed, 14 Apr 2021 00:07:24 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id d22sm2187908ejz.79.2021.04.14.00.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 00:07:23 -0700 (PDT)
Date: Wed, 14 Apr 2021 09:07:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [RFC v2] virtio-vsock: add description for datagram type
Message-ID: <20210414070721.cdunbel6fvr7ieaf@steredhat>
References: <YHRQGSSnkN8Zipy0@stefanha-x1.localdomain>
 <20210412142133.t44pn5pjy6fdcvk4@steredhat>
 <CAP_N_Z9VPkBKX9QD+cuzSSAn6dL0cpQ=EZs5vk+ByjjDpGgdBA@mail.gmail.com>
 <20210413125853.2dkldmp23vkkc74c@steredhat>
 <20210413091251-mutt-send-email-mst@kernel.org>
 <20210413133852.ebkrlbyetiqu4uje@steredhat>
 <20210413094722-mutt-send-email-mst@kernel.org>
 <20210413140351.6vmffxqnj4azpyzx@steredhat>
 <20210413155635-mutt-send-email-mst@kernel.org>
 <CAP_N_Z__jRGzr+aOoCAZZggroUN1iyPo7ydAkCX6SdFuHvbH-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z__jRGzr+aOoCAZZggroUN1iyPo7ydAkCX6SdFuHvbH-Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: cong.wang@bytedance.com, Xiongchun Duan <duanxiongchun@bytedance.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 Stefan Hajnoczi <stefanha@redhat.com>, asias@redhat.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Apr 13, 2021 at 03:00:50PM -0700, Jiang Wang . wrote:
>On Tue, Apr 13, 2021 at 12:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Tue, Apr 13, 2021 at 04:03:51PM +0200, Stefano Garzarella wrote:
>> > On Tue, Apr 13, 2021 at 09:50:45AM -0400, Michael S. Tsirkin wrote:
>> > > On Tue, Apr 13, 2021 at 03:38:52PM +0200, Stefano Garzarella wrote:
>> > > > On Tue, Apr 13, 2021 at 09:16:50AM -0400, Michael S. Tsirkin wrote:
>> > > > > On Tue, Apr 13, 2021 at 02:58:53PM +0200, Stefano Garzarella wrote:
>> > > > > > On Mon, Apr 12, 2021 at 03:42:23PM -0700, Jiang Wang . wrote:
>> > > > > > > On Mon, Apr 12, 2021 at 7:21 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> > > > > > > >
>> > > > > > > > On Mon, Apr 12, 2021 at 02:50:17PM +0100, Stefan Hajnoczi wrote:
>> > > > > > > > >On Thu, Apr 01, 2021 at 04:36:02AM +0000, jiang.wang wrote:
>> > > > > > > > >> Add supports for datagram type for virtio-vsock. Datagram
>> > > > > > > > >> sockets are connectionless and unreliable. To avoid contention
>> > > > > > > > >> with stream and other sockets, add two more virtqueues and
>> > > > > > > > >> a new feature bit to identify if those two new queues exist or not.
>> > > > > > > > >>
>> > > > > > > > >> Also add descriptions for resource management of datagram, which
>> > > > > > > > >> does not use the existing credit update mechanism associated with
>> > > > > > > > >> stream sockets.
>> > > > > > > > >>
>> > > > > > > > >> Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>> > > > > > > > >> ---
>> > > > > > > > >> V2 addressed the comments for the previous version.
>> > > > > > > > >>
>> > > > > > > > >>  virtio-vsock.tex | 62 +++++++++++++++++++++++++++++++++++++++++++++++---------
>> > > > > > > > >>  1 file changed, 52 insertions(+), 10 deletions(-)
>> > > > > > > > >>
>> > > > > > > > >> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>> > > > > > > > >> index da7e641..62c12e0 100644
>> > > > > > > > >> --- a/virtio-vsock.tex
>> > > > > > > > >> +++ b/virtio-vsock.tex
>> > > > > > > > >> @@ -11,12 +11,25 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>> > > > > > > > >>  \begin{description}
>> > > > > > > > >>  \item[0] rx
>> > > > > > > > >>  \item[1] tx
>> > > > > > > > >> +\item[2] datagram rx
>> > > > > > > > >> +\item[3] datagram tx
>> > > > > > > > >> +\item[4] event
>> > > > > > > > >> +\end{description}
>> > > > > > > > >> +The virtio socket device uses 5 queues if feature bit VIRTIO_VSOCK_F_DRGAM is set. Otherwise, it
>> > > > > > > > >> +only uses 3 queues, as the following. Rx and tx queues are always used for stream sockets.
>> > > > > > > > >> +
>> > > > > > > > >> +\begin{description}
>> > > > > > > > >> +\item[0] rx
>> > > > > > > > >> +\item[1] tx
>> > > > > > > > >>  \item[2] event
>> > > > > > > > >>  \end{description}
>> > > > > > > > >>
>> > > > > > > > >
>> > > > > > > > >I suggest renaming "rx" and "tx" to "stream rx" and "stream tx"
>> > > > > > > > >virtqueues and also adding this:
>> > > > > > > > >
>> > > > > > > > >  When behavior differs between stream and datagram rx/tx virtqueues
>> > > > > > > > >  their full names are used. Common behavior is simply described in
>> > > > > > > > >  terms of rx/tx virtqueues and applies to both stream and datagram
>> > > > > > > > >  virtqueues.
>> > > > > > > > >
>> > > > > > > > >This way you won't need to duplicate portions of the spec that deal with
>> > > > > > > > >populating the virtqueues, for example.
>> > > > > > > > >
>> > > > > > > > >It's also clearer to use a full name for stream rx/tx virtqueues instead
>> > > > > > > > >of calling them rx/tx virtqueues now that we have datagram rx/tx
>> > > > > > > > >virtqueues.
>> > > > > > > > >
>> > > > > > > > >> +
>> > > > > > > > >>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>> > > > > > > > >>
>> > > > > > > > >> -There are currently no feature bits defined for this device.
>> > > > > > > > >> +\begin{description}
>> > > > > > > > >> +\item[VIRTIO_VSOCK_F_DGRAM (0)] Device has support for datagram socket type.
>> > > > > > > > >> +\end{description}
>> > > > > > > > >>
>> > > > > > > > >>  \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>> > > > > > > > >>
>> > > > > > > > >> @@ -107,6 +120,9 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>> > > > > > > > >>
>> > > > > > > > >>  \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
>> > > > > > > > >>
>> > > > > > > > >> +Flow control applies to stream sockets; datagram sockets do not have
>> > > > > > > > >> +flow control.
>> > > > > > > > >> +
>> > > > > > > > >>  The tx virtqueue carries packets initiated by applications and replies to
>> > > > > > > > >>  received packets.  The rx virtqueue carries packets initiated by the device and
>> > > > > > > > >>  replies to previously transmitted packets.
>> > > > > > > > >> @@ -140,12 +156,15 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>> > > > > > > > >>  consists of a (cid, port number) tuple. The header fields used for this are
>> > > > > > > > >>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>> > > > > > > > >>
>> > > > > > > > >> -Currently only stream sockets are supported. \field{type} is 1 for stream
>> > > > > > > > >> -socket types.
>> > > > > > > > >> +Currently stream and datagram (dgram) sockets are supported. \field{type} is 1 for stream
>> > > > > > > > >> +socket types. \field{type} is 3 for dgram socket types.
>> > > > > > > > >>
>> > > > > > > > >>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
>> > > > > > > > >>  without message boundaries.
>> > > > > > > > >>
>> > > > > > > > >> +Datagram sockets provide connectionless unreliable messages of
>> > > > > > > > >> +a fixed maximum length.
>> > > > > > > > >
>> > > > > > > > >Plus unordered (?) and with message boundaries. In other words:
>> > > > > > > > >
>> > > > > > > > >  Datagram sockets provide unordered, unreliable, connectionless message
>> > > > > > > > >  with message boundaries and a fixed maximum length.
>> > > > > > > > >
>> > > > > > > > >I didn't think of the fixed maximum length aspect before. I guess the
>> > > > > > > > >intention is that the rx buffer size is the message size limit? That's
>> > > > > > > > >different from UDP messages, which can be fragmented into multiple IP
>> > > > > > > > >packets and can be larger than 64KiB:
>> > > > > > > > >https://en.wikipedia.org/wiki/User_Datagram_Protocol#UDP_datagram_structure
>> > > > > > > > >
>> > > > > > > > >Is it possible to support large datagram messages in vsock? I'm a little
>> > > > > > > > >concerned that applications that run successfully over UDP will not be
>> > > > > > > > >portable if vsock has this limitation because it would impose extra
>> > > > > > > > >message boundaries that the application protocol might not tolerate.
>> > > > > > > >
>> > > > > > > > Maybe we can reuse the same approach Arseny is using for SEQPACKET.
>> > > > > > > > Fragment the packets according to the buffers in the virtqueue and set
>> > > > > > > > the EOR flag to indicate the last packet in the message.
>> > > > > > > >
>> > > > > > > Agree. Another option is to use the ones for skb since we may need to
>> > > > > > > use skbs for multiple transport support anyway.
>> > > > > > >
>> > > > > >
>> > > > > > The important thing I think is to have a single flag in virtio-vsock that
>> > > > > > identifies pretty much the same thing: this is the last fragment of a series
>> > > > > > to rebuild a packet.
>> > > > > >
>> > > > > > We should reuse the same flag for DGRAM and SEQPACKET.
>> > > > > >
>> > > > > > Thanks,
>> > > > > > Stefano
>> > > > >
>> > > > > Well DGRAM can drop data so I wonder whether it can work ...
>> > > > >
>> > > >
>> > > > Yep, this is true, but the channel should not be losing packets, so if the
>> > > > receiver discards packets, it knows that it must then discard all of them
>> > > > until the EOR.
>> > >
>> > > That is not so easy - they can come mixed up from multiple sources.
>> >
>> > I think we can prevent mixing because virtuqueue is point to point and its
>> > use is not thread safe, so the access (in the same peer) is already
>> > serialized.
>> > In the end the packet would be fragmented only before copying it to the
>> > virtuqueue.
>> >
>> > But maybe I missed something...
>>
>> Well I ask what's the point of fragmenting then. I assume it's so we
>> can pass huge messages around so you can't keep locks ...
>>
>I have a related question. How to determine the suitable size of a
>fragment?  Unlike stream or seqpacket sockets, the datagram
>sockets do not know the available recv buf of the listener. Eg.if the listener
>free recv buf is 64KB, and the sender wants to send a 256KB packet, how
>does the sender know what the fragment size is? One option is to
>use some default  fragment size and try to send those fragments. But those
>fragments could still be dropped by the receiver.

I guess it depends on the virtqueue buffers.
For the driver I don't think we need to fragment, we can queue the whole 
packet.
For device it depends on size of buffers in virtqueue, which determine 
size of fragment.

As I said in previous email, maybe we can allocate 64K buffers in 
virtqueue RX, and allow user at most 64K messages, avoiding 
fragmentation completely.

>
>>
>> > > Sure linux net core does this but with fragmentation added in,
>> > > I start wondering whether you are beginning to reinvent the net stack
>> > > ...
>> >
>> > No, I hope not :-), in the end our advantage is that we have a channel that
>> > doesn't lose packets, so I guess we can make assumptions that the network
>> > stack can't.
>> >
>> > Thanks,
>> > Stefano
>>
>> I still don't know how will credit accounting work for datagram,
>> but proposals I saw seem to actually lose packets ...
>
>Yes, I agree that is a problem. In my mind, the accounting is
>different from the credit mechanism used by the stream sockets.
>The accounting is for the sender side only and the packets may
>still be dropped at the receiving side if it is larger than the
>available recv buf.
>

I don't think it's a problem if the receiver decide to drop, the 
important thing is that it drops all the fragments.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
