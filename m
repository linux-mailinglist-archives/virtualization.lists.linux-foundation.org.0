Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDA239E7EC
	for <lists.virtualization@lfdr.de>; Mon,  7 Jun 2021 21:56:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16D20605CC;
	Mon,  7 Jun 2021 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NYTLXusnc0dU; Mon,  7 Jun 2021 19:56:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0CE7607AD;
	Mon,  7 Jun 2021 19:56:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61505C0001;
	Mon,  7 Jun 2021 19:56:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77817C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 19:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57D93402F6
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 19:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usmIKT4TNitC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 19:56:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44D49402F4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 19:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623095769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBRyKH+TukClaBVkwLX0kf8mbFpZlnUd1fSIQqYuk3U=;
 b=O2B3YSy4BnEhKG48V5u0CorPtoK6BQDOrHYnZfbr0dk7j8G5gInM/icEcwUopO0WObMK5W
 qxHscm7Yinn++GJBuVdNlWaqOs1JTNjctgO2BPCgpPkPuezkiNBzQzybU96ksMt4ztNwMO
 GKEoVA75XO5HQt1Fyu27KGDDbiD+gIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-lzZa2HAzObmxWqNwUwfM7g-1; Mon, 07 Jun 2021 15:56:08 -0400
X-MC-Unique: lzZa2HAzObmxWqNwUwfM7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C30B19253C5;
 Mon,  7 Jun 2021 19:56:05 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45E0F10013C1;
 Mon,  7 Jun 2021 19:55:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/12] mm/memory_hotplug: memory group aware "auto-movable"
 online policy
Date: Mon,  7 Jun 2021 21:54:29 +0200
Message-Id: <20210607195430.48228-12-david@redhat.com>
In-Reply-To: <20210607195430.48228-1-david@redhat.com>
References: <20210607195430.48228-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Use memory groups to improve our "auto-movable" onlining policy:

1. For static memory groups (e.g., a DIMM), online a memory block MOVABLE
   only if all other memory blocks in the group are either MOVABLE or could
   be onlined MOVABLE. A DIMM will either be MOVABLE or not, not a mixture.

2. For dynamic memory groups (e.g., a virtio-mem device), online a
   memory block MOVABLE only if all other memory blocks inside the
   current unit are either MOVABLE or could be onlined MOVABLE. For a
   virtio-mem device with a device block size with 512 MiB, all 128 MiB
   memory blocks wihin a 512 MiB unit will either be MOVABLE or not, not
   a mixture.

We have to pass the memory group to zone_for_pfn_range() to take the
memory group into account.

Note: for now, there seems to be no compelling reason to make this
behavior configurable.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c          | 18 +++++++------
 include/linux/memory_hotplug.h |  3 ++-
 mm/memory_hotplug.c            | 48 +++++++++++++++++++++++++++++++---
 3 files changed, 57 insertions(+), 12 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index d8ea448e5fb8..ae70d4005fe2 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -182,7 +182,8 @@ static int memory_block_online(struct memory_block *mem)
 	struct zone *zone;
 	int ret;
 
-	zone = zone_for_pfn_range(mem->online_type, mem->nid, start_pfn, nr_pages);
+	zone = zone_for_pfn_range(mem->online_type, mem->nid, mem->group,
+				  start_pfn, nr_pages);
 
 	/*
 	 * Although vmemmap pages have a different lifecycle than the pages
@@ -379,12 +380,13 @@ static ssize_t phys_device_show(struct device *dev,
 
 #ifdef CONFIG_MEMORY_HOTREMOVE
 static int print_allowed_zone(char *buf, int len, int nid,
+			      struct memory_group *group,
 			      unsigned long start_pfn, unsigned long nr_pages,
 			      int online_type, struct zone *default_zone)
 {
 	struct zone *zone;
 
-	zone = zone_for_pfn_range(online_type, nid, start_pfn, nr_pages);
+	zone = zone_for_pfn_range(online_type, nid, group, start_pfn, nr_pages);
 	if (zone == default_zone)
 		return 0;
 
@@ -397,9 +399,10 @@ static ssize_t valid_zones_show(struct device *dev,
 	struct memory_block *mem = to_memory_block(dev);
 	unsigned long start_pfn = section_nr_to_pfn(mem->start_section_nr);
 	unsigned long nr_pages = PAGES_PER_SECTION * sections_per_block;
+	struct memory_group *group = mem->group;
 	struct zone *default_zone;
+	int nid = mem->nid;
 	int len = 0;
-	int nid;
 
 	/*
 	 * Check the existing zone. Make sure that we do that only on the
@@ -418,14 +421,13 @@ static ssize_t valid_zones_show(struct device *dev,
 		goto out;
 	}
 
-	nid = mem->nid;
-	default_zone = zone_for_pfn_range(MMOP_ONLINE, nid, start_pfn,
-					  nr_pages);
+	default_zone = zone_for_pfn_range(MMOP_ONLINE, nid, group,
+					  start_pfn, nr_pages);
 
 	len += sysfs_emit_at(buf, len, "%s", default_zone->name);
-	len += print_allowed_zone(buf, len, nid, start_pfn, nr_pages,
+	len += print_allowed_zone(buf, len, nid, group, start_pfn, nr_pages,
 				  MMOP_ONLINE_KERNEL, default_zone);
-	len += print_allowed_zone(buf, len, nid, start_pfn, nr_pages,
+	len += print_allowed_zone(buf, len, nid, group, start_pfn, nr_pages,
 				  MMOP_ONLINE_MOVABLE, default_zone);
 out:
 	len += sysfs_emit_at(buf, len, "\n");
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index f607d6677873..73d5aead39fc 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -375,7 +375,8 @@ extern void sparse_remove_section(struct mem_section *ms,
 extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
 					  unsigned long pnum);
 extern struct zone *zone_for_pfn_range(int online_type, int nid,
-		unsigned long start_pfn, unsigned long nr_pages);
+		struct memory_group *group, unsigned long start_pfn,
+		unsigned long nr_pages);
 extern int arch_create_linear_mapping(int nid, u64 start, u64 size,
 				      struct mhp_params *params);
 void arch_remove_linear_mapping(u64 start, u64 size);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 5dacb0ed2997..5a3ad9cb48a3 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -976,12 +976,53 @@ static struct zone *default_kernel_zone_for_pfn(int nid, unsigned long start_pfn
  *    "present pages" is an upper limit that can get reached at runtime. As
  *    we base our calculations on KERNEL_EARLY, this is not an issue.
  */
