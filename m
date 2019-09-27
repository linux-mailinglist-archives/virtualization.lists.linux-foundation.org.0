Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D9C0435
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 13:29:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 260E1109C;
	Fri, 27 Sep 2019 11:28:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 049CFD0A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 11:28:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7995B8A6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 11:28:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED482A44AE4;
	Fri, 27 Sep 2019 11:28:37 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-249.ams2.redhat.com
	[10.36.117.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8BDA5D9C3;
	Fri, 27 Sep 2019 11:28:34 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [RFC PATCH 12/13] vsock: prevent transport modules unloading
Date: Fri, 27 Sep 2019 13:27:02 +0200
Message-Id: <20190927112703.17745-13-sgarzare@redhat.com>
In-Reply-To: <20190927112703.17745-1-sgarzare@redhat.com>
References: <20190927112703.17745-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Fri, 27 Sep 2019 11:28:38 +0000 (UTC)
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

This patch adds 'module' member in the 'struct vsock_transport'
in order to get/put the transport module. This prevents the
module unloading while sockets are assigned to it.

We increase the module refcnt when a socket is assigned to a
transport, and we decrease the module refcnt when the socket
is destructed.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vsock.c            |  1 +
 include/net/af_vsock.h           |  1 +
 net/vmw_vsock/af_vsock.c         | 23 +++++++++++++++++------
 net/vmw_vsock/hyperv_transport.c |  1 +
 net/vmw_vsock/virtio_transport.c |  1 +
 net/vmw_vsock/vmci_transport.c   |  1 +
 6 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 375af01a5b64..6d7a8fc9eb63 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -387,6 +387,7 @@ static bool vhost_vsock_more_replies(struct vhost_vsock *vsock)
 static struct virtio_transport vhost_transport = {
 	.transport = {
 		.features                 = VSOCK_TRANSPORT_F_H2G,
+		.module                   = THIS_MODULE,
 
 		.get_local_cid            = vhost_transport_get_local_cid,
 
diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index 2a081d19e20d..f10fa918bf23 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -100,6 +100,7 @@ struct vsock_transport_send_notify_data {
 
 struct vsock_transport {
 	uint64_t features;
+	struct module *module;
 
 	/* Initialize/tear-down socket. */
 	int (*init)(struct vsock_sock *, struct vsock_sock *);
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index c5f46b8242ce..750b62711b01 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -416,13 +416,28 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
 		return -ESOCKTNOSUPPORT;
 	}
 
-	if (!vsk->transport)
+	/* We increase the module refcnt to prevent the tranport unloading
+	 * while there are open sockets assigned to it.
+	 */
+	if (!vsk->transport || !try_module_get(vsk->transport->module)) {
+		vsk->transport = NULL;
 		return -ENODEV;
+	}
 
 	return vsk->transport->init(vsk, psk);
 }
 EXPORT_SYMBOL_GPL(vsock_assign_transport);
 
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
 static bool vsock_find_cid(unsigned int cid)
 {
 	if (transport_g2h && cid == transport_g2h->get_local_cid())
@@ -728,8 +743,7 @@ static void vsock_sk_destruct(struct sock *sk)
 {
 	struct vsock_sock *vsk = vsock_sk(sk);
 
-	if (vsk->transport)
-		vsk->transport->destruct(vsk);
+	vsock_deassign_transport(vsk);
 
 	/* When clearing these addresses, there's no need to set the family and
 	 * possibly register the address family with the kernel.
@@ -2161,9 +2175,6 @@ void vsock_core_unregister(const struct vsock_transport *t)
 {
 	mutex_lock(&vsock_register_mutex);
 
-	/* RFC-TODO: maybe we should check if there are open sockets
-	 * assigned to that transport and avoid the unregistration
-	 */
 	if (transport_h2g == t)
 		transport_h2g = NULL;
 
diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
index 94e6fc905a77..bd4f3c222904 100644
--- a/net/vmw_vsock/hyperv_transport.c
+++ b/net/vmw_vsock/hyperv_transport.c
@@ -857,6 +857,7 @@ int hvs_notify_send_post_enqueue(struct vsock_sock *vsk, ssize_t written,
 
 static struct vsock_transport hvs_transport = {
 	.features                 = VSOCK_TRANSPORT_F_G2H,
+	.module                   = THIS_MODULE,
 
 	.get_local_cid            = hvs_get_local_cid,
 
diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index 0ff037ef7f8e..439fe01e6691 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -463,6 +463,7 @@ static void virtio_vsock_rx_done(struct virtqueue *vq)
 static struct virtio_transport virtio_transport = {
 	.transport = {
 		.features                 = VSOCK_TRANSPORT_F_G2H,
+		.module                   = THIS_MODULE,
 
 		.get_local_cid            = virtio_transport_get_local_cid,
 
diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
index 52e63952d0d4..900392686c03 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -2021,6 +2021,7 @@ static u32 vmci_transport_get_local_cid(void)
 
 static struct vsock_transport vmci_transport = {
 	.features = VSOCK_TRANSPORT_F_DGRAM | VSOCK_TRANSPORT_F_H2G,
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
