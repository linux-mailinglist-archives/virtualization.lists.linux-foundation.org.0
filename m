Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6D7118562
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 11:43:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ADD6E86278;
	Tue, 10 Dec 2019 10:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4f13-hSsxyv; Tue, 10 Dec 2019 10:43:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3738285EAC;
	Tue, 10 Dec 2019 10:43:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FEDCC1796;
	Tue, 10 Dec 2019 10:43:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3952BC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 28832857D5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJ81sORx80Df
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E5D7785EAC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575974607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaNjlxDMPZqlhfTY1RQg/SgU5i5aNL66cyn4N8vlSXA=;
 b=bpkEoMBjprOjiSCeedONUZ9RXOvqOkuIHJYSL/9f1P+hT2s9cwCl/qLMYuP7IUgI46bwxB
 bt35/CrrkDaxPhIgxYnXQdOafLEn5NJmMPUo6JKR3azz2kqEHQCKMROnZNQ3aV7RRxxo+k
 8onfeb+ezRHMAybyBACF9T8T1fISwNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-S4IbS98XMCuB5YZLZx2cFQ-1; Tue, 10 Dec 2019 05:43:26 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22F6D12A7E2A;
 Tue, 10 Dec 2019 10:43:25 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-168.ams2.redhat.com
 [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3F4C6057B;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org,
	davem@davemloft.net
Subject: [PATCH net-next v2 5/6] vsock: use local transport when it is loaded
Date: Tue, 10 Dec 2019 11:43:06 +0100
Message-Id: <20191210104307.89346-6-sgarzare@redhat.com>
In-Reply-To: <20191210104307.89346-1-sgarzare@redhat.com>
References: <20191210104307.89346-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: S4IbS98XMCuB5YZLZx2cFQ-1
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

Now that we have a transport that can handle the local communication,
we can use it when it is loaded.

A socket will use the local transport (loopback) when the remote
CID is:
- equal to VMADDR_CID_LOCAL
- or equal to transport_g2h->get_local_cid(), if transport_g2h
  is loaded (this allows us to keep the same behavior implemented
  by virtio and vmci transports)
- or equal to VMADDR_CID_HOST, if transport_g2h is not loaded

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v1 -> v2:
- use G2H transport when local transport is not loaded and remote cid
  is VMADDR_CID_LOCAL [Stefan]
---
 net/vmw_vsock/af_vsock.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 3da0749a0c97..9c5b2a91baad 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -388,6 +388,21 @@ void vsock_enqueue_accept(struct sock *listener, struct sock *connected)
 }
 EXPORT_SYMBOL_GPL(vsock_enqueue_accept);
 
+static bool vsock_use_local_transport(unsigned int remote_cid)
+{
+	if (!transport_local)
+		return false;
+
+	if (remote_cid == VMADDR_CID_LOCAL)
+		return true;
+
+	if (transport_g2h) {
+		return remote_cid == transport_g2h->get_local_cid();
+	} else {
+		return remote_cid == VMADDR_CID_HOST;
+	}
+}
+
 static void vsock_deassign_transport(struct vsock_sock *vsk)
 {
 	if (!vsk->transport)
@@ -404,9 +419,9 @@ static void vsock_deassign_transport(struct vsock_sock *vsk)
  * (e.g. during the connect() or when a connection request on a listener
  * socket is received).
  * The vsk->remote_addr is used to decide which transport to use:
+ *  - remote CID == VMADDR_CID_LOCAL or g2h->local_cid or VMADDR_CID_HOST if
+ *    g2h is not loaded, will use local transport;
  *  - remote CID <= VMADDR_CID_HOST will use guest->host transport;
- *  - remote CID == local_cid (guest->host transport) will use guest->host
- *    transport for loopback (host->guest transports don't support loopback);
  *  - remote CID > VMADDR_CID_HOST will use host->guest transport;
  */
 int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
@@ -421,9 +436,9 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
 		new_transport = transport_dgram;
 		break;
 	case SOCK_STREAM:
-		if (remote_cid <= VMADDR_CID_HOST ||
-		    (transport_g2h &&
-		     remote_cid == transport_g2h->get_local_cid()))
+		if (vsock_use_local_transport(remote_cid))
+			new_transport = transport_local;
+		else if (remote_cid <= VMADDR_CID_HOST)
 			new_transport = transport_g2h;
 		else
 			new_transport = transport_h2g;
@@ -466,6 +481,9 @@ bool vsock_find_cid(unsigned int cid)
 	if (transport_h2g && cid == VMADDR_CID_HOST)
 		return true;
 
+	if (transport_local && cid == VMADDR_CID_LOCAL)
+		return true;
+
 	return false;
 }
 EXPORT_SYMBOL_GPL(vsock_find_cid);
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
