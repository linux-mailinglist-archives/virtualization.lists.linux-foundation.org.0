Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D411D360
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:13:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 701D886FAE;
	Thu, 12 Dec 2019 17:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSABVQ0GCZlG; Thu, 12 Dec 2019 17:13:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD8F686D10;
	Thu, 12 Dec 2019 17:13:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9488C0881;
	Thu, 12 Dec 2019 17:13:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73935C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 621E58887F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2B71cwQ8B0y
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A768388754
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8aOIkOkK1yTkK/LZIwF+2RpIBIYKbx1CgOlql+T67s=;
 b=OxGhcbJDp1jXG4ncfOys8SFr4VcLmv1f1J9cu3eoT97Q3lHpb+OLtM5zDxnaysqnQudqkm
 7pbHTdmyIZrBqZCq3QWs6TGy45CX73i7EC++LsoZfKCANdGt8fBENLgKQebkcm9p7k7gdX
 3nACjykl4dw+65Vb2HLzGYeo67dX8jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-VFP4204LOCqgDjYWOQ92WA-1; Thu, 12 Dec 2019 12:13:09 -0500
X-MC-Unique: VFP4204LOCqgDjYWOQ92WA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE2CA800EB5;
 Thu, 12 Dec 2019 17:13:07 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A064B5C1C3;
 Thu, 12 Dec 2019 17:12:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 09/13] virtio-mem: Offline and remove completely
 unplugged memory blocks
Date: Thu, 12 Dec 2019 18:11:33 +0100
Message-Id: <20191212171137.13872-10-david@redhat.com>
In-Reply-To: <20191212171137.13872-1-david@redhat.com>
References: <20191212171137.13872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtio-dev@lists.oasis-open.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org, Dave Young <dyoung@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>
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

Let's offline+remove memory blocks once all subblocks are unplugged. We
can use the new Linux MM interface for that. As no memory is in use
anymore, this shouldn't take a long time and shouldn't fail. There might
be corner cases where the offlining could still fail (especially, if
another notifier NACKs the offlining request).

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 47 +++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index a12a0f9c076b..807d4e393427 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -436,6 +436,28 @@ static int virtio_mem_mb_remove(struct virtio_mem *vm, unsigned long mb_id)
 	return remove_memory(nid, addr, memory_block_size_bytes());
 }
 
+/*
+ * Try to offline and remove a memory block from Linux.
+ *
+ * Must not be called with the vm->hotplug_mutex held (possible deadlock with
+ * onlining code).
+ *
+ * Will not modify the state of the memory block.
+ */
+static int virtio_mem_mb_offline_and_remove(struct virtio_mem *vm,
+					    unsigned long mb_id)
+{
+	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id);
+	int nid = vm->nid;
+
+	if (nid == NUMA_NO_NODE)
+		nid = memory_add_physaddr_to_nid(addr);
+
+	dev_dbg(&vm->vdev->dev, "offlining and removing memory block: %lu\n",
+		mb_id);
+	return offline_and_remove_memory(nid, addr, memory_block_size_bytes());
+}
+
 /*
  * Trigger the workqueue so the device can perform its magic.
  */
@@ -529,7 +551,13 @@ static void virtio_mem_notify_offline(struct virtio_mem *vm,
 		break;
 	}
 
-	/* trigger the workqueue, maybe we can now unplug memory. */
+	/*
+	 * Trigger the workqueue, maybe we can now unplug memory. Also,
+	 * when we offline and remove a memory block, this will re-trigger
+	 * us immediately - which is often nice because the removal of
+	 * the memory block (e.g., memmap) might have freed up memory
+	 * on other memory blocks we manage.
+	 */
 	virtio_mem_retry(vm);
 }
 
@@ -1275,7 +1303,8 @@ static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
  * Unplug the desired number of plugged subblocks of an online memory block.
  * Will skip subblock that are busy.
  *
- * Will modify the state of the memory block.
+ * Will modify the state of the memory block. Might temporarily drop the
+ * hotplug_mutex.
  *
  * Note: Can fail after some subblocks were successfully unplugged. Can
  *       return 0 even if subblocks were busy and could not get unplugged.
@@ -1331,9 +1360,19 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
 	}
 
 	/*
-	 * TODO: Once all subblocks of a memory block were unplugged, we want
-	 * to offline the memory block and remove it.
+	 * Once all subblocks of a memory block were unplugged, offline and
+	 * remove it. This will usually not fail, as no memory is in use
+	 * anymore - however some other notifiers might NACK the request.
 	 */
+	if (virtio_mem_mb_test_sb_unplugged(vm, mb_id, 0, vm->nb_sb_per_mb)) {
+		mutex_unlock(&vm->hotplug_mutex);
+		rc = virtio_mem_mb_offline_and_remove(vm, mb_id);
+		mutex_lock(&vm->hotplug_mutex);
+		if (!rc)
+			virtio_mem_mb_set_state(vm, mb_id,
+						VIRTIO_MEM_MB_STATE_UNUSED);
+	}
+
 	return 0;
 }
 
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
