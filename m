Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C527944A8B3
	for <lists.virtualization@lfdr.de>; Tue,  9 Nov 2021 09:34:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CE3A402FE;
	Tue,  9 Nov 2021 08:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Onv_Xk9nkPNh; Tue,  9 Nov 2021 08:33:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F24634031F;
	Tue,  9 Nov 2021 08:33:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13922C0039;
	Tue,  9 Nov 2021 08:33:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84D3DC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6763240395
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeDnPhVJi1n5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E004403AC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=P/8+pIo0FkVrwtgDFpUPsLsJeUvAQkFqHJLVpzBiSE4=; b=K49oBVrSLZdtEDaLNPTd3Uclln
 /9ocK6KkEBNIiyPzSxQHVXJemAQ7VukCJ1yGxH2Xes6qwKhj9vU9bn1KvF19X2GQZ1vHpYpT4xrut
 qlCzEOLO/Jl07wPByZYsVz8afW3RS7DwgW+1MQMnvt6dqInODE1pWz88j40j3cuufV8Tdl74NGdXb
 h2+EfpqeEkCL7XqYfeemxVjTjsThQ/lXsLR9vFVCNb9KPXHYweRlU8d25tzAA1Y6cBJLKyQhFQ/8U
 4cBf6QBNHfSUxPEneQ8PlvKVahItYz6XLqr8dfF2aJxxSC0uaKxt8D0IHjB+TLsiS5ASl2ykq0ZB9
 u2YN5PYg==;
Received: from [2001:4bb8:19a:7ee7:fb46:2fe1:8652:d9d4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMZY-000s4w-LX; Tue, 09 Nov 2021 08:33:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 15/29] xfs: add xfs_zero_range and xfs_truncate_page helpers
Date: Tue,  9 Nov 2021 09:32:55 +0100
Message-Id: <20211109083309.584081-16-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211109083309.584081-1-hch@lst.de>
References: <20211109083309.584081-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Shiyang Ruan <ruansy.fnst@fujitsu.com>
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

From: Shiyang Ruan <ruansy.fnst@fujitsu.com>

Add helpers to prepare for using different DAX operations.

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
[hch: split from a larger patch + slight cleanups]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/xfs/xfs_bmap_util.c |  7 +++----
 fs/xfs/xfs_file.c      |  3 +--
 fs/xfs/xfs_iomap.c     | 25 +++++++++++++++++++++++++
 fs/xfs/xfs_iomap.h     |  4 ++++
 fs/xfs/xfs_iops.c      |  7 +++----
 fs/xfs/xfs_reflink.c   |  3 +--
 6 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/fs/xfs/xfs_bmap_util.c b/fs/xfs/xfs_bmap_util.c
