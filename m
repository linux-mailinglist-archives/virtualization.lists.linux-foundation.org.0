Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7310CD95
	for <lists.virtualization@lfdr.de>; Thu, 28 Nov 2019 18:15:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5BA587B4B;
	Thu, 28 Nov 2019 17:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eDqZiwet-2S; Thu, 28 Nov 2019 17:15:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3B08787B49;
	Thu, 28 Nov 2019 17:15:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19D8EC0881;
	Thu, 28 Nov 2019 17:15:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C800AC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B2301883D4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id utPfKfM3XCZ0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8B818883CB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574961338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5auX1CvYbu3yZRsbt+Lmj7tuXc5Und38I/LjU8EXijg=;
 b=Gme6DFpsmRq90pucWX4aOMaMgl31v9cybP0/xu8Gh1mpREG/GQ0hM7j87fTYqwygqAtXmh
 gZnDQKTMvOzx9RyJIVxochWg3OuDpHcwoerPByyzi329lbx41MnNDg6069PWfFPBCH153P
 MBqVv3YRgI5e5jqfXhwg/zs59QnSo/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-j_2Yy6OxNziUa1CniJMwSw-1; Thu, 28 Nov 2019 12:15:35 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDD8D107ACC4;
 Thu, 28 Nov 2019 17:15:33 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-168.ams2.redhat.com
 [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7723B600C8;
 Thu, 28 Nov 2019 17:15:31 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [RFC PATCH 2/3] vsock/virtio_transport_common: handle netns of
 received packets
Date: Thu, 28 Nov 2019 18:15:18 +0100
Message-Id: <20191128171519.203979-3-sgarzare@redhat.com>
In-Reply-To: <20191128171519.203979-1-sgarzare@redhat.com>
References: <20191128171519.203979-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: j_2Yy6OxNziUa1CniJMwSw-1
X-Mimecast-Spam-Score: 0
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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

This patch allows transports that use virtio_transport_common
to specify the network namespace where a received packet is to
be delivered.

virtio_transport and vhost_transport, for now, use the default
network namespace.

vsock_loopback uses the same network namespace of the trasmitter.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vsock.c                   |  1 +
 include/linux/virtio_vsock.h            |  2 ++
 net/vmw_vsock/virtio_transport.c        |  2 ++
 net/vmw_vsock/virtio_transport_common.c | 13 ++++++++++---
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index dde392b91bb3..31b0f3608752 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -474,6 +474,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
 			continue;
 		}
 
+		pkt->net = vsock_default_net();
 		len = pkt->len;
 
 		/* Deliver to monitoring devices all received packets */
diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
index 71c81e0dc8f2..a025d105a456 100644
--- a/include/linux/virtio_vsock.h
+++ b/include/linux/virtio_vsock.h
@@ -43,6 +43,7 @@ struct virtio_vsock_pkt {
 	struct list_head list;
 	/* socket refcnt not held, only use for cancellation */
 	struct vsock_sock *vsk;
+	struct net *net;
 	void *buf;
 	u32 buf_len;
 	u32 len;
@@ -53,6 +54,7 @@ struct virtio_vsock_pkt {
 struct virtio_vsock_pkt_info {
 	u32 remote_cid, remote_port;
 	struct vsock_sock *vsk;
+	struct net *net;
 	struct msghdr *msg;
 	u32 pkt_len;
 	u16 type;
diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index dfbaf6bd8b1c..fb03a1535c21 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -527,6 +527,8 @@ static void virtio_transport_rx_work(struct work_struct *work)
 			}
 
 			pkt->len = len - sizeof(pkt->hdr);
+			pkt->net = vsock_default_net();
+
 			virtio_transport_deliver_tap_pkt(pkt);
 			virtio_transport_recv_pkt(&virtio_transport, pkt);
 		}
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 10a8cbe39f61..f249dc099c38 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -60,6 +60,7 @@ virtio_transport_alloc_pkt(struct virtio_vsock_pkt_info *info,
 	pkt->hdr.len		= cpu_to_le32(len);
 	pkt->reply		= info->reply;
 	pkt->vsk		= info->vsk;
+	pkt->net		= info->net;
 
 	if (info->msg && len > 0) {
 		pkt->buf = kmalloc(len, GFP_KERNEL);
@@ -260,6 +261,7 @@ static int virtio_transport_send_credit_update(struct vsock_sock *vsk,
 		.op = VIRTIO_VSOCK_OP_CREDIT_UPDATE,
 		.type = type,
 		.vsk = vsk,
+		.net = sock_net(sk_vsock(vsk)),
 	};
 
 	return virtio_transport_send_pkt_info(vsk, &info);
@@ -609,6 +611,7 @@ int virtio_transport_connect(struct vsock_sock *vsk)
 		.op = VIRTIO_VSOCK_OP_REQUEST,
 		.type = VIRTIO_VSOCK_TYPE_STREAM,
 		.vsk = vsk,
+		.net = sock_net(sk_vsock(vsk)),
 	};
 
 	return virtio_transport_send_pkt_info(vsk, &info);
@@ -625,6 +628,7 @@ int virtio_transport_shutdown(struct vsock_sock *vsk, int mode)
 			 (mode & SEND_SHUTDOWN ?
 			  VIRTIO_VSOCK_SHUTDOWN_SEND : 0),
 		.vsk = vsk,
+		.net = sock_net(sk_vsock(vsk)),
 	};
 
 	return virtio_transport_send_pkt_info(vsk, &info);
@@ -652,6 +656,7 @@ virtio_transport_stream_enqueue(struct vsock_sock *vsk,
 		.msg = msg,
 		.pkt_len = len,
 		.vsk = vsk,
+		.net = sock_net(sk_vsock(vsk)),
 	};
 
 	return virtio_transport_send_pkt_info(vsk, &info);
@@ -674,6 +679,7 @@ static int virtio_transport_reset(struct vsock_sock *vsk,
 		.type = VIRTIO_VSOCK_TYPE_STREAM,
 		.reply = !!pkt,
 		.vsk = vsk,
+		.net = sock_net(sk_vsock(vsk)),
 	};
 
 	/* Send RST only if the original pkt is not a RST pkt */
@@ -694,6 +700,7 @@ static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
 		.op = VIRTIO_VSOCK_OP_RST,
 		.type = le16_to_cpu(pkt->hdr.type),
 		.reply = true,
+		.net = pkt->net,
 	};
 
 	/* Send RST only if the original pkt is not a RST pkt */
@@ -978,6 +985,7 @@ virtio_transport_send_response(struct vsock_sock *vsk,
 		.remote_port = le32_to_cpu(pkt->hdr.src_port),
 		.reply = true,
 		.vsk = vsk,
+		.net = sock_net(sk_vsock(vsk)),
 	};
 
 	return virtio_transport_send_pkt_info(vsk, &info);
@@ -1075,7 +1083,6 @@ virtio_transport_recv_listen(struct sock *sk, struct virtio_vsock_pkt *pkt,
 void virtio_transport_recv_pkt(struct virtio_transport *t,
 			       struct virtio_vsock_pkt *pkt)
 {
-	struct net *net = vsock_default_net();
 	struct sockaddr_vm src, dst;
 	struct vsock_sock *vsk;
 	struct sock *sk;
@@ -1103,9 +1110,9 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
 	/* The socket must be in connected or bound table
 	 * otherwise send reset back
 	 */
-	sk = vsock_find_connected_socket(&src, &dst, net);
+	sk = vsock_find_connected_socket(&src, &dst, pkt->net);
 	if (!sk) {
-		sk = vsock_find_bound_socket(&dst, net);
+		sk = vsock_find_bound_socket(&dst, pkt->net);
 		if (!sk) {
 			(void)virtio_transport_reset_no_sock(t, pkt);
 			goto free_pkt;
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
