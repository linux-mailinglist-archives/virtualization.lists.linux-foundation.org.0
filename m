Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF76BAB4
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 12:54:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7FA8EEC2;
	Wed, 17 Jul 2019 10:53:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F2F5CEB9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 10:53:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8DCFA63D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 10:53:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 303A24E93D;
	Wed, 17 Jul 2019 10:53:34 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
	(hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4371110018FF;
	Wed, 17 Jul 2019 10:53:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V3 06/15] vhost_net: switch TX to use shadow used ring API
Date: Wed, 17 Jul 2019 06:52:46 -0400
Message-Id: <20190717105255.63488-7-jasowang@redhat.com>
In-Reply-To: <20190717105255.63488-1-jasowang@redhat.com>
References: <20190717105255.63488-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 17 Jul 2019 10:53:34 +0000 (UTC)
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

This patch switch to use shadow used ring API for transmission. This
will help to hide used ring layout from device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/net.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index ac31983d2d77..cf47e6e348f4 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -361,22 +361,22 @@ static void vhost_zerocopy_signal_used(struct vhost_net *net,
 {
 	struct vhost_net_virtqueue *nvq =
 		container_of(vq, struct vhost_net_virtqueue, vq);
-	int i, add;
+	int i, add, len;
 	int j = 0;
 
 	for (i = nvq->done_idx; i != nvq->upend_idx; i = (i + 1) % UIO_MAXIOV) {
-		if (vq->heads[i].len == VHOST_DMA_FAILED_LEN)
+		len = vhost_get_zc_used_len(vq, i);
+		if (len == VHOST_DMA_FAILED_LEN)
 			vhost_net_tx_err(net);
-		if (VHOST_DMA_IS_DONE(vq->heads[i].len)) {
-			vq->heads[i].len = VHOST_DMA_CLEAR_LEN;
+		if (VHOST_DMA_IS_DONE(len)) {
+			vhost_set_zc_used_len(vq, i, VHOST_DMA_CLEAR_LEN);
 			++j;
 		} else
 			break;
 	}
 	while (j) {
 		add = min(UIO_MAXIOV - nvq->done_idx, j);
-		vhost_add_used_and_signal_n(vq->dev, vq,
-					    &vq->heads[nvq->done_idx], add);
+		vhost_flush_zc_used_and_signal(vq, nvq->done_idx, add);
 		nvq->done_idx = (nvq->done_idx + add) % UIO_MAXIOV;
 		j -= add;
 	}
@@ -391,8 +391,8 @@ static void vhost_zerocopy_callback(struct ubuf_info *ubuf, bool success)
 	rcu_read_lock_bh();
 
 	/* set len to mark this desc buffers done DMA */
-	vq->heads[ubuf->desc].len = success ?
-		VHOST_DMA_DONE_LEN : VHOST_DMA_FAILED_LEN;
+	vhost_set_zc_used_len(vq, ubuf->desc, success ?
+			      VHOST_DMA_DONE_LEN : VHOST_DMA_FAILED_LEN);
 	cnt = vhost_net_ubuf_put(ubufs);
 
 	/*
@@ -480,7 +480,7 @@ static void vhost_tx_batch(struct vhost_net *net,
 	}
 
 signal_used:
-	vhost_net_signal_used(nvq);
+	vhost_flush_shadow_used_and_signal(&nvq->vq);
 	nvq->batched_xdp = 0;
 }
 
@@ -776,7 +776,7 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 	do {
 		bool busyloop_intr = false;
 
-		if (nvq->done_idx == VHOST_NET_BATCH)
+		if (vhost_get_shadow_used_count(vq) == VHOST_NET_BATCH)
 			vhost_tx_batch(net, nvq, sock, &msg);
 
 		head = get_tx_bufs(net, nvq, &msg, &out, &in, &len,
@@ -835,9 +835,7 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
 			pr_debug("Truncated TX packet: len %d != %zd\n",
 				 err, len);
 done:
-		vq->heads[nvq->done_idx].id = cpu_to_vhost32(vq, head);
-		vq->heads[nvq->done_idx].len = 0;
-		++nvq->done_idx;
+		vhost_add_shadow_used(vq, cpu_to_vhost32(vq, head), 0);
 	} while (likely(!vhost_exceeds_weight(vq, ++sent_pkts, total_len)));
 
 	vhost_tx_batch(net, nvq, sock, &msg);
@@ -908,9 +906,10 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 			msg.msg_control = NULL;
 			ubufs = NULL;
 		}
-		vq->heads[nvq->upend_idx].id = cpu_to_vhost32(vq, head);
-		vq->heads[nvq->upend_idx].len = zcopy_used ?
-			 VHOST_DMA_IN_PROGRESS : VHOST_DMA_DONE_LEN;
+		vhost_set_zc_used(vq, nvq->upend_idx,
+				  cpu_to_vhost32(vq, head),
+				  zcopy_used ? VHOST_DMA_IN_PROGRESS :
+				  VHOST_DMA_DONE_LEN);
 		nvq->upend_idx = (nvq->upend_idx + 1) % UIO_MAXIOV;
 		total_len += len;
 		if (tx_can_batch(vq, total_len) &&
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
