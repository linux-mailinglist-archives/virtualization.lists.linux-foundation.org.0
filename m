Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C3B7C4EA9
	for <lists.virtualization@lfdr.de>; Wed, 11 Oct 2023 11:27:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135BD611C9;
	Wed, 11 Oct 2023 09:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 135BD611C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKJLHmRcYWdL; Wed, 11 Oct 2023 09:27:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CAF2F61072;
	Wed, 11 Oct 2023 09:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAF2F61072
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C6E6C0DD3;
	Wed, 11 Oct 2023 09:27:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3433FC0DD5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Oct 2023 09:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ED67416A2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Oct 2023 09:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED67416A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lc6euwKhiMX6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Oct 2023 09:27:43 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE88A41799
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Oct 2023 09:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE88A41799
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VtwGXc5_1697016457; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VtwGXc5_1697016457) by smtp.aliyun-inc.com;
 Wed, 11 Oct 2023 17:27:38 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost 08/22] virtio_net: virtnet_poll_tx support rescheduled
Date: Wed, 11 Oct 2023 17:27:14 +0800
Message-Id: <20231011092728.105904-9-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20231011092728.105904-1-xuanzhuo@linux.alibaba.com>
References: <20231011092728.105904-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 7e791d85ef9e
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
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

virtnet_poll_tx() support to return budget when busy to be rescheduled.

When retval < budget, napi_poll() in dev.c will exit directly. And
virtqueue_napi_complete() will be called to close napi.

When retval == budget, the napi_poll() in dev.c will re-add napi to the
queue.

The purpose of this patch is to support xsk xmit in virtio_poll_tx() for
subsequent patch.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/virtio/main.c b/drivers/net/virtio/main.c
index bcfd31a55076..f32cfa189972 100644
--- a/drivers/net/virtio/main.c
+++ b/drivers/net/virtio/main.c
@@ -1976,6 +1976,7 @@ static int virtnet_poll_tx(struct napi_struct *napi, int budget)
 	struct virtnet_info *vi = sq->vq->vdev->priv;
 	unsigned int index = vq2txq(sq->vq);
 	struct netdev_queue *txq;
+	int busy = 0;
 	int opaque;
 	bool done;
 
@@ -1993,6 +1994,11 @@ static int virtnet_poll_tx(struct napi_struct *napi, int budget)
 	if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS)
 		netif_tx_wake_queue(txq);
 
+	if (busy) {
+		__netif_tx_unlock(txq);
+		return budget;
+	}
+
 	opaque = virtqueue_enable_cb_prepare(sq->vq);
 
 	done = napi_complete_done(napi, 0);
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
