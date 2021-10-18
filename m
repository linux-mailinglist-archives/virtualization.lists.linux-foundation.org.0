Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02F430F12
	for <lists.virtualization@lfdr.de>; Mon, 18 Oct 2021 06:41:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E8FD83027;
	Mon, 18 Oct 2021 04:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LCa9GsUidTzY; Mon, 18 Oct 2021 04:41:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 150378281A;
	Mon, 18 Oct 2021 04:41:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80D18C000D;
	Mon, 18 Oct 2021 04:41:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F7E5C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 04:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6FE1607B7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 04:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dD0YypXbubft
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 04:41:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30A1760744
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 04:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=5FVSqxmInxZpxLfquTYTWo3aHtcI6RxpSGZW6UNZj6o=; b=RWsnrEN/AN21+3N1QS/sVzo/pA
 KUprhD61JwCSOViB6cCzwYWYPy8xO6eWNrrG8XEt0LTqvix7ajoUiGCskUDEIh+XmHUnJyX/tgDJj
 Esl/uNdX1ly5Yy9ZBHbYr6yKuDS9X5SLz4ZAngrPtzD/0A2qwFx8g8P1chEP+4L6TG/G9DEqtaDJ6
 jW1vIyTNr2TebDqfs2jg2FxBFf/f/gWdoiabUqKvxpvOm2M2Nvc85QefHdxbJPv9Dys7AN5jmyANn
 iuh0ImYfAhQwPFWqmpyXU78hqF4KUrq+0TQ/4jRUyILMGOEhgr5OTDCogwtAbPD6vKEUBlPEk3aPn
 umppEHQg==;
Received: from 089144211028.atnat0020.highway.a1.net ([89.144.211.28]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcKSH-00E3Et-TF; Mon, 18 Oct 2021 04:40:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: 
Subject: futher decouple DAX from block devices
Date: Mon, 18 Oct 2021 06:40:43 +0200
Message-Id: <20211018044054.1779424-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-ext4@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>
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

Hi Dan,

this series cleans up and simplifies the association between DAX and block
devices in preparation of allowing to mount file systems directly on DAX
devices without a detour through block devices.

Diffstat:
 drivers/dax/Kconfig          |    4 
 drivers/dax/bus.c            |    2 
 drivers/dax/super.c          |  220 +++++--------------------------------------
 drivers/md/dm-linear.c       |   51 +++------
 drivers/md/dm-log-writes.c   |   44 +++-----
 drivers/md/dm-stripe.c       |   65 +++---------
 drivers/md/dm-table.c        |   22 ++--
 drivers/md/dm-writecache.c   |    2 
 drivers/md/dm.c              |   29 -----
 drivers/md/dm.h              |    4 
 drivers/nvdimm/Kconfig       |    2 
 drivers/nvdimm/pmem.c        |    9 -
 drivers/s390/block/Kconfig   |    2 
 drivers/s390/block/dcssblk.c |   12 +-
 fs/dax.c                     |   13 ++
 fs/erofs/super.c             |   11 +-
 fs/ext2/super.c              |    6 -
 fs/ext4/super.c              |    9 +
 fs/fuse/Kconfig              |    2 
 fs/fuse/virtio_fs.c          |    2 
 fs/xfs/xfs_super.c           |   54 +++++-----
 include/linux/dax.h          |   30 ++---
 22 files changed, 185 insertions(+), 410 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
