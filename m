Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D1071E8634
	for <lists.virtualization@lfdr.de>; Tue, 29 Oct 2019 11:59:38 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ECCC1135E;
	Tue, 29 Oct 2019 10:59:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 098881352
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 10:59:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 8421DFD
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572346770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=bznT7rhcp8ud8WeGAKqJrKndjLj9XWfScadDTu5pjM8=;
	b=fBhh53sJe5F86fMh8B+jgp3sYv/4h4LvtWrmDq6LXCj3cDyd+BgyUdzMKrVLPmTDRxv0pP
	DRYDR789aJQyoY6PHXJ/1/ca+NUAqzRXJOpejnnK/8wy8p2TK4RwEssLBsuU9IE3e7sQxz
	LuEyH+cMmCVGD99CFzTqlQbm/HppHfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-296-NVxtE9rrM6qQTzdZYfcDdw-1; Tue, 29 Oct 2019 06:59:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E026476;
	Tue, 29 Oct 2019 10:59:26 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
	(ovpn-12-223.pek2.redhat.com [10.72.12.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31FA95C1D8;
	Tue, 29 Oct 2019 10:59:10 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] virtio: accept parent as a parameter when allocating
	virtqueue
Date: Tue, 29 Oct 2019 18:58:42 +0800
Message-Id: <20191029105843.12061-2-jasowang@redhat.com>
In-Reply-To: <20191029105843.12061-1-jasowang@redhat.com>
References: <20191029105843.12061-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: NVxtE9rrM6qQTzdZYfcDdw-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
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
 drivers/virtio/virtio_ring.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index bdc08244a648..51d83f4d7c32 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -269,12 +269,12 @@ size_t virtio_max_dma_size(struct virtio_device *vdev)
 }
 EXPORT_SYMBOL_GPL(virtio_max_dma_size);
 
-static void *vring_alloc_queue(struct virtio_device *vdev, size_t size,
-			      dma_addr_t *dma_handle, gfp_t flag)
+static void *vring_alloc_queue(struct virtio_device *vdev,
+			       struct device *parent, size_t size,
+			       dma_addr_t *dma_handle, gfp_t flag)
 {
 	if (vring_use_dma_api(vdev)) {
-		return dma_alloc_coherent(vdev->dev.parent, size,
-					  dma_handle, flag);
+		return dma_alloc_coherent(parent, size, dma_handle, flag);
 	} else {
 		void *queue = alloc_pages_exact(PAGE_ALIGN(size), flag);
 
@@ -859,6 +859,7 @@ static struct virtqueue *vring_create_virtqueue_split(
 	dma_addr_t dma_addr;
 	size_t queue_size_in_bytes;
 	struct vring vring;
+	struct device *parent = vdev->dev.parent;
 
 	/* We assume num is a power of 2. */
 	if (num & (num - 1)) {
@@ -868,7 +869,8 @@ static struct virtqueue *vring_create_virtqueue_split(
 
 	/* TODO: allocate each queue chunk individually */
 	for (; num && vring_size(num, vring_align) > PAGE_SIZE; num /= 2) {
-		queue = vring_alloc_queue(vdev, vring_size(num, vring_align),
+		queue = vring_alloc_queue(vdev, parent,
+					  vring_size(num, vring_align),
 					  &dma_addr,
 					  GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
 		if (queue)
@@ -882,7 +884,8 @@ static struct virtqueue *vring_create_virtqueue_split(
 
 	if (!queue) {
 		/* Try to get a single page. You are my only hope! */
-		queue = vring_alloc_queue(vdev, vring_size(num, vring_align),
+		queue = vring_alloc_queue(vdev, parent,
+					  vring_size(num, vring_align),
 					  &dma_addr, GFP_KERNEL|__GFP_ZERO);
 	}
 	if (!queue)
@@ -1569,10 +1572,11 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	dma_addr_t ring_dma_addr, driver_event_dma_addr, device_event_dma_addr;
 	size_t ring_size_in_bytes, event_size_in_bytes;
 	unsigned int i;
+	struct device *parent = vdev->dev.parent;
 
 	ring_size_in_bytes = num * sizeof(struct vring_packed_desc);
 
-	ring = vring_alloc_queue(vdev, ring_size_in_bytes,
+	ring = vring_alloc_queue(vdev, parent, ring_size_in_bytes,
 				 &ring_dma_addr,
 				 GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
 	if (!ring)
@@ -1580,13 +1584,13 @@ static struct virtqueue *vring_create_virtqueue_packed(
 
 	event_size_in_bytes = sizeof(struct vring_packed_desc_event);
 
-	driver = vring_alloc_queue(vdev, event_size_in_bytes,
+	driver = vring_alloc_queue(vdev, parent, event_size_in_bytes,
 				   &driver_event_dma_addr,
 				   GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
 	if (!driver)
 		goto err_driver;
 
-	device = vring_alloc_queue(vdev, event_size_in_bytes,
+	device = vring_alloc_queue(vdev, parent, event_size_in_bytes,
 				   &device_event_dma_addr,
 				   GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
 	if (!device)
-- 
2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
