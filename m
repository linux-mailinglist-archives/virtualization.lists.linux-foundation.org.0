Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2937DEF9
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 17:27:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AEDD6606D;
	Thu,  1 Aug 2019 15:26:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 387D31992
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:25:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 728805F4
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:25:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF5FC3CA3F;
	Thu,  1 Aug 2019 15:25:56 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-63.ams2.redhat.com
	[10.36.117.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3FAC600C4;
	Thu,  1 Aug 2019 15:25:52 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 03/11] VSOCK: extract utility functions from
	vsock_diag_test.c
Date: Thu,  1 Aug 2019 17:25:33 +0200
Message-Id: <20190801152541.245833-4-sgarzare@redhat.com>
In-Reply-To: <20190801152541.245833-1-sgarzare@redhat.com>
References: <20190801152541.245833-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 01 Aug 2019 15:25:57 +0000 (UTC)
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

Move useful functions into a separate file in preparation for more
vsock test programs.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
 * aligned with the current SPDX [Stefano]
---
 tools/testing/vsock/Makefile          |  2 +-
 tools/testing/vsock/util.c            | 66 +++++++++++++++++++
 tools/testing/vsock/util.h            | 36 +++++++++++
 tools/testing/vsock/vsock_diag_test.c | 92 +++++++--------------------
 4 files changed, 125 insertions(+), 71 deletions(-)
 create mode 100644 tools/testing/vsock/util.c
 create mode 100644 tools/testing/vsock/util.h

diff --git a/tools/testing/vsock/Makefile b/tools/testing/vsock/Makefile
index d41a4e13960a..a916878a2d8c 100644
--- a/tools/testing/vsock/Makefile
+++ b/tools/testing/vsock/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 all: test
 test: vsock_diag_test
-vsock_diag_test: vsock_diag_test.o timeout.o control.o
+vsock_diag_test: vsock_diag_test.o timeout.o control.o util.o
 
 CFLAGS += -g -O2 -Werror -Wall -I. -I../../include -I../../../usr/include -Wno-pointer-sign -fno-strict-overflow -fno-strict-aliasing -fno-common -MMD -U_FORTIFY_SOURCE -D_GNU_SOURCE
 .PHONY: all test clean
diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
new file mode 100644
index 000000000000..f40f45b36d2f
--- /dev/null
+++ b/tools/testing/vsock/util.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vsock test utilities
+ *
+ * Copyright (C) 2017 Red Hat, Inc.
+ *
+ * Author: Stefan Hajnoczi <stefanha@redhat.com>
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <signal.h>
+
+#include "timeout.h"
+#include "util.h"
+
+/* Install signal handlers */
+void init_signals(void)
+{
+	struct sigaction act = {
+		.sa_handler = sigalrm,
+	};
+
+	sigaction(SIGALRM, &act, NULL);
+	signal(SIGPIPE, SIG_IGN);
+}
+
+/* Parse a CID in string representation */
+unsigned int parse_cid(const char *str)
+{
+	char *endptr = NULL;
+	unsigned long n;
+
+	errno = 0;
+	n = strtoul(str, &endptr, 10);
+	if (errno || *endptr != '\0') {
+		fprintf(stderr, "malformed CID \"%s\"\n", str);
+		exit(EXIT_FAILURE);
+	}
+	return n;
+}
+
+/* Run test cases.  The program terminates if a failure occurs. */
+void run_tests(const struct test_case *test_cases,
+	       const struct test_opts *opts)
+{
+	int i;
+
+	for (i = 0; test_cases[i].name; i++) {
+		void (*run)(const struct test_opts *opts);
+
+		printf("%s...", test_cases[i].name);
+		fflush(stdout);
+
+		if (opts->mode == TEST_MODE_CLIENT)
+			run = test_cases[i].run_client;
+		else
+			run = test_cases[i].run_server;
+
+		if (run)
+			run(opts);
+
+		printf("ok\n");
+	}
+}
diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
new file mode 100644
index 000000000000..033e7d59a42a
--- /dev/null
+++ b/tools/testing/vsock/util.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef UTIL_H
+#define UTIL_H
+
+/* Tests can either run as the client or the server */
+enum test_mode {
+	TEST_MODE_UNSET,
+	TEST_MODE_CLIENT,
+	TEST_MODE_SERVER
+};
+
+/* Test runner options */
+struct test_opts {
+	enum test_mode mode;
+	unsigned int peer_cid;
+};
+
+/* A test case definition.  Test functions must print failures to stderr and
+ * terminate with exit(EXIT_FAILURE).
+ */
+struct test_case {
+	const char *name; /* human-readable name */
+
+	/* Called when test mode is TEST_MODE_CLIENT */
+	void (*run_client)(const struct test_opts *opts);
+
+	/* Called when test mode is TEST_MODE_SERVER */
+	void (*run_server)(const struct test_opts *opts);
+};
+
+void init_signals(void);
+unsigned int parse_cid(const char *str);
+void run_tests(const struct test_case *test_cases,
+	       const struct test_opts *opts);
+
+#endif /* UTIL_H */
diff --git a/tools/testing/vsock/vsock_diag_test.c b/tools/testing/vsock/vsock_diag_test.c
index fc391e041954..944c8a72eed7 100644
--- a/tools/testing/vsock/vsock_diag_test.c
+++ b/tools/testing/vsock/vsock_diag_test.c
@@ -9,12 +9,10 @@
 
 #include <getopt.h>
 #include <stdio.h>
