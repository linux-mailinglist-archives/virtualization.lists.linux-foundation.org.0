Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B4B348D05
	for <lists.virtualization@lfdr.de>; Thu, 25 Mar 2021 10:34:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 040DD83E95;
	Thu, 25 Mar 2021 09:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WxlI1ddUYTNc; Thu, 25 Mar 2021 09:34:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F8138416D;
	Thu, 25 Mar 2021 09:34:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29DD4C000A;
	Thu, 25 Mar 2021 09:34:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AB79C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 09:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 372F683E95
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 09:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id drd38uX3UcKq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 09:34:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F8A383E55
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616664862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nRf7NxGYGZiHnx9JPcY1YBSuqFXsi8pdHWs1zzP6w98=;
 b=Sr32jQJOH11EsGmQif/fT0k5E1KNPMSqMZzvPkOguogN/aGuuXm/R+lC5Ln9WGMqNA2U9k
 MmTl0LULMQw3jB/mxRnjAkiUJAhYSfPkt+OK8ZmuEk4+xNxwyj/DKnmXdSiprJmG6N3JkV
 UPpgGEFi/AaTCKRA21timFojTMpsiwg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-cOAs-pkIPP-5icidh5VXCQ-1; Thu, 25 Mar 2021 05:34:20 -0400
X-MC-Unique: cOAs-pkIPP-5icidh5VXCQ-1
Received: by mail-wr1-f70.google.com with SMTP id t14so2375674wrx.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 02:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nRf7NxGYGZiHnx9JPcY1YBSuqFXsi8pdHWs1zzP6w98=;
 b=RUH+gGt14SzD5bE7hDzRUY2LWw0hyxATzTA4uQL9QUBW+0pzHg+Wq3EUOOVtK72IEL
 XsgA86i4whZ2BWO797zzYZuQWh3r5ln6Vc92X3hQ8hOeH2LEXOdGo6lLQpzMEN9PluAE
 //MA9hOcjRnT7cYcJPV0DZ2UXui4iZb1HOw/C2NMrvzVQ0G/j4FBRupg3HMzESpTSAW0
 ywPZkLtRxEk3rVj5+YO1wVvd8J8E8+OxqErJaCOPg6SC7ljrsknYChQHN/aLpzplGO7Y
 boHS/gXYAB/vF0p5fHddY4NGcVLoShqvz8vYXkZ4rU67LCPqHdy2uaWKBWfNcGbMdIGJ
 +eKA==
X-Gm-Message-State: AOAM533Ol7ejrCLOeyVlHwssF/8l8uPt7mAkFBIGxhN0m6TFJuW0tp//
 UcCe/OPiL9cGCc0jJvK88B3lR0fj7qyJRO2dLUVgNunG7AkEv9B0Fl84ZbiM0714+YGTapIBHry
 tEUJqqlNfagzE2BnBOovaRhi0MnXaaewfJIWIN3TVJA==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr7831875wrz.373.1616664858981; 
 Thu, 25 Mar 2021 02:34:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp7FkesHjnWfGl/YQCfTcHUdEisO/iTjMVOdjUfjZ9/ssRfZECVX4/rMdG4zKhoEe/0ngIDg==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr7831840wrz.373.1616664858753; 
 Thu, 25 Mar 2021 02:34:18 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id u2sm7165948wmm.5.2021.03.25.02.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 02:34:18 -0700 (PDT)
Date: Thu, 25 Mar 2021 10:34:15 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v7 04/22] af_vsock: implement SEQPACKET receive loop
Message-ID: <20210325093415.mpysybt5vfnsl7fg@steredhat>
References: <20210323130716.2459195-1-arseny.krasnov@kaspersky.com>
 <20210323131006.2460058-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210323131006.2460058-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Vander Stoep <jeffv@google.com>,
 stsp2@yandex.ru, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, oxffffaa@gmail.com,
 netdev@vger.kernel.org, Norbert Slusarek <nslusarek@gmx.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>,
 Alexander Popov <alex.popov@linux.com>
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

