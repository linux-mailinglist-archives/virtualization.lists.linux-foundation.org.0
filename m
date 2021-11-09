Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1144A88E
	for <lists.virtualization@lfdr.de>; Tue,  9 Nov 2021 09:33:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04CA480BCD;
	Tue,  9 Nov 2021 08:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GI3yO2ZWyfa1; Tue,  9 Nov 2021 08:33:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C3E5A80BF1;
	Tue,  9 Nov 2021 08:33:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74746C0040;
	Tue,  9 Nov 2021 08:33:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CD6EC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A79840394
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lunZQtgaGPQZ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BD2840392
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jSKGrxUZLaYd3xMk2S2xH457WrAHkLgVZbJriQpBpNE=; b=D6Qw81O+aGHdSGLIg3S1q7rPKD
 R/sWFABcNQF3AaOMWnHmnIZRzu37fjd2u/pIqQY8s6H/uib2W7f9hKQS2xALeqBy9Z/8wRU+hn1De
 sRX2ZJYcFFNwtq8BoBYJ9YFiXucGevDveM1fubg49CT5eel8Mtzd/y4fMaTvd2rD2T3+SaVC1rcRR
 XnBnxu1DevPWVNoseeq5kimfTYRxWAd2eeCepAKvQcani/qsgLIg3qsH9CAdj6CAXbwBNsVDBSRo7
 yY9ibo9efoKhptJSrdNP1b86IS3i2PjvFiHQMlTkKl4s4rSb2GTwHR7nWpa8ExhI3CSg5fudf2lSm
 XbJXksuw==;
Received: from [2001:4bb8:19a:7ee7:fb46:2fe1:8652:d9d4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMZG-000ryb-Kt; Tue, 09 Nov 2021 08:33:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 05/29] dax: remove the pgmap sanity checks in
 generic_fsdax_supported
Date: Tue,  9 Nov 2021 09:32:45 +0100
Message-Id: <20211109083309.584081-6-hch@lst.de>
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

Drivers that register a dax_dev should make sure it works, no need
to double check from the file system.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/dax/super.c | 49 +--------------------------------------------
 1 file changed, 1 insertion(+), 48 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 9383c11b21853..04fc680542e8d 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -107,13 +107,9 @@ bool generic_fsdax_supported(struct dax_device *dax_dev,
 		struct block_device *bdev, int blocksize, sector_t start,
 		sector_t sectors)
 {
-	bool dax_enabled = false;
 	pgoff_t pgoff, pgoff_end;
-	void *kaddr, *end_kaddr;
-	pfn_t pfn, end_pfn;
 	sector_t last_page;
-	long len, len2;
-	int err, id;
+	int err;
 
 	if (blocksize != PAGE_SIZE) {
 		pr_info("%pg: error: unsupported blocksize for dax\n", bdev);
@@ -138,49 +134,6 @@ bool generic_fsdax_supported(struct dax_device *dax_dev,
 		return false;
 	}
 
-	id = dax_read_lock();
-	len = dax_direct_access(dax_dev, pgoff, 1, &kaddr, &pfn);
-	len2 = dax_direct_access(dax_dev, pgoff_end, 1, &end_kaddr, &end_pfn);
-
-	if (len < 1 || len2 < 1) {
-		pr_info("%pg: error: dax access failed (%ld)\n",
-				bdev, len < 1 ? len : len2);
-		dax_read_unlock(id);
-		return false;
-	}
-
-	if (IS_ENABLED(CONFIG_FS_DAX_LIMITED) && pfn_t_special(pfn)) {
-		/*
-		 * An arch that has enabled the pmem api should also
-		 * have its drivers support pfn_t_devmap()
-		 *
-		 * This is a developer warning and should not trigger in
-		 * production. dax_flush() will crash since it depends
-		 * on being able to do (page_address(pfn_to_page())).
-		 */
-		WARN_ON(IS_ENABLED(CONFIG_ARCH_HAS_PMEM_API));
-		dax_enabled = true;
-	} else if (pfn_t_devmap(pfn) && pfn_t_devmap(end_pfn)) {
-		struct dev_pagemap *pgmap, *end_pgmap;
-
-		pgmap = get_dev_pagemap(pfn_t_to_pfn(pfn), NULL);
-		end_pgmap = get_dev_pagemap(pfn_t_to_pfn(end_pfn), NULL);
-		if (pgmap && pgmap == end_pgmap && pgmap->type == MEMORY_DEVICE_FS_DAX
-				&& pfn_t_to_page(pfn)->pgmap == pgmap
-				&& pfn_t_to_page(end_pfn)->pgmap == pgmap
-				&& pfn_t_to_pfn(pfn) == PHYS_PFN(__pa(kaddr))
-				&& pfn_t_to_pfn(end_pfn) == PHYS_PFN(__pa(end_kaddr)))
-			dax_enabled = true;
-		put_dev_pagemap(pgmap);
-		put_dev_pagemap(end_pgmap);
-
-	}
-	dax_read_unlock(id);
-
-	if (!dax_enabled) {
-		pr_info("%pg: error: dax support not enabled\n", bdev);
-		return false;
-	}
 	return true;
 }
 EXPORT_SYMBOL_GPL(generic_fsdax_supported);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
