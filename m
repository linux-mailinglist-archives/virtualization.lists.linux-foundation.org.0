Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 88501BF91E
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 20:24:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 29B3EDBE;
	Thu, 26 Sep 2019 18:24:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D871ADA7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 18:24:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 57207844
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 18:24:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r19so3863023wmh.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wFzdQhWIvc4o013rKOjzXnkI0hw4CN3pNRalveb6WiY=;
	b=mlp9FZYjOcggNH5ah+Qu7XKJxpriLOVjPbYSJUxzDQE8StmLy/n03BoLkT0LvUWjja
	e5tEkQoSBIZSG+LRNf2ZwwauoeqWgj1ej4+saLQORMZ/cUaMprLri8l9hro+6lK48We2
	0X27RKQomTIS4EI7rP9ZRw7nbZ+DscF2TqUY3402NDsR3nJPeMC3M4qfEos7bSQ2fQMe
	kWBPIELUdz2FEmQWBzI7PUxGCMld6sqKBPWf/P7pQ3ybgW0mL3SItSsOMhlNGgBcjEkG
	dFxwGjUZKZy4cLc8687J0pjtKJCc3j0YNLzVrewtKir/+eC/FtcwTQ14mBa+63qhAkbS
	jGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wFzdQhWIvc4o013rKOjzXnkI0hw4CN3pNRalveb6WiY=;
	b=TZNb2U+7lxxhOD9P1jiTFhGjsU7aBOuTTAe+REwHbtePrRrqzhaEl5HrTuk+nL/NNp
	xFoDfhhEyARXR0f9KrxfO4o0GlEOZdqeO9UHBg4zt7Mvyrd6pwwZSc1wcNQEO2ujxr7L
	wZ7f2lpemH2AJy9T40mj6btXcZ6wndFphey4GvnqjAUEMApQ3okNfrbMDwbH6G8dRt22
	BF7cQEFgjHypXpzs4+Q014D6uRHbrUfR/32zW+W4Ah+hSq7MjWb+4CvP2O9eQQj/Y92r
	pNv6JR+bmwzjLW0HsFSIYOXD0lwwq8bO3IQm0FortsYLDK4h++26sFx9GDT00AyH6xsa
	Gf3g==
X-Gm-Message-State: APjAAAUlFxjnKuc5RARr2rs5NWUHN+8gXMqDCznHEsiN1Yn8IiOJ5ULI
	wKeNTbUvGsHTrWZ0lOvekkY=
X-Google-Smtp-Source: APXvYqy32luIXUjI1tWlLHkiv6GgGQPfBm9QTxPNQ0lhqDsuVqOaSF3mmVMHuM4QQNFD40ARFyIDag==
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr3932165wmi.108.1569522238802; 
	Thu, 26 Sep 2019 11:23:58 -0700 (PDT)
Received: from scw-93ddc8.cloud.online.net ([2001:bc8:4400:2400::302d])
	by smtp.googlemail.com with ESMTPSA id
	t13sm4890wra.70.2019.09.26.11.23.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Sep 2019 11:23:57 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: stefanha@redhat.com
Subject: [PATCH] vsock/virtio: add support for MSG_PEEK
Date: Thu, 26 Sep 2019 18:23:34 +0000
Message-Id: <1569522214-28223-1-git-send-email-matiasevara@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, matiasevara@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, davem@davemloft.net,
	sgarzare@redhat.com
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
 net/vmw_vsock/virtio_transport_common.c | 50 +++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 94cc0fa..938f2ed 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -264,6 +264,50 @@ static int virtio_transport_send_credit_update(struct vsock_sock *vsk,
 }
 
 static ssize_t
+virtio_transport_stream_do_peek(struct vsock_sock *vsk,
+				struct msghdr *msg,
+				size_t len)
+{
+	struct virtio_vsock_sock *vvs = vsk->trans;
+	struct virtio_vsock_pkt *pkt;
+	size_t bytes, total = 0;
+	int err = -EFAULT;
+
+	spin_lock_bh(&vvs->rx_lock);
+
+	list_for_each_entry(pkt, &vvs->rx_queue, list) {
+		if (total == len)
+			break;
+
+		bytes = len - total;
+		if (bytes > pkt->len - pkt->off)
+			bytes = pkt->len - pkt->off;
+
+		/* sk_lock is held by caller so no one else can dequeue.
+		 * Unlock rx_lock since memcpy_to_msg() may sleep.
+		 */
+		spin_unlock_bh(&vvs->rx_lock);
+
+		err = memcpy_to_msg(msg, pkt->buf + pkt->off, bytes);
+		if (err)
+			goto out;
+
+		spin_lock_bh(&vvs->rx_lock);
+
+		total += bytes;
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
@@ -330,9 +374,9 @@ virtio_transport_stream_dequeue(struct vsock_sock *vsk,
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
