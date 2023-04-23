Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2106EBED8
	for <lists.virtualization@lfdr.de>; Sun, 23 Apr 2023 12:58:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A86C60BE4;
	Sun, 23 Apr 2023 10:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A86C60BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STZjf_vvAuhM; Sun, 23 Apr 2023 10:57:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 485C260D88;
	Sun, 23 Apr 2023 10:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485C260D88
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B241C0089;
	Sun, 23 Apr 2023 10:57:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A694CC007E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 10:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7508082062
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 10:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7508082062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKENL83BTVfK
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 10:57:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C0781424
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20C0781424
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 10:57:48 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R911e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VgjkXpD_1682247462; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VgjkXpD_1682247462) by smtp.aliyun-inc.com;
 Sun, 23 Apr 2023 18:57:43 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v3 05/15] virtio_net: separate the logic of freeing
 xdp shinfo
Date: Sun, 23 Apr 2023 18:57:26 +0800
Message-Id: <20230423105736.56918-6-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230423105736.56918-1-xuanzhuo@linux.alibaba.com>
References: <20230423105736.56918-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 3bb17d92efad
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

This patch introduce a new function that releases the
xdp shinfo. The subsequent patch will reuse this function.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/net/virtio_net.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 264945dd7a35..b4eb083ebf55 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -789,6 +789,21 @@ static int virtnet_xdp_xmit(struct net_device *dev,
 	return ret;
 }
 
+static void put_xdp_frags(struct xdp_buff *xdp)
+{
+	struct skb_shared_info *shinfo;
+	struct page *xdp_page;
+	int i;
+
+	if (xdp_buff_has_frags(xdp)) {
+		shinfo = xdp_get_shared_info_from_buff(xdp);
+		for (i = 0; i < shinfo->nr_frags; i++) {
+			xdp_page = skb_frag_page(&shinfo->frags[i]);
+			put_page(xdp_page);
+		}
+	}
+}
+
 static int virtnet_xdp_handler(struct bpf_prog *xdp_prog, struct xdp_buff *xdp,
 			       struct net_device *dev,
 			       unsigned int *xdp_xmit,
@@ -1304,12 +1319,9 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 	xdp_prog = rcu_dereference(rq->xdp_prog);
 	if (xdp_prog) {
 		unsigned int xdp_frags_truesz = 0;
-		struct skb_shared_info *shinfo;
-		struct page *xdp_page;
 		struct xdp_buff xdp;
 		void *data;
 		u32 act;
-		int i;
 
 		data = mergeable_xdp_get_buf(vi, rq, xdp_prog, ctx, &frame_sz,
 					     &num_buf, &page, offset, &len, hdr);
@@ -1339,14 +1351,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 			break;
 		}
 err_xdp_frags:
-		if (xdp_buff_has_frags(&xdp)) {
-			shinfo = xdp_get_shared_info_from_buff(&xdp);
-			for (i = 0; i < shinfo->nr_frags; i++) {
-				xdp_page = skb_frag_page(&shinfo->frags[i]);
-				put_page(xdp_page);
-			}
-		}
-
+		put_xdp_frags(&xdp);
 		goto err_xdp;
 	}
 	rcu_read_unlock();
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
