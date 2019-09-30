Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 496FBC25F4
	for <lists.virtualization@lfdr.de>; Mon, 30 Sep 2019 20:26:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8914C1A9D;
	Mon, 30 Sep 2019 18:26:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D22601A96
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 18:26:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4112A8AE
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 18:26:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y19so12480841wrd.3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Km4VVTEePyhHsFimVMjuG3mAp67V52rIi2SimlK34MU=;
	b=F2+krCW9h4/vWnl412e0O5+BiYynOmqsu1GTfc8j8T1hPDRh/+RAH2TS+9oShSfFht
	+DRLSK6QkQUf/q9kVU0q0Wjwa/b7b9EPcbkMCthJ69y2UmK0Q9ohogmqOrjvF3Faovgn
	+c+DRShui0gK74MGaLgAd+Mf6ouSNMGaMZtUGB974GaAdsw7mHblL4mtYB9yIaygJ98L
	wHtVcQy0rnKX+4Eg8KQdFXrAf+QZ225nTNmyyTIW9Y+3Tcwls5KigSdvTnen9WScAozr
	V1YfI0PzPyhC3A2E1YaljJhKI3DQ0gqiXoBGXQvDawlO+2yHbso2owB0J6vnmQjBJ596
	HWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Km4VVTEePyhHsFimVMjuG3mAp67V52rIi2SimlK34MU=;
	b=ga38i94/uE7WSzRH8BBtsUlaj2NU2pR4+UtUty83trnXZNwZWY5XBzNN3cLhf73bGb
	mbmZovg0/jVjN9DfBUhb7bVEqapTqks8vCQrNdjE810GGvFRua+31wMQdo3kp/Cvmv/o
	temxhrwD1e59dr031f+Qae9UKnOmbieOYvKvwCmT05HatzADAWIme5ekW7hxE8ZP7orT
	Z/N2Pp3jNwL3gYcK34DJXacVdTofYUXKIbKGEZ80r1xuy6CYTv42SEjXLNr33C7pQKCr
	5TPNLWRrXIVJX4OHk+bn6CuqVSTiFe5ZRkmkICFxSNKGlKSYs63D9QJY573hJaesHGb4
	Lsiw==
X-Gm-Message-State: APjAAAV6Ci6CV5kAlmeJK2Ao/PcbA4WzG8uijxvHmG52l2mcadYwU2qL
	+oDJlyYGM0N7xNSEwCWdo9w=
X-Google-Smtp-Source: APXvYqzy7y5NjgWswAUhrWkzobKoCPCU2cj3zemHxu/pZIy6qbKJmrWtc0rOICC1+bZexktMTIyuxA==
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr14184701wru.198.1569867973583;
	Mon, 30 Sep 2019 11:26:13 -0700 (PDT)
Received: from scw-93ddc8.cloud.online.net ([2001:bc8:4400:2400::302d])
	by smtp.googlemail.com with ESMTPSA id
	r20sm15672256wrg.61.2019.09.30.11.26.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Sep 2019 11:26:13 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: stefanha@redhat.com
Subject: [PATCH net-next v2] vsock/virtio: add support for MSG_PEEK
Date: Mon, 30 Sep 2019 18:25:23 +0000
Message-Id: <1569867923-28200-1-git-send-email-matiasevara@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Tested-by: Stefano Garzarella <sgarzare@redhat.com>
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
