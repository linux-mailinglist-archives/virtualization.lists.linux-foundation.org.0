Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FA0C09C8
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 18:46:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A894FCBA;
	Fri, 27 Sep 2019 16:45:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CCAF7C87
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 16:45:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4F0318A7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 16:45:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n14so3910206wrw.9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=og90qbQAXOicdq5w4qtLw6dYo5vnyUk8y6wc3hp/goU=;
	b=RcW3JOWX3CaxFUDNoQDHbdGdVcFVnBOj7k7rc3z1VvB6lT5ldwqAICaj7FIaWmmLBa
	E3822z+bFuwc702xgCM2HYqCKR9wEOFKHpYR/ZP6ZTdL2lvmPnI6k3K9hvJQgeRY5yTC
	yMA5u4+AINc1hPUvJkP6yjv18x6r1XpxWZsXDcsqcGsGVCWWGTGlWudM0Ti6KMQoXvQf
	gL6MmMMALNqvxqz0Gg5Uq0k7NSNR+drcdLv5LJSN5eVRCkmMN0XiKC29r7quWU2erzOe
	xfNdMTKgKJs89lS7tv4BTRQhubJS/UTaAzzDX+mXoZc7ZTyvy8uqF98Zryq8oEGAWHgN
	cVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=og90qbQAXOicdq5w4qtLw6dYo5vnyUk8y6wc3hp/goU=;
	b=dkzwWMJk+0cBbJHPcIxu7KIZHAxMLlErd1fRux12xpBw2UsLDsBxn5wsnt6s588pB8
	aglWMtx9jrfrYomIZQUxJEGSMk15tTnbrjfQxwelinqCutz+liAc0zdUawvpPWwUaO0l
	M77N/cBHU6lGRVfoy4msiC0KT9JlKREPH3PRG5Ea0mCwqPq5UFIi6I8Q2ViH6DIP7dEQ
	TK6187Wu3orEMaRTCLCKar4W3GR7RVVL5F3WaKGQbAy70hggwD7A5x7G8YU+PkcjTBZu
	vhA7mPMnjMTLdCJsF9zj/i02+AN2T8DFUPpjol6Xk3EBYrS6ow2tlgm4Pgm3LEzVKjFX
	N/Sw==
X-Gm-Message-State: APjAAAXCX8wquFvSu6EpcFaih72IQVNG8MxwRR8f/cW8nLQGc5iQl+Ws
	tTsalNtXXyuE/X7U0fhzWrI=
X-Google-Smtp-Source: APXvYqzB8omaq85cbWYuSm9buXKmXpapBFdkbhwBVUoZfj9O4XopENPYw/IDgrNoGyrxG2qggAUQdQ==
X-Received: by 2002:a1c:cb05:: with SMTP id b5mr7750360wmg.79.1569602706717;
	Fri, 27 Sep 2019 09:45:06 -0700 (PDT)
Received: from scw-93ddc8.cloud.online.net ([2001:bc8:4400:2400::302d])
	by smtp.googlemail.com with ESMTPSA id
	h125sm11889243wmf.31.2019.09.27.09.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Sep 2019 09:45:05 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: stefanha@redhat.com
Subject: [PATCH v2] vsock/virtio: add support for MSG_PEEK
Date: Fri, 27 Sep 2019 16:44:23 +0000
Message-Id: <1569602663-16815-1-git-send-email-matiasevara@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569522214-28223-1-git-send-email-matiasevara@gmail.com>
References: <1569522214-28223-1-git-send-email-matiasevara@gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, matiasevara@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	eric.dumazet@gmail.com, davem@davemloft.net, sgarzare@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This patch adds support for MSG_PEEK. In such a case, packets are not
removed from the rx_queue and credit updates are not sent.

Signed-off-by: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
---
 net/vmw_vsock/virtio_transport_common.c | 55 +++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 94cc0fa..cf15751 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -264,6 +264,55 @@ static int virtio_transport_send_credit_update(struct vsock_sock *vsk,
 }
 
 static ssize_t
+virtio_transport_stream_do_peek(struct vsock_sock *vsk,
+				struct msghdr *msg,
+				size_t len)
+{
+	struct virtio_vsock_sock *vvs = vsk->trans;
+	struct virtio_vsock_pkt *pkt;
+	size_t bytes, total = 0, off;
+	int err = -EFAULT;
+
+	spin_lock_bh(&vvs->rx_lock);
+
+	list_for_each_entry(pkt, &vvs->rx_queue, list) {
+		off = pkt->off;
+
+		if (total == len)
+			break;
+
+		while (total < len && off < pkt->len) {
+			bytes = len - total;
+			if (bytes > pkt->len - off)
+				bytes = pkt->len - off;
+
+			/* sk_lock is held by caller so no one else can dequeue.
+			 * Unlock rx_lock since memcpy_to_msg() may sleep.
+			 */
+			spin_unlock_bh(&vvs->rx_lock);
+
+			err = memcpy_to_msg(msg, pkt->buf + off, bytes);
+			if (err)
+				goto out;
+
+			spin_lock_bh(&vvs->rx_lock);
+
+			total += bytes;
+			off += bytes;
+		}
+	}
+
+	spin_unlock_bh(&vvs->rx_lock);
+
+	return total;
+
+out:
+	if (total)
+		err = total;
+	return err;
+}
+
+static ssize_t
 virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
 				   struct msghdr *msg,
 				   size_t len)
@@ -330,9 +379,9 @@ virtio_transport_stream_dequeue(struct vsock_sock *vsk,
 				size_t len, int flags)
 {
 	if (flags & MSG_PEEK)
-		return -EOPNOTSUPP;
-
-	return virtio_transport_stream_do_dequeue(vsk, msg, len);
+		return virtio_transport_stream_do_peek(vsk, msg, len);
+	else
+		return virtio_transport_stream_do_dequeue(vsk, msg, len);
 }
 EXPORT_SYMBOL_GPL(virtio_transport_stream_dequeue);
 
-- 
2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
