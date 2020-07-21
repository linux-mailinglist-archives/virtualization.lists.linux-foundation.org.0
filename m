Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDAF227DB3
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 12:53:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2EDDD86FA5;
	Tue, 21 Jul 2020 10:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id keTwtqWwqgGr; Tue, 21 Jul 2020 10:53:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8A91C86FAD;
	Tue, 21 Jul 2020 10:53:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C4D1C016F;
	Tue, 21 Jul 2020 10:53:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DED63C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C64AC24C93
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dA3K5lP903Zg
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:53:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id D63A024BDF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595328813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mU9LuvbxIIqQES8VkndiAmGnMN0LZw77R+JT+vMfjKM=;
 b=RPpe2T/pkgdhmritA4f1a/I1OW9Ye6X1ygMWLUCvvFsXu8lqXkuUNvPx9WYxsuMDJ/RUH2
 hfqdry5zXrE1PXaM7HIkkjxwg4bXmqnYov/AkiE/N/5fmaV1a8BdLXTBDp9NOvo1clzOrv
 NU98InWy5vxuU2gPCFp2JMoSsaF5t+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-TU50TFU3PYG9zwlYETAStw-1; Tue, 21 Jul 2020 06:53:29 -0400
X-MC-Unique: TU50TFU3PYG9zwlYETAStw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 693008014D7;
 Tue, 21 Jul 2020 10:53:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87CB47621A;
 Tue, 21 Jul 2020 10:53:09 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] block: introduce blk_is_valid_logical_block_size
Date: Tue, 21 Jul 2020 13:52:30 +0300
Message-Id: <20200721105239.8270-2-mlevitsk@redhat.com>
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

Kernel block layer has never supported logical block
sizes less that SECTOR_SIZE nor larger that PAGE_SIZE.

Some drivers have runtime configurable block size,
so it makes sense to have common helper for that.

Signed-off-by: Maxim Levitsky  <mlevitsk@redhat.com>
---
 block/blk-settings.c   | 18 ++++++++++++++++++
 include/linux/blkdev.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 9a2c23cd97007..3c4ef0d00c2bc 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -311,6 +311,21 @@ void blk_queue_max_segment_size(struct request_queue *q, unsigned int max_size)
 }
 EXPORT_SYMBOL(blk_queue_max_segment_size);
 
+
+/**
+ * blk_check_logical_block_size - check if logical block size is supported
+ * by the kernel
+ * @size:  the logical block size, in bytes
+ *
+ * Description:
+ *   This function checks if the block layers supports given block size
+ **/
+bool blk_is_valid_logical_block_size(unsigned int size)
+{
+	return size >= SECTOR_SIZE && size <= PAGE_SIZE && !is_power_of_2(size);
+}
+EXPORT_SYMBOL(blk_is_valid_logical_block_size);
+
 /**
  * blk_queue_logical_block_size - set logical block size for the queue
  * @q:  the request queue for the device
@@ -323,6 +338,8 @@ EXPORT_SYMBOL(blk_queue_max_segment_size);
  **/
 void blk_queue_logical_block_size(struct request_queue *q, unsigned int size)
 {
+	WARN_ON(!blk_is_valid_logical_block_size(size));
+
 	q->limits.logical_block_size = size;
 
 	if (q->limits.physical_block_size < size)
@@ -330,6 +347,7 @@ void blk_queue_logical_block_size(struct request_queue *q, unsigned int size)
 
 	if (q->limits.io_min < q->limits.physical_block_size)
 		q->limits.io_min = q->limits.physical_block_size;
+
 }
 EXPORT_SYMBOL(blk_queue_logical_block_size);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 57241417ff2f8..2ed3151397e41 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1099,6 +1099,7 @@ extern void blk_queue_max_write_same_sectors(struct request_queue *q,
 		unsigned int max_write_same_sectors);
 extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
 		unsigned int max_write_same_sectors);
+extern bool blk_is_valid_logical_block_size(unsigned int size);
 extern void blk_queue_logical_block_size(struct request_queue *, unsigned int);
 extern void blk_queue_max_zone_append_sectors(struct request_queue *q,
 		unsigned int max_zone_append_sectors);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
