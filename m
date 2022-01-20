Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF0494771
	for <lists.virtualization@lfdr.de>; Thu, 20 Jan 2022 07:43:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0088410AD;
	Thu, 20 Jan 2022 06:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSeIWO72a7qI; Thu, 20 Jan 2022 06:43:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D5694410C6;
	Thu, 20 Jan 2022 06:43:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C556BC007D;
	Thu, 20 Jan 2022 06:43:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4203BC002F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DA3060B45
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTSujQBpuryO
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D798860BD5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 06:43:11 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V2KWFIS_1642660984; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V2KWFIS_1642660984) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 20 Jan 2022 14:43:05 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 01/12] virtio: pci: struct virtio_pci_common_cfg add
 queue_notify_data
Date: Thu, 20 Jan 2022 14:42:52 +0800
Message-Id: <20220120064303.106639-2-xuanzhuo@linux.alibaba.com>
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

Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
here https://github.com/oasis-tcs/virtio-spec/issues/89

Since I want to add queue_reset after it, I submitted this patch first.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 include/uapi/linux/virtio_pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
index 3a86f36d7e3d..492c89f56c6a 100644
--- a/include/uapi/linux/virtio_pci.h
+++ b/include/uapi/linux/virtio_pci.h
@@ -164,6 +164,7 @@ struct virtio_pci_common_cfg {
 	__le32 queue_avail_hi;		/* read-write */
 	__le32 queue_used_lo;		/* read-write */
 	__le32 queue_used_hi;		/* read-write */
+	__le16 queue_notify_data;	/* read-write */
 };
 
 /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
