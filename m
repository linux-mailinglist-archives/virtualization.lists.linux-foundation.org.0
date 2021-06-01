Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6143D396D7C
	for <lists.virtualization@lfdr.de>; Tue,  1 Jun 2021 08:40:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E20CB40464;
	Tue,  1 Jun 2021 06:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nnm9l6llyV6x; Tue,  1 Jun 2021 06:40:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CCDC4046B;
	Tue,  1 Jun 2021 06:40:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 070CBC0001;
	Tue,  1 Jun 2021 06:40:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F00EC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 06:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B706832EB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 06:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wundkHLq1yA4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 06:40:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C439C83280
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 06:40:04 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R581e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=12; SR=0; TI=SMTPD_---0Uaqwlqf_1622529601; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Uaqwlqf_1622529601) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 01 Jun 2021 14:40:01 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH net v2 2/2] virtio_net: get build_skb() buf by data ptr
Date: Tue,  1 Jun 2021 14:40:00 +0800
Message-Id: <20210601064000.66909-3-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210601064000.66909-1-xuanzhuo@linux.alibaba.com>
References: <20210601064000.66909-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Jakub Kicinski <kuba@kernel.org>,
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

In the case of merge, the page passed into page_to_skb() may be a head
page, not the page where the current data is located. So when trying to
get the buf where the data is located, we should get buf based on
headroom instead of offset.

This patch solves this problem. But if you don't use this patch, the
original code can also run, because if the page is not the page of the
current data, the calculated tailroom will be less than 0, and will not
enter the logic of build_skb() . The significance of this patch is to
modify this logical problem, allowing more situations to use
build_skb().

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio_net.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 6b929aca155a..fa407eb8b457 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -401,18 +401,13 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
 	/* If headroom is not 0, there is an offset between the beginning of the
 	 * data and the allocated space, otherwise the data and the allocated
 	 * space are aligned.
+	 *
+	 * Buffers with headroom use PAGE_SIZE as alloc size, see
+	 * add_recvbuf_mergeable() + get_mergeable_buf_len()
 	 */
-	if (headroom) {
-		/* Buffers with headroom use PAGE_SIZE as alloc size,
-		 * see add_recvbuf_mergeable() + get_mergeable_buf_len()
-		 */
-		truesize = PAGE_SIZE;
-		tailroom = truesize - len - offset;
-		buf = page_address(page);
-	} else {
-		tailroom = truesize - len;
-		buf = p;
-	}
+	truesize = headroom ? PAGE_SIZE : truesize;
+	tailroom = truesize - len - headroom;
+	buf = p - headroom;
 
 	len -= hdr_len;
 	offset += hdr_padded_len;
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
