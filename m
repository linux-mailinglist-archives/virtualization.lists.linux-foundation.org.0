Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A2732151C
	for <lists.virtualization@lfdr.de>; Mon, 22 Feb 2021 12:29:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC0636F573;
	Mon, 22 Feb 2021 11:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sG5pnhUYhWBN; Mon, 22 Feb 2021 11:29:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CA016F570;
	Mon, 22 Feb 2021 11:29:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57CC9C0012;
	Mon, 22 Feb 2021 11:29:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0323C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 11:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C6DA287144
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 11:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVVC7d5YjZtX
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 11:29:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 055ED870DD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613993370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y8uZhtxPnMc3VJgJ7/XsbDI2s/GkB4V6o+tAFFKwv/8=;
 b=dLnhb5UD+NpaCQn6v2pEF7GfZEbQ12O3I6Ief1E/7iLlUte0CrZPGBCt4uos+Cpy8o4Q3r
 IeFh/pbOvxb6LWW2w6h0kIcO4avB7V+w/ErLLlsyNZUyRyap7+3BRDERKYHlw4Umn2qyd+
 ebdBrw7L+LarN8RMfSbSc+7Dmw9Zpj8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-QSPdwKQ8Oj-jJ_AkVWF9oA-1; Mon, 22 Feb 2021 06:29:29 -0500
X-MC-Unique: QSPdwKQ8Oj-jJ_AkVWF9oA-1
Received: by mail-wm1-f71.google.com with SMTP id h20so428190wmq.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 03:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y8uZhtxPnMc3VJgJ7/XsbDI2s/GkB4V6o+tAFFKwv/8=;
 b=THA15ypAw5+cUfefZnCjpUSDAHC3ozHPwQrmQaosYHFl6vCcPlZ7DBFA90XXW0SO4Q
 VDZAWCZUOAzA2jCl1rEoap6ecvDbT5OGgIvlzR928cJooqQ/m5o3gh+jHiWKGbSrE1sC
 by81zOcvUx+IriOhgjQbWdR0hLQ/k+5R0PZyuWLScs2xO1prSMgzYSPE68mSpPGfBaWG
 /uwpQcXkKyq+EWN4EkjtggmZolAy1CSH9htZK8vu2RexKWhODVsg5nreC8jHNuovJKmt
 RxeWsexrV+BGYWHX2hWlgFd73fKTQU7Q6D7VMlCQt4tSQEX8KT8D9W4AwNMoVPKaPU4r
 Hnqw==
X-Gm-Message-State: AOAM530zgqJt0Innpjz6pfutYQ8EO6RXW7+jY45X8amgmAk7wR7yj6F/
 +62ylD5ltdmPHVs5Z76S4UVudBKK2V7PGK69yzSB4rHgGACviVjucSYsskTsfF9ucOMA+UY0zOG
 cvqaE4hSXzBSoRbnQhFGYP9OjM+jh505jBJBiFxnkqw==
X-Received: by 2002:a5d:63ce:: with SMTP id c14mr7733612wrw.15.1613993368179; 
 Mon, 22 Feb 2021 03:29:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiJBgeZ62WLQXH1tkB63Xoc8oL1rWkIkvwkAGO6rqCCSIdNxSHGL/0LhoyC56LLS/oG3hmig==
X-Received: by 2002:a5d:63ce:: with SMTP id c14mr7733598wrw.15.1613993367956; 
 Mon, 22 Feb 2021 03:29:27 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id m24sm7861270wmc.18.2021.02.22.03.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 03:29:27 -0800 (PST)
Date: Mon, 22 Feb 2021 12:29:24 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v5 02/19] af_vsock: separate wait data loop
Message-ID: <20210222112924.hu2sfoiwni5kt5wm@steredhat>
References: <20210218053347.1066159-1-arseny.krasnov@kaspersky.com>
 <20210218053637.1066959-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210218053637.1066959-1-arseny.krasnov@kaspersky.com>
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

On Thu, Feb 18, 2021 at 08:36:33AM +0300, Arseny Krasnov wrote:
>This moves wait loop for data to dedicated function, because later
>it will be used by SEQPACKET data receive loop.

The patch LGTM, maybe just add a line in the commit message with 
something like this:

     While moving the code around, let's update an old comment.

