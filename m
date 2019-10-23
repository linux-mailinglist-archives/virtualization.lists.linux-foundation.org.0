Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B81E16EA
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 11:57:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C9B33EA8;
	Wed, 23 Oct 2019 09:57:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D5F02EA8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:57:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 53B2887B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571824667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=fqEVukmtRQ20TfPCCwpY83ZSLqT58x9/uSq1KZRWLtw=;
	b=itufV58Vr9czFB+pFtQ2BgnlF1Mw916bnJzE9QIVU4Wul5D2SyoR0fxIdedBk0ryRgkAbl
	3q36a2JJGeIAzLVNhJ18l4irhl3ujWzjMjtvCXvCeYuucKa9qFaWnowX7t+APMlVYiSbJA
	kSCGgB+zIQjCZXyqVCo2S2QZKrCGtQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-212-6imalv2zMeWpY2Vw-v-Irg-1; Wed, 23 Oct 2019 05:57:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B7251005500;
	Wed, 23 Oct 2019 09:57:42 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.36.118.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 713025C1B2;
	Wed, 23 Oct 2019 09:57:32 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 06/14] vsock: add 'struct vsock_sock *' param to
	vsock_core_get_transport()
Date: Wed, 23 Oct 2019 11:55:46 +0200
Message-Id: <20191023095554.11340-7-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-1-sgarzare@redhat.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 6imalv2zMeWpY2Vw-v-Irg-1
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

Since now the 'struct vsock_sock' object contains a pointer to
the transport, this patch adds a parameter to the
vsock_core_get_transport() to return the right transport
assigned to the socket.

This patch modifies also the virtio_transport_get_ops(), that
uses the vsock_core_get_transport(), adding the
'struct vsock_sock *' parameter.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
RFC -> v1:
- Removed comment about protecting transport_single (Stefan)
---
 include/net/af_vsock.h                  | 2 +-
 net/vmw_vsock/af_vsock.c                | 7 ++-----
 net/vmw_vsock/virtio_transport_common.c | 9 +++++----
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index a5e1e134261d..2ca67d048de4 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -166,7 +166,7 @@ static inline int vsock_core_init(const struct vsock_transport *t)
 void vsock_core_exit(void);
 
 /* The transport may downcast this to access transport-specific functions */
-const struct vsock_transport *vsock_core_get_transport(void);
+const struct vsock_transport *vsock_core_get_transport(struct vsock_sock *vsk);
 
 /**** UTILS ****/
 
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index c3a14f853eb0..eaea159006c8 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2001,12 +2001,9 @@ void vsock_core_exit(void)
 }
 EXPORT_SYMBOL_GPL(vsock_core_exit);
 
-const struct vsock_transport *vsock_core_get_transport(void)
+const struct vsock_transport *vsock_core_get_transport(struct vsock_sock *vsk)
 {
-	/* vsock_register_mutex not taken since only the transport uses this
-	 * function and only while registered.
-	 */
-	return transport_single;
+	return vsk->transport;
 }
 EXPORT_SYMBOL_GPL(vsock_core_get_transport);
 
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 9763394f7a61..37a1c7e7c7fe 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -29,9 +29,10 @@
 /* Threshold for detecting small packets to copy */
 #define GOOD_COPY_LEN  128
 
-static const struct virtio_transport *virtio_transport_get_ops(void)
+static const struct virtio_transport *
+virtio_transport_get_ops(struct vsock_sock *vsk)
 {
-	const struct vsock_transport *t = vsock_core_get_transport();
+	const struct vsock_transport *t = vsock_core_get_transport(vsk);
 
 	return container_of(t, struct virtio_transport, transport);
 }
@@ -168,7 +169,7 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 	struct virtio_vsock_pkt *pkt;
 	u32 pkt_len = info->pkt_len;
 
-	src_cid = virtio_transport_get_ops()->transport.get_local_cid();
+	src_cid = virtio_transport_get_ops(vsk)->transport.get_local_cid();
 	src_port = vsk->local_addr.svm_port;
 	if (!info->remote_cid) {
 		dst_cid	= vsk->remote_addr.svm_cid;
@@ -201,7 +202,7 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 
 	virtio_transport_inc_tx_pkt(vvs, pkt);
 
-	return virtio_transport_get_ops()->send_pkt(pkt);
+	return virtio_transport_get_ops(vsk)->send_pkt(pkt);
 }
 
 static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
