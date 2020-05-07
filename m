Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD21C8D4A
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 16:03:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 14FD489390;
	Thu,  7 May 2020 14:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sl9CPQxa2rVi; Thu,  7 May 2020 14:03:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49C2389397;
	Thu,  7 May 2020 14:03:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3972FC07FF;
	Thu,  7 May 2020 14:03:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B008C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 29EAE885D6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhKrcLZNv0e4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CF8DD8854D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588860222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdxcxGx7SFVn0D0LAwJ67gF+eYTXzdSapCaeVtSsCtE=;
 b=MT9qYzHeEf6I5S6UdRUyrl+uoshslXHKt9TErsCdL5JQWWshrLopxQczmWIyaCv5NiAgoB
 9oD9etbevujFQeBpj8edzmO9R1swLAE64JL+y1ZbnF3YhpQn7jzMsDnltoJcGk333ft98k
 sFftt4M+vUFU8lh8B5nqKWKvD2NNhFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-lxBhMOqPN9WKvoonpKCTZQ-1; Thu, 07 May 2020 10:03:38 -0400
X-MC-Unique: lxBhMOqPN9WKvoonpKCTZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80EC9107ACCD;
 Thu,  7 May 2020 14:03:36 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E53F60BEC;
 Thu,  7 May 2020 14:03:34 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/15] virtio-mem: Drop manual check for already present
 memory
Date: Thu,  7 May 2020 16:01:36 +0200
Message-Id: <20200507140139.17083-13-david@redhat.com>
In-Reply-To: <20200507140139.17083-1-david@redhat.com>
References: <20200507140139.17083-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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

Registering our parent resource will fail if any memory is still present
(e.g., because somebody unloaded the driver and tries to reload it). No
need for the manual check.

Move our "unplug all" handling to after registering the resource.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 55 ++++++++-----------------------------
 1 file changed, 12 insertions(+), 43 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 80cdb9e6b3c4..8dd57b61b09b 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1616,23 +1616,6 @@ static int virtio_mem_init_vq(struct virtio_mem *vm)
 	return 0;
 }
 
-/*
- * Test if any memory in the range is present in Linux.
- */
-static bool virtio_mem_any_memory_present(unsigned long start,
-					  unsigned long size)
-{
-	const unsigned long start_pfn = PFN_DOWN(start);
-	const unsigned long end_pfn = PFN_UP(start + size);
-	unsigned long pfn;
-
-	for (pfn = start_pfn; pfn != end_pfn; pfn++)
-		if (present_section_nr(pfn_to_section_nr(pfn)))
-			return true;
-
-	return false;
-}
-
 static int virtio_mem_init(struct virtio_mem *vm)
 {
 	const uint64_t phys_limit = 1UL << MAX_PHYSMEM_BITS;
@@ -1664,32 +1647,6 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	virtio_cread(vm->vdev, struct virtio_mem_config, region_size,
 		     &vm->region_size);
 
-	/*
-	 * If we still have memory plugged, we might have to unplug all
-	 * memory first. However, if somebody simply unloaded the driver
-	 * we would have to reinitialize the old state - something we don't
-	 * support yet. Detect if we have any memory in the area present.
-	 */
-	if (vm->plugged_size) {
-		uint64_t usable_region_size;
-
-		virtio_cread(vm->vdev, struct virtio_mem_config,
-			     usable_region_size, &usable_region_size);
-
-		if (virtio_mem_any_memory_present(vm->addr,
-						  usable_region_size)) {
-			dev_err(&vm->vdev->dev,
-				"reloading the driver is not supported\n");
-			return -EINVAL;
-		}
-		/*
-		 * Note: it might happen that the device is busy and
-		 * unplugging all memory might take some time.
-		 */
-		dev_info(&vm->vdev->dev, "unplugging all memory required\n");
-		vm->unplug_all_required = 1;
-	}
-
 	/*
 	 * We always hotplug memory in memory block granularity. This way,
 	 * we have to wait for exactly one memory block to online.
@@ -1760,6 +1717,8 @@ static int virtio_mem_create_resource(struct virtio_mem *vm)
 	if (!vm->parent_resource) {
 		kfree(name);
 		dev_warn(&vm->vdev->dev, "could not reserve device region\n");
+		dev_info(&vm->vdev->dev,
+			 "reloading the driver is not supported\n");
 		return -EBUSY;
 	}
 
@@ -1816,6 +1775,16 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 	if (rc)
 		goto out_del_vq;
 
+	/*
+	 * If we still have memory plugged, we have to unplug all memory first.
+	 * Registering our parent resource makes sure that this memory isn't
+	 * actually in use (e.g., trying to reload the driver).
+	 */
+	if (vm->plugged_size) {
+		vm->unplug_all_required = 1;
+		dev_info(&vm->vdev->dev, "unplugging all memory is required\n");
+	}
+
 	/* register callbacks */
 	vm->memory_notifier.notifier_call = virtio_mem_memory_notifier_cb;
 	rc = register_memory_notifier(&vm->memory_notifier);
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
