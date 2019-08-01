Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 191247DEEA
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 17:26:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2D3621E63;
	Thu,  1 Aug 2019 15:26:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 099201992
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:25:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C0551821
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 15:25:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 333743094AE6;
	Thu,  1 Aug 2019 15:25:50 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-63.ams2.redhat.com
	[10.36.117.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB42600C4;
	Thu,  1 Aug 2019 15:25:47 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 01/11] VSOCK: fix header include in vsock_diag_test
Date: Thu,  1 Aug 2019 17:25:31 +0200
Message-Id: <20190801152541.245833-2-sgarzare@redhat.com>
In-Reply-To: <20190801152541.245833-1-sgarzare@redhat.com>
References: <20190801152541.245833-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 01 Aug 2019 15:25:50 +0000 (UTC)
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
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