-#include <stdbool.h>
 #include <stdlib.h>
 #include <string.h>
 #include <errno.h>
 #include <unistd.h>
-#include <signal.h>
 #include <sys/socket.h>
 #include <sys/stat.h>
 #include <sys/types.h>
@@ -28,12 +26,7 @@
 
 #include "timeout.h"
 #include "control.h"
-
-enum test_mode {
-	TEST_MODE_UNSET,
-	TEST_MODE_CLIENT,
-	TEST_MODE_SERVER
-};
+#include "util.h"
 
 /* Per-socket status */
 struct vsock_stat {
@@ -334,7 +327,7 @@ static void free_sock_stat(struct list_head *sockets)
 		free(st);
 }
 
-static void test_no_sockets(unsigned int peer_cid)
+static void test_no_sockets(const struct test_opts *opts)
 {
 	LIST_HEAD(sockets);
 
@@ -345,7 +338,7 @@ static void test_no_sockets(unsigned int peer_cid)
 	free_sock_stat(&sockets);
 }
 
-static void test_listen_socket_server(unsigned int peer_cid)
+static void test_listen_socket_server(const struct test_opts *opts)
 {
 	union {
 		struct sockaddr sa;
@@ -383,7 +376,7 @@ static void test_listen_socket_server(unsigned int peer_cid)
 	free_sock_stat(&sockets);
 }
 
-static void test_connect_client(unsigned int peer_cid)
+static void test_connect_client(const struct test_opts *opts)
 {
 	union {
 		struct sockaddr sa;
@@ -392,7 +385,7 @@ static void test_connect_client(unsigned int peer_cid)
 		.svm = {
 			.svm_family = AF_VSOCK,
 			.svm_port = 1234,
-			.svm_cid = peer_cid,
+			.svm_cid = opts->peer_cid,
 		},
 	};
 	int fd;
@@ -429,7 +422,7 @@ static void test_connect_client(unsigned int peer_cid)
 	free_sock_stat(&sockets);
 }
 
-static void test_connect_server(unsigned int peer_cid)
+static void test_connect_server(const struct test_opts *opts)
 {
 	union {
 		struct sockaddr sa;
@@ -481,9 +474,9 @@ static void test_connect_server(unsigned int peer_cid)
 			clientaddr.sa.sa_family);
 		exit(EXIT_FAILURE);
 	}
-	if (clientaddr.svm.svm_cid != peer_cid) {
+	if (clientaddr.svm.svm_cid != opts->peer_cid) {
 		fprintf(stderr, "expected peer CID %u from accept(2), got %u\n",
-			peer_cid, clientaddr.svm.svm_cid);
+			opts->peer_cid, clientaddr.svm.svm_cid);
 		exit(EXIT_FAILURE);
 	}
 
@@ -502,11 +495,7 @@ static void test_connect_server(unsigned int peer_cid)
 	free_sock_stat(&sockets);
 }
 
