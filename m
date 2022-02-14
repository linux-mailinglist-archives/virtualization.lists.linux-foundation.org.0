Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E304B436C
	for <lists.virtualization@lfdr.de>; Mon, 14 Feb 2022 09:14:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F64B814AB;
	Mon, 14 Feb 2022 08:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtUqWKIf-Wdh; Mon, 14 Feb 2022 08:14:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 38E288149D;
	Mon, 14 Feb 2022 08:14:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1B2DC000B;
	Mon, 14 Feb 2022 08:14:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F2A3C0082
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 08:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E07B8141F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 08:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id niZMmOEjFvN4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 08:14:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3998381342
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 08:14:42 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V4Oo2Cx_1644826472; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V4Oo2Cx_1644826472) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 14 Feb 2022 16:14:33 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
Subject: [PATCH v5 15/22] virtio: queue_reset: add helper
Date: Mon, 14 Feb 2022 16:14:09 +0800
Message-Id: <20220214081416.117695-16-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220214081416.117695-1-xuanzhuo@linux.alibaba.com>
References: <20220214081416.117695-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 24fd8391539b
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

Add helper for virtio queue reset.

* virtio_reset_vq: reset a queue individually
* virtio_enable_resetq: enable a reset queue

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 include/linux/virtio_config.h | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 8cde339d40b4..cd7f7f44ce38 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -233,6 +233,44 @@ int virtio_find_vqs_ctx(struct virtio_device *vdev, unsigned nvqs,
 				      desc);
 }
 
+/**
+ * virtio_reset_vq - reset a queue individually
+ * @vq: the virtqueue
+ *
+ * returns 0 on success or error status
+ *
+ * After successfully calling this, be sure to call
+ * virtqueue_detach_unused_buf() to recycle the buffer in the ring, and
+ * then call vring_release_virtqueue() to release the vq ring.
+ *
+ * Caller should guarantee that the vring is not accessed by any functions
+ * of virtqueue.
+ */
+static inline
+int virtio_reset_vq(struct virtqueue *vq)
+{
+	if (!vq->vdev->config->reset_vq)
+		return -ENOENT;
+
+	return vq->vdev->config->reset_vq(vq);
+}
+
+/**
+ * virtio_enable_resetq - enable a reset queue
+ * @vq: the virtqueue
+ *
+ * returns 0 on success or error status
+ *
+ */
+static inline
+int virtio_enable_resetq(struct virtqueue *vq)
+{
+	if (!vq->vdev->config->enable_reset_vq)
+		return -ENOENT;
+
+	return vq->vdev->config->enable_reset_vq(vq);
+}
+
 /**
  * virtio_device_ready - enable vq use in probe function
  * @vdev: the device
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
