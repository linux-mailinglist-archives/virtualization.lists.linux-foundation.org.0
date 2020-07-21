Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0006C227DB0
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 12:53:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4D81B24C93;
	Tue, 21 Jul 2020 10:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PpAEaDbV-MXK; Tue, 21 Jul 2020 10:53:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 40E1C252B7;
	Tue, 21 Jul 2020 10:53:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15F27C016F;
	Tue, 21 Jul 2020 10:53:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF062C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C6E7386FA5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3U9z8pubpf7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:53:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 408C586FA2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 10:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595328796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a7FGaIHkD38JSVxPqaibb4DmZEBgCel4gb1OIq9hfcg=;
 b=HcDMl8M28Q2UocbN8b/QuXcF3AhaEwtt/3PFGX7RFHxYyIghX2F2+2tBS+xqN646Q6DUTj
 ZO4iICVPJMry+K0jN6Ii4KWIATTFaWZSrlOfIaHd+D8O0KVjA9wlOFjPqOI9rMVfXD7jmp
 YHA/kW7p9lzFyi/ayuRfDvJHEginceI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-ukSVL_ZBNG-8BMv4MWvP7A-1; Tue, 21 Jul 2020 06:53:12 -0400
X-MC-Unique: ukSVL_ZBNG-8BMv4MWvP7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26294100AA21;
 Tue, 21 Jul 2020 10:53:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCBC78730C;
 Tue, 21 Jul 2020 10:52:40 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] RFC: move logical block size checking to the block core
Date: Tue, 21 Jul 2020 13:52:29 +0300
Message-Id: <20200721105239.8270-1-mlevitsk@redhat.com>
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

This patch series aims to move the logical block size checking to the
block code.

This was inspired by missing check for valid logical block size in
virtio-blk which causes the kernel to crash in a weird way later on
when it is invalid.

I added blk_is_valid_logical_block_size which returns true iff the
block size is one of supported sizes.

I added this check to virtio-blk, and also converted  few block drivers
that I am familiar with to use this interface instead of their
own implementation.

Best regards,
	Maxim Levitsky

Maxim Levitsky (10):
  block: introduce blk_is_valid_logical_block_size
  block: virtio-blk: check logical block size
  block: loop: use blk_is_valid_logical_block_size
  block: nbd: use blk_is_valid_logical_block_size
  block: null: use blk_is_valid_logical_block_size
  block: ms_block: use blk_is_valid_logical_block_size
  block: mspro_blk: use blk_is_valid_logical_block_size
  block: nvme: use blk_is_valid_logical_block_size
  block: scsi: sd: use blk_is_valid_logical_block_size
  block: scsi: sr: use blk_is_valid_logical_block_size

 block/blk-settings.c                | 18 +++++++++++++++++
 drivers/block/loop.c                | 23 +++++----------------
 drivers/block/nbd.c                 | 12 ++---------
 drivers/block/null_blk_main.c       |  6 +++---
 drivers/block/virtio_blk.c          | 15 ++++++++++++--
 drivers/memstick/core/ms_block.c    |  2 +-
 drivers/memstick/core/mspro_block.c |  6 ++++++
 drivers/nvme/host/core.c            | 17 ++++++++--------
 drivers/scsi/sd.c                   |  5 +----
 drivers/scsi/sr.c                   | 31 ++++++++++++-----------------
 include/linux/blkdev.h              |  1 +
 11 files changed, 71 insertions(+), 65 deletions(-)

-- 
2.26.2


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
