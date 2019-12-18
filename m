Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937312502B
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 19:07:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 245438506D;
	Wed, 18 Dec 2019 18:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nargdhHnHD-J; Wed, 18 Dec 2019 18:07:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 34FB48582C;
	Wed, 18 Dec 2019 18:07:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 292DFC077D;
	Wed, 18 Dec 2019 18:07:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30CE7C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 206F820431
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R1Rmn26M5WV8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id BB91C2014B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576692458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Bswzipg/wW4k9QMFQpExONm3qDrCwLdO1TlY5CPDow=;
 b=YmVLytEdy5SkEzJFrlkPxg/1+PYYmN+hDl0dQmsx+I4nauycYbbuUv2DaBTde1l12lpSe2
 csxPLz6oi+S9CsAHC/JRSnvZRs13uJtuRarK850wZzxTFBnjKI8vz0kaSI/476W4OTxxb4
 TpwHFi5t+XosTKtOdbqhjkezg6Xs50w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-K8zRqRR-NaOSCOvgPOkZGQ-1; Wed, 18 Dec 2019 13:07:34 -0500
X-MC-Unique: K8zRqRR-NaOSCOvgPOkZGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C08F21007271;
 Wed, 18 Dec 2019 18:07:32 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-218.ams2.redhat.com
 [10.36.117.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C2905D9E2;
 Wed, 18 Dec 2019 18:07:27 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net-next v3 04/11] VSOCK: extract connect/accept functions
 from vsock_diag_test.c
Date: Wed, 18 Dec 2019 19:07:01 +0100
Message-Id: <20191218180708.120337-5-sgarzare@redhat.com>
In-Reply-To: <20191218180708.120337-1-sgarzare@redhat.com>
References: <20191218180708.120337-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jorgen Hansen <jhansen@vmware.com>
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Many test cases will need to connect to the server or accept incoming
connections.  This patch extracts these operations into utility
functions that can be reused.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/util.c            | 108 ++++++++++++++++++++++++++
 tools/testing/vsock/util.h            |   6 ++
 tools/testing/vsock/vsock_diag_test.c |  81 ++-----------------
 3 files changed, 119 insertions(+), 76 deletions(-)

diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
index f40f45b36d2f..f838bcee3589 100644
--- a/tools/testing/vsock/util.c
+++ b/tools/testing/vsock/util.c
@@ -11,8 +11,10 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <signal.h>
+#include <unistd.h>
 
 #include "timeout.h"
+#include "control.h"
 #include "util.h"
 
 /* Install signal handlers */
@@ -41,6 +43,112 @@ unsigned int parse_cid(const char *str)
 	return n;
 }
 
+/* Connect to <cid, port> and return the file descriptor. */
+int vsock_stream_connect(unsigned int cid, unsigned int port)
+{
+	union {
+		struct sockaddr sa;
+		struct sockaddr_vm svm;
+	} addr = {
+		.svm = {
+			.svm_family = AF_VSOCK,
+			.svm_port = port,
+			.svm_cid = cid,
+		},
+	};
+	int ret;
+	int fd;
+
+	control_expectln("LISTENING");
+
+	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
+
+	timeout_begin(TIMEOUT);
+	do {
+		ret = connect(fd, &addr.sa, sizeof(addr.svm));
+		timeout_check("connect");
+	} while (ret < 0 && errno == EINTR);
+	timeout_end();
+
+	if (ret < 0) {
+		int old_errno = errno;
+
+		close(fd);
+		fd = -1;
+		errno = old_errno;
+	}
+	return fd;
+}
+
+/* Listen on <cid, port> and return the first incoming connection.  The remote
+ * address is stored to clientaddrp.  clientaddrp may be NULL.
+ */
+int vsock_stream_accept(unsigned int cid, unsigned int port,
+			struct sockaddr_vm *clientaddrp)
+{
+	union {
+		struct sockaddr sa;
+		struct sockaddr_vm svm;
+	} addr = {
+		.svm = {
+			.svm_family = AF_VSOCK,
+			.svm_port = port,
+			.svm_cid = cid,
+		},
+	};
+	union {
+		struct sockaddr sa;
+		struct sockaddr_vm svm;
+	} clientaddr;
+	socklen_t clientaddr_len = sizeof(clientaddr.svm);
+	int fd;
+	int client_fd;
+	int old_errno;
+
+	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
+
+	if (bind(fd, &addr.sa, sizeof(addr.svm)) < 0) {
+		perror("bind");
+		exit(EXIT_FAILURE);
+	}
+
+	if (listen(fd, 1) < 0) {
+		perror("listen");
+		exit(EXIT_FAILURE);
+	}
+
+	control_writeln("LISTENING");
+
+	timeout_begin(TIMEOUT);
+	do {
+		client_fd = accept(fd, &clientaddr.sa, &clientaddr_len);
+		timeout_check("accept");
+	} while (client_fd < 0 && errno == EINTR);
+	timeout_end();
+
+	old_errno = errno;
+	close(fd);
+	errno = old_errno;
+
+	if (client_fd < 0)
+		return client_fd;
+
+	if (clientaddr_len != sizeof(clientaddr.svm)) {
+		fprintf(stderr, "unexpected addrlen from accept(2), %zu\n",
+			(size_t)clientaddr_len);
+		exit(EXIT_FAILURE);
+	}
+	if (clientaddr.sa.sa_family != AF_VSOCK) {
+		fprintf(stderr, "expected AF_VSOCK from accept(2), got %d\n",
+			clientaddr.sa.sa_family);
+		exit(EXIT_FAILURE);
+	}
+
+	if (clientaddrp)
+		*clientaddrp = clientaddr.svm;
+	return client_fd;
+}
+
 /* Run test cases.  The program terminates if a failure occurs. */
 void run_tests(const struct test_case *test_cases,
 	       const struct test_opts *opts)
diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
index 033e7d59a42a..1786305cfddd 100644
--- a/tools/testing/vsock/util.h
+++ b/tools/testing/vsock/util.h
@@ -2,6 +2,9 @@
 #ifndef UTIL_H
 #define UTIL_H
 
+#include <sys/socket.h>
+#include <linux/vm_sockets.h>
+
 /* Tests can either run as the client or the server */
 enum test_mode {
 	TEST_MODE_UNSET,
@@ -30,6 +33,9 @@ struct test_case {
 
 void init_signals(void);
 unsigned int parse_cid(const char *str);
+int vsock_stream_connect(unsigned int cid, unsigned int port);
+int vsock_stream_accept(unsigned int cid, unsigned int port,
+			struct sockaddr_vm *clientaddrp);
 void run_tests(const struct test_case *test_cases,
 	       const struct test_opts *opts);
 
diff --git a/tools/testing/vsock/vsock_diag_test.c b/tools/testing/vsock/vsock_diag_test.c
index 944c8a72eed7..abd7dc2a9631 100644
--- a/tools/testing/vsock/vsock_diag_test.c
+++ b/tools/testing/vsock/vsock_diag_test.c
@@ -13,13 +13,11 @@
 #include <string.h>
 #include <errno.h>
 #include <unistd.h>
-#include <sys/socket.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <linux/list.h>
 #include <linux/net.h>
 #include <linux/netlink.h>
-#include <linux/vm_sockets.h>
 #include <linux/sock_diag.h>
 #include <linux/vm_sockets_diag.h>
 #include <netinet/tcp.h>
@@ -378,33 +376,12 @@ static void test_listen_socket_server(const struct test_opts *opts)
 
 static void test_connect_client(const struct test_opts *opts)
 {
-	union {
-		struct sockaddr sa;
-		struct sockaddr_vm svm;
-	} addr = {
-		.svm = {
-			.svm_family = AF_VSOCK,
-			.svm_port = 1234,
-			.svm_cid = opts->peer_cid,
-		},
-	};
 	int fd;
-	int ret;
 	LIST_HEAD(sockets);
 	struct vsock_stat *st;
 
-	control_expectln("LISTENING");
-
-	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
-
-	timeout_begin(TIMEOUT);
-	do {
-		ret = connect(fd, &addr.sa, sizeof(addr.svm));
-		timeout_check("connect");
-	} while (ret < 0 && errno == EINTR);
-	timeout_end();
-
-	if (ret < 0) {
+	fd = vsock_stream_connect(opts->peer_cid, 1234);
+	if (fd < 0) {
 		perror("connect");
 		exit(EXIT_FAILURE);
 	}
@@ -424,66 +401,19 @@ static void test_connect_client(const struct test_opts *opts)
 
 static void test_connect_server(const struct test_opts *opts)
 {
-	union {
-		struct sockaddr sa;
-		struct sockaddr_vm svm;
-	} addr = {
-		.svm = {
-			.svm_family = AF_VSOCK,
-			.svm_port = 1234,
-			.svm_cid = VMADDR_CID_ANY,
-		},
-	};
-	union {
-		struct sockaddr sa;
-		struct sockaddr_vm svm;
-	} clientaddr;
-	socklen_t clientaddr_len = sizeof(clientaddr.svm);
-	LIST_HEAD(sockets);
 	struct vsock_stat *st;
-	int fd;
+	LIST_HEAD(sockets);
 	int client_fd;
 
-	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
-
-	if (bind(fd, &addr.sa, sizeof(addr.svm)) < 0) {
-		perror("bind");
-		exit(EXIT_FAILURE);
-	}
-
-	if (listen(fd, 1) < 0) {
-		perror("listen");
-		exit(EXIT_FAILURE);
-	}
-
-	control_writeln("LISTENING");
-
-	timeout_begin(TIMEOUT);
-	do {
-		client_fd = accept(fd, &clientaddr.sa, &clientaddr_len);
-		timeout_check("accept");
-	} while (client_fd < 0 && errno == EINTR);
-	timeout_end();
-
+	client_fd = vsock_stream_accept(VMADDR_CID_ANY, 1234, NULL);
 	if (client_fd < 0) {
 		perror("accept");
 		exit(EXIT_FAILURE);
 	}
-	if (clientaddr.sa.sa_family != AF_VSOCK) {
-		fprintf(stderr, "expected AF_VSOCK from accept(2), got %d\n",
-			clientaddr.sa.sa_family);
-		exit(EXIT_FAILURE);
-	}
-	if (clientaddr.svm.svm_cid != opts->peer_cid) {
-		fprintf(stderr, "expected peer CID %u from accept(2), got %u\n",
-			opts->peer_cid, clientaddr.svm.svm_cid);
-		exit(EXIT_FAILURE);
-	}
 
 	read_vsock_stat(&sockets);
 
-	check_num_sockets(&sockets, 2);
-	find_vsock_stat(&sockets, fd);
+	check_num_sockets(&sockets, 1);
 	st = find_vsock_stat(&sockets, client_fd);
 	check_socket_state(st, TCP_ESTABLISHED);
 
@@ -491,7 +421,6 @@ static void test_connect_server(const struct test_opts *opts)
 	control_expectln("DONE");
 
 	close(client_fd);
-	close(fd);
 	free_sock_stat(&sockets);
 }
 
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
