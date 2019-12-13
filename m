Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A611EAA2
	for <lists.virtualization@lfdr.de>; Fri, 13 Dec 2019 19:48:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2C4C820403;
	Fri, 13 Dec 2019 18:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSpCZ7JZ4d-0; Fri, 13 Dec 2019 18:48:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A022520435;
	Fri, 13 Dec 2019 18:48:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92138C0881;
	Fri, 13 Dec 2019 18:48:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EBBDC0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 18:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8C1F225DC5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 18:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbTIRLnsKciv
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 18:48:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 4B51A20435
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 18:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576262894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSDDjKTdNjIjYY9lNEGudZN4ZxbNPvX2QUzIT/T3/bU=;
 b=H+RNfMxdNvTysBCOEmbPOGorcnkdQWR0n9YwUpYf65m+E0ejY7abgtQ04kHLSiM0UHU2Az
 BWCe4hrJHp904ycXffWHXpDCVGBoLFmMWifQXPHMZYB9ZUI3ZUjE5r6bEQvZko5mrr7fTa
 QDe+Owf7cMPRb/BLYrOL/nrCTXYhrwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-arex5kL_PveUSWwTT-l1-A-1; Fri, 13 Dec 2019 13:48:12 -0500
X-MC-Unique: arex5kL_PveUSWwTT-l1-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 657F1107ACC4;
 Fri, 13 Dec 2019 18:48:11 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-123.ams2.redhat.com
 [10.36.117.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDC1460474;
 Fri, 13 Dec 2019 18:48:09 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net 2/2] vsock/virtio: add WARN_ON check on
 virtio_transport_get_ops()
Date: Fri, 13 Dec 2019 19:48:01 +0100
Message-Id: <20191213184801.486675-3-sgarzare@redhat.com>
In-Reply-To: <20191213184801.486675-1-sgarzare@redhat.com>
References: <20191213184801.486675-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>
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

virtio_transport_get_ops() and virtio_transport_send_pkt_info()
can only be used on connecting/connected sockets, since a socket
assigned to a transport is required.

This patch adds a WARN_ON() on virtio_transport_get_ops() to check
this requirement, a comment and a returned error on
virtio_transport_send_pkt_info(),

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport_common.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index f5991006190e..6abec3fc81d1 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -34,6 +34,9 @@ virtio_transport_get_ops(struct vsock_sock *vsk)
 {
 	const struct vsock_transport *t = vsock_core_get_transport(vsk);
 
+	if (WARN_ON(!t))
+		return NULL;
+
 	return container_of(t, struct virtio_transport, transport);
 }
 
@@ -161,15 +164,25 @@ void virtio_transport_deliver_tap_pkt(struct virtio_vsock_pkt *pkt)
 }
 EXPORT_SYMBOL_GPL(virtio_transport_deliver_tap_pkt);
 
+/* This function can only be used on connecting/connected sockets,
+ * since a socket assigned to a transport is required.
+ *
+ * Do not use on listener sockets!
+ */
 static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 					  struct virtio_vsock_pkt_info *info)
 {
 	u32 src_cid, src_port, dst_cid, dst_port;
+	const struct virtio_transport *t_ops;
 	struct virtio_vsock_sock *vvs;
 	struct virtio_vsock_pkt *pkt;
 	u32 pkt_len = info->pkt_len;
 
-	src_cid = virtio_transport_get_ops(vsk)->transport.get_local_cid();
+	t_ops = virtio_transport_get_ops(vsk);
+	if (unlikely(!t_ops))
+		return -EFAULT;
+
+	src_cid = t_ops->transport.get_local_cid();
 	src_port = vsk->local_addr.svm_port;
 	if (!info->remote_cid) {
 		dst_cid	= vsk->remote_addr.svm_cid;
@@ -202,7 +215,7 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 
 	virtio_transport_inc_tx_pkt(vvs, pkt);
 
-	return virtio_transport_get_ops(vsk)->send_pkt(pkt);
+	return t_ops->send_pkt(pkt);
 }
 
 static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
