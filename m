Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 269E731B907
	for <lists.virtualization@lfdr.de>; Mon, 15 Feb 2021 13:22:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 479F885B25;
	Mon, 15 Feb 2021 12:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qo2XnbglRX_X; Mon, 15 Feb 2021 12:22:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD84285A5A;
	Mon, 15 Feb 2021 12:22:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F80FC013A;
	Mon, 15 Feb 2021 12:22:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A61AAC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 12:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A2A9286970
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 12:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqE5-b66ZT7i
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 12:22:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9A6D086932
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613391720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iREUH3qcwe+8CMwRTYNN3sl03Q+aaxvnMDnwGmHEACo=;
 b=FGknrUR4BXdhIYmse/JCe9e5p1UoAql+gFPfDQ/CISzZaBn5iRgUpX63QGEzScx7lS2oVo
 CCaTSsRzTjVjSH4oO3nRyOLAfHW0ONb16EHj6cZKwMLRwPHMeenl7NOQlmTgjjhKBgldbN
 VO8+EXpd/ZqC4u31Te3BRT37t+qD44k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-0zyx5x9gNme3xLrVJohpQA-1; Mon, 15 Feb 2021 07:21:56 -0500
X-MC-Unique: 0zyx5x9gNme3xLrVJohpQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBDE4192CC43;
 Mon, 15 Feb 2021 12:21:54 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D81C72BFEC;
 Mon, 15 Feb 2021 12:21:52 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] virtio-mem: don't read big block size in SBM
Date: Mon, 15 Feb 2021 13:21:42 +0100
Message-Id: <20210215122143.27608-2-david@redhat.com>
In-Reply-To: <20210215122143.27608-1-david@redhat.com>
References: <20210215122143.27608-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Marek Kedzierski <mkedzier@redhat.com>, Hui Zhu <teawater@gmail.com>
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

We are reading the a BBM (Big Block Mode) value while in SBM (Sub Block
Mode) while initializing. Fortunately, vm->bbm.bb_size maps to some counter
in the vm->sbm.mb_count array, which is 0 at that point in time.

No harm done; still, this was unintended and is not future-proof.

Fixes: 4ba50cd3355d ("virtio-mem: Big Block Mode (BBM) memory hotplug")
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Cc: Hui Zhu <teawater@gmail.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 9fc9ec4a25f5..6d4e01c4e2fa 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2409,6 +2409,10 @@ static int virtio_mem_init(struct virtio_mem *vm)
 		dev_warn(&vm->vdev->dev,
 			 "Some memory is not addressable. This can make some memory unusable.\n");
 
+	/* Prepare the offline threshold - make sure we can add two blocks. */
+	vm->offline_threshold = max_t(uint64_t, 2 * memory_block_size_bytes(),
+				      VIRTIO_MEM_DEFAULT_OFFLINE_THRESHOLD);
+
 	/*
 	 * We want subblocks to span at least MAX_ORDER_NR_PAGES and
 	 * pageblock_nr_pages pages. This:
@@ -2453,14 +2457,11 @@ static int virtio_mem_init(struct virtio_mem *vm)
 		addr = vm->addr + vm->bbm.bb_size - 1;
 		vm->bbm.first_bb_id = virtio_mem_phys_to_bb_id(vm, addr);
 		vm->bbm.next_bb_id = vm->bbm.first_bb_id;
-	}
 
-	/* Prepare the offline threshold - make sure we can add two blocks. */
-	vm->offline_threshold = max_t(uint64_t, 2 * memory_block_size_bytes(),
-				      VIRTIO_MEM_DEFAULT_OFFLINE_THRESHOLD);
-	/* In BBM, we also want at least two big blocks. */
-	vm->offline_threshold = max_t(uint64_t, 2 * vm->bbm.bb_size,
-				      vm->offline_threshold);
+		/* Make sure we can add two big blocks. */
+		vm->offline_threshold = max_t(uint64_t, 2 * vm->bbm.bb_size,
+					      vm->offline_threshold);
+	}
 
 	dev_info(&vm->vdev->dev, "start address: 0x%llx", vm->addr);
 	dev_info(&vm->vdev->dev, "region size: 0x%llx", vm->region_size);
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
