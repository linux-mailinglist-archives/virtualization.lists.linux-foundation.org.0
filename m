Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A51A7BF13E
	for <lists.virtualization@lfdr.de>; Tue, 10 Oct 2023 05:11:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E0E5405C2;
	Tue, 10 Oct 2023 03:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E0E5405C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VYPs2_asELhv; Tue, 10 Oct 2023 03:11:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1185040556;
	Tue, 10 Oct 2023 03:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1185040556
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3C2FC0032;
	Tue, 10 Oct 2023 03:11:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2712CC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 03:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD24F81F4A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 03:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD24F81F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPtv2aVOySOf
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 03:11:30 +0000 (UTC)
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D210281EB5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 03:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D210281EB5
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0Vtr5Hke_1696907484; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vtr5Hke_1696907484) by smtp.aliyun-inc.com;
 Tue, 10 Oct 2023 11:11:25 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH vhost v3 4/4] virtio_pci: add build offset check for the new
 common cfg items
Date: Tue, 10 Oct 2023 11:11:20 +0800
Message-Id: <20231010031120.81272-5-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20231010031120.81272-1-xuanzhuo@linux.alibaba.com>
References: <20231010031120.81272-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: e40d16fdf29a
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
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

Add checks to the check_offsets(void) for queue_notify_data and
queue_reset.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_pci_modern_dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
index 33f319da1558..e2a1fe7bb66c 100644
--- a/drivers/virtio/virtio_pci_modern_dev.c
+++ b/drivers/virtio/virtio_pci_modern_dev.c
@@ -203,6 +203,10 @@ static inline void check_offsets(void)
 		     offsetof(struct virtio_pci_common_cfg, queue_used_lo));
 	BUILD_BUG_ON(VIRTIO_PCI_COMMON_Q_USEDHI !=
 		     offsetof(struct virtio_pci_common_cfg, queue_used_hi));
+	BUILD_BUG_ON(VIRTIO_PCI_COMMON_Q_NDATA !=
+		     offsetof(struct virtio_pci_modern_common_cfg, queue_notify_data));
+	BUILD_BUG_ON(VIRTIO_PCI_COMMON_Q_RESET !=
+		     offsetof(struct virtio_pci_modern_common_cfg, queue_reset));
 }
 
 /*
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
