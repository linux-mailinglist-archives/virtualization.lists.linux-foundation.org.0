Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BB826FC337
	for <lists.virtualization@lfdr.de>; Thu, 14 Nov 2019 10:58:30 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F0EA710C3;
	Thu, 14 Nov 2019 09:58:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3B45A10D0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 09:58:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id B54D28A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573725492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=fnsq7tDFsMeM2bW2mfSnMuHGo8jDj07T4KGT6z4t4ZE=;
	b=YGfCTLns8+StSrntOKrtTAY38gll3mwfZJwNf5ByiF/zY7g0O8gw5Rp/gDshamr2g4mYUK
	TlRCt33rSCZ8CAxPmIBJ+mKwS0cVR842qwOJQMco9ENEPwE6ImN1jluc4h+G69yTHAWMx+
	BO84V8z6U20a0pb0eIf23mszffwu6So=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-71-A843iaCbNWGJZRawbJf9lg-1; Thu, 14 Nov 2019 04:58:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9CCF1005509;
	Thu, 14 Nov 2019 09:58:08 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-81.ams2.redhat.com
	[10.36.117.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51FD2165D3;
	Thu, 14 Nov 2019 09:58:05 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 02/15] vsock: remove vm_sockets_get_local_cid()
Date: Thu, 14 Nov 2019 10:57:37 +0100
Message-Id: <20191114095750.59106-3-sgarzare@redhat.com>
In-Reply-To: <20191114095750.59106-1-sgarzare@redhat.com>
References: <20191114095750.59106-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: A843iaCbNWGJZRawbJf9lg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org,
	Haiyang Zhang <haiyangz@microsoft.com>, Jorgen Hansen <jhansen@vmware.com>
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

vm_sockets_get_local_cid() is only used in virtio_transport_common.c.
We can replace it calling the virtio_transport_get_ops() and
using the get_local_cid() callback registered by the transport.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Jorgen Hansen <jhansen@vmware.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/vm_sockets.h              |  2 --
 net/vmw_vsock/af_vsock.c                | 10 ----------
 net/vmw_vsock/virtio_transport_common.c |  2 +-
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/linux/vm_sockets.h b/include/linux/vm_sockets.h
index 33f1a2ecd905..7dd899ccb920 100644
--- a/include/linux/vm_sockets.h
+++ b/include/linux/vm_sockets.h
@@ -10,6 +10,4 @@
 
 #include <uapi/linux/vm_sockets.h>
 
-int vm_sockets_get_local_cid(void);
-
 #endif /* _VM_SOCKETS_H */
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 1f4fde4711b6..eb13693e9d04 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -129,16 +129,6 @@ static struct proto vsock_proto = {
 static const struct vsock_transport *transport;
 static DEFINE_MUTEX(vsock_register_mutex);
 
-/**** EXPORTS ****/
-
-/* Get the ID of the local context.  This is transport dependent. */
-
-int vm_sockets_get_local_cid(void)
-{
-	return transport->get_local_cid();
-}
-EXPORT_SYMBOL_GPL(vm_sockets_get_local_cid);
-
 /**** UTILS ****/
 
 /* Each bound VSocket is stored in the bind hash table and each connected
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 828edd88488c..3edc373d2acc 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -168,7 +168,7 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 	struct virtio_vsock_pkt *pkt;
 	u32 pkt_len = info->pkt_len;
 
-	src_cid = vm_sockets_get_local_cid();
+	src_cid = virtio_transport_get_ops()->transport.get_local_cid();
 	src_port = vsk->local_addr.svm_port;
 	if (!info->remote_cid) {
 		dst_cid	= vsk->remote_addr.svm_cid;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
