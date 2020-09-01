Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE32595F1
	for <lists.virtualization@lfdr.de>; Tue,  1 Sep 2020 17:58:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 882541FD90;
	Tue,  1 Sep 2020 15:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cri2DgMcFpYE; Tue,  1 Sep 2020 15:58:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DF0AD1FD16;
	Tue,  1 Sep 2020 15:58:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B30FCC0051;
	Tue,  1 Sep 2020 15:58:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B79E0C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 15:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0077861C7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 15:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nIRwLO_F2Mzg
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 15:58:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9223186194
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=M79so1AwUwPIRouROFaNCg3KdKArTwMSMNd8wl3xC9I=; b=Fo1o7u6IVr6vurOMarEGQIw99y
 WHqyrdok/75XjmzAvs98wm2mZXYI8eGfVJCJLikO8fuOJu/9j6XvoFdlr1RTa038r8DDcHMqAU7lY
 mmSZLC/smn0SnolNwwxdyrpDJlJoZhG0K7MVmnl8ewTBrEYNYAPRaMnE4rjqCK7VlkM7JqAlUWyDU
 YkH9TJZ6yJEEibyeqV37+FBh0RkQQ6BwwzwRxyMvkU7/sD29/P1lImVmElLT8cbRAFklBxMxACP/P
 9Ptq9IU2Xfcl9fIpw/yp4N3MdH0FKE600v4IAuPUo366M4kD36FMV0WaYWth1qfPOYnF35tgpEEiP
 sE6GqZdg==;
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8fN-0004OS-MU; Tue, 01 Sep 2020 15:57:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: remove revalidate_disk()
Date: Tue,  1 Sep 2020 17:57:39 +0200
Message-Id: <20200901155748.2884-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, nbd@other.debian.org,
 virtualization@lists.linux-foundation.org, ceph-devel@vger.kernel.org
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

Hi Jens,

this series removes the revalidate_disk() function, which has been a
really odd duck in the last years.  The prime reason why most people
use it is because it propagates a size change from the gendisk to
the block_device structure.  But it also calls into the rather ill
defined ->revalidate_disk method which is rather useless for the
callers.  So this adds a new helper to just propagate the size, and
cleans up all kinds of mess around this area.  Follow on patches
will eventuall kill of ->revalidate_disk entirely, but ther are a lot
more patches needed for that.

Diffstat:
 Documentation/filesystems/locking.rst |    3 --
 block/genhd.c                         |    9 ++----
 drivers/block/nbd.c                   |    8 ++---
 drivers/block/rbd.c                   |    2 -
 drivers/block/rnbd/rnbd-clt.c         |   10 +------
 drivers/block/virtio_blk.c            |    2 -
 drivers/block/zram/zram_drv.c         |    4 +-
 drivers/md/dm-raid.c                  |    2 -
 drivers/md/md-cluster.c               |    6 ++--
 drivers/md/md-linear.c                |    2 -
 drivers/md/md.c                       |   10 +++----
 drivers/md/md.h                       |    2 -
 drivers/nvdimm/blk.c                  |    3 --
 drivers/nvdimm/btt.c                  |    3 --
 drivers/nvdimm/bus.c                  |    9 ++----
 drivers/nvdimm/nd.h                   |    2 -
 drivers/nvdimm/pmem.c                 |    3 --
 drivers/nvme/host/core.c              |   16 +++++++----
 drivers/scsi/sd.c                     |    6 ++--
 fs/block_dev.c                        |   46 ++++++++++++++++------------------
 include/linux/blk_types.h             |    4 ++
 include/linux/genhd.h                 |    6 ++--
 22 files changed, 74 insertions(+), 84 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
