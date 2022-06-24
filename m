Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 49063558E10
	for <lists.virtualization@lfdr.de>; Fri, 24 Jun 2022 04:58:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C38F84253F;
	Fri, 24 Jun 2022 02:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C38F84253F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLcUiZIQ32sa; Fri, 24 Jun 2022 02:58:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1E99042592;
	Fri, 24 Jun 2022 02:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E99042592
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CE0FC002D;
	Fri, 24 Jun 2022 02:58:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B03CFC0086
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 02:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88E2D4253F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 02:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88E2D4253F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbB6zL1AlE24
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 02:57:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 248E442582
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 248E442582
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 02:57:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0VHF16hP_1656039472; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VHF16hP_1656039472) by smtp.aliyun-inc.com;
 Fri, 24 Jun 2022 10:57:53 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v10 40/41] virtio_net: support tx queue resize
Date: Fri, 24 Jun 2022 10:56:20 +0800
Message-Id: <20220624025621.128843-41-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220624025621.128843-1-xuanzhuo@linux.alibaba.com>
References: <20220624025621.128843-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: fef800c86cd2
Cc: Vadim Pasternak <vadimp@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 kangjie.xu@linux.alibaba.com, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 kvm@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Richard Weinberger <richard@nod.at>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 John Fastabend <john.fastabend@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>
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

This patch implements the resize function of the tx queues.
Based on this function, it is possible to modify the ring num of the
queue.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio_net.c | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 21b5c5fa9423..2aedfd056fa7 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -135,6 +135,9 @@ struct send_queue {
 	struct virtnet_sq_stats stats;
 
 	struct napi_struct napi;
+
+	/* Record whether sq is in reset state. */
+	bool reset;
 };
 
 /* Internal representation of a receive virtqueue */
@@ -279,6 +282,7 @@ struct padded_vnet_hdr {
 };
 
 static void virtnet_rq_free_unused_buf(struct virtqueue *vq, void *buf);
+static void virtnet_sq_free_unused_buf(struct virtqueue *vq, void *buf);
 
 static bool is_xdp_frame(void *ptr)
 {
@@ -1603,6 +1607,11 @@ static void virtnet_poll_cleantx(struct receive_queue *rq)
 		return;
 
 	if (__netif_tx_trylock(txq)) {
+		if (READ_ONCE(sq->reset)) {
+			__netif_tx_unlock(txq);
+			return;
+		}
+
 		do {
 			virtqueue_disable_cb(sq->vq);
 			free_old_xmit_skbs(sq, true);
@@ -1868,6 +1877,45 @@ static int virtnet_rx_resize(struct virtnet_info *vi,
 	return err;
 }
 
+static int virtnet_tx_resize(struct virtnet_info *vi,
+			     struct send_queue *sq, u32 ring_num)
+{
+	struct netdev_queue *txq;
+	int err, qindex;
+
+	qindex = sq - vi->sq;
+
+	virtnet_napi_tx_disable(&sq->napi);
+
+	txq = netdev_get_tx_queue(vi->dev, qindex);
+
+	/* 1. wait all ximt complete
+	 * 2. fix the race of netif_stop_subqueue() vs netif_start_subqueue()
+	 */
+	__netif_tx_lock_bh(txq);
+
+	/* Prevent rx poll from accessing sq. */
+	WRITE_ONCE(sq->reset, true);
+
+	/* Prevent the upper layer from trying to send packets. */
+	netif_stop_subqueue(vi->dev, qindex);
+
+	__netif_tx_unlock_bh(txq);
+
+	err = virtqueue_resize(sq->vq, ring_num, virtnet_sq_free_unused_buf);
+	if (err)
+		netdev_err(vi->dev, "resize tx fail: tx queue index: %d err: %d\n", qindex, err);
+
+	/* Memory barrier before set reset and start subqueue. */
+	smp_mb();
+
+	WRITE_ONCE(sq->reset, false);
+	netif_tx_wake_queue(txq);
+
+	virtnet_napi_tx_enable(vi, sq->vq, &sq->napi);
+	return err;
+}
+
 /*
  * Send command via the control virtqueue and check status.  Commands
  * supported by the hypervisor, as indicated by feature bits, should
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