Whit that fixed:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> net/vmw_vsock/af_vsock.c | 155 +++++++++++++++++++++------------------
> 1 file changed, 83 insertions(+), 72 deletions(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 656370e11707..6cf7bb977aa1 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1832,6 +1832,68 @@ static int vsock_connectible_sendmsg(struct socket *sock, struct msghdr *msg,
> 	return err;
> }
>
>+static int vsock_wait_data(struct sock *sk, struct wait_queue_entry *wait,
>+			   long timeout,
>+			   struct vsock_transport_recv_notify_data *recv_data,
>+			   size_t target)
>+{
>+	const struct vsock_transport *transport;
>+	struct vsock_sock *vsk;
>+	s64 data;
>+	int err;
>+
>+	vsk = vsock_sk(sk);
>+	err = 0;
>+	transport = vsk->transport;
>+	prepare_to_wait(sk_sleep(sk), wait, TASK_INTERRUPTIBLE);
>+
>+	while ((data = vsock_stream_has_data(vsk)) == 0) {
>+		if (sk->sk_err != 0 ||
>+		    (sk->sk_shutdown & RCV_SHUTDOWN) ||
>+		    (vsk->peer_shutdown & SEND_SHUTDOWN)) {
>+			break;
>+		}
>+
>+		/* Don't wait for non-blocking sockets. */
>+		if (timeout == 0) {
>+			err = -EAGAIN;
>+			break;
>+		}
>+
>+		if (recv_data) {
>+			err = transport->notify_recv_pre_block(vsk, target, recv_data);
>+			if (err < 0)
>+				break;
>+		}
>+
>+		release_sock(sk);
>+		timeout = schedule_timeout(timeout);
>+		lock_sock(sk);
>+
>+		if (signal_pending(current)) {
>+			err = sock_intr_errno(timeout);
>+			break;
>+		} else if (timeout == 0) {
>+			err = -EAGAIN;
>+			break;
>+		}
>+	}
>+
>+	finish_wait(sk_sleep(sk), wait);
>+
>+	if (err)
>+		return err;
>+
>+	/* Internal transport error when checking for available
>+	 * data. XXX This should be changed to a connection
>+	 * reset in a later change.
>+	 */
>+	if (data < 0)
>+		return -ENOMEM;
>+
>+	return data;
>+}
>+
> static int
> vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 			  int flags)
>@@ -1911,85 +1973,34 @@ vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
>
>
> 	while (1) {
>-		s64 ready;
>-
>-		prepare_to_wait(sk_sleep(sk), &wait, TASK_INTERRUPTIBLE);
>-		ready = vsock_stream_has_data(vsk);
>-
>-		if (ready == 0) {
>-			if (sk->sk_err != 0 ||
>-			    (sk->sk_shutdown & RCV_SHUTDOWN) ||
>-			    (vsk->peer_shutdown & SEND_SHUTDOWN)) {
>-				finish_wait(sk_sleep(sk), &wait);
>-				break;
>-			}
>-			/* Don't wait for non-blocking sockets. */
>-			if (timeout == 0) {
>-				err = -EAGAIN;
>-				finish_wait(sk_sleep(sk), &wait);
>-				break;
>-			}
>+		ssize_t read;
>
>-			err = transport->notify_recv_pre_block(
>-					vsk, target, &recv_data);
>-			if (err < 0) {
>-				finish_wait(sk_sleep(sk), &wait);
>-				break;
>-			}
>-			release_sock(sk);
>-			timeout = schedule_timeout(timeout);
>-			lock_sock(sk);
>+		err = vsock_wait_data(sk, &wait, timeout, &recv_data, target);
>+		if (err <= 0)
>+			break;
>
>-			if (signal_pending(current)) {
>-				err = sock_intr_errno(timeout);
>-				finish_wait(sk_sleep(sk), &wait);
>-				break;
>-			} else if (timeout == 0) {
>-				err = -EAGAIN;
>-				finish_wait(sk_sleep(sk), &wait);
>-				break;
>-			}
>-		} else {
>-			ssize_t read;
>-
>-			finish_wait(sk_sleep(sk), &wait);
>-
>-			if (ready < 0) {
>-				/* Invalid queue pair content. XXX This should
>-				* be changed to a connection reset in a later
>-				* change.
>-				*/
>-
>-				err = -ENOMEM;
>-				goto out;
>-			}
>-
>-			err = transport->notify_recv_pre_dequeue(
>-					vsk, target, &recv_data);
>-			if (err < 0)
>-				break;
>+		err = transport->notify_recv_pre_dequeue(vsk, target,
>+							 &recv_data);
>+		if (err < 0)
>+			break;
>
>-			read = transport->stream_dequeue(
>-					vsk, msg,
>-					len - copied, flags);
>-			if (read < 0) {
>-				err = -ENOMEM;
>-				break;
>-			}
>+		read = transport->stream_dequeue(vsk, msg, len - copied, flags);
>+		if (read < 0) {
>+			err = -ENOMEM;
>+			break;
>+		}
>
>-			copied += read;
>+		copied += read;
>
>-			err = transport->notify_recv_post_dequeue(
>-					vsk, target, read,
>-					!(flags & MSG_PEEK), &recv_data);
>-			if (err < 0)
>-				goto out;
>+		err = transport->notify_recv_post_dequeue(vsk, target, read,
>+						!(flags & MSG_PEEK), &recv_data);
>+		if (err < 0)
>+			goto out;
>
>-			if (read >= target || flags & MSG_PEEK)
>-				break;
>+		if (read >= target || flags & MSG_PEEK)
>+			break;
>
>-			target -= read;
>-		}
>+		target -= read;
> 	}
>
> 	if (sk->sk_err)
>-- 
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
