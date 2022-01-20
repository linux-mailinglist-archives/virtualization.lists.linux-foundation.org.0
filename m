Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132B494776
	for <lists.virtualization@lfdr.de>; Thu, 20 Jan 2022 07:43:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E34EE60BF2;
	Thu, 20 Jan 2022 06:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCDTGFkxHj7c; Thu, 20 Jan 2022 06:43:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8A1FA60E22;
	Thu, 20 Jan 2022 06:43:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 421C7C002F;
	Thu, 20 Jan 2022 06:43:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15BB1C002F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E904D41514
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsHbYV48Bh_X
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 818BF409EA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:14 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R961e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V2L1lSQ_1642660989; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V2L1lSQ_1642660989) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 20 Jan 2022 14:43:09 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 05/12] virito: queue_reset: pci: move the per queue irq
 logic from vp_del_vqs to vp_del_vq
Date: Thu, 20 Jan 2022 14:42:56 +0800
Message-Id: <20220120064303.106639-6-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220120064303.106639-1-xuanzhuo@linux.alibaba.com>
References: <20220120064303.106639-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
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

Move irq's processing logic into vp_del_vq(), so that this function can
handle a vq's del operation independently.

In the subsequent patches that supports queue reset, I have the
need to delete a vq separately.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_pci_common.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index fdbde1db5ec5..cb1eec0a6bf3 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -248,6 +248,17 @@ static void vp_del_vq(struct virtqueue *vq)
 	struct virtio_pci_vq_info *info = vp_dev->vqs[vq->index];
 	unsigned long flags;
 
+	if (vp_dev->per_vq_vectors) {
+		int v = vp_dev->vqs[vq->index]->msix_vector;
+
+		if (v != VIRTIO_MSI_NO_VECTOR) {
+			int irq = pci_irq_vector(vp_dev->pci_dev, v);
+
+			irq_set_affinity_hint(irq, NULL);
+			free_irq(irq, vq);
+		}
+	}
+
 	spin_lock_irqsave(&vp_dev->lock, flags);
 	list_del(&info->node);
 	spin_unlock_irqrestore(&vp_dev->lock, flags);
@@ -263,19 +274,9 @@ void vp_del_vqs(struct virtio_device *vdev)
 	struct virtqueue *vq, *n;
 	int i;
 
-	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
-		if (vp_dev->per_vq_vectors) {
-			int v = vp_dev->vqs[vq->index]->msix_vector;
-
-			if (v != VIRTIO_MSI_NO_VECTOR) {
-				int irq = pci_irq_vector(vp_dev->pci_dev, v);
-
-				irq_set_affinity_hint(irq, NULL);
-				free_irq(irq, vq);
-			}
-		}
+	list_for_each_entry_safe(vq, n, &vdev->vqs, list)
 		vp_del_vq(vq);
-	}
+
 	vp_dev->per_vq_vectors = false;
 
 	if (vp_dev->intx_enabled) {
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
