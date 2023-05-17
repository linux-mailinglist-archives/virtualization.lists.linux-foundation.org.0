Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 745D9705D20
	for <lists.virtualization@lfdr.de>; Wed, 17 May 2023 04:23:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FDF084134;
	Wed, 17 May 2023 02:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FDF084134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id er9q1_tCpM8o; Wed, 17 May 2023 02:23:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3418884237;
	Wed, 17 May 2023 02:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3418884237
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90F62C0091;
	Wed, 17 May 2023 02:23:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E619C0036
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 May 2023 02:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A04D8412D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 May 2023 02:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A04D8412D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bzIbZUPMtO7W
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 May 2023 02:23:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FE46841EC
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FE46841EC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 May 2023 02:23:04 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R921e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0ViqlmYE_1684290179; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0ViqlmYE_1684290179) by smtp.aliyun-inc.com;
 Wed, 17 May 2023 10:23:00 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v9 10/12] virtio_ring: correct the expression of the
 description of virtqueue_resize()
Date: Wed, 17 May 2023 10:22:47 +0800
Message-Id: <20230517022249.20790-11-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230517022249.20790-1-xuanzhuo@linux.alibaba.com>
References: <20230517022249.20790-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: c00a8eb40cdd
Cc: Christoph Hellwig <hch@infradead.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>
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

Modify the "useless" to a more accurate "unused".

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 42730c4ecdc5..c90160d2d280 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2734,7 +2734,7 @@ EXPORT_SYMBOL_GPL(vring_create_virtqueue_dma);
  * virtqueue_resize - resize the vring of vq
  * @_vq: the struct virtqueue we're talking about.
  * @num: new ring num
- * @recycle: callback for recycle the useless buffer
+ * @recycle: callback to recycle unused buffers
  *
  * When it is really necessary to create a new vring, it will set the current vq
  * into the reset state. Then call the passed callback to recycle the buffer
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
