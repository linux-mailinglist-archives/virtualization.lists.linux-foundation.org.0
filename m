Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F272730F20
	for <lists.virtualization@lfdr.de>; Fri, 31 May 2019 15:42:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3EF3C118C;
	Fri, 31 May 2019 13:41:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DD6DC1185
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 13:40:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5FD985F4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 13:40:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C55A305B418;
	Fri, 31 May 2019 13:40:25 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-15.ams2.redhat.com
	[10.36.117.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D73B2FC4F;
	Fri, 31 May 2019 13:40:21 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v3 4/5] vhost/vsock: split packets to send using multiple
	buffers
Date: Fri, 31 May 2019 15:39:53 +0200
Message-Id: <20190531133954.122567-5-sgarzare@redhat.com>
In-Reply-To: <20190531133954.122567-1-sgarzare@redhat.com>
References: <20190531133954.122567-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 31 May 2019 13:40:25 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

If the packets to sent to the guest are bigger than the buffer
available, we can split them, using multiple buffers and fixing
the length in the packet header.
This is safe since virtio-vsock supports only stream sockets.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vsock.c                   | 51 +++++++++++++++++++------
 net/vmw_vsock/virtio_transport_common.c | 15 ++++++--
 2 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 7964e2daee09..fb731d09f5f1 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -94,7 +94,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
 		struct iov_iter iov_iter;
 		unsigned out, in;
 		size_t nbytes;
-		size_t len;
+		size_t iov_len, payload_len;
 		int head;
 
 		spin_lock_bh(&vsock->send_pkt_list_lock);
@@ -139,8 +139,24 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
 			break;
 		}
 
-		len = iov_length(&vq->iov[out], in);
-		iov_iter_init(&iov_iter, READ, &vq->iov[out], in, len);
+		iov_len = iov_length(&vq->iov[out], in);
+		if (iov_len < sizeof(pkt->hdr)) {
+			virtio_transport_free_pkt(pkt);
+			vq_err(vq, "Buffer len [%zu] too small\n", iov_len);
+			break;
+		}
+
+		iov_iter_init(&iov_iter, READ, &vq->iov[out], in, iov_len);
+		payload_len = pkt->len - pkt->off;
+
+		/* If the packet is greater than the space available in the
+		 * buffer, we split it using multiple buffers.
+		 */
+		if (payload_len > iov_len - sizeof(pkt->hdr))
+			payload_len = iov_len - sizeof(pkt->hdr);
+
+		/* Set the correct length in the header */
+		pkt->hdr.len = cpu_to_le32(payload_len);
 
 		nbytes = copy_to_iter(&pkt->hdr, sizeof(pkt->hdr), &iov_iter);
 		if (nbytes != sizeof(pkt->hdr)) {
@@ -149,16 +165,34 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
 			break;
 		}
 
-		nbytes = copy_to_iter(pkt->buf, pkt->len, &iov_iter);
-		if (nbytes != pkt->len) {
+		nbytes = copy_to_iter(pkt->buf + pkt->off, payload_len,
+				      &iov_iter);
+		if (nbytes != payload_len) {
 			virtio_transport_free_pkt(pkt);
 			vq_err(vq, "Faulted on copying pkt buf\n");
 			break;
 		}
 
-		vhost_add_used(vq, head, sizeof(pkt->hdr) + pkt->len);
+		vhost_add_used(vq, head, sizeof(pkt->hdr) + payload_len);
 		added = true;
 
+		/* Deliver to monitoring devices all correctly transmitted
+		 * packets.
+		 */
+		virtio_transport_deliver_tap_pkt(pkt);
+
+		pkt->off += payload_len;
+
+		/* If we didn't send all the payload we can requeue the packet
+		 * to send it with the next available buffer.
+		 */
+		if (pkt->off < pkt->len) {
+			spin_lock_bh(&vsock->send_pkt_list_lock);
+			list_add(&pkt->list, &vsock->send_pkt_list);
+			spin_unlock_bh(&vsock->send_pkt_list_lock);
+			continue;
+		}
+
 		if (pkt->reply) {
 			int val;
 
@@ -169,11 +203,6 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
 				restart_tx = true;
 		}
 
-		/* Deliver to monitoring devices all correctly transmitted
-		 * packets.
-		 */
-		virtio_transport_deliver_tap_pkt(pkt);
-
 		virtio_transport_free_pkt(pkt);
 	}
 	if (added)
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index f7b0c4911308..d192cb91cf25 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -98,8 +98,17 @@ static struct sk_buff *virtio_transport_build_skb(void *opaque)
 	struct virtio_vsock_pkt *pkt = opaque;
 	struct af_vsockmon_hdr *hdr;
 	struct sk_buff *skb;
+	size_t payload_len;
+	void *payload_buf;
 
-	skb = alloc_skb(sizeof(*hdr) + sizeof(pkt->hdr) + pkt->len,
+	/* A packet could be split to fit the RX buffer, so we can retrieve
+	 * the payload length from the header and the buffer pointer taking
+	 * care of the offset in the original packet.
+	 */
+	payload_len = le32_to_cpu(pkt->hdr.len);
+	payload_buf = pkt->buf + pkt->off;
+
+	skb = alloc_skb(sizeof(*hdr) + sizeof(pkt->hdr) + payload_len,
 			GFP_ATOMIC);
 	if (!skb)
 		return NULL;
@@ -139,8 +148,8 @@ static struct sk_buff *virtio_transport_build_skb(void *opaque)
 
 	skb_put_data(skb, &pkt->hdr, sizeof(pkt->hdr));
 
-	if (pkt->len) {
-		skb_put_data(skb, pkt->buf, pkt->len);
+	if (payload_len) {
+		skb_put_data(skb, payload_buf, payload_len);
 	}
 
 	return skb;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