On Tue, Mar 23, 2021 at 04:10:03PM +0300, Arseny Krasnov wrote:
>This adds receive loop for SEQPACKET. It looks like receive loop for
>STREAM, but there is a little bit difference:
>1) It doesn't call notify callbacks.
>2) It doesn't care about 'SO_SNDLOWAT' and 'SO_RCVLOWAT' values, because
>   there is no sense for these values in SEQPACKET case.
>3) It waits until whole record is received or error is found during
>   receiving.
>4) It processes and sets 'MSG_TRUNC' flag.
>
>So to avoid extra conditions for two types of socket inside one loop, two
>independent functions were created.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> v6 -> v7:
> 'seqpacket_get_len' callback now removed, length of message is returned
>  by 'seqpacket_dequeue' callback.
>
> include/net/af_vsock.h   |  4 ++
> net/vmw_vsock/af_vsock.c | 88 +++++++++++++++++++++++++++++++++++++++-
> 2 files changed, 91 insertions(+), 1 deletion(-)
>
>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>index b1c717286993..74ac8a4c4168 100644
>--- a/include/net/af_vsock.h
>+++ b/include/net/af_vsock.h
>@@ -135,6 +135,10 @@ struct vsock_transport {
> 	bool (*stream_is_active)(struct vsock_sock *);
> 	bool (*stream_allow)(u32 cid, u32 port);
>
>+	/* SEQ_PACKET. */
>+	int (*seqpacket_dequeue)(struct vsock_sock *vsk, struct msghdr *msg,
>+				 int flags, bool *msg_ready, size_t *record_len);
>+

Why not using ssize_t as return value and return the length or a 
negative value in case of error?

In this way we can remove the 'record_len' parameter.

> 	/* Notification. */
> 	int (*notify_poll_in)(struct vsock_sock *, size_t, bool *);
> 	int (*notify_poll_out)(struct vsock_sock *, size_t, bool *);
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 0bc661e54262..fa0c37f97330 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1973,6 +1973,89 @@ static int __vsock_stream_recvmsg(struct sock 
>*sk, struct msghdr *msg,
> 	return err;
> }
>
>+static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr 
>*msg,
>+				     size_t len, int flags)
>+{
>+	const struct vsock_transport *transport;
>+	const struct iovec *orig_iov;
>+	unsigned long orig_nr_segs;
>+	bool msg_ready;
>+	struct vsock_sock *vsk;
>+	size_t record_len;
>+	long timeout;
>+	int err = 0;
>+	DEFINE_WAIT(wait);
>+
>+	vsk = vsock_sk(sk);
>+	transport = vsk->transport;
>+
>+	timeout = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
>+	orig_nr_segs = msg->msg_iter.nr_segs;
>+	orig_iov = msg->msg_iter.iov;
>+	msg_ready = false;
>+	record_len = 0;
>+
>+	while (1) {
>+		err = vsock_wait_data(sk, &wait, timeout, NULL, 0);
>+
>+		if (err <= 0) {
>+			/* In case of any loop break(timeout, signal
>+			 * interrupt or shutdown), we report user that
>+			 * nothing was copied.
>+			 */
>+			err = 0;
>+			break;
>+		}
>+
>+		err = transport->seqpacket_dequeue(vsk, msg, flags, &msg_ready, &record_len);
>+
>+		if (err < 0) {
>+			if (err == -EAGAIN) {
>+				iov_iter_init(&msg->msg_iter, READ,
>+					      orig_iov, orig_nr_segs,
>+					      len);
>+				/* Clear 'MSG_EOR' here, because dequeue
>+				 * callback above set it again if it was
>+				 * set by sender. This 'MSG_EOR' is from
>+				 * dropped record.
>+				 */
>+				msg->msg_flags &= ~MSG_EOR;
>+				record_len = 0;
>+				continue;
>+			}
>+
>+			err = -ENOMEM;
>+			break;
>+		}
>+
>+		if (msg_ready)
>+			break;
>+	}
>+
>+	if (sk->sk_err)
>+		err = -sk->sk_err;
>+	else if (sk->sk_shutdown & RCV_SHUTDOWN)
>+		err = 0;
>+
>+	if (msg_ready) {

If 'err' is not 0, should we skip this branch?

>+		/* User sets MSG_TRUNC, so return real length of
>+		 * packet.
>+		 */
>+		if (flags & MSG_TRUNC)
>+			err = record_len;
>+		else
>+			err = len - msg->msg_iter.count;
>+
>+		/* Always set MSG_TRUNC if real length of packet is
>+		 * bigger than user's buffer.
>+		 */
>+		if (record_len > len)
>+			msg->msg_flags |= MSG_TRUNC;
>+	}
>+
>+	return err;
>+}
>+
> static int
> vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 			  int flags)
>@@ -2028,7 +2111,10 @@ vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 		goto out;
> 	}
>
>-	err = __vsock_stream_recvmsg(sk, msg, len, flags);
>+	if (sk->sk_type == SOCK_STREAM)
>+		err = __vsock_stream_recvmsg(sk, msg, len, flags);
>+	else
>+		err = __vsock_seqpacket_recvmsg(sk, msg, len, flags);
>
> out:
> 	release_sock(sk);
>-- 
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
