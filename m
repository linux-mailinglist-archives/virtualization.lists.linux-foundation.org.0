Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D442B06BD
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 14:39:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 01DB3870E0;
	Thu, 12 Nov 2020 13:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfbJFPJKamz5; Thu, 12 Nov 2020 13:39:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 34FA3870EA;
	Thu, 12 Nov 2020 13:39:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 078EFC088B;
	Thu, 12 Nov 2020 13:39:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82852C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 60CAA2E1EB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ad0YXxcRoymu
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 4BD072E1E8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G6l1BtNUHvW6D9wr2OOjFqweNSqWBZTTpbA4gCNjKZk=;
 b=gSt8dO33R959+/GJSBf2UxA8cIyuoqcC4LgmRiVKO6LgJuVBD9pJOITYA3Tiqcs8ubg2wA
 /1ksbtlzU3bxKLZY3s9gr/61EQ8JCOhl+Xj9+gF+q1gXTK7mGCV+vwKiqhxHvGA1ga1s3L
 XwsiSi1/Ub2VKEH4CGFJBB6zCdquuSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-HApQrxTBPzi1z4Xdq5X7Lg-1; Thu, 12 Nov 2020 08:39:27 -0500
X-MC-Unique: HApQrxTBPzi1z4Xdq5X7Lg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00D901030986;
 Thu, 12 Nov 2020 13:39:26 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F70955765;
 Thu, 12 Nov 2020 13:39:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/29] virtio-mem: nb_sb_per_mb and subblock_size are
 specific to Sub Block Mode (SBM)
Date: Thu, 12 Nov 2020 14:38:06 +0100
Message-Id: <20201112133815.13332-21-david@redhat.com>
In-Reply-To: <20201112133815.13332-1-david@redhat.com>
References: <20201112133815.13332-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

