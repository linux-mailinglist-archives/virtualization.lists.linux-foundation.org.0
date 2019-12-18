Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D797F12501B
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 19:07:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 618762014B;
	Wed, 18 Dec 2019 18:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrJ7G2s-o1B5; Wed, 18 Dec 2019 18:07:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 15041203E2;
	Wed, 18 Dec 2019 18:07:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0426DC077D;
	Wed, 18 Dec 2019 18:07:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB528C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A275E203E2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSBfRdN2G60L
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 85BB32014B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576692442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ak7zDmp1/cfdOQnn19i2bAKVAQPiklhpPuuaiXWuaLc=;
 b=jKxmaLR9g2quk+cI/9o1QGzgQ5blAvwy2Mp2Aiei5+4meX+nNiOGlw1N2duGHDrRUAEDVy
 ZvUcw1dQieyL3hlrOM018WPhrXz2V5FnvJmlgVcYq9n8I/15GPwfRDnOxpgweRz0tNwR4w
 /vDn43VBM2ei19TUdYk0DyfvBxvmM+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-WFFPBcoKMuGlKOSiuW5jFg-1; Wed, 18 Dec 2019 13:07:20 -0500
X-MC-Unique: WFFPBcoKMuGlKOSiuW5jFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 896C6100726C;
 Wed, 18 Dec 2019 18:07:18 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-218.ams2.redhat.com
 [10.36.117.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5F45D9E2;
 Wed, 18 Dec 2019 18:07:16 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net-next v3 01/11] VSOCK: fix header include in vsock_diag_test
Date: Wed, 18 Dec 2019 19:06:58 +0100
Message-Id: <20191218180708.120337-2-sgarzare@redhat.com>
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

The vsock_diag_test program directly included ../../../include/uapi/
headers from the source tree.  Tests are supposed to use the
usr/include/linux/ headers that have been prepared with make
headers_install instead.

Suggested-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/Makefile          | 2 +-
 tools/testing/vsock/README            | 2 +-
 tools/testing/vsock/vsock_diag_test.c | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/testing/vsock/Makefile b/tools/testing/vsock/Makefile
index 5be687b1e16c..d41a4e13960a 100644
--- a/tools/testing/vsock/Makefile
+++ b/tools/testing/vsock/Makefile
@@ -3,7 +3,7 @@ all: test
 test: vsock_diag_test
 vsock_diag_test: vsock_diag_test.o timeout.o control.o
 
-CFLAGS += -g -O2 -Werror -Wall -I. -I../../include/uapi -I../../include -Wno-pointer-sign -fno-strict-overflow -fno-strict-aliasing -fno-common -MMD -U_FORTIFY_SOURCE -D_GNU_SOURCE
+CFLAGS += -g -O2 -Werror -Wall -I. -I../../include -I../../../usr/include -Wno-pointer-sign -fno-strict-overflow -fno-strict-aliasing -fno-common -MMD -U_FORTIFY_SOURCE -D_GNU_SOURCE
 .PHONY: all test clean
 clean:
 	${RM} *.o *.d vsock_diag_test
diff --git a/tools/testing/vsock/README b/tools/testing/vsock/README
index 2cc6d7302db6..cf7dc64273bf 100644
--- a/tools/testing/vsock/README
+++ b/tools/testing/vsock/README
@@ -10,7 +10,7 @@ The following tests are available:
 The following prerequisite steps are not automated and must be performed prior
 to running tests:
 
-1. Build the kernel and these tests.
+1. Build the kernel, make headers_install, and build these tests.
 2. Install the kernel and tests on the host.
 3. Install the kernel and tests inside the guest.
 4. Boot the guest and ensure that the AF_VSOCK transport is enabled.
diff --git a/tools/testing/vsock/vsock_diag_test.c b/tools/testing/vsock/vsock_diag_test.c
index c481101364a4..fc391e041954 100644
--- a/tools/testing/vsock/vsock_diag_test.c
+++ b/tools/testing/vsock/vsock_diag_test.c
@@ -21,12 +21,11 @@
 #include <linux/list.h>
 #include <linux/net.h>
 #include <linux/netlink.h>
+#include <linux/vm_sockets.h>
 #include <linux/sock_diag.h>
+#include <linux/vm_sockets_diag.h>
 #include <netinet/tcp.h>
 
-#include "../../../include/uapi/linux/vm_sockets.h"
-#include "../../../include/uapi/linux/vm_sockets_diag.h"
-
 #include "timeout.h"
 #include "control.h"
 
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