-static struct zone *auto_movable_zone_for_pfn(int nid, unsigned long pfn,
+static struct zone *auto_movable_zone_for_pfn(int nid,
+					      struct memory_group *group,
+					      unsigned long pfn,
 					      unsigned long nr_pages)
 {
+	unsigned long online_pages = 0, max_pages, end_pfn;
+	struct page *page;
+
 	if (!auto_movable_ratio)
 		goto kernel_zone;
 
+	if (group && !group->is_dynamic) {
+		max_pages = group->s.max_pages;
+		online_pages = group->present_movable_pages;
+
+		/* If anything is !MOVABLE online the rest !MOVABLE. */
+		if (group->present_kernel_pages)
+			goto kernel_zone;
+	} else if (!group || group->d.unit_pages == nr_pages) {
+		max_pages = nr_pages;
+	} else {
+		max_pages = group->d.unit_pages;
+		/*
+		 * Take a look at all online sections in the current unit.
+		 * We can safely assume that all pages within a section belong
+		 * to the same zone, because dynamic memory groups only deal
+		 * with hotplugged memory.
+		 */
+		pfn = ALIGN_DOWN(pfn, group->d.unit_pages);
+		end_pfn = pfn + group->d.unit_pages;
+		for (; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
+			page = pfn_to_online_page(pfn);
+			if (!page)
+				continue;
+			/* If anything is !MOVABLE online the rest !MOVABLE. */
+			if (page_zonenum(page) != ZONE_MOVABLE)
+				goto kernel_zone;
+			online_pages += PAGES_PER_SECTION;
+		}
+	}
+
+	/*
+	 * Online MOVABLE if we could *currently* online all remaining parts
+	 * MOVABLE. We expect to (add+) online them immediately next, so if
+	 * nobody interferes, all will be MOVABLE if possible.
+	 */
+	nr_pages = max_pages - online_pages;
 	if (!auto_movable_can_online_movable(NUMA_NO_NODE, nr_pages))
 		goto kernel_zone;
 
@@ -1021,7 +1062,8 @@ static inline struct zone *default_zone_for_pfn(int nid, unsigned long start_pfn
 }
 
 struct zone *zone_for_pfn_range(int online_type, int nid,
-		unsigned long start_pfn, unsigned long nr_pages)
+		struct memory_group *group, unsigned long start_pfn,
+		unsigned long nr_pages)
 {
 	if (online_type == MMOP_ONLINE_KERNEL)
 		return default_kernel_zone_for_pfn(nid, start_pfn, nr_pages);
@@ -1030,7 +1072,7 @@ struct zone *zone_for_pfn_range(int online_type, int nid,
 		return &NODE_DATA(nid)->node_zones[ZONE_MOVABLE];
 
 	if (online_policy == ONLINE_POLICY_AUTO_MOVABLE)
-		return auto_movable_zone_for_pfn(nid, start_pfn, nr_pages);
+		return auto_movable_zone_for_pfn(nid, group, start_pfn, nr_pages);
 
 	return default_zone_for_pfn(nid, start_pfn, nr_pages);
 }
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
