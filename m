Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDC111D353
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:13:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 13DBC8887F;
	Thu, 12 Dec 2019 17:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6sOSEc9n1tr5; Thu, 12 Dec 2019 17:13:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 256B5887C7;
	Thu, 12 Dec 2019 17:13:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02543C0881;
	Thu, 12 Dec 2019 17:13:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40376C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2E5D486404
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdIY+2tF7zHg
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D58778620F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OlNiGwSLjyhpPrDgVLhkHD+g+UpwIBxO3jpp4RRBJ/s=;
 b=gPZBcL0ziuB7dWmcaI+lqIFIkM0MKa/Efg71x+9KkPqy/sHxabKYERNbueT/C52nSEWIsJ
 RRfPcTwCF/noz+gPQ4kES2UM++z+QtZnBM5J5cIJfvRiayPQyU0EiM2R8Kz5CNjTrU/fgC
 sdN5oD5pPhjSlwj7diFzNLIu1hlmE0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-J_iNCAOUNCGoArk-aVzMdQ-1; Thu, 12 Dec 2019 12:12:51 -0500
X-MC-Unique: J_iNCAOUNCGoArk-aVzMdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E76E8107ACC4;
 Thu, 12 Dec 2019 17:12:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B018B5C548;
 Thu, 12 Dec 2019 17:12:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 06/13] mm: Allow to offline unmovable PageOffline()
 pages via MEM_GOING_OFFLINE
Date: Thu, 12 Dec 2019 18:11:30 +0100
Message-Id: <20191212171137.13872-7-david@redhat.com>
In-Reply-To: <20191212171137.13872-1-david@redhat.com>
References: <20191212171137.13872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 include/linux/page-flags.h | 10 ++++++++++
 mm/memory_hotplug.c        | 41 ++++++++++++++++++++++++++++----------
 mm/page_alloc.c            | 24 ++++++++++++++++++++++
 mm/page_isolation.c        |  9 +++++++++
 4 files changed, 74 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 1bf83c8fcaa7..ac1775082343 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -761,6 +761,16 @@ PAGE_TYPE_OPS(Buddy, buddy)
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
index fc617ad6f035..da01453a04e6 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1231,11 +1231,15 @@ int test_pages_in_a_zone(unsigned long start_pfn, unsigned long end_pfn,
 
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
 
@@ -1247,18 +1251,29 @@ static unsigned long scan_movable_pages(unsigned long start, unsigned long end)
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
 
@@ -1528,7 +1543,8 @@ static int __ref __offline_pages(unsigned long start_pfn,
 	}
 
 	do {
-		for (pfn = start_pfn; pfn;) {
+		pfn = start_pfn;
+		do {
 			if (signal_pending(current)) {
 				ret = -EINTR;
 				reason = "signal backoff";
@@ -1538,14 +1554,19 @@ static int __ref __offline_pages(unsigned long start_pfn,
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
index 5334decc9e06..840c0bbe2d9f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8256,6 +8256,19 @@ bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
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
 
@@ -8683,6 +8696,17 @@ __offline_isolated_pages(unsigned long start_pfn, unsigned long end_pfn)
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
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
