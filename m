Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 19330181EFA
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 18:16:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BECE988A33;
	Wed, 11 Mar 2020 17:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZX9V4CiG8ds; Wed, 11 Mar 2020 17:16:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2EB0C88A29;
	Wed, 11 Mar 2020 17:16:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BFDFC0177;
	Wed, 11 Mar 2020 17:16:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D7F0C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8938E859D9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Vc8S4jpBtdS
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6D8FC859CF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583946963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUPkyWfPObsIY0DZQSPrijCHG7LExrL/8dv4FXU4BII=;
 b=MNSvGa62zad2XrxSnyj1FmF847iS4PZOgEKlK0BMUMS70PTrLGw7DhTU/YQnoJTUJNIoXw
 H0b7iw+Pm23/kzg++2BU9FU0LHucXVHrJhR+Ugi6XQJwAhLHpFE0db5WfzFfGUF2FywvKz
 zScx+pm9U5VqbjhwsNq66v4j4ZqD1FM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-Ixxu5hKKP4a_cCK4Z25P4A-1; Wed, 11 Mar 2020 13:15:59 -0400
X-MC-Unique: Ixxu5hKKP4a_cCK4Z25P4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FE19DBA3;
 Wed, 11 Mar 2020 17:15:57 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-132.ams2.redhat.com [10.36.116.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3209592D2D;
 Wed, 11 Mar 2020 17:15:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] virtio-mem: Paravirtualized memory hotunplug part 2
Date: Wed, 11 Mar 2020 18:14:16 +0100
Message-Id: <20200311171422.10484-5-david@redhat.com>
In-Reply-To: <20200311171422.10484-1-david@redhat.com>
References: <20200311171422.10484-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: virtio-dev@lists.oasis-open.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org, Dave Young <dyoung@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>
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

We also want to unplug online memory (contained in online memory blocks
and, therefore, managed by the buddy), and eventually replug it later.

When requested to unplug memory, we use alloc_contig_range() to allocate
subblocks in online memory blocks (so we are the owner) and send them to
our hypervisor. When requested to plug memory, we can replug such memory
using free_contig_range() after asking our hypervisor.

We also want to mark all allocated pages PG_offline, so nobody will
touch them. To differentiate pages that were never onlined when
onlining the memory block from pages allocated via alloc_contig_range(), we
use PageDirty(). Based on this flag, virtio_mem_fake_online() can either
online the pages for the first time or use free_contig_range().

It is worth noting that there are no guarantees on how much memory can
actually get unplugged again. All device memory might completely be
fragmented with unmovable data, such that no subblock can get unplugged.

We are not touching the ZONE_MOVABLE. If memory is onlined to the
ZONE_MOVABLE, it can only get unplugged after that memory was offlined
manually by user space. In normal operation, virtio-mem memory is
suggested to be onlined to ZONE_NORMAL. In the future, we will try to
make unplug more likely to succeed.

Add a module parameter to control if online memory shall be touched.

As we want to access alloc_contig_range()/free_contig_range() from
kernel module context, export the symbols.

Note: Whenever virtio-mem uses alloc_contig_range(), all affected pages
are on the same node, in the same zone, and contain no holes.

Acked-by: Michal Hocko <mhocko@suse.com> # to export contig range allocator API
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Alexander Potapenko <glider@google.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/Kconfig      |   1 +
 drivers/virtio/virtio_mem.c | 157 ++++++++++++++++++++++++++++++++----
 mm/page_alloc.c             |   2 +
 3 files changed, 146 insertions(+), 14 deletions(-)

diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 95ea2094a6b4..6af35ffb9796 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -72,6 +72,7 @@ config VIRTIO_MEM
 	depends on VIRTIO
 	depends on MEMORY_HOTPLUG_SPARSE
 	depends on MEMORY_HOTREMOVE
+	select CONTIG_ALLOC
 	help
 	 This driver provides access to virtio-mem paravirtualized memory
 	 devices, allowing to hotplug and hotunplug memory.
diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index c1fc7f9c4acf..5b26d57be551 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -22,6 +22,10 @@
 
 #include <acpi/acpi_numa.h>
 
