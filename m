Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F8E171F
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 11:59:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC806ED4;
	Wed, 23 Oct 2019 09:58:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D0558EB1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:58:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 385E4887
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571824705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=E6cdvtI+lVBkl+0vlDQhx2DxQdbC47YC/eILjebBwE4=;
	b=G8uWtAVs49ZQU4YUtaiffkTTBvmHddGZDveP8zSTsa4pHxG+9zKKaEE5kVRX6rw974uYcM
	QSAIqUyXyuT1tYfeWKqRhhUIRg2hgfDLK7dgEpI1t6WSkbSq3e52yc2HMoVSWDjymsQC42
	jl9VnkjffsIRf0DyDXWcDe0w+qTSAFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-259-4Nuw3kesNVi0_lsKblgbMQ-1; Wed, 23 Oct 2019 05:58:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB84C1005500;
	Wed, 23 Oct 2019 09:58:19 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.36.118.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58BCB5C1B2;
	Wed, 23 Oct 2019 09:58:16 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 13/14] vsock: prevent transport modules unloading
Date: Wed, 23 Oct 2019 11:55:53 +0200
Message-Id: <20191023095554.11340-14-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-1-sgarzare@redhat.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 4Nuw3kesNVi0_lsKblgbMQ-1
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

This patch adds 'module' member in the 'struct vsock_transport'
in order to get/put the transport module. This prevents the
module unloading while sockets are assigned to it.

We increase the module refcnt when a socket is assigned to a
transport, and we decrease the module refcnt when the socket
is destructed.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
RFC -> v1:
- fixed typo 's/tranport/transport/' in a comment (Stefan)
---
 drivers/vhost/vsock.c            |  2 ++
 include/net/af_vsock.h           |  2 ++
 net/vmw_vsock/af_vsock.c         | 20 ++++++++++++++++----
 net/vmw_vsock/hyperv_transport.c |  2 ++
 net/vmw_vsock/virtio_transport.c |  2 ++
 net/vmw_vsock/vmci_transport.c   |  1 +
 6 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index b235f4bbe8ea..fdda9ec625ad 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -386,6 +386,8 @@ static bool vhost_vsock_more_replies(struct vhost_vsock *vsock)
 
 static struct virtio_transport vhost_transport = {
 	.transport = {
+		.module                   = THIS_MODULE,
+
 		.get_local_cid            = vhost_transport_get_local_cid,
 
 		.init                     = virtio_transport_do_socket_init,
diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index 27a3463e4892..269e2f034789 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -100,6 +100,8 @@ struct vsock_transport_send_notify_data {
 #define VSOCK_TRANSPORT_F_DGRAM		0x00000004
 
 struct vsock_transport {
+	struct module *module;
+
 	/* Initialize/tear-down socket. */
 	int (*init)(struct vsock_sock *, struct vsock_sock *);
 	void (*destruct)(struct vsock_sock *);
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index dddd85d9a147..1f2e707cae66 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -380,6 +380,16 @@ void vsock_enqueue_accept(struct sock *listener, struct sock *connected)
 }
 EXPORT_SYMBOL_GPL(vsock_enqueue_accept);
 
+static void vsock_deassign_transport(struct vsock_sock *vsk)
+{
+	if (!vsk->transport)
+		return;
+
+	vsk->transport->destruct(vsk);
+	module_put(vsk->transport->module);
+	vsk->transport = NULL;
+}
+
 /* Assign a transport to a socket and call the .init transport callback.
  *
  * Note: for stream socket this must be called when vsk->remote_addr is set
@@ -413,10 +423,13 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
 			return 0;
 
 		vsk->transport->release(vsk);
-		vsk->transport->destruct(vsk);
+		vsock_deassign_transport(vsk);
 	}
 
-	if (!new_transport)
+	/* We increase the module refcnt to prevent the transport unloading
+	 * while there are open sockets assigned to it.
+	 */
+	if (!new_transport || !try_module_get(new_transport->module))
 		return -ENODEV;
 
 	vsk->transport = new_transport;
@@ -737,8 +750,7 @@ static void vsock_sk_destruct(struct sock *sk)
 {
 	struct vsock_sock *vsk = vsock_sk(sk);
 
-	if (vsk->transport)
-		vsk->transport->destruct(vsk);
+	vsock_deassign_transport(vsk);
 
 	/* When clearing these addresses, there's no need to set the family and
 	 * possibly register the address family with the kernel.
diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
index 0ea66d87af39..d0a349d85414 100644
--- a/net/vmw_vsock/hyperv_transport.c
+++ b/net/vmw_vsock/hyperv_transport.c
@@ -857,6 +857,8 @@ int hvs_notify_send_post_enqueue(struct vsock_sock *vsk, ssize_t written,
 }
 
 static struct vsock_transport hvs_transport = {
+	.module                   = THIS_MODULE,
+
 	.get_local_cid            = hvs_get_local_cid,
 
 	.init                     = hvs_sock_init,
diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index 83ad85050384..1458c5c8b64d 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -462,6 +462,8 @@ static void virtio_vsock_rx_done(struct virtqueue *vq)
 
 static struct virtio_transport virtio_transport = {
 	.transport = {
+		.module                   = THIS_MODULE,
+
 		.get_local_cid            = virtio_transport_get_local_cid,
 
 		.init                     = virtio_transport_do_socket_init,
diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
index 04437f822d82..0cbf023fae11 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -2019,6 +2019,7 @@ static u32 vmci_transport_get_local_cid(void)
 }
 
 static struct vsock_transport vmci_transport = {
+	.module = THIS_MODULE,
 	.init = vmci_transport_socket_init,
 	.destruct = vmci_transport_destruct,
 	.release = vmci_transport_release,
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
