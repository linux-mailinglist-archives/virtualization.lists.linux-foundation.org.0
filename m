Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA3461225
	for <lists.virtualization@lfdr.de>; Mon, 29 Nov 2021 11:22:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72C90832E8;
	Mon, 29 Nov 2021 10:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Zdsrhtg2qUi; Mon, 29 Nov 2021 10:22:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2497C8332A;
	Mon, 29 Nov 2021 10:22:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 329E7C0040;
	Mon, 29 Nov 2021 10:22:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 282EBC001C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 10:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1702460A71
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 10:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eP2BAlAlq4cR
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 10:22:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1576060A67
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 10:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=JeGTBYwcFtstkkTYN7zPtjhm0Z/PelxPkiqUh7H0zqQ=; b=dzcSOz0IrhcFRwdVJibR8SZhSV
 451ezHdSdw4eTCkZD7OCDn5+Ej1io5AYoie4ocwZzVFkxLxsXx3yMXMFTlhYoE6wv1wKPA1p7oZU2
 ciW9nJBm6S1j6OybZ7eaOR/eSwsQuCctU+umtLyQODfiveM+Tl56eoZxAvFx9NtIinkPrUVx6E6F5
 NcfAD8UMm7WYtD49ZeJlN+qEzVonh3KonFFfvqqVWRq0uH0xByCFa+Oa0J5SrFMgWow8imMGkIfRh
 spSOawn6irEVlYvrSf9n3jTge/OW5bJWB7YN44zKKR7BpizLRCSIqU4oc4PWs8i+g/Pk6Tuh9Hrn5
 npvDywKw==;
Received: from [2001:4bb8:184:4a23:724a:c057:c7bf:4643] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdnz-0073XX-Rx; Mon, 29 Nov 2021 10:22:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 26/29] fsdax: shift partition offset handling into the file
 systems
Date: Mon, 29 Nov 2021 11:22:00 +0100
Message-Id: <20211129102203.2243509-27-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129102203.2243509-1-hch@lst.de>
References: <20211129102203.2243509-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 Gao Xiang <hsiangkao@linux.alibaba.com>, linux-ext4@vger.kernel.org,
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

Remove the last user of ->bdev in dax.c by requiring the file system to
pass in an address that already includes the DAX offset.  As part of the
only set ->bdev or ->daxdev when actually required in the ->iomap_begin
methods.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com> [erofs]
---
 fs/dax.c            |  6 +-----
 fs/erofs/data.c     | 11 +++++++++--
 fs/erofs/internal.h |  1 +
 fs/ext2/inode.c     |  8 ++++++--
 fs/ext4/inode.c     | 16 +++++++++++-----
 fs/xfs/xfs_iomap.c  | 10 ++++++++--
 6 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 148e8b0967f35..e0eecd8e3a8f8 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -711,11 +711,7 @@ int dax_invalidate_mapping_entry_sync(struct address_space *mapping,
 
 static pgoff_t dax_iomap_pgoff(const struct iomap *iomap, loff_t pos)
 {
-	phys_addr_t paddr = iomap->addr + (pos & PAGE_MASK) - iomap->offset;
-
-	if (iomap->bdev)
-		paddr += (get_start_sect(iomap->bdev) << SECTOR_SHIFT);
-	return PHYS_PFN(paddr);
+	return PHYS_PFN(iomap->addr + (pos & PAGE_MASK) - iomap->offset);
 }
 
 static int copy_cow_page_dax(struct vm_fault *vmf, const struct iomap_iter *iter)
diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 0e35ef3f9f3d7..9b1bb177ce303 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -159,6 +159,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
 	/* primary device by default */
 	map->m_bdev = sb->s_bdev;
 	map->m_daxdev = EROFS_SB(sb)->dax_dev;
+	map->m_dax_part_off = EROFS_SB(sb)->dax_part_off;
 
 	if (map->m_deviceid) {
 		down_read(&devs->rwsem);
@@ -169,6 +170,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
 		}
 		map->m_bdev = dif->bdev;
 		map->m_daxdev = dif->dax_dev;
+		map->m_dax_part_off = dif->dax_part_off;
 		up_read(&devs->rwsem);
 	} else if (devs->extra_devices) {
 		down_read(&devs->rwsem);
@@ -185,6 +187,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
 				map->m_pa -= startoff;
 				map->m_bdev = dif->bdev;
 				map->m_daxdev = dif->dax_dev;
+				map->m_dax_part_off = dif->dax_part_off;
 				break;
 			}
 		}
@@ -215,9 +218,13 @@ static int erofs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (ret)
 		return ret;
 
-	iomap->bdev = mdev.m_bdev;
-	iomap->dax_dev = mdev.m_daxdev;
 	iomap->offset = map.m_la;
