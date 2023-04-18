Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06E6E59C0
	for <lists.virtualization@lfdr.de>; Tue, 18 Apr 2023 08:53:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10F081A47;
	Tue, 18 Apr 2023 06:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D10F081A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pkt-1a_WrP30; Tue, 18 Apr 2023 06:53:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8CF46817F2;
	Tue, 18 Apr 2023 06:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CF46817F2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55E81C0089;
	Tue, 18 Apr 2023 06:53:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA799C0090
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 06:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85187408FA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 06:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85187408FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q0KBvSWBWP9i
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 06:53:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11E29408D2
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11E29408D2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 06:53:35 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VgOKjx6_1681800810; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VgOKjx6_1681800810) by smtp.aliyun-inc.com;
 Tue, 18 Apr 2023 14:53:31 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 03/14] virtio_net: optimize mergeable_xdp_prepare()
Date: Tue, 18 Apr 2023 14:53:16 +0800
Message-Id: <20230418065327.72281-4-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230418065327.72281-1-xuanzhuo@linux.alibaba.com>
References: <20230418065327.72281-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: d931ac25730a
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

The previous patch, in order to facilitate review, I do not do any
modification. This patch has made some optimization on the top.

* remove some repeated logics in this function.
* add fast check for passing without any alloc.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio_net.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 12559062ffb6..50dc64d80d3b 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1192,6 +1192,11 @@ static void *mergeable_xdp_prepare(struct virtnet_info *vi,
 	 */
 	*frame_sz = truesize;
 
+	if (likely(headroom >= virtnet_get_headroom(vi) &&
+		   (*num_buf == 1 || xdp_prog->aux->xdp_has_frags))) {
+		return page_address(*page) + offset;
+	}
+
 	/* This happens when headroom is not enough because
 	 * of the buffer was prefilled before XDP is set.
 	 * This should only happen for the first several packets.
@@ -1200,22 +1205,15 @@ static void *mergeable_xdp_prepare(struct virtnet_info *vi,
 	 * support it, and we don't want to bother users who are
 	 * using xdp normally.
 	 */
-	if (!xdp_prog->aux->xdp_has_frags &&
-	    (*num_buf > 1 || headroom < virtnet_get_headroom(vi))) {
+	if (!xdp_prog->aux->xdp_has_frags) {
 		/* linearize data for XDP */
 		xdp_page = xdp_linearize_page(rq, num_buf,
 					      *page, offset,
 					      VIRTIO_XDP_HEADROOM,
 					      len);
-		*frame_sz = PAGE_SIZE;
-
 		if (!xdp_page)
 			return NULL;
-		offset = VIRTIO_XDP_HEADROOM;
-
-		put_page(*page);
-		*page = xdp_page;
-	} else if (unlikely(headroom < virtnet_get_headroom(vi))) {
+	} else {
 		xdp_room = SKB_DATA_ALIGN(VIRTIO_XDP_HEADROOM +
 					  sizeof(struct skb_shared_info));
 		if (*len + xdp_room > PAGE_SIZE)
@@ -1227,14 +1225,15 @@ static void *mergeable_xdp_prepare(struct virtnet_info *vi,
 
 		memcpy(page_address(xdp_page) + VIRTIO_XDP_HEADROOM,
 		       page_address(*page) + offset, *len);
-		*frame_sz = PAGE_SIZE;
-		offset = VIRTIO_XDP_HEADROOM;
-
-		put_page(*page);
-		*page = xdp_page;
 	}
 
-	return page_address(*page) + offset;
+	*frame_sz = PAGE_SIZE;
+
+	put_page(*page);
+
+	*page = xdp_page;
+
+	return page_address(*page) + VIRTIO_XDP_HEADROOM;
 }
 
 static struct sk_buff *receive_mergeable(struct net_device *dev,
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
