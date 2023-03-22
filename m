Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4346C40AE
	for <lists.virtualization@lfdr.de>; Wed, 22 Mar 2023 04:03:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF2E740A5F;
	Wed, 22 Mar 2023 03:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF2E740A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GoajTVwsCunX; Wed, 22 Mar 2023 03:03:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6C18740A53;
	Wed, 22 Mar 2023 03:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C18740A53
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40565C0035;
	Wed, 22 Mar 2023 03:03:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 118C6C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Mar 2023 03:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E083660F48
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Mar 2023 03:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E083660F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O58T7YFO0TEN
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Mar 2023 03:03:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90DA560F1B
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90DA560F1B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Mar 2023 03:03:17 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VeP1dVS_1679454192; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VeP1dVS_1679454192) by smtp.aliyun-inc.com;
 Wed, 22 Mar 2023 11:03:13 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 4/8] virtio_net: separate the logic of freeing xdp
 shinfo
Date: Wed, 22 Mar 2023 11:03:04 +0800
Message-Id: <20230322030308.16046-5-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230322030308.16046-1-xuanzhuo@linux.alibaba.com>
References: <20230322030308.16046-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 7e9e1372f356
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
---
 drivers/net/virtio_net.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 72b9d6ee4024..09aed60e2f51 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -798,6 +798,21 @@ static int virtnet_xdp_xmit(struct net_device *dev,
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
@@ -1312,12 +1327,9 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 	xdp_prog = rcu_dereference(rq->xdp_prog);
 	if (xdp_prog) {
 		unsigned int xdp_frags_truesz = 0;
-		struct skb_shared_info *shinfo;
-		struct page *xdp_page;
 		struct xdp_buff xdp;
 		void *data;
 		u32 act;
-		int i;
 
 		data = mergeable_xdp_prepare(vi, rq, xdp_prog, ctx, &frame_sz, &num_buf, &page,
 					     offset, &len, hdr);
@@ -1348,14 +1360,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 			goto err_xdp_frags;
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
