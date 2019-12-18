Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B90B125032
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 19:08:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D57602050F;
	Wed, 18 Dec 2019 18:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usphRM3LLDKF; Wed, 18 Dec 2019 18:08:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 44BB0203E2;
	Wed, 18 Dec 2019 18:08:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FAAAC077D;
	Wed, 18 Dec 2019 18:08:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25880C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 14C4F2014B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHHuf9cZlnSb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 3CF792050F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576692484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vrd2YMHgYqCL3NryYw02VWg7A0uKKgAHx3jq/JxCp5I=;
 b=OMHtU+FgW0REp8xJ/ry8/u491+lD5SdHl3ZKnDWwAWGziAkI9KqZPczs+koiXBQ6jtyjkn
 I73lk9hFf/j8d/dHWyQ3UYP8XJDXwbVRStgF8bsPpI/u4oUnxNlNm92Fn3gBj40FjdVi4P
 R1U1Dg2KRz2CR6ePYtMN+d51VH3rG8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-8k2LkPvON3iKCuAAOxJTcQ-1; Wed, 18 Dec 2019 13:08:00 -0500
X-MC-Unique: 8k2LkPvON3iKCuAAOxJTcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13DD6800D4E;
 Wed, 18 Dec 2019 18:07:59 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-218.ams2.redhat.com
 [10.36.117.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2FBB5D9E2;
 Wed, 18 Dec 2019 18:07:56 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net-next v3 11/11] vsock_test: add SOCK_STREAM MSG_PEEK test
Date: Wed, 18 Dec 2019 19:07:08 +0100
Message-Id: <20191218180708.120337-12-sgarzare@redhat.com>
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

Test if the MSG_PEEK flags of recv(2) works as expected.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/vsock_test.c | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index a63e05d6a0f9..1d8b93f1af31 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -178,6 +178,35 @@ static void test_stream_multiconn_server(const struct test_opts *opts)
 		close(fds[i]);
 }
 
+static void test_stream_msg_peek_client(const struct test_opts *opts)
+{
+	int fd;
+
+	fd = vsock_stream_connect(opts->peer_cid, 1234);
+	if (fd < 0) {
+		perror("connect");
+		exit(EXIT_FAILURE);
+	}
+
+	send_byte(fd, 1, 0);
+	close(fd);
+}
+
+static void test_stream_msg_peek_server(const struct test_opts *opts)
+{
+	int fd;
+
+	fd = vsock_stream_accept(VMADDR_CID_ANY, 1234, NULL);
+	if (fd < 0) {
+		perror("accept");
+		exit(EXIT_FAILURE);
+	}
+
+	recv_byte(fd, 1, MSG_PEEK);
+	recv_byte(fd, 1, 0);
+	close(fd);
+}
+
 static struct test_case test_cases[] = {
 	{
 		.name = "SOCK_STREAM connection reset",
@@ -198,6 +227,11 @@ static struct test_case test_cases[] = {
 		.run_client = test_stream_multiconn_client,
 		.run_server = test_stream_multiconn_server,
 	},
+	{
+		.name = "SOCK_STREAM MSG_PEEK",
+		.run_client = test_stream_msg_peek_client,
+		.run_server = test_stream_msg_peek_server,
+	},
 	{},
 };
 
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
