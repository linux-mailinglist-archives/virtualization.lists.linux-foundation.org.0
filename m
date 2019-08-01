Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D31827DEFF
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 17:27:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F28CE19CA;
	Thu,  1 Aug 2019 15:26:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7F49E1992
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D0FE95F4
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:25:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65E35305E24D;
	Thu,  1 Aug 2019 15:25:59 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-63.ams2.redhat.com
	[10.36.117.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52041600C4;
	Thu,  1 Aug 2019 15:25:57 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 04/11] VSOCK: extract connect/accept functions from
	vsock_diag_test.c
Date: Thu,  1 Aug 2019 17:25:34 +0200
Message-Id: <20190801152541.245833-5-sgarzare@redhat.com>
In-Reply-To: <20190801152541.245833-1-sgarzare@redhat.com>
References: <20190801152541.245833-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 01 Aug 2019 15:25:59 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

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
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
