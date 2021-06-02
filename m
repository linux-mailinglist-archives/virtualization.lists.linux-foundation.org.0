Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A5398203
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 08:56:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE74A402ED;
	Wed,  2 Jun 2021 06:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBY0caFkdLeu; Wed,  2 Jun 2021 06:56:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96631402DD;
	Wed,  2 Jun 2021 06:56:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A329EC0027;
	Wed,  2 Jun 2021 06:56:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7B8BC0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B672E402D4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyHIL7bqCT3v
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:56:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 209DF401FB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 06:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7GHnP6DNZGlKFwjbxdBpad0uFlCxBKJH9Xsnx8ec7ac=; b=nF5H5Xm7fe4zGXbHdq72l4Rnzy
 kg+w8MA3+xaOntMSOadwazIKALvfRRzCTRy9MFxfEVrh2sKEgQoBbgUOGRaieuAuAxc4ABeXBS8HN
 SQtDG1OQjVRLervqQcLcyPmZ3DOCzf6Iza9QUOxa7eEES0n40jma6ts5XDhrZorWgE/EAulN1GwbV
 Z5MnbQ9Pt4ZuIesxtmUE7CYUNs9IpOi40S5W3ULs7jy5knAcpmh8yHUS3I5I9+QDcpjjk0bMn7Cxn
 tMuGXllg4mbf6SO7+IH+aPv1V5kGTRswN64kZiIdU1FDVemfSZMUYCMTkt4iBJ9J6ovY+/RiKuAOr
 KKtQYNhA==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKnN-0026aZ-Dz; Wed, 02 Jun 2021 06:56:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 29/30] ataflop: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:44 +0300
Message-Id: <20210602065345.355274-30-hch@lst.de>
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
 drivers/block/ataflop.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index d601e49f80e0..a093644ac39f 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -1968,22 +1968,14 @@ static const struct blk_mq_ops ataflop_mq_ops = {
 static int ataflop_alloc_disk(unsigned int drive, unsigned int type)
 {
 	struct gendisk *disk;
-	int ret;
-
-	disk = alloc_disk(1);
-	if (!disk)
-		return -ENOMEM;
 
-	disk->queue = blk_mq_init_queue(&unit[drive].tag_set);
-	if (IS_ERR(disk->queue)) {
-		ret = PTR_ERR(disk->queue);
-		disk->queue = NULL;
-		put_disk(disk);
-		return ret;
-	}
+	disk = blk_mq_alloc_disk(&unit[drive].tag_set, NULL);
+	if (IS_ERR(disk))
+		return PTR_ERR(disk);
 
 	disk->major = FLOPPY_MAJOR;
 	disk->first_minor = drive + (type << 2);
+	disk->minors = 1;
 	sprintf(disk->disk_name, "fd%d", drive);
 	disk->fops = &floppy_fops;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
