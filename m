Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 70442E49E6
	for <lists.virtualization@lfdr.de>; Fri, 25 Oct 2019 13:28:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9612013AC;
	Fri, 25 Oct 2019 11:28:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ADE0513A4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 11:28:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 893AC87B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 11:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572002926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=HArxkJtPIOBshQaysWMUC3fEGLeTEuoQQ4AWnANjOLU=;
	b=GWDZYiLRX8POVGVU2vJ6lZ6X3RplUXkri41lYFxQIY4D8tBaZBfrqywGOtvvI2KSvwCjte
	D598tlBu9zJouQTqvhgid1dJMkM3n2adYoVwpOpMANRYS8lXCNfhNChTil5RLk69dV8jDJ
	YP69hvoJHUnjeWhSM8UNa6B+GqNG7BY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-253-_6DrmxQBPkiBViKFw7BYIQ-1; Fri, 25 Oct 2019 07:28:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C1CC1800DD0;
	Fri, 25 Oct 2019 11:28:32 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-205.ams2.redhat.com [10.36.116.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B5AF60852;
	Fri, 25 Oct 2019 11:28:22 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC] mm: Allow to offline unmovable PageOffline() pages if the
	driver agrees
Date: Fri, 25 Oct 2019 13:28:22 +0200
Message-Id: <20191025112822.7552-1-david@redhat.com>
In-Reply-To: <ba7164c9-b98e-0ce1-358e-8b0d45fe3f48@redhat.com>
References: <ba7164c9-b98e-0ce1-358e-8b0d45fe3f48@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: _6DrmxQBPkiBViKFw7BYIQ-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Pavel Tatashin <pavel.tatashin@microsoft.com>,
	Michal Hocko <mhocko@suse.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Qian Cai <cai@lca.pw>, Johannes Weiner <hannes@cmpxchg.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
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

Let's allow to do that by allowing to isolate any PageOffline() page
when offlining. This way, we can reach the memory hotplug notifier
MEM_GOING_OFFLINE, where the driver can signal that he is fine with
offlining this page by dropping its reference count. PageOffline() pages
with a reference count of 0 can then be skipped when offlining the
pages (like if they were free, however they are not in the buddy).

Anybody who uses PageOffline() pages and does not agree to offline them
(e.g., Hyper-V balloon, XEN balloon, VMWare balloon for 2MB pages) will not
decrement the reference count and make offlining fail when trying to
migrate such an unmovable page. So there should be no observerable change.
Same applies to balloon compaction users (movable PageOffline() pages), the
pages will simply be migrated.

Note 1: If offlining fails, a driver has to increment the reference
	count again in MEM_CANCEL_OFFLINE.

Note 2: A driver that makes use of this has to be aware that re-onlining
	the memory block has to be handled by hooking into onlining code
	(online_page_callback_t), resetting the page PageOffline() and
	not giving them to the buddy.

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

Michal,

this is the approach where we allow has_unmovable_pages() to succeed to
reach MEM_GOING_OFFLINE and fail later in case the driver did not agree.

Thoughts?

---
 include/linux/page-flags.h | 10 ++++++++++
 mm/memory_hotplug.c        | 41 ++++++++++++++++++++++++++++----------
 mm/page_alloc.c            | 24 ++++++++++++++++++++++
 mm/page_isolation.c        |  9 +++++++++
 4 files changed, 74 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 3b8e5c5f7e1f..4897cc585af6 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -757,6 +757,16 @@ PAGE_TYPE_OPS(Buddy, buddy)
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
index 561371ead39a..7a18b0bba045 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1223,11 +1223,15 @@ int test_pages_in_a_zone(unsigned long start_pfn, unsigned long end_pfn,
 
 /*
  * Scan pfn range [start,end) to find movable/migratable pages (LRU pages,
- * non-lru movable pages and hugepages). We scan pfn because it's much
- * easier than scanning over linked list. This function returns the pfn
- * of the first found movable page if it's found, otherwise 0.
+ * non-lru movable pages and hugepages).
+ *
+ * Returns:
+ *	0 in case a movable page is found and movable_pfn was updated.
+ *	-ENOENT in case no movable page was found.
+ *	-EBUSY in case a definetly unmovable page was found.
  */
-static unsigned long scan_movable_pages(unsigned long start, unsigned long end)
+static int scan_movable_pages(unsigned long start, unsigned long end,
+			      unsigned long *movable_pfn)
 {
 	unsigned long pfn;
 
@@ -1239,18 +1243,29 @@ static unsigned long scan_movable_pages(unsigned long start, unsigned long end)
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
+		 * Unmovable PageOffline() pages where somebody still holds
+		 * a reference count (after MEM_GOING_OFFLINE) can definetly
+		 * not be offlined.
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
 
@@ -1496,7 +1511,8 @@ static int __ref __offline_pages(unsigned long start_pfn,
 	}
 
 	do {
-		for (pfn = start_pfn; pfn;) {
+		pfn = start_pfn;
+		do {
 			if (signal_pending(current)) {
 				ret = -EINTR;
 				reason = "signal backoff";
@@ -1506,14 +1522,19 @@ static int __ref __offline_pages(unsigned long start_pfn,
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
index e2b0bdfdd586..1594f480532a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8273,6 +8273,19 @@ bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
 		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
 			continue;
 
+		/*
+		 * We treat all PageOffline() pages as movable when offlining
+		 * to give drivers a chance to decrement their reference count
+		 * in MEM_GOING_OFFLINE in order to signalize that these pages
+		 * can be offlined as there are no direct references anymore.
+		 * For actually unmovable PageOffline() where the driver does
+		 * not support this, we will fail later when trying to actually
+		 * move these pages that still have a reference count > 0.
+		 * (false negatives in this function only)
+		 */
+		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
+			continue;
+
 		if (__PageMovable(page))
 			continue;
 
@@ -8702,6 +8715,17 @@ __offline_isolated_pages(unsigned long start_pfn, unsigned long end_pfn)
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
index 04ee1663cdbe..43b4dabfedc8 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -170,6 +170,7 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  *			a bit mask)
  *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
  *					 e.g., skip over PageHWPoison() pages
+ *					 and PageOffline() pages.
  *			REPORT_FAILURE - report details about the failure to
  *			isolate the range
  *
@@ -278,6 +279,14 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
 		else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
 			/* A HWPoisoned page cannot be also PageBuddy */
 			pfn++;
+		else if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
+			 !page_count(page))
+			/*
+			 * The responsible driver agreed to offline
+			 * PageOffline() pages by dropping its reference in
+			 * MEM_GOING_OFFLINE.
+			 */
+			pfn++;
 		else
 			break;
 	}
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
