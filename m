Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4450332B7B7
	for <lists.virtualization@lfdr.de>; Wed,  3 Mar 2021 13:09:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6B0605AC;
	Wed,  3 Mar 2021 12:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNPhV3PWvVH1; Wed,  3 Mar 2021 12:09:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79BE8605A3;
	Wed,  3 Mar 2021 12:09:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 195EEC0001;
	Wed,  3 Mar 2021 12:09:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6B4EC0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Mar 2021 12:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C52F8605A0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Mar 2021 12:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9xr6_uQ5Wd8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Mar 2021 12:09:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E13586059D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Mar 2021 12:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614773341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jqiKhA4dnA6sra8ODHFweCHhM8QgP97KaZ1Nrz5eDw=;
 b=O/yGHYuYKU9D06wj5Gd+cDyu1G7mv8NzCZokkWVPcMsfl5xIVE+EF88iXGgNdDH6pereTt
 EeHpsaCEo5JU7dtFnYR1ACB5jNcI/SqW9ttVzVOPKRdoRptVRwWp/yx1n9CXunvrQhD2K1
 vc+/+YswCmilbaGzkI8BySLdYOkdKMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-KUQFNuHqOJ2UqohxSls2_w-1; Wed, 03 Mar 2021 07:08:57 -0500
X-MC-Unique: KUQFNuHqOJ2UqohxSls2_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5567B801989;
 Wed,  3 Mar 2021 12:08:55 +0000 (UTC)
Received: from gondolin (ovpn-113-85.ams2.redhat.com [10.36.113.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8EB310013C1;
 Wed,  3 Mar 2021 12:08:45 +0000 (UTC)
Date: Wed, 3 Mar 2021 13:08:43 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [virtio-comment] [RFC PATCH v1 1/1] virtio-vsock: add
 SOCK_SEQPACKET description
Message-ID: <20210303130843.6b457503.cohuck@redhat.com>
In-Reply-To: <20210224093200.tpflaqgoap4fe5ax@steredhat>
References: <20210218060715.1075547-1-arseny.krasnov@kaspersky.com>
 <20210218060827.1075863-1-arseny.krasnov@kaspersky.com>
 <20210224093200.tpflaqgoap4fe5ax@steredhat>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Andra Paraschiv <andraprs@amazon.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, oxffffaa@gmail.com,
 Norbert Slusarek <nslusarek@gmx.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-comment@lists.oasis-open.org, Jakub Kicinski <kuba@kernel.org>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Wed, 24 Feb 2021 10:32:00 +0100
Stefano Garzarella <sgarzare@redhat.com> wrote:

> On Thu, Feb 18, 2021 at 09:08:23AM +0300, Arseny Krasnov wrote:
> >Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
> >---
> > virtio-vsock.tex | 40 +++++++++++++++++++++++++++++++++++++---
> > 1 file changed, 37 insertions(+), 3 deletions(-)
> >
> >diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> >index da7e641..1ee8f99 100644
> >--- a/virtio-vsock.tex
> >+++ b/virtio-vsock.tex
> >@@ -102,6 +102,11 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> > 	VIRTIO_VSOCK_OP_CREDIT_UPDATE = 6,
> > 	/* Request the peer to send the credit info to us */
> > 	VIRTIO_VSOCK_OP_CREDIT_REQUEST = 7,
> >+
> >+	/* Message begin for SOCK_SEQPACKET */
> >+	VIRTIO_VSOCK_OP_SEQ_BEGIN = 8,
> >+	/* Message end for SOCK_SEQPACKET */
> >+	VIRTIO_VSOCK_OP_SEQ_END = 9,
> > };
> > \end{lstlisting}
> >
> >@@ -140,11 +145,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> > consists of a (cid, port number) tuple. The header fields used for this are
> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> >
> >-Currently only stream sockets are supported. \field{type} is 1 for stream
> >-socket types.
> >+Currently stream and seqpacket sockets are supported. \field{type} is 1 for
> >+stream socket types. \field{type} is 2 for seqpacket socket types.
> >
> > Stream sockets provide in-order, guaranteed, connection-oriented delivery
> >-without message boundaries.
> >+without message boundaries. Seqpacket sockets also provide message boundaries.
> >
> > \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> > \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
> >@@ -240,6 +245,35 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> > destination) address tuple for a new connection while the other peer is still
> > processing the old connection.
> >
> >+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
> >+
> >+Seqpacket sockets differ from stream sockets only in data transmission way: in
> >+stream sockets all data is sent using only VIRTIO_VSOCK_OP_RW packets. In
> >+seqpacket sockets, to provide message boundaries, every sequence of
> >+VIRTIO_VSOCK_OP_RW packets of each message is headed with  
>                                               ^
> Since this is a spec, I think we should use MUST when something must be 
> respected by the peer, for example here we can say "MUST be headed"
> 
> >+VIRTIO_VSOCK_OP_SEQ_BEGIN and tailed with VIRTIO_VSOCK_OP_SEQ_END packets.
> >+Both VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END packets carry  
>                                                                       ^
> Same here "MUST carry" and in the rest of the patch.

Actually, MUST and friends are really for normative sections; I'd
advise to have a description of how this feature works and then some
device/driver normative clauses with MUST statements (like "the device
MUST reject <malformed packets>" or so).

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
