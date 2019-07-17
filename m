Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A36BAAB
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 12:54:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0CB30EBD;
	Wed, 17 Jul 2019 10:53:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BF103EAD
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 10:53:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5CBE425A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 10:53:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0163B60CC;
	Wed, 17 Jul 2019 10:53:27 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
	(hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75CE81001DDE;
	Wed, 17 Jul 2019 10:53:17 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V3 04/15] vhost-net: don't use vhost_add_used_n() for zerocopy
Date: Wed, 17 Jul 2019 06:52:44 -0400
Message-Id: <20190717105255.63488-5-jasowang@redhat.com>
In-Reply-To: <20190717105255.63488-1-jasowang@redhat.com>
References: <20190717105255.63488-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 17 Jul 2019 10:53:27 +0000 (UTC)
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

We tried to use vhost_add_used_n() for the packets that is not
zero-copied. This can help to mitigate HOL issue but not a total
solution. What's more, it may lead out of order completion and cause
extra complexity for packed virtqueue implementation that needs to
maintain wrap counters.

So this patch switch to constantly use vq->heads[] to maintain
heads. This will ease the introduction of zerocopy shadow used ring
API and reduce the complexity for packed virtqueues.

After this, vhost_net became a in order device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/net.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 78d248574f8e..ac31983d2d77 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -894,9 +894,6 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 		if (zcopy_used) {
 			struct ubuf_info *ubuf;
 			ubuf = nvq->ubuf_info + nvq->upend_idx;
-
-			vq->heads[nvq->upend_idx].id = cpu_to_vhost32(vq, head);
-			vq->heads[nvq->upend_idx].len = VHOST_DMA_IN_PROGRESS;
 			ubuf->callback = vhost_zerocopy_callback;
 			ubuf->ctx = nvq->ubufs;
 			ubuf->desc = nvq->upend_idx;
@@ -907,11 +904,14 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 			msg.msg_controllen = sizeof(ctl);
 			ubufs = nvq->ubufs;
 			atomic_inc(&ubufs->refcount);
-			nvq->upend_idx = (nvq->upend_idx + 1) % UIO_MAXIOV;
 		} else {
 			msg.msg_control = NULL;
 			ubufs = NULL;
 		}
+		vq->heads[nvq->upend_idx].id = cpu_to_vhost32(vq, head);
+		vq->heads[nvq->upend_idx].len = zcopy_used ?
+			 VHOST_DMA_IN_PROGRESS : VHOST_DMA_DONE_LEN;
+		nvq->upend_idx = (nvq->upend_idx + 1) % UIO_MAXIOV;
 		total_len += len;
 		if (tx_can_batch(vq, total_len) &&
 		    likely(!vhost_exceeds_maxpend(net))) {
@@ -923,11 +923,10 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 		/* TODO: Check specific error and bomb out unless ENOBUFS? */
 		err = sock->ops->sendmsg(sock, &msg, len);
 		if (unlikely(err < 0)) {
-			if (zcopy_used) {
+			if (zcopy_used)
 				vhost_net_ubuf_put(ubufs);
-				nvq->upend_idx = ((unsigned)nvq->upend_idx - 1)
-					% UIO_MAXIOV;
-			}
+			nvq->upend_idx = ((unsigned int)nvq->upend_idx - 1)
+					 % UIO_MAXIOV;
 			vhost_discard_vq_desc(vq, 1);
 			vhost_net_enable_vq(net, vq);
 			break;
@@ -935,10 +934,8 @@ static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
 		if (err != len)
 			pr_debug("Truncated TX packet: "
 				 " len %d != %zd\n", err, len);
-		if (!zcopy_used)
-			vhost_add_used_and_signal(&net->dev, vq, head, 0);
-		else
-			vhost_zerocopy_signal_used(net, vq);
+
+		vhost_zerocopy_signal_used(net, vq);
 		vhost_net_tx_packet(net);
 	} while (likely(!vhost_exceeds_weight(vq, ++sent_pkts, total_len)));
 }
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
