Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D813D3A95
	for <lists.virtualization@lfdr.de>; Fri, 23 Jul 2021 14:52:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B187440613;
	Fri, 23 Jul 2021 12:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BWbi0qVQCIuZ; Fri, 23 Jul 2021 12:52:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C4BDB405FE;
	Fri, 23 Jul 2021 12:52:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D1D3C000E;
	Fri, 23 Jul 2021 12:52:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 126EDC000E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 12:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7C65405FE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 12:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOquRtD8EMYl
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 12:52:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90952405EA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 12:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627044771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SvJnRppTm3d5yptD/KRKnlvbn2BphqrqZDYDtzYzIM=;
 b=Af7CMVfopK3Dd93ubTta10gQVX339ZUTROadO9tZ1CQXVwyZn8m1HXU3v5QrtfAixNodkQ
 YwHEYQXZRPXO0NloFurggBLXzAysyjh8qOpwCio/33DOMEQhei/bh1T0EYt+Zf7MxC6n9k
 B3LAj7rLaFI1pd9FIvzS6JMwjG+ZDkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-fKoyss1fPBaQqzWTrjEFZA-1; Fri, 23 Jul 2021 08:52:50 -0400
X-MC-Unique: fKoyss1fPBaQqzWTrjEFZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7179C10086C4;
 Fri, 23 Jul 2021 12:52:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-253.ams2.redhat.com [10.36.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 876A218432;
 Fri, 23 Jul 2021 12:52:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] drivers/base/memory: introduce "memory groups" to
 logically group memory blocks
Date: Fri, 23 Jul 2021 14:52:04 +0200
Message-Id: <20210723125210.29987-4-david@redhat.com>
In-Reply-To: <20210723125210.29987-1-david@redhat.com>
References: <20210723125210.29987-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Hui Zhu <teawater@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Kedzierski <mkedzier@redhat.com>, Mike Rapoport <rppt@kernel.org>
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

In our "auto-movable" memory onlining policy, we want to make decisions
across memory blocks of a single memory device. Examples of memory devices
include ACPI memory devices (in the simplest case a single DIMM) and
virtio-mem. For now, we don't have a connection between a single memory
block device and the real memory device. Each memory device consists of
1..X memory block devices.

Let's logically group memory blocks belonging to the same memory device
in "memory groups". Memory groups can span multiple physical ranges and a
memory group itself does not contain any information regarding physical
ranges, only properties (e.g., "max_pages") necessary for improved memory
onlining.

Introduce two memory group types:

1) Static memory group: E.g., a single ACPI memory device, consisting of
   1..X memory resources. A memory group consists of 1..Y memory blocks.
   The whole group is added/removed in one go. If any part cannot get
   offlined, the whole group cannot be removed.

2) Dynamic memory group: E.g., a single virtio-mem device. Memory is
   dynamically added/removed in a fixed granularity, called a "unit",
   consisting of 1..X memory blocks. A unit is added/removed in one go.
   If any part of a unit cannot get offlined, the whole unit cannot be
   removed.

In case of 1) we usually want either all memory managed by ZONE_MOVABLE
or none. In case of 2) we usually want to have as many units as possible
managed by ZONE_MOVABLE. We want a single unit to be of the same type.

For now, memory groups are an internal concept that is not exposed to
user space; we might want to change that in the future, though.

add_memory() users can specify a mgid instead of a nid when passing
the MHP_NID_IS_MGID flag.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c          | 102 +++++++++++++++++++++++++++++++--
 include/linux/memory.h         |  46 ++++++++++++++-
 include/linux/memory_hotplug.h |   6 +-
 mm/memory_hotplug.c            |  11 +++-
 4 files changed, 158 insertions(+), 7 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 86ec2dc82fc2..42109e7fb0b5 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -82,6 +82,11 @@ static struct bus_type memory_subsys = {
  */
 static DEFINE_XARRAY(memory_blocks);
 
+/*
+ * Memory groups, indexed by memory group identification (mgid).
+ */
+static DEFINE_XARRAY_FLAGS(memory_groups, XA_FLAGS_ALLOC);
+
 static BLOCKING_NOTIFIER_HEAD(memory_chain);
 
 int register_memory_notifier(struct notifier_block *nb)
@@ -634,7 +639,8 @@ int register_memory(struct memory_block *memory)
 }
 
 static int init_memory_block(unsigned long block_id, unsigned long state,
-			     unsigned long nr_vmemmap_pages)
+			     unsigned long nr_vmemmap_pages,
+			     struct memory_group *group)
 {
 	struct memory_block *mem;
 	int ret = 0;
@@ -653,6 +659,11 @@ static int init_memory_block(unsigned long block_id, unsigned long state,
 	mem->nid = NUMA_NO_NODE;
 	mem->nr_vmemmap_pages = nr_vmemmap_pages;
 
+	if (group) {
+		mem->group = group;
+		refcount_inc(&group->refcount);
+	}
+
 	ret = register_memory(mem);
 
 	return ret;
@@ -671,7 +682,7 @@ static int add_memory_block(unsigned long base_section_nr)
 	if (section_count == 0)
 		return 0;
 	return init_memory_block(memory_block_id(base_section_nr),
-				 MEM_ONLINE, 0);
+				 MEM_ONLINE, 0,  NULL);
 }
 
 static void unregister_memory(struct memory_block *memory)
