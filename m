Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB327DF0D
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 17:28:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F2B788832;
	Thu,  1 Aug 2019 15:26:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5CE771992
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:26:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E16095F4
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:26:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 720BD30B6FAA;
	Thu,  1 Aug 2019 15:26:19 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-63.ams2.redhat.com
	[10.36.117.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63010600D1;
	Thu,  1 Aug 2019 15:26:17 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 11/11] vsock_test: wait for the remote to close the
	connection
Date: Thu,  1 Aug 2019 17:25:41 +0200
Message-Id: <20190801152541.245833-12-sgarzare@redhat.com>
In-Reply-To: <20190801152541.245833-1-sgarzare@redhat.com>
References: <20190801152541.245833-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 01 Aug 2019 15:26:19 +0000 (UTC)
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

Before check if a send returns -EPIPE, we need to make sure the
connection is closed.
To do that, we use epoll API to wait EPOLLRDHUP or EPOLLHUP events
on the socket.

Reported-by: Jorgen Hansen <jhansen@vmware.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/util.c       | 38 ++++++++++++++++++++++++++++++++
 tools/testing/vsock/util.h       |  1 +
 tools/testing/vsock/vsock_test.c | 10 +++++++++
 3 files changed, 49 insertions(+)

diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
index 41b94495ecb1..425181fe196c 100644
--- a/tools/testing/vsock/util.c
+++ b/tools/testing/vsock/util.c
@@ -14,6 +14,7 @@
 #include <signal.h>
 #include <unistd.h>
 #include <assert.h>
+#include <sys/epoll.h>
 
 #include "timeout.h"
 #include "control.h"
@@ -61,6 +62,43 @@ unsigned int vsock_get_local_cid(int fd)
 	return svm.svm_cid;
 }
 
+/* Wait for the remote to close the connection */
+void vsock_wait_remote_close(int fd)
+{
+	struct epoll_event ev;
+	int epollfd, nfds;
+
+	epollfd = epoll_create1(0);
+	if (epollfd == -1) {
+		perror("epoll_create1");
+		exit(EXIT_FAILURE);
+	}
+
+	ev.events = EPOLLRDHUP | EPOLLHUP;
+	ev.data.fd = fd;
+	if (epoll_ctl(epollfd, EPOLL_CTL_ADD, fd, &ev) == -1) {
+		perror("epoll_ctl");
+		exit(EXIT_FAILURE);
+	}
+
+	nfds = epoll_wait(epollfd, &ev, 1, TIMEOUT * 1000);
+	if (nfds == -1) {
+		perror("epoll_wait");
+		exit(EXIT_FAILURE);
+	}
+
+	if (nfds == 0) {
+		fprintf(stderr, "epoll_wait timed out\n");
+		exit(EXIT_FAILURE);
+	}
+
+	assert(nfds == 1);
+	assert(ev.events & (EPOLLRDHUP | EPOLLHUP));
+	assert(ev.data.fd == fd);
+
+	close(epollfd);
+}
+
 /* Connect to <cid, port> and return the file descriptor. */
 int vsock_stream_connect(unsigned int cid, unsigned int port)
 {
diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
index 7fdb8100f035..89816966c05b 100644
--- a/tools/testing/vsock/util.h
+++ b/tools/testing/vsock/util.h
@@ -45,6 +45,7 @@ int vsock_stream_connect(unsigned int cid, unsigned int port);
 int vsock_stream_accept(unsigned int cid, unsigned int port,
 			struct sockaddr_vm *clientaddrp);
 unsigned int vsock_get_local_cid(int fd);
+void vsock_wait_remote_close(int fd);
 void send_byte(int fd, int expected_ret);
 void recv_byte(int fd, int expected_ret);
 void run_tests(const struct test_case *test_cases,
diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index 64adf45501ca..a664675bec5a 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -84,6 +84,11 @@ static void test_stream_client_close_server(const struct test_opts *opts)
 
 	control_expectln("CLOSED");
 
+	/* Wait for the remote to close the connection, before check
+	 * -EPIPE error on send.
+	 */
+	vsock_wait_remote_close(fd);
+
 	send_byte(fd, -EPIPE);
 
 	/* Skip the read of data wrote by the peer if we are on VMCI and
@@ -113,6 +118,11 @@ static void test_stream_server_close_client(const struct test_opts *opts)
 
 	control_expectln("CLOSED");
 
+	/* Wait for the remote to close the connection, before check
+	 * -EPIPE error on send.
+	 */
+	vsock_wait_remote_close(fd);
+
 	send_byte(fd, -EPIPE);
 
 	/* Skip the read of data wrote by the peer if we are on VMCI and
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
