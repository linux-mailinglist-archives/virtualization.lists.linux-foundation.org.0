Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3AE16E3
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 11:57:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4C51AEB6;
	Wed, 23 Oct 2019 09:57:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C0127EA5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:57:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id D26F114D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571824639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=TrWFvXQyogrOoIVt0ldFhISsLZ59Cn9KyEtJqWHGRz4=;
	b=gXHePmyk5sDb42P835+u050d0yHsnH4ZYnPNMOqaRiGr0x2+1tYt9dQ+hCKxw9sktcJSw4
	6ZaoPJYf1k0E+NNUw9T0WQMGvRwWI1pcQe/c+i4MyldXoUOo09jJxptwFiRASHbRVdckYD
	nZDXAwEMeMaDlJLG95YicPUAejoK71Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-326-77PGSS_8M_-kg7TYbOsZaw-1; Wed, 23 Oct 2019 05:57:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C02B680183D;
	Wed, 23 Oct 2019 09:57:14 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.36.118.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F29A45C1B2;
	Wed, 23 Oct 2019 09:56:29 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 04/14] vsock: add 'transport' member in the struct
	vsock_sock
Date: Wed, 23 Oct 2019 11:55:44 +0200
Message-Id: <20191023095554.11340-5-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-1-sgarzare@redhat.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 77PGSS_8M_-kg7TYbOsZaw-1
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

As a preparation to support multiple transports, this patch adds
the 'transport' member at the 'struct vsock_sock'.
This new field is initialized during the creation in the
__vsock_create() function.

