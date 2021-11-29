Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A79461223
	for <lists.virtualization@lfdr.de>; Mon, 29 Nov 2021 11:22:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3D3C403DF;
	Mon, 29 Nov 2021 10:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8J3owxrKxcx; Mon, 29 Nov 2021 10:22:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1E33B40403;
	Mon, 29 Nov 2021 10:22:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 929B2C000A;
	Mon, 29 Nov 2021 10:22:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3A56C003C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 10:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A8C41C61
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 10:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5gwVjkU91HA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 10:22:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5CF941C29
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zUBsd5I71Mwp78WUrvitaAXgLOhLhGTv9iTYj/8iVg8=; b=RTDqfWGdVQE5ZcfpV0sNvp3pGs
 l20lMvlkc8GqSkIKLoQbf3BKRbWA01iAje+dtihmLst9UYKTuyYWIW0uzaRBwet0H13112HM4CU19
 P4k4rbrKBnP+f2JM2Ow9IphThdZUktlQlMF54vSA7feNOEVWK7ClLVZh12oN8BDC0AYRJLTi7cskn
 hAgMVuPO50Dcy4c/hwsuzf6UlqpMysHYrNFgNlkNJPJw6/+8qNs3hxv5KhKye3lRe6U3dTQDrIJhV
 ter8idxgliLs0hnV2z5NPiKiMa7CYE0RCc5dsM7o7OiN1CL7f/V/UUj6t0TJJP6SFbeE6Gen7ISdY
 NFQ1Foyg==;
Received: from [2001:4bb8:184:4a23:724a:c057:c7bf:4643] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdnx-0073Vh-3A; Mon, 29 Nov 2021 10:22:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 24/29] iomap: add a IOMAP_DAX flag
Date: Mon, 29 Nov 2021 11:21:58 +0100
Message-Id: <20211129102203.2243509-25-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129102203.2243509-1-hch@lst.de>
References: <20211129102203.2243509-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>
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

Add a flag so that the file system can easily detect DAX operations
based just on the iomap operation requested instead of looking at
inode state using IS_DAX.  This will be needed to apply the to be
added partition offset only for operations that actually use DAX,
but not things like fiemap that are based on the block device.
In the long run it should also allow turning the bdev, dax_dev
and inline_data into a union.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c              | 7 ++++---
 fs/ext4/inode.c       | 4 ++--
 fs/xfs/xfs_iomap.c    | 7 ++++---
 fs/xfs/xfs_iomap.h    | 3 ++-
 fs/xfs/xfs_pnfs.c     | 2 +-
 include/linux/iomap.h | 5 +++++
 6 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 43d58b4219fd0..148e8b0967f35 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1180,7 +1180,7 @@ int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
 		.inode		= inode,
 		.pos		= pos,
 		.len		= len,
-		.flags		= IOMAP_ZERO,
+		.flags		= IOMAP_DAX | IOMAP_ZERO,
 	};
 	int ret;
 
@@ -1308,6 +1308,7 @@ dax_iomap_rw(struct kiocb *iocb, struct iov_iter *iter,
 		.inode		= iocb->ki_filp->f_mapping->host,
 		.pos		= iocb->ki_pos,
 		.len		= iov_iter_count(iter),
+		.flags		= IOMAP_DAX,
 	};
 	loff_t done = 0;
 	int ret;
@@ -1461,7 +1462,7 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 		.inode		= mapping->host,
 		.pos		= (loff_t)vmf->pgoff << PAGE_SHIFT,
 		.len		= PAGE_SIZE,
-		.flags		= IOMAP_FAULT,
+		.flags		= IOMAP_DAX | IOMAP_FAULT,
 	};
 	vm_fault_t ret = 0;
 	void *entry;
