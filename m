Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F64C3981E8
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 08:56:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F3308375B;
	Wed,  2 Jun 2021 06:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6Do_loED8W2; Wed,  2 Jun 2021 06:55:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E54D18377F;
	Wed,  2 Jun 2021 06:55:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94D65C0001;
	Wed,  2 Jun 2021 06:55:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 445F8C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 265E8402C4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_siLYBZiQ9a
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:55:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3844040232
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=nI/ZQsUq4UAVWWD+XlWiGZNbHY/pEUl6HaoFswHnuQ4=; b=zGlrfHSC/oppIdruF4aRva3o8B
 wtEFmwSmcFHEhWITeGFtHuY9Wo10P04noPv6NDlI408bgIBJRkVwwSNa+XWLEAJlAJuKZOmEWMLIK
 ypzvochOmpTNDSw00TOxKnVYokteVrnhgtmSr1j1yBWFdJc27AJBjUNwKpISp0vKiLy2jjLimY0Ek
 6P9TdCUkFiGBNMeFMPeq+ck3KCV/5OtDAHAEJPXDdOXuVm3Wp8pMIeYa4M2y0KOxO5BAOQxPKiJkk
 QtHEQ5wWjrHNPSLHnxZaMHUkkPwojUCno1EhOKjx/cVHeiOj1wg20mdo5EoURfDorHUaeAxyeZdGp
 7/lZ2gHg==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmo-002647-90; Wed, 02 Jun 2021 06:55:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 21/30] pd: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:36 +0300
Message-Id: <20210602065345.355274-22-hch@lst.de>
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
 drivers/block/paride/pd.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/block/paride/pd.c b/drivers/block/paride/pd.c
index 828a45ffe0e7..3b2b8e872beb 100644
--- a/drivers/block/paride/pd.c
+++ b/drivers/block/paride/pd.c
@@ -879,18 +879,6 @@ static void pd_probe_drive(struct pd_unit *disk)
 {
 	struct gendisk *p;
 
-	p = alloc_disk(1 << PD_BITS);
-	if (!p)
-		return;
-
-	strcpy(p->disk_name, disk->name);
-	p->fops = &pd_fops;
-	p->major = major;
-	p->first_minor = (disk - pd) << PD_BITS;
-	p->events = DISK_EVENT_MEDIA_CHANGE;
-	disk->gd = p;
-	p->private_data = disk;
-
 	memset(&disk->tag_set, 0, sizeof(disk->tag_set));
 	disk->tag_set.ops = &pd_mq_ops;
 	disk->tag_set.cmd_size = sizeof(struct pd_req);
@@ -903,14 +891,21 @@ static void pd_probe_drive(struct pd_unit *disk)
 	if (blk_mq_alloc_tag_set(&disk->tag_set))
 		return;
 
-	p->queue = blk_mq_init_queue(&disk->tag_set);
-	if (IS_ERR(p->queue)) {
+	p = blk_mq_alloc_disk(&disk->tag_set, disk);
+	if (!p) {
 		blk_mq_free_tag_set(&disk->tag_set);
-		p->queue = NULL;
 		return;
 	}
+	disk->gd = p;
+
+	strcpy(p->disk_name, disk->name);
+	p->fops = &pd_fops;
+	p->major = major;
+	p->first_minor = (disk - pd) << PD_BITS;
+	p->minors = 1 << PD_BITS;
+	p->events = DISK_EVENT_MEDIA_CHANGE;
+	p->private_data = disk;
 
-	p->queue->queuedata = disk;
 	blk_queue_max_hw_sectors(p->queue, cluster);
 	blk_queue_bounce_limit(p->queue, BLK_BOUNCE_HIGH);
 
@@ -1019,9 +1014,8 @@ static void __exit pd_exit(void)
 		if (p) {
 			disk->gd = NULL;
 			del_gendisk(p);
-			blk_cleanup_queue(p->queue);
 			blk_mq_free_tag_set(&disk->tag_set);
-			put_disk(p);
+			blk_cleanup_disk(p);
 			pi_release(disk->pi);
 		}
 	}
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
