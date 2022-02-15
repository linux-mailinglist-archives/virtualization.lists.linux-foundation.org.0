Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A00CA4B6805
	for <lists.virtualization@lfdr.de>; Tue, 15 Feb 2022 10:45:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25FA34028E;
	Tue, 15 Feb 2022 09:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUrFJGaHYr3V; Tue, 15 Feb 2022 09:45:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C09D9415C1;
	Tue, 15 Feb 2022 09:45:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 914A2C0077;
	Tue, 15 Feb 2022 09:45:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFB46C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Feb 2022 09:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDC6A4074E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Feb 2022 09:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pz7A7j1ZeVvX
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Feb 2022 09:45:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E253C4052B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Feb 2022 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Ilg8MRKs3UhBiK+Mujp47+wrzj58nCf6OMRjMHqSUG8=; b=0Syc33e4E0l4xLIb5ubjxRLTpS
 wCmradLTHx1xhTcg8Sz4A/VpdbNeQJg6MTHl4MsmRUdhBnoKWsd4AdBslg5FU2Q1U97HiTvGubcpG
 IKzNJaH4uzghtVKRya+Xr47tk/4RCTuC2fOGwueAgxXWIu7/tw8kvhfUSKGyW7LgX+LGSKSd49HIq
 K88Gym8cSI50EIb8JCdPf4cDavFnuMNgrY7cfmVLLBJhUjFjYeORn5ECRjvskLxawtX7Vpa2lPPND
 CA3nNIUiR+sp0S4IlVdSV2q4yOBU8WrCTMIwWpSpVpeVLMW9h6cJhd/SKN9d7AXnwlViGAAlowlXy
 3wd613Xg==;
Received: from [2001:4bb8:184:543c:6bdf:22f4:7f0a:fe97] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuOg-00262Y-HJ; Tue, 15 Feb 2022 09:45:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 2/5] memstick/ms_block: simplify refcounting
Date: Tue, 15 Feb 2022 10:45:11 +0100
Message-Id: <20220215094514.3828912-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220215094514.3828912-1-hch@lst.de>
References: <20220215094514.3828912-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-mmc@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

Implement the ->free_disk method to free the msb_data structure only once
the last gendisk reference goes away instead of keeping a local refcount.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/memstick/core/ms_block.c | 64 ++++++++------------------------
 drivers/memstick/core/ms_block.h |  1 -
 2 files changed, 15 insertions(+), 50 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 0cda6c6baefc3..3993bdd4b519c 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1943,22 +1943,6 @@ static void msb_io_work(struct work_struct *work)
 static DEFINE_IDR(msb_disk_idr); /*set of used disk numbers */
 static DEFINE_MUTEX(msb_disk_lock); /* protects against races in open/release */
 
-static int msb_bd_open(struct block_device *bdev, fmode_t mode)
-{
-	struct gendisk *disk = bdev->bd_disk;
-	struct msb_data *msb = disk->private_data;
-
-	dbg_verbose("block device open");
-
-	mutex_lock(&msb_disk_lock);
-
-	if (msb && msb->card)
-		msb->usage_count++;
-
-	mutex_unlock(&msb_disk_lock);
-	return 0;
-}
-
 static void msb_data_clear(struct msb_data *msb)
 {
 	kfree(msb->boot_page);
@@ -1968,33 +1952,6 @@ static void msb_data_clear(struct msb_data *msb)
 	msb->card = NULL;
 }
 
-static int msb_disk_release(struct gendisk *disk)
-{
-	struct msb_data *msb = disk->private_data;
-
-	dbg_verbose("block device release");
-	mutex_lock(&msb_disk_lock);
-
-	if (msb) {
-		if (msb->usage_count)
-			msb->usage_count--;
-
-		if (!msb->usage_count) {
-			disk->private_data = NULL;
-			idr_remove(&msb_disk_idr, msb->disk_id);
-			put_disk(disk);
-			kfree(msb);
-		}
-	}
-	mutex_unlock(&msb_disk_lock);
-	return 0;
-}
-
-static void msb_bd_release(struct gendisk *disk, fmode_t mode)
-{
-	msb_disk_release(disk);
-}
-
 static int msb_bd_getgeo(struct block_device *bdev,
 				 struct hd_geometry *geo)
 {
@@ -2003,6 +1960,17 @@ static int msb_bd_getgeo(struct block_device *bdev,
 	return 0;
 }
 
+static void msb_bd_free_disk(struct gendisk *disk)
+{
+	struct msb_data *msb = disk->private_data;
+
+	mutex_lock(&msb_disk_lock);
+	idr_remove(&msb_disk_idr, msb->disk_id);
+	mutex_unlock(&msb_disk_lock);
+
+	kfree(msb);
+}
+
 static blk_status_t msb_queue_rq(struct blk_mq_hw_ctx *hctx,
 				 const struct blk_mq_queue_data *bd)
 {
@@ -2096,10 +2064,9 @@ static void msb_start(struct memstick_dev *card)
 }
 
 static const struct block_device_operations msb_bdops = {
-	.open    = msb_bd_open,
-	.release = msb_bd_release,
-	.getgeo  = msb_bd_getgeo,
-	.owner   = THIS_MODULE
+	.owner		= THIS_MODULE,
+	.getgeo		= msb_bd_getgeo,
+	.free_disk	= msb_bd_free_disk, 
 };
 
 static const struct blk_mq_ops msb_mq_ops = {
@@ -2147,7 +2114,6 @@ static int msb_init_disk(struct memstick_dev *card)
 	set_capacity(msb->disk, capacity);
 	dbg("Set total disk size to %lu sectors", capacity);
 
-	msb->usage_count = 1;
 	msb->io_queue = alloc_ordered_workqueue("ms_block", WQ_MEM_RECLAIM);
 	INIT_WORK(&msb->io_work, msb_io_work);
 	sg_init_table(msb->prealloc_sg, MS_BLOCK_MAX_SEGS+1);
@@ -2229,7 +2195,7 @@ static void msb_remove(struct memstick_dev *card)
 	msb_data_clear(msb);
 	mutex_unlock(&msb_disk_lock);
 
-	msb_disk_release(msb->disk);
+	put_disk(msb->disk);
 	memstick_set_drvdata(card, NULL);
 }
 
diff --git a/drivers/memstick/core/ms_block.h b/drivers/memstick/core/ms_block.h
index 122e1a8a8bd5b..7058f9aefeb92 100644
--- a/drivers/memstick/core/ms_block.h
+++ b/drivers/memstick/core/ms_block.h
@@ -143,7 +143,6 @@ struct ms_boot_page {
 } __packed;
 
 struct msb_data {
-	unsigned int			usage_count;
 	struct memstick_dev		*card;
 	struct gendisk			*disk;
 	struct request_queue		*queue;
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
