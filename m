Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACA4349F8
	for <lists.virtualization@lfdr.de>; Wed, 20 Oct 2021 13:23:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649F083AC1;
	Wed, 20 Oct 2021 11:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ytKeK344Dts; Wed, 20 Oct 2021 11:23:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3DD7C834F2;
	Wed, 20 Oct 2021 11:23:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF475C000D;
	Wed, 20 Oct 2021 11:23:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C96FC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 11:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9F9640385
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 11:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kKIGKsxKpfQ6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 11:23:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1035401AF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 11:23:27 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R581e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0Ut2Ot5Q_1634729003; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Ut2Ot5Q_1634729003) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 20 Oct 2021 19:23:24 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v6 1/2] virtio_ring: make virtqueue_add_indirect_packed
 prettier
Date: Wed, 20 Oct 2021 19:23:22 +0800
Message-Id: <20211020112323.67466-2-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211020112323.67466-1-xuanzhuo@linux.alibaba.com>
References: <20211020112323.67466-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Cc: "David S. Miller" <davem@davemloft.net>, Tiwei Bie <tiwei.bie@intel.com>
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

Align the arguments of virtqueue_add_indirect_packed() to the open ( to
make it look prettier.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index dd95dfd85e98..91a46c4da87d 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1050,12 +1050,12 @@ static struct vring_packed_desc *alloc_indirect_packed(unsigned int total_sg,
 }
 
 static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
-				       struct scatterlist *sgs[],
-				       unsigned int total_sg,
-				       unsigned int out_sgs,
-				       unsigned int in_sgs,
-				       void *data,
-				       gfp_t gfp)
+					 struct scatterlist *sgs[],
+					 unsigned int total_sg,
+					 unsigned int out_sgs,
+					 unsigned int in_sgs,
+					 void *data,
+					 gfp_t gfp)
 {
 	struct vring_packed_desc *desc;
 	struct scatterlist *sg;
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
