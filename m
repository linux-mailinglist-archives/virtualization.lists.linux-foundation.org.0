Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A717D37F7A0
	for <lists.virtualization@lfdr.de>; Thu, 13 May 2021 14:14:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27636400D0;
	Thu, 13 May 2021 12:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNIJ2AhDp-yL; Thu, 13 May 2021 12:14:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEBE2401C3;
	Thu, 13 May 2021 12:14:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8394EC001C;
	Thu, 13 May 2021 12:14:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D226C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 12:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CDB94038A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 12:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAsT8Vt28BCD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 12:14:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09D0840387
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 12:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620908046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SQD/pcH6/EwepQ7zwHhPK/O6wsXARP4FrHE+OPXdfJc=;
 b=dCWnbp8YcmX7203KW84kgS3WJvJiPiTcQlO4yoYjFtd2Jdgeyghhx6/M28tgG7Ltx3o0ST
 pObs4N5squKHiEVIhETG6czaKXVIjqaJg7Ag4oGcxLWfgeIptbjL+T8KTMJ+5gkCR/4DFx
 xWfj7yRHXApHjPJUtu6t9QKJMeYER3U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-n2NdQFYkOCemeXwG0CjOOQ-1; Thu, 13 May 2021 08:14:05 -0400
X-MC-Unique: n2NdQFYkOCemeXwG0CjOOQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 j16-20020a1709062a10b02903ba544485d0so4595743eje.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 05:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SQD/pcH6/EwepQ7zwHhPK/O6wsXARP4FrHE+OPXdfJc=;
 b=rMKMO/0DG5QeHLK29O3AA8PRSjHrowFgSvpRjG2ZzA5zVJbOqIBNIUpo7Cdnk8x3Lm
 1ZmqjoCIjvQJtBqodJVWOKKonlHusMjX7PdKwpzGoBb9KZW3is5ajYAuRBKKQcLW0FlZ
 SPJanNVEDPZQ493QaGHkuc0KH88RYHXCVVhjK+ZmPeW3RWO7vPp98tR9g3U7SMJgTpYm
 XQIlhEcJzfkfZ+sgsxAU5WSO/aGTrrQSD0A5Ympang8kpst46zqBc7ER8ik8X2n+cWwT
 w6xruSTbQwb5l5XYS2cYGiNK55nycXwRcYW6RZTVlGQPaFmUHv9q2gA6qsLnpWTOsCw0
 FHlw==
X-Gm-Message-State: AOAM533Qma8mxpd6qXYEWImL3WDUKyXgVhf3CKx4Fnn9girU4+joQqkD
 moBZvqbafOWhNqFMncJSaSS2ZgJMFIteFhpN19pcxqDHffy+F/nq+MrrelfLJniG/OMVf4hwTMd
 VZj10DIy657yPwjuQMwEj3xlF6DH/YWuntH5t+d+qJw==
X-Received: by 2002:a05:6402:6cd:: with SMTP id
 n13mr51384891edy.330.1620908043091; 
 Thu, 13 May 2021 05:14:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiXiCGmnyqZKpqgMhRFcjk2WSuaiuU6ojG6BUl5WGN+JeIJysyCkHdp91nTXn7XKitQGIpkA==
X-Received: by 2002:a05:6402:6cd:: with SMTP id
 n13mr51384863edy.330.1620908042947; 
 Thu, 13 May 2021 05:14:02 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id bn5sm1728763ejb.97.2021.05.13.05.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:14:02 -0700 (PDT)
Date: Thu, 13 May 2021 14:14:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v9 12/19] virtio/vsock: add SEQPACKET receive logic
Message-ID: <20210513121400.7u7kectkxwame76b@steredhat>
References: <20210508163027.3430238-1-arseny.krasnov@kaspersky.com>
 <20210508163544.3432132-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210508163544.3432132-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, stsp2@yandex.ru,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 oxffffaa@gmail.com, Norbert Slusarek <nslusarek@gmx.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sat, May 08, 2021 at 07:35:40PM +0300, Arseny Krasnov wrote:
>This modifies current receive logic for SEQPACKET support:
>1) Inserts 'RW' packet to socket's rx queue, but without merging with
>   buffer of last packet in queue.

This is not true anymore, right?

>2) Performs check for packet and socket types on receive(if mismatch,
>   then reset connection).
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Also this patch is changed :-)

>---
> net/vmw_vsock/virtio_transport_common.c | 28 +++++++++++++++++++++++--
> 1 file changed, 26 insertions(+), 2 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index f649a21dd23b..7fea0a2192f7 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -165,6 +165,14 @@ void virtio_transport_deliver_tap_pkt(struct virtio_vsock_pkt *pkt)
> }
> EXPORT_SYMBOL_GPL(virtio_transport_deliver_tap_pkt);
>
>+static u16 virtio_transport_get_type(struct sock *sk)
>+{
>+	if (sk->sk_type == SOCK_STREAM)
>+		return VIRTIO_VSOCK_TYPE_STREAM;
>+	else
>+		return VIRTIO_VSOCK_TYPE_SEQPACKET;
>+}
>+
> /* This function can only be used on connecting/connected sockets,
>  * since a socket assigned to a transport is required.
>  *
>@@ -980,11 +988,15 @@ virtio_transport_recv_enqueue(struct vsock_sock *vsk,
> 		/* If there is space in the last packet queued, we copy the
> 		 * new packet in its buffer.
> 		 */
>-		if (pkt->len <= last_pkt->buf_len - last_pkt->len) {
>+		if ((pkt->len <= last_pkt->buf_len - last_pkt->len) &&
>+		    !(le32_to_cpu(last_pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOR)) {

Maybe we should update the comment above.

> 			memcpy(last_pkt->buf + last_pkt->len, pkt->buf,
> 			       pkt->len);
> 			last_pkt->len += pkt->len;
> 			free_pkt = true;
>+
>+			if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SEQ_EOR)
>+				last_pkt->hdr.flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);

What about doing the following in any case?

			last_pkt->hdr.flags |= pkt->hdr.flags;

> 			goto out;
> 		}
> 	}

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
