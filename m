Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDBBE1700
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 11:58:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 73C3AEC3;
	Wed, 23 Oct 2019 09:58:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 41D15EBA
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:58:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A43B214D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571824681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=qx+Ku3BlIpX0I15FPAq9IIdpSSgHtN5oiRx9nIugrWU=;
	b=WbGlToV26OtqHv5PrMDWAsqGb7Nbendg74Ez8ZbWj2zGZ7e3evpubD0F8UEF1Rf4U0X+AT
	XNmkMfGBAYglyouYud7prFt2KHW8JdSx9ly/gsbAVFPPLZGLgM66ak2k+DQLoQ/AZzBaC7
	9Af9bqMzhG76JE1r5UC4DQ5ioCm0Et4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-309-PG_tMOeSOJiKcBZB6AL-jA-1; Wed, 23 Oct 2019 05:57:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ED6E800D49;
	Wed, 23 Oct 2019 09:57:56 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.36.118.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 109675C1B2;
	Wed, 23 Oct 2019 09:57:52 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 08/14] vsock: add vsock_create_connected() called by
	transports
Date: Wed, 23 Oct 2019 11:55:48 +0200
Message-Id: <20191023095554.11340-9-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-1-sgarzare@redhat.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: PG_tMOeSOJiKcBZB6AL-jA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
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

All transports call __vsock_create() with the same parameters,
most of them depending on the parent socket. In order to simplify
the VSOCK core APIs exposed to the transports, this patch adds
the vsock_create_connected() callable from transports to create
a new socket when a connection request is received.
We also unexported the __vsock_create().

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/net/af_vsock.h                  |  5 +----
 net/vmw_vsock/af_vsock.c                | 20 +++++++++++++-------
 net/vmw_vsock/hyperv_transport.c        |  3 +--
 net/vmw_vsock/virtio_transport_common.c |  3 +--
 net/vmw_vsock/vmci_transport.c          |  3 +--
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index 4b5d16840fd4..fa1570dc9f5c 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -76,10 +76,7 @@ struct vsock_sock {
 
 s64 vsock_stream_has_data(struct vsock_sock *vsk);
 s64 vsock_stream_has_space(struct vsock_sock *vsk);
-struct sock *__vsock_create(struct net *net,
-			    struct socket *sock,
-			    struct sock *parent,
-			    gfp_t priority, unsigned short type, int kern);
+struct sock *vsock_create_connected(struct sock *parent);
 
 /**** TRANSPORT ****/
 
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 90ac46ea12ef..95878bed2c67 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -567,12 +567,12 @@ static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr)
 
 static void vsock_connect_timeout(struct work_struct *work);
 
-struct sock *__vsock_create(struct net *net,
-			    struct socket *sock,
-			    struct sock *parent,
-			    gfp_t priority,
-			    unsigned short type,
-			    int kern)
+static struct sock *__vsock_create(struct net *net,
+				   struct socket *sock,
+				   struct sock *parent,
+				   gfp_t priority,
+				   unsigned short type,
+				   int kern)
 {
 	struct sock *sk;
 	struct vsock_sock *psk;
@@ -639,7 +639,6 @@ struct sock *__vsock_create(struct net *net,
 
 	return sk;
 }
-EXPORT_SYMBOL_GPL(__vsock_create);
 
 static void __vsock_release(struct sock *sk, int level)
 {
@@ -705,6 +704,13 @@ static int vsock_queue_rcv_skb(struct sock *sk, struct sk_buff *skb)
 	return err;
 }
 
+struct sock *vsock_create_connected(struct sock *parent)
+{
+	return __vsock_create(sock_net(parent), NULL, parent, GFP_KERNEL,
+			      parent->sk_type, 0);
+}
+EXPORT_SYMBOL_GPL(vsock_create_connected);
+
 s64 vsock_stream_has_data(struct vsock_sock *vsk)
 {
 	return vsk->transport->stream_has_data(vsk);
diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
index d62297a62ca6..0ce792a1bf6c 100644
--- a/net/vmw_vsock/hyperv_transport.c
+++ b/net/vmw_vsock/hyperv_transport.c
@@ -360,8 +360,7 @@ static void hvs_open_connection(struct vmbus_channel *chan)
 		if (sk->sk_ack_backlog >= sk->sk_max_ack_backlog)
 			goto out;
 
-		new = __vsock_create(sock_net(sk), NULL, sk, GFP_KERNEL,
-				     sk->sk_type, 0);
+		new = vsock_create_connected(sk);
 		if (!new)
 			goto out;
 
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index b2a310dfa158..f7d0ecbd8f97 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -1002,8 +1002,7 @@ virtio_transport_recv_listen(struct sock *sk, struct virtio_vsock_pkt *pkt)
 		return -ENOMEM;
 	}
 
-	child = __vsock_create(sock_net(sk), NULL, sk, GFP_KERNEL,
-			       sk->sk_type, 0);
+	child = vsock_create_connected(sk);
 	if (!child) {
 		virtio_transport_reset(vsk, pkt);
 		return -ENOMEM;
diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
index 8290d37b6587..5955238ffc13 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -1004,8 +1004,7 @@ static int vmci_transport_recv_listen(struct sock *sk,
 		return -ECONNREFUSED;
 	}
 
-	pending = __vsock_create(sock_net(sk), NULL, sk, GFP_KERNEL,
-				 sk->sk_type, 0);
+	pending = vsock_create_connected(sk);
 	if (!pending) {
 		vmci_transport_send_reset(sk, pkt);
 		return -ENOMEM;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
