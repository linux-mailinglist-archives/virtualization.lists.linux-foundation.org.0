Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A569B7C28
	for <lists.virtualization@lfdr.de>; Thu, 19 Sep 2019 16:23:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 594B7CD5;
	Thu, 19 Sep 2019 14:23:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C0F5CC8E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 14:23:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 92F0D711
	for <virtualization@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 14:23:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D309E31752BB;
	Thu, 19 Sep 2019 14:23:27 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20B3060872;
	Thu, 19 Sep 2019 14:23:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 6/9] mm: Allow to offline PageOffline() pages with a
	reference count of 0
Date: Thu, 19 Sep 2019 16:22:25 +0200
Message-Id: <20190919142228.5483-7-david@redhat.com>
In-Reply-To: <20190919142228.5483-1-david@redhat.com>
References: <20190919142228.5483-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 19 Sep 2019 14:23:28 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Michal Hocko <mhocko@suse.com>, Pingfan Liu <kernelfans@gmail.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Andrea Arcangeli <aarcange@redhat.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, Yu Zhao <yuzhao@google.com>,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Pavel Tatashin <pavel.tatashin@microsoft.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
	Andrey Ryabinin <aryabinin@virtuozzo.com>,
	Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
	Yang Shi <yang.shi@linux.alibaba.com>, Minchan Kim <minchan@kernel.org>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@techsingularity.net>
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

virtio-mem wants to allow to offline memory blocks of which some parts
were unplugged, especially, to later offline and remove completely
unplugged memory blocks. The important part is that PageOffline() has
to remain set until the section is offline, so these pages will never
get accessed (e.g., when dumping). The pages should not be handed
back to the buddy (which would require clearing PageOffline() and
result in issues if offlining fails and the pages are suddenly in the
buddy).

Let's use "PageOffline() + reference count = 0" as a sign to
memory offlining code that these pages can simply be skipped when
offlining, similar to free or HWPoison pages.

Pass flags to test_pages_isolated(), similar as already done for
has_unmovable_pages(). Use a new flag to indicate the
requirement of memory offlining to skip over these special pages.

In has_unmovable_pages(), make sure the pages won't be detected as
movable. This is not strictly necessary, however makes e.g.,
alloc_contig_range() stop early, trying to isolate such page blocks -
compared to failing later when testing if all pages were isolated.

Also, make sure that when a reference to a PageOffline() page is
dropped, that the page will not be returned to the buddy.

memory devices (like virtio-mem) that want to make use of this
functionality have to make sure to synchronize against memory offlining,
using the memory hotplug notifier.

Alternative: Allow to offline with a reference count of 1
and use some other sign in the struct page that offlining is permitted.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Pavel Tatashin <pavel.tatashin@microsoft.com>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Pingfan Liu <kernelfans@gmail.com>
Cc: Qian Cai <cai@lca.pw>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Yu Zhao <yuzhao@google.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Yang Shi <yang.shi@linux.alibaba.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h     |  4 ++++
 include/linux/page-isolation.h |  4 +++-
 mm/memory_hotplug.c            |  9 ++++++---
 mm/page_alloc.c                | 22 +++++++++++++++++++++-
 mm/page_isolation.c            | 18 +++++++++++++-----
 mm/swap.c                      |  9 +++++++++
 6 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index f91cb8898ff0..7e563eab6b4b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -745,6 +745,10 @@ PAGE_TYPE_OPS(Buddy, buddy)
  * not onlined when onlining the section).
  * The content of these pages is effectively stale. Such pages should not
  * be touched (read/write/dump/save) except by their owner.
+ *
+ * PageOffline() pages that have a reference count of 0 will be treated
+ * like free pages when offlining pages, allowing the containing memory
+ * block to get offlined.
  */
 PAGE_TYPE_OPS(Offline, offline)
 
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 1099c2fee20f..024e02b60346 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -32,6 +32,8 @@ static inline bool is_migrate_isolate(int migratetype)
 
 #define SKIP_HWPOISON	0x1
 #define REPORT_FAILURE	0x2
+/* Skip PageOffline() pages with a reference count of 0. */
+#define SKIP_OFFLINE	0x4
 
 bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
 			 int migratetype, int flags);
@@ -58,7 +60,7 @@ undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
  * Test all pages in [start_pfn, end_pfn) are isolated or not.
  */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			bool skip_hwpoisoned_pages);
+			int flags);
 
 struct page *alloc_migrate_target(struct page *page, unsigned long private);
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index f08eb429b8f3..d23ff7c5c96b 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1127,7 +1127,8 @@ static bool is_pageblock_removable_nolock(unsigned long pfn)
 	if (!zone_spans_pfn(zone, pfn))
 		return false;
 
-	return !has_unmovable_pages(zone, page, 0, MIGRATE_MOVABLE, SKIP_HWPOISON);
+	return !has_unmovable_pages(zone, page, 0, MIGRATE_MOVABLE,
+				    SKIP_HWPOISON | SKIP_OFFLINE);
 }
 
 /* Checks if this range of memory is likely to be hot-removable. */
