Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D515E73C455
	for <lists.virtualization@lfdr.de>; Sat, 24 Jun 2023 00:56:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11655400BF;
	Fri, 23 Jun 2023 22:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11655400BF
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LjUh8YvE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCN4ylJzGRRN; Fri, 23 Jun 2023 22:56:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8C66D40960;
	Fri, 23 Jun 2023 22:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C66D40960
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C91B7C008C;
	Fri, 23 Jun 2023 22:56:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CF59C0029
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jun 2023 22:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA4B041FB3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jun 2023 22:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA4B041FB3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=LjUh8YvE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iUjQjzQiQgu
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jun 2023 22:56:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 698B741F7B
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 698B741F7B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jun 2023 22:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687560972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQVg0pnXVfTxPUpA8yd29SmocczyZN6S+xS0BIA8ljI=;
 b=LjUh8YvEjNgRuYhFHipmctUnHuLHh80KXWWObgLDIsL6sMlzIBuC8BBtrsTeRTTzjr/+xf
 KmeGCULuqtHWQV8AnCvSj+jV+bPjUumCrqxtl2Ck7CaZAtB6i3CUcv2LJ+6gpLbDAsKFNT
 6XwEYCOQ9kH+bQ4oAP1BIz7tnpnCwiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-ui08z6zkOsOzsb7oEUVtzw-1; Fri, 23 Jun 2023 18:56:05 -0400
X-MC-Unique: ui08z6zkOsOzsb7oEUVtzw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C7B7185A78B;
 Fri, 23 Jun 2023 22:56:04 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 240AF492C13;
 Fri, 23 Jun 2023 22:56:01 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v5 16/16] net: Kill MSG_SENDPAGE_NOTLAST
Date: Fri, 23 Jun 2023 23:55:13 +0100
Message-ID: <20230623225513.2732256-17-dhowells@redhat.com>
In-Reply-To: <20230623225513.2732256-1-dhowells@redhat.com>
References: <20230623225513.2732256-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Cc: linux-doc@vger.kernel.org, Alexander Duyck <alexander.duyck@gmail.com>,
 virtualization@lists.linux-foundation.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-afs@lists.infradead.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, linux-x25@vger.kernel.org,
 dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-can@vger.kernel.org,
 linux-hams@vger.kernel.org, mptcp@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, David Ahern <dsahern@kernel.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-sctp@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, bpf@vger.kernel.org, linux-wpan@vger.kernel.org,
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

Now that ->sendpage() has been removed, MSG_SENDPAGE_NOTLAST can be cleaned
up.  Things were converted to use MSG_MORE instead, but the protocol
sendpage stubs still convert MSG_SENDPAGE_NOTLAST to MSG_MORE, which is now
unnecessary.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Eric Dumazet <edumazet@google.com>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Jens Axboe <axboe@kernel.dk>
cc: Matthew Wilcox <willy@infradead.org>
cc: bpf@vger.kernel.org
cc: dccp@vger.kernel.org
cc: linux-afs@lists.infradead.org
cc: linux-arm-msm@vger.kernel.org
cc: linux-can@vger.kernel.org
cc: linux-crypto@vger.kernel.org
cc: linux-doc@vger.kernel.org
cc: linux-hams@vger.kernel.org
cc: linux-perf-users@vger.kernel.org
cc: linux-rdma@vger.kernel.org
cc: linux-sctp@vger.kernel.org
cc: linux-wpan@vger.kernel.org
cc: linux-x25@vger.kernel.org
cc: mptcp@lists.linux.dev
cc: netdev@vger.kernel.org
cc: rds-devel@oss.oracle.com
cc: tipc-discussion@lists.sourceforge.net
cc: virtualization@lists.linux-foundation.org
---

