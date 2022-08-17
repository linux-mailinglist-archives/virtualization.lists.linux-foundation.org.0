Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 32791596D3E
	for <lists.virtualization@lfdr.de>; Wed, 17 Aug 2022 13:04:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9CA9830E2;
	Wed, 17 Aug 2022 11:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9CA9830E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjsVHPZoxLvP; Wed, 17 Aug 2022 11:04:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A7E5283265;
	Wed, 17 Aug 2022 11:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E5283265
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C82B3C007B;
	Wed, 17 Aug 2022 11:04:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 216ECC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Aug 2022 11:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D652183134
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Aug 2022 11:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D652183134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ISsjkQ0AhPoZ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Aug 2022 11:04:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 342C6830E2
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 342C6830E2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Aug 2022 11:04:32 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VMVDEq4_1660734268; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VMVDEq4_1660734268) by smtp.aliyun-inc.com;
 Wed, 17 Aug 2022 19:04:28 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] virtio/virtio_pci_legacy: debug checking for queue size
Date: Wed, 17 Aug 2022 19:04:28 +0800
Message-Id: <20220817110428.120396-1-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-Git-Hash: 9d7a0d92446c
Cc: "Michael S. Tsirkin" <mst@redhat.com>
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

Legacy virtio pci has no way to communicate a change in vq size to
the hypervisor. If ring sizes don't match hypervisor will happily
corrupt memory.

We add a check to vring size before calling
vp_legacy_set_queue_address(). Checking the memory range directly is a
bit cumbersome.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_pci_legacy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index 2257f1b3d8ae..a1553abc45f9 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -146,6 +146,12 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 		goto out_del_vq;
 	}
 
+	/* Legacy virtio pci has no way to communicate a change in vq size to
+	 * the hypervisor. If ring sizes don't match hypervisor will happily
+	 * corrupt memory.
+	 */
+	BUG_ON(num != virtqueue_get_vring_size(vq));
+
 	/* activate the queue */
 	vp_legacy_set_queue_address(&vp_dev->ldev, index, q_pfn);
 
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
