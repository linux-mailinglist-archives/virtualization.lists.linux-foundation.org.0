Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD73981ED
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 08:56:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4A7240232;
	Wed,  2 Jun 2021 06:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5vmX-dQ82G0H; Wed,  2 Jun 2021 06:56:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88B8E402D9;
	Wed,  2 Jun 2021 06:56:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 414B9C0001;
	Wed,  2 Jun 2021 06:56:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C76DC0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A17A403E0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9CGJ89IIJrQ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:56:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7C2B403BD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yE8r2l5ezl7YxULOvA5WBGUgnr1EKs2E6TVb/drKQds=; b=r98dDxDiRvwlhNhs3T+1sVCcmx
 9LSO0JAkx53106Z5FUQCYz3et9mT695nE04/mTWwxr/+e0qSYn8Q1H1hjEWJdvuJc3pumGMIBHyUT
 t4W4GpkPuUNrdOHpe0KYFnWLvVAzI+WQwBh+pEi7U6I9KnMAFAlHPJRr4BSXUOn39VZTgNc5w2jvT
 YFMKttfQVUSu/qkAB2YLyqtpsqykpUWPfHXrpKaBY5Lxa/Kceg/Y0XBAcrgpyvG0PgFSkx/IaoPgV
 NvObxijOnNz7w1Y0/FNOweKAbiF8uEg9oHb82XorMJoTWx9Agt4jviXSvoy73IZqfJrU1acBTcolk
 E0JQevww==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKn1-0026HM-J4; Wed, 02 Jun 2021 06:55:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 24/30] sx8: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:39 +0300
Message-Id: <20210602065345.355274-25-hch@lst.de>
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

Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/sx8.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/block/sx8.c b/drivers/block/sx8.c
index 2cdf2771f8e8..f01f860b0e62 100644
--- a/drivers/block/sx8.c
+++ b/drivers/block/sx8.c
@@ -1343,32 +1343,25 @@ static int carm_init_disk(struct carm_host *host, unsigned int port_no)
 {
 	struct carm_port *port = &host->port[port_no];
 	struct gendisk *disk;
-	struct request_queue *q;
 
 	port->host = host;
 	port->port_no = port_no;
 
-	disk = alloc_disk(CARM_MINORS_PER_MAJOR);
-	if (!disk)
-		return -ENOMEM;
+	disk = blk_mq_alloc_disk(&host->tag_set, port);
+	if (IS_ERR(disk))
+		return PTR_ERR(disk);
 
 	port->disk = disk;
 	sprintf(disk->disk_name, DRV_NAME "/%u",
 		(unsigned int)host->id * CARM_MAX_PORTS + port_no);
 	disk->major = host->major;
 	disk->first_minor = port_no * CARM_MINORS_PER_MAJOR;
+	disk->minors = CARM_MINORS_PER_MAJOR;
 	disk->fops = &carm_bd_ops;
 	disk->private_data = port;
 
-	q = blk_mq_init_queue(&host->tag_set);
-	if (IS_ERR(q))
-		return PTR_ERR(q);
-
-	blk_queue_max_segments(q, CARM_MAX_REQ_SG);
-	blk_queue_segment_boundary(q, CARM_SG_BOUNDARY);
-
-	q->queuedata = port;
-	disk->queue = q;
+	blk_queue_max_segments(disk->queue, CARM_MAX_REQ_SG);
+	blk_queue_segment_boundary(disk->queue, CARM_SG_BOUNDARY);
 	return 0;
 }
 
@@ -1382,9 +1375,7 @@ static void carm_free_disk(struct carm_host *host, unsigned int port_no)
 
 	if (disk->flags & GENHD_FL_UP)
 		del_gendisk(disk);
-	if (disk->queue)
-		blk_cleanup_queue(disk->queue);
-	put_disk(disk);
+	blk_cleanup_disk(disk);
 }
 
 static int carm_init_shm(struct carm_host *host)
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
