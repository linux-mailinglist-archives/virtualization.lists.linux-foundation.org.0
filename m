Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D05125030
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 19:08:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C7630861CF;
	Wed, 18 Dec 2019 18:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZ2g1uGO3x1a; Wed, 18 Dec 2019 18:08:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C530A860B5;
	Wed, 18 Dec 2019 18:08:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5A68C077D;
	Wed, 18 Dec 2019 18:08:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37DC7C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 33EE185137
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMuM0LPIlXdt
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 27ECE84ADC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576692478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLZdv4nILYavPlNd4vydpr9CWIiu4xi175TY2KQEKPY=;
 b=dq4KJyXkWSgU1gtULG4R5WEMGCrzR/x5U0TxpEjRuIZ/17qKc5pIM2/JZvDtF366aY9xXA
 aSnN+Bhtn70iKqppsBaag0L92jt5DUV9hh/fu+vRSkcn+r2MrXk+QMHrHvHX6O8fZ3qa+8
 1i+kYl8+scbRjz9Q+ulevFj8fJ94t/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-34aWA1McOgOly0raw9LTwA-1; Wed, 18 Dec 2019 13:07:55 -0500
X-MC-Unique: 34aWA1McOgOly0raw9LTwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C0E28C3ECB;
 Wed, 18 Dec 2019 18:07:54 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-218.ams2.redhat.com
 [10.36.117.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 801B05D9E2;
 Wed, 18 Dec 2019 18:07:49 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net-next v3 09/11] testing/vsock: add parameters to list and
 skip tests
Date: Wed, 18 Dec 2019 19:07:06 +0100
Message-Id: <20191218180708.120337-10-sgarzare@redhat.com>
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

Some tests can fail with transports that have a slightly
different behavior, so let's add the possibility to specify
which tests to skip.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/control.c         | 15 +++++-
 tools/testing/vsock/control.h         |  1 +
 tools/testing/vsock/util.c            | 76 +++++++++++++++++++++------
 tools/testing/vsock/util.h            |  6 ++-
 tools/testing/vsock/vsock_diag_test.c | 19 ++++++-
 tools/testing/vsock/vsock_test.c      | 20 ++++++-
 6 files changed, 117 insertions(+), 20 deletions(-)

diff --git a/tools/testing/vsock/control.c b/tools/testing/vsock/control.c
index 45f328c6ff23..4874872fc5a3 100644
--- a/tools/testing/vsock/control.c
+++ b/tools/testing/vsock/control.c
@@ -205,11 +205,22 @@ void control_expectln(const char *str)
 	char *line;
 
 	line = control_readln();
-	if (strcmp(str, line) != 0) {
+
+	control_cmpln(line, str, true);
+
+	free(line);
+}
+
+bool control_cmpln(char *line, const char *str, bool fail)
+{
+	if (strcmp(str, line) == 0)
+		return true;
+
+	if (fail) {
 		fprintf(stderr, "expected \"%s\" on control socket, got \"%s\"\n",
 			str, line);
 		exit(EXIT_FAILURE);
 	}
 
-	free(line);
+	return false;
 }
diff --git a/tools/testing/vsock/control.h b/tools/testing/vsock/control.h
index dac3964a891d..51814b4f9ac1 100644
--- a/tools/testing/vsock/control.h
+++ b/tools/testing/vsock/control.h
@@ -10,5 +10,6 @@ void control_cleanup(void);
 void control_writeln(const char *str);
 char *control_readln(void);
 void control_expectln(const char *str);
+bool control_cmpln(char *line, const char *str, bool fail);
 
 #endif /* CONTROL_H */
diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
index b132c96c87fc..b290fa78405f 100644
--- a/tools/testing/vsock/util.c
+++ b/tools/testing/vsock/util.c
@@ -299,32 +299,78 @@ void run_tests(const struct test_case *test_cases,
 
 	for (i = 0; test_cases[i].name; i++) {
 		void (*run)(const struct test_opts *opts);
+		char *line;
 
-		printf("%s...", test_cases[i].name);
+		printf("%d - %s...", i, test_cases[i].name);
 		fflush(stdout);
 
-		if (opts->mode == TEST_MODE_CLIENT) {
-			/* Full barrier before executing the next test.  This
-			 * ensures that client and server are executing the
-			 * same test case.  In particular, it means whoever is
-			 * faster will not see the peer still executing the
-			 * last test.  This is important because port numbers
-			 * can be used by multiple test cases.
-			 */
-			control_expectln("NEXT");
+		/* Full barrier before executing the next test.  This
+		 * ensures that client and server are executing the
+		 * same test case.  In particular, it means whoever is
+		 * faster will not see the peer still executing the
+		 * last test.  This is important because port numbers
+		 * can be used by multiple test cases.
+		 */
+		if (test_cases[i].skip)
+			control_writeln("SKIP");
+		else
 			control_writeln("NEXT");
 
-			run = test_cases[i].run_client;
-		} else {
-			control_writeln("NEXT");
-			control_expectln("NEXT");
+		line = control_readln();
+		if (control_cmpln(line, "SKIP", false) || test_cases[i].skip) {
 
-			run = test_cases[i].run_server;
+			printf("skipped\n");
+
+			free(line);
+			continue;
 		}
 
+		control_cmpln(line, "NEXT", true);
+		free(line);
+
+		if (opts->mode == TEST_MODE_CLIENT)
+			run = test_cases[i].run_client;
+		else
+			run = test_cases[i].run_server;
+
 		if (run)
 			run(opts);
 
 		printf("ok\n");
 	}
 }
+
+void list_tests(const struct test_case *test_cases)
+{
+	int i;
+
+	printf("ID\tTest name\n");
+
+	for (i = 0; test_cases[i].name; i++)
+		printf("%d\t%s\n", i, test_cases[i].name);
+
+	exit(EXIT_FAILURE);
+}
+
+void skip_test(struct test_case *test_cases, size_t test_cases_len,
+	       const char *test_id_str)
+{
+	unsigned long test_id;
+	char *endptr = NULL;
+
+	errno = 0;
+	test_id = strtoul(test_id_str, &endptr, 10);
+	if (errno || *endptr != '\0') {
+		fprintf(stderr, "malformed test ID \"%s\"\n", test_id_str);
+		exit(EXIT_FAILURE);
+	}
+
+	if (test_id >= test_cases_len) {
+		fprintf(stderr, "test ID (%lu) larger than the max allowed (%lu)\n",
+			test_id, test_cases_len - 1);
+		exit(EXIT_FAILURE);
+	}
+
+	test_cases[test_id].skip = true;
+}
+
diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
index 331e945f3ae6..e53dd09d26d9 100644
--- a/tools/testing/vsock/util.h
+++ b/tools/testing/vsock/util.h
@@ -29,6 +29,8 @@ struct test_case {
 
 	/* Called when test mode is TEST_MODE_SERVER */
 	void (*run_server)(const struct test_opts *opts);
+
+	bool skip;
 };
 
 void init_signals(void);
@@ -41,5 +43,7 @@ void send_byte(int fd, int expected_ret, int flags);
 void recv_byte(int fd, int expected_ret, int flags);
 void run_tests(const struct test_case *test_cases,
 	       const struct test_opts *opts);
-
+void list_tests(const struct test_case *test_cases);
+void skip_test(struct test_case *test_cases, size_t test_cases_len,
+	       const char *test_id_str);
 #endif /* UTIL_H */
diff --git a/tools/testing/vsock/vsock_diag_test.c b/tools/testing/vsock/vsock_diag_test.c
index abd7dc2a9631..b82483627259 100644
--- a/tools/testing/vsock/vsock_diag_test.c
+++ b/tools/testing/vsock/vsock_diag_test.c
@@ -463,6 +463,16 @@ static const struct option longopts[] = {
 		.has_arg = required_argument,
 		.val = 'p',
 	},
+	{
+		.name = "list",
+		.has_arg = no_argument,
+		.val = 'l',
+	},
+	{
+		.name = "skip",
+		.has_arg = required_argument,
+		.val = 's',
+	},
 	{
 		.name = "help",
 		.has_arg = no_argument,
@@ -473,7 +483,7 @@ static const struct option longopts[] = {
 
 static void usage(void)
 {
-	fprintf(stderr, "Usage: vsock_diag_test [--help] [--control-host=<host>] --control-port=<port> --mode=client|server --peer-cid=<cid>\n"
+	fprintf(stderr, "Usage: vsock_diag_test [--help] [--control-host=<host>] --control-port=<port> --mode=client|server --peer-cid=<cid> [--list] [--skip=<test_id>]\n"
 		"\n"
 		"  Server: vsock_diag_test --control-port=1234 --mode=server --peer-cid=3\n"
 		"  Client: vsock_diag_test --control-host=192.168.0.1 --control-port=1234 --mode=client --peer-cid=2\n"
@@ -528,6 +538,13 @@ int main(int argc, char **argv)
 		case 'P':
 			control_port = optarg;
 			break;
+		case 'l':
+			list_tests(test_cases);
+			break;
+		case 's':
+			skip_test(test_cases, ARRAY_SIZE(test_cases) - 1,
+				  optarg);
+			break;
 		case '?':
 		default:
 			usage();
diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index 629d7ce58202..3ac56651f3f9 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -13,6 +13,7 @@
 #include <string.h>
 #include <errno.h>
 #include <unistd.h>
+#include <linux/kernel.h>
 
 #include "timeout.h"
 #include "control.h"
@@ -222,6 +223,16 @@ static const struct option longopts[] = {
 		.has_arg = required_argument,
 		.val = 'p',
 	},
+	{
+		.name = "list",
+		.has_arg = no_argument,
+		.val = 'l',
+	},
+	{
+		.name = "skip",
+		.has_arg = required_argument,
+		.val = 's',
+	},
 	{
 		.name = "help",
 		.has_arg = no_argument,
@@ -232,7 +243,7 @@ static const struct option longopts[] = {
 
 static void usage(void)
 {
-	fprintf(stderr, "Usage: vsock_test [--help] [--control-host=<host>] --control-port=<port> --mode=client|server --peer-cid=<cid>\n"
+	fprintf(stderr, "Usage: vsock_test [--help] [--control-host=<host>] --control-port=<port> --mode=client|server --peer-cid=<cid> [--list] [--skip=<test_id>]\n"
 		"\n"
 		"  Server: vsock_test --control-port=1234 --mode=server --peer-cid=3\n"
 		"  Client: vsock_test --control-host=192.168.0.1 --control-port=1234 --mode=client --peer-cid=2\n"
@@ -287,6 +298,13 @@ int main(int argc, char **argv)
 		case 'P':
 			control_port = optarg;
 			break;
+		case 'l':
+			list_tests(test_cases);
+			break;
+		case 's':
+			skip_test(test_cases, ARRAY_SIZE(test_cases) - 1,
+				  optarg);
+			break;
 		case '?':
 		default:
 			usage();
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
