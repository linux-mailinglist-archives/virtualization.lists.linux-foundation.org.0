Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9494A227DD2
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 12:55:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A77587508;
	Tue, 21 Jul 2020 10:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nw0Sbc_uIVHx; Tue, 21 Jul 2020 10:55:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E8BA287474;
	Tue, 21 Jul 2020 10:55:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D03E1C016F;
	Tue, 21 Jul 2020 10:55:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7ADEC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A465D87474
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsLMsSPRmbXb
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2C4638746F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595328904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgMI0PUysaqC29ZhpllDxU2MZgp5OTSppOCpTSOb14s=;
 b=D/wdza+AVIj8gJlc3gELCshQS92ZfLEv56cJfXrhdF4trp6rH740vZ5aJkW57wHji2bFC5
 sSe6accOtICRnRYKpporTwSM4N5vf9CbsdKHwLUFXelhPjTxm+lyHw4bNiLt5Cea+gT+cs
 DQoWcXCDIMxLybXQblxZnxvK/f9k7wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-aJsSQekbMPSFFHYbUkQrHg-1; Tue, 21 Jul 2020 06:55:03 -0400
X-MC-Unique: aJsSQekbMPSFFHYbUkQrHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF672107ACCA;
 Tue, 21 Jul 2020 10:54:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23A671C4;
 Tue, 21 Jul 2020 10:54:49 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] block: mspro_blk: use blk_is_valid_logical_block_size
Date: Tue, 21 Jul 2020 13:52:36 +0300
Message-Id: <20200721105239.8270-8-mlevitsk@redhat.com>
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
 drivers/memstick/core/mspro_block.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index cd6b8d4f23350..86c9eb0aef512 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -1199,6 +1199,12 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 
 	msb->page_size = be16_to_cpu(sys_info->unit_size);
 
+	if (!(blk_is_valid_logical_block_size(msb->page_size))) {
+		dev_warn(&card->dev,
+			 "unsupported block size %d", msb->page_size);
+		return -EINVAL;
+	}
+
 	mutex_lock(&mspro_block_disk_lock);
 	disk_id = idr_alloc(&mspro_block_disk_idr, card, 0, 256, GFP_KERNEL);
 	mutex_unlock(&mspro_block_disk_lock);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
