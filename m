Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 669093C5C78
	for <lists.virtualization@lfdr.de>; Mon, 12 Jul 2021 14:42:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB62605A9;
	Mon, 12 Jul 2021 12:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5obeNLZYFiUk; Mon, 12 Jul 2021 12:42:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6234B605D7;
	Mon, 12 Jul 2021 12:42:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8592C000E;
	Mon, 12 Jul 2021 12:42:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE6E1C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Jul 2021 12:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC6034016C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Jul 2021 12:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGFavMlEaXsA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Jul 2021 12:42:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6087C40150
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Jul 2021 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626093748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0FdO9B1qE5YwKXkqC/7tnGLf5JxbTNt5M+hBS1amRE=;
 b=U3ewErcQE7a0FJte9/CNGvG2NJjtKeiUqvBADRhB0hrcNezC41RWeVWqawMUsGSovGDc5I
 fP43D/Fi36BLitpl8s+6+WlV5zq0KODaLS+KodGlorBxjf+NAg1mu3x+Qh9k8EITGhPAir
 ZfocQiD5EgIeuQ+QbP/mrKWlp+/uSCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-I-qdw033PzGdkc0OmRRBOA-1; Mon, 12 Jul 2021 08:42:26 -0400
X-MC-Unique: I-qdw033PzGdkc0OmRRBOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39475100C610;
 Mon, 12 Jul 2021 12:42:21 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-111.rdu2.redhat.com [10.10.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3981C5C1D1;
 Mon, 12 Jul 2021 12:42:00 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] mm/memory_hotplug: remove nid parameter from
 remove_memory() and friends
Date: Mon, 12 Jul 2021 14:40:51 +0200
Message-Id: <20210712124052.26491-4-david@redhat.com>
In-Reply-To: <20210712124052.26491-1-david@redhat.com>
References: <20210712124052.26491-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Michel Lespinasse <michel@lespinasse.org>, nvdimm@lists.linux.dev,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Anton Blanchard <anton@ozlabs.org>, Len Brown <lenb@kernel.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Borislav Petkov <bp@alien8.de>,
 Sergei Trofimovich <slyfox@gentoo.org>, Andy Lutomirski <luto@kernel.org>,
 Jia He <justin.he@arm.com>, Dan Williams <dan.j.williams@intel.com>,
 Michal Hocko <mhocko@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierre Morel <pmorel@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Thomas Gleixner <tglx@linutronix.de>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
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

There is only a single user remaining. We can simply lookup the nid only
used for node offlining purposes when walking our memory blocks. We
don't expect to remove multi-nid ranges; and if we'd ever do, we most
probably don't care about removing multi-nid ranges that actually result
in empty nodes.

