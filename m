Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8102E1C86C6
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 12:32:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DE238846A;
	Thu,  7 May 2020 10:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCXpIPmH-4tS; Thu,  7 May 2020 10:32:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4235088469;
	Thu,  7 May 2020 10:32:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A4A0C07FF;
	Thu,  7 May 2020 10:32:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23910C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1B31426016
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FdImc0YFMNQU
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:32:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 9AB82255A6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588847567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VI5FDOKvzqc1QdgSwRSrint2RerDOYu/MyEf4QkeMfk=;
 b=anyU5q/u0d6ajLoDIaeooxjJVBQ46sS+necu4bMopCfACkiJZ+cNmJ+6HzPRknmcPZSBv/
 9LTpPspvVWMQS8G9yeIN31+35nBk+1veLu3Aa1Czdb1zg5zG/4o8Zh9MMLI2GKXnB9v2d2
 4huX/NbQzHRf7Cuqi6bP1HkxS67oUEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-aagEcJtEPLu31L3e7AZM3Q-1; Thu, 07 May 2020 06:32:45 -0400
X-MC-Unique: aagEcJtEPLu31L3e7AZM3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C4D81005510;
 Thu,  7 May 2020 10:32:42 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF4CE5D9C5;
 Thu,  7 May 2020 10:32:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/15] mm: Allow to offline unmovable PageOffline() pages
 via MEM_GOING_OFFLINE
Date: Thu,  7 May 2020 12:31:09 +0200
Message-Id: <20200507103119.11219-6-david@redhat.com>
In-Reply-To: <20200507103119.11219-1-david@redhat.com>
References: <20200507103119.11219-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Pingfan Liu <kernelfans@gmail.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtio-dev@lists.oasis-open.org, Mike Rapoport <rppt@linux.ibm.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
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

virtio-mem wants to allow to offline memory blocks of which some parts
were unplugged (allocated via alloc_contig_range()), especially, to later
offline and remove completely unplugged memory blocks. The important part
is that PageOffline() has to remain set until the section is offline, so
these pages will never get accessed (e.g., when dumping). The pages should
not be handed back to the buddy (which would require clearing PageOffline()
and result in issues if offlining fails and the pages are suddenly in the
buddy).

Let's allow to do that by allowing to isolate any PageOffline() page
when offlining. This way, we can reach the memory hotplug notifier
MEM_GOING_OFFLINE, where the driver can signal that he is fine with
offlining this page by dropping its reference count. PageOffline() pages
with a reference count of 0 can then be skipped when offlining the
pages (like if they were free, however they are not in the buddy).

Anybody who uses PageOffline() pages and does not agree to offline them
(e.g., Hyper-V balloon, XEN balloon, VMWare balloon for 2MB pages) will not
decrement the reference count and make offlining fail when trying to
migrate such an unmovable page. So there should be no observable change.
Same applies to balloon compaction users (movable PageOffline() pages), the
pages will simply be migrated.

Note 1: If offlining fails, a driver has to increment the reference
	count again in MEM_CANCEL_OFFLINE.

Note 2: A driver that makes use of this has to be aware that re-onlining
	the memory block has to be handled by hooking into onlining code
	(online_page_callback_t), resetting the page PageOffline() and
	not giving them to the buddy.

Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Tested-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Pavel Tatashin <pavel.tatashin@microsoft.com>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Qian Cai <cai@lca.pw>
Cc: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 10 +++++++++
 mm/memory_hotplug.c        | 44 +++++++++++++++++++++++++++++---------
 mm/page_alloc.c            | 24 +++++++++++++++++++++
 mm/page_isolation.c        |  9 ++++++++
 4 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 222f6f7b2bb3..6be1aa559b1e 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -777,6 +777,16 @@ PAGE_TYPE_OPS(Buddy, buddy)
  * not onlined when onlining the section).
  * The content of these pages is effectively stale. Such pages should not
  * be touched (read/write/dump/save) except by their owner.
