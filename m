Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E83E430F46
	for <lists.virtualization@lfdr.de>; Mon, 18 Oct 2021 06:41:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF03140432;
	Mon, 18 Oct 2021 04:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCrMUr-67NiU; Mon, 18 Oct 2021 04:41:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BCD0A4043E;
	Mon, 18 Oct 2021 04:41:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F266C000D;
	Mon, 18 Oct 2021 04:41:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED5D1C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 04:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF4424039B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 04:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SriUsusKrnW8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 04:41:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 152C5403AE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 04:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uLDzNdvlUbSBrRvj7vTZ1yPi5zMIqLpGLzeD42SrdLE=; b=0LfreBwXIkRrDhpgGOavc0Sbac
 u8D5ZpvkjcMW8tJZH/vGcwrYnvFPYF4DfR5bj3rFCMQZeNjyi8QzpTni2uL7Qs6KlEMxLAXGyHKYs
 QxVDuo8VxPGqHIVcQz8xSMzWFpWnqcc4t+IrQhfe0Qzhme7PYaVw1T8faWgtU8MBSIRH74P5cx9BP
 hU6Y67KbQUztMWj0YayZNS0KmMdfS5lb8KTvW8iwZPJhlY2xUUBsQAjGNulA/lftPFaVgLOyxHFIZ
 apoMSzbK7QjtRmJuHmP8EguhMZcUEzbemOQzieUE9j0OxDv+dHd+qtJbN65P8BGF30FOc7ZmeAjXD
 O0v9tbGg==;
Received: from 089144211028.atnat0020.highway.a1.net ([89.144.211.28]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcKSr-00E3VA-5M; Mon, 18 Oct 2021 04:41:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: 
Subject: [PATCH 11/11] dax: move bdev_dax_pgoff to fs/dax.c
Date: Mon, 18 Oct 2021 06:40:54 +0200
Message-Id: <20211018044054.1779424-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018044054.1779424-1-hch@lst.de>
References: <20211018044054.1779424-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-ext4@vger.kernel.org,
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

No functional changet, but this will allow for a tighter integration
with the iomap code, including possible passing the partition offset
in the iomap in the future.  For now it mostly avoids growing more
callers outside of fs/dax.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/dax/super.c | 14 --------------
 fs/dax.c            | 13 +++++++++++++
 include/linux/dax.h |  1 -
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 803942586d1b6..c0910687fbcb2 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -67,20 +67,6 @@ void dax_remove_host(struct gendisk *disk)
 }
 EXPORT_SYMBOL_GPL(dax_remove_host);
 
-int bdev_dax_pgoff(struct block_device *bdev, sector_t sector, size_t size,
-		pgoff_t *pgoff)
-{
-	sector_t start_sect = bdev ? get_start_sect(bdev) : 0;
-	phys_addr_t phys_off = (start_sect + sector) * 512;
-
-	if (pgoff)
-		*pgoff = PHYS_PFN(phys_off);
-	if (phys_off % PAGE_SIZE || size % PAGE_SIZE)
-		return -EINVAL;
-	return 0;
-}
-EXPORT_SYMBOL(bdev_dax_pgoff);
-
 /**
  * dax_get_by_host() - temporary lookup mechanism for filesystem-dax
  * @bdev: block device to find a dax_device for
diff --git a/fs/dax.c b/fs/dax.c
index 4e3e5a283a916..eb715363fd667 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -709,6 +709,19 @@ int dax_invalidate_mapping_entry_sync(struct address_space *mapping,
 	return __dax_invalidate_entry(mapping, index, false);
 }
 
+static int bdev_dax_pgoff(struct block_device *bdev, sector_t sector, size_t size,
+		pgoff_t *pgoff)
+{
+	sector_t start_sect = bdev ? get_start_sect(bdev) : 0;
+	phys_addr_t phys_off = (start_sect + sector) * 512;
+
+	if (pgoff)
+		*pgoff = PHYS_PFN(phys_off);
+	if (phys_off % PAGE_SIZE || size % PAGE_SIZE)
+		return -EINVAL;
+	return 0;
+}
+
 static int copy_cow_page_dax(struct block_device *bdev, struct dax_device *dax_dev,
 			     sector_t sector, struct page *to, unsigned long vaddr)
 {
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 439c3c70e347b..324363b798ecd 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -107,7 +107,6 @@ static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
 #endif
 
 struct writeback_control;
-int bdev_dax_pgoff(struct block_device *, sector_t, size_t, pgoff_t *pgoff);
 #if IS_ENABLED(CONFIG_FS_DAX)
 int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk);
 void dax_remove_host(struct gendisk *disk);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
