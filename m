Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A5853F027
	for <lists.virtualization@lfdr.de>; Mon,  6 Jun 2022 22:41:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D567C410A1;
	Mon,  6 Jun 2022 20:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70pqN4QeAlOo; Mon,  6 Jun 2022 20:41:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 88249410A2;
	Mon,  6 Jun 2022 20:41:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3947CC002D;
	Mon,  6 Jun 2022 20:41:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F05DC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 20:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D1A04107E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 20:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I28IBHBG6b_u
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 20:41:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD26240992
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 20:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=yRw8leL5SKtlh4++9TxNP+z712DV8+bDADLqGeitGxc=; b=SxeZ3A1uaIsSGG8YQDJB8CVjMo
 RhDHeQ42KfkDop6K5lQE8C+66YcnYa0VCURkfr5ICCpPaphHo5tX2HVRsMSJ7z/xTY+wZggTjRlxM
 R937PSGLmVLf2sFQ9kucQIoWF5+Ip9CCMWv+8GUOStUXo/SYT59CLtTLg4BCyeLkYS+LD24oYkB86
 Gdv1EDhaJPx6MDDS40WYjhcZTnNgKHHs1PsB+4eWq1Zz4JEwiL3j3cAC0I+zzPj1FufrehBgeYqLq
 9LYmEsmuoFe9IPIj9yF3rVW7aVqR5MdddkvzuRgBrp/A1g5lUBKy0RBihHd1nNA/I6c76YD4sjZsD
 zWdPDuag==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWx-00B19a-7W; Mon, 06 Jun 2022 20:40:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 09/20] mm/migrate: Add filemap_migrate_folio()
Date: Mon,  6 Jun 2022 21:40:39 +0100
Message-Id: <20220606204050.2625949-10-willy@infradead.org>
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

There is nothing iomap-specific about iomap_migratepage(), and it fits
a pattern used by several other filesystems, so move it to mm/migrate.c,
convert it to be filemap_migrate_folio() and convert the iomap filesystems
to use it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/gfs2/aops.c          |  2 +-
 fs/iomap/buffered-io.c  | 25 -------------------------
 fs/xfs/xfs_aops.c       |  2 +-
 fs/zonefs/super.c       |  2 +-
 include/linux/iomap.h   |  6 ------
 include/linux/pagemap.h |  6 ++++++
 mm/migrate.c            | 20 ++++++++++++++++++++
 7 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 106e90a36583..57ff883d432c 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -774,7 +774,7 @@ static const struct address_space_operations gfs2_aops = {
 	.invalidate_folio = iomap_invalidate_folio,
 	.bmap = gfs2_bmap,
 	.direct_IO = noop_direct_IO,
-	.migratepage = iomap_migrate_page,
+	.migrate_folio = filemap_migrate_folio,
 	.is_partially_uptodate = iomap_is_partially_uptodate,
 	.error_remove_page = generic_error_remove_page,
 };
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 66278a14bfa7..5a91aa1db945 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -489,31 +489,6 @@ void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len)
 }
 EXPORT_SYMBOL_GPL(iomap_invalidate_folio);
 
-#ifdef CONFIG_MIGRATION
-int
-iomap_migrate_page(struct address_space *mapping, struct page *newpage,
-		struct page *page, enum migrate_mode mode)
-{
-	struct folio *folio = page_folio(page);
-	struct folio *newfolio = page_folio(newpage);
-	int ret;
-
-	ret = folio_migrate_mapping(mapping, newfolio, folio, 0);
-	if (ret != MIGRATEPAGE_SUCCESS)
-		return ret;
-
-	if (folio_test_private(folio))
-		folio_attach_private(newfolio, folio_detach_private(folio));
-
-	if (mode != MIGRATE_SYNC_NO_COPY)
-		folio_migrate_copy(newfolio, folio);
-	else
-		folio_migrate_flags(newfolio, folio);
-	return MIGRATEPAGE_SUCCESS;
-}
-EXPORT_SYMBOL_GPL(iomap_migrate_page);
-#endif /* CONFIG_MIGRATION */
-
 static void
 iomap_write_failed(struct inode *inode, loff_t pos, unsigned len)
 {
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 8ec38b25187b..5d1a995b15f8 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -570,7 +570,7 @@ const struct address_space_operations xfs_address_space_operations = {
 	.invalidate_folio	= iomap_invalidate_folio,
 	.bmap			= xfs_vm_bmap,
 	.direct_IO		= noop_direct_IO,
-	.migratepage		= iomap_migrate_page,
+	.migrate_folio		= filemap_migrate_folio,
 	.is_partially_uptodate  = iomap_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 	.swap_activate		= xfs_iomap_swapfile_activate,
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index bcb21aea990a..d4c3f28f34ee 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -237,7 +237,7 @@ static const struct address_space_operations zonefs_file_aops = {
 	.dirty_folio		= filemap_dirty_folio,
 	.release_folio		= iomap_release_folio,
 	.invalidate_folio	= iomap_invalidate_folio,
-	.migratepage		= iomap_migrate_page,
+	.migrate_folio		= filemap_migrate_folio,
 	.is_partially_uptodate	= iomap_is_partially_uptodate,
 	.error_remove_page	= generic_error_remove_page,
 	.direct_IO		= noop_direct_IO,
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index e552097c67e0..758a1125e72f 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -231,12 +231,6 @@ void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops);
 bool iomap_is_partially_uptodate(struct folio *, size_t from, size_t count);
 bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags);
 void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len);
-#ifdef CONFIG_MIGRATION
-int iomap_migrate_page(struct address_space *mapping, struct page *newpage,
-		struct page *page, enum migrate_mode mode);
-#else
-#define iomap_migrate_page NULL
-#endif
 int iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
 		const struct iomap_ops *ops);
 int iomap_zero_range(struct inode *inode, loff_t pos, loff_t len,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 1caccb9f99aa..2a67c0ad7348 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -1078,6 +1078,12 @@ static inline int __must_check write_one_page(struct page *page)
 int __set_page_dirty_nobuffers(struct page *page);
 bool noop_dirty_folio(struct address_space *mapping, struct folio *folio);
 
+#ifdef CONFIG_MIGRATION
+int filemap_migrate_folio(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode);
+#else
+#define filemap_migrate_folio NULL
+#endif
 void page_endio(struct page *page, bool is_write, int err);
 
 void folio_end_private_2(struct folio *folio);
diff --git a/mm/migrate.c b/mm/migrate.c
index 6232c291fdb9..148dd0463dec 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -785,6 +785,26 @@ int buffer_migrate_folio_norefs(struct address_space *mapping,
 }
 #endif
 
+int filemap_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
+{
+	int ret;
+
+	ret = folio_migrate_mapping(mapping, dst, src, 0);
+	if (ret != MIGRATEPAGE_SUCCESS)
+		return ret;
+
+	if (folio_get_private(src))
+		folio_attach_private(dst, folio_detach_private(src));
+
+	if (mode != MIGRATE_SYNC_NO_COPY)
+		folio_migrate_copy(dst, src);
+	else
+		folio_migrate_flags(dst, src);
+	return MIGRATEPAGE_SUCCESS;
+}
+EXPORT_SYMBOL_GPL(filemap_migrate_folio);
+
 /*
  * Writeback a folio to clean the dirty state
  */
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
