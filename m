Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F0F4D17C9
	for <lists.virtualization@lfdr.de>; Tue,  8 Mar 2022 13:36:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 031BE8421C;
	Tue,  8 Mar 2022 12:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yESTCDRw067P; Tue,  8 Mar 2022 12:36:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A606B8421D;
	Tue,  8 Mar 2022 12:36:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45EAFC0082;
	Tue,  8 Mar 2022 12:36:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23D46C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 12:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B03417A5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 12:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EtKOdlNdKWEa
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 12:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0686D417BE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 12:36:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=34; SR=0; TI=SMTPD_---0V6eSqDv_1646742973; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V6eSqDv_1646742973) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 08 Mar 2022 20:36:14 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: [PATCH v7 25/26] virtio_net: set the default max ring size by
 find_vqs()
Date: Tue,  8 Mar 2022 20:35:17 +0800
Message-Id: <20220308123518.33800-26-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220308123518.33800-1-xuanzhuo@linux.alibaba.com>
References: <20220308123518.33800-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: f06b131dbfed
Cc: Vadim Pasternak <vadimp@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Richard Weinberger <richard@nod.at>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 John Fastabend <john.fastabend@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, kvm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

Use virtio_find_vqs_ctx_size() to specify the maximum ring size of tx,
rx at the same time.

                         | rx/tx ring size
-------------------------------------------
speed == UNKNOWN or < 10G| 1024
speed < 40G              | 4096
speed >= 40G             | 8192

Call virtnet_update_settings() once before calling init_vqs() to update
speed.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio_net.c | 42 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index ffff323dcef0..f1bdc6ce21c3 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2977,6 +2977,29 @@ static unsigned int mergeable_min_buf_len(struct virtnet_info *vi, struct virtqu
 		   (unsigned int)GOOD_PACKET_LEN);
 }
 
+static void virtnet_config_sizes(struct virtnet_info *vi, u32 *sizes)
+{
+	u32 i, rx_size, tx_size;
+
+	if (vi->speed == SPEED_UNKNOWN || vi->speed < SPEED_10000) {
+		rx_size = 1024;
+		tx_size = 1024;
+
+	} else if (vi->speed < SPEED_40000) {
+		rx_size = 1024 * 4;
+		tx_size = 1024 * 4;
+
+	} else {
+		rx_size = 1024 * 8;
+		tx_size = 1024 * 8;
+	}
+
+	for (i = 0; i < vi->max_queue_pairs; i++) {
+		sizes[rxq2vq(i)] = rx_size;
+		sizes[txq2vq(i)] = tx_size;
+	}
+}
+
 static int virtnet_find_vqs(struct virtnet_info *vi)
 {
 	vq_callback_t **callbacks;
@@ -2984,6 +3007,7 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
 	int ret = -ENOMEM;
 	int i, total_vqs;
 	const char **names;
+	u32 *sizes;
 	bool *ctx;
 
 	/* We expect 1 RX virtqueue followed by 1 TX virtqueue, followed by
@@ -3011,10 +3035,15 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
 		ctx = NULL;
 	}
 
+	sizes = kmalloc_array(total_vqs, sizeof(*sizes), GFP_KERNEL);
+	if (!sizes)
+		goto err_sizes;
+
 	/* Parameters for control virtqueue, if any */
 	if (vi->has_cvq) {
 		callbacks[total_vqs - 1] = NULL;
 		names[total_vqs - 1] = "control";
+		sizes[total_vqs - 1] = 0;
 	}
 
 	/* Allocate/initialize parameters for send/receive virtqueues */
@@ -3029,8 +3058,10 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
 			ctx[rxq2vq(i)] = true;
 	}
 
-	ret = virtio_find_vqs_ctx(vi->vdev, total_vqs, vqs, callbacks,
-				  names, ctx, NULL);
+	virtnet_config_sizes(vi, sizes);
+
+	ret = virtio_find_vqs_ctx_size(vi->vdev, total_vqs, vqs, callbacks,
+				       names, ctx, NULL, sizes);
 	if (ret)
 		goto err_find;
 
@@ -3050,6 +3081,8 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
 
 
 err_find:
+	kfree(sizes);
+err_sizes:
 	kfree(ctx);
 err_ctx:
 	kfree(names);
@@ -3368,6 +3401,9 @@ static int virtnet_probe(struct virtio_device *vdev)
 		vi->curr_queue_pairs = num_online_cpus();
 	vi->max_queue_pairs = max_queue_pairs;
 
+	virtnet_init_settings(dev);
+	virtnet_update_settings(vi);
+
 	/* Allocate/initialize the rx/tx queues, and invoke find_vqs */
 	err = init_vqs(vi);
 	if (err)
@@ -3380,8 +3416,6 @@ static int virtnet_probe(struct virtio_device *vdev)
 	netif_set_real_num_tx_queues(dev, vi->curr_queue_pairs);
 	netif_set_real_num_rx_queues(dev, vi->curr_queue_pairs);
 
-	virtnet_init_settings(dev);
-
 	if (virtio_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
 		vi->failover = net_failover_create(vi->dev);
 		if (IS_ERR(vi->failover)) {
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
