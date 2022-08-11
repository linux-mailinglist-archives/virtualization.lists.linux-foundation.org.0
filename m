Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4E658F8BD
	for <lists.virtualization@lfdr.de>; Thu, 11 Aug 2022 10:03:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1FAD829FE;
	Thu, 11 Aug 2022 08:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1FAD829FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aG296ZoMZVNK; Thu, 11 Aug 2022 08:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 957CB82951;
	Thu, 11 Aug 2022 08:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957CB82951
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08DFDC002D;
	Thu, 11 Aug 2022 08:03:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 951ACC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 08:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62CF860ED1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 08:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62CF860ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M74BZBV_KFJw
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 08:03:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF67260F34
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF67260F34
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 08:03:05 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VLyLAwX_1660204979; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VLyLAwX_1660204979) by smtp.aliyun-inc.com;
 Thu, 11 Aug 2022 16:02:59 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 1/2] virtio_net: fix for stuck when change rx ring size with
 dev down
Date: Thu, 11 Aug 2022 16:02:57 +0800
Message-Id: <20220811080258.79398-2-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220811080258.79398-1-xuanzhuo@linux.alibaba.com>
References: <20220811080258.79398-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 4d0f44f05adf
Cc: "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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

When dev is set to DOWN state, napi has been disabled, if we modify the
ring size at this time, we should not call napi_disable() again, which
will cause stuck.

And all operations are under the protection of rtnl_lock, so there is no
need to consider concurrency issues.

Reported-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio_net.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 816c613c22f7..17687eb3f0bd 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1892,11 +1892,13 @@ static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
 static int virtnet_rx_resize(struct virtnet_info *vi,
 			     struct receive_queue *rq, u32 ring_num)
 {
+	bool running = netif_running(vi->dev);
 	int err, qindex;
 
 	qindex = rq - vi->rq;
 
-	napi_disable(&rq->napi);
+	if (running)
+		napi_disable(&rq->napi);
 
 	err = virtqueue_resize(rq->vq, ring_num, virtnet_rq_free_unused_buf);
 	if (err)
@@ -1905,7 +1907,8 @@ static int virtnet_rx_resize(struct virtnet_info *vi,
 	if (!try_fill_recv(vi, rq, GFP_KERNEL))
 		schedule_delayed_work(&vi->refill, 0);
 
-	virtnet_napi_enable(rq->vq, &rq->napi);
+	if (running)
+		virtnet_napi_enable(rq->vq, &rq->napi);
 	return err;
 }
 
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
