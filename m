Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893B11855C
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 11:43:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82727857B0;
	Tue, 10 Dec 2019 10:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id py_YyFBXp8oc; Tue, 10 Dec 2019 10:43:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F2EB85F7E;
	Tue, 10 Dec 2019 10:43:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 660CEC0881;
	Tue, 10 Dec 2019 10:43:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE3CBC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B94E28558A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1cw0GE5Q_6j
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB94485585
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575974600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnXvqpFpNzP8oPTla7hKks1vt4Ju8zKblazbqfdN9vI=;
 b=c1ncx/iQdjW5xNL2XOuE+Rdn1F3whxUFvLefXUx2hKz9ZdSFYcRutmui0dE+qSQA/zYwwp
 iXsBErDRPa2mk7bl02Frp/9aJnjHZOoJ32JF2wgeDlhj4L0ZckRkFK5+C6dvy9vlLEtpjJ
 81XJ6/13dzbUCFPZVJxM8bWNeLRu8VU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-cxDu77_YMKiBjb-D9Pf9LQ-1; Tue, 10 Dec 2019 05:43:19 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6E17800D5E;
 Tue, 10 Dec 2019 10:43:17 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-168.ams2.redhat.com
 [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7B5660568;
 Tue, 10 Dec 2019 10:43:15 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org,
	davem@davemloft.net
Subject: [PATCH net-next v2 2/6] vsock: add VMADDR_CID_LOCAL definition
Date: Tue, 10 Dec 2019 11:43:03 +0100
Message-Id: <20191210104307.89346-3-sgarzare@redhat.com>
In-Reply-To: <20191210104307.89346-1-sgarzare@redhat.com>
References: <20191210104307.89346-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: cxDu77_YMKiBjb-D9Pf9LQ-1
X-Mimecast-Spam-Score: 0
Cc: kvm@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
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

The VMADDR_CID_RESERVED (1) was used by VMCI, but now it is not
used anymore, so we can reuse it for local communication
(loopback) adding the new well-know CID: VMADDR_CID_LOCAL.

Cc: Jorgen Hansen <jhansen@vmware.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Jorgen Hansen <jhansen@vmware.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/uapi/linux/vm_sockets.h | 8 +++++---
 net/vmw_vsock/vmci_transport.c  | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/vm_sockets.h b/include/uapi/linux/vm_sockets.h
index 68d57c5e99bc..fd0ed7221645 100644
--- a/include/uapi/linux/vm_sockets.h
+++ b/include/uapi/linux/vm_sockets.h
@@ -99,11 +99,13 @@
 
 #define VMADDR_CID_HYPERVISOR 0
 
-/* This CID is specific to VMCI and can be considered reserved (even VMCI
- * doesn't use it anymore, it's a legacy value from an older release).
+/* Use this as the destination CID in an address when referring to the
+ * local communication (loopback).
+ * (This was VMADDR_CID_RESERVED, but even VMCI doesn't use it anymore,
+ * it was a legacy value from an older release).
  */
 
-#define VMADDR_CID_RESERVED 1
+#define VMADDR_CID_LOCAL 1
 
 /* Use this as the destination CID in an address when referring to the host
  * (any process other than the hypervisor).  VMCI relies on it being 2, but
diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
index 644d32e43d23..4b8b1150a738 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -648,7 +648,7 @@ static int vmci_transport_recv_dgram_cb(void *data, struct vmci_datagram *dg)
 static bool vmci_transport_stream_allow(u32 cid, u32 port)
 {
 	static const u32 non_socket_contexts[] = {
-		VMADDR_CID_RESERVED,
+		VMADDR_CID_LOCAL,
 	};
 	int i;
 
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
