Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8430F1D
	for <lists.virtualization@lfdr.de>; Fri, 31 May 2019 15:41:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4AE9E13B0;
	Fri, 31 May 2019 13:41:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AE1851185
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 13:40:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 64BA86C5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 13:40:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2296A309B15E;
	Fri, 31 May 2019 13:40:21 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-15.ams2.redhat.com
	[10.36.117.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 814ED5D719;
	Fri, 31 May 2019 13:40:13 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v3 3/5] vsock/virtio: reduce credit update messages
Date: Fri, 31 May 2019 15:39:52 +0200
Message-Id: <20190531133954.122567-4-sgarzare@redhat.com>
In-Reply-To: <20190531133954.122567-1-sgarzare@redhat.com>
References: <20190531133954.122567-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 31 May 2019 13:40:22 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
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

In order to reduce the number of credit update messages,
we send them only when the space available seen by the
transmitter is less than VIRTIO_VSOCK_MAX_PKT_BUF_SIZE.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/virtio_vsock.h            |  1 +
 net/vmw_vsock/virtio_transport_common.c | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
index 53703fe03681..23396b996214 100644
--- a/include/linux/virtio_vsock.h
+++ b/include/linux/virtio_vsock.h
@@ -41,6 +41,7 @@ struct virtio_vsock_sock {
 	/* Protected by rx_lock */
 	u32 buf_alloc;
 	u32 fwd_cnt;
+	u32 last_fwd_cnt;
 	u32 rx_bytes;
 	struct list_head rx_queue;
 };
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 694d9805f989..f7b0c4911308 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -212,6 +212,7 @@ static void virtio_transport_dec_rx_pkt(struct virtio_vsock_sock *vvs,
 void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct virtio_vsock_pkt *pkt)
 {
 	spin_lock_bh(&vvs->rx_lock);
+	vvs->last_fwd_cnt = vvs->fwd_cnt;
 	pkt->hdr.fwd_cnt = cpu_to_le32(vvs->fwd_cnt);
 	pkt->hdr.buf_alloc = cpu_to_le32(vvs->buf_alloc);
 	spin_unlock_bh(&vvs->rx_lock);
@@ -262,6 +263,7 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
 	struct virtio_vsock_sock *vvs = vsk->trans;
 	struct virtio_vsock_pkt *pkt;
 	size_t bytes, total = 0;
+	u32 free_space;
 	int err = -EFAULT;
 
 	spin_lock_bh(&vvs->rx_lock);
@@ -292,11 +294,19 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
 			virtio_transport_free_pkt(pkt);
 		}
 	}
+
+	free_space = vvs->buf_alloc - (vvs->fwd_cnt - vvs->last_fwd_cnt);
+
 	spin_unlock_bh(&vvs->rx_lock);
 
-	/* Send a credit pkt to peer */
-	virtio_transport_send_credit_update(vsk, VIRTIO_VSOCK_TYPE_STREAM,
-					    NULL);
+	/* We send a credit update only when the space available seen
+	 * by the transmitter is less than VIRTIO_VSOCK_MAX_PKT_BUF_SIZE
+	 */
+	if (free_space < VIRTIO_VSOCK_MAX_PKT_BUF_SIZE) {
+		virtio_transport_send_credit_update(vsk,
+						    VIRTIO_VSOCK_TYPE_STREAM,
+						    NULL);
+	}
 
 	return total;
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
