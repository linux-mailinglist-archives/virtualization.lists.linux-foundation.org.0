Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E58E8636
	for <lists.virtualization@lfdr.de>; Tue, 29 Oct 2019 11:59:57 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 409F71368;
	Tue, 29 Oct 2019 10:59:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 740B61339
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 10:59:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 45FE1FD
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572346788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=RoC9DQBfngAYpMprddyEKsQ4rDBmYaE/2uMIoiuS8Sc=;
	b=Bo3RizRIDhaqo4B/IoQVDhh26Wo6uYCrngdeqRJiRYqIR5MSpyIn+6qrYZf3PBBrFwSIPm
	OMD+No/QzGuxyKc19nuUnRu06HAhzrm+5JiLEpgSMPBDWvtzc0U8FUK1ylrS2GrHGBY10t
	vBcuPRqpiXvqujfErdhtKFbWaM90hO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-277-kDmpJ3UPMQ-9Gx_yNcan0g-1; Tue, 29 Oct 2019 06:59:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEE4C8017DD;
	Tue, 29 Oct 2019 10:59:43 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-223.pek2.redhat.com [10.72.12.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6731A5C1B2;
	Tue, 29 Oct 2019 10:59:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] virtio: allow query vq parent device
Date: Tue, 29 Oct 2019 18:58:43 +0800
Message-Id: <20191029105843.12061-3-jasowang@redhat.com>
In-Reply-To: <20191029105843.12061-1-jasowang@redhat.com>
References: <20191029105843.12061-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: kDmpJ3UPMQ-9Gx_yNcan0g-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: lingshan.zhu@intel.com, lulu@redhat.com, zhihong.wang@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c  | 16 ++++++++++++++--
 include/linux/virtio_config.h |  2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 51d83f4d7c32..ddeef7421d4d 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -183,6 +183,9 @@ struct vring_virtqueue {
 	/* DMA, allocation, and size information */
 	bool we_own_ring;
 
+	/* Parent device for doing DMA */
+	struct device *parent;
+
 #ifdef DEBUG
 	/* They're supposed to lock for us. */
 	unsigned int in_use;
@@ -318,7 +321,7 @@ static void vring_free_queue(struct virtio_device *vdev, size_t size,
  */
 static inline struct device *vring_dma_dev(const struct vring_virtqueue *vq)
 {
-	return vq->vq.vdev->dev.parent;
+	return vq->parent;
 }
 
 /* Map one sg entry. */
@@ -1554,6 +1557,14 @@ static void *virtqueue_detach_unused_buf_packed(struct virtqueue *_vq)
 	return NULL;
 }
 
+static struct device *vring_get_parent(struct virtio_device *vdev, int index)
+{
+	if (vdev->config->get_vq_parent)
+		return vdev->config->get_vq_parent(vdev, index);
+	else
+		return vdev->dev.parent;
+}
+
 static struct virtqueue *vring_create_virtqueue_packed(
 	unsigned int index,
 	unsigned int num,
@@ -1572,7 +1583,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	dma_addr_t ring_dma_addr, driver_event_dma_addr, device_event_dma_addr;
 	size_t ring_size_in_bytes, event_size_in_bytes;
 	unsigned int i;
-	struct device *parent = vdev->dev.parent;
+	struct device *parent = vring_get_parent(vdev, index);
 
 	ring_size_in_bytes = num * sizeof(struct vring_packed_desc);
 
@@ -1613,6 +1624,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	vq->num_added = 0;
 	vq->packed_ring = true;
 	vq->use_dma_api = vring_use_dma_api(vdev);
+	vq->parent = parent;
 	list_add_tail(&vq->vq.list, &vdev->vqs);
 #ifdef DEBUG
 	vq->in_use = false;
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index bb4cc4910750..a95af83aad9f 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -65,6 +65,7 @@ struct irq_affinity;
  *      the caller can then copy.
  * @set_vq_affinity: set the affinity for a virtqueue (optional).
  * @get_vq_affinity: get the affinity for a virtqueue (optional).
+ * @get_vq_parent: get the parent device for a virtqueue (optional).
  */
 typedef void vq_callback_t(struct virtqueue *);
 struct virtio_config_ops {
@@ -88,6 +89,7 @@ struct virtio_config_ops {
 			       const struct cpumask *cpu_mask);
 	const struct cpumask *(*get_vq_affinity)(struct virtio_device *vdev,
 			int index);
+	struct device *(*get_vq_parent)(struct virtio_device *vdev, int index);
 };
 
 /* If driver didn't advertise the feature, it will never appear. */
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
