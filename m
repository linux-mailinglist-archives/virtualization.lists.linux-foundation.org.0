Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B20F475487
	for <lists.virtualization@lfdr.de>; Wed, 15 Dec 2021 09:45:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5339F4064A;
	Wed, 15 Dec 2021 08:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJfbfW76hFps; Wed, 15 Dec 2021 08:45:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2AA0B40640;
	Wed, 15 Dec 2021 08:45:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD178C0074;
	Wed, 15 Dec 2021 08:45:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D299C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 784F9400F3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GecLM6DnCKvB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E03B4017C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YhH7IvGoro3CyjVYL17eBPFRd+Nxsm+BElJtDGuycFk=; b=TDSKX2dSoa1QhRdT18kIpZrDsA
 nYwbS7G7aeOWDpsotfFRxkQKqTlfjAD2+M+9n2dAgnIsesR/MEO3Txd5cMykyfhIWEin9wv/AIH0B
 BblrTYjy7JDE2I2XL8s0pcjlysyoJqTfeco6vIVBSKDl4OtsAV81NMzQRKOdxEKgPsxI8WMor5Xko
 3GiNYN6oiUmJ3R8UxXM/KHXB1wlpadLDs38QNDj4VDTXXE8ARRM1UDV0HmAQVnG/aYCe4KBFkPYBT
 ddWMPenL59nZx4Cg+flDk4qwa/hNk6Fz5wv0nfVgpUABskXPtEvzxL/SVX2Nv5D5CCKOWcbYqohy1
 3RbGCTrg==;
Received: from [2001:4bb8:184:5c65:c56:ed89:c020:6100] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxPuT-00ETyv-2K; Wed, 15 Dec 2021 08:45:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>
Subject: [PATCH 3/4] dax: remove the DAXDEV_F_SYNC flag
Date: Wed, 15 Dec 2021 09:45:07 +0100
Message-Id: <20211215084508.435401-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211215084508.435401-1-hch@lst.de>
References: <20211215084508.435401-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Matthew Wilcox <willy@infradead.org>,
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

Remove the DAXDEV_F_SYNC flag and thus the flags argument to alloc_dax and
just let the drivers call set_dax_synchronous directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/dax/bus.c            | 3 ++-
 drivers/dax/super.c          | 6 +-----
 drivers/md/dm.c              | 2 +-
 drivers/nvdimm/pmem.c        | 7 +++----
 drivers/s390/block/dcssblk.c | 4 ++--
 fs/fuse/virtio_fs.c          | 2 +-
 include/linux/dax.h          | 8 ++------
 7 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 6683d42c32c56..da2a14d096d29 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1324,11 +1324,12 @@ struct dev_dax *devm_create_dev_dax(struct dev_dax_data *data)
 	 * No dax_operations since there is no access to this device outside of
 	 * mmap of the resulting character device.
 	 */
-	dax_dev = alloc_dax(dev_dax, NULL, DAXDEV_F_SYNC);
+	dax_dev = alloc_dax(dev_dax, NULL);
 	if (IS_ERR(dax_dev)) {
 		rc = PTR_ERR(dax_dev);
 		goto err_alloc_dax;
 	}
+	set_dax_synchronous(dax_dev);
 
 	/* a device_dax instance is dead while the driver is not attached */
 	kill_dax(dax_dev);
diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index e18155f43a635..e81d5ee57390f 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -345,8 +345,7 @@ static struct dax_device *dax_dev_get(dev_t devt)
 	return dax_dev;
 }
 