index 73a36b7be3bd1..797ea0c8b14e1 100644
--- a/fs/xfs/xfs_bmap_util.c
+++ b/fs/xfs/xfs_bmap_util.c
@@ -1001,7 +1001,7 @@ xfs_free_file_space(
 
 	/*
 	 * Now that we've unmap all full blocks we'll have to zero out any
-	 * partial block at the beginning and/or end.  iomap_zero_range is smart
+	 * partial block at the beginning and/or end.  xfs_zero_range is smart
 	 * enough to skip any holes, including those we just created, but we
 	 * must take care not to zero beyond EOF and enlarge i_size.
 	 */
@@ -1009,15 +1009,14 @@ xfs_free_file_space(
 		return 0;
 	if (offset + len > XFS_ISIZE(ip))
 		len = XFS_ISIZE(ip) - offset;
-	error = iomap_zero_range(VFS_I(ip), offset, len, NULL,
-			&xfs_buffered_write_iomap_ops);
+	error = xfs_zero_range(ip, offset, len, NULL);
 	if (error)
 		return error;
 
 	/*
 	 * If we zeroed right up to EOF and EOF straddles a page boundary we
 	 * must make sure that the post-EOF area is also zeroed because the
-	 * page could be mmap'd and iomap_zero_range doesn't do that for us.
+	 * page could be mmap'd and xfs_zero_range doesn't do that for us.
 	 * Writeback of the eof page will do this, albeit clumsily.
 	 */
 	if (offset + len >= XFS_ISIZE(ip) && offset_in_page(offset + len) > 0) {
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 27594738b0d18..8d4c5ca261bd7 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -437,8 +437,7 @@ xfs_file_write_checks(
 		}
 
 		trace_xfs_zero_eof(ip, isize, iocb->ki_pos - isize);
-		error = iomap_zero_range(inode, isize, iocb->ki_pos - isize,
-				NULL, &xfs_buffered_write_iomap_ops);
+		error = xfs_zero_range(ip, isize, iocb->ki_pos - isize, NULL);
 		if (error)
 			return error;
 	} else
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 093758440ad53..d6d71ae9f2ae4 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -1311,3 +1311,28 @@ xfs_xattr_iomap_begin(
 const struct iomap_ops xfs_xattr_iomap_ops = {
 	.iomap_begin		= xfs_xattr_iomap_begin,
 };
+
+int
+xfs_zero_range(
+	struct xfs_inode	*ip,
+	loff_t			pos,
+	loff_t			len,
+	bool			*did_zero)
+{
+	struct inode		*inode = VFS_I(ip);
+
+	return iomap_zero_range(inode, pos, len, did_zero,
+				&xfs_buffered_write_iomap_ops);
+}
+
+int
+xfs_truncate_page(
+	struct xfs_inode	*ip,
+	loff_t			pos,
+	bool			*did_zero)
+{
+	struct inode		*inode = VFS_I(ip);
+
+	return iomap_truncate_page(inode, pos, did_zero,
+				   &xfs_buffered_write_iomap_ops);
+}
diff --git a/fs/xfs/xfs_iomap.h b/fs/xfs/xfs_iomap.h
index 7d3703556d0e0..f1a281ab9328c 100644
--- a/fs/xfs/xfs_iomap.h
+++ b/fs/xfs/xfs_iomap.h
@@ -20,6 +20,10 @@ xfs_fileoff_t xfs_iomap_eof_align_last_fsb(struct xfs_inode *ip,
 int xfs_bmbt_to_iomap(struct xfs_inode *, struct iomap *,
 		struct xfs_bmbt_irec *, u16);
 
+int xfs_zero_range(struct xfs_inode *ip, loff_t pos, loff_t len,
+		bool *did_zero);
+int xfs_truncate_page(struct xfs_inode *ip, loff_t pos, bool *did_zero);
+
 static inline xfs_filblks_t
 xfs_aligned_fsb_count(
 	xfs_fileoff_t		offset_fsb,
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index a607d6aca5c4d..ab5ef52b2a9ff 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -911,8 +911,8 @@ xfs_setattr_size(
 	 */
 	if (newsize > oldsize) {
 		trace_xfs_zero_eof(ip, oldsize, newsize - oldsize);
-		error = iomap_zero_range(inode, oldsize, newsize - oldsize,
-				&did_zeroing, &xfs_buffered_write_iomap_ops);
+		error = xfs_zero_range(ip, oldsize, newsize - oldsize,
+				&did_zeroing);
 	} else {
 		/*
 		 * iomap won't detect a dirty page over an unwritten block (or a
@@ -924,8 +924,7 @@ xfs_setattr_size(
 						     newsize);
 		if (error)
 			return error;
-		error = iomap_truncate_page(inode, newsize, &did_zeroing,
-				&xfs_buffered_write_iomap_ops);
+		error = xfs_truncate_page(ip, newsize, &did_zeroing);
 	}
 
 	if (error)
diff --git a/fs/xfs/xfs_reflink.c b/fs/xfs/xfs_reflink.c
index cb0edb1d68ef1..facce5c076d83 100644
--- a/fs/xfs/xfs_reflink.c
+++ b/fs/xfs/xfs_reflink.c
@@ -1269,8 +1269,7 @@ xfs_reflink_zero_posteof(
 		return 0;
 
 	trace_xfs_zero_eof(ip, isize, pos - isize);
-	return iomap_zero_range(VFS_I(ip), isize, pos - isize, NULL,
-			&xfs_buffered_write_iomap_ops);
+	return xfs_zero_range(ip, isize, pos - isize, NULL);
 }
 
 /*
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
