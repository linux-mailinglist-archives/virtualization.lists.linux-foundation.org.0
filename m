Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AD9504BCC
	for <lists.virtualization@lfdr.de>; Mon, 18 Apr 2022 06:53:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C43D461207;
	Mon, 18 Apr 2022 04:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUi2TyvTSqY4; Mon, 18 Apr 2022 04:53:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 745AE61202;
	Mon, 18 Apr 2022 04:53:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EA8CC008B;
	Mon, 18 Apr 2022 04:53:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EABE2C002F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Apr 2022 04:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF1D341CD2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Apr 2022 04:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2OSSSIVPry1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Apr 2022 04:53:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28A1241CC2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Apr 2022 04:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=tyZKBZElFW6HvHSlv9xeAjIG3dO7xKdX7mIPZUu3++o=; b=Fc1PLXWY+U61UCduGVVmNa4xRX
 W2DkcCfgMrkwb1FtowTBpkb1LuVkZ8TInpQDBRu63s01XGNymYAVBze9K7cuggrvtLVCsRIQvDof7
 ljUfhulALzTsFS4w+l71wYoV1q2Lm4YK8vgQZhkj/Np9aC0Yu9S1JLLXx3eykhjg6NsyORI3PutJm
 sTMvqTpRRhFFdcZ7EV5IvV6e5FER4KWu6+dJ4duc2TYsclYeI94eZYYw/+h90AObggztOx4giuutC
 Qw7muGk8qWXO7hVhEGAmI1WIrhzpj4Cevvqzf0Uppevy9o3pTO/Ek4OGE2kkDtP//trS4bSL7nhaU
 +mBAe6Vg==;
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJO0-00FYhR-Fv; Mon, 18 Apr 2022 04:53:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: fix and cleanup discard_alignment handling
Date: Mon, 18 Apr 2022 06:53:03 +0200
Message-Id: <20220418045314.360785-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, Song Liu <song@kernel.org>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, xen-devel@lists.xenproject.org,
 linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
 linux-block@vger.kernel.org, Stefan Haberland <sth@linux.ibm.com>,
 linux-raid@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Johannes Berg <johannes@sipsolutions.net>,
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

Hi all,

the somewhat confusing name of the discard_alignment queue limit, that
really is an offset for the discard granularity mislead a lot of driver
authors to set it to an incorrect value.  This series tries to fix up
all these cases.

Diffstat:
 arch/um/drivers/ubd_kern.c         |    1 -
 drivers/block/loop.c               |    1 -
 drivers/block/nbd.c                |    3 ---
 drivers/block/null_blk/main.c      |    1 -
 drivers/block/rnbd/rnbd-srv-dev.h  |    2 +-
 drivers/block/virtio_blk.c         |    7 ++++---
 drivers/block/xen-blkback/xenbus.c |    4 ++--
 drivers/md/dm-zoned-target.c       |    2 +-
 drivers/md/raid5.c                 |    1 -
 drivers/nvme/host/core.c           |    1 -
 drivers/s390/block/dasd_fba.c      |    1 -
 11 files changed, 8 insertions(+), 16 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
