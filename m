Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 972D8227DDD
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 12:55:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4545724BDF;
	Tue, 21 Jul 2020 10:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7TyiO-edgPVQ; Tue, 21 Jul 2020 10:55:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7591124C93;
	Tue, 21 Jul 2020 10:55:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 548E8C016F;
	Tue, 21 Jul 2020 10:55:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7720BC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7297088D22
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QpZ57J1ji+Wr
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E32D388D20
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595328932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOZ3UhCTTXauv567OIWb7UfFogeyp1mZiVe9qWbA3oo=;
 b=fch9ILKDuYiDt9QcuC3gKzH2obelIFKjiZJQrhSOnbQrD1R7irhMjg8RDhrC9karYSjX7S
 aZZciA5JV+nzruTwYRV3r85ckZIgLlwUbs/e6SP+LMni96RDxmMrW25h3KbunbdY6FdkIE
 qpDcNrDlV2jlQNgnkMAGaYtjOAoDrps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-MW0yyVdePGqPeJmXvqorTQ-1; Tue, 21 Jul 2020 06:55:29 -0400
X-MC-Unique: MW0yyVdePGqPeJmXvqorTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12326193F561;
 Tue, 21 Jul 2020 10:55:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C0181C4;
 Tue, 21 Jul 2020 10:55:15 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] block: scsi: sd: use blk_is_valid_logical_block_size
Date: Tue, 21 Jul 2020 13:52:38 +0300
Message-Id: <20200721105239.8270-10-mlevitsk@redhat.com>
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

Use blk_is_valid_logical_block_size instead of hardcoded list

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 drivers/scsi/sd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index d90fefffe31b7..f012e7397b058 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -2520,10 +2520,7 @@ sd_read_capacity(struct scsi_disk *sdkp, unsigned char *buffer)
 			  "assuming 512.\n");
 	}
 
-	if (sector_size != 512 &&
-	    sector_size != 1024 &&
-	    sector_size != 2048 &&
-	    sector_size != 4096) {
+	if (!blk_is_valid_logical_block_size(sector_size)) {
 		sd_printk(KERN_NOTICE, sdkp, "Unsupported sector size %d.\n",
 			  sector_size);
 		/*
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