+static bool unplug_online = true;
+module_param(unplug_online, bool, 0644);
+MODULE_PARM_DESC(unplug_online, "Try to unplug online memory");
+
 enum virtio_mem_mb_state {
 	/* Unplugged, not added to Linux. Can be reused later. */
 	VIRTIO_MEM_MB_STATE_UNUSED = 0,
@@ -652,23 +656,35 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 }
 
 /*
- * Set a range of pages PG_offline.
+ * Set a range of pages PG_offline. Remember pages that were never onlined
+ * (via generic_online_page()) using PageDirty().
  */
 static void virtio_mem_set_fake_offline(unsigned long pfn,
-					unsigned int nr_pages)
+					unsigned int nr_pages, bool onlined)
 {
-	for (; nr_pages--; pfn++)
-		__SetPageOffline(pfn_to_page(pfn));
+	for (; nr_pages--; pfn++) {
+		struct page *page = pfn_to_page(pfn);
+
+		__SetPageOffline(page);
+		if (!onlined)
+			SetPageDirty(page);
+	}
 }
 
 /*
- * Clear PG_offline from a range of pages.
+ * Clear PG_offline from a range of pages. If the pages were never onlined,
+ * (via generic_online_page()), clear PageDirty().
  */
 static void virtio_mem_clear_fake_offline(unsigned long pfn,
-					  unsigned int nr_pages)
+					  unsigned int nr_pages, bool onlined)
 {
-	for (; nr_pages--; pfn++)
-		__ClearPageOffline(pfn_to_page(pfn));
+	for (; nr_pages--; pfn++) {
+		struct page *page = pfn_to_page(pfn);
+
+		__ClearPageOffline(page);
+		if (!onlined)
+			ClearPageDirty(page);
+	}
 }
 
 /*
@@ -684,10 +700,26 @@ static void virtio_mem_fake_online(unsigned long pfn, unsigned int nr_pages)
 	 * We are always called with subblock granularity, which is at least
 	 * aligned to MAX_ORDER - 1.
 	 */
-	virtio_mem_clear_fake_offline(pfn, nr_pages);
+	for (i = 0; i < nr_pages; i += 1 << order) {
+		struct page *page = pfn_to_page(pfn + i);
 
-	for (i = 0; i < nr_pages; i += 1 << order)
-		generic_online_page(pfn_to_page(pfn + i), order);
+		/*
+		 * If the page is PageDirty(), it was kept fake-offline when
+		 * onlining the memory block. Otherwise, it was allocated
+		 * using alloc_contig_range(). All pages in a subblock are
+		 * alike.
+		 */
+		if (PageDirty(page)) {
+			virtio_mem_clear_fake_offline(pfn + i, 1 << order,
+						      false);
+			generic_online_page(page, order);
+		} else {
+			virtio_mem_clear_fake_offline(pfn + i, 1 << order,
+						      true);
+			free_contig_range(pfn + i, 1 << order);
+			adjust_managed_page_count(page, 1 << order);
+		}
+	}
 }
 
 static void virtio_mem_online_page_cb(struct page *page, unsigned int order)
@@ -716,7 +748,8 @@ static void virtio_mem_online_page_cb(struct page *page, unsigned int order)
 		if (virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id, 1))
 			generic_online_page(page, order);
 		else
-			virtio_mem_set_fake_offline(PFN_DOWN(addr), 1 << order);
+			virtio_mem_set_fake_offline(PFN_DOWN(addr), 1 << order,
+						    false);
 		rcu_read_unlock();
 		return;
 	}
@@ -1184,6 +1217,72 @@ static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
 	return 0;
 }
 
