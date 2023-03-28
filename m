Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B89AF6CBAAD
	for <lists.virtualization@lfdr.de>; Tue, 28 Mar 2023 11:29:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B58F1418F8;
	Tue, 28 Mar 2023 09:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B58F1418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CaQzBp_XJKEa; Tue, 28 Mar 2023 09:29:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4A57E418F7;
	Tue, 28 Mar 2023 09:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A57E418F7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D384C007E;
	Tue, 28 Mar 2023 09:29:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C7D2C0089
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 09:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C626B8225D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 09:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C626B8225D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8gRu6tGFV2T
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 09:29:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C118B81FEB
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C118B81FEB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 09:29:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VeseIC9_1679995737; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VeseIC9_1679995737) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 17:28:58 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH 09/16] virtio_net: introduce virtnet_rq_update_stats()
Date: Tue, 28 Mar 2023 17:28:40 +0800
Message-Id: <20230328092847.91643-10-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230328092847.91643-1-xuanzhuo@linux.alibaba.com>
References: <20230328092847.91643-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: e880b402863c
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

Separating the code of updating rq stats.

This is prepare for separating the code of ethtool.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio/virtnet.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/net/virtio/virtnet.c b/drivers/net/virtio/virtnet.c
index 84b90333dc77..36c747e43b3f 100644
--- a/drivers/net/virtio/virtnet.c
+++ b/drivers/net/virtio/virtnet.c
@@ -1550,6 +1550,21 @@ static void refill_work(struct work_struct *work)
 	}
 }
 
+static void virtnet_rq_update_stats(struct virtnet_rq *rq, struct virtnet_rq_stats *stats)
+{
+	int i;
+
+	u64_stats_update_begin(&rq->stats.syncp);
+	for (i = 0; i < VIRTNET_RQ_STATS_LEN; i++) {
+		size_t offset = virtnet_rq_stats_desc[i].offset;
+		u64 *item;
+
+		item = (u64 *)((u8 *)&rq->stats + offset);
+		*item += *(u64 *)((u8 *)stats + offset);
+	}
+	u64_stats_update_end(&rq->stats.syncp);
+}
+
 static int virtnet_receive(struct virtnet_rq *rq, int budget,
 			   unsigned int *xdp_xmit)
 {
@@ -1557,7 +1572,6 @@ static int virtnet_receive(struct virtnet_rq *rq, int budget,
 	struct virtnet_rq_stats stats = {};
 	unsigned int len;
 	void *buf;
-	int i;
 
 	if (!vi->big_packets || vi->mergeable_rx_bufs) {
 		void *ctx;
@@ -1584,15 +1598,7 @@ static int virtnet_receive(struct virtnet_rq *rq, int budget,
 		}
 	}
 
-	u64_stats_update_begin(&rq->stats.syncp);
-	for (i = 0; i < VIRTNET_RQ_STATS_LEN; i++) {
-		size_t offset = virtnet_rq_stats_desc[i].offset;
-		u64 *item;
-
-		item = (u64 *)((u8 *)&rq->stats + offset);
-		*item += *(u64 *)((u8 *)&stats + offset);
-	}
-	u64_stats_update_end(&rq->stats.syncp);
+	virtnet_rq_update_stats(rq, &stats);
 
 	return stats.packets;
 }
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