This patch also renames the global 'transport' pointer to
'transport_single', since for now we're only supporting a single
transport registered at run-time.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/net/af_vsock.h   |  1 +
 net/vmw_vsock/af_vsock.c | 56 +++++++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index c660402b10f2..a5e1e134261d 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -27,6 +27,7 @@ extern spinlock_t vsock_table_lock;
 struct vsock_sock {
 	/* sk must be the first member. */
 	struct sock sk;
+	const struct vsock_transport *transport;
 	struct sockaddr_vm local_addr;
 	struct sockaddr_vm remote_addr;
 	/* Links for the global tables of bound and connected sockets. */
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 2f2582fb7fdd..c3a14f853eb0 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -126,7 +126,7 @@ static struct proto vsock_proto = {
  */
 #define VSOCK_DEFAULT_CONNECT_TIMEOUT (2 * HZ)
 
-static const struct vsock_transport *transport;
+static const struct vsock_transport *transport_single;
 static DEFINE_MUTEX(vsock_register_mutex);
 
 /**** UTILS ****/
@@ -408,7 +408,9 @@ static bool vsock_is_pending(struct sock *sk)
 
 static int vsock_send_shutdown(struct sock *sk, int mode)
 {
-	return transport->shutdown(vsock_sk(sk), mode);
+	struct vsock_sock *vsk = vsock_sk(sk);
+
+	return vsk->transport->shutdown(vsk, mode);
 }
 
 static void vsock_pending_work(struct work_struct *work)
@@ -518,7 +520,7 @@ static int __vsock_bind_stream(struct vsock_sock *vsk,
 static int __vsock_bind_dgram(struct vsock_sock *vsk,
 			      struct sockaddr_vm *addr)
 {
-	return transport->dgram_bind(vsk, addr);
+	return vsk->transport->dgram_bind(vsk, addr);
 }
 
 static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr)
@@ -536,7 +538,7 @@ static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr)
 	 * like AF_INET prevents binding to a non-local IP address (in most
 	 * cases), we only allow binding to the local CID.
 	 */
-	cid = transport->get_local_cid();
+	cid = vsk->transport->get_local_cid();
 	if (addr->svm_cid != cid && addr->svm_cid != VMADDR_CID_ANY)
 		return -EADDRNOTAVAIL;
 
@@ -586,6 +588,7 @@ struct sock *__vsock_create(struct net *net,
 		sk->sk_type = type;
 
 	vsk = vsock_sk(sk);
+	vsk->transport = transport_single;
 	vsock_addr_init(&vsk->local_addr, VMADDR_CID_ANY, VMADDR_PORT_ANY);
 	vsock_addr_init(&vsk->remote_addr, VMADDR_CID_ANY, VMADDR_PORT_ANY);
 
@@ -616,7 +619,7 @@ struct sock *__vsock_create(struct net *net,
 		vsk->connect_timeout = VSOCK_DEFAULT_CONNECT_TIMEOUT;
 	}
 
-	if (transport->init(vsk, psk) < 0) {
+	if (vsk->transport->init(vsk, psk) < 0) {
 		sk_free(sk);
 		return NULL;
 	}
@@ -641,7 +644,7 @@ static void __vsock_release(struct sock *sk, int level)
 		/* The release call is supposed to use lock_sock_nested()
 		 * rather than lock_sock(), if a sock lock should be acquired.
 		 */
-		transport->release(vsk);
+		vsk->transport->release(vsk);
 
 		/* When "level" is SINGLE_DEPTH_NESTING, use the nested
 		 * version to avoid the warning "possible recursive locking
@@ -670,7 +673,7 @@ static void vsock_sk_destruct(struct sock *sk)
 {
 	struct vsock_sock *vsk = vsock_sk(sk);
 
-	transport->destruct(vsk);
+	vsk->transport->destruct(vsk);
 
 	/* When clearing these addresses, there's no need to set the family and
 	 * possibly register the address family with the kernel.
@@ -694,13 +697,13 @@ static int vsock_queue_rcv_skb(struct sock *sk, struct sk_buff *skb)
 
 s64 vsock_stream_has_data(struct vsock_sock *vsk)
 {
-	return transport->stream_has_data(vsk);
+	return vsk->transport->stream_has_data(vsk);
 }
 EXPORT_SYMBOL_GPL(vsock_stream_has_data);
 
 s64 vsock_stream_has_space(struct vsock_sock *vsk)
 {
-	return transport->stream_has_space(vsk);
+	return vsk->transport->stream_has_space(vsk);
 }
 EXPORT_SYMBOL_GPL(vsock_stream_has_space);
 
@@ -869,6 +872,7 @@ static __poll_t vsock_poll(struct file *file, struct socket *sock,
 			mask |= EPOLLOUT | EPOLLWRNORM | EPOLLWRBAND;
 
 	} else if (sock->type == SOCK_STREAM) {
+		const struct vsock_transport *transport = vsk->transport;
 		lock_sock(sk);
 
 		/* Listening sockets that have connections in their accept
@@ -944,6 +948,7 @@ static int vsock_dgram_sendmsg(struct socket *sock, struct msghdr *msg,
 	struct sock *sk;
 	struct vsock_sock *vsk;
 	struct sockaddr_vm *remote_addr;
+	const struct vsock_transport *transport;
 
 	if (msg->msg_flags & MSG_OOB)
 		return -EOPNOTSUPP;
@@ -952,6 +957,7 @@ static int vsock_dgram_sendmsg(struct socket *sock, struct msghdr *msg,
 	err = 0;
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 
 	lock_sock(sk);
 
@@ -1036,8 +1042,8 @@ static int vsock_dgram_connect(struct socket *sock,
 	if (err)
 		goto out;
 
-	if (!transport->dgram_allow(remote_addr->svm_cid,
-				    remote_addr->svm_port)) {
+	if (!vsk->transport->dgram_allow(remote_addr->svm_cid,
+					 remote_addr->svm_port)) {
 		err = -EINVAL;
 		goto out;
 	}
@@ -1053,7 +1059,9 @@ static int vsock_dgram_connect(struct socket *sock,
 static int vsock_dgram_recvmsg(struct socket *sock, struct msghdr *msg,
 			       size_t len, int flags)
 {
-	return transport->dgram_dequeue(vsock_sk(sock->sk), msg, len, flags);
+	struct vsock_sock *vsk = vsock_sk(sock->sk);
+
+	return vsk->transport->dgram_dequeue(vsk, msg, len, flags);
 }
 
 static const struct proto_ops vsock_dgram_ops = {
@@ -1079,6 +1087,8 @@ static const struct proto_ops vsock_dgram_ops = {
 
 static int vsock_transport_cancel_pkt(struct vsock_sock *vsk)
 {
+	const struct vsock_transport *transport = vsk->transport;
+
 	if (!transport->cancel_pkt)
 		return -EOPNOTSUPP;
 
@@ -1115,6 +1125,7 @@ static int vsock_stream_connect(struct socket *sock, struct sockaddr *addr,
 	int err;
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	struct sockaddr_vm *remote_addr;
 	long timeout;
 	DEFINE_WAIT(wait);
@@ -1122,6 +1133,7 @@ static int vsock_stream_connect(struct socket *sock, struct sockaddr *addr,
 	err = 0;
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 
 	lock_sock(sk);
 
@@ -1365,6 +1377,7 @@ static int vsock_stream_setsockopt(struct socket *sock,
 	int err;
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	u64 val;
 
 	if (level != AF_VSOCK)
@@ -1385,6 +1398,7 @@ static int vsock_stream_setsockopt(struct socket *sock,
 	err = 0;
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 
 	lock_sock(sk);
 
@@ -1442,6 +1456,7 @@ static int vsock_stream_getsockopt(struct socket *sock,
 	int len;
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	u64 val;
 
 	if (level != AF_VSOCK)
@@ -1465,6 +1480,7 @@ static int vsock_stream_getsockopt(struct socket *sock,
 	err = 0;
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 
 	switch (optname) {
 	case SO_VM_SOCKETS_BUFFER_SIZE:
@@ -1509,6 +1525,7 @@ static int vsock_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 {
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	ssize_t total_written;
 	long timeout;
 	int err;
@@ -1517,6 +1534,7 @@ static int vsock_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 	total_written = 0;
 	err = 0;
 
@@ -1648,6 +1666,7 @@ vsock_stream_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 {
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	int err;
 	size_t target;
 	ssize_t copied;
@@ -1658,6 +1677,7 @@ vsock_stream_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 	err = 0;
 
 	lock_sock(sk);
@@ -1872,7 +1892,7 @@ static long vsock_dev_do_ioctl(struct file *filp,
 
 	switch (cmd) {
 	case IOCTL_VM_SOCKETS_GET_LOCAL_CID:
-		if (put_user(transport->get_local_cid(), p) != 0)
+		if (put_user(transport_single->get_local_cid(), p) != 0)
 			retval = -EFAULT;
 		break;
 
@@ -1919,7 +1939,7 @@ int __vsock_core_init(const struct vsock_transport *t, struct module *owner)
 	if (err)
 		return err;
 
-	if (transport) {
+	if (transport_single) {
 		err = -EBUSY;
 		goto err_busy;
 	}
@@ -1928,7 +1948,7 @@ int __vsock_core_init(const struct vsock_transport *t, struct module *owner)
 	 * unload while there are open sockets.
 	 */
 	vsock_proto.owner = owner;
-	transport = t;
+	transport_single = t;
 
 	vsock_device.minor = MISC_DYNAMIC_MINOR;
 	err = misc_register(&vsock_device);
@@ -1958,7 +1978,7 @@ int __vsock_core_init(const struct vsock_transport *t, struct module *owner)
 err_deregister_misc:
 	misc_deregister(&vsock_device);
 err_reset_transport:
-	transport = NULL;
+	transport_single = NULL;
 err_busy:
 	mutex_unlock(&vsock_register_mutex);
 	return err;
@@ -1975,7 +1995,7 @@ void vsock_core_exit(void)
 
 	/* We do not want the assignment below re-ordered. */
 	mb();
-	transport = NULL;
+	transport_single = NULL;
 
 	mutex_unlock(&vsock_register_mutex);
 }
@@ -1986,7 +2006,7 @@ const struct vsock_transport *vsock_core_get_transport(void)
 	/* vsock_register_mutex not taken since only the transport uses this
 	 * function and only while registered.
 	 */
-	return transport;
+	return transport_single;
 }
 EXPORT_SYMBOL_GPL(vsock_core_get_transport);
 
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
