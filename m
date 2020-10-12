Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4228B511
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 14:54:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 81A0520766;
	Mon, 12 Oct 2020 12:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kAdwolqFuKC; Mon, 12 Oct 2020 12:54:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D782B2051F;
	Mon, 12 Oct 2020 12:54:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD040C0051;
	Mon, 12 Oct 2020 12:54:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 823F5C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7EDB387466
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUX9xuQYdqea
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:54:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DD0DF873AF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602507256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NYFGEoB0D5neS6f6rfa0Z3nmpIkQE88nmqoYUfXbZU4=;
 b=EpnJ4cpOnnIVo/wFK8tHyDya9+75UbPRr1ClnnlhD9wb4AyL67jD7XWsPvImaVrE1XJXuy
 XrrO4o5EuSydb3HU6H3oqJDOx+Wknr+XO3w/bdI983Fx+3HgUk8dr1yO+WPz17HsM/Yc1K
 Ks3vs14Fch1d1reqOzxudIxsJcvMuWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-28KgtI8SMCK0B0qQ8-jwiA-1; Mon, 12 Oct 2020 08:54:12 -0400
X-MC-Unique: 28KgtI8SMCK0B0qQ8-jwiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DEB664175;
 Mon, 12 Oct 2020 12:54:11 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C74E260C07;
 Mon, 12 Oct 2020 12:54:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/29] virtio-mem: simplify MAX_ORDER - 1 / pageblock_order
 handling
Date: Mon, 12 Oct 2020 14:52:57 +0200
Message-Id: <20201012125323.17509-4-david@redhat.com>
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

Let's use pageblock_nr_pages and MAX_ORDER_NR_PAGES instead where
possible, so we don't have do deal with allocation orders.

Add a comment why we have that restriction for now.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 670b3faf412d..78c2fbcddcf8 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -755,14 +755,15 @@ static void virtio_mem_clear_fake_offline(unsigned long pfn,
  */
 static void virtio_mem_fake_online(unsigned long pfn, unsigned int nr_pages)
 {
-	const int order = MAX_ORDER - 1;
+	const unsigned long max_nr_pages = MAX_ORDER_NR_PAGES;
 	int i;
 
 	/*
-	 * We are always called with subblock granularity, which is at least
-	 * aligned to MAX_ORDER - 1.
+	 * We are always called at least with MAX_ORDER_NR_PAGES
+	 * granularity/alignment (e.g., the way subblocks work). All pages
+	 * inside such a block are alike.
 	 */
-	for (i = 0; i < nr_pages; i += 1 << order) {
+	for (i = 0; i < nr_pages; i += max_nr_pages) {
 		struct page *page = pfn_to_page(pfn + i);
 
 		/*
@@ -772,14 +773,14 @@ static void virtio_mem_fake_online(unsigned long pfn, unsigned int nr_pages)
 		 * alike.
 		 */
 		if (PageDirty(page)) {
-			virtio_mem_clear_fake_offline(pfn + i, 1 << order,
+			virtio_mem_clear_fake_offline(pfn + i, max_nr_pages,
 						      false);
-			generic_online_page(page, order);
+			generic_online_page(page, MAX_ORDER - 1);
 		} else {
-			virtio_mem_clear_fake_offline(pfn + i, 1 << order,
+			virtio_mem_clear_fake_offline(pfn + i, max_nr_pages,
 						      true);
-			free_contig_range(pfn + i, 1 << order);
-			adjust_managed_page_count(page, 1 << order);
+			free_contig_range(pfn + i, max_nr_pages);
+			adjust_managed_page_count(page, max_nr_pages);
 		}
 	}
 }
@@ -792,7 +793,7 @@ static void virtio_mem_online_page_cb(struct page *page, unsigned int order)
 	int sb_id;
 
 	/*
-	 * We exploit here that subblocks have at least MAX_ORDER - 1
+	 * We exploit here that subblocks have at least MAX_ORDER_NR_PAGES.
 	 * size/alignment and that this callback is is called with such a
 	 * size/alignment. So we cannot cross subblocks and therefore
 	 * also not memory blocks.
@@ -1675,13 +1676,15 @@ static int virtio_mem_init(struct virtio_mem *vm)
 			 "Some memory is not addressable. This can make some memory unusable.\n");
 
 	/*
-	 * Calculate the subblock size:
-	 * - At least MAX_ORDER - 1 / pageblock_order.
-	 * - At least the device block size.
-	 * In the worst case, a single subblock per memory block.
+	 * We want subblocks to span at least MAX_ORDER_NR_PAGES and
+	 * pageblock_nr_pages pages. This:
+	 * - Simplifies our page onlining code (virtio_mem_online_page_cb)
+	 *   and fake page onlining code (virtio_mem_fake_online).
+	 * - Is required for now for alloc_contig_range() to work reliably -
+	 *   it doesn't properly handle smaller granularity on ZONE_NORMAL.
 	 */
-	vm->subblock_size = PAGE_SIZE * 1ul << max_t(uint32_t, MAX_ORDER - 1,
-						     pageblock_order);
+	vm->subblock_size = max_t(uint64_t, MAX_ORDER_NR_PAGES,
+				  pageblock_nr_pages) * PAGE_SIZE;
 	vm->subblock_size = max_t(uint64_t, vm->device_block_size,
 				  vm->subblock_size);
 	vm->nb_sb_per_mb = memory_block_size_bytes() / vm->subblock_size;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
