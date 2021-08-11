Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5A3E8D3E
	for <lists.virtualization@lfdr.de>; Wed, 11 Aug 2021 11:29:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B036440500;
	Wed, 11 Aug 2021 09:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XP5Kt5Zo8mgG; Wed, 11 Aug 2021 09:29:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 855B94051A;
	Wed, 11 Aug 2021 09:29:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A226C001F;
	Wed, 11 Aug 2021 09:29:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6630C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 09:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6BF7402EC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 09:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZHwEjVKikHr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 09:29:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9E7C402EB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628674148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6TLZsz3IyS/4LaSfA3Cn/ZDtbcmVBTNJFQ+CRLo0vqU=;
 b=X7uJZmS3EXlvcQC0aQr4aHE5G97nMjoCctsXK+iVnb18hZ+wkgiDdQLh1zmCtKILOIYbEN
 ef5wZZxOezl2JozxhSWsDYhxjTjVtIQrQ16D1gAwgBSkBemjSjQzXjThFJKWQwcQMC2t6S
 d1fVOGDoxHCuMC9D4/QaatlsMyf3c5Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-uGLLVQZrMsm38joA4fcDJg-1; Wed, 11 Aug 2021 05:29:05 -0400
X-MC-Unique: uGLLVQZrMsm38joA4fcDJg-1
Received: by mail-ed1-f71.google.com with SMTP id
 c1-20020aa7df010000b02903bb5c6f746eso916260edy.10
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 02:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6TLZsz3IyS/4LaSfA3Cn/ZDtbcmVBTNJFQ+CRLo0vqU=;
 b=krYUfBG9JuRAjCarP+t+16IM8AAmWeNTTQ6CYPIZLZhdBpgxy5bPTsFWfk2ptU+FsA
 Nf3CYUh7rbpA16LCRJw6SQJVfsChQkIV9Evky0tRcRo6nqN9K/ZFl0//be/eYAwjHObP
 YLPfGtSae6p0EsJww4efGRGBYkfI1cex9Z413Cwc/+1WNMA9P6OkMpXIqsY2U0DO1fU+
 /VVr2HIx2/KUtczIvLtCj4vTX5mNq613qd4xaW3paIquZ8kVH1xHreNus6Nw6j+63J8s
 /zd6s/tmhzrJIz42AA/NADpi/3l3FZ1uaYsKIBQjYEdvZEL02dUl6VQq+4bQ7rPt9Wyx
 WYRA==
X-Gm-Message-State: AOAM530JRLvlej4rO+OGxes19vV0w91y0cnq1ZbCz6IWAlZYzBtTqM5E
 B7x8+30FhRs4wTC/Z1ajR2uLuJEagZYJE7MJ7TDz0fseHgNXso2tjYT03Ju1SiLLkWSD1mzYzv1
 vperAdRZ23QCFKfgTBVK1Az1W2/phu825m1J2rQ9L2Q==
X-Received: by 2002:a05:6402:328:: with SMTP id
 q8mr4990290edw.84.1628674143944; 
 Wed, 11 Aug 2021 02:29:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuPxVA53Cl4QNs02aLo1cPMBKgoI4+MqpyaY32wOROyDhxfD21qHSwg3EBN01aj60XvpQNRg==
X-Received: by 2002:a05:6402:328:: with SMTP id
 q8mr4990268edw.84.1628674143815; 
 Wed, 11 Aug 2021 02:29:03 -0700 (PDT)
Received: from steredhat (a-nu5-14.tin.it. [212.216.181.13])
 by smtp.gmail.com with ESMTPSA id r16sm2845085ejz.41.2021.08.11.02.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:29:03 -0700 (PDT)
Date: Wed, 11 Aug 2021 11:29:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [virtio-comment] [RFC PATCH v7 2/2] virtio-vsock: SOCK_SEQPACKET
 description
Message-ID: <20210811092901.53lyzvy5nethngo7@steredhat>
References: <20210810114616.1216243-1-arseny.krasnov@kaspersky.com>
 <20210810114710.1216558-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210810114710.1216558-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 Colin Ian King <colin.king@canonical.com>, oxffffaa@gmail.com,
 Norbert Slusarek <nslusarek@gmx.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-comment@lists.oasis-open.org, Jakub Kicinski <kuba@kernel.org>,
 virtualization@lists.linux-foundation.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Aug 10, 2021 at 02:47:06PM +0300, Arseny Krasnov wrote:
>This adds description of SOCK_SEQPACKET socket type
>support for virtio-vsock.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> virtio-vsock.tex | 35 ++++++++++++++++++++++++++++++-----
> 1 file changed, 30 insertions(+), 5 deletions(-)
>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index ad57f9d..ca76812 100644
>--- a/virtio-vsock.tex
>+++ b/virtio-vsock.tex
>@@ -16,7 +16,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>
> \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>
>-There are currently no feature bits defined for this device.
>+\begin{description}
>+\item VIRTIO_VSOCK_F_SEQPACKET (1) SOCK_SEQPACKET socket type is
>+    supported.
>+\end{description}
>
> \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>
>@@ -135,15 +138,17 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> consists of a (cid, port number) tuple. The header fields used for this are
> \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>
>-Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>-for stream socket types.
>+Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>+for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
>
> \begin{lstlisting}
>-#define VIRTIO_VSOCK_TYPE_STREAM 1
>+#define VIRTIO_VSOCK_TYPE_STREAM    1
>+#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
> \end{lstlisting}
>
> Stream sockets provide in-order, guaranteed, connection-oriented delivery
>-without message boundaries.
>+without message boundaries. Seqpacket sockets provide in-order, guaranteed,
>+connection-oriented delivery with message and record boundaries.
>
> \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
>@@ -244,6 +249,26 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> destination) address tuple for a new connection while the other peer is still
> processing the old connection.
>
>+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
>+
>+\paragraph{Message boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Message boundaries}
>+
>+To provide message boundaries, last RW packet of each message has VIRTIO_VSOCK_SEQ_EOM
>+bit (bit 0) set in the \field{flags} of packet's header.
>+
>+\begin{lstlisting}
>+#define VIRTIO_VSOCK_SEQ_EOM 1
>+\end{lstlisting}
>+
>+\paragraph{Record boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Record boundaries}
>+
>+To provide record boundaries, last RW packet of each record has VIRTIO_VSOCK_SEQ_EOR
>+bit (bit 1) set in the \field{flags} of packet's header.
>+
>+\begin{lstlisting}
>+#define VIRTIO_VSOCK_SEQ_EOR 2
>+\end{lstlisting}
>+

Maybe we could have a single section where we talk about the boundaries 
and list the two flags together.

We should also explain what we mean by message boundaries (payload sent 
with a single system call) and record boundaries (payload with MSG_EOR 
flag set).

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
