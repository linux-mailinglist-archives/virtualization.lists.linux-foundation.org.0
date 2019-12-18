Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A8312502F
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 19:08:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D510858BF;
	Wed, 18 Dec 2019 18:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbqGu3nOaSee; Wed, 18 Dec 2019 18:07:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 57CD285617;
	Wed, 18 Dec 2019 18:07:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39886C077D;
	Wed, 18 Dec 2019 18:07:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02B58C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E61D788503
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c+7vzmK3-Uhf
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0FD4887BB8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576692475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lW+cxoZMuu0TO4yVVOLW4Vw9qRm3Vps7ty8G8tFB/M=;
 b=Eib+zEJ584HaGpZVUfoip756On+DDGWncFxDTeekFqily6VFbmtcwo2i8PE74KkUug/WvH
 PpliimjlAgVnIuneZFv/jxggm7B4l2+bZYsnl3fOMDv//3jmHjsti2iP3FBrXmDDwmg7CA
 atTUIkNkTFzP1sUHw34EySJxNyvr2bY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-MStQOSH1NAmxIEs9wBUUZw-1; Wed, 18 Dec 2019 13:07:50 -0500
X-MC-Unique: MStQOSH1NAmxIEs9wBUUZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BFFC8C3ECB;
 Wed, 18 Dec 2019 18:07:49 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-218.ams2.redhat.com
 [10.36.117.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A83B5D9E5;
 Wed, 18 Dec 2019 18:07:44 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net-next v3 08/11] vsock_test: wait for the remote to close
 the connection
Date: Wed, 18 Dec 2019 19:07:05 +0100
Message-Id: <20191218180708.120337-9-sgarzare@redhat.com>
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

Before check if a send returns -EPIPE, we need to make sure the
connection is closed.
To do that, we use epoll API to wait EPOLLRDHUP or EPOLLHUP events
on the socket.

Reported-by: Jorgen Hansen <jhansen@vmware.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v3:
 - removed unnecessary control_expectln("CLOSED") [Stefan]
---
 tools/testing/vsock/util.c       | 39 ++++++++++++++++++++++++++++++++
 tools/testing/vsock/util.h       |  1 +
 tools/testing/vsock/vsock_test.c | 12 ++++++----
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
index 6026ef3ce512..b132c96c87fc 100644
--- a/tools/testing/vsock/util.c
+++ b/tools/testing/vsock/util.c
@@ -13,6 +13,8 @@
 #include <stdlib.h>
 #include <signal.h>
 #include <unistd.h>
+#include <assert.h>
+#include <sys/epoll.h>
 
 #include "timeout.h"
 #include "control.h"
@@ -44,6 +46,43 @@ unsigned int parse_cid(const char *str)
 	return n;
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
index 4df12e4b5ebe..331e945f3ae6 100644
--- a/tools/testing/vsock/util.h
+++ b/tools/testing/vsock/util.h
@@ -36,6 +36,7 @@ unsigned int parse_cid(const char *str);
 int vsock_stream_connect(unsigned int cid, unsigned int port);
 int vsock_stream_accept(unsigned int cid, unsigned int port,
 			struct sockaddr_vm *clientaddrp);
+void vsock_wait_remote_close(int fd);
 void send_byte(int fd, int expected_ret, int flags);
 void recv_byte(int fd, int expected_ret, int flags);
 void run_tests(const struct test_case *test_cases,
diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index fae8ddc3ef72..629d7ce58202 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -66,7 +66,6 @@ static void test_stream_client_close_client(const struct test_opts *opts)
 
 	send_byte(fd, 1, 0);
 	close(fd);
-	control_writeln("CLOSED");
 }
 
 static void test_stream_client_close_server(const struct test_opts *opts)
@@ -79,7 +78,10 @@ static void test_stream_client_close_server(const struct test_opts *opts)
 		exit(EXIT_FAILURE);
 	}
 
-	control_expectln("CLOSED");
+	/* Wait for the remote to close the connection, before check
+	 * -EPIPE error on send.
+	 */
+	vsock_wait_remote_close(fd);
 
 	send_byte(fd, -EPIPE, 0);
 	recv_byte(fd, 1, 0);
@@ -97,7 +99,10 @@ static void test_stream_server_close_client(const struct test_opts *opts)
 		exit(EXIT_FAILURE);
 	}
 
-	control_expectln("CLOSED");
+	/* Wait for the remote to close the connection, before check
+	 * -EPIPE error on send.
+	 */
+	vsock_wait_remote_close(fd);
 
 	send_byte(fd, -EPIPE, 0);
 	recv_byte(fd, 1, 0);
@@ -117,7 +122,6 @@ static void test_stream_server_close_server(const struct test_opts *opts)
 
 	send_byte(fd, 1, 0);
 	close(fd);
-	control_writeln("CLOSED");
 }
 
 /* With the standard socket sizes, VMCI is able to support about 100
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
