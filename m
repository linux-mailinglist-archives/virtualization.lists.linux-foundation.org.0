Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C920A06A
	for <lists.virtualization@lfdr.de>; Thu, 25 Jun 2020 15:58:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 63FB82324E;
	Thu, 25 Jun 2020 13:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qti5aCvmKhBJ; Thu, 25 Jun 2020 13:58:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 33099231F2;
	Thu, 25 Jun 2020 13:58:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13950C0863;
	Thu, 25 Jun 2020 13:58:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56AF0C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 464E687D05
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7s29BQchz0C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 34970878AE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593093490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NdyvoauYhpazCCZCRwG2P58IXyrs8oA1xrut4UitX8=;
 b=Fjb/6pqIT5bRHTeV+UyP0q+0oDLZ8PVTyALugCX90TQQ1aCkz8Y2YHWLG9R0K5K/Tva631
 FG+GOaIl86q0ezdTgRqwaBZ+CzKbQmylZpFw39VL6TcetXfFqXtDCPn1QwpLnVqSHTc4bQ
 EtKU0oWzOKe9SIX4z1dUv2/gixf+F/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-OkTv-wmOPaqh5OxbKzlzpg-1; Thu, 25 Jun 2020 09:58:08 -0400
X-MC-Unique: OkTv-wmOPaqh5OxbKzlzpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44B15800C60;
 Thu, 25 Jun 2020 13:58:07 +0000 (UTC)
Received: from localhost (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC3E17C1EC;
 Thu, 25 Jun 2020 13:58:03 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC 2/3] virtio_ring: use NUMA-aware memory allocation in probe
Date: Thu, 25 Jun 2020 14:57:51 +0100
Message-Id: <20200625135752.227293-3-stefanha@redhat.com>
In-Reply-To: <20200625135752.227293-1-stefanha@redhat.com>
References: <20200625135752.227293-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
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

Allocate frequently-accessed data structures from the NUMA node
associated with this device to avoid slow cross-NUMA node memory
accesses.

Only the following memory allocations are made NUMA-aware:

1. Called during probe. If called in the data path then hopefully we're
   executing on a CPU in the same NUMA node as the device. If the CPU is
   not in the right NUMA node then it's unclear whether forcing memory
   allocations to use the device's NUMA node will increase or decrease
   performance.

2. Memory will be frequently accessed from the data path. There is no
   need to worry about data that is not accessed from
   performance-critical code paths.

This patch adds a non-meminit alloc_pages_exact_nid() caller so I've
removed the __meminit added by commit e19318116048 ("mm/page_alloc.c:
add __meminit to alloc_pages_exact_nid()").

Cc: Fabian Frederick <fabf@skynet.be>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
I have included the alloc_pages_exact_nid() __meminit removal in this
patch to provide context for reviewers.
---
 include/linux/gfp.h          |  2 +-
 drivers/virtio/virtio_ring.c | 26 +++++++++++++++++---------
 mm/page_alloc.c              |  2 +-
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 4aba4c86c626..9b69df707c7a 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -563,7 +563,7 @@ extern unsigned long get_zeroed_page(gfp_t gfp_mask);
 
 void *alloc_pages_exact(size_t size, gfp_t gfp_mask);
 void free_pages_exact(void *virt, size_t size);
-void * __meminit alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask);
+void *alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask);
 
 #define __get_free_page(gfp_mask) \
 		__get_free_pages((gfp_mask), 0)
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 58b96baa8d48..d06b42309bed 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -276,7 +276,9 @@ static void *vring_alloc_queue(struct virtio_device *vdev, size_t size,
 		return dma_alloc_coherent(vdev->dev.parent, size,
 					  dma_handle, flag);
 	} else {
-		void *queue = alloc_pages_exact(PAGE_ALIGN(size), flag);
+		int node = dev_to_node(&vdev->dev);
+		void *queue = alloc_pages_exact_nid(node, PAGE_ALIGN(size),
+						    flag);
 
 		if (queue) {
 			phys_addr_t phys_addr = virt_to_phys(queue);
@@ -1567,6 +1569,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	struct vring_packed_desc_event *driver, *device;
 	dma_addr_t ring_dma_addr, driver_event_dma_addr, device_event_dma_addr;
 	size_t ring_size_in_bytes, event_size_in_bytes;
+	int node = dev_to_node(&vdev->dev);
 	unsigned int i;
 
 	ring_size_in_bytes = num * sizeof(struct vring_packed_desc);
@@ -1591,7 +1594,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	if (!device)
 		goto err_device;
 
-	vq = kmalloc(sizeof(*vq), GFP_KERNEL);
+	vq = kmalloc_node(sizeof(*vq), GFP_KERNEL, node);
 	if (!vq)
 		goto err_vq;
 
@@ -1639,9 +1642,10 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	vq->packed.event_flags_shadow = 0;
 	vq->packed.avail_used_flags = 1 << VRING_PACKED_DESC_F_AVAIL;
 
-	vq->packed.desc_state = kmalloc_array(num,
+	vq->packed.desc_state = kmalloc_array_node(num,
 			sizeof(struct vring_desc_state_packed),
-			GFP_KERNEL);
+			GFP_KERNEL,
+			node);
 	if (!vq->packed.desc_state)
 		goto err_desc_state;
 
@@ -1653,9 +1657,10 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	for (i = 0; i < num-1; i++)
 		vq->packed.desc_state[i].next = i + 1;
 
-	vq->packed.desc_extra = kmalloc_array(num,
+	vq->packed.desc_extra = kmalloc_array_node(num,
 			sizeof(struct vring_desc_extra_packed),
-			GFP_KERNEL);
+			GFP_KERNEL,
+			node);
 	if (!vq->packed.desc_extra)
 		goto err_desc_extra;
 
@@ -2059,13 +2064,14 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
 					void (*callback)(struct virtqueue *),
 					const char *name)
 {
+	int node = dev_to_node(&vdev->dev);
 	unsigned int i;
 	struct vring_virtqueue *vq;
 
 	if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED))
 		return NULL;
 
-	vq = kmalloc(sizeof(*vq), GFP_KERNEL);
+	vq = kmalloc_node(sizeof(*vq), GFP_KERNEL, node);
 	if (!vq)
 		return NULL;
 
@@ -2110,8 +2116,10 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
 					vq->split.avail_flags_shadow);
 	}
 
-	vq->split.desc_state = kmalloc_array(vring.num,
-			sizeof(struct vring_desc_state_split), GFP_KERNEL);
+	vq->split.desc_state = kmalloc_array_node(vring.num,
+			sizeof(struct vring_desc_state_split),
+			GFP_KERNEL,
+			node);
 	if (!vq->split.desc_state) {
 		kfree(vq);
 		return NULL;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 13cc653122b7..2216022d8987 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5053,7 +5053,7 @@ EXPORT_SYMBOL(alloc_pages_exact);
  *
  * Return: pointer to the allocated area or %NULL in case of error.
  */
-void * __meminit alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask)
+void *alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask)
 {
 	unsigned int order = get_order(size);
 	struct page *p;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
