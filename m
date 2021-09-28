Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DF541B622
	for <lists.virtualization@lfdr.de>; Tue, 28 Sep 2021 20:25:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20A060B3C;
	Tue, 28 Sep 2021 18:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTylRQQQGl16; Tue, 28 Sep 2021 18:25:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5C2B160B43;
	Tue, 28 Sep 2021 18:25:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0DFDC000D;
	Tue, 28 Sep 2021 18:25:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4088C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9343D4149E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fACdpI77zGZG
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:25:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CB6B4149A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632853508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJ4bVTfY2RBZ7dKHJReSBumHsyhYfakPMn9Oqd8JPC0=;
 b=etqVQ8C2Y8Dqe5zlDHBVyetBME4Hm9bFB3v+8JFC7aq8+e2ViAtogD7w7qbNiaXRBHyM3s
 96OBiBGVN9l9xmQ/qrq372XN0gv13Y10H5K7CW41ODSqj3wPj9pcQhvhoHQzrX57GIY9mK
 2qa5462w6tJhf/+r/lcb1evdglxBmUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-tfQVnEQpPz2XZ-E6EUT2ZA-1; Tue, 28 Sep 2021 14:25:06 -0400
X-MC-Unique: tfQVnEQpPz2XZ-E6EUT2ZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57A0C824FA8;
 Tue, 28 Sep 2021 18:25:04 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D16BB60854;
 Tue, 28 Sep 2021 18:24:26 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/8] virtio-mem: factor out hotplug specifics from
 virtio_mem_probe() into virtio_mem_init_hotplug()
Date: Tue, 28 Sep 2021 20:22:56 +0200
Message-Id: <20210928182258.12451-7-david@redhat.com>
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
 drivers/virtio/virtio_mem.c | 87 +++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 42 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 2ba7e8d6ba8d..1be3ee7f684d 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -260,6 +260,8 @@ static void virtio_mem_fake_offline_going_offline(unsigned long pfn,
 static void virtio_mem_fake_offline_cancel_offline(unsigned long pfn,
 						   unsigned long nr_pages);
 static void virtio_mem_retry(struct virtio_mem *vm);
+static int virtio_mem_create_resource(struct virtio_mem *vm);
+static void virtio_mem_delete_resource(struct virtio_mem *vm);
 
 /*
  * Register a virtio-mem device so it will be considered for the online_page
@@ -2395,7 +2397,8 @@ static int virtio_mem_init_vq(struct virtio_mem *vm)
 static int virtio_mem_init_hotplug(struct virtio_mem *vm)
 {
 	const struct range pluggable_range = mhp_get_pluggable_range(true);
-	uint64_t sb_size, addr;
+	uint64_t unit_pages, sb_size, addr;
+	int rc;
 
 	/* bad device setup - warn only */
 	if (!IS_ALIGNED(vm->addr, memory_block_size_bytes()))
@@ -2474,7 +2477,48 @@ static int virtio_mem_init_hotplug(struct virtio_mem *vm)
 		dev_info(&vm->vdev->dev, "big block size: 0x%llx",
 			 (unsigned long long)vm->bbm.bb_size);
 
+	/* create the parent resource for all memory */
+	rc = virtio_mem_create_resource(vm);
+	if (rc)
+		return rc;
+
+	/* use a single dynamic memory group to cover the whole memory device */
+	if (vm->in_sbm)
+		unit_pages = PHYS_PFN(memory_block_size_bytes());
+	else
+		unit_pages = PHYS_PFN(vm->bbm.bb_size);
+	rc = memory_group_register_dynamic(vm->nid, unit_pages);
+	if (rc < 0)
+		goto out_del_resource;
+	vm->mgid = rc;
+
+	/*
+	 * If we still have memory plugged, we have to unplug all memory first.
+	 * Registering our parent resource makes sure that this memory isn't
+	 * actually in use (e.g., trying to reload the driver).
+	 */
+	if (vm->plugged_size) {
+		vm->unplug_all_required = true;
+		dev_info(&vm->vdev->dev, "unplugging all memory is required\n");
+	}
+
+	/* register callbacks */
+	vm->memory_notifier.notifier_call = virtio_mem_memory_notifier_cb;
+	rc = register_memory_notifier(&vm->memory_notifier);
+	if (rc)
+		goto out_unreg_group;
+	rc = register_virtio_mem_device(vm);
+	if (rc)
+		goto out_unreg_mem;
+
 	return 0;
+out_unreg_mem:
+	unregister_memory_notifier(&vm->memory_notifier);
+out_unreg_group:
+	memory_group_unregister(vm->mgid);
+out_del_resource:
+	virtio_mem_delete_resource(vm);
+	return rc;
 }
 
 static int virtio_mem_init(struct virtio_mem *vm)
@@ -2578,7 +2622,6 @@ static bool virtio_mem_has_memory_added(struct virtio_mem *vm)
 static int virtio_mem_probe(struct virtio_device *vdev)
 {
 	struct virtio_mem *vm;
-	uint64_t unit_pages;
 	int rc;
 
 	BUILD_BUG_ON(sizeof(struct virtio_mem_req) != 24);
@@ -2608,40 +2651,6 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 	if (rc)
 		goto out_del_vq;
 
-	/* create the parent resource for all memory */
-	rc = virtio_mem_create_resource(vm);
-	if (rc)
-		goto out_del_vq;
-
-	/* use a single dynamic memory group to cover the whole memory device */
-	if (vm->in_sbm)
-		unit_pages = PHYS_PFN(memory_block_size_bytes());
-	else
-		unit_pages = PHYS_PFN(vm->bbm.bb_size);
-	rc = memory_group_register_dynamic(vm->nid, unit_pages);
-	if (rc < 0)
-		goto out_del_resource;
-	vm->mgid = rc;
-
-	/*
-	 * If we still have memory plugged, we have to unplug all memory first.
-	 * Registering our parent resource makes sure that this memory isn't
-	 * actually in use (e.g., trying to reload the driver).
-	 */
-	if (vm->plugged_size) {
-		vm->unplug_all_required = true;
-		dev_info(&vm->vdev->dev, "unplugging all memory is required\n");
-	}
-
-	/* register callbacks */
-	vm->memory_notifier.notifier_call = virtio_mem_memory_notifier_cb;
-	rc = register_memory_notifier(&vm->memory_notifier);
-	if (rc)
-		goto out_unreg_group;
-	rc = register_virtio_mem_device(vm);
-	if (rc)
-		goto out_unreg_mem;
-
 	virtio_device_ready(vdev);
 
 	/* trigger a config update to start processing the requested_size */
@@ -2649,12 +2658,6 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 	queue_work(system_freezable_wq, &vm->wq);
 
 	return 0;
-out_unreg_mem:
-	unregister_memory_notifier(&vm->memory_notifier);
-out_unreg_group:
-	memory_group_unregister(vm->mgid);
-out_del_resource:
-	virtio_mem_delete_resource(vm);
 out_del_vq:
 	vdev->config->del_vqs(vdev);
 out_free_vm:
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
