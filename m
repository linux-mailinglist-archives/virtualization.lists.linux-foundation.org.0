Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB6EFC362
	for <lists.virtualization@lfdr.de>; Thu, 14 Nov 2019 10:59:43 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1B7381104;
	Thu, 14 Nov 2019 09:58:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4CC4010F9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 09:58:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5690A8A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573725505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=QDbHfRef8E4JEoIlx017VIijFBk4nzrys+O/YLbv6gs=;
	b=C2+k3EtQpkG7QAJDnn1KgkknDV25AXcQ5abrUm3jg+hw+7ir7VdDTp3zDcB43mcX7rSQQq
	3b67JJqRUGJeWnz3MnwACOMBL/XjTjgKrXW9gtTGmcslYeZDpOQKiHsgt7XcdK3hH47Gtm
	XJ/SZAq/YlvJyqUStIKsXLi0pj1H9JI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-49--txdL2sUNamqXRM8s7VjQA-1; Thu, 14 Nov 2019 04:58:24 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB66593A0;
	Thu, 14 Nov 2019 09:58:21 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-81.ams2.redhat.com
	[10.36.117.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D84F519757;
	Thu, 14 Nov 2019 09:58:17 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 04/15] vsock: add 'transport' member in the struct
	vsock_sock
Date: Thu, 14 Nov 2019 10:57:39 +0100
Message-Id: <20191114095750.59106-5-sgarzare@redhat.com>
In-Reply-To: <20191114095750.59106-1-sgarzare@redhat.com>
References: <20191114095750.59106-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: -txdL2sUNamqXRM8s7VjQA-1
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

As a preparation to support multiple transports, this patch adds
the 'transport' member at the 'struct vsock_sock'.
This new field is initialized during the creation in the
__vsock_create() function.

This patch also renames the global 'transport' pointer to
'transport_single', since for now we're only supporting a single
transport registered at run-time.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Jorgen Hansen <jhansen@vmware.com>
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
index eb13693e9d04..d813967d7dd5 100644
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
@@ -640,7 +643,7 @@ static void __vsock_release(struct sock *sk, int level)
 		/* The release call is supposed to use lock_sock_nested()
 		 * rather than lock_sock(), if a sock lock should be acquired.
 		 */
