Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE0C6EFF95
	for <lists.virtualization@lfdr.de>; Thu, 27 Apr 2023 05:06:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68C5883CBB;
	Thu, 27 Apr 2023 03:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C5883CBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWQpKWubTARx; Thu, 27 Apr 2023 03:06:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0821B83CB5;
	Thu, 27 Apr 2023 03:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0821B83CB5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAD58C0093;
	Thu, 27 Apr 2023 03:05:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3210BC0037
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Apr 2023 03:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95CD841EE7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Apr 2023 03:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CD841EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvNLXVXvmPAZ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Apr 2023 03:05:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863A641ED2
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 863A641ED2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Apr 2023 03:05:55 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R451e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0Vh5fo0-_1682564750; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vh5fo0-_1682564750) by smtp.aliyun-inc.com;
 Thu, 27 Apr 2023 11:05:51 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v4 14/15] virtio_net: introduce
 receive_small_build_xdp
Date: Thu, 27 Apr 2023 11:05:33 +0800
Message-Id: <20230427030534.115066-15-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230427030534.115066-1-xuanzhuo@linux.alibaba.com>
References: <20230427030534.115066-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 69b1082fef22
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

Simplifying receive_small() function. Bringing the logic relating to
build_skb together.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/net/virtio_net.c | 48 ++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index a76db3d19eb7..c526852a8547 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -927,6 +927,34 @@ static struct page *xdp_linearize_page(struct receive_queue *rq,
 	return NULL;
 }
 
+static struct sk_buff *receive_small_build_skb(struct virtnet_info *vi,
+					       unsigned int xdp_headroom,
+					       void *buf,
+					       unsigned int len)
+{
+	unsigned int header_offset;
+	unsigned int headroom;
+	unsigned int buflen;
+	struct sk_buff *skb;
+
+	header_offset = VIRTNET_RX_PAD + xdp_headroom;
+	headroom = vi->hdr_len + header_offset;
+	buflen = SKB_DATA_ALIGN(GOOD_PACKET_LEN + headroom) +
+		SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
+
+	skb = build_skb(buf, buflen);
+	if (!skb)
+		return NULL;
+
+	skb_reserve(skb, headroom);
+	skb_put(skb, len);
+
+	buf += header_offset;
+	memcpy(skb_vnet_hdr(skb), buf, vi->hdr_len);
+
+	return skb;
+}
+
 static struct sk_buff *receive_small_xdp(struct net_device *dev,
 					 struct virtnet_info *vi,
 					 struct receive_queue *rq,
@@ -1026,9 +1054,6 @@ static struct sk_buff *receive_small(struct net_device *dev,
 {
 	unsigned int xdp_headroom = (unsigned long)ctx;
 	struct page *page = virt_to_head_page(buf);
-	unsigned int header_offset;
-	unsigned int headroom;
-	unsigned int buflen;
 	struct sk_buff *skb;
 
 	len -= vi->hdr_len;
@@ -1056,20 +1081,9 @@ static struct sk_buff *receive_small(struct net_device *dev,
 		rcu_read_unlock();
 	}
 
-	header_offset = VIRTNET_RX_PAD + xdp_headroom;
-	headroom = vi->hdr_len + header_offset;
-	buflen = SKB_DATA_ALIGN(GOOD_PACKET_LEN + headroom) +
-		SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
-
-	skb = build_skb(buf, buflen);
-	if (!skb)
-		goto err;
-	skb_reserve(skb, headroom);
-	skb_put(skb, len);
-
-	buf += header_offset;
-	memcpy(skb_vnet_hdr(skb), buf, vi->hdr_len);
-	return skb;
+	skb = receive_small_build_skb(vi, xdp_headroom, buf, len);
+	if (likely(skb))
+		return skb;
 
 err:
 	stats->drops++;
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
