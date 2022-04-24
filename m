Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8405250CE86
	for <lists.virtualization@lfdr.de>; Sun, 24 Apr 2022 04:41:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC73E403D6;
	Sun, 24 Apr 2022 02:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCU7gBFDS8UN; Sun, 24 Apr 2022 02:40:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5EF9F404BB;
	Sun, 24 Apr 2022 02:40:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E155C0088;
	Sun, 24 Apr 2022 02:40:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DAEFC002D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 02:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 406AA81A6F
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 02:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZK5ZDNIItLNO
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 02:40:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA6A981A18
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 02:40:50 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=4; SR=0; TI=SMTPD_---0VAzcuYK_1650768046; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VAzcuYK_1650768046) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 24 Apr 2022 10:40:46 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 02/16] virtio_ring: split: introduce
 vring_virtqueue_detach_split()
Date: Sun, 24 Apr 2022 10:40:30 +0800
Message-Id: <20220424024044.94749-3-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220424024044.94749-1-xuanzhuo@linux.alibaba.com>
References: <20220424024044.94749-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: c42022d07dde
Cc: virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

The function vring_virtqueue_detach_split() is introduced to detach the
vring of the current vq.

num_left records how many buffers there are, which can be used to check
the recovery of buffers completed.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 0a2c58557027..f3ad9322b512 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -112,6 +112,8 @@ struct vring_virtqueue_split {
 	 */
 	u32 vring_align;
 	bool may_reduce_num;
+
+	u32 num_left;
 };
 
 struct vring_virtqueue_packed {
@@ -982,6 +984,21 @@ static void virtqueue_reinit_split(struct vring_virtqueue *vq)
 	virtqueue_vring_init_split(vq);
 }
 
+static void virtqueue_vring_detach_split(struct vring_virtqueue *vq,
+					 struct vring_virtqueue_split *vring)
+{
+	vring->vring = vq->split.vring;
+
+	vring->queue_dma_addr = vq->split.queue_dma_addr;
+
+	vring->queue_size_in_bytes = vq->split.queue_size_in_bytes;
+
+	vring->desc_extra = vq->split.desc_extra;
+	vring->desc_state = vq->split.desc_state;
+
+	vring->num_left = vring->vring.num - vq->vq.num_free;
+}
+
 static void virtqueue_vring_attach_split(struct vring_virtqueue *vq,
 					 struct vring_virtqueue_split *vring)
 {
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
