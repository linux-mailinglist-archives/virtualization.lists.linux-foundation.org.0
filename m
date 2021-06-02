Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C1D398184
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 08:54:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7987940238;
	Wed,  2 Jun 2021 06:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3UOPsjL2x76; Wed,  2 Jun 2021 06:54:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 405B6402C9;
	Wed,  2 Jun 2021 06:54:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B317C0011;
	Wed,  2 Jun 2021 06:54:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54CE2C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D96EC82BF5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tAVNnPsbFUb
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:54:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3479A82FCE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=itoIfl0lOn3PjkK+CaoYHstG5XDmIyS+X3zd0fvSPIM=; b=bhWE2wpHQl41sfsjCXEfpYjcLR
 nmreDYw+q1yPr6HX9B86hwxNp6nZ2Tnhh1KaILqMkYW4Y4qsc6sKDqxr3JfzzlCVpsVZXiDriGbCZ
 Y1kvrYb+ETid8liK1mxwid55k+FW8rcCy2J/MzUAKhHFJvh0OOcWM1xAYYJAYTp672FlIPmWSCfDL
 9pyoh9N5A4twK5q+oFZXZitHcqLsuWTjWUamSh8+v0dco1JdyeSUI/QOzHpsSeMo4cK+uUWipczTX
 1iuWGBvi4yeyTjSdFkWeQcxOVqoNke9pcbsxonDqFmJouTDXz2rxwn7JoK4aW4Gp3nNoPkisDeRe8
 L9x0B1Og==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKlc-0025MH-2X; Wed, 02 Jun 2021 06:54:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/30] pcd: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:20 +0300
Message-Id: <20210602065345.355274-6-hch@lst.de>
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
 drivers/block/paride/pcd.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index 70da8b86ce58..f9cdd11f02f5 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -309,21 +309,19 @@ static void pcd_init_units(void)
 
 	pcd_drive_count = 0;
 	for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
-		struct gendisk *disk = alloc_disk(1);
+		struct gendisk *disk;
 
-		if (!disk)
+		if (blk_mq_alloc_sq_tag_set(&cd->tag_set, &pcd_mq_ops, 1,
+				BLK_MQ_F_SHOULD_MERGE))
 			continue;
 
-		disk->queue = blk_mq_init_sq_queue(&cd->tag_set, &pcd_mq_ops,
-						   1, BLK_MQ_F_SHOULD_MERGE);
-		if (IS_ERR(disk->queue)) {
-			disk->queue = NULL;
-			put_disk(disk);
+		disk = blk_mq_alloc_disk(&cd->tag_set, cd);
+		if (IS_ERR(disk)) {
+			blk_mq_free_tag_set(&cd->tag_set);
 			continue;
 		}
 
 		INIT_LIST_HEAD(&cd->rq_list);
-		disk->queue->queuedata = cd;
 		blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_HIGH);
 		cd->disk = disk;
 		cd->pi = &cd->pia;
@@ -343,6 +341,7 @@ static void pcd_init_units(void)
 		cd->info.mask = 0;
 		disk->major = major;
 		disk->first_minor = unit;
+		disk->minors = 1;
 		strcpy(disk->disk_name, cd->name);	/* umm... */
 		disk->fops = &pcd_bdops;
 		disk->flags = GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE;
@@ -759,10 +758,8 @@ static int pcd_detect(void)
 	for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
 		if (!cd->disk)
 			continue;
-		blk_cleanup_queue(cd->disk->queue);
-		cd->disk->queue = NULL;
+		blk_cleanup_disk(cd->disk);
 		blk_mq_free_tag_set(&cd->tag_set);
-		put_disk(cd->disk);
 	}
 	pi_unregister_driver(par_drv);
 	return -1;
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
