Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0057DF0C
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 17:28:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C208360CF;
	Thu,  1 Aug 2019 15:26:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BED3F1992
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:26:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6C9B4821
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:26:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB6FE3179B5F;
	Thu,  1 Aug 2019 15:26:16 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-63.ams2.redhat.com
	[10.36.117.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB2F5600D1;
	Thu,  1 Aug 2019 15:26:14 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 10/11] vsock_test: skip read() in test_stream*close tests
	on a VMCI host
Date: Thu,  1 Aug 2019 17:25:40 +0200
Message-Id: <20190801152541.245833-11-sgarzare@redhat.com>
In-Reply-To: <20190801152541.245833-1-sgarzare@redhat.com>
References: <20190801152541.245833-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 01 Aug 2019 15:26:17 +0000 (UTC)
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

When VMCI transport is used, if the guest closes a connection,
all data is gone and EOF is returned, so we should skip the read
of data written by the peer before closing the connection.

Reported-by: Jorgen Hansen <jhansen@vmware.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/vsock_test.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index cb606091489f..64adf45501ca 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -71,6 +71,7 @@ static void test_stream_client_close_client(const struct test_opts *opts)
 
 static void test_stream_client_close_server(const struct test_opts *opts)
 {
+	unsigned int local_cid;
 	int fd;
 
 	fd = vsock_stream_accept(VMADDR_CID_ANY, 1234, NULL);
@@ -79,16 +80,27 @@ static void test_stream_client_close_server(const struct test_opts *opts)
 		exit(EXIT_FAILURE);
 	}
 
+	local_cid = vsock_get_local_cid(fd);
+
 	control_expectln("CLOSED");
 
 	send_byte(fd, -EPIPE);
-	recv_byte(fd, 1);
+
+	/* Skip the read of data wrote by the peer if we are on VMCI and
+	 * we are on the host side, because when the guest closes a
+	 * connection, all data is gone and EOF is returned.
+	 */
+	if (!(opts->transport == TEST_TRANSPORT_VMCI &&
+	    local_cid == VMADDR_CID_HOST))
+		recv_byte(fd, 1);
+
 	recv_byte(fd, 0);
 	close(fd);
 }
 
 static void test_stream_server_close_client(const struct test_opts *opts)
 {
+	unsigned int local_cid;
 	int fd;
 
 	fd = vsock_stream_connect(opts->peer_cid, 1234);
@@ -97,10 +109,20 @@ static void test_stream_server_close_client(const struct test_opts *opts)
 		exit(EXIT_FAILURE);
 	}
 
+	local_cid = vsock_get_local_cid(fd);
+
 	control_expectln("CLOSED");
 
 	send_byte(fd, -EPIPE);
-	recv_byte(fd, 1);
+
+	/* Skip the read of data wrote by the peer if we are on VMCI and
+	 * we are on the host side, because when the guest closes a
+	 * connection, all data is gone and EOF is returned.
+	 */
+	if (!(opts->transport == TEST_TRANSPORT_VMCI &&
+	    local_cid == VMADDR_CID_HOST))
+		recv_byte(fd, 1);
+
 	recv_byte(fd, 0);
 	close(fd);
 }
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
