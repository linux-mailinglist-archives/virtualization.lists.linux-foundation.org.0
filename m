Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E4259603
	for <lists.virtualization@lfdr.de>; Tue,  1 Sep 2020 17:58:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A8FCB8683F;
	Tue,  1 Sep 2020 15:58:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwPLi0sYJE97; Tue,  1 Sep 2020 15:58:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 30D6586BDF;
	Tue,  1 Sep 2020 15:58:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E7C7C07FF;
	Tue,  1 Sep 2020 15:58:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71D6EC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 15:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 087BF20405
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 15:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dLCnwSDJe-W
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 15:58:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 0D8D42040E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YEpQxN/tPsUCQFZoeqkrzaPHhhl8x81h/vM0+OyoL28=; b=jH0wC/gLb4OEfKTPkMKn4/dwIB
 06OVZMsHWVv/8Ms5vHWtqbTepow87YxpfqdfzYvT8ngNVJWvmGyH+d3oWmigSSoF1/U8bWSw87zoj
 R7WHGvxsM+OYDjT8alV54CgTTC2LTLkX4FklDK0cOp6L2CfU3NF/Uz4QfqZrf3hrYjavcdH1O3IPt
 yWkaAefpWZnYievyIqsT0JwcH/F105z9MikBVHa3n2TqnYa/Rv7Ee1nknCwck4ProTZ8WWldT08x4
 ugsxov6xkqNTiwoKWr18ACNEGfX/ofsRGcs/7PECZtJcFhzLkuJXENLWc35VlThOG6sV0pnbdb9LA
 uMBE2png==;
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8fe-0004S0-Bi; Tue, 01 Sep 2020 15:58:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 9/9] block: remove revalidate_disk()
Date: Tue,  1 Sep 2020 17:57:48 +0200
Message-Id: <20200901155748.2884-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901155748.2884-1-hch@lst.de>
References: <20200901155748.2884-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, nbd@other.debian.org,
 virtualization@lists.linux-foundation.org, ceph-devel@vger.kernel.org
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

Remove the now unused helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.h       |  2 +-
 fs/block_dev.c        | 19 -------------------
 include/linux/genhd.h |  1 -
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/md/md.h b/drivers/md/md.h
index d9c4e6b7e9398d..f9e2ccdd22c478 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -397,7 +397,7 @@ struct mddev {
 	 * These locks are separate due to conflicting interactions
 	 * with bdev->bd_mutex.
 	 * Lock ordering is:
-	 *  reconfig_mutex -> bd_mutex : e.g. do_md_run -> revalidate_disk
+	 *  reconfig_mutex -> bd_mutex
 	 *  bd_mutex -> open_mutex:  e.g. __blkdev_get -> md_open
 	 */
 	struct mutex			open_mutex;
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 85f013315d48b3..0771836d0220bd 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1339,25 +1339,6 @@ void revalidate_disk_size(struct gendisk *disk, bool verbose)
 }
 EXPORT_SYMBOL(revalidate_disk_size);
 
-/**
- * revalidate_disk - wrapper for lower-level driver's revalidate_disk call-back
- * @disk: struct gendisk to be revalidated
- *
- * This routine is a wrapper for lower-level driver's revalidate_disk
- * call-backs.  It is used to do common pre and post operations needed
- * for all revalidate_disk operations.
- */
-int revalidate_disk(struct gendisk *disk)
-{
-	int ret = 0;
-
-	if (disk->fops->revalidate_disk)
-		ret = disk->fops->revalidate_disk(disk);
-	revalidate_disk_size(disk, ret == 0);
-	return ret;
-}
-EXPORT_SYMBOL(revalidate_disk);
-
 /*
  * This routine checks whether a removable media has been changed,
  * and invalidates all buffer-cache-entries in that case. This
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index c340b392452ce6..2cdc41a3fb6a57 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -372,7 +372,6 @@ extern void blk_unregister_region(dev_t devt, unsigned long range);
 int register_blkdev(unsigned int major, const char *name);
 void unregister_blkdev(unsigned int major, const char *name);
 
-int revalidate_disk(struct gendisk *disk);
 void revalidate_disk_size(struct gendisk *disk, bool verbose);
 int check_disk_change(struct block_device *bdev);
 int __invalidate_device(struct block_device *bdev, bool kill_dirty);
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
