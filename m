Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 424A5502195
	for <lists.virtualization@lfdr.de>; Fri, 15 Apr 2022 06:54:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA66241970;
	Fri, 15 Apr 2022 04:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbyBIqnJbuwx; Fri, 15 Apr 2022 04:53:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2AED04197E;
	Fri, 15 Apr 2022 04:53:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED793C0085;
	Fri, 15 Apr 2022 04:53:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83B3EC002C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 04:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71C258411B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 04:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylV_Vgf2TSDU
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 04:53:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9789B840E8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 04:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fsm4eQJmjNs7mthWl6aQ0QoznH4mW7xZq3krP8KP9Uc=; b=Kc0kFPKNrBsztP51rQrb436EpC
 clkRG1c+RWauytSxyP1VZHzZm0k/n/bJiQF9offdgxlhFL9TpCe41mL4yiFXHZXG7NN3dZBqQWTyh
 VS32YFvooKg6jmcfwAv8iLy6ibtMV7kgdq4kptYmhPm0Z6NWmVX2oFVQWm6WbZ6ctUwWMEvyxnK3Y
 b9ovdNw4IiS4Q9grCcaQcJlT12XLY6ANDPyUjFzxFxy5R6sXbufEUiOBD2A9POWjPp9fJgc5BHmlx
 btpCR9+B/FjoYWNox5ht1MfT6qlsZJ4E91t9jc1UTJI5F9kZQSgKF9QlK5aIdPlC3AU3hlr6Kf/BQ
 9t86XlyA==;
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDxn-008P9R-W4; Fri, 15 Apr 2022 04:53:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 12/27] block: add a bdev_write_cache helper
Date: Fri, 15 Apr 2022 06:52:43 +0200
Message-Id: <20220415045258.199825-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, ceph-devel@vger.kernel.org,
 linux-raid@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
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

Add a helper to check the write cache flag based on the block_device
instead of having to poke into the block layer internal request_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
---
 drivers/block/rnbd/rnbd-srv.c       | 2 +-
 drivers/block/xen-blkback/xenbus.c  | 2 +-
 drivers/target/target_core_iblock.c | 8 ++------
 fs/btrfs/disk-io.c                  | 3 +--
 include/linux/blkdev.h              | 5 +++++
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index f04df6294650b..f8cc3c5fecb4b 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -558,7 +558,7 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
 	rsp->secure_discard =
 		cpu_to_le16(rnbd_dev_get_secure_discard(rnbd_dev));
 	rsp->cache_policy = 0;
-	if (test_bit(QUEUE_FLAG_WC, &q->queue_flags))
+	if (bdev_write_cache(rnbd_dev->bdev))
 		rsp->cache_policy |= RNBD_WRITEBACK;
 	if (blk_queue_fua(q))
 		rsp->cache_policy |= RNBD_FUA;
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index f09040435e2e5..8b691fe50475f 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -517,7 +517,7 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 		vbd->type |= VDISK_REMOVABLE;
 
 	q = bdev_get_queue(bdev);
-	if (q && test_bit(QUEUE_FLAG_WC, &q->queue_flags))
+	if (bdev_write_cache(bdev))
 		vbd->flush_support = true;
 
 	if (q && blk_queue_secure_erase(q))
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index b41ee5c3b5b82..03013e85ffc03 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -737,7 +737,7 @@ iblock_execute_rw(struct se_cmd *cmd, struct scatterlist *sgl, u32 sgl_nents,
 		if (test_bit(QUEUE_FLAG_FUA, &q->queue_flags)) {
 			if (cmd->se_cmd_flags & SCF_FUA)
 				opf |= REQ_FUA;
-			else if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags))
+			else if (!bdev_write_cache(ib_dev->ibd_bd))
 				opf |= REQ_FUA;
 		}
 	} else {
@@ -886,11 +886,7 @@ iblock_parse_cdb(struct se_cmd *cmd)
 
 static bool iblock_get_write_cache(struct se_device *dev)
 {
-	struct iblock_dev *ib_dev = IBLOCK_DEV(dev);
-	struct block_device *bd = ib_dev->ibd_bd;
-	struct request_queue *q = bdev_get_queue(bd);
-
-	return test_bit(QUEUE_FLAG_WC, &q->queue_flags);
+	return bdev_write_cache(IBLOCK_DEV(dev)->ibd_bd);
 }
 
 static const struct target_backend_ops iblock_ops = {
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index b30309f187cf0..092e986b8e8ed 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -4247,8 +4247,7 @@ static void write_dev_flush(struct btrfs_device *device)
 	 * of simplicity, since this is a debug tool and not meant for use in
 	 * non-debug builds.
 	 */
-	struct request_queue *q = bdev_get_queue(device->bdev);
-	if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags))
+	if (!bdev_write_cache(device->bdev))
 		return;
 #endif
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 3a9578e14a6b0..807a49aa5a27a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1331,6 +1331,11 @@ static inline bool bdev_nonrot(struct block_device *bdev)
 	return blk_queue_nonrot(bdev_get_queue(bdev));
 }
 
+static inline bool bdev_write_cache(struct block_device *bdev)
+{
+	return test_bit(QUEUE_FLAG_WC, &bdev_get_queue(bdev)->queue_flags);
+}
+
 static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