If ever required, we can detect the "multi-nid" scenario and simply try
offlining all online nodes.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Scott Cheloha <cheloha@linux.ibm.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-acpi@vger.kernel.org
Cc: nvdimm@lists.linux.dev
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 .../platforms/pseries/hotplug-memory.c        |  9 +++---
 drivers/acpi/acpi_memhotplug.c                |  7 +----
 drivers/dax/kmem.c                            |  3 +-
 drivers/virtio/virtio_mem.c                   |  4 +--
 include/linux/memory_hotplug.h                | 10 +++----
 mm/memory_hotplug.c                           | 28 +++++++++++--------
 6 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 377d852f5a9a..ef5c24b42cf1 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -286,7 +286,7 @@ static int pseries_remove_memblock(unsigned long base, unsigned long memblock_si
 {
 	unsigned long block_sz, start_pfn;
 	int sections_per_block;
-	int i, nid;
+	int i;
 
 	start_pfn = base >> PAGE_SHIFT;
 
@@ -297,10 +297,9 @@ static int pseries_remove_memblock(unsigned long base, unsigned long memblock_si
 
 	block_sz = pseries_memory_block_size();
 	sections_per_block = block_sz / MIN_MEMORY_BLOCK_SIZE;
-	nid = memory_add_physaddr_to_nid(base);
 
 	for (i = 0; i < sections_per_block; i++) {
-		__remove_memory(nid, base, MIN_MEMORY_BLOCK_SIZE);
+		__remove_memory(base, MIN_MEMORY_BLOCK_SIZE);
 		base += MIN_MEMORY_BLOCK_SIZE;
 	}
 
@@ -387,7 +386,7 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 
 	block_sz = pseries_memory_block_size();
 
-	__remove_memory(mem_block->nid, lmb->base_addr, block_sz);
+	__remove_memory(lmb->base_addr, block_sz);
 	put_device(&mem_block->dev);
 
 	/* Update memory regions for memory remove */
@@ -660,7 +659,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	rc = dlpar_online_lmb(lmb);
 	if (rc) {
-		__remove_memory(nid, lmb->base_addr, block_sz);
+		__remove_memory(lmb->base_addr, block_sz);
 		invalidate_lmb_associativity_index(lmb);
 	} else {
 		lmb->flags |= DRCONF_MEM_ASSIGNED;
diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
index 8cc195c4c861..1d01d9414c40 100644
--- a/drivers/acpi/acpi_memhotplug.c
+++ b/drivers/acpi/acpi_memhotplug.c
@@ -239,19 +239,14 @@ static int acpi_memory_enable_device(struct acpi_memory_device *mem_device)
 
 static void acpi_memory_remove_memory(struct acpi_memory_device *mem_device)
 {
-	acpi_handle handle = mem_device->device->handle;
 	struct acpi_memory_info *info, *n;
-	int nid = acpi_get_node(handle);
 
 	list_for_each_entry_safe(info, n, &mem_device->res_list, list) {
 		if (!info->enabled)
 			continue;
 
-		if (nid == NUMA_NO_NODE)
-			nid = memory_add_physaddr_to_nid(info->start_addr);
-
 		acpi_unbind_memory_blocks(info);
-		__remove_memory(nid, info->start_addr, info->length);
+		__remove_memory(info->start_addr, info->length);
 		list_del(&info->list);
 		kfree(info);
 	}
diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index ac231cc36359..99e0f60c4c26 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -156,8 +156,7 @@ static void dev_dax_kmem_remove(struct dev_dax *dev_dax)
 		if (rc)
 			continue;
 
-		rc = remove_memory(dev_dax->target_node, range.start,
-				range_len(&range));
+		rc = remove_memory(range.start, range_len(&range));
 		if (rc == 0) {
 			release_resource(data->res[i]);
 			kfree(data->res[i]);
diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 09ed55de07d7..774986695dc4 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -677,7 +677,7 @@ static int virtio_mem_remove_memory(struct virtio_mem *vm, uint64_t addr,
 
 	dev_dbg(&vm->vdev->dev, "removing memory: 0x%llx - 0x%llx\n", addr,
 		addr + size - 1);
-	rc = remove_memory(vm->nid, addr, size);
+	rc = remove_memory(addr, size);
 	if (!rc) {
 		atomic64_sub(size, &vm->offline_size);
 		/*
@@ -720,7 +720,7 @@ static int virtio_mem_offline_and_remove_memory(struct virtio_mem *vm,
 		"offlining and removing memory: 0x%llx - 0x%llx\n", addr,
 		addr + size - 1);
 
-	rc = offline_and_remove_memory(vm->nid, addr, size);
+	rc = offline_and_remove_memory(addr, size);
 	if (!rc) {
 		atomic64_sub(size, &vm->offline_size);
 		/*
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 010a192298b5..068e3dcf4690 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -292,9 +292,9 @@ static inline void pgdat_resize_init(struct pglist_data *pgdat) {}
 
 extern void try_offline_node(int nid);
 extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages);
-extern int remove_memory(int nid, u64 start, u64 size);
-extern void __remove_memory(int nid, u64 start, u64 size);
-extern int offline_and_remove_memory(int nid, u64 start, u64 size);
+extern int remove_memory(u64 start, u64 size);
+extern void __remove_memory(u64 start, u64 size);
+extern int offline_and_remove_memory(u64 start, u64 size);
 
 #else
 static inline void try_offline_node(int nid) {}
@@ -304,12 +304,12 @@ static inline int offline_pages(unsigned long start_pfn, unsigned long nr_pages)
 	return -EINVAL;
 }
 
-static inline int remove_memory(int nid, u64 start, u64 size)
+static inline int remove_memory(u64 start, u64 size)
 {
 	return -EBUSY;
 }
 
-static inline void __remove_memory(int nid, u64 start, u64 size) {}
+static inline void __remove_memory(u64 start, u64 size) {}
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
 extern void set_zone_contiguous(struct zone *zone);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index f2a9af3af184..388c8627f17f 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1745,7 +1745,9 @@ int __ref offline_pages(unsigned long start_pfn, unsigned long nr_pages)
 static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
 {
 	int ret = !is_memblock_offlined(mem);
+	int *nid = arg;
 
+	*nid = mem->nid;
 	if (unlikely(ret)) {
 		phys_addr_t beginpa, endpa;
 
@@ -1838,12 +1840,12 @@ void try_offline_node(int nid)
 }
 EXPORT_SYMBOL(try_offline_node);
 
-static int __ref try_remove_memory(int nid, u64 start, u64 size)
+static int __ref try_remove_memory(u64 start, u64 size)
 {
-	int rc = 0;
 	struct vmem_altmap mhp_altmap = {};
 	struct vmem_altmap *altmap = NULL;
 	unsigned long nr_vmemmap_pages;
+	int rc = 0, nid = NUMA_NO_NODE;
 
 	BUG_ON(check_hotplug_memory_range(start, size));
 
@@ -1851,8 +1853,12 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
 	 * All memory blocks must be offlined before removing memory.  Check
 	 * whether all memory blocks in question are offline and return error
 	 * if this is not the case.
+	 *
+	 * While at it, determine the nid. Note that if we'd have mixed nodes,
+	 * we'd only try to offline the last determined one -- which is good
+	 * enough for the cases we care about.
 	 */
-	rc = walk_memory_blocks(start, size, NULL, check_memblock_offlined_cb);
+	rc = walk_memory_blocks(start, size, &nid, check_memblock_offlined_cb);
 	if (rc)
 		return rc;
 
@@ -1901,7 +1907,8 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
 
 	release_mem_region_adjustable(start, size);
 
-	try_offline_node(nid);
+	if (nid != NUMA_NO_NODE)
+		try_offline_node(nid);
 
 	mem_hotplug_done();
 	return 0;
@@ -1909,7 +1916,6 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
 
 /**
  * __remove_memory - Remove memory if every memory block is offline
- * @nid: the node ID
  * @start: physical address of the region to remove
  * @size: size of the region to remove
  *
@@ -1917,14 +1923,14 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
  * and online/offline operations before this call, as required by
  * try_offline_node().
  */
-void __remove_memory(int nid, u64 start, u64 size)
+void __remove_memory(u64 start, u64 size)
 {
 
 	/*
 	 * trigger BUG() if some memory is not offlined prior to calling this
 	 * function
 	 */
-	if (try_remove_memory(nid, start, size))
+	if (try_remove_memory(start, size))
 		BUG();
 }
 
@@ -1932,12 +1938,12 @@ void __remove_memory(int nid, u64 start, u64 size)
  * Remove memory if every memory block is offline, otherwise return -EBUSY is
  * some memory is not offline
  */
-int remove_memory(int nid, u64 start, u64 size)
+int remove_memory(u64 start, u64 size)
 {
 	int rc;
 
 	lock_device_hotplug();
-	rc  = try_remove_memory(nid, start, size);
+	rc = try_remove_memory(start, size);
 	unlock_device_hotplug();
 
 	return rc;
@@ -1997,7 +2003,7 @@ static int try_reonline_memory_block(struct memory_block *mem, void *arg)
  * unplugged all memory (so it's no longer in use) and want to offline + remove
  * that memory.
  */
-int offline_and_remove_memory(int nid, u64 start, u64 size)
+int offline_and_remove_memory(u64 start, u64 size)
 {
 	const unsigned long mb_count = size / memory_block_size_bytes();
 	uint8_t *online_types, *tmp;
@@ -2033,7 +2039,7 @@ int offline_and_remove_memory(int nid, u64 start, u64 size)
 	 * This cannot fail as it cannot get onlined in the meantime.
 	 */
 	if (!rc) {
-		rc = try_remove_memory(nid, start, size);
+		rc = try_remove_memory(start, size);
 		if (rc)
 			pr_err("%s: Failed to remove memory: %d", __func__, rc);
 	}
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
