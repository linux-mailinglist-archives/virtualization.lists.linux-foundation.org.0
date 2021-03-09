Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF28332B10
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 16:55:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AFB96F4E9;
	Tue,  9 Mar 2021 15:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvcHD87rnHBk; Tue,  9 Mar 2021 15:55:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C2A36F49A;
	Tue,  9 Mar 2021 15:55:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6ACBBC0001;
	Tue,  9 Mar 2021 15:55:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B2A2C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D2D947FDA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRx-UYmWQgAT
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:55:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EFF047A21
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=KGWSD1qzjw8jWYcVTd5k5Vux/eD/dPBH9TiN6yLVseE=; b=UqioM+JOtMrCZY+99WNlohS+n6
 D8sXLpSvt07nrEhE9GYHmdMTmjw4DL1jAclk+Ci+jnYGdn+IEIwZ0S8fpKJ2whNwkyjmljxBPh47g
 cMsKfNPA0fujb0XrwseHmDs/2m816gk63sTddN9x9X9wgRohgavTvx8tm6KQtpAyIG7cxz0OK5MKP
 PgIH6/WtutbbPjhpmXZVF7C1m9jWVkHGrdDIIbgcgrxaJ3JqKKlPb7/Swf8vZxBO2cCE67ILF7rVn
 MmRlVgFU4oQqmQ/DBvwu33p+M9TPPMt61GrQMTQJl2w3aFf67m+MltPsTuxfefjtilLeB/ZfnOnxB
 lkLQIpmA==;
Received: from [2001:4bb8:180:9884:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJegA-000lLy-1I; Tue, 09 Mar 2021 15:53:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: make alloc_anon_inode more useful
Date: Tue,  9 Mar 2021 16:53:39 +0100
Message-Id: <20210309155348.974875-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jason Gunthorpe <jgg@nvidia.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 Nadav Amit <namit@vmware.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
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

this series first renames the existing alloc_anon_inode to
alloc_anon_inode_sb to clearly mark it as requiring a superblock.

It then adds a new alloc_anon_inode that works on the anon_inode
file system super block, thus removing tons of boilerplate code.

The few remainig callers of alloc_anon_inode_sb all use alloc_file_pseudo
later, but might also be ripe for some cleanup.

Diffstat:
 arch/powerpc/platforms/pseries/cmm.c |   27 +-------------
 drivers/dma-buf/dma-buf.c            |    2 -
 drivers/gpu/drm/drm_drv.c            |   64 +----------------------------------
 drivers/misc/cxl/api.c               |    2 -
 drivers/misc/vmw_balloon.c           |   24 +------------
 drivers/scsi/cxlflash/ocxl_hw.c      |    2 -
 drivers/virtio/virtio_balloon.c      |   30 +---------------
 fs/aio.c                             |    2 -
 fs/anon_inodes.c                     |   15 +++++++-
 fs/libfs.c                           |    2 -
 include/linux/anon_inodes.h          |    1 
 include/linux/fs.h                   |    2 -
 kernel/resource.c                    |   30 ++--------------
 mm/z3fold.c                          |   38 +-------------------
 mm/zsmalloc.c                        |   48 +-------------------------
 15 files changed, 39 insertions(+), 250 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
