Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BAD11D345
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:12:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 50BEF88887;
	Thu, 12 Dec 2019 17:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1LV0Jm9elE7; Thu, 12 Dec 2019 17:12:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 132A988884;
	Thu, 12 Dec 2019 17:12:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7736C1D8A;
	Thu, 12 Dec 2019 17:12:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 537CEC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 433CF8715C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SnLpTR2iA8rj
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2C81387154
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzz5SKB6UhLw20LV56TWJK/KT32BykuRTQ7b1mPtnTk=;
 b=hcCt8R+V298K0pmdYkA6uN7lzL6PEVLv1aKNkq/92Y8KWElEgPYfxvOVvSXFe4pObuoQqC
 1HUiqxS4TkmpbW2B1VzO4NgcKz8oJ4ChPMn0fldoXh6TTpDkeUTM4Ws4wnccPwqnzH0EmI
 cYHQEyWVVpNLitaTMIg7Ju2wM9m1Dn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-1cgmeF64NHa8lbKwCDDpnQ-1; Thu, 12 Dec 2019 12:12:21 -0500
X-MC-Unique: 1cgmeF64NHa8lbKwCDDpnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D5BC18A6EC0;
 Thu, 12 Dec 2019 17:12:19 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C88F35C1C3;
 Thu, 12 Dec 2019 17:12:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 03/13] virtio-mem: Paravirtualized memory hotunplug
 part 1
Date: Thu, 12 Dec 2019 18:11:27 +0100
Message-Id: <20191212171137.13872-4-david@redhat.com>
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

Unplugging subblocks of memory blocks that are offline is easy. All we
have to do is watch out for concurrent onlining acticity.

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
 drivers/virtio/virtio_mem.c | 109 +++++++++++++++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 8f4ceeab3d7c..f1af05def5df 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -119,7 +119,7 @@ struct virtio_mem {
 	 *
 	 * When this lock is held the pointers can't change, ONLINE and
 	 * OFFLINE blocks can't change the state and no subblocks will get
-	 * plugged.
+	 * plugged/unplugged.
 	 */
 	struct mutex hotplug_mutex;
 	bool hotplug_active;
@@ -321,6 +321,19 @@ static bool virtio_mem_mb_test_sb_plugged(struct virtio_mem *vm,
 	       bit + count;
 }
 
+/*
+ * Test if all selected subblocks are unplugged.
+ */
+static bool virtio_mem_mb_test_sb_unplugged(struct virtio_mem *vm,
+					    unsigned long mb_id, int sb_id,
+					    int count)
+{
+	const int bit = (mb_id - vm->first_mb_id) * vm->nb_sb_per_mb + sb_id;
+
+	/* TODO: Helper similar to bitmap_set() */
+	return find_next_bit(vm->sb_bitmap, bit + count, bit) >= bit + count;
+}
+
 /*
  * Find the first plugged subblock. Returns vm->nb_sb_per_mb in case there is
  * none.
@@ -511,6 +524,9 @@ static void virtio_mem_notify_offline(struct virtio_mem *vm,
 		BUG();
 		break;
 	}
+
+	/* trigger the workqueue, maybe we can now unplug memory. */
+	virtio_mem_retry(vm);
 }
 
 static void virtio_mem_notify_online(struct virtio_mem *vm, unsigned long mb_id,
@@ -1123,6 +1139,93 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 	return rc;
 }
 
+/*
+ * Unplug the desired number of plugged subblocks of an offline memory block.
+ * Will fail if any subblock cannot get unplugged (instead of skipping it).
+ *
+ * Will modify the state of the memory block. Might temporarily drop the
+ * hotplug_mutex.
+ *
+ * Note: Can fail after some subblocks were successfully unplugged.
+ */
+static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
+					       unsigned long mb_id,
+					       uint64_t *nb_sb)
+{
+	int rc;
+
+	rc = virtio_mem_mb_unplug_any_sb(vm, mb_id, nb_sb);
+
+	/* some subblocks might have been unplugged even on failure */
+	if (!virtio_mem_mb_test_sb_plugged(vm, mb_id, 0, vm->nb_sb_per_mb))
+		virtio_mem_mb_set_state(vm, mb_id,
+					VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL);
+	if (rc)
+		return rc;
+
+	if (virtio_mem_mb_test_sb_unplugged(vm, mb_id, 0, vm->nb_sb_per_mb)) {
+		/*
+		 * Remove the block from Linux - this should never fail.
+		 * Hinder the block from getting onlined by marking it
+		 * unplugged. Temporarily drop the mutex, so
+		 * any pending GOING_ONLINE requests can be serviced/rejected.
+		 */
+		virtio_mem_mb_set_state(vm, mb_id,
+					VIRTIO_MEM_MB_STATE_UNUSED);
+
+		mutex_unlock(&vm->hotplug_mutex);
+		rc = virtio_mem_mb_remove(vm, mb_id);
+		BUG_ON(rc);
+		mutex_lock(&vm->hotplug_mutex);
+	}
+	return 0;
+}
+
+/*
+ * Try to unplug the requested amount of memory.
+ */
+static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
+{
+	uint64_t nb_sb = diff / vm->subblock_size;
+	unsigned long mb_id;
+	int rc;
+
+	if (!nb_sb)
+		return 0;
+
+	/*
+	 * We'll drop the mutex a couple of times when it is safe to do so.
+	 * This might result in some blocks switching the state (online/offline)
+	 * and we could miss them in this run - we will retry again later.
+	 */
+	mutex_lock(&vm->hotplug_mutex);
+
+	/* Try to unplug subblocks of partially plugged offline blocks. */
+	virtio_mem_for_each_mb_state(vm, mb_id,
+				     VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL) {
+		rc = virtio_mem_mb_unplug_any_sb_offline(vm, mb_id,
+							 &nb_sb);
+		if (rc || !nb_sb)
+			goto out_unlock;
+		cond_resched();
+	}
+
+	/* Try to unplug subblocks of plugged offline blocks. */
+	virtio_mem_for_each_mb_state(vm, mb_id, VIRTIO_MEM_MB_STATE_OFFLINE) {
+		rc = virtio_mem_mb_unplug_any_sb_offline(vm, mb_id,
+							 &nb_sb);
+		if (rc || !nb_sb)
+			goto out_unlock;
+		cond_resched();
+	}
+
+	mutex_unlock(&vm->hotplug_mutex);
+	return 0;
+out_unlock:
+	mutex_unlock(&vm->hotplug_mutex);
+	return rc;
+}
+
 /*
  * Try to unplug all blocks that couldn't be unplugged before, for example,
  * because the hypervisor was busy.
@@ -1203,8 +1306,10 @@ static void virtio_mem_run_wq(struct work_struct *work)
 		if (vm->requested_size > vm->plugged_size) {
 			diff = vm->requested_size - vm->plugged_size;
 			rc = virtio_mem_plug_request(vm, diff);
+		} else {
+			diff = vm->plugged_size - vm->requested_size;
+			rc = virtio_mem_unplug_request(vm, diff);
 		}
-		/* TODO: try to unplug memory */
 	}
 
 	switch (rc) {
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