Notes:
    ver #3)
     - tcp_bpf is now handled by an earlier patch.

 include/linux/socket.h                         | 4 +---
 net/tls/tls_device.c                           | 3 +--
 net/tls/tls_main.c                             | 2 +-
 net/tls/tls_sw.c                               | 2 +-
 tools/perf/trace/beauty/include/linux/socket.h | 1 -
 tools/perf/trace/beauty/msg_flags.c            | 5 +----
 6 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 58204700018a..39b74d83c7c4 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -319,7 +319,6 @@ struct ucred {
 #define MSG_MORE	0x8000	/* Sender will send more */
 #define MSG_WAITFORONE	0x10000	/* recvmmsg(): block until 1+ packets avail */
 #define MSG_SENDPAGE_NOPOLICY 0x10000 /* sendpage() internal : do no apply policy */
-#define MSG_SENDPAGE_NOTLAST 0x20000 /* sendpage() internal : not the last page */
 #define MSG_BATCH	0x40000 /* sendmmsg(): more messages coming */
 #define MSG_EOF         MSG_FIN
 #define MSG_NO_SHARED_FRAGS 0x80000 /* sendpage() internal : page frags are not shared */
@@ -341,8 +340,7 @@ struct ucred {
 
 /* Flags to be cleared on entry by sendmsg and sendmmsg syscalls */
 #define MSG_INTERNAL_SENDMSG_FLAGS \
-	(MSG_SPLICE_PAGES | MSG_SENDPAGE_NOPOLICY | MSG_SENDPAGE_NOTLAST | \
-	 MSG_SENDPAGE_DECRYPTED)
+	(MSG_SPLICE_PAGES | MSG_SENDPAGE_NOPOLICY | MSG_SENDPAGE_DECRYPTED)
 
 /* Setsockoptions(2) level. Thanks to BSD these must match IPPROTO_xxx */
 #define SOL_IP		0
diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index 840ee06f1708..2021fe557e50 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -441,8 +441,7 @@ static int tls_push_data(struct sock *sk,
 	long timeo;
 
 	if (flags &
-	    ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL | MSG_SENDPAGE_NOTLAST |
-	      MSG_SPLICE_PAGES))
+	    ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL | MSG_SPLICE_PAGES))
 		return -EOPNOTSUPP;
 
 	if (unlikely(sk->sk_err))
diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index d5ed4d47b16e..b6896126bb92 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -127,7 +127,7 @@ int tls_push_sg(struct sock *sk,
 {
 	struct bio_vec bvec;
 	struct msghdr msg = {
-		.msg_flags = MSG_SENDPAGE_NOTLAST | MSG_SPLICE_PAGES | flags,
+		.msg_flags = MSG_SPLICE_PAGES | flags,
 	};
 	int ret = 0;
 	struct page *p;
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 9b3aa89a4292..53f944e6d8ef 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1194,7 +1194,7 @@ int tls_sw_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 
 	if (msg->msg_flags & ~(MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL |
 			       MSG_CMSG_COMPAT | MSG_SPLICE_PAGES |
-			       MSG_SENDPAGE_NOTLAST | MSG_SENDPAGE_NOPOLICY))
+			       MSG_SENDPAGE_NOPOLICY))
 		return -EOPNOTSUPP;
 
 	ret = mutex_lock_interruptible(&tls_ctx->tx_lock);
diff --git a/tools/perf/trace/beauty/include/linux/socket.h b/tools/perf/trace/beauty/include/linux/socket.h
index 13c3a237b9c9..3bef212a24d7 100644
--- a/tools/perf/trace/beauty/include/linux/socket.h
+++ b/tools/perf/trace/beauty/include/linux/socket.h
@@ -318,7 +318,6 @@ struct ucred {
 #define MSG_MORE	0x8000	/* Sender will send more */
 #define MSG_WAITFORONE	0x10000	/* recvmmsg(): block until 1+ packets avail */
 #define MSG_SENDPAGE_NOPOLICY 0x10000 /* sendpage() internal : do no apply policy */
-#define MSG_SENDPAGE_NOTLAST 0x20000 /* sendpage() internal : not the last page */
 #define MSG_BATCH	0x40000 /* sendmmsg(): more messages coming */
 #define MSG_EOF         MSG_FIN
 #define MSG_NO_SHARED_FRAGS 0x80000 /* sendpage() internal : page frags are not shared */
diff --git a/tools/perf/trace/beauty/msg_flags.c b/tools/perf/trace/beauty/msg_flags.c
index ea68db08b8e7..5cdebd7ece7e 100644
--- a/tools/perf/trace/beauty/msg_flags.c
+++ b/tools/perf/trace/beauty/msg_flags.c
@@ -8,9 +8,6 @@
 #ifndef MSG_WAITFORONE
 #define MSG_WAITFORONE		   0x10000
 #endif
-#ifndef MSG_SENDPAGE_NOTLAST
-#define MSG_SENDPAGE_NOTLAST	   0x20000
-#endif
 #ifndef MSG_FASTOPEN
 #define MSG_FASTOPEN		0x20000000
 #endif
@@ -50,7 +47,7 @@ static size_t syscall_arg__scnprintf_msg_flags(char *bf, size_t size,
 	P_MSG_FLAG(NOSIGNAL);
 	P_MSG_FLAG(MORE);
 	P_MSG_FLAG(WAITFORONE);
-	P_MSG_FLAG(SENDPAGE_NOTLAST);
+	P_MSG_FLAG(SPLICE_PAGES);
 	P_MSG_FLAG(FASTOPEN);
 	P_MSG_FLAG(CMSG_CLOEXEC);
 #undef P_MSG_FLAG

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