@@ -1344,7 +1345,8 @@ static int
 check_pages_isolated_cb(unsigned long start_pfn, unsigned long nr_pages,
 			void *data)
 {
-	return test_pages_isolated(start_pfn, start_pfn + nr_pages, true);
+	return test_pages_isolated(start_pfn, start_pfn + nr_pages,
+				   SKIP_HWPOISON | SKIP_OFFLINE);
 }
 
 static int __init cmdline_parse_movable_node(char *p)
@@ -1455,7 +1457,8 @@ static int __ref __offline_pages(unsigned long start_pfn,
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
 				       MIGRATE_MOVABLE,
-				       SKIP_HWPOISON | REPORT_FAILURE);
+				       SKIP_HWPOISON | REPORT_FAILURE |
+				       SKIP_OFFLINE);
 	if (ret < 0) {
 		reason = "failure to isolate range";
 		goto failed_removal;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d5d7944954b3..fef74720d8b4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8221,6 +8221,15 @@ bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
 		if (!page_ref_count(page)) {
 			if (PageBuddy(page))
 				iter += (1 << page_order(page)) - 1;
+			/*
+			* Memory devices allow to offline a page if it is
+			* marked PG_offline and has a reference count of 0.
+			* However, the pages are not movable as it would be
+			* required e.g., for alloc_contig_range().
+			*/
+			if (PageOffline(page) && !(flags & SKIP_OFFLINE))
+				if (++found > count)
+					goto unmovable;
 			continue;
 		}
 
@@ -8444,7 +8453,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	}
 
 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, false)) {
+	if (test_pages_isolated(outer_start, end, 0)) {
 		pr_info_ratelimited("%s: [%lx, %lx) PFNs busy\n",
 			__func__, outer_start, end);
 		ret = -EBUSY;
@@ -8563,6 +8572,17 @@ __offline_isolated_pages(unsigned long start_pfn, unsigned long end_pfn)
 			offlined_pages++;
 			continue;
 		}
+		/*
+		 * Memory devices allow to offline a page if it is marked
+		 * PG_offline and has a reference count of 0.
+		 */
+		if (PageOffline(page) && !page_count(page)) {
+			BUG_ON(PageBuddy(page));
+			pfn++;
+			SetPageReserved(page);
+			offlined_pages++;
+			continue;
+		}
 
 		BUG_ON(page_count(page));
 		BUG_ON(!PageBuddy(page));
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 89c19c0feadb..0a75019d7e7c 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -171,6 +171,8 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  *			SKIP_HWPOISON - ignore hwpoison pages
  *			REPORT_FAILURE - report details about the failure to
  *			isolate the range
+ *			SKIP_OFFLINE - ignore PageOffline() pages with a
+ *			reference count of 0
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
  * the range will never be allocated. Any free pages and pages freed in the
@@ -257,7 +259,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
  */
 static unsigned long
 __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
-				  bool skip_hwpoisoned_pages)
+				  int flags)
 {
 	struct page *page;
 
@@ -274,9 +276,16 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
 			 * simple way to verify that as VM_BUG_ON(), though.
 			 */
 			pfn += 1 << page_order(page);
-		else if (skip_hwpoisoned_pages && PageHWPoison(page))
+		else if ((flags & SKIP_HWPOISON) && PageHWPoison(page))
 			/* A HWPoisoned page cannot be also PageBuddy */
 			pfn++;
+		else if ((flags & SKIP_OFFLINE) && PageOffline(page) &&
+			 !page_count(page))
+			/*
+			 * Memory devices allow to offline a page if it is
+			 * marked PG_offline and has a reference count of 0.
+			 */
+			pfn++;
 		else
 			break;
 	}
@@ -286,7 +295,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
 
 /* Caller should ensure that requested range is in a single zone */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			bool skip_hwpoisoned_pages)
+			int isol_flags)
 {
 	unsigned long pfn, flags;
 	struct page *page;
@@ -308,8 +317,7 @@ int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 	/* Check all pages are free or marked as ISOLATED */
 	zone = page_zone(page);
 	spin_lock_irqsave(&zone->lock, flags);
-	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn,
-						skip_hwpoisoned_pages);
+	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, isol_flags);
 	spin_unlock_irqrestore(&zone->lock, flags);
 
 	trace_test_pages_isolated(start_pfn, end_pfn, pfn);
diff --git a/mm/swap.c b/mm/swap.c
index 38c3fa4308e2..f98987656ecc 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -107,6 +107,15 @@ void __put_page(struct page *page)
 		 * not return it to page allocator.
 		 */
 		return;
+	} else if (PageOffline(page)) {
+		/*
+		 * Memory devices allow to offline a page if it is
+		 * marked PG_offline and has a reference count of 0. So if
+		 * somebody puts a reference of such a page and the
+		 * reference count drops to 0, don't return the page to the
+		 * buddy.
+		 */
+		return;
 	}
 
 	if (unlikely(PageCompound(page)))
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
