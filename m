Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 709AF3ACC5C
	for <lists.virtualization@lfdr.de>; Fri, 18 Jun 2021 15:35:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 235DD83B18;
	Fri, 18 Jun 2021 13:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZLsxsGdpSRY; Fri, 18 Jun 2021 13:35:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2208583B2E;
	Fri, 18 Jun 2021 13:35:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B207BC000B;
	Fri, 18 Jun 2021 13:35:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C289C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CF1560AD8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VTug0F2yyk_X
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA62660AD0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624023351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dXqmNJYdW4k2bFeB+YFnzlxYcdTW1K7N5BohB9KAzV0=;
 b=D8omukd5nmfJ9xmsKEfKEkzPsgssNyuZul6yINq6hxaac56oQNiDtmUHt1AxDfP5YH2lZu
 tpYB+LVHmoAbrRYpDPcsLE293+59oN+DUMouz7gc6oKHnVKSFBgNAFHOFJh0xRvQmB51bA
 3M4CeBOs/us7LWHaGtIpoqin/GYEo6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-wOd1bvkeOcuyxnn8SmCVng-1; Fri, 18 Jun 2021 09:35:48 -0400
X-MC-Unique: wOd1bvkeOcuyxnn8SmCVng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43348CC623;
 Fri, 18 Jun 2021 13:35:47 +0000 (UTC)
Received: from steredhat.lan (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE7571000324;
 Fri, 18 Jun 2021 13:35:38 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 2/3] vsock: rename vsock_wait_data()
Date: Fri, 18 Jun 2021 15:35:25 +0200
Message-Id: <20210618133526.300347-3-sgarzare@redhat.com>
In-Reply-To: <20210618133526.300347-1-sgarzare@redhat.com>
References: <20210618133526.300347-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

vsock_wait_data() is used only by STREAM and SEQPACKET sockets,
so let's rename it to vsock_connectible_wait_data(), using the same
nomenclature (connectible) used in other functions after the
introduction of SEQPACKET.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/af_vsock.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index de8249483081..21ccf450e249 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -1866,10 +1866,11 @@ static int vsock_connectible_sendmsg(struct socket *sock, struct msghdr *msg,
 	return err;
 }
 
-static int vsock_wait_data(struct sock *sk, struct wait_queue_entry *wait,
-			   long timeout,
-			   struct vsock_transport_recv_notify_data *recv_data,
-			   size_t target)
+static int vsock_connectible_wait_data(struct sock *sk,
+				       struct wait_queue_entry *wait,
+				       long timeout,
+				       struct vsock_transport_recv_notify_data *recv_data,
+				       size_t target)
 {
 	const struct vsock_transport *transport;
 	struct vsock_sock *vsk;
@@ -1967,7 +1968,8 @@ static int __vsock_stream_recvmsg(struct sock *sk, struct msghdr *msg,
 	while (1) {
 		ssize_t read;
 
-		err = vsock_wait_data(sk, &wait, timeout, &recv_data, target);
+		err = vsock_connectible_wait_data(sk, &wait, timeout,
+						  &recv_data, target);
 		if (err <= 0)
 			break;
 
@@ -2022,7 +2024,7 @@ static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr *msg,
 
 	timeout = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
 
-	err = vsock_wait_data(sk, &wait, timeout, NULL, 0);
+	err = vsock_connectible_wait_data(sk, &wait, timeout, NULL, 0);
 	if (err <= 0)
 		goto out;
 
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
