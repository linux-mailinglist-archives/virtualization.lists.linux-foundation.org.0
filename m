Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB906F9F8C
	for <lists.virtualization@lfdr.de>; Mon,  8 May 2023 08:14:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7103E40396;
	Mon,  8 May 2023 06:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7103E40396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvxt_Qsrctqv; Mon,  8 May 2023 06:14:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 24444417BE;
	Mon,  8 May 2023 06:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24444417BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E2CDC008D;
	Mon,  8 May 2023 06:14:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10A5FC002A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 May 2023 06:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8A9160F41
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 May 2023 06:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A9160F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ls_KRTHSKjse
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 May 2023 06:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998DC61080
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 998DC61080
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 May 2023 06:14:39 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0Vi..0DX_1683526473; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vi..0DX_1683526473) by smtp.aliyun-inc.com;
 Mon, 08 May 2023 14:14:34 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v5 14/15] virtio_net: introduce
 receive_small_build_xdp
Date: Mon,  8 May 2023 14:14:16 +0800
Message-Id: <20230508061417.65297-15-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230508061417.65297-1-xuanzhuo@linux.alibaba.com>
References: <20230508061417.65297-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 847ebbc5df1e
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
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
index a0a4f35b965b..37287ede1959 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -931,6 +931,34 @@ static struct page *xdp_linearize_page(struct receive_queue *rq,
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
@@ -1030,9 +1058,6 @@ static struct sk_buff *receive_small(struct net_device *dev,
 {
 	unsigned int xdp_headroom = (unsigned long)ctx;
 	struct page *page = virt_to_head_page(buf);
-	unsigned int header_offset;
-	unsigned int headroom;
-	unsigned int buflen;
 	struct sk_buff *skb;
 
 	len -= vi->hdr_len;
@@ -1060,20 +1085,9 @@ static struct sk_buff *receive_small(struct net_device *dev,
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
