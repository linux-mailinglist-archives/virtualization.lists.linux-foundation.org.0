Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B777233C094
	for <lists.virtualization@lfdr.de>; Mon, 15 Mar 2021 16:54:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3809605C5;
	Mon, 15 Mar 2021 15:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJsIMZN-Lq55; Mon, 15 Mar 2021 15:54:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97F86F580;
	Mon, 15 Mar 2021 15:54:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D14BC0012;
	Mon, 15 Mar 2021 15:54:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C555C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B73E43117
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 15:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHOvwgdiMRMe
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 15:54:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58ACF430EB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 15:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615823649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hm6NN/MD0bjhmdtBmqiMwR759i+nZx9Sj5lXOKclO2o=;
 b=cxvPwQnU3MqS5SD0EL6NjPE1NmuA7SaRBUorloUD0XEe6XWrg7GoOgtteWak/VtfYilnz+
 msPPFVPgZ/PQlHH+irIrRNBTx+j6xwBFs8PckgnmHGKagm94c8q2b5lwghEpJ5UfUgnkNw
 yVvhvFdDJaPKcCXBfXlmEfqxVzquxSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-4kpKnNntO1atFAqFEnUUUA-1; Mon, 15 Mar 2021 11:54:07 -0400
X-MC-Unique: 4kpKnNntO1atFAqFEnUUUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FD39107ACCA;
 Mon, 15 Mar 2021 15:54:05 +0000 (UTC)
Received: from gondolin (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D2D4100239A;
 Mon, 15 Mar 2021 15:53:52 +0000 (UTC)
Date: Mon, 15 Mar 2021 16:53:50 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v1] virtio-vsock: use enums instead of hardcoded
 constants
Message-ID: <20210315165350.7377478e.cohuck@redhat.com>
In-Reply-To: <20210315083547.2283420-1-arseny.krasnov@kaspersky.com>
References: <20210315083547.2283420-1-arseny.krasnov@kaspersky.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Andra Paraschiv <andraprs@amazon.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 oxffffaa@gmail.com, Norbert Slusarek <nslusarek@gmx.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org,
 Jakub Kicinski <kuba@kernel.org>, virtualization@lists.linux-foundation.org,
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

On Mon, 15 Mar 2021 11:35:41 +0300
Arseny Krasnov <arseny.krasnov@kaspersky.com> wrote:

> This replaces constants defined in "bit X set to Y" manner
> with enums from Linux kernel uapi headers.
> ---
>  virtio-vsock.tex | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> index da7e641..a97a81e 100644
> --- a/virtio-vsock.tex
> +++ b/virtio-vsock.tex
> @@ -140,8 +140,14 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>  consists of a (cid, port number) tuple. The header fields used for this are
>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>  
> -Currently only stream sockets are supported. \field{type} is 1 for stream
> -socket types.
> +Currently only stream sockets are supported. \field{type} is one of the
> +following constants:
> +
> +\begin{lstlisting}
> +enum virtio_vsock_type {
> +	VIRTIO_VSOCK_TYPE_STREAM = 1,
> +};
> +\end{lstlisting}
>  
>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
>  without message boundaries.
> @@ -221,11 +227,20 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
>  a listening socket does not exist on the destination or the destination has
>  insufficient resources to establish the connection.
>  
> -When a connected socket receives VIRTIO_VSOCK_OP_SHUTDOWN the header
> -\field{flags} field bit 0 indicates that the peer will not receive any more
> -data and bit 1 indicates that the peer will not send any more data.  These
> -hints are permanent once sent and successive packets with bits clear do not
> -reset them.
> +When a connected socket receives VIRTIO_VSOCK_OP_SHUTDOWN, header \field{flags}
> +field is one of the following constants:

I don't think these two are required to be mutually exclusive (i.e.
both can be indicated at the same time?)

> +
> +\begin{lstlisting}
> +enum virtio_vsock_shutdown {
> +	VIRTIO_VSOCK_SHUTDOWN_RCV = 1,
> +	VIRTIO_VSOCK_SHUTDOWN_SEND = 2,
> +};
> +\end{lstlisting}
> +
> +VIRTIO_VSOCK_SHUTDOWN_RCV indicates that the peer will not receive any more
> +data and VIRTIO_VSOCK_SHUTDOWN_SEND indicates that the peer will not send
> +any more data.  These hints are permanent once sent and successive packets
> +with bits clear do not reset them.
>  
>  The VIRTIO_VSOCK_OP_RST packet aborts the connection process or forcibly
>  disconnects a connected socket.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
