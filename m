Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A514B6800
	for <lists.virtualization@lfdr.de>; Tue, 15 Feb 2022 10:45:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A301C82B94;
	Tue, 15 Feb 2022 09:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIAlC2s622ed; Tue, 15 Feb 2022 09:45:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7D0FF82B8C;
	Tue, 15 Feb 2022 09:45:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC0FEC0073;
	Tue, 15 Feb 2022 09:45:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05D18C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Feb 2022 09:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6FFF415B2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Feb 2022 09:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h771OEk0meR2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Feb 2022 09:45:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52B88415B7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Feb 2022 09:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=k2zUIoihKeX/PzTYAq+E6BX9omLlFxe2qXDX5akB7yw=; b=vDOP69iXQBS1etC9BNUgTKGNBG
 /khYC8I3DdAsyvTAJQDnYeX8sXRlOuPZJeOAg/ldjkhU4zwEDMdN62+p/QTA52FxDk2wuxx6tIgda
 CA2897HUhMe+Fy3qhaK9jPNazwCJfvlB4KDDsrn6/vmV3IkOSRW8BeEDzQxJnzBfvu9zPaEC+EIo9
 4K1EQz2VVPqr9rpyADPoup8dCtU3DiwZtLdfFU9fDcfvK2XJUDBpa3uwIT13Bv91g8aX+FEprUjgN
 EjidiXCviAuUxOEzRtRsF+02dAO8y/DKM2ys/hmDSXPyv89cjHn42WPRbN+QMMOUEKuwSSMjCsKHQ
 /4k/L6VA==;
Received: from [2001:4bb8:184:543c:6bdf:22f4:7f0a:fe97] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuOb-0025zX-8L; Tue, 15 Feb 2022 09:45:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: add a ->free_disk block_device_operation v3
Date: Tue, 15 Feb 2022 10:45:09 +0100
Message-Id: <20220215094514.3828912-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-mmc@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

this series adds a ->free_disk method to struct block_device_operation so that
drivers can defer freeing their disk private data until the gendisk goes away
and don't need to play games with the validity of ->private_data.

This also converts three simple drivers over as example, but eventually I
imagine that all drivers with private data will use it.

Changes since v2:
 - only call ->free_disk after add_disk has returned to simplify probe error
   handling
Changes since v1:
 - fix a tag_set use after free in virtio_blk

Diffstat:
 block/genhd.c                       |    5 ++
 drivers/block/virtio_blk.c          |   66 +++++++-----------------------------
 drivers/memstick/core/ms_block.c    |   64 ++++++++--------------------------
 drivers/memstick/core/ms_block.h    |    1 
 drivers/memstick/core/mspro_block.c |   57 +++++--------------------------
 include/linux/blkdev.h              |    2 +
 6 files changed, 46 insertions(+), 149 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
