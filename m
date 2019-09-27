Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B804C042A
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 13:27:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3B220D0A;
	Fri, 27 Sep 2019 11:27:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4B7FCC77
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 11:27:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EF3428A6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 11:27:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62BD110C094B;
	Fri, 27 Sep 2019 11:27:39 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-249.ams2.redhat.com
	[10.36.117.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 457435D9C3;
	Fri, 27 Sep 2019 11:27:28 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [RFC PATCH 03/13] vsock: remove include/linux/vm_sockets.h file
Date: Fri, 27 Sep 2019 13:26:53 +0200
Message-Id: <20190927112703.17745-4-sgarzare@redhat.com>
In-Reply-To: <20190927112703.17745-1-sgarzare@redhat.com>
References: <20190927112703.17745-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.66]);
	Fri, 27 Sep 2019 11:27:39 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Dexuan Cui <decui@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
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

This header file now only includes the "uapi/linux/vm_sockets.h".
We can include directly it when needed.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/vm_sockets.h            | 13 -------------
 include/net/af_vsock.h                |  2 +-
 include/net/vsock_addr.h              |  2 +-
 net/vmw_vsock/vmci_transport_notify.h |  1 -
 4 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 include/linux/vm_sockets.h

diff --git a/include/linux/vm_sockets.h b/include/linux/vm_sockets.h
deleted file mode 100644
index 7dd899ccb920..000000000000
--- a/include/linux/vm_sockets.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * VMware vSockets Driver
- *
- * Copyright (C) 2007-2013 VMware, Inc. All rights reserved.
- */
-
-#ifndef _VM_SOCKETS_H
-#define _VM_SOCKETS_H
-
-#include <uapi/linux/vm_sockets.h>
-
-#endif /* _VM_SOCKETS_H */
diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index 80ea0f93d3f7..c660402b10f2 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -10,7 +10,7 @@
 
 #include <linux/kernel.h>
 #include <linux/workqueue.h>
-#include <linux/vm_sockets.h>
+#include <uapi/linux/vm_sockets.h>
 
 #include "vsock_addr.h"
 
diff --git a/include/net/vsock_addr.h b/include/net/vsock_addr.h
index 57d2db5c4bdf..cf8cc140d68d 100644
--- a/include/net/vsock_addr.h
+++ b/include/net/vsock_addr.h
@@ -8,7 +8,7 @@
 #ifndef _VSOCK_ADDR_H_
 #define _VSOCK_ADDR_H_
 
-#include <linux/vm_sockets.h>
+#include <uapi/linux/vm_sockets.h>
 
 void vsock_addr_init(struct sockaddr_vm *addr, u32 cid, u32 port);
 int vsock_addr_validate(const struct sockaddr_vm *addr);
diff --git a/net/vmw_vsock/vmci_transport_notify.h b/net/vmw_vsock/vmci_transport_notify.h
index 7843f08d4290..a1aa5a998c0e 100644
--- a/net/vmw_vsock/vmci_transport_notify.h
+++ b/net/vmw_vsock/vmci_transport_notify.h
@@ -11,7 +11,6 @@
 #include <linux/types.h>
 #include <linux/vmw_vmci_defs.h>
 #include <linux/vmw_vmci_api.h>
-#include <linux/vm_sockets.h>
 
 #include "vmci_transport.h"
 
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
