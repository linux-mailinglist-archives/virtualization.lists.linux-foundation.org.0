Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED073D3A9A
	for <lists.virtualization@lfdr.de>; Fri, 23 Jul 2021 14:53:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E94606C4;
	Fri, 23 Jul 2021 12:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gm6zLdMVOQT5; Fri, 23 Jul 2021 12:53:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 30ACD60664;
	Fri, 23 Jul 2021 12:53:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE66BC000E;
	Fri, 23 Jul 2021 12:53:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDAC8C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 12:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD28360644
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 12:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fz3u13eLZ-rF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 12:53:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A18D60637
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627044789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+tIwdi84scNqrLnAxcZvduiGNQ8ZI5PTLGk0YPEf+8=;
 b=XL9JvM5ByU1Ot2gShAvHthqi3gbt10UviSeqrZlFceXL3tDI968a2fZUOCr2rXnzFQdvb9
 pkSqCDJTtwpdRJuzS133/ECWU5c3Z3+ls56UF8P4aasBF/MFc7LqwqX9kkkNSSPB80ss9u
 8egjYiAUAo//FMaumr03gYlgZylUUC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-3DlRRBo3NwWFWgRoDdi80Q-1; Fri, 23 Jul 2021 08:53:08 -0400
X-MC-Unique: 3DlRRBo3NwWFWgRoDdi80Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01F898799F9;
 Fri, 23 Jul 2021 12:53:06 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-253.ams2.redhat.com [10.36.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDE006A8E4;
 Fri, 23 Jul 2021 12:52:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] mm/memory_hotplug: track present pages in memory groups
Date: Fri, 23 Jul 2021 14:52:05 +0200
Message-Id: <20210723125210.29987-5-david@redhat.com>
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

Let's track all present pages in each memory group. Especially, track
memory present in ZONE_MOVABLE and memory present in one of the kernel
zones (which really only is ZONE_NORMAL right now as memory groups only
apply to hotplugged memory) separately within a memory group, to prepare
for making smart auto-online decision for individual memory blocks within a
memory group based on group statistics.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c          | 10 +++++-----
 include/linux/memory.h         |  4 ++++
 include/linux/memory_hotplug.h | 13 +++++++++----
 mm/memory_hotplug.c            | 19 ++++++++++++++-----
 4 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 42109e7fb0b5..e96c4f436ac3 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -198,7 +198,7 @@ static int memory_block_online(struct memory_block *mem)
 	}
 
 	ret = online_pages(start_pfn + nr_vmemmap_pages,
-			   nr_pages - nr_vmemmap_pages, zone);
+			   nr_pages - nr_vmemmap_pages, zone, mem->group);
 	if (ret) {
 		if (nr_vmemmap_pages)
 			mhp_deinit_memmap_on_memory(start_pfn, nr_vmemmap_pages);
@@ -210,7 +210,7 @@ static int memory_block_online(struct memory_block *mem)
 	 * now already properly populated.
 	 */
 	if (nr_vmemmap_pages)
-		adjust_present_page_count(pfn_to_page(start_pfn),
+		adjust_present_page_count(pfn_to_page(start_pfn), mem->group,
 					  nr_vmemmap_pages);
 
 	return ret;
@@ -228,16 +228,16 @@ static int memory_block_offline(struct memory_block *mem)
 	 * can properly be torn down in offline_pages().
 	 */
 	if (nr_vmemmap_pages)
-		adjust_present_page_count(pfn_to_page(start_pfn),
+		adjust_present_page_count(pfn_to_page(start_pfn), mem->group,
 					  -nr_vmemmap_pages);
 
 	ret = offline_pages(start_pfn + nr_vmemmap_pages,
-			    nr_pages - nr_vmemmap_pages);
+			    nr_pages - nr_vmemmap_pages, mem->group);
 	if (ret) {
 		/* offline_pages() failed. Account back. */
 		if (nr_vmemmap_pages)
 			adjust_present_page_count(pfn_to_page(start_pfn),
-						  nr_vmemmap_pages);
+						  mem->group, nr_vmemmap_pages);
 		return ret;
 	}
 
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 6e20a6174fe5..0eceb8467d9a 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -28,6 +28,10 @@ struct memory_group {
 	int nid;
 	/* References from memory blocks + 1. */
 	refcount_t refcount;
+	/* Present (online) memory outside ZONE_MOVABLE of this memory group. */
+	unsigned long present_kernel_pages;
+	/* Present (online) memory in ZONE_MOVABLE of this memory group. */
+	unsigned long present_movable_pages;
 	/*
 	 * Memory group type: static vs. dynamic.
 	 *
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 5beb65497ae3..23c4d369ad30 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -12,6 +12,7 @@ struct zone;
 struct pglist_data;
 struct mem_section;
 struct memory_block;
+struct memory_group;
 struct resource;
 struct vmem_altmap;
 
@@ -99,13 +100,15 @@ static inline void zone_seqlock_init(struct zone *zone)
 extern int zone_grow_free_lists(struct zone *zone, unsigned long new_nr_pages);
 extern int zone_grow_waitqueues(struct zone *zone, unsigned long nr_pages);
 extern int add_one_highpage(struct page *page, int pfn, int bad_ppro);
-extern void adjust_present_page_count(struct page *page, long nr_pages);
+extern void adjust_present_page_count(struct page *page,
+				      struct memory_group *group,
+				      long nr_pages);
 /* VM interface that may be used by firmware interface */
 extern int mhp_init_memmap_on_memory(unsigned long pfn, unsigned long nr_pages,
 				     struct zone *zone);
 extern void mhp_deinit_memmap_on_memory(unsigned long pfn, unsigned long nr_pages);
 extern int online_pages(unsigned long pfn, unsigned long nr_pages,
-			struct zone *zone);
+			struct zone *zone, struct memory_group *group);
 extern struct zone *test_pages_in_a_zone(unsigned long start_pfn,
 					 unsigned long end_pfn);
 extern void __offline_isolated_pages(unsigned long start_pfn,
@@ -295,7 +298,8 @@ static inline void pgdat_resize_init(struct pglist_data *pgdat) {}
 #ifdef CONFIG_MEMORY_HOTREMOVE
 
 extern void try_offline_node(int nid);
-extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages);
+extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
+			 struct memory_group *group);
 extern int remove_memory(u64 start, u64 size);
 extern void __remove_memory(u64 start, u64 size);
 extern int offline_and_remove_memory(u64 start, u64 size);
