Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA201BE99A
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 23:07:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 568D886B7E;
	Wed, 29 Apr 2020 21:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENehuB2YXaXe; Wed, 29 Apr 2020 21:07:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B7A1386B20;
	Wed, 29 Apr 2020 21:07:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9454CC0172;
	Wed, 29 Apr 2020 21:07:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B08C1C0172;
 Wed, 29 Apr 2020 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9DE8D86A85;
 Wed, 29 Apr 2020 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4mQI1qhEnjI; Wed, 29 Apr 2020 21:07:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CF6AD86A94;
 Wed, 29 Apr 2020 21:07:43 +0000 (UTC)
IronPort-SDR: SvXoUqHQNvPm26FvrJKqsBI9nwmpxKXWDV5oEHahAJSFDuh8TQ0oPUqjV6usDM5bvRkNlozNQM
 PNhl1jubJchA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 14:07:43 -0700
IronPort-SDR: 9KMFJS/qBz1Tol+HEl7DO7rg0UpWzvVVdxnC3FBPX/0IsSOZRbtMs3zEGHI4Yq+coGpY15G2OR
 IBNCf7YU/YgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; d="scan'208";a="282629568"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2020 14:07:39 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jTtvf-000GMm-33; Thu, 30 Apr 2020 05:07:39 +0800
Date: Thu, 30 Apr 2020 05:06:42 +0800
From: kbuild test robot <lkp@intel.com>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>, konrad.wilk@oracle.com,
 mst@redhat.com, jasowang@redhat.com, jan.kiszka@siemens.com,
 will@kernel.org, stefano.stabellini@xilinx.com
Subject: [RFC PATCH] virtio: virtio_pool can be static
Message-ID: <20200429210642.GA804@46221c807a07>
References: <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 kbuild-all@lists.01.org, vatsa@codeaurora.org, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 pratikp@codeaurora.org, linux-kernel@vger.kernel.org
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


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 virtio_bounce.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_bounce.c b/drivers/virtio/virtio_bounce.c
index 3de8e0eb71e48..5a68d48667c42 100644
--- a/drivers/virtio/virtio_bounce.c
+++ b/drivers/virtio/virtio_bounce.c
@@ -19,7 +19,7 @@
 static phys_addr_t bounce_buf_paddr;
 static void *bounce_buf_vaddr;
 static size_t bounce_buf_size;
-struct swiotlb_pool *virtio_pool;
+static struct swiotlb_pool *virtio_pool;
 
 #define VIRTIO_MAX_BOUNCE_SIZE	(16*4096)
 
@@ -76,7 +76,7 @@ static void virtio_unmap_page(struct device *dev, dma_addr_t dev_addr,
 					size, dir, attrs);
 }
 
-size_t virtio_max_mapping_size(struct device *dev)
+static size_t virtio_max_mapping_size(struct device *dev)
 {
 	return VIRTIO_MAX_BOUNCE_SIZE;
 }
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
