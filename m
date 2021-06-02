Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFEE3981B2
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 08:55:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B517083518;
	Wed,  2 Jun 2021 06:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2fWXe5uQlUS; Wed,  2 Jun 2021 06:55:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 856C383653;
	Wed,  2 Jun 2021 06:55:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3594FC0001;
	Wed,  2 Jun 2021 06:55:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 475F0C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 363B582E57
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zn59e0O66eqC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:55:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 787DD82A2D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FS+70uyYe+4tLFvg24eJMtfqOnrP5LJ1R+LEkZqTKlU=; b=XaazqAYB8sweEFqM2vMqm2BF1a
 1A6gyISfZs5MiI+w7Ee7x8edliJofVEmh9+Mx86DNUmvx47GaLfDmZ091KW9cpX7wVUeqEGqiRsSr
 gYH9yuynmotrC/Z84Q1dT3M3+dCa+hte+sWLIalSchRf3P3NlYSXLH8M9Vnytw0SUBcvQc2lsA9Q+
 Z+GDx2MIWDM0rBH85AuZdxZFOvz66B5vXQu6l2EaDGdQvxiHVJCR81wkPj1Uh3HkiiJVkksNGRl30
 79AcKSm0yUrgNvUfyA9x1cG9jsfkPUkL2zxUXnaTSgmkRfc75N+g558tteVCrwudBz7Eg5HX5gdRp
 O/xhSQ1g==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKm2-0025WN-Lj; Wed, 02 Jun 2021 06:54:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/30] ps3disk: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:25 +0300
Message-Id: <20210602065345.355274-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jack Wang <jinpu.wang@ionos.com>,
 Tim Waugh <tim@cyberelk.net>, linux-s390@vger.kernel.org,
 Alex Dubov <oakad@yahoo.com>, Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>, xen-devel@lists.xenproject.org,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
 linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
 Maxim Levitsky <maximlevitsky@gmail.com>, Geoff Levand <geoff@infradead.org>,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
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

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/ps3disk.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index ba3ece56cbb3..f374ea2c67ce 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -29,7 +29,6 @@
 
 struct ps3disk_private {
 	spinlock_t lock;		/* Request queue spinlock */
-	struct request_queue *queue;
 	struct blk_mq_tag_set tag_set;
 	struct gendisk *gendisk;
 	unsigned int blocking_factor;
@@ -267,7 +266,7 @@ static irqreturn_t ps3disk_interrupt(int irq, void *data)
 	blk_mq_end_request(req, error);
 	spin_unlock(&priv->lock);
 
-	blk_mq_run_hw_queues(priv->queue, true);
+	blk_mq_run_hw_queues(priv->gendisk->queue, true);
 	return IRQ_HANDLED;
 }
 
@@ -441,17 +440,20 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 
 	ps3disk_identify(dev);
 
-	queue = blk_mq_init_sq_queue(&priv->tag_set, &ps3disk_mq_ops, 1,
+	error = blk_mq_alloc_sq_tag_set(&priv->tag_set, &ps3disk_mq_ops, 1,
 					BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(queue)) {
-		dev_err(&dev->sbd.core, "%s:%u: blk_mq_init_queue failed\n",
-			__func__, __LINE__);
-		error = PTR_ERR(queue);
+	if (error)
 		goto fail_teardown;
+
+	gendisk = blk_mq_alloc_disk(&priv->tag_set, dev);
+	if (IS_ERR(gendisk)) {
+		dev_err(&dev->sbd.core, "%s:%u: blk_mq_alloc_disk failed\n",
+			__func__, __LINE__);
+		error = PTR_ERR(gendisk);
+		goto fail_free_tag_set;
 	}
 
-	priv->queue = queue;
-	queue->queuedata = dev;
+	queue = gendisk->queue;
 
 	blk_queue_max_hw_sectors(queue, dev->bounce_size >> 9);
 	blk_queue_dma_alignment(queue, dev->blk_size-1);
@@ -462,19 +464,11 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 	blk_queue_max_segments(queue, -1);
 	blk_queue_max_segment_size(queue, dev->bounce_size);
 
-	gendisk = alloc_disk(PS3DISK_MINORS);
-	if (!gendisk) {
-		dev_err(&dev->sbd.core, "%s:%u: alloc_disk failed\n", __func__,
-			__LINE__);
-		error = -ENOMEM;
-		goto fail_cleanup_queue;
-	}
-
 	priv->gendisk = gendisk;
 	gendisk->major = ps3disk_major;
 	gendisk->first_minor = devidx * PS3DISK_MINORS;
+	gendisk->minors = PS3DISK_MINORS;
 	gendisk->fops = &ps3disk_fops;
-	gendisk->queue = queue;
 	gendisk->private_data = dev;
 	snprintf(gendisk->disk_name, sizeof(gendisk->disk_name), PS3DISK_NAME,
 		 devidx+'a');
@@ -490,8 +484,7 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 	device_add_disk(&dev->sbd.core, gendisk, NULL);
 	return 0;
 
-fail_cleanup_queue:
-	blk_cleanup_queue(queue);
+fail_free_tag_set:
 	blk_mq_free_tag_set(&priv->tag_set);
 fail_teardown:
 	ps3stor_teardown(dev);
@@ -517,9 +510,8 @@ static void ps3disk_remove(struct ps3_system_bus_device *_dev)
 		    &ps3disk_mask);
 	mutex_unlock(&ps3disk_mask_mutex);
 	del_gendisk(priv->gendisk);
-	blk_cleanup_queue(priv->queue);
+	blk_cleanup_disk(priv->gendisk);
 	blk_mq_free_tag_set(&priv->tag_set);
-	put_disk(priv->gendisk);
 	dev_notice(&dev->sbd.core, "Synchronizing disk cache\n");
 	ps3disk_sync_cache(dev);
 	ps3stor_teardown(dev);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
