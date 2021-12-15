Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id DABEA475483
	for <lists.virtualization@lfdr.de>; Wed, 15 Dec 2021 09:45:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D844093E;
	Wed, 15 Dec 2021 08:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3egxew0Fzs4w; Wed, 15 Dec 2021 08:45:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E6841402DC;
	Wed, 15 Dec 2021 08:45:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EA70C0070;
	Wed, 15 Dec 2021 08:45:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61A96C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37AB040494
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V83m3rxWeHcn
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB35A400F3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=iIVq7X1YWsv9JyusL27Whnr/sIBDoiMdZkobuE2AZOk=; b=CsCnDOKBkd5gxuTlrTkODxkZ+E
 D4/Ajn8hXAu87nC9Q62IPGCAdArE5KhzqzRXozPuByYOh3U34gBC4bS2EBYB5jD8tAfsT0DctNmvB
 kcvaidd7h+UEFJmiKWvgAzzqiaVV0Ey3IKB9Z4NgmArY+XY8DfO/nFh4M026NJVMNKsTseMX6SbVi
 U5Q+FdnXKXgbPyHg5v4qXDIFtcwLuKJ2E+NlZeTYV5Te4XRCdgUHxIsi/NGp5B1+FsyKXkpoYgsWW
 +sZFmf+GGso6GWtBS0jHGgJ9/g1G4NdEI3qYVrMx626hjG32fx6dHoUe8x8vUNQZrd1uBvfGep3Ku
 Sf43Piuw==;
Received: from [2001:4bb8:184:5c65:c56:ed89:c020:6100] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxPuQ-00ETyh-BI; Wed, 15 Dec 2021 08:45:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>
Subject: [PATCH 1/4] uio: remove copy_from_iter_flushcache() and
 copy_mc_to_iter()
Date: Wed, 15 Dec 2021 09:45:05 +0100
Message-Id: <20211215084508.435401-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211215084508.435401-1-hch@lst.de>
References: <20211215084508.435401-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Alasdair Kergon <agk@redhat.com>
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

These two wrappers are never used.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvdimm/pmem.c |  4 +---
 include/linux/uio.h   | 20 +-------------------
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 4190c8c46ca88..d225bcfa67cf9 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -302,9 +302,7 @@ static long pmem_dax_direct_access(struct dax_device *dax_dev,
 }
 
 /*
- * Use the 'no check' versions of copy_from_iter_flushcache() and
- * copy_mc_to_iter() to bypass HARDENED_USERCOPY overhead. Bounds
- * checking, both file offset and device offset, is handled by
+ * Bounds checking, both file offset and device offset, is handled by
  * dax_iomap_actor()
  */
 static size_t pmem_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff,
diff --git a/include/linux/uio.h b/include/linux/uio.h
index 6350354f97e90..494d552c1d663 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -196,7 +196,7 @@ bool copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i)
 #ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
 /*
  * Note, users like pmem that depend on the stricter semantics of
- * copy_from_iter_flushcache() than copy_from_iter_nocache() must check for
+ * _copy_from_iter_flushcache() than _copy_from_iter_nocache() must check for
  * IS_ENABLED(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) before assuming that the
  * destination is flushed from the cache on return.
  */
@@ -211,24 +211,6 @@ size_t _copy_mc_to_iter(const void *addr, size_t bytes, struct iov_iter *i);
 #define _copy_mc_to_iter _copy_to_iter
 #endif
 
-static __always_inline __must_check
-size_t copy_from_iter_flushcache(void *addr, size_t bytes, struct iov_iter *i)
-{
-	if (unlikely(!check_copy_size(addr, bytes, false)))
-		return 0;
-	else
-		return _copy_from_iter_flushcache(addr, bytes, i);
-}
-
-static __always_inline __must_check
-size_t copy_mc_to_iter(void *addr, size_t bytes, struct iov_iter *i)
-{
-	if (unlikely(!check_copy_size(addr, bytes, true)))
-		return 0;
-	else
-		return _copy_mc_to_iter(addr, bytes, i);
-}
-
 size_t iov_iter_zero(size_t bytes, struct iov_iter *);
 unsigned long iov_iter_alignment(const struct iov_iter *i);
 unsigned long iov_iter_gap_alignment(const struct iov_iter *i);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
