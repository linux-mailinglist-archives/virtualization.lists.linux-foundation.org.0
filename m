Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E541B620
	for <lists.virtualization@lfdr.de>; Tue, 28 Sep 2021 20:24:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E6344149B;
	Tue, 28 Sep 2021 18:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tX1rKvXzzXbe; Tue, 28 Sep 2021 18:24:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CFAA04149A;
	Tue, 28 Sep 2021 18:24:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 852BCC000D;
	Tue, 28 Sep 2021 18:24:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E18AAC000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C44874149A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvYWT9Iq2Yhl
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:24:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09A584148E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632853469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbXdn+v660VV5bsfwvBwOBATR8SkkHZUOKA5MNOOqCo=;
 b=Neq77v/UWED9mxC/TuCedK0kwo68aPVlZxHOpCr2R67FBa1GtapbWEic2a+03weAH+FBWw
 QW4e0re6EbMHkzAcyxDicq36PYgcsFKbTA5yVBM6IgMyRepxa7MvXNaY/vgOoYIO+qHxGK
 B9eD3Su5oPaoyLpNjd05n9CwsZapieY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-hoClpQ93OYSgO_fkG_Ydfw-1; Tue, 28 Sep 2021 14:24:28 -0400
X-MC-Unique: hoClpQ93OYSgO_fkG_Ydfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 711ED1023F4F;
 Tue, 28 Sep 2021 18:24:26 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73B1260854;
 Tue, 28 Sep 2021 18:24:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/8] virtio-mem: factor out hotplug specifics from
 virtio_mem_init() into virtio_mem_init_hotplug()
Date: Tue, 28 Sep 2021 20:22:55 +0200
Message-Id: <20210928182258.12451-6-david@redhat.com>
In-Reply-To: <20210928182258.12451-1-david@redhat.com>
References: <20210928182258.12451-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Michal Hocko <mhocko@suse.com>, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Baoquan He <bhe@redhat.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 kexec@lists.infradead.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
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

Let's prepare for a new virtio-mem kdump mode in which we don't actually
hot(un)plug any memory but only observe the state of device blocks.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 81 ++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 37 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index bef8ad6bf466..2ba7e8d6ba8d 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2392,41 +2392,10 @@ static int virtio_mem_init_vq(struct virtio_mem *vm)
 	return 0;
 }
 
-static int virtio_mem_init(struct virtio_mem *vm)
+static int virtio_mem_init_hotplug(struct virtio_mem *vm)
 {
 	const struct range pluggable_range = mhp_get_pluggable_range(true);
 	uint64_t sb_size, addr;
-	uint16_t node_id;
-
-	if (!vm->vdev->config->get) {
-		dev_err(&vm->vdev->dev, "config access disabled\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * We don't want to (un)plug or reuse any memory when in kdump. The
-	 * memory is still accessible (but not mapped).
-	 */
-	if (is_kdump_kernel()) {
-		dev_warn(&vm->vdev->dev, "disabled in kdump kernel\n");
-		return -EBUSY;
-	}
-
-	/* Fetch all properties that can't change. */
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, plugged_size,
-			&vm->plugged_size);
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, block_size,
-			&vm->device_block_size);
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, node_id,
-			&node_id);
-	vm->nid = virtio_mem_translate_node_id(vm, node_id);
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, addr, &vm->addr);
-	virtio_cread_le(vm->vdev, struct virtio_mem_config, region_size,
-			&vm->region_size);
-
-	/* Determine the nid for the device based on the lowest address. */
-	if (vm->nid == NUMA_NO_NODE)
-		vm->nid = memory_add_physaddr_to_nid(vm->addr);
 
 	/* bad device setup - warn only */
 	if (!IS_ALIGNED(vm->addr, memory_block_size_bytes()))
@@ -2496,10 +2465,6 @@ static int virtio_mem_init(struct virtio_mem *vm)
 					      vm->offline_threshold);
 	}
 
-	dev_info(&vm->vdev->dev, "start address: 0x%llx", vm->addr);
-	dev_info(&vm->vdev->dev, "region size: 0x%llx", vm->region_size);
-	dev_info(&vm->vdev->dev, "device block size: 0x%llx",
-		 (unsigned long long)vm->device_block_size);
 	dev_info(&vm->vdev->dev, "memory block size: 0x%lx",
 		 memory_block_size_bytes());
 	if (vm->in_sbm)
@@ -2508,10 +2473,52 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	else
 		dev_info(&vm->vdev->dev, "big block size: 0x%llx",
 			 (unsigned long long)vm->bbm.bb_size);
+
+	return 0;
+}
+
+static int virtio_mem_init(struct virtio_mem *vm)
+{
+	uint16_t node_id;
+
+	if (!vm->vdev->config->get) {
+		dev_err(&vm->vdev->dev, "config access disabled\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * We don't want to (un)plug or reuse any memory when in kdump. The
+	 * memory is still accessible (but not mapped).
+	 */
+	if (is_kdump_kernel()) {
+		dev_warn(&vm->vdev->dev, "disabled in kdump kernel\n");
+		return -EBUSY;
+	}
+
+	/* Fetch all properties that can't change. */
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, plugged_size,
+			&vm->plugged_size);
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, block_size,
+			&vm->device_block_size);
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, node_id,
+			&node_id);
+	vm->nid = virtio_mem_translate_node_id(vm, node_id);
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, addr, &vm->addr);
+	virtio_cread_le(vm->vdev, struct virtio_mem_config, region_size,
+			&vm->region_size);
+
+	/* Determine the nid for the device based on the lowest address. */
+	if (vm->nid == NUMA_NO_NODE)
+		vm->nid = memory_add_physaddr_to_nid(vm->addr);
+
+	dev_info(&vm->vdev->dev, "start address: 0x%llx", vm->addr);
+	dev_info(&vm->vdev->dev, "region size: 0x%llx", vm->region_size);
+	dev_info(&vm->vdev->dev, "device block size: 0x%llx",
+		 (unsigned long long)vm->device_block_size);
 	if (vm->nid != NUMA_NO_NODE && IS_ENABLED(CONFIG_NUMA))
 		dev_info(&vm->vdev->dev, "nid: %d", vm->nid);
 
-	return 0;
+	return virtio_mem_init_hotplug(vm);
 }
 
 static int virtio_mem_create_resource(struct virtio_mem *vm)
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
