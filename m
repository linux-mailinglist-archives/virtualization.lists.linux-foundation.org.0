Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C53125031
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 19:08:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B5BFC22053;
	Wed, 18 Dec 2019 18:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFb451N628ym; Wed, 18 Dec 2019 18:08:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F13E120431;
	Wed, 18 Dec 2019 18:08:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6A75C077D;
	Wed, 18 Dec 2019 18:08:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22DC7C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1295187BB8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHOVQlYBdZ8C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 681C1884F5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576692481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKgRJKmCUaU0qajJf3X0inD9I5OriDwjAbgS1hT2Rhk=;
 b=Fc5Cso+MWIiiwIHwTc0AERrX6Hu7Q1PJRql5yIc55+FcWUqNt8CJIdALEi/+lJE5jKcgCs
 KGePDoRo0fLiSrQOoBHOkPSSSSOsUtdCchp8CFcYCZKCgANS4O5x78r15NrN5nrTYz+4z8
 ne9Ed2ZnFwePR3wd/pZO7Y+ivY1aAt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-jV9ud2qrPS-QuMVkwgfOvQ-1; Wed, 18 Dec 2019 13:07:58 -0500
X-MC-Unique: jV9ud2qrPS-QuMVkwgfOvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E06A64A96;
 Wed, 18 Dec 2019 18:07:56 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-218.ams2.redhat.com
 [10.36.117.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7216A5D9E2;
 Wed, 18 Dec 2019 18:07:54 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net-next v3 10/11] testing/vsock: print list of options and
 description
Date: Wed, 18 Dec 2019 19:07:07 +0100
Message-Id: <20191218180708.120337-11-sgarzare@redhat.com>
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

Since we now have several options, in the help we print the list
of all supported options and a brief description of them.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/vsock_diag_test.c | 13 ++++++++++++-
 tools/testing/vsock/vsock_test.c      | 13 ++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/tools/testing/vsock/vsock_diag_test.c b/tools/testing/vsock/vsock_diag_test.c
index b82483627259..cec6f5a738e1 100644
--- a/tools/testing/vsock/vsock_diag_test.c
+++ b/tools/testing/vsock/vsock_diag_test.c
@@ -497,7 +497,18 @@ static void usage(void)
 		"listen address and the client requires an address to\n"
 		"connect to.\n"
 		"\n"
-		"The CID of the other side must be given with --peer-cid=<cid>.\n");
+		"The CID of the other side must be given with --peer-cid=<cid>.\n"
+		"\n"
+		"Options:\n"
+		"  --help                 This help message\n"
+		"  --control-host <host>  Server IP address to connect to\n"
+		"  --control-port <port>  Server port to listen on/connect to\n"
+		"  --mode client|server   Server or client mode\n"
+		"  --peer-cid <cid>       CID of the other side\n"
+		"  --list                 List of tests that will be executed\n"
+		"  --skip <test_id>       Test ID to skip;\n"
+		"                         use multiple --skip options to skip more tests\n"
+		);
 	exit(EXIT_FAILURE);
 }
 
diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index 3ac56651f3f9..a63e05d6a0f9 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -257,7 +257,18 @@ static void usage(void)
 		"listen address and the client requires an address to\n"
 		"connect to.\n"
 		"\n"
-		"The CID of the other side must be given with --peer-cid=<cid>.\n");
+		"The CID of the other side must be given with --peer-cid=<cid>.\n"
+		"\n"
+		"Options:\n"
+		"  --help                 This help message\n"
+		"  --control-host <host>  Server IP address to connect to\n"
+		"  --control-port <port>  Server port to listen on/connect to\n"
+		"  --mode client|server   Server or client mode\n"
+		"  --peer-cid <cid>       CID of the other side\n"
+		"  --list                 List of tests that will be executed\n"
+		"  --skip <test_id>       Test ID to skip;\n"
+		"                         use multiple --skip options to skip more tests\n"
+		);
 	exit(EXIT_FAILURE);
 }
 
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
