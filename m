Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D858244A8E4
	for <lists.virtualization@lfdr.de>; Tue,  9 Nov 2021 09:34:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 777604033F;
	Tue,  9 Nov 2021 08:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tg_1r00z67pT; Tue,  9 Nov 2021 08:34:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D958C40338;
	Tue,  9 Nov 2021 08:34:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB2C7C000E;
	Tue,  9 Nov 2021 08:34:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7251C0012
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A27604034F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVzlTHM1fm7f
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:34:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC59540320
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=dGumlXA8bKenaWXczMrz5P/DlTIFWU6uPrJEsJbZBpA=; b=Ce+9Re7FrclwSe+nEL2ezM+LO2
 4kPTB/AeeMDNXfabLJp4oiZ67cCSpUhrKxzjZP+ob/SX+cVOYo207D22qv0/Am61QvuKpaDUXqRnV
 WaXroLBuaJ/pnSTL/TL8HrZN1ri2P3m2NiPIuMF24pMEbz2G5CwkwnCrgfkSSH9+F3c57VJlSR0dT
 4afAjUP+gtO4JQ1MB3yZQ/qsrmDMmsCNkdotlQXn8YRxVP/2EywmUtgt+KpNH32EWB24MtMdYBqop
 2Tqx8YAhAiibk6OpbICNHDnOfkjcf7BeCI8ti7Jboagd2CJ7s/3AX+Hd6d+l4S++Asy+fJOUBTGwc
 DlMRam9g==;
Received: from [2001:4bb8:19a:7ee7:fb46:2fe1:8652:d9d4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMZr-000sDM-MC; Tue, 09 Nov 2021 08:34:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 27/29] dax: fix up some of the block device related ifdefs
Date: Tue,  9 Nov 2021 09:33:07 +0100
Message-Id: <20211109083309.584081-28-hch@lst.de>
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

The DAX device <-> block device association is only enabled if
CONFIG_BLOCK is enabled.  Update dax.h to account for that and use
the right conditions for the fs_put_dax stub as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dax.h | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/include/linux/dax.h b/include/linux/dax.h
index 90f95deff504d..5568d3dca941b 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -108,28 +108,15 @@ static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
 #endif
 
 struct writeback_control;
-#if IS_ENABLED(CONFIG_FS_DAX)
+#if defined(CONFIG_BLOCK) && defined(CONFIG_FS_DAX)
 int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk);
 void dax_remove_host(struct gendisk *disk);
-
+struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev,
+		u64 *start_off);
 static inline void fs_put_dax(struct dax_device *dax_dev)
 {
 	put_dax(dax_dev);
 }
-
-struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev,
-		u64 *start_off);
-int dax_writeback_mapping_range(struct address_space *mapping,
-		struct dax_device *dax_dev, struct writeback_control *wbc);
-
-struct page *dax_layout_busy_page(struct address_space *mapping);
-struct page *dax_layout_busy_page_range(struct address_space *mapping, loff_t start, loff_t end);
-dax_entry_t dax_lock_page(struct page *page);
-void dax_unlock_page(struct page *page, dax_entry_t cookie);
-int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
-		const struct iomap_ops *ops);
-int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
-		const struct iomap_ops *ops);
 #else
 static inline int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk)
 {
@@ -138,17 +125,29 @@ static inline int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk)
 static inline void dax_remove_host(struct gendisk *disk)
 {
 }
-
-static inline void fs_put_dax(struct dax_device *dax_dev)
-{
-}
-
 static inline struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev,
 		u64 *start_off)
 {
 	return NULL;
 }
+static inline void fs_put_dax(struct dax_device *dax_dev)
+{
+}
+#endif /* CONFIG_BLOCK && CONFIG_FS_DAX */
+
+#if IS_ENABLED(CONFIG_FS_DAX)
+int dax_writeback_mapping_range(struct address_space *mapping,
+		struct dax_device *dax_dev, struct writeback_control *wbc);
 
+struct page *dax_layout_busy_page(struct address_space *mapping);
+struct page *dax_layout_busy_page_range(struct address_space *mapping, loff_t start, loff_t end);
+dax_entry_t dax_lock_page(struct page *page);
+void dax_unlock_page(struct page *page, dax_entry_t cookie);
+int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
+		const struct iomap_ops *ops);
+int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
+		const struct iomap_ops *ops);
+#else
 static inline struct page *dax_layout_busy_page(struct address_space *mapping)
 {
 	return NULL;
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