+ *
+ * If a driver wants to allow to offline unmovable PageOffline() pages without
+ * putting them back to the buddy, it can do so via the memory notifier by
+ * decrementing the reference count in MEM_GOING_OFFLINE and incrementing the
+ * reference count in MEM_CANCEL_OFFLINE. When offlining, the PageOffline()
+ * pages (now with a reference count of zero) are treated like free pages,
+ * allowing the containing memory block to get offlined. A driver that
+ * relies on this feature is aware that re-onlining the memory block will
+ * require to re-set the pages PageOffline() and not giving them to the
+ * buddy via online_page_callback_t.
  */
 PAGE_TYPE_OPS(Offline, offline)
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 555137bd0882..936bfe208a6e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1151,11 +1151,17 @@ struct zone *test_pages_in_a_zone(unsigned long start_pfn,
 
 /*
  * Scan pfn range [start,end) to find movable/migratable pages (LRU pages,
- * non-lru movable pages and hugepages). We scan pfn because it's much
- * easier than scanning over linked list. This function returns the pfn
- * of the first found movable page if it's found, otherwise 0.
+ * non-lru movable pages and hugepages). Will skip over most unmovable
+ * pages (esp., pages that can be skipped when offlining), but bail out on
+ * definitely unmovable pages.
+ *
+ * Returns:
+ *	0 in case a movable page is found and movable_pfn was updated.
+ *	-ENOENT in case no movable page was found.
+ *	-EBUSY in case a definitely unmovable page was found.
  */
-static unsigned long scan_movable_pages(unsigned long start, unsigned long end)
+static int scan_movable_pages(unsigned long start, unsigned long end,
+			      unsigned long *movable_pfn)
 {
 	unsigned long pfn;
 
@@ -1167,18 +1173,30 @@ static unsigned long scan_movable_pages(unsigned long start, unsigned long end)
 			continue;
 		page = pfn_to_page(pfn);
 		if (PageLRU(page))
-			return pfn;
+			goto found;
 		if (__PageMovable(page))
-			return pfn;
+			goto found;
+
+		/*
+		 * PageOffline() pages that are not marked __PageMovable() and
+		 * have a reference count > 0 (after MEM_GOING_OFFLINE) are
+		 * definitely unmovable. If their reference count would be 0,
+		 * they could at least be skipped when offlining memory.
+		 */
+		if (PageOffline(page) && page_count(page))
+			return -EBUSY;
 
 		if (!PageHuge(page))
 			continue;
 		head = compound_head(page);
 		if (page_huge_active(head))
-			return pfn;
+			goto found;
 		skip = compound_nr(head) - (page - head);
 		pfn += skip - 1;
 	}
+	return -ENOENT;
+found:
+	*movable_pfn = pfn;
 	return 0;
 }
 
@@ -1441,7 +1459,8 @@ static int __ref __offline_pages(unsigned long start_pfn,
 	}
 
 	do {
-		for (pfn = start_pfn; pfn;) {
+		pfn = start_pfn;
+		do {
 			if (signal_pending(current)) {
 				ret = -EINTR;
 				reason = "signal backoff";
@@ -1451,14 +1470,19 @@ static int __ref __offline_pages(unsigned long start_pfn,
 			cond_resched();
 			lru_add_drain_all();
 
-			pfn = scan_movable_pages(pfn, end_pfn);
-			if (pfn) {
+			ret = scan_movable_pages(pfn, end_pfn, &pfn);
+			if (!ret) {
 				/*
 				 * TODO: fatal migration failures should bail
 				 * out
 				 */
 				do_migrate_range(pfn, end_pfn);
 			}
+		} while (!ret);
+
+		if (ret != -ENOENT) {
+			reason = "unmovable page";
+			goto failed_removal_isolated;
 		}
 
 		/*
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 64fcaf86763b..6fb3dfca2a97 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8230,6 +8230,19 @@ struct page *has_unmovable_pages(struct zone *zone, struct page *page,
 		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
 			continue;
 
+		/*
+		 * We treat all PageOffline() pages as movable when offlining
+		 * to give drivers a chance to decrement their reference count
+		 * in MEM_GOING_OFFLINE in order to indicate that these pages
+		 * can be offlined as there are no direct references anymore.
+		 * For actually unmovable PageOffline() where the driver does
+		 * not support this, we will fail later when trying to actually
+		 * move these pages that still have a reference count > 0.
+		 * (false negatives in this function only)
+		 */
+		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
+			continue;
+
 		if (__PageMovable(page) || PageLRU(page))
 			continue;
 
@@ -8650,6 +8663,17 @@ __offline_isolated_pages(unsigned long start_pfn, unsigned long end_pfn)
 			offlined_pages++;
 			continue;
 		}
+		/*
+		 * At this point all remaining PageOffline() pages have a
+		 * reference count of 0 and can simply be skipped.
+		 */
+		if (PageOffline(page)) {
+			BUG_ON(page_count(page));
+			BUG_ON(PageBuddy(page));
+			pfn++;
+			offlined_pages++;
+			continue;
+		}
 
 		BUG_ON(page_count(page));
 		BUG_ON(!PageBuddy(page));
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 2c11a38d6e87..f6d07c5f0d34 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -151,6 +151,7 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  *			a bit mask)
  *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
  *					 e.g., skip over PageHWPoison() pages
+ *					 and PageOffline() pages.
  *			REPORT_FAILURE - report details about the failure to
  *			isolate the range
  *
@@ -259,6 +260,14 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
 		else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
 			/* A HWPoisoned page cannot be also PageBuddy */
 			pfn++;
+		else if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
+			 !page_count(page))
+			/*
+			 * The responsible driver agreed to skip PageOffline()
+			 * pages when offlining memory by dropping its
+			 * reference in MEM_GOING_OFFLINE.
+			 */
+			pfn++;
 		else
 			break;
 	}
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
