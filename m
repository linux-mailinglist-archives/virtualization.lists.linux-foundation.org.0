Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0694AF185
	for <lists.virtualization@lfdr.de>; Wed,  9 Feb 2022 13:29:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67A8082F4F;
	Wed,  9 Feb 2022 12:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dk00YVwNo0Uo; Wed,  9 Feb 2022 12:29:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 351A682CCB;
	Wed,  9 Feb 2022 12:29:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7D82C0073;
	Wed,  9 Feb 2022 12:29:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 334FAC000B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Feb 2022 12:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 189C240342
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Feb 2022 12:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shRfKOMIu01Y
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Feb 2022 12:29:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93A6A400A4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Feb 2022 12:29:07 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R721e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=4; SR=0; TI=SMTPD_---0V4.Hs86_1644409742; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V4.Hs86_1644409742) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 09 Feb 2022 20:29:02 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/14] virtio_pci: struct virtio_pci_common_cfg add
 queue_notify_data
Date: Wed,  9 Feb 2022 20:28:48 +0800
Message-Id: <20220209122901.51790-2-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220209122901.51790-1-xuanzhuo@linux.alibaba.com>
References: <20220209122901.51790-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
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

Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
here https://github.com/oasis-tcs/virtio-spec/issues/89

For not breaks uABI, add a new struct virtio_pci_common_cfg_notify.

Since I want to add queue_reset after queue_notify_data, I submitted
this patch first.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 include/uapi/linux/virtio_pci.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
index 3a86f36d7e3d..22bec9bd0dfc 100644
--- a/include/uapi/linux/virtio_pci.h
+++ b/include/uapi/linux/virtio_pci.h
@@ -166,6 +166,13 @@ struct virtio_pci_common_cfg {
 	__le32 queue_used_hi;		/* read-write */
 };
 
+struct virtio_pci_common_cfg_notify {
+	struct virtio_pci_common_cfg cfg;
+
+	__le16 queue_notify_data;	/* read-write */
+	__le16 padding;
+};
+
 /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
 struct virtio_pci_cfg_cap {
 	struct virtio_pci_cap cap;
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