+/*
+ * Unplug the desired number of plugged subblocks of an online memory block.
+ * Will skip subblock that are busy.
+ *
+ * Will modify the state of the memory block.
+ *
+ * Note: Can fail after some subblocks were successfully unplugged. Can
+ *       return 0 even if subblocks were busy and could not get unplugged.
+ */
+static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
+					      unsigned long mb_id,
+					      uint64_t *nb_sb)
+{
+	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
+	unsigned long start_pfn;
+	int rc, sb_id;
+
+	/*
+	 * TODO: To increase the performance we want to try bigger, consecutive
+	 * subblocks first before falling back to single subblocks. Also,
+	 * we should sense via something like is_mem_section_removable()
+	 * first if it makes sense to go ahead any try to allocate.
+	 */
+	for (sb_id = 0; sb_id < vm->nb_sb_per_mb && *nb_sb; sb_id++) {
+		/* Find the next candidate subblock */
+		while (sb_id < vm->nb_sb_per_mb &&
+		       !virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id, 1))
+			sb_id++;
+		if (sb_id >= vm->nb_sb_per_mb)
+			break;
+
+		start_pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
+				     sb_id * vm->subblock_size);
+		rc = alloc_contig_range(start_pfn, start_pfn + nr_pages,
+					MIGRATE_MOVABLE, GFP_KERNEL);
+		if (rc == -ENOMEM)
+			/* whoops, out of memory */
+			return rc;
+		if (rc)
+			/* memory busy, we can't unplug this chunk */
+			continue;
+
+		/* Mark it as fake-offline before unplugging it */
+		virtio_mem_set_fake_offline(start_pfn, nr_pages, true);
+		adjust_managed_page_count(pfn_to_page(start_pfn), -nr_pages);
+
+		/* Try to unplug the allocated memory */
+		rc = virtio_mem_mb_unplug_sb(vm, mb_id, sb_id, 1);
+		if (rc) {
+			/* Return the memory to the buddy. */
+			virtio_mem_fake_online(start_pfn, nr_pages);
+			return rc;
+		}
+
+		virtio_mem_mb_set_state(vm, mb_id,
+					VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL);
+		*nb_sb -= 1;
+	}
+
+	/*
+	 * TODO: Once all subblocks of a memory block were unplugged, we want
+	 * to offline the memory block and remove it.
+	 */
+	return 0;
+}
+
 /*
  * Try to unplug the requested amount of memory.
  */
@@ -1223,8 +1322,37 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 		cond_resched();
 	}
 
+	if (!unplug_online) {
+		mutex_unlock(&vm->hotplug_mutex);
+		return 0;
+	}
+
+	/* Try to unplug subblocks of partially plugged online blocks. */
+	virtio_mem_for_each_mb_state_rev(vm, mb_id,
+					 VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL) {
+		rc = virtio_mem_mb_unplug_any_sb_online(vm, mb_id,
+							&nb_sb);
+		if (rc || !nb_sb)
+			goto out_unlock;
+		mutex_unlock(&vm->hotplug_mutex);
+		cond_resched();
+		mutex_lock(&vm->hotplug_mutex);
+	}
+
+	/* Try to unplug subblocks of plugged online blocks. */
+	virtio_mem_for_each_mb_state_rev(vm, mb_id,
+					 VIRTIO_MEM_MB_STATE_ONLINE) {
+		rc = virtio_mem_mb_unplug_any_sb_online(vm, mb_id,
+							&nb_sb);
+		if (rc || !nb_sb)
+			goto out_unlock;
+		mutex_unlock(&vm->hotplug_mutex);
+		cond_resched();
+		mutex_lock(&vm->hotplug_mutex);
+	}
+
 	mutex_unlock(&vm->hotplug_mutex);
-	return 0;
+	return nb_sb ? -EBUSY : 0;
 out_unlock:
 	mutex_unlock(&vm->hotplug_mutex);
 	return rc;
@@ -1330,7 +1458,8 @@ static void virtio_mem_run_wq(struct work_struct *work)
 	case -EBUSY:
 		/*
 		 * The hypervisor cannot process our request right now
-		 * (e.g., out of memory, migrating).
+		 * (e.g., out of memory, migrating) or we cannot free up
+		 * any memory to unplug it (all plugged memory is busy).
 		 */
 	case -ENOMEM:
 		/* Out of memory, try again later. */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 79e950d76ffc..8d7be3f33e26 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8597,6 +8597,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 				pfn_max_align_up(end), migratetype);
 	return ret;
 }
+EXPORT_SYMBOL(alloc_contig_range);
 
 static int __alloc_contig_pages(unsigned long start_pfn,
 				unsigned long nr_pages, gfp_t gfp_mask)
@@ -8712,6 +8713,7 @@ void free_contig_range(unsigned long pfn, unsigned int nr_pages)
 	}
 	WARN(count != 0, "%d pages are still in use!\n", count);
 }
+EXPORT_SYMBOL(free_contig_range);
 
 /*
  * The zone indicated has a new number of managed_pages; batch sizes and percpu
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