-static struct {
-	const char *name;
-	void (*run_client)(unsigned int peer_cid);
-	void (*run_server)(unsigned int peer_cid);
-} test_cases[] = {
+static struct test_case test_cases[] = {
 	{
 		.name = "No sockets",
 		.run_server = test_no_sockets,
@@ -523,30 +512,6 @@ static struct {
 	{},
 };
 
-static void init_signals(void)
-{
-	struct sigaction act = {
-		.sa_handler = sigalrm,
-	};
-
-	sigaction(SIGALRM, &act, NULL);
-	signal(SIGPIPE, SIG_IGN);
-}
-
-static unsigned int parse_cid(const char *str)
-{
-	char *endptr = NULL;
-	unsigned long int n;
-
-	errno = 0;
-	n = strtoul(str, &endptr, 10);
-	if (errno || *endptr != '\0') {
-		fprintf(stderr, "malformed CID \"%s\"\n", str);
-		exit(EXIT_FAILURE);
-	}
-	return n;
-}
-
 static const char optstring[] = "";
 static const struct option longopts[] = {
 	{
@@ -601,9 +566,10 @@ int main(int argc, char **argv)
 {
 	const char *control_host = NULL;
 	const char *control_port = NULL;
-	int mode = TEST_MODE_UNSET;
-	unsigned int peer_cid = VMADDR_CID_ANY;
-	int i;
+	struct test_opts opts = {
+		.mode = TEST_MODE_UNSET,
+		.peer_cid = VMADDR_CID_ANY,
+	};
 
 	init_signals();
 
@@ -619,16 +585,16 @@ int main(int argc, char **argv)
 			break;
 		case 'm':
 			if (strcmp(optarg, "client") == 0)
-				mode = TEST_MODE_CLIENT;
+				opts.mode = TEST_MODE_CLIENT;
 			else if (strcmp(optarg, "server") == 0)
-				mode = TEST_MODE_SERVER;
+				opts.mode = TEST_MODE_SERVER;
 			else {
 				fprintf(stderr, "--mode must be \"client\" or \"server\"\n");
 				return EXIT_FAILURE;
 			}
 			break;
 		case 'p':
-			peer_cid = parse_cid(optarg);
+			opts.peer_cid = parse_cid(optarg);
 			break;
 		case 'P':
 			control_port = optarg;
@@ -641,35 +607,21 @@ int main(int argc, char **argv)
 
 	if (!control_port)
 		usage();
-	if (mode == TEST_MODE_UNSET)
+	if (opts.mode == TEST_MODE_UNSET)
 		usage();
-	if (peer_cid == VMADDR_CID_ANY)
+	if (opts.peer_cid == VMADDR_CID_ANY)
 		usage();
 
 	if (!control_host) {
-		if (mode != TEST_MODE_SERVER)
+		if (opts.mode != TEST_MODE_SERVER)
 			usage();
 		control_host = "0.0.0.0";
 	}
 
-	control_init(control_host, control_port, mode == TEST_MODE_SERVER);
-
-	for (i = 0; test_cases[i].name; i++) {
-		void (*run)(unsigned int peer_cid);
+	control_init(control_host, control_port,
+		     opts.mode == TEST_MODE_SERVER);
 
-		printf("%s...", test_cases[i].name);
-		fflush(stdout);
-
-		if (mode == TEST_MODE_CLIENT)
-			run = test_cases[i].run_client;
-		else
-			run = test_cases[i].run_server;
-
-		if (run)
-			run(peer_cid);
-
-		printf("ok\n");
-	}
+	run_tests(test_cases, &opts);
 
 	control_cleanup();
 	return EXIT_SUCCESS;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
