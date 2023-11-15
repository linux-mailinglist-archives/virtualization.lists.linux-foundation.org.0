Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B76197E3BA7
	for <lists.virtualization@lfdr.de>; Tue,  7 Nov 2023 13:08:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A932417EA;
	Tue,  7 Nov 2023 12:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A932417EA
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ft7CiEbI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8CtJzF5hG4Vu; Tue,  7 Nov 2023 12:08:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B721D41480;
	Tue,  7 Nov 2023 12:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B721D41480
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA06CC008C;
	Tue,  7 Nov 2023 12:08:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 578C8C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Nov 2023 12:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25C2742171
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Nov 2023 12:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25C2742171
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=Ft7CiEbI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytlqr4YZt2no
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Nov 2023 12:08:18 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3414942170
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Nov 2023 12:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3414942170
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5F6D0B81690;
 Tue,  7 Nov 2023 12:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDD0C433CA;
 Tue,  7 Nov 2023 12:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699358895;
 bh=q4YJap9+E3vrfXB4ogEHuOmxTN52MNFYxRfJwMNDyvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ft7CiEbISl0LfINgOfQ+mu+zqSDLkdoOyouQZRa9HpCpN9kxvjSuRHYR+FMUsB4tt
 TdKnkX6xGC9zXUGnFN6JCZW5sPE15eKe/xyhYJBjDPRljbd9bTkBAda3Yda5v4YFDS
 FOz/lhreYxh0tVIj5grPGRSdDyzViwplKncpSWTdppkNkrY3kbXDa837T8mV5cW17i
 6H31qkZYkxwCR/Z9oSs0jOOReMr/jF+KRtQ4SdsRRSpY7J9oCYor2t9kSoYCgzQA+b
 MQ1wBQogSDoVOn7r6w5/05VizNETo+Lv/P+pZfLqmkElaL6kEnq5NsnWhtewL6z0Yx
 SufpulGPUouGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 21/31] vsock: read from socket's error queue
Date: Tue,  7 Nov 2023 07:06:08 -0500
Message-ID: <20231107120704.3756327-21-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120704.3756327-1-sashal@kernel.org>
References: <20231107120704.3756327-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Cc: Sasha Levin <sashal@kernel.org>, alexander@mihalicyn.com,
 netdev@vger.kernel.org, Arseniy Krasnov <avkrasnov@salutedevices.com>,
 virtualization@lists.linux-foundation.org, dhowells@redhat.com,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 "David S . Miller" <davem@davemloft.net>
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

From: Arseniy Krasnov <avkrasnov@salutedevices.com>

[ Upstream commit 49dbe25adac42d3e06f65d1420946bec65896222 ]

This adds handling of MSG_ERRQUEUE input flag in receive call. This flag
is used to read socket's error queue instead of data queue. Possible
scenario of error queue usage is receiving completions for transmission
with MSG_ZEROCOPY flag. This patch also adds new defines: 'SOL_VSOCK'
and 'VSOCK_RECVERR'.

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/socket.h          |  1 +
 include/uapi/linux/vm_sockets.h | 17 +++++++++++++++++
 net/vmw_vsock/af_vsock.c        |  6 ++++++
 3 files changed, 24 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 39b74d83c7c4a..cfcb7e2c3813f 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -383,6 +383,7 @@ struct ucred {
 #define SOL_MPTCP	284
 #define SOL_MCTP	285
 #define SOL_SMC		286
+#define SOL_VSOCK	287
 
 /* IPX options */
 #define IPX_TYPE	1
diff --git a/include/uapi/linux/vm_sockets.h b/include/uapi/linux/vm_sockets.h
index c60ca33eac594..ed07181d4eff9 100644
--- a/include/uapi/linux/vm_sockets.h
+++ b/include/uapi/linux/vm_sockets.h
@@ -191,4 +191,21 @@ struct sockaddr_vm {
 
 #define IOCTL_VM_SOCKETS_GET_LOCAL_CID		_IO(7, 0xb9)
 
+/* MSG_ZEROCOPY notifications are encoded in the standard error format,
+ * sock_extended_err. See Documentation/networking/msg_zerocopy.rst in
+ * kernel source tree for more details.
+ */
+
+/* 'cmsg_level' field value of 'struct cmsghdr' for notification parsing
+ * when MSG_ZEROCOPY flag is used on transmissions.
+ */
+
+#define SOL_VSOCK	287
+
+/* 'cmsg_type' field value of 'struct cmsghdr' for notification parsing
+ * when MSG_ZEROCOPY flag is used on transmissions.
+ */
+
+#define VSOCK_RECVERR	1
+
 #endif /* _UAPI_VM_SOCKETS_H */
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 020cf17ab7e47..ccd8cefeea7ba 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -89,6 +89,7 @@
 #include <linux/types.h>
 #include <linux/bitops.h>
 #include <linux/cred.h>
+#include <linux/errqueue.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -110,6 +111,7 @@
 #include <linux/workqueue.h>
 #include <net/sock.h>
 #include <net/af_vsock.h>
+#include <uapi/linux/vm_sockets.h>
 
 static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr);
 static void vsock_sk_destruct(struct sock *sk);
@@ -2134,6 +2136,10 @@ vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 	int err;
 
 	sk = sock->sk;
+
+	if (unlikely(flags & MSG_ERRQUEUE))
+		return sock_recv_errqueue(sk, msg, len, SOL_VSOCK, VSOCK_RECVERR);
+
 	vsk = vsock_sk(sk);
 	err = 0;
 
-- 
2.42.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