@@ -1570,7 +1571,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 	struct iomap_iter iter = {
 		.inode		= mapping->host,
 		.len		= PMD_SIZE,
-		.flags		= IOMAP_FAULT,
+		.flags		= IOMAP_DAX | IOMAP_FAULT,
 	};
 	vm_fault_t ret = VM_FAULT_FALLBACK;
 	pgoff_t max_pgoff;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index d316a2009489b..89c4a174bd393 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3349,8 +3349,8 @@ static int ext4_iomap_alloc(struct inode *inode, struct ext4_map_blocks *map,
 	 * DAX and direct I/O are the only two operations that are currently
 	 * supported with IOMAP_WRITE.
 	 */
-	WARN_ON(!IS_DAX(inode) && !(flags & IOMAP_DIRECT));
-	if (IS_DAX(inode))
+	WARN_ON(!(flags & (IOMAP_DAX | IOMAP_DIRECT)));
+	if (flags & IOMAP_DAX)
 		m_flags = EXT4_GET_BLOCKS_CREATE_ZERO;
 	/*
 	 * We use i_size instead of i_disksize here because delalloc writeback
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index d6beb1502f8bc..0ed3e7674353b 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -188,6 +188,7 @@ xfs_iomap_write_direct(
 	struct xfs_inode	*ip,
 	xfs_fileoff_t		offset_fsb,
 	xfs_fileoff_t		count_fsb,
+	unsigned int		flags,
 	struct xfs_bmbt_irec	*imap)
 {
 	struct xfs_mount	*mp = ip->i_mount;
@@ -229,7 +230,7 @@ xfs_iomap_write_direct(
 	 * the reserve block pool for bmbt block allocation if there is no space
 	 * left but we need to do unwritten extent conversion.
 	 */
-	if (IS_DAX(VFS_I(ip))) {
+	if (flags & IOMAP_DAX) {
 		bmapi_flags = XFS_BMAPI_CONVERT | XFS_BMAPI_ZERO;
 		if (imap->br_state == XFS_EXT_UNWRITTEN) {
 			force = true;
@@ -620,7 +621,7 @@ imap_needs_alloc(
 	    imap->br_startblock == DELAYSTARTBLOCK)
 		return true;
 	/* we convert unwritten extents before copying the data for DAX */
-	if (IS_DAX(inode) && imap->br_state == XFS_EXT_UNWRITTEN)
+	if ((flags & IOMAP_DAX) && imap->br_state == XFS_EXT_UNWRITTEN)
 		return true;
 	return false;
 }
@@ -826,7 +827,7 @@ xfs_direct_write_iomap_begin(
 	xfs_iunlock(ip, lockmode);
 
 	error = xfs_iomap_write_direct(ip, offset_fsb, end_fsb - offset_fsb,
-			&imap);
+			flags, &imap);
 	if (error)
 		return error;
 
diff --git a/fs/xfs/xfs_iomap.h b/fs/xfs/xfs_iomap.h
index 657cc02290f22..e88dc162c785e 100644
--- a/fs/xfs/xfs_iomap.h
+++ b/fs/xfs/xfs_iomap.h
@@ -12,7 +12,8 @@ struct xfs_inode;
 struct xfs_bmbt_irec;
 
 int xfs_iomap_write_direct(struct xfs_inode *ip, xfs_fileoff_t offset_fsb,
-		xfs_fileoff_t count_fsb, struct xfs_bmbt_irec *imap);
+		xfs_fileoff_t count_fsb, unsigned int flags,
+		struct xfs_bmbt_irec *imap);
 int xfs_iomap_write_unwritten(struct xfs_inode *, xfs_off_t, xfs_off_t, bool);
 xfs_fileoff_t xfs_iomap_eof_align_last_fsb(struct xfs_inode *ip,
 		xfs_fileoff_t end_fsb);
diff --git a/fs/xfs/xfs_pnfs.c b/fs/xfs/xfs_pnfs.c
index 7ce1ea11fc3f3..d6334abbc0b3e 100644
--- a/fs/xfs/xfs_pnfs.c
+++ b/fs/xfs/xfs_pnfs.c
@@ -155,7 +155,7 @@ xfs_fs_map_blocks(
 		xfs_iunlock(ip, lock_flags);
 
 		error = xfs_iomap_write_direct(ip, offset_fsb,
-				end_fsb - offset_fsb, &imap);
+				end_fsb - offset_fsb, 0, &imap);
 		if (error)
 			goto out_unlock;
 
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 6d1b08d0ae930..5b9432f9f79eb 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -141,6 +141,11 @@ struct iomap_page_ops {
 #define IOMAP_NOWAIT		(1 << 5) /* do not block */
 #define IOMAP_OVERWRITE_ONLY	(1 << 6) /* only pure overwrites allowed */
 #define IOMAP_UNSHARE		(1 << 7) /* unshare_file_range */
+#ifdef CONFIG_FS_DAX
+#define IOMAP_DAX		(1 << 8) /* DAX mapping */
+#else
+#define IOMAP_DAX		0
+#endif /* CONFIG_FS_DAX */
 
 struct iomap_ops {
 	/*
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
