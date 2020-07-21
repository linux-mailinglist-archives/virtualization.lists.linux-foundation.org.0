Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCF1227DE3
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 12:55:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3A52689459;
	Tue, 21 Jul 2020 10:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jarVC1dsPltG; Tue, 21 Jul 2020 10:55:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B519089451;
	Tue, 21 Jul 2020 10:55:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95A7BC016F;
	Tue, 21 Jul 2020 10:55:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC3DBC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 98C0925F6B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A08mC6Br1xEu
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id A5A7224BDF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595328945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3seadylwcW1rKfz25C5YjNc+LNMmMOgRxWnx3VfrYM=;
 b=Bx+EqnfPFCBbu0xN3hG3h//8K66M/FNnZzK44GNUzQyBEmZxh+IO63Zinv+cK2Tl/D14nx
 fLG3mTXGkQ79SPVvDqU3RaquRxGPD/Gg1TY2zaaHgY/Ftq/VA5AapUtE1befrc97eMrwDA
 qrAgfnSWKbDjjaTWeubld6Q6+yRRyPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-YSjNVmjPOw2mHuqqn-p2Cw-1; Tue, 21 Jul 2020 06:55:42 -0400
X-MC-Unique: YSjNVmjPOw2mHuqqn-p2Cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07C091005504;
 Tue, 21 Jul 2020 10:55:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7482876216;
 Tue, 21 Jul 2020 10:55:26 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] block: scsi: sr: use blk_is_valid_logical_block_size
Date: Tue, 21 Jul 2020 13:52:39 +0300
Message-Id: <20200721105239.8270-11-mlevitsk@redhat.com>
In-Reply-To: <20200721105239.8270-1-mlevitsk@redhat.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:NVM EXPRESS DRIVER" <linux-nvme@lists.infradead.org>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>, Hou Tao <houtao1@huawei.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>,
 "open list:SCSI CDROM DRIVER" <linux-scsi@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Ajay Joshi <ajay.joshi@wdc.com>,
 Alex Dubov <oakad@yahoo.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Keith Busch <kbusch@kernel.org>,
 "open list:NETWORK BLOCK DEVICE NBD" <nbd@other.debian.org>,
 Bart Van Assche <bvanassche@acm.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Jens Axboe <axboe@fb.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:SONY MEMORYSTICK SUBSYSTEM" <linux-mmc@vger.kernel.org>,
 Tejun Heo <tj@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
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

Plus some tiny refactoring.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 drivers/scsi/sr.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index 0c4aa4665a2f9..0e96338029310 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -866,31 +866,26 @@ static void get_sectorsize(struct scsi_cd *cd)
 			cd->capacity = max_t(long, cd->capacity, last_written);
 
 		sector_size = get_unaligned_be32(&buffer[4]);
-		switch (sector_size) {
-			/*
-			 * HP 4020i CD-Recorder reports 2340 byte sectors
-			 * Philips CD-Writers report 2352 byte sectors
-			 *
-			 * Use 2k sectors for them..
-			 */
-		case 0:
-		case 2340:
-		case 2352:
+
+		/*
+		 * HP 4020i CD-Recorder reports 2340 byte sectors
+		 * Philips CD-Writers report 2352 byte sectors
+		 *
+		 * Use 2k sectors for them..
+		 */
+
+		if (!sector_size || sector_size == 2340 || sector_size == 2352)
 			sector_size = 2048;
-			/* fall through */
-		case 2048:
-			cd->capacity *= 4;
-			/* fall through */
-		case 512:
-			break;
-		default:
+
+		cd->capacity *= (sector_size >> SECTOR_SHIFT);
+
+		if (!blk_is_valid_logical_block_size(sector_size)) {
 			sr_printk(KERN_INFO, cd,
 				  "unsupported sector size %d.", sector_size);
 			cd->capacity = 0;
 		}
 
 		cd->device->sector_size = sector_size;
-
 		/*
 		 * Add this so that we have the ability to correctly gauge
 		 * what the device is capable of.
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
