Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3AF227DBF
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 12:54:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FCBC88344;
	Tue, 21 Jul 2020 10:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G+pwPBPSrMN0; Tue, 21 Jul 2020 10:54:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F001288334;
	Tue, 21 Jul 2020 10:54:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBF3AC016F;
	Tue, 21 Jul 2020 10:54:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69E06C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5493087FE5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLx43sgWFLNV
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:54:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7694E88304
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595328858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmSsOYM3N+BuN/CNETLIG8cntCXD0+KnIyiVkfU5Fy8=;
 b=LBDjojBGJUpxUHU+TZBA0adCebN9ADDFbyUpRCXqliMOBFSR3kcPyAhWI9a1K+Rx7fLIca
 GkKEJVmTmIcBHAv5wVbbdHezUUSkcal0fSBNyI7+AWuZ5WPXu1scssWLUttd3zuAl157Xs
 V6Ks6T4gG0l6foTPVIuqULOgqCoY3Lc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-e_rhm3fDNaaAvpbYUw1vLw-1; Tue, 21 Jul 2020 06:54:14 -0400
X-MC-Unique: e_rhm3fDNaaAvpbYUw1vLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1F1DE929;
 Tue, 21 Jul 2020 10:54:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF55A7621A;
 Tue, 21 Jul 2020 10:54:01 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] block: loop: use blk_is_valid_logical_block_size
Date: Tue, 21 Jul 2020 13:52:32 +0300
Message-Id: <20200721105239.8270-4-mlevitsk@redhat.com>
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

This allows to remove loop's own check for supported block size

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 drivers/block/loop.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 475e1a738560d..9984c8f824271 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -228,19 +228,6 @@ static void __loop_update_dio(struct loop_device *lo, bool dio)
 		blk_mq_unfreeze_queue(lo->lo_queue);
 }
 
-/**
- * loop_validate_block_size() - validates the passed in block size
- * @bsize: size to validate
- */
-static int
-loop_validate_block_size(unsigned short bsize)
-{
-	if (bsize < 512 || bsize > PAGE_SIZE || !is_power_of_2(bsize))
-		return -EINVAL;
-
-	return 0;
-}
-
 /**
  * loop_set_size() - sets device size and notifies userspace
  * @lo: struct loop_device to set the size for
@@ -1119,9 +1106,10 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	}
 
 	if (config->block_size) {
-		error = loop_validate_block_size(config->block_size);
-		if (error)
+		if (!blk_is_valid_logical_block_size(config->block_size)) {
+			error = -EINVAL;
 			goto out_unlock;
+		}
 	}
 
 	error = loop_set_status_from_info(lo, &config->info);
@@ -1607,9 +1595,8 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 	if (lo->lo_state != Lo_bound)
 		return -ENXIO;
 
-	err = loop_validate_block_size(arg);
-	if (err)
-		return err;
+	if (!blk_is_valid_logical_block_size(arg))
+		return -EINVAL;
 
 	if (lo->lo_queue->limits.logical_block_size == arg)
 		return 0;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
