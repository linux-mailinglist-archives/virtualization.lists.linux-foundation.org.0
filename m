Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E6453F03B
	for <lists.virtualization@lfdr.de>; Mon,  6 Jun 2022 22:41:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FEAD404A5;
	Mon,  6 Jun 2022 20:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6Ixgmq5oZqV; Mon,  6 Jun 2022 20:41:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 63B6641C27;
	Mon,  6 Jun 2022 20:41:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0D40C002D;
	Mon,  6 Jun 2022 20:41:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0349C007F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 20:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1D22840BC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 20:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LVMVxN2JhDq
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 20:41:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A1E884095
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 20:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=quK8OUavZ3OQPvhjOxFusobdtZi/WBT8qXGvQ++yDug=; b=tGIvKVNaAMu+xJKfT56my7OcDx
 h9X6EZkV+3b6YmzNyoYE3J6PNxC8ld3BfaS12Hr37OHw34qvlxQU6NGjNQ/dhsoPlowRv53o4VZC8
 91hwnrb/Zx7IV1o0tPxKat0n3HHdibhLf1anGJsS6EN4ly8FblGaD7fyrz5/ADem0hQXlXK2IoJvA
 sPpCKXuC4FxWa83HkItcygw65l/Lm7ADmBY+uIWsBaElOylJp/RskeiJHQuGZ0eifLCpWGHHcEWMR
 60Qcs3Ka1CFA2jYOxR4TNlZ/5Tzf5uG0HfDIKzfTaxNpzixl4yt2Na7VkKuOo78WUgHz+NeXqWgXa
 nGtfT5aA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWy-00B19w-6M; Mon, 06 Jun 2022 20:40:56 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 20/20] mm/folio-compat: Remove migration compatibility
 functions
Date: Mon,  6 Jun 2022 21:40:50 +0100
Message-Id: <20220606204050.2625949-21-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
MIME-Version: 1.0
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
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

migrate_page_move_mapping(), migrate_page_copy() and migrate_page_states()
are all now unused after converting all the filesystems from
aops->migratepage() to aops->migrate_folio().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/migrate.h | 11 -----------
 mm/folio-compat.c       | 22 ----------------------
 mm/ksm.c                |  2 +-
 3 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 088749471485..4670f3aec232 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -33,12 +33,8 @@ extern int migrate_pages(struct list_head *l, new_page_t new, free_page_t free,
 extern struct page *alloc_migration_target(struct page *page, unsigned long private);
 extern int isolate_movable_page(struct page *page, isolate_mode_t mode);
 
-extern void migrate_page_states(struct page *newpage, struct page *page);
-extern void migrate_page_copy(struct page *newpage, struct page *page);
 int migrate_huge_page_move_mapping(struct address_space *mapping,
 		struct folio *dst, struct folio *src);
-extern int migrate_page_move_mapping(struct address_space *mapping,
-		struct page *newpage, struct page *page, int extra_count);
 void migration_entry_wait_on_locked(swp_entry_t entry, pte_t *ptep,
 				spinlock_t *ptl);
 void folio_migrate_flags(struct folio *newfolio, struct folio *folio);
@@ -59,13 +55,6 @@ static inline struct page *alloc_migration_target(struct page *page,
 static inline int isolate_movable_page(struct page *page, isolate_mode_t mode)
 	{ return -EBUSY; }
 
-static inline void migrate_page_states(struct page *newpage, struct page *page)
-{
-}
-
-static inline void migrate_page_copy(struct page *newpage,
-				     struct page *page) {}
-
 static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 				  struct folio *dst, struct folio *src)
 {
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 20bc15b57d93..458618c7302c 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -51,28 +51,6 @@ void mark_page_accessed(struct page *page)
 }
 EXPORT_SYMBOL(mark_page_accessed);
 
-#ifdef CONFIG_MIGRATION
-int migrate_page_move_mapping(struct address_space *mapping,
-		struct page *newpage, struct page *page, int extra_count)
-{
-	return folio_migrate_mapping(mapping, page_folio(newpage),
-					page_folio(page), extra_count);
-}
-EXPORT_SYMBOL(migrate_page_move_mapping);
-
-void migrate_page_states(struct page *newpage, struct page *page)
-{
-	folio_migrate_flags(page_folio(newpage), page_folio(page));
-}
-EXPORT_SYMBOL(migrate_page_states);
-
-void migrate_page_copy(struct page *newpage, struct page *page)
-{
-	folio_migrate_copy(page_folio(newpage), page_folio(page));
-}
-EXPORT_SYMBOL(migrate_page_copy);
-#endif
-
 bool set_page_writeback(struct page *page)
 {
 	return folio_start_writeback(page_folio(page));
diff --git a/mm/ksm.c b/mm/ksm.c
index 54f78c9eecae..e8f8c1a2bb39 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -712,7 +712,7 @@ static struct page *get_ksm_page(struct stable_node *stable_node,
 	 * however, it might mean that the page is under page_ref_freeze().
 	 * The __remove_mapping() case is easy, again the node is now stale;
 	 * the same is in reuse_ksm_page() case; but if page is swapcache
-	 * in migrate_page_move_mapping(), it might still be our page,
+	 * in folio_migrate_mapping(), it might still be our page,
 	 * in which case it's essential to keep the node.
 	 */
 	while (!get_page_unless_zero(page)) {
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