-		transport->release(vsk);
+		vsk->transport->release(vsk);
 
 		/* When "level" is SINGLE_DEPTH_NESTING, use the nested
 		 * version to avoid the warning "possible recursive locking
@@ -668,7 +671,7 @@ static void vsock_sk_destruct(struct sock *sk)
 {
 	struct vsock_sock *vsk = vsock_sk(sk);
 
-	transport->destruct(vsk);
+	vsk->transport->destruct(vsk);
 
 	/* When clearing these addresses, there's no need to set the family and
 	 * possibly register the address family with the kernel.
@@ -692,13 +695,13 @@ static int vsock_queue_rcv_skb(struct sock *sk, struct sk_buff *skb)
 
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
 
@@ -867,6 +870,7 @@ static __poll_t vsock_poll(struct file *file, struct socket *sock,
 			mask |= EPOLLOUT | EPOLLWRNORM | EPOLLWRBAND;
 
 	} else if (sock->type == SOCK_STREAM) {
+		const struct vsock_transport *transport = vsk->transport;
 		lock_sock(sk);
 
 		/* Listening sockets that have connections in their accept
@@ -942,6 +946,7 @@ static int vsock_dgram_sendmsg(struct socket *sock, struct msghdr *msg,
 	struct sock *sk;
 	struct vsock_sock *vsk;
 	struct sockaddr_vm *remote_addr;
+	const struct vsock_transport *transport;
 
 	if (msg->msg_flags & MSG_OOB)
 		return -EOPNOTSUPP;
@@ -950,6 +955,7 @@ static int vsock_dgram_sendmsg(struct socket *sock, struct msghdr *msg,
 	err = 0;
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 
 	lock_sock(sk);
 
@@ -1034,8 +1040,8 @@ static int vsock_dgram_connect(struct socket *sock,
 	if (err)
 		goto out;
 
-	if (!transport->dgram_allow(remote_addr->svm_cid,
-				    remote_addr->svm_port)) {
+	if (!vsk->transport->dgram_allow(remote_addr->svm_cid,
+					 remote_addr->svm_port)) {
 		err = -EINVAL;
 		goto out;
 	}
@@ -1051,7 +1057,9 @@ static int vsock_dgram_connect(struct socket *sock,
 static int vsock_dgram_recvmsg(struct socket *sock, struct msghdr *msg,
 			       size_t len, int flags)
 {
-	return transport->dgram_dequeue(vsock_sk(sock->sk), msg, len, flags);
+	struct vsock_sock *vsk = vsock_sk(sock->sk);
+
+	return vsk->transport->dgram_dequeue(vsk, msg, len, flags);
 }
 
 static const struct proto_ops vsock_dgram_ops = {
@@ -1077,6 +1085,8 @@ static const struct proto_ops vsock_dgram_ops = {
 
 static int vsock_transport_cancel_pkt(struct vsock_sock *vsk)
 {
+	const struct vsock_transport *transport = vsk->transport;
+
 	if (!transport->cancel_pkt)
 		return -EOPNOTSUPP;
 
@@ -1113,6 +1123,7 @@ static int vsock_stream_connect(struct socket *sock, struct sockaddr *addr,
 	int err;
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	struct sockaddr_vm *remote_addr;
 	long timeout;
 	DEFINE_WAIT(wait);
@@ -1120,6 +1131,7 @@ static int vsock_stream_connect(struct socket *sock, struct sockaddr *addr,
 	err = 0;
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 
 	lock_sock(sk);
 
@@ -1363,6 +1375,7 @@ static int vsock_stream_setsockopt(struct socket *sock,
 	int err;
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	u64 val;
 
 	if (level != AF_VSOCK)
@@ -1383,6 +1396,7 @@ static int vsock_stream_setsockopt(struct socket *sock,
 	err = 0;
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 
 	lock_sock(sk);
 
@@ -1440,6 +1454,7 @@ static int vsock_stream_getsockopt(struct socket *sock,
 	int len;
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	u64 val;
 
 	if (level != AF_VSOCK)
@@ -1463,6 +1478,7 @@ static int vsock_stream_getsockopt(struct socket *sock,
 	err = 0;
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 
 	switch (optname) {
 	case SO_VM_SOCKETS_BUFFER_SIZE:
@@ -1507,6 +1523,7 @@ static int vsock_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 {
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	ssize_t total_written;
 	long timeout;
 	int err;
@@ -1515,6 +1532,7 @@ static int vsock_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 	total_written = 0;
 	err = 0;
 
@@ -1646,6 +1664,7 @@ vsock_stream_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 {
 	struct sock *sk;
 	struct vsock_sock *vsk;
+	const struct vsock_transport *transport;
 	int err;
 	size_t target;
 	ssize_t copied;
@@ -1656,6 +1675,7 @@ vsock_stream_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
+	transport = vsk->transport;
 	err = 0;
 
 	lock_sock(sk);
@@ -1870,7 +1890,7 @@ static long vsock_dev_do_ioctl(struct file *filp,
 
 	switch (cmd) {
 	case IOCTL_VM_SOCKETS_GET_LOCAL_CID:
-		if (put_user(transport->get_local_cid(), p) != 0)
+		if (put_user(transport_single->get_local_cid(), p) != 0)
 			retval = -EFAULT;
 		break;
 
@@ -1917,7 +1937,7 @@ int __vsock_core_init(const struct vsock_transport *t, struct module *owner)
 	if (err)
 		return err;
 
-	if (transport) {
+	if (transport_single) {
 		err = -EBUSY;
 		goto err_busy;
 	}
@@ -1926,7 +1946,7 @@ int __vsock_core_init(const struct vsock_transport *t, struct module *owner)
 	 * unload while there are open sockets.
 	 */
 	vsock_proto.owner = owner;
-	transport = t;
+	transport_single = t;
 
 	vsock_device.minor = MISC_DYNAMIC_MINOR;
 	err = misc_register(&vsock_device);
@@ -1956,7 +1976,7 @@ int __vsock_core_init(const struct vsock_transport *t, struct module *owner)
 err_deregister_misc:
 	misc_deregister(&vsock_device);
 err_reset_transport:
-	transport = NULL;
+	transport_single = NULL;
 err_busy:
 	mutex_unlock(&vsock_register_mutex);
 	return err;
@@ -1973,7 +1993,7 @@ void vsock_core_exit(void)
 
 	/* We do not want the assignment below re-ordered. */
 	mb();
-	transport = NULL;
+	transport_single = NULL;
 
 	mutex_unlock(&vsock_register_mutex);
 }
@@ -1984,7 +2004,7 @@ const struct vsock_transport *vsock_core_get_transport(void)
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
