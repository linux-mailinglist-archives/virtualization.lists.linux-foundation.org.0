Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C693A26B6
	for <lists.virtualization@lfdr.de>; Thu, 10 Jun 2021 10:22:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D068060A3C;
	Thu, 10 Jun 2021 08:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqkojUSDJIV2; Thu, 10 Jun 2021 08:22:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 112266084B;
	Thu, 10 Jun 2021 08:22:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E549FC000B;
	Thu, 10 Jun 2021 08:22:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AF61C000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85385405C2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5Gsrzn9_EaV
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:22:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A544405BB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 08:22:17 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=21; SR=0;
 TI=SMTPD_---0Ubx5.ID_1623313333; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Ubx5.ID_1623313333) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 10 Jun 2021 16:22:13 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v5 09/15] virtio-net: virtnet_poll_tx support budget
 check
Date: Thu, 10 Jun 2021 16:22:03 +0800
Message-Id: <20210610082209.91487-10-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210610082209.91487-1-xuanzhuo@linux.alibaba.com>
References: <20210610082209.91487-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 "dust . li" <dust.li@linux.alibaba.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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

virtnet_poll_tx() check the work done like other network card drivers.

When work < budget, napi_poll() in dev.c will exit directly. And
virtqueue_napi_complete() will be called to close napi. If closing napi
fails or there is still data to be processed, virtqueue_napi_complete()
will make napi schedule again, and no conflicts with the logic of
napi_poll().

When work == budget, virtnet_poll_tx() will return the var 'work', and
the napi_poll() in dev.c will re-add napi to the queue.

The purpose of this patch is to support xsk xmit in virtio_poll_tx for
subsequent patch.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/net/virtio_net.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 989aba600e63..953739860563 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1634,6 +1634,7 @@ static int virtnet_poll_tx(struct napi_struct *napi, int budget)
 	struct virtnet_info *vi = sq->vq->vdev->priv;
 	unsigned int index = vq2txq(sq->vq);
 	struct netdev_queue *txq;
+	int work_done = 0;
 
 	if (unlikely(is_xdp_raw_buffer_queue(vi, index))) {
 		/* We don't need to enable cb for XDP */
@@ -1646,12 +1647,13 @@ static int virtnet_poll_tx(struct napi_struct *napi, int budget)
 	free_old_xmit(sq, true);
 	__netif_tx_unlock(txq);
 
-	virtqueue_napi_complete(napi, sq->vq, 0);
+	if (work_done < budget)
+		virtqueue_napi_complete(napi, sq->vq, 0);
 
 	if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS)
 		netif_tx_wake_queue(txq);
 
-	return 0;
+	return work_done;
 }
 
 static int xmit_skb(struct send_queue *sq, struct sk_buff *skb)
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
