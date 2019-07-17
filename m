Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 520146BAB7
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 12:54:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E0A6EEC8;
	Wed, 17 Jul 2019 10:53:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 80B58EA3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 10:53:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1175D25A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 10:53:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A28E7307D849;
	Wed, 17 Jul 2019 10:53:47 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
	(hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46BE410246E5;
	Wed, 17 Jul 2019 10:53:37 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V3 08/15] vhost_net: switch to use shadow used ring API for RX
Date: Wed, 17 Jul 2019 06:52:48 -0400
Message-Id: <20190717105255.63488-9-jasowang@redhat.com>
In-Reply-To: <20190717105255.63488-1-jasowang@redhat.com>
References: <20190717105255.63488-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 17 Jul 2019 10:53:47 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, maxime.coquelin@redhat.com
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

This patch switches to use shadow used ring API for RX. This will help
to hid used ring layout from device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/net.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 1a67f889cbc1..9e087d08b199 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -445,18 +445,6 @@ static int vhost_net_enable_vq(struct vhost_net *n,
 	return vhost_poll_start(poll, sock->file);
 }
 
-static void vhost_net_signal_used(struct vhost_net_virtqueue *nvq)
-{
-	struct vhost_virtqueue *vq = &nvq->vq;
-	struct vhost_dev *dev = vq->dev;
-
-	if (!nvq->done_idx)
-		return;
-
-	vhost_add_used_and_signal_n(dev, vq, vq->heads, nvq->done_idx);
-	nvq->done_idx = 0;
-}
-
 static void vhost_tx_batch(struct vhost_net *net,
 			   struct vhost_net_virtqueue *nvq,
 			   struct socket *sock,
@@ -999,7 +987,7 @@ static int vhost_net_rx_peek_head_len(struct vhost_net *net, struct sock *sk,
 
 	if (!len && rvq->busyloop_timeout) {
 		/* Flush batched heads first */
-		vhost_net_signal_used(rnvq);
+		vhost_flush_shadow_used_and_signal(rvq);
 		/* Both tx vq and rx socket were polled here */
 		vhost_net_busy_poll(net, rvq, tvq, busyloop_intr, true);
 
@@ -1020,7 +1008,6 @@ static int vhost_net_rx_peek_head_len(struct vhost_net *net, struct sock *sk,
  *	returns number of buffer heads allocated, negative on error
  */
 static int get_rx_bufs(struct vhost_virtqueue *vq,
-		       struct vring_used_elem *heads,
 		       int datalen,
 		       unsigned *iovcount,
 		       struct vhost_log *log,
@@ -1063,11 +1050,11 @@ static int get_rx_bufs(struct vhost_virtqueue *vq,
 			nlogs += *log_num;
 			log += *log_num;
 		}
-		heads[headcount].id = cpu_to_vhost32(vq, d);
 		len = iov_length(vq->iov + seg, in);
 		datalen -= len;
-		heads[headcount].len = cpu_to_vhost32(vq,
-				       datalen >= 0 ? len : len + datalen);
+		vhost_add_shadow_used(vq, cpu_to_vhost32(vq, d),
+				      cpu_to_vhost32(vq, datalen >= 0 ? len
+						     : len + datalen));
 		++headcount;
 		seg += in;
 	}
@@ -1082,7 +1069,7 @@ static int get_rx_bufs(struct vhost_virtqueue *vq,
 	}
 	return headcount;
 err:
-	vhost_discard_vq_desc(vq, headcount);
+	vhost_discard_shadow_used(vq, headcount);
 	return r;
 }
 
@@ -1141,8 +1128,7 @@ static void handle_rx(struct vhost_net *net)
 			break;
 		sock_len += sock_hlen;
 		vhost_len = sock_len + vhost_hlen;
-		headcount = get_rx_bufs(vq, vq->heads + nvq->done_idx,
-					vhost_len, &in, vq_log, &log,
+		headcount = get_rx_bufs(vq, vhost_len, &in, vq_log, &log,
 					likely(mergeable) ? UIO_MAXIOV : 1);
 		/* On error, stop handling until the next kick. */
 		if (unlikely(headcount < 0))
@@ -1189,7 +1175,7 @@ static void handle_rx(struct vhost_net *net)
 		if (unlikely(err != sock_len)) {
 			pr_debug("Discarded rx packet: "
 				 " len %d, expected %zd\n", err, sock_len);
-			vhost_discard_vq_desc(vq, headcount);
+			vhost_discard_shadow_used(vq, headcount);
 			continue;
 		}
 		/* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
@@ -1213,12 +1199,11 @@ static void handle_rx(struct vhost_net *net)
 		    copy_to_iter(&num_buffers, sizeof num_buffers,
 				 &fixup) != sizeof num_buffers) {
 			vq_err(vq, "Failed num_buffers write");
-			vhost_discard_vq_desc(vq, headcount);
+			vhost_discard_shadow_used(vq, headcount);
 			goto out;
 		}
-		nvq->done_idx += headcount;
-		if (nvq->done_idx > VHOST_NET_BATCH)
-			vhost_net_signal_used(nvq);
+		if (vhost_get_shadow_used_count(vq) > VHOST_NET_BATCH)
+			vhost_flush_shadow_used_and_signal(vq);
 		if (unlikely(vq_log))
 			vhost_log_write(vq, vq_log, log, vhost_len,
 					vq->iov, in);
@@ -1230,7 +1215,7 @@ static void handle_rx(struct vhost_net *net)
 	else if (!sock_len)
 		vhost_net_enable_vq(net, vq);
 out:
-	vhost_net_signal_used(nvq);
+	vhost_flush_shadow_used_and_signal(vq);
 	mutex_unlock(&vq->mutex);
 }
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