@@ -303,7 +307,8 @@ extern int offline_and_remove_memory(u64 start, u64 size);
 #else
 static inline void try_offline_node(int nid) {}
 
-static inline int offline_pages(unsigned long start_pfn, unsigned long nr_pages)
+static inline int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
+				struct memory_group *group)
 {
 	return -EINVAL;
 }
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b091d21d8796..8d556396b5d4 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -913,9 +913,11 @@ struct zone *zone_for_pfn_range(int online_type, int nid,
  * This function should only be called by memory_block_{online,offline},
  * and {online,offline}_pages.
  */
-void adjust_present_page_count(struct page *page, long nr_pages)
+void adjust_present_page_count(struct page *page, struct memory_group *group,
+			       long nr_pages)
 {
 	struct zone *zone = page_zone(page);
+	const bool movable = zone_idx(zone) == ZONE_MOVABLE;
 
 	/*
 	 * We only support onlining/offlining/adding/removing of complete
@@ -925,6 +927,11 @@ void adjust_present_page_count(struct page *page, long nr_pages)
 		zone->present_early_pages += nr_pages;
 	zone->present_pages += nr_pages;
 	zone->zone_pgdat->node_present_pages += nr_pages;
+
+	if (group && movable)
+		group->present_movable_pages += nr_pages;
+	else if (group && !movable)
+		group->present_kernel_pages += nr_pages;
 }
 
 int mhp_init_memmap_on_memory(unsigned long pfn, unsigned long nr_pages,
@@ -970,7 +977,8 @@ void mhp_deinit_memmap_on_memory(unsigned long pfn, unsigned long nr_pages)
 	kasan_remove_zero_shadow(__va(PFN_PHYS(pfn)), PFN_PHYS(nr_pages));
 }
 
-int __ref online_pages(unsigned long pfn, unsigned long nr_pages, struct zone *zone)
+int __ref online_pages(unsigned long pfn, unsigned long nr_pages,
+		       struct zone *zone, struct memory_group *group)
 {
 	unsigned long flags;
 	int need_zonelists_rebuild = 0;
@@ -1023,7 +1031,7 @@ int __ref online_pages(unsigned long pfn, unsigned long nr_pages, struct zone *z
 	}
 
 	online_pages_range(pfn, nr_pages);
-	adjust_present_page_count(pfn_to_page(pfn), nr_pages);
+	adjust_present_page_count(pfn_to_page(pfn), group, nr_pages);
 
 	node_states_set_node(nid, &arg);
 	if (need_zonelists_rebuild)
@@ -1774,7 +1782,8 @@ static int count_system_ram_pages_cb(unsigned long start_pfn,
 	return 0;
 }
 
-int __ref offline_pages(unsigned long start_pfn, unsigned long nr_pages)
+int __ref offline_pages(unsigned long start_pfn, unsigned long nr_pages,
+			struct memory_group *group)
 {
 	const unsigned long end_pfn = start_pfn + nr_pages;
 	unsigned long pfn, system_ram_pages = 0;
@@ -1910,7 +1919,7 @@ int __ref offline_pages(unsigned long start_pfn, unsigned long nr_pages)
 
 	/* removal success */
 	adjust_managed_page_count(pfn_to_page(start_pfn), -nr_pages);
-	adjust_present_page_count(pfn_to_page(start_pfn), -nr_pages);
+	adjust_present_page_count(pfn_to_page(start_pfn), group, -nr_pages);
 
 	/* reinitialise watermarks and update pcp limits */
 	init_per_zone_wmark_min();
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
