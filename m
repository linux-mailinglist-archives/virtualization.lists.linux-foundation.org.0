Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE7758643D
	for <lists.virtualization@lfdr.de>; Mon,  1 Aug 2022 08:39:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DE5084023;
	Mon,  1 Aug 2022 06:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DE5084023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTrscaZvbOHU; Mon,  1 Aug 2022 06:39:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D263B83FEC;
	Mon,  1 Aug 2022 06:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D263B83FEC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A3AEC002D;
	Mon,  1 Aug 2022 06:39:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95E8BC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Aug 2022 06:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6954360F1F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Aug 2022 06:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6954360F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuBaYBV2_jdk
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Aug 2022 06:39:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3236D61195
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3236D61195
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Aug 2022 06:39:19 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R961e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0VL1srU2_1659335952; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VL1srU2_1659335952) by smtp.aliyun-inc.com;
 Mon, 01 Aug 2022 14:39:13 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v14 05/42] virtio_ring: split vring_virtqueue
Date: Mon,  1 Aug 2022 14:38:25 +0800
Message-Id: <20220801063902.129329-6-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220801063902.129329-1-xuanzhuo@linux.alibaba.com>
References: <20220801063902.129329-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 0f12e405b061
Cc: Vadim Pasternak <vadimp@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 kangjie.xu@linux.alibaba.com, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 kvm@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Richard Weinberger <richard@nod.at>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 John Fastabend <john.fastabend@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Berg <johannes@sipsolutions.net>,
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

Separate the two inline structures(split and packed) from the structure
vring_virtqueue.

In this way, we can use these two structures later to pass parameters
and retain temporary variables.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 116 ++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index a3d76fd87983..1bc5794e9739 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -85,6 +85,64 @@ struct vring_desc_extra {
 	u16 next;			/* The next desc state in a list. */
 };
 
+struct vring_virtqueue_split {
+	/* Actual memory layout for this queue. */
+	struct vring vring;
+
+	/* Last written value to avail->flags */
+	u16 avail_flags_shadow;
+
+	/*
+	 * Last written value to avail->idx in
+	 * guest byte order.
+	 */
+	u16 avail_idx_shadow;
+
+	/* Per-descriptor state. */
+	struct vring_desc_state_split *desc_state;
+	struct vring_desc_extra *desc_extra;
+
+	/* DMA address and size information */
+	dma_addr_t queue_dma_addr;
+	size_t queue_size_in_bytes;
+};
+
+struct vring_virtqueue_packed {
+	/* Actual memory layout for this queue. */
+	struct {
+		unsigned int num;
+		struct vring_packed_desc *desc;
+		struct vring_packed_desc_event *driver;
+		struct vring_packed_desc_event *device;
+	} vring;
+
+	/* Driver ring wrap counter. */
+	bool avail_wrap_counter;
+
+	/* Avail used flags. */
+	u16 avail_used_flags;
+
+	/* Index of the next avail descriptor. */
+	u16 next_avail_idx;
+
+	/*
+	 * Last written value to driver->flags in
+	 * guest byte order.
+	 */
+	u16 event_flags_shadow;
+
+	/* Per-descriptor state. */
+	struct vring_desc_state_packed *desc_state;
+	struct vring_desc_extra *desc_extra;
+
+	/* DMA address and size information */
+	dma_addr_t ring_dma_addr;
+	dma_addr_t driver_event_dma_addr;
+	dma_addr_t device_event_dma_addr;
+	size_t ring_size_in_bytes;
+	size_t event_size_in_bytes;
+};
+
 struct vring_virtqueue {
 	struct virtqueue vq;
 
@@ -124,64 +182,10 @@ struct vring_virtqueue {
 
 	union {
 		/* Available for split ring */
-		struct {
-			/* Actual memory layout for this queue. */
-			struct vring vring;
-
-			/* Last written value to avail->flags */
-			u16 avail_flags_shadow;
-
-			/*
-			 * Last written value to avail->idx in
-			 * guest byte order.
-			 */
-			u16 avail_idx_shadow;
-
-			/* Per-descriptor state. */
-			struct vring_desc_state_split *desc_state;
-			struct vring_desc_extra *desc_extra;
-
-			/* DMA address and size information */
-			dma_addr_t queue_dma_addr;
-			size_t queue_size_in_bytes;
-		} split;
+		struct vring_virtqueue_split split;
 
 		/* Available for packed ring */
-		struct {
-			/* Actual memory layout for this queue. */
-			struct {
-				unsigned int num;
-				struct vring_packed_desc *desc;
-				struct vring_packed_desc_event *driver;
-				struct vring_packed_desc_event *device;
-			} vring;
-
-			/* Driver ring wrap counter. */
-			bool avail_wrap_counter;
-
-			/* Avail used flags. */
-			u16 avail_used_flags;
-
-			/* Index of the next avail descriptor. */
-			u16 next_avail_idx;
-
-			/*
-			 * Last written value to driver->flags in
-			 * guest byte order.
-			 */
-			u16 event_flags_shadow;
-
-			/* Per-descriptor state. */
-			struct vring_desc_state_packed *desc_state;
-			struct vring_desc_extra *desc_extra;
-
-			/* DMA address and size information */
-			dma_addr_t ring_dma_addr;
-			dma_addr_t driver_event_dma_addr;
-			dma_addr_t device_event_dma_addr;
-			size_t ring_size_in_bytes;
-			size_t event_size_in_bytes;
-		} packed;
+		struct vring_virtqueue_packed packed;
 	};
 
 	/* How to notify other side. FIXME: commonalize hcalls! */
-- 
2.31.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