-struct dax_device *alloc_dax(void *private, const struct dax_operations *ops,
-		unsigned long flags)
+struct dax_device *alloc_dax(void *private, const struct dax_operations *ops)
 {
 	struct dax_device *dax_dev;
 	dev_t devt;
@@ -366,9 +365,6 @@ struct dax_device *alloc_dax(void *private, const struct dax_operations *ops,
 
 	dax_dev->ops = ops;
 	dax_dev->private = private;
-	if (flags & DAXDEV_F_SYNC)
-		set_dax_synchronous(dax_dev);
-
 	return dax_dev;
 
  err_dev:
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 4e997c02bb0a0..f4b972af10928 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1765,7 +1765,7 @@ static struct mapped_device *alloc_dev(int minor)
 	sprintf(md->disk->disk_name, "dm-%d", minor);
 
 	if (IS_ENABLED(CONFIG_FS_DAX)) {
-		md->dax_dev = alloc_dax(md, &dm_dax_ops, 0);
+		md->dax_dev = alloc_dax(md, &dm_dax_ops);
 		if (IS_ERR(md->dax_dev)) {
 			md->dax_dev = NULL;
 			goto bad;
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index d225bcfa67cf9..18b1d9c558313 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -400,7 +400,6 @@ static int pmem_attach_disk(struct device *dev,
 	struct gendisk *disk;
 	void *addr;
 	int rc;
-	unsigned long flags = 0UL;
 
 	pmem = devm_kzalloc(dev, sizeof(*pmem), GFP_KERNEL);
 	if (!pmem)
@@ -493,13 +492,13 @@ static int pmem_attach_disk(struct device *dev,
 	nvdimm_badblocks_populate(nd_region, &pmem->bb, &bb_range);
 	disk->bb = &pmem->bb;
 
-	if (is_nvdimm_sync(nd_region))
-		flags = DAXDEV_F_SYNC;
-	dax_dev = alloc_dax(pmem, &pmem_dax_ops, flags);
+	dax_dev = alloc_dax(pmem, &pmem_dax_ops);
 	if (IS_ERR(dax_dev)) {
 		rc = PTR_ERR(dax_dev);
 		goto out;
 	}
+	if (is_nvdimm_sync(nd_region))
+		set_dax_synchronous(dax_dev);
 	rc = dax_add_host(dax_dev, disk);
 	if (rc)
 		goto out_cleanup_dax;
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index e65e83764d1ce..10823debc09bd 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -686,13 +686,13 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	if (rc)
 		goto put_dev;
 
-	dev_info->dax_dev = alloc_dax(dev_info, &dcssblk_dax_ops,
-			DAXDEV_F_SYNC);
+	dev_info->dax_dev = alloc_dax(dev_info, &dcssblk_dax_ops);
 	if (IS_ERR(dev_info->dax_dev)) {
 		rc = PTR_ERR(dev_info->dax_dev);
 		dev_info->dax_dev = NULL;
 		goto put_dev;
 	}
+	set_dax_synchronous(dev_info->dax_dev);
 	rc = dax_add_host(dev_info->dax_dev, dev_info->gd);
 	if (rc)
 		goto out_dax;
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 242cc1c0d7ed7..5c03a0364a9bb 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -850,7 +850,7 @@ static int virtio_fs_setup_dax(struct virtio_device *vdev, struct virtio_fs *fs)
 	dev_dbg(&vdev->dev, "%s: window kaddr 0x%px phys_addr 0x%llx len 0x%llx\n",
 		__func__, fs->window_kaddr, cache_reg.addr, cache_reg.len);
 
-	fs->dax_dev = alloc_dax(fs, &virtio_fs_dax_ops, 0);
+	fs->dax_dev = alloc_dax(fs, &virtio_fs_dax_ops);
 	if (IS_ERR(fs->dax_dev))
 		return PTR_ERR(fs->dax_dev);
 
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 3bd1fdb5d5f4b..c04f46478e3b5 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -6,9 +6,6 @@
 #include <linux/mm.h>
 #include <linux/radix-tree.h>
 
-/* Flag for synchronous flush */
-#define DAXDEV_F_SYNC (1UL << 0)
-
 typedef unsigned long dax_entry_t;
 
 struct dax_device;
@@ -42,8 +39,7 @@ struct dax_operations {
 };
 
 #if IS_ENABLED(CONFIG_DAX)
-struct dax_device *alloc_dax(void *private, const struct dax_operations *ops,
-		unsigned long flags);
+struct dax_device *alloc_dax(void *private, const struct dax_operations *ops);
 void put_dax(struct dax_device *dax_dev);
 void kill_dax(struct dax_device *dax_dev);
 void dax_write_cache(struct dax_device *dax_dev, bool wc);
@@ -64,7 +60,7 @@ static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
 }
 #else
 static inline struct dax_device *alloc_dax(void *private,
-		const struct dax_operations *ops, unsigned long flags)
+		const struct dax_operations *ops)
 {
 	/*
 	 * Callers should check IS_ENABLED(CONFIG_DAX) to know if this
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