@@ -681,6 +692,11 @@ static void unregister_memory(struct memory_block *memory)
 
 	WARN_ON(xa_erase(&memory_blocks, memory->dev.id) == NULL);
 
+	if (memory->group) {
+		refcount_dec(&memory->group->refcount);
+		memory->group = NULL;
+	}
+
 	/* drop the ref. we got via find_memory_block() */
 	put_device(&memory->dev);
 	device_unregister(&memory->dev);
@@ -694,7 +710,8 @@ static void unregister_memory(struct memory_block *memory)
  * Called under device_hotplug_lock.
  */
 int create_memory_block_devices(unsigned long start, unsigned long size,
-				unsigned long vmemmap_pages)
+				unsigned long vmemmap_pages,
+				struct memory_group *group)
 {
 	const unsigned long start_block_id = pfn_to_block_id(PFN_DOWN(start));
 	unsigned long end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
@@ -707,7 +724,8 @@ int create_memory_block_devices(unsigned long start, unsigned long size,
 		return -EINVAL;
 
 	for (block_id = start_block_id; block_id != end_block_id; block_id++) {
-		ret = init_memory_block(block_id, MEM_OFFLINE, vmemmap_pages);
+		ret = init_memory_block(block_id, MEM_OFFLINE, vmemmap_pages,
+					group);
 		if (ret)
 			break;
 	}
@@ -891,3 +909,79 @@ int for_each_memory_block(void *arg, walk_memory_blocks_func_t func)
 	return bus_for_each_dev(&memory_subsys, NULL, &cb_data,
 				for_each_memory_block_cb);
 }
+
+static int register_memory_group(struct memory_group group)
+{
+	struct memory_group *new_group;
+	uint32_t mgid;
+	int ret;
+
+	if (!node_possible(group.nid))
+		return -EINVAL;
+
+	new_group = kzalloc(sizeof(group), GFP_KERNEL);
+	if (!new_group)
+		return -ENOMEM;
+	*new_group = group;
+	refcount_set(&new_group->refcount, 1);
+
+	ret = xa_alloc(&memory_groups, &mgid, new_group, xa_limit_31b,
+		       GFP_KERNEL);
+	if (ret)
+		kfree(new_group);
+	return ret ? ret : mgid;
+}
+
+int register_static_memory_group(int nid, unsigned long max_pages)
+{
+	struct memory_group group = {
+		.nid = nid,
+		.s = {
+			.max_pages = max_pages,
+		},
+	};
+
+	if (!max_pages)
+		return -EINVAL;
+	return register_memory_group(group);
+}
+EXPORT_SYMBOL_GPL(register_static_memory_group);
+
+int register_dynamic_memory_group(int nid, unsigned long unit_pages)
+{
+	struct memory_group group = {
+		.nid = nid,
+		.is_dynamic = true,
+		.d = {
+			.unit_pages = unit_pages,
+		},
+	};
+
+	if (!unit_pages || !is_power_of_2(unit_pages) ||
+	    unit_pages < PHYS_PFN(memory_block_size_bytes()))
+		return -EINVAL;
+	return register_memory_group(group);
+}
+EXPORT_SYMBOL_GPL(register_dynamic_memory_group);
+
+int unregister_memory_group(int mgid)
+{
+	struct memory_group *group;
+
+	if (mgid < 0)
+		return -EINVAL;
+
+	group = xa_load(&memory_groups, mgid);
+	if (!group || refcount_read(&group->refcount) > 1)
+		return -EINVAL;
+
+	xa_erase(&memory_groups, mgid);
+	kfree(group);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(unregister_memory_group);
+
+struct memory_group *get_memory_group(int mgid)
+{
+	return xa_load(&memory_groups, mgid);
+}
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 97e92e8b556a..6e20a6174fe5 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -23,6 +23,42 @@
 
 #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
 
+struct memory_group {
+	/* Nid the whole group belongs to. */
+	int nid;
+	/* References from memory blocks + 1. */
+	refcount_t refcount;
+	/*
+	 * Memory group type: static vs. dynamic.
+	 *
+	 * Static: All memory in the group belongs to a single unit, such as,
+	 * a DIMM. All memory belonging to the group will be added in
+	 * one go and removed in one go -- it's static.
+	 *
+	 * Dynamic: Memory within the group is added/removed dynamically in
+	 * units of the specified granularity of at least one memory block.
+	 */
+	bool is_dynamic;
+
+	union {
+		struct {
+			/*
+			 * Maximum number of pages we'll have in this static
+			 * memory group.
+			 */
+			unsigned long max_pages;
+		} s;
+		struct {
+			/*
+			 * Unit in pages in which memory is added/removed in
+			 * this dynamic memory group. This granularity defines
+			 * the alignment of a unit in physical address space.
+			 */
+			unsigned long unit_pages;
+		} d;
+	};
+};
+
 struct memory_block {
 	unsigned long start_section_nr;
 	unsigned long state;		/* serialized by the dev->lock */
@@ -34,6 +70,7 @@ struct memory_block {
 	 * lay at the beginning of the memory block.
 	 */
 	unsigned long nr_vmemmap_pages;
+	struct memory_group *group;	/* group (if any) for this block */
 };
 
 int arch_get_memory_phys_device(unsigned long start_pfn);
@@ -86,7 +123,8 @@ static inline int memory_notify(unsigned long val, void *v)
 extern int register_memory_notifier(struct notifier_block *nb);
 extern void unregister_memory_notifier(struct notifier_block *nb);
 int create_memory_block_devices(unsigned long start, unsigned long size,
-				unsigned long vmemmap_pages);
+				unsigned long vmemmap_pages,
+				struct memory_group *group);
 void remove_memory_block_devices(unsigned long start, unsigned long size);
 extern void memory_dev_init(void);
 extern int memory_notify(unsigned long val, void *v);
@@ -95,6 +133,12 @@ typedef int (*walk_memory_blocks_func_t)(struct memory_block *, void *);
 extern int walk_memory_blocks(unsigned long start, unsigned long size,
 			      void *arg, walk_memory_blocks_func_t func);
 extern int for_each_memory_block(void *arg, walk_memory_blocks_func_t func);
+
+extern int register_static_memory_group(int nid, unsigned long max_pages);
+extern int register_dynamic_memory_group(int nid, unsigned long unit_pages);
+extern int unregister_memory_group(int mgid);
+struct memory_group *get_memory_group(int mgid);
+
 #define CONFIG_MEM_BLOCK_SIZE	(PAGES_PER_SECTION<<PAGE_SHIFT)
 #endif /* CONFIG_MEMORY_HOTPLUG_SPARSE */
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 39b04e99a30e..5beb65497ae3 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -42,7 +42,6 @@ typedef int __bitwise mhp_t;
  * might be stale, or the resource might have changed.
  */
 #define MHP_MERGE_RESOURCE	((__force mhp_t)BIT(0))
-
 /*
  * We want memmap (struct page array) to be self contained.
  * To do so, we will use the beginning of the hot-added range to build
@@ -50,6 +49,11 @@ typedef int __bitwise mhp_t;
  * Only selected architectures support it with SPARSE_VMEMMAP.
  */
 #define MHP_MEMMAP_ON_MEMORY   ((__force mhp_t)BIT(1))
+/*
+ * The nid field specifies a memory group identifier (mgid) instead. The memory
+ * group implies the nid.
+ */
+#define MHP_NID_IS_MGID		((__force mhp_t)BIT(2))
 
 /*
  * Extended parameters for memory hotplug:
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index f50bb720f7fc..b091d21d8796 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1256,6 +1256,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
 	struct vmem_altmap mhp_altmap = {};
+	struct memory_group *group = NULL;
 	u64 start, size;
 	bool new_node = false;
 	int ret;
@@ -1267,6 +1268,13 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	if (ret)
 		return ret;
 
+	if (mhp_flags & MHP_NID_IS_MGID) {
+		group = get_memory_group(nid);
+		if (!group)
+			return -EINVAL;
+		nid = group->nid;
+	}
+
 	if (!node_possible(nid)) {
 		WARN(1, "node %d was absent from the node_possible_map\n", nid);
 		return -EINVAL;
@@ -1301,7 +1309,8 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		goto error;
 
 	/* create memory block devices after memory was added */
-	ret = create_memory_block_devices(start, size, mhp_altmap.alloc);
+	ret = create_memory_block_devices(start, size, mhp_altmap.alloc,
+					  group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
 		goto error;
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
