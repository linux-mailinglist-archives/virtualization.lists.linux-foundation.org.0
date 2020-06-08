Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF991F12B1
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 08:14:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9464A204F0;
	Mon,  8 Jun 2020 06:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCflbsE9jDtM; Mon,  8 Jun 2020 06:14:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9925320474;
	Mon,  8 Jun 2020 06:14:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86E25C016F;
	Mon,  8 Jun 2020 06:14:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95480C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7CC7987C66
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-rUMHo7TDrn
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:14:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 874C387B41
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591596853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ZOLB3s6xQQ4ednjFNYYSfonH3ht+KP5v3mHEujT+RI8=;
 b=GE4YsnD7G4Hawxgxb9ksu7nAURqEMp1fpdh3SUy08nEo47qT+/lD1NPnZaUZKL8yepINjZ
 zrGYP03pgV5fMy0R2KVIHTxp+X8Qwwp2P0g1O+vXF2J1RpbKFkxAKbi2q+Nn62WpBtqSLg
 tVduec1TI/YI0G+yzqWRh9fSi5PXQvQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-7LSO_o0UNa2Wm7R9lFuguA-1; Mon, 08 Jun 2020 02:14:11 -0400
X-MC-Unique: 7LSO_o0UNa2Wm7R9lFuguA-1
Received: by mail-wr1-f72.google.com with SMTP id w4so6736838wrl.13
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 23:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=ZOLB3s6xQQ4ednjFNYYSfonH3ht+KP5v3mHEujT+RI8=;
 b=nNkwoLBoz5V19QVnzXjEIPgURKrGxeisTH3RsTXk/Z3lK/2ApOqUdb3etPLHTk2nF1
 /DiodPIHS9hWpJHenZSkjYl9DvpBeeU1lx4OKXhTD8re+4yH4UHnfFDdY/BAbTzKMj/h
 lS9bp//KXtmv1HTs0xjnEf7XuRnsKRjBuIWO10xLLsRJapy2+e13MhUrZRqZo9F79QL+
 iTsFjF4HcgCtZlpxdpQKkfIx0D8xiT2tipLYvwZ2SDrD3HMUPsZFQK9ja49+gKb3OgPX
 OXTtgRcMB00tq9/8SdGrLwr7L3s/NedxmsvO5d6V82NHrI7UCqOAZ3cxCDWTY9ZSE0T7
 0W/w==
X-Gm-Message-State: AOAM5324aqrm0fl/X+bj+kkJkox4ah0S++3e1xlMl1oM9SUWt+UV0vda
 rR0zmrGKzjhf+o7GLDJlX9lLPELtTprRE4a8ld8YPawbBRYvmurMDOyPDUHgnc9yRo5N/RWT/Nd
 sLhgr2kj8fTi9isvejPTEVOroTIAwgSiB4AlscmiQOA==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr20862584wru.94.1591596850427; 
 Sun, 07 Jun 2020 23:14:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3paOhRaZ3mteITaSKV7CYWRhDU9MgQhrYToEZH5MAJhJq/5hQ5hCudXdUIPtpRl+F6Cv3bg==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr20862568wru.94.1591596850188; 
 Sun, 07 Jun 2020 23:14:10 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 j5sm21776545wrq.39.2020.06.07.23.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 23:14:09 -0700 (PDT)
Date: Mon, 8 Jun 2020 02:14:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_mem: prevent overflow with subblock size
Message-ID: <20200608061406.709211-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 virtualization@lists.linux-foundation.org
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

If subblock size is large (e.g. 1G) 32 bit math involving it
can overflow. Rather than try to catch all instances of that,
let's tweak block size to 64 bit.

It ripples through UAPI which is an ABI change, but it's not too late to
make it, and it will allow supporting >4Gbyte blocks while might
become necessary down the road.

Fixes: 5f1f79bbc9e26 ("virtio-mem: Paravirtualized memory hotplug")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_mem.c     | 14 +++++++-------
 include/uapi/linux/virtio_mem.h |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 2f357142ea5e..7b1bece8a331 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -77,7 +77,7 @@ struct virtio_mem {
 	uint64_t requested_size;
 
 	/* The device block size (for communicating with the device). */
-	uint32_t device_block_size;
+	uint64_t device_block_size;
 	/* The translated node id. NUMA_NO_NODE in case not specified. */
 	int nid;
 	/* Physical start address of the memory region. */
@@ -86,7 +86,7 @@ struct virtio_mem {
 	uint64_t region_size;
 
 	/* The subblock size. */
-	uint32_t subblock_size;
+	uint64_t subblock_size;
 	/* The number of subblocks per memory block. */
 	uint32_t nb_sb_per_mb;
 
@@ -1698,9 +1698,9 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	 * - At least the device block size.
 	 * In the worst case, a single subblock per memory block.
 	 */
-	vm->subblock_size = PAGE_SIZE * 1u << max_t(uint32_t, MAX_ORDER - 1,
-						    pageblock_order);
-	vm->subblock_size = max_t(uint32_t, vm->device_block_size,
+	vm->subblock_size = PAGE_SIZE * 1ul << max_t(uint32_t, MAX_ORDER - 1,
+						     pageblock_order);
+	vm->subblock_size = max_t(uint64_t, vm->device_block_size,
 				  vm->subblock_size);
 	vm->nb_sb_per_mb = memory_block_size_bytes() / vm->subblock_size;
 
@@ -1713,8 +1713,8 @@ static int virtio_mem_init(struct virtio_mem *vm)
 
 	dev_info(&vm->vdev->dev, "start address: 0x%llx", vm->addr);
 	dev_info(&vm->vdev->dev, "region size: 0x%llx", vm->region_size);
-	dev_info(&vm->vdev->dev, "device block size: 0x%x",
-		 vm->device_block_size);
+	dev_info(&vm->vdev->dev, "device block size: 0x%llx",
+		 (unsigned long long)vm->device_block_size);
 	dev_info(&vm->vdev->dev, "memory block size: 0x%lx",
 		 memory_block_size_bytes());
 	dev_info(&vm->vdev->dev, "subblock size: 0x%x",
diff --git a/include/uapi/linux/virtio_mem.h b/include/uapi/linux/virtio_mem.h
index a455c488a995..a9ffe041843c 100644
--- a/include/uapi/linux/virtio_mem.h
+++ b/include/uapi/linux/virtio_mem.h
@@ -185,10 +185,10 @@ struct virtio_mem_resp {
 
 struct virtio_mem_config {
 	/* Block size and alignment. Cannot change. */
-	__u32 block_size;
+	__u64 block_size;
 	/* Valid with VIRTIO_MEM_F_ACPI_PXM. Cannot change. */
 	__u16 node_id;
-	__u16 padding;
+	__u8 padding[6];
 	/* Start address of the memory region. Cannot change. */
 	__u64 addr;
 	/* Region size (maximum). Cannot change. */
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