Let's rename to "sbs_per_mb" and "sb_size" and move accordingly.

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 96 ++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 851cddf5c606..6395c3090252 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -96,11 +96,6 @@ struct virtio_mem {
 	/* Maximum region size in bytes. */
 	uint64_t region_size;
 
-	/* The subblock size. */
-	uint64_t subblock_size;
-	/* The number of subblocks per memory block. */
-	uint32_t nb_sb_per_mb;
-
 	/* Id of the first memory block of this device. */
 	unsigned long first_mb_id;
 	/* Id of the last usable memory block of this device. */
@@ -126,6 +121,11 @@ struct virtio_mem {
 	uint64_t offline_threshold;
 
 	struct {
+		/* The subblock size. */
+		uint64_t sb_size;
+		/* The number of subblocks per Linux memory block. */
+		uint32_t sbs_per_mb;
+
 		/* Summary of all memory block states. */
 		unsigned long mb_count[VIRTIO_MEM_SBM_MB_COUNT];
 
@@ -256,7 +256,7 @@ static unsigned long virtio_mem_phys_to_sb_id(struct virtio_mem *vm,
 	const unsigned long mb_id = virtio_mem_phys_to_mb_id(addr);
 	const unsigned long mb_addr = virtio_mem_mb_id_to_phys(mb_id);
 
-	return (addr - mb_addr) / vm->subblock_size;
+	return (addr - mb_addr) / vm->sbm.sb_size;
 }
 
 /*
@@ -332,7 +332,7 @@ static int virtio_mem_sbm_mb_states_prepare_next_mb(struct virtio_mem *vm)
 static int virtio_mem_sbm_sb_state_bit_nr(struct virtio_mem *vm,
 					  unsigned long mb_id, int sb_id)
 {
-	return (mb_id - vm->first_mb_id) * vm->nb_sb_per_mb + sb_id;
+	return (mb_id - vm->first_mb_id) * vm->sbm.sbs_per_mb + sb_id;
 }
 
 /*
@@ -395,7 +395,7 @@ static bool virtio_mem_sbm_test_sb_unplugged(struct virtio_mem *vm,
 }
 
 /*
- * Find the first unplugged subblock. Returns vm->nb_sb_per_mb in case there is
+ * Find the first unplugged subblock. Returns vm->sbm.sbs_per_mb in case there is
  * none.
  */
 static int virtio_mem_sbm_first_unplugged_sb(struct virtio_mem *vm,
@@ -404,7 +404,7 @@ static int virtio_mem_sbm_first_unplugged_sb(struct virtio_mem *vm,
 	const int bit = virtio_mem_sbm_sb_state_bit_nr(vm, mb_id, 0);
 
 	return find_next_zero_bit(vm->sbm.sb_states,
-				  bit + vm->nb_sb_per_mb, bit) - bit;
+				  bit + vm->sbm.sbs_per_mb, bit) - bit;
 }
 
 /*
@@ -413,8 +413,8 @@ static int virtio_mem_sbm_first_unplugged_sb(struct virtio_mem *vm,
 static int virtio_mem_sbm_sb_states_prepare_next_mb(struct virtio_mem *vm)
 {
 	const unsigned long old_nb_mb = vm->next_mb_id - vm->first_mb_id;
-	const unsigned long old_nb_bits = old_nb_mb * vm->nb_sb_per_mb;
-	const unsigned long new_nb_bits = (old_nb_mb + 1) * vm->nb_sb_per_mb;
+	const unsigned long old_nb_bits = old_nb_mb * vm->sbm.sbs_per_mb;
+	const unsigned long new_nb_bits = (old_nb_mb + 1) * vm->sbm.sbs_per_mb;
 	int old_pages = PFN_UP(BITS_TO_LONGS(old_nb_bits) * sizeof(long));
 	int new_pages = PFN_UP(BITS_TO_LONGS(new_nb_bits) * sizeof(long));
 	unsigned long *new_bitmap, *old_bitmap;
@@ -640,15 +640,15 @@ static void virtio_mem_notify_online(struct virtio_mem *vm, unsigned long mb_id)
 static void virtio_mem_notify_going_offline(struct virtio_mem *vm,
 					    unsigned long mb_id)
 {
-	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
+	const unsigned long nr_pages = PFN_DOWN(vm->sbm.sb_size);
 	unsigned long pfn;
 	int sb_id;
 
-	for (sb_id = 0; sb_id < vm->nb_sb_per_mb; sb_id++) {
+	for (sb_id = 0; sb_id < vm->sbm.sbs_per_mb; sb_id++) {
 		if (virtio_mem_sbm_test_sb_plugged(vm, mb_id, sb_id, 1))
 			continue;
 		pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
-			       sb_id * vm->subblock_size);
+			       sb_id * vm->sbm.sb_size);
 		virtio_mem_fake_offline_going_offline(pfn, nr_pages);
 	}
 }
@@ -656,15 +656,15 @@ static void virtio_mem_notify_going_offline(struct virtio_mem *vm,
 static void virtio_mem_notify_cancel_offline(struct virtio_mem *vm,
 					     unsigned long mb_id)
 {
-	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
+	const unsigned long nr_pages = PFN_DOWN(vm->sbm.sb_size);
 	unsigned long pfn;
 	int sb_id;
 
-	for (sb_id = 0; sb_id < vm->nb_sb_per_mb; sb_id++) {
+	for (sb_id = 0; sb_id < vm->sbm.sbs_per_mb; sb_id++) {
 		if (virtio_mem_sbm_test_sb_plugged(vm, mb_id, sb_id, 1))
 			continue;
 		pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
-			       sb_id * vm->subblock_size);
+			       sb_id * vm->sbm.sb_size);
 		virtio_mem_fake_offline_cancel_offline(pfn, nr_pages);
 	}
 }
@@ -1103,8 +1103,8 @@ static int virtio_mem_mb_plug_sb(struct virtio_mem *vm, unsigned long mb_id,
 				 int sb_id, int count)
 {
 	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id) +
-			      sb_id * vm->subblock_size;
-	const uint64_t size = count * vm->subblock_size;
+			      sb_id * vm->sbm.sb_size;
+	const uint64_t size = count * vm->sbm.sb_size;
 	int rc;
 
 	rc = virtio_mem_send_plug_request(vm, addr, size);
@@ -1121,8 +1121,8 @@ static int virtio_mem_mb_unplug_sb(struct virtio_mem *vm, unsigned long mb_id,
 				   int sb_id, int count)
 {
 	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id) +
-			      sb_id * vm->subblock_size;
-	const uint64_t size = count * vm->subblock_size;
+			      sb_id * vm->sbm.sb_size;
+	const uint64_t size = count * vm->sbm.sb_size;
 	int rc;
 
 	rc = virtio_mem_send_unplug_request(vm, addr, size);
@@ -1146,7 +1146,7 @@ static int virtio_mem_mb_unplug_any_sb(struct virtio_mem *vm,
 	int sb_id, count;
 	int rc;
 
-	sb_id = vm->nb_sb_per_mb - 1;
+	sb_id = vm->sbm.sbs_per_mb - 1;
 	while (*nb_sb) {
 		/* Find the next candidate subblock */
 		while (sb_id >= 0 &&
@@ -1181,7 +1181,7 @@ static int virtio_mem_mb_unplug_any_sb(struct virtio_mem *vm,
  */
 static int virtio_mem_mb_unplug(struct virtio_mem *vm, unsigned long mb_id)
 {
-	uint64_t nb_sb = vm->nb_sb_per_mb;
+	uint64_t nb_sb = vm->sbm.sbs_per_mb;
 
 	return virtio_mem_mb_unplug_any_sb(vm, mb_id, &nb_sb);
 }
@@ -1222,7 +1222,7 @@ static int virtio_mem_mb_plug_and_add(struct virtio_mem *vm,
 				      unsigned long mb_id,
 				      uint64_t *nb_sb)
 {
-	const int count = min_t(int, *nb_sb, vm->nb_sb_per_mb);
+	const int count = min_t(int, *nb_sb, vm->sbm.sbs_per_mb);
 	int rc;
 
 	if (WARN_ON_ONCE(!count))
@@ -1240,7 +1240,7 @@ static int virtio_mem_mb_plug_and_add(struct virtio_mem *vm,
 	 * Mark the block properly offline before adding it to Linux,
 	 * so the memory notifiers will find the block in the right state.
 	 */
-	if (count == vm->nb_sb_per_mb)
+	if (count == vm->sbm.sbs_per_mb)
 		virtio_mem_sbm_set_mb_state(vm, mb_id,
 					    VIRTIO_MEM_SBM_MB_OFFLINE);
 	else
@@ -1289,11 +1289,11 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
 
 	while (*nb_sb) {
 		sb_id = virtio_mem_sbm_first_unplugged_sb(vm, mb_id);
-		if (sb_id >= vm->nb_sb_per_mb)
+		if (sb_id >= vm->sbm.sbs_per_mb)
 			break;
 		count = 1;
 		while (count < *nb_sb &&
-		       sb_id + count < vm->nb_sb_per_mb &&
+		       sb_id + count < vm->sbm.sbs_per_mb &&
 		       !virtio_mem_sbm_test_sb_plugged(vm, mb_id, sb_id + count, 1))
 			count++;
 
@@ -1306,12 +1306,12 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
 
 		/* fake-online the pages if the memory block is online */
 		pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
-			       sb_id * vm->subblock_size);
-		nr_pages = PFN_DOWN(count * vm->subblock_size);
+			       sb_id * vm->sbm.sb_size);
+		nr_pages = PFN_DOWN(count * vm->sbm.sb_size);
 		virtio_mem_fake_online(pfn, nr_pages);
 	}
 
-	if (virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->nb_sb_per_mb)) {
+	if (virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->sbm.sbs_per_mb)) {
 		if (online)
 			virtio_mem_sbm_set_mb_state(vm, mb_id,
 						    VIRTIO_MEM_SBM_MB_ONLINE);
@@ -1328,7 +1328,7 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
  */
 static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 {
-	uint64_t nb_sb = diff / vm->subblock_size;
+	uint64_t nb_sb = diff / vm->sbm.sb_size;
 	unsigned long mb_id;
 	int rc;
 
@@ -1411,13 +1411,13 @@ static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
 	rc = virtio_mem_mb_unplug_any_sb(vm, mb_id, nb_sb);
 
 	/* some subblocks might have been unplugged even on failure */
-	if (!virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->nb_sb_per_mb))
+	if (!virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->sbm.sbs_per_mb))
 		virtio_mem_sbm_set_mb_state(vm, mb_id,
 					    VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL);
 	if (rc)
 		return rc;
 
-	if (virtio_mem_sbm_test_sb_unplugged(vm, mb_id, 0, vm->nb_sb_per_mb)) {
+	if (virtio_mem_sbm_test_sb_unplugged(vm, mb_id, 0, vm->sbm.sbs_per_mb)) {
 		/*
 		 * Remove the block from Linux - this should never fail.
 		 * Hinder the block from getting onlined by marking it
@@ -1444,12 +1444,12 @@ static int virtio_mem_mb_unplug_sb_online(struct virtio_mem *vm,
 					  unsigned long mb_id, int sb_id,
 					  int count)
 {
-	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size) * count;
+	const unsigned long nr_pages = PFN_DOWN(vm->sbm.sb_size) * count;
 	unsigned long start_pfn;
 	int rc;
 
 	start_pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
-			     sb_id * vm->subblock_size);
+			     sb_id * vm->sbm.sb_size);
 
 	rc = virtio_mem_fake_offline(start_pfn, nr_pages);
 	if (rc)
@@ -1485,19 +1485,19 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
 	int rc, sb_id;
 
 	/* If possible, try to unplug the complete block in one shot. */
-	if (*nb_sb >= vm->nb_sb_per_mb &&
-	    virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->nb_sb_per_mb)) {
+	if (*nb_sb >= vm->sbm.sbs_per_mb &&
+	    virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->sbm.sbs_per_mb)) {
 		rc = virtio_mem_mb_unplug_sb_online(vm, mb_id, 0,
-						    vm->nb_sb_per_mb);
+						    vm->sbm.sbs_per_mb);
 		if (!rc) {
-			*nb_sb -= vm->nb_sb_per_mb;
+			*nb_sb -= vm->sbm.sbs_per_mb;
 			goto unplugged;
 		} else if (rc != -EBUSY)
 			return rc;
 	}
 
 	/* Fallback to single subblocks. */
-	for (sb_id = vm->nb_sb_per_mb - 1; sb_id >= 0 && *nb_sb; sb_id--) {
+	for (sb_id = vm->sbm.sbs_per_mb - 1; sb_id >= 0 && *nb_sb; sb_id--) {
 		/* Find the next candidate subblock */
 		while (sb_id >= 0 &&
 		       !virtio_mem_sbm_test_sb_plugged(vm, mb_id, sb_id, 1))
@@ -1519,7 +1519,7 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
 	 * remove it. This will usually not fail, as no memory is in use
 	 * anymore - however some other notifiers might NACK the request.
 	 */
-	if (virtio_mem_sbm_test_sb_unplugged(vm, mb_id, 0, vm->nb_sb_per_mb)) {
+	if (virtio_mem_sbm_test_sb_unplugged(vm, mb_id, 0, vm->sbm.sbs_per_mb)) {
 		mutex_unlock(&vm->hotplug_mutex);
 		rc = virtio_mem_mb_offline_and_remove(vm, mb_id);
 		mutex_lock(&vm->hotplug_mutex);
@@ -1536,7 +1536,7 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
  */
 static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 {
-	uint64_t nb_sb = diff / vm->subblock_size;
+	uint64_t nb_sb = diff / vm->sbm.sb_size;
 	unsigned long mb_id;
 	int rc;
 
@@ -1827,11 +1827,11 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	 * - Is required for now for alloc_contig_range() to work reliably -
 	 *   it doesn't properly handle smaller granularity on ZONE_NORMAL.
 	 */
-	vm->subblock_size = max_t(uint64_t, MAX_ORDER_NR_PAGES,
-				  pageblock_nr_pages) * PAGE_SIZE;
-	vm->subblock_size = max_t(uint64_t, vm->device_block_size,
-				  vm->subblock_size);
-	vm->nb_sb_per_mb = memory_block_size_bytes() / vm->subblock_size;
+	vm->sbm.sb_size = max_t(uint64_t, MAX_ORDER_NR_PAGES,
+				pageblock_nr_pages) * PAGE_SIZE;
+	vm->sbm.sb_size = max_t(uint64_t, vm->device_block_size,
+				vm->sbm.sb_size);
+	vm->sbm.sbs_per_mb = memory_block_size_bytes() / vm->sbm.sb_size;
 
 	/* Round up to the next full memory block */
 	vm->first_mb_id = virtio_mem_phys_to_mb_id(vm->addr - 1 +
@@ -1849,7 +1849,7 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	dev_info(&vm->vdev->dev, "memory block size: 0x%lx",
 		 memory_block_size_bytes());
 	dev_info(&vm->vdev->dev, "subblock size: 0x%llx",
-		 (unsigned long long)vm->subblock_size);
+		 (unsigned long long)vm->sbm.sb_size);
 	if (vm->nid != NUMA_NO_NODE && IS_ENABLED(CONFIG_NUMA))
 		dev_info(&vm->vdev->dev, "nid: %d", vm->nid);
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
