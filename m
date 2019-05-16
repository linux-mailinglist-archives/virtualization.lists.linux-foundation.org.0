Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41B2008D
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 09:48:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F511C2A;
	Thu, 16 May 2019 07:48:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CE4D2B62
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 07:47:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5563C2C3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 07:47:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE06F882FB;
	Thu, 16 May 2019 07:47:57 +0000 (UTC)
Received: from hp-dl380pg8-02.lab.eng.pek2.redhat.com
	(hp-dl380pg8-02.lab.eng.pek2.redhat.com [10.73.8.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A8DC383F;
	Thu, 16 May 2019 07:47:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 2/4] vhost_net: fix possible infinite loop
Date: Thu, 16 May 2019 03:47:40 -0400
Message-Id: <1557992862-27320-3-git-send-email-jasowang@redhat.com>
In-Reply-To: <1557992862-27320-1-git-send-email-jasowang@redhat.com>
References: <1557992862-27320-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 16 May 2019 07:47:58 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pbonzini@redhat.com, stefanha@redhat.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

When the rx buffer is too small for a packet, we will discard the vq
descriptor and retry it for the next packet:

while ((sock_len = vhost_net_rx_peek_head_len(net, sock->sk,
					      &busyloop_intr))) {
...
	/* On overrun, truncate and discard */
	if (unlikely(headcount > UIO_MAXIOV)) {
		iov_iter_init(&msg.msg_iter, READ, vq->iov, 1, 1);
		err = sock->ops->recvmsg(sock, &msg,
					 1, MSG_DONTWAIT | MSG_TRUNC);
		pr_debug("Discarded rx packet: len %zd\n", sock_len);
		continue;
	}
...
}

This makes it possible to trigger a infinite while..continue loop
through the co-opreation of two VMs like:

1) Malicious VM1 allocate 1 byte rx buffer and try to slow down the
   vhost process as much as possible e.g using indirect descriptors or
   other.
2) Malicious VM2 generate packets to VM1 as fast as possible

Fixing this by checking against weight at the end of RX and TX
loop. This also eliminate other similar cases when:

- userspace is consuming the packets in the meanwhile
- theoretical TOCTOU attack if guest moving avail index back and forth
  to hit the continue after vhost find guest just add new buffers

This addresses CVE-2019-3900.

Fixes: d8316f3991d20 ("vhost: fix total length when packets are too short")
Fixes: 3a4d5c94e9593 ("vhost_net: a kernel-level virtio server")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
The patch is needed for stable.
---
 drivers/vhost/net.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 061a06d..2d9df78 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -773,7 +773,7 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 	int sent_pkts = 0;
 	bool sock_can_batch = (sock->sk->sk_sndbuf == INT_MAX);
 
-	for (;;) {
+	do {
 		bool busyloop_intr = false;
 
 		if (nvq->done_idx == VHOST_NET_BATCH)
@@ -839,9 +839,7 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 		vq->heads[nvq->done_idx].id = cpu_to_vhost32(vq, head);
 		vq->heads[nvq->done_idx].len = 0;
 		++nvq->done_idx;
-		if (vhost_exceeds_weight(vq, ++sent_pkts, total_len))
-			break;
-	}
+	} while (likely(!vhost_exceeds_weight(vq, ++sent_pkts, total_len)));
 
 	vhost_tx_batch(net, nvq, sock, &msg);
 }
@@ -866,7 +864,7 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 	bool zcopy_used;
 	int sent_pkts = 0;
 
-	for (;;) {
+	do {
 		bool busyloop_intr;
 
 		/* Release DMAs done buffers first */
@@ -943,10 +941,7 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 		else
 			vhost_zerocopy_signal_used(net, vq);
 		vhost_net_tx_packet(net);
-		if (unlikely(vhost_exceeds_weight(vq, ++sent_pkts,
-						  total_len)))
-			break;
-	}
+	} while (likely(!vhost_exceeds_weight(vq, ++sent_pkts, total_len)));
 }
 
 /* Expects to be always run from workqueue - which acts as
@@ -1144,8 +1139,11 @@ static void handle_rx(struct vhost_net *net)
 		vq->log : NULL;
 	mergeable = vhost_has_feature(vq, VIRTIO_NET_F_MRG_RXBUF);
 
-	while ((sock_len = vhost_net_rx_peek_head_len(net, sock->sk,
-						      &busyloop_intr))) {
+	do {
+		sock_len = vhost_net_rx_peek_head_len(net, sock->sk,
+						      &busyloop_intr);
+		if (!sock_len)
+			break;
 		sock_len += sock_hlen;
 		vhost_len = sock_len + vhost_hlen;
 		headcount = get_rx_bufs(vq, vq->heads + nvq->done_idx,
@@ -1230,12 +1228,11 @@ static void handle_rx(struct vhost_net *net)
 			vhost_log_write(vq, vq_log, log, vhost_len,
 					vq->iov, in);
 		total_len += vhost_len;
-		if (unlikely(vhost_exceeds_weight(vq, ++recv_pkts, total_len)))
-			goto out;
-	}
+	} while (likely(!vhost_exceeds_weight(vq, ++recv_pkts, total_len)));
+
 	if (unlikely(busyloop_intr))
 		vhost_poll_queue(&vq->poll);
-	else
+	else if (!sock_len)
 		vhost_net_enable_vq(net, vq);
 out:
 	vhost_net_signal_used(nvq);
@@ -1328,7 +1325,7 @@ static int vhost_net_open(struct inode *inode, struct file *f)
 	}
 	vhost_dev_init(dev, vqs, VHOST_NET_VQ_MAX,
 		       UIO_MAXIOV + VHOST_NET_BATCH,
-		       VHOST_NET_WEIGHT, VHOST_NET_PKT_WEIGHT);
+		       VHOST_NET_PKT_WEIGHT, VHOST_NET_WEIGHT);
 
 	vhost_poll_init(n->poll + VHOST_NET_VQ_TX, handle_tx_net, EPOLLOUT, dev);
 	vhost_poll_init(n->poll + VHOST_NET_VQ_RX, handle_rx_net, EPOLLIN, dev);
-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
