Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6997DF0A
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 17:27:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3B37F86AF;
	Thu,  1 Aug 2019 15:26:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D642E607E
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:26:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8AEE85F4
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:26:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFE0B927BF;
	Thu,  1 Aug 2019 15:26:11 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-63.ams2.redhat.com
	[10.36.117.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED24A600D1;
	Thu,  1 Aug 2019 15:26:09 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 08/11] VSOCK: add vsock_get_local_cid() test utility
Date: Thu,  1 Aug 2019 17:25:38 +0200
Message-Id: <20190801152541.245833-9-sgarzare@redhat.com>
In-Reply-To: <20190801152541.245833-1-sgarzare@redhat.com>
References: <20190801152541.245833-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 01 Aug 2019 15:26:12 +0000 (UTC)
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

This patch adds utility to get local CID, useful to
understand if we are in the host or guest.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/util.c | 17 +++++++++++++++++
 tools/testing/vsock/util.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
index d46a6e079b96..41b94495ecb1 100644
--- a/tools/testing/vsock/util.c
+++ b/tools/testing/vsock/util.c
@@ -13,6 +13,7 @@
 #include <stdlib.h>
 #include <signal.h>
 #include <unistd.h>
+#include <assert.h>
 
 #include "timeout.h"
 #include "control.h"
@@ -44,6 +45,22 @@ unsigned int parse_cid(const char *str)
 	return n;
 }
 
+/* Get the local CID */
+unsigned int vsock_get_local_cid(int fd)
+{
+	struct sockaddr_vm svm;
+	socklen_t svm_len = sizeof(svm);
+
+	if (getsockname(fd, (struct sockaddr *) &svm, &svm_len)) {
+		perror("getsockname");
+		exit(EXIT_FAILURE);
+	}
+
+	assert(svm.svm_family == AF_VSOCK);
+
+	return svm.svm_cid;
+}
+
 /* Connect to <cid, port> and return the file descriptor. */
 int vsock_stream_connect(unsigned int cid, unsigned int port)
 {
diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
index fe524d393d67..379e02ab59bb 100644
--- a/tools/testing/vsock/util.h
+++ b/tools/testing/vsock/util.h
@@ -36,6 +36,7 @@ unsigned int parse_cid(const char *str);
 int vsock_stream_connect(unsigned int cid, unsigned int port);
 int vsock_stream_accept(unsigned int cid, unsigned int port,
 			struct sockaddr_vm *clientaddrp);
+unsigned int vsock_get_local_cid(int fd);
 void send_byte(int fd, int expected_ret);
 void recv_byte(int fd, int expected_ret);
 void run_tests(const struct test_case *test_cases,
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
