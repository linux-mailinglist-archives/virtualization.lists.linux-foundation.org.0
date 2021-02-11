Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 14435318949
	for <lists.virtualization@lfdr.de>; Thu, 11 Feb 2021 12:24:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF269873FE;
	Thu, 11 Feb 2021 11:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZhmlJXygAlk; Thu, 11 Feb 2021 11:24:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 571E1873F4;
	Thu, 11 Feb 2021 11:24:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 370AAC013A;
	Thu, 11 Feb 2021 11:24:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25754C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 11:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0D117869E4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 11:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-qysB3vLFhn
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 11:24:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 721E3869E3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613042652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jsFQLvTrgFrLgJfF0P6gQ1rEY89A4uU+A6tP6gqPGzI=;
 b=JrCKABglCy75CFULDOnW2L18PrevDzpuMS+ucqVX+kIwM4fo1XfCmJY+IZxTgHy39ppQib
 YAIwS0cz0L8UGSiqA2kEFgLZRyOTIIo1b7uSoBv+J2dw3pMzd6UDr+PwdW47l/LIrcHnzV
 xBS9ki5lW4ZoJn+1MjWCXvgZiE2Ikws=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-2Yg5h6oHMJGRidNTLUNoeQ-1; Thu, 11 Feb 2021 06:24:10 -0500
X-MC-Unique: 2Yg5h6oHMJGRidNTLUNoeQ-1
Received: by mail-ej1-f70.google.com with SMTP id n25so4742308ejd.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 03:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jsFQLvTrgFrLgJfF0P6gQ1rEY89A4uU+A6tP6gqPGzI=;
 b=Zr2DNVRGIAPRYMcy1pvjalgNyKgG4w/jLLa7jYn5nCGqzrzfS+pDip8OAQW/IJVLbk
 b2Tjf0Dn71Sd+DXQbXNmZd/nGa1cowyJv/0Im/Dz2qD6/TqsQEFHoH+Ym/W5HidI2kF0
 52M9sNLolCmEGD+crkSZlkPkIzJA0LZ0X3aZPVTZ1cX7gGZ4iUo2o7HbyYHbYfRZ5qMt
 IRtCRHQPEM2BAXI7PNnpHeCm4Yk18VzQzFm8v5mqMbkSQz5eXZiOVr9c18dU8U+jGndg
 IOZB8BCB5d+ga5dUs9wwhCk+2AcfLHNgaoTcdG0sbgQpMZMgAoWEAXYuTQYOgxWKU867
 TSBg==
X-Gm-Message-State: AOAM531RWHsPElmHeZVDT6J0U7y7vibmYXbCExWLFvIZAMDzp4h2IQjM
 y/MomrnTVGSFs7HjLdtY8+aQxXHylq2F2j58Y3kC3XPjeAz+NgUSaTBqgtGkwMHd5f1tiFbLJWT
 xuacLdQeJMaqqJPiE3PhcaioyYAaoJLOy5JJ4f654jg==
X-Received: by 2002:a17:906:2898:: with SMTP id
 o24mr7925097ejd.215.1613042649433; 
 Thu, 11 Feb 2021 03:24:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1BcH+8XhReWwB41yfcl5jxF05aOvARXZuhUzHPDVsQ+y/97BjHWEuNLhAxUoPtrlmcVmcWQ==
X-Received: by 2002:a17:906:2898:: with SMTP id
 o24mr7925012ejd.215.1613042648077; 
 Thu, 11 Feb 2021 03:24:08 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id u3sm3944113eje.63.2021.02.11.03.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 03:24:07 -0800 (PST)
Date: Thu, 11 Feb 2021 12:24:04 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v4 02/17] af_vsock: separate wait data loop
Message-ID: <20210211112404.rwa55a6egstpskj2@steredhat>
References: <20210207151259.803917-1-arseny.krasnov@kaspersky.com>
 <20210207151451.804498-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210207151451.804498-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, stsp2@yandex.ru,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 oxffffaa@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
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

On Sun, Feb 07, 2021 at 06:14:48PM +0300, Arseny Krasnov wrote:
>This moves wait loop for data to dedicated function, because later
>it will be used by SEQPACKET data receive loop.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> net/vmw_vsock/af_vsock.c | 158 +++++++++++++++++++++------------------
> 1 file changed, 86 insertions(+), 72 deletions(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index f4fabec50650..38927695786f 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1833,6 +1833,71 @@ static int vsock_connectible_sendmsg(struct socket *sock, struct msghdr *msg,
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
>+			goto out;
>+		}
>+
>+		/* Don't wait for non-blocking sockets. */
>+		if (timeout == 0) {
>+			err = -EAGAIN;
>+			goto out;
>+		}
>+
>+		if (recv_data) {
>+			err = transport->notify_recv_pre_block(vsk, target, recv_data);
>+			if (err < 0)
>+				goto out;
>+		}
>+
>+		release_sock(sk);
>+		timeout = schedule_timeout(timeout);
>+		lock_sock(sk);
>+
>+		if (signal_pending(current)) {
>+			err = sock_intr_errno(timeout);
>+			goto out;
>+		} else if (timeout == 0) {
>+			err = -EAGAIN;
>+			goto out;
>+		}
>+	}
>+
>+	finish_wait(sk_sleep(sk), wait);
>+
>+	/* Invalid queue pair content. XXX This should
>+	 * be changed to a connection reset in a later
>+	 * change.
>+	 */
>+	if (data < 0)
>+		return -ENOMEM;
>+
>+	/* Have some data, return. */
>+	if (data)
>+		return data;

IIUC here data must be != 0 so you can simply return data in any case.

Or cleaner, you can do 'break' instead of 'goto out' in the error paths 
and after the while loop you can do something like this:

	finish_wait(sk_sleep(sk), wait);

	if (err)
		return err;

	if (data < 0)
		return -ENOMEM;

	return data;
}

>+
>+out:
>+	finish_wait(sk_sleep(sk), wait);
>+	return err;
>+}
>+
> static int
> vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 			  int flags)
>@@ -1912,85 +1977,34 @@ vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
>
>
> 	while (1) {
>-		s64 ready;
>+		ssize_t read;
>
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
>-
>-			err = transport->notify_recv_pre_block(
>-					vsk, target, &recv_data);
>-			if (err < 0) {
>-				finish_wait(sk_sleep(sk), &wait);
>-				break;
>-			}
>-			release_sock(sk);
>-			timeout = schedule_timeout(timeout);
>-			lock_sock(sk);
>-
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
>+		err = vsock_wait_data(sk, &wait, timeout, &recv_data, target);
>+		if (err <= 0)
>+			break;
>
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

This part looks okay, maybe we could improve the loop a bit and make it 
more readable, but it's out of the scope of this patch.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
