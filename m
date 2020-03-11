Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFD0181F05
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 18:16:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C50188A3D;
	Wed, 11 Mar 2020 17:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDyrsTYJBQfQ; Wed, 11 Mar 2020 17:16:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5DB4288A32;
	Wed, 11 Mar 2020 17:16:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4433FC0177;
	Wed, 11 Mar 2020 17:16:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EDF6C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4B32688A2B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pVnJ-f3hk5+l
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 339E888A32
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583946987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=naKZXsO1MFiudU96bs73V3GXAVu7Qj5dNa8Pv9BD7zE=;
 b=aomQIei4JNl8ySKRnJQTX3rSWLUt9E8AP+2DMc8VFSFB4d78GGEc2o+cnjzBmkcZHfSVTq
 ySy9brp0rF0ocTb3f7c5g44bgk6Q9ZQdxdqxSiY0b9e3a8JDge69CgL32flJ2ubJMEKQJu
 jpDhiJ9bedPyb4lu3LCKUASuuBtskRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-RZcPt58XMj6oF0WpzVXJDA-1; Wed, 11 Mar 2020 13:16:26 -0400
X-MC-Unique: RZcPt58XMj6oF0WpzVXJDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795CC18C8C05;
 Wed, 11 Mar 2020 17:16:23 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-132.ams2.redhat.com [10.36.116.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C52760BEE;
 Wed, 11 Mar 2020 17:16:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] virtio-mem: Offline and remove completely unplugged
 memory blocks
Date: Wed, 11 Mar 2020 18:14:20 +0100
Message-Id: <20200311171422.10484-9-david@redhat.com>
In-Reply-To: <20200311171422.10484-1-david@redhat.com>
References: <20200311171422.10484-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
index 35f20232770c..aa322e7732a4 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -443,6 +443,28 @@ static int virtio_mem_mb_remove(struct virtio_mem *vm, unsigned long mb_id)
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
@@ -535,7 +557,13 @@ static void virtio_mem_notify_offline(struct virtio_mem *vm,
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
 
@@ -1282,7 +1310,8 @@ static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
  * Unplug the desired number of plugged subblocks of an online memory block.
  * Will skip subblock that are busy.
  *
- * Will modify the state of the memory block.
+ * Will modify the state of the memory block. Might temporarily drop the
+ * hotplug_mutex.
  *
  * Note: Can fail after some subblocks were successfully unplugged. Can
  *       return 0 even if subblocks were busy and could not get unplugged.
@@ -1338,9 +1367,19 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
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
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
