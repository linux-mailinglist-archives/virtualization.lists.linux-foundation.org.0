Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DF580227DCE
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 12:54:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 83FF0252B7;
	Tue, 21 Jul 2020 10:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cg9grPQH-oee; Tue, 21 Jul 2020 10:54:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B88A524C93;
	Tue, 21 Jul 2020 10:54:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 984AEC016F;
	Tue, 21 Jul 2020 10:54:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DA74C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EA0EB88D22
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aT37viALuffs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:54:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2302688336
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595328894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLxjLMGXS3SH/S9EEpwVFL+AHIP2haLrD1L8osl1n6I=;
 b=J5G9hWPVM+7NWZLH+9/kEzxgCtmZ4e+JKVpSAL3+vSsDMV1aC70S9FdExRYkUa39VwAPTL
 Z6UmC+egDMalL/AFoSB/0eDB5HMK8lW5QODL48dJbmA5cXz7br+x4f5C7SRU77eTJwRnN0
 UGOkr8sb51G7L2m1WT8z0pZWl5cucZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-lJIac-1vO-2kar10RzFp_A-1; Tue, 21 Jul 2020 06:54:52 -0400
X-MC-Unique: lJIac-1vO-2kar10RzFp_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5ED9107ACCA;
 Tue, 21 Jul 2020 10:54:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DFB276215;
 Tue, 21 Jul 2020 10:54:36 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] block: ms_block: use blk_is_valid_logical_block_size
Date: Tue, 21 Jul 2020 13:52:35 +0300
Message-Id: <20200721105239.8270-7-mlevitsk@redhat.com>
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

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 drivers/memstick/core/ms_block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index d9ee8e3dc72da..e4df03e10fb46 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1727,7 +1727,7 @@ static int msb_init_card(struct memstick_dev *card)
 	msb->pages_in_block = boot_block->attr.block_size * 2;
 	msb->block_size = msb->page_size * msb->pages_in_block;
 
-	if (msb->page_size > PAGE_SIZE) {
+	if (!(blk_is_valid_logical_block_size(msb->page_size))) {
 		/* this isn't supported by linux at all, anyway*/
 		dbg("device page %d size isn't supported", msb->page_size);
 		return -EINVAL;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
