Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA828B509
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 14:54:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1FE2873AF;
	Mon, 12 Oct 2020 12:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id humbOq0T9Rtz; Mon, 12 Oct 2020 12:54:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 626B9873CE;
	Mon, 12 Oct 2020 12:54:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41500C0051;
	Mon, 12 Oct 2020 12:54:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD23EC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B77998721F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKeC+t1vAKra
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:53:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C3F7F873C1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602507236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RvlIrmP7pDfti7mpO1J7dVgqWMijPzb2nPlsVawRGOw=;
 b=T9JnB6yu++9DISYdKtaTxFnFJFFJrsIEoLrR41nefWZ3CkMfJz6DFBuTHnvt9Y3bxXyjj4
 YVJyAWSoZImiIMwXTMAYesqaKn077ZOcLIYbqnjd2kKHKE5AFLodk6kU21JSqDeooY9QKD
 00vrdHe0CD1SZNM+cFDTgHl+L6zHIFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-eBDLZPd9Nq2ptRftjy7E_g-1; Mon, 12 Oct 2020 08:53:54 -0400
X-MC-Unique: eBDLZPd9Nq2ptRftjy7E_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F9281017DC1;
 Mon, 12 Oct 2020 12:53:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DABB960C07;
 Mon, 12 Oct 2020 12:53:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/29] virtio-mem: determine nid only once using
 memory_add_physaddr_to_nid()
Date: Mon, 12 Oct 2020 14:52:55 +0200
Message-Id: <20201012125323.17509-2-david@redhat.com>
In-Reply-To: <20201012125323.17509-1-david@redhat.com>
References: <20201012125323.17509-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
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

Let's determine the target nid only once in case we have none specified -
usually, we'll end up with node 0 either way.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index ba4de598f663..a1f5bf7a571a 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -70,7 +70,7 @@ struct virtio_mem {
 
 	/* The device block size (for communicating with the device). */
 	uint64_t device_block_size;
-	/* The translated node id. NUMA_NO_NODE in case not specified. */
+	/* The determined node id for all memory of the device. */
 	int nid;
 	/* Physical start address of the memory region. */
 	uint64_t addr;
@@ -406,10 +406,6 @@ static int virtio_mem_sb_bitmap_prepare_next_mb(struct virtio_mem *vm)
 static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 {
 	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id);
-	int nid = vm->nid;
-
-	if (nid == NUMA_NO_NODE)
-		nid = memory_add_physaddr_to_nid(addr);
 
 	/*
 	 * When force-unloading the driver and we still have memory added to
@@ -423,7 +419,8 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 	}
 
 	dev_dbg(&vm->vdev->dev, "adding memory block: %lu\n", mb_id);
-	return add_memory_driver_managed(nid, addr, memory_block_size_bytes(),
+	return add_memory_driver_managed(vm->nid, addr,
+					 memory_block_size_bytes(),
 					 vm->resource_name,
 					 MEMHP_MERGE_RESOURCE);
 }
@@ -440,13 +437,9 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 static int virtio_mem_mb_remove(struct virtio_mem *vm, unsigned long mb_id)
 {
 	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id);
-	int nid = vm->nid;
-
-	if (nid == NUMA_NO_NODE)
-		nid = memory_add_physaddr_to_nid(addr);
 
 	dev_dbg(&vm->vdev->dev, "removing memory block: %lu\n", mb_id);
-	return remove_memory(nid, addr, memory_block_size_bytes());
+	return remove_memory(vm->nid, addr, memory_block_size_bytes());
 }
 
 /*
@@ -461,14 +454,11 @@ static int virtio_mem_mb_offline_and_remove(struct virtio_mem *vm,
 					    unsigned long mb_id)
 {
 	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id);
-	int nid = vm->nid;
-
-	if (nid == NUMA_NO_NODE)
-		nid = memory_add_physaddr_to_nid(addr);
 
 	dev_dbg(&vm->vdev->dev, "offlining and removing memory block: %lu\n",
 		mb_id);
-	return offline_and_remove_memory(nid, addr, memory_block_size_bytes());
+	return offline_and_remove_memory(vm->nid, addr,
+					 memory_block_size_bytes());
 }
 
 /*
@@ -1659,6 +1649,10 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	virtio_cread_le(vm->vdev, struct virtio_mem_config, region_size,
 			&vm->region_size);
 
+	/* Determine the nid for the device based on the lowest address. */
+	if (vm->nid == NUMA_NO_NODE)
+		vm->nid = memory_add_physaddr_to_nid(vm->addr);
+
 	/*
 	 * We always hotplug memory in memory block granularity. This way,
 	 * we have to wait for exactly one memory block to online.
@@ -1707,7 +1701,7 @@ static int virtio_mem_init(struct virtio_mem *vm)
 		 memory_block_size_bytes());
 	dev_info(&vm->vdev->dev, "subblock size: 0x%llx",
 		 (unsigned long long)vm->subblock_size);
-	if (vm->nid != NUMA_NO_NODE)
+	if (vm->nid != NUMA_NO_NODE && IS_ENABLED(CONFIG_NUMA))
 		dev_info(&vm->vdev->dev, "nid: %d", vm->nid);
 
 	return 0;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
