Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B53644A88D
	for <lists.virtualization@lfdr.de>; Tue,  9 Nov 2021 09:33:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC9540396;
	Tue,  9 Nov 2021 08:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-IzTN5BvO7E; Tue,  9 Nov 2021 08:33:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8411C403A5;
	Tue,  9 Nov 2021 08:33:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 073BEC000E;
	Tue,  9 Nov 2021 08:33:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4F9CC0012
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89ACE402FE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpVJ6W1DZpaX
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E20540127
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Jvpll4CUM8325AAF1SMXHTCZMQ9k8eTKnfeXNAO1IIY=; b=fEKs2O3qr1oWpwShLpnke0tnoT
 LXzsgmfi4uGIVxVTr99js7ppf76/NoInucNWUxb+l/GV6A3bhc5ZlJ604W4mGb8q7Rfc37MCD+E6u
 E4jX7kjxliK6KNjRVfQEjsyhFvJsO3yqTbJXsLm+nXx6caAgPht4qXPuj3iU35dqOMprZR7I/21f1
 2p2WMGfaOeggGXvpF03VeNb9cFR9cOSLOo/iae6jJRSAc5XtXb1GMdqUJfkVBWvYsU5os9KMZYby6
 +YkrcOxU7/LTq7CtfUxoT30My4LkP6wROJ9v9lNxmtOgRlHmkWjuP22/0KAQYUf1TD5Oxmbd0XgIU
 Bc36aLDQ==;
Received: from [2001:4bb8:19a:7ee7:fb46:2fe1:8652:d9d4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMZ5-000ry5-Fk; Tue, 09 Nov 2021 08:33:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 01/29] nvdimm/pmem: move dax_attribute_group from dax to pmem
Date: Tue,  9 Nov 2021 09:32:41 +0100
Message-Id: <20211109083309.584081-2-hch@lst.de>
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

dax_attribute_group is only used by the pmem driver, and can avoid the
completely pointless lookup by the disk name if moved there.  This
leaves just a single caller of dax_get_by_host, so move dax_get_by_host
into the same ifdef block as that caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Link: https://lore.kernel.org/r/20210922173431.2454024-3-hch@lst.de
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/dax/super.c   | 100 ++++++++----------------------------------
 drivers/nvdimm/pmem.c |  43 ++++++++++++++++++
 include/linux/dax.h   |   2 -
 3 files changed, 61 insertions(+), 84 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index fc89e91beea7c..b882cf8106ea3 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -63,6 +63,24 @@ static int dax_host_hash(const char *host)
 	return hashlen_hash(hashlen_string("DAX", host)) % DAX_HASH_SIZE;
 }
 
+#ifdef CONFIG_BLOCK
+#include <linux/blkdev.h>
+
+int bdev_dax_pgoff(struct block_device *bdev, sector_t sector, size_t size,
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
+EXPORT_SYMBOL(bdev_dax_pgoff);
+
+#if IS_ENABLED(CONFIG_FS_DAX)
 /**
  * dax_get_by_host() - temporary lookup mechanism for filesystem-dax
  * @host: alternate name for the device registered by a dax driver
@@ -94,24 +112,6 @@ static struct dax_device *dax_get_by_host(const char *host)
 	return found;
 }
 
-#ifdef CONFIG_BLOCK
-#include <linux/blkdev.h>
-
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
-#if IS_ENABLED(CONFIG_FS_DAX)
 struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev)
 {
 	if (!blk_queue_dax(bdev->bd_disk->queue))
@@ -231,70 +231,6 @@ enum dax_device_flags {
 	DAXDEV_SYNC,
 };
 
-static ssize_t write_cache_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct dax_device *dax_dev = dax_get_by_host(dev_name(dev));
-	ssize_t rc;
-
-	WARN_ON_ONCE(!dax_dev);
-	if (!dax_dev)
-		return -ENXIO;
-
-	rc = sprintf(buf, "%d\n", !!dax_write_cache_enabled(dax_dev));
-	put_dax(dax_dev);
-	return rc;
-}
-
-static ssize_t write_cache_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t len)
-{
-	bool write_cache;
-	int rc = strtobool(buf, &write_cache);
-	struct dax_device *dax_dev = dax_get_by_host(dev_name(dev));
-
-	WARN_ON_ONCE(!dax_dev);
-	if (!dax_dev)
-		return -ENXIO;
-
-	if (rc)
-		len = rc;
-	else
-		dax_write_cache(dax_dev, write_cache);
-
-	put_dax(dax_dev);
-	return len;
-}
-static DEVICE_ATTR_RW(write_cache);
-
-static umode_t dax_visible(struct kobject *kobj, struct attribute *a, int n)
-{
-	struct device *dev = container_of(kobj, typeof(*dev), kobj);
-	struct dax_device *dax_dev = dax_get_by_host(dev_name(dev));
-
-	WARN_ON_ONCE(!dax_dev);
-	if (!dax_dev)
-		return 0;
-
-#ifndef CONFIG_ARCH_HAS_PMEM_API
-	if (a == &dev_attr_write_cache.attr)
-		return 0;
-#endif
-	return a->mode;
-}
-
-static struct attribute *dax_attributes[] = {
-	&dev_attr_write_cache.attr,
-	NULL,
-};
-
-struct attribute_group dax_attribute_group = {
-	.name = "dax",
-	.attrs = dax_attributes,
-	.is_visible = dax_visible,
-};
-EXPORT_SYMBOL_GPL(dax_attribute_group);
-
 /**
  * dax_direct_access() - translate a device pgoff to an absolute pfn
  * @dax_dev: a dax_device instance representing the logical memory range
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index c74d7bceb2224..9cc0d0ebfad16 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -327,6 +327,49 @@ static const struct dax_operations pmem_dax_ops = {
 	.zero_page_range = pmem_dax_zero_page_range,
 };
 
+static ssize_t write_cache_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct pmem_device *pmem = dev_to_disk(dev)->private_data;
+
+	return sprintf(buf, "%d\n", !!dax_write_cache_enabled(pmem->dax_dev));
+}
+
+static ssize_t write_cache_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t len)
+{
+	struct pmem_device *pmem = dev_to_disk(dev)->private_data;
+	bool write_cache;
+	int rc;
+
+	rc = strtobool(buf, &write_cache);
+	if (rc)
+		return rc;
+	dax_write_cache(pmem->dax_dev, write_cache);
+	return len;
+}
+static DEVICE_ATTR_RW(write_cache);
+
+static umode_t dax_visible(struct kobject *kobj, struct attribute *a, int n)
+{
+#ifndef CONFIG_ARCH_HAS_PMEM_API
+	if (a == &dev_attr_write_cache.attr)
+		return 0;
+#endif
+	return a->mode;
+}
+
+static struct attribute *dax_attributes[] = {
+	&dev_attr_write_cache.attr,
+	NULL,
+};
+
+static const struct attribute_group dax_attribute_group = {
+	.name		= "dax",
+	.attrs		= dax_attributes,
+	.is_visible	= dax_visible,
+};
+
 static const struct attribute_group *pmem_attribute_groups[] = {
 	&dax_attribute_group,
 	NULL,
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 2619d94c308d4..8623caa673889 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -38,8 +38,6 @@ struct dax_operations {
 	int (*zero_page_range)(struct dax_device *, pgoff_t, size_t);
 };
 
-extern struct attribute_group dax_attribute_group;
-
 #if IS_ENABLED(CONFIG_DAX)
 struct dax_device *alloc_dax(void *private, const char *host,
 		const struct dax_operations *ops, unsigned long flags);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