+	if (flags & IOMAP_DAX) {
+		iomap->dax_dev = mdev.m_daxdev;
+		iomap->offset += mdev.m_dax_part_off;
+	} else {
+		iomap->bdev = mdev.m_bdev;
+	}
 	iomap->length = map.m_llen;
 	iomap->flags = 0;
 	iomap->private = NULL;
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index c1e65346e9f15..5c2a83876220c 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -438,6 +438,7 @@ static inline int z_erofs_map_blocks_iter(struct inode *inode,
 struct erofs_map_dev {
 	struct block_device *m_bdev;
 	struct dax_device *m_daxdev;
+	u64 m_dax_part_off;
 
 	erofs_off_t m_pa;
 	unsigned int m_deviceid;
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 01d69618277de..602578b72d8c5 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -817,9 +817,11 @@ static int ext2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		return ret;
 
 	iomap->flags = 0;
-	iomap->bdev = inode->i_sb->s_bdev;
 	iomap->offset = (u64)first_block << blkbits;
-	iomap->dax_dev = sbi->s_daxdev;
+	if (flags & IOMAP_DAX)
+		iomap->dax_dev = sbi->s_daxdev;
+	else
+		iomap->bdev = inode->i_sb->s_bdev;
 
 	if (ret == 0) {
 		iomap->type = IOMAP_HOLE;
@@ -828,6 +830,8 @@ static int ext2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	} else {
 		iomap->type = IOMAP_MAPPED;
 		iomap->addr = (u64)bno << blkbits;
+		if (flags & IOMAP_DAX)
+			iomap->addr += sbi->s_dax_part_off;
 		iomap->length = (u64)ret << blkbits;
 		iomap->flags |= IOMAP_F_MERGED;
 	}
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 89c4a174bd393..ccafcbc146d3e 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3272,7 +3272,7 @@ static bool ext4_inode_datasync_dirty(struct inode *inode)
 
 static void ext4_set_iomap(struct inode *inode, struct iomap *iomap,
 			   struct ext4_map_blocks *map, loff_t offset,
-			   loff_t length)
+			   loff_t length, unsigned int flags)
 {
 	u8 blkbits = inode->i_blkbits;
 
@@ -3289,8 +3289,10 @@ static void ext4_set_iomap(struct inode *inode, struct iomap *iomap,
 	if (map->m_flags & EXT4_MAP_NEW)
 		iomap->flags |= IOMAP_F_NEW;
 
-	iomap->bdev = inode->i_sb->s_bdev;
-	iomap->dax_dev = EXT4_SB(inode->i_sb)->s_daxdev;
+	if (flags & IOMAP_DAX)
+		iomap->dax_dev = EXT4_SB(inode->i_sb)->s_daxdev;
+	else
+		iomap->bdev = inode->i_sb->s_bdev;
 	iomap->offset = (u64) map->m_lblk << blkbits;
 	iomap->length = (u64) map->m_len << blkbits;
 
@@ -3310,9 +3312,13 @@ static void ext4_set_iomap(struct inode *inode, struct iomap *iomap,
 	if (map->m_flags & EXT4_MAP_UNWRITTEN) {
 		iomap->type = IOMAP_UNWRITTEN;
 		iomap->addr = (u64) map->m_pblk << blkbits;
+		if (flags & IOMAP_DAX)
+			iomap->addr += EXT4_SB(inode->i_sb)->s_dax_part_off;
 	} else if (map->m_flags & EXT4_MAP_MAPPED) {
 		iomap->type = IOMAP_MAPPED;
 		iomap->addr = (u64) map->m_pblk << blkbits;
+		if (flags & IOMAP_DAX)
+			iomap->addr += EXT4_SB(inode->i_sb)->s_dax_part_off;
 	} else {
 		iomap->type = IOMAP_HOLE;
 		iomap->addr = IOMAP_NULL_ADDR;
@@ -3421,7 +3427,7 @@ static int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (ret < 0)
 		return ret;
 out:
-	ext4_set_iomap(inode, iomap, &map, offset, length);
+	ext4_set_iomap(inode, iomap, &map, offset, length, flags);
 
 	return 0;
 }
@@ -3541,7 +3547,7 @@ static int ext4_iomap_begin_report(struct inode *inode, loff_t offset,
 		delalloc = ext4_iomap_is_delalloc(inode, &map);
 
 set_iomap:
-	ext4_set_iomap(inode, iomap, &map, offset, length);
+	ext4_set_iomap(inode, iomap, &map, offset, length, flags);
 	if (delalloc && iomap->type == IOMAP_HOLE)
 		iomap->type = IOMAP_DELALLOC;
 
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 0ed3e7674353b..e552ce541ec2d 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -71,15 +71,21 @@ xfs_bmbt_to_iomap(
 		iomap->type = IOMAP_DELALLOC;
 	} else {
 		iomap->addr = BBTOB(xfs_fsb_to_db(ip, imap->br_startblock));
+		if (mapping_flags & IOMAP_DAX)
+			iomap->addr += target->bt_dax_part_off;
+
 		if (imap->br_state == XFS_EXT_UNWRITTEN)
 			iomap->type = IOMAP_UNWRITTEN;
 		else
 			iomap->type = IOMAP_MAPPED;
+
 	}
 	iomap->offset = XFS_FSB_TO_B(mp, imap->br_startoff);
 	iomap->length = XFS_FSB_TO_B(mp, imap->br_blockcount);
-	iomap->bdev = target->bt_bdev;
-	iomap->dax_dev = target->bt_daxdev;
+	if (mapping_flags & IOMAP_DAX)
+		iomap->dax_dev = target->bt_daxdev;
+	else
+		iomap->bdev = target->bt_bdev;
 	iomap->flags = iomap_flags;
 
 	if (xfs_ipincount(ip) &&
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
