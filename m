Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E886DAC96
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 14:44:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7F418157D;
	Thu, 17 Oct 2019 12:44:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7E9F8152F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 12:44:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 448F5887
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 12:44:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1F6E3082E10;
	Thu, 17 Oct 2019 12:44:12 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-195.ams2.redhat.com
	[10.36.117.195])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 675D85D9D5;
	Thu, 17 Oct 2019 12:44:11 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 2/2] vsock/virtio: discard packets if credit is not
	respected
Date: Thu, 17 Oct 2019 14:44:03 +0200
Message-Id: <20191017124403.266242-3-sgarzare@redhat.com>
In-Reply-To: <20191017124403.266242-1-sgarzare@redhat.com>
References: <20191017124403.266242-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 17 Oct 2019 12:44:12 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

If the remote peer doesn't respect the credit information
(buf_alloc, fwd_cnt), sending more data than it can send,
we should drop the packets to prevent a malicious peer
from using all of our memory.

This is patch follows the VIRTIO spec: "VIRTIO_VSOCK_OP_RW data
packets MUST only be transmitted when the peer has sufficient
free buffer space for the payload"

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport_common.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index db127a69f5c3..481f7f8a1655 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -204,10 +204,14 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
 	return virtio_transport_get_ops()->send_pkt(pkt);
 }
 
-static void virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
+static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
 					struct virtio_vsock_pkt *pkt)
 {
+	if (vvs->rx_bytes + pkt->len > vvs->buf_alloc)
+		return false;
+
 	vvs->rx_bytes += pkt->len;
+	return true;
 }
 
 static void virtio_transport_dec_rx_pkt(struct virtio_vsock_sock *vvs,
@@ -879,14 +883,18 @@ virtio_transport_recv_enqueue(struct vsock_sock *vsk,
 			      struct virtio_vsock_pkt *pkt)
 {
 	struct virtio_vsock_sock *vvs = vsk->trans;
-	bool free_pkt = false;
+	bool can_enqueue, free_pkt = false;
 
 	pkt->len = le32_to_cpu(pkt->hdr.len);
 	pkt->off = 0;
 
 	spin_lock_bh(&vvs->rx_lock);
 
-	virtio_transport_inc_rx_pkt(vvs, pkt);
+	can_enqueue = virtio_transport_inc_rx_pkt(vvs, pkt);
+	if (!can_enqueue) {
+		free_pkt = true;
+		goto out;
+	}
 
 	/* Try to copy small packets into the buffer of last packet queued,
 	 * to avoid wasting memory queueing the entire buffer with a small
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
