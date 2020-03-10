Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D332917F672
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 12:39:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74CFE86B7A;
	Tue, 10 Mar 2020 11:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVzW1eGl4Kyi; Tue, 10 Mar 2020 11:39:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 21C6B86B7E;
	Tue, 10 Mar 2020 11:39:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05A1BC0177;
	Tue, 10 Mar 2020 11:39:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDF37C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CC676882F8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAXRZyt2OUBs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:39:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 58DBC87BD4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 11:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583840352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jYyaTcgwaf+Ab6kZAkjqe1I6QREcj9m2tO6nfw5ZQhs=;
 b=KiZsMKxEEjSp59Y9S16aVl+ujCzy0n8rPBorbsDwkwB/OxKCV5A2ilNAdGVecepgvVTbCW
 Qj2AMDyA6YRESFuXrsXaeTyMWqcDqS6AAyo7udgD6rDyVkg6H/33oIpxOFrYKK2wJWMVIz
 dJOBD1ijUEqdrs2Eda3SQ+meFc6CINo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-VDq5mprMPNyVsFVBJ2MGbg-1; Tue, 10 Mar 2020 07:39:09 -0400
X-MC-Unique: VDq5mprMPNyVsFVBJ2MGbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9E7D8017CC;
 Tue, 10 Mar 2020 11:39:06 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.36.118.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C25295D9CA;
 Tue, 10 Mar 2020 11:38:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Date: Tue, 10 Mar 2020 12:38:54 +0100
Message-Id: <20200310113854.11515-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, Tyler Sanderson <tysand@google.com>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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

Commit 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
changed the behavior when deflation happens automatically. Instead of
deflating when called by the OOM handler, the shrinker is used.

However, the balloon is not simply some other slab cache that should be
shrunk when under memory pressure. The shrinker does not have a concept of
priorities yet, so this behavior cannot be configured. Eventually once
that is in place, we might want to switch back after doing proper
testing.

There was a report that this results in undesired side effects when
inflating the balloon to shrink the page cache. [1]
	"When inflating the balloon against page cache (i.e. no free memory
	 remains) vmscan.c will both shrink page cache, but also invoke the
	 shrinkers -- including the balloon's shrinker. So the balloon
	 driver allocates memory which requires reclaim, vmscan gets this
	 memory by shrinking the balloon, and then the driver adds the
	 memory back to the balloon. Basically a busy no-op."

The name "deflate on OOM" makes it pretty clear when deflation should
happen - after other approaches to reclaim memory failed, not while
reclaiming. This allows to minimize the footprint of a guest - memory
will only be taken out of the balloon when really needed.

Keep using the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT, because
this has no such side effects. Always register the shrinker with
VIRTIO_BALLOON_F_FREE_PAGE_HINT now. We are always allowed to reuse free
pages that are still to be processed by the guest. The hypervisor takes
care of identifying and resolving possible races between processing a
hinting request and the guest reusing a page.

In contrast to pre commit 71994620bb25 ("virtio_balloon: replace oom
notifier with shrinker"), don't add a moodule parameter to configure the
number of pages to deflate on OOM. Can be re-added if really needed.
Also, pay attention that leak_balloon() returns the number of 4k pages -
convert it properly in virtio_balloon_oom_notify().

Testing done by Tyler for future reference:
  Test setup: VM with 16 CPU, 64GB RAM. Running Debian 10. We have a 42
  GB file full of random bytes that we continually cat to /dev/null.
  This fills the page cache as the file is read. Meanwhile we trigger
  the balloon to inflate, with a target size of 53 GB. This setup causes
  the balloon inflation to pressure the page cache as the page cache is
  also trying to grow. Afterwards we shrink the balloon back to zero (so
  total deflate = total inflate).

  Without patch (kernel 4.19.0-5):
  Inflation never reaches the target until we stop the "cat file >
  /dev/null" process. Total inflation time was 542 seconds. The longest
  period that made no net forward progress was 315 seconds (see attached
  graph).
  Result of "grep balloon /proc/vmstat" after the test:
  balloon_inflate 154828377
  balloon_deflate 154828377

  With patch (kernel 5.6.0-rc4+):
  Total inflation duration was 63 seconds. No deflate-queue activity
  occurs when pressuring the page-cache.
  Result of "grep balloon /proc/vmstat" after the test:
  balloon_inflate 12968539
  balloon_deflate 12968539

  Conclusion: This patch fixes the issue. In the test it reduced
  inflate/deflate activity by 12x, and reduced inflation time by 8.6x.
  But more importantly, if we hadn't killed the "grep balloon
  /proc/vmstat" process then, without the patch, the inflation process
  would never reach the target.

[1] https://www.spinics.net/lists/linux-virtualization/msg40863.html

Reported-by: Tyler Sanderson <tysand@google.com>
Tested-by: Tyler Sanderson <tysand@google.com>
Fixes: 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Wei Wang <wei.w.wang@intel.com>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Nadav Amit <namit@vmware.com>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

v2 -> v3:
- Use vb->vdev instead of vdev in all feature checks. We'll clean the
  other ones up later.
- Add one empty line virtballoon_probe() to make it look consistent.
- Drop one unrelated added line in virtballoon_remove()

v1 -> v2:
- Rebase on top of linux-next (free page reporting)
- Clarified some parts in the patch description and added testing
  instructions/results
- Added Fixes: and Tested-by:

As this patch is based on free page reporting, MST suggested to take this
via Andrew's tree.

---
 drivers/virtio/virtio_balloon.c | 103 +++++++++++++++-----------------
 1 file changed, 47 insertions(+), 56 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 8511d258dbb4..b0f15dc779c6 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/balloon_compaction.h>
+#include <linux/oom.h>
 #include <linux/wait.h>
 #include <linux/mm.h>
 #include <linux/mount.h>
@@ -28,7 +29,9 @@
  */
 #define VIRTIO_BALLOON_PAGES_PER_PAGE (unsigned)(PAGE_SIZE >> VIRTIO_BALLOON_PFN_SHIFT)
 #define VIRTIO_BALLOON_ARRAY_PFNS_MAX 256
-#define VIRTBALLOON_OOM_NOTIFY_PRIORITY 80
+/* Maximum number of (4k) pages to deflate on OOM notifications. */
+#define VIRTIO_BALLOON_OOM_NR_PAGES 256
+#define VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY 80
 
 #define VIRTIO_BALLOON_FREE_PAGE_ALLOC_FLAG (__GFP_NORETRY | __GFP_NOWARN | \
 					     __GFP_NOMEMALLOC)
@@ -114,9 +117,12 @@ struct virtio_balloon {
 	/* Memory statistics */
 	struct virtio_balloon_stat stats[VIRTIO_BALLOON_S_NR];
 
-	/* To register a shrinker to shrink memory upon memory pressure */
+	/* Shrinker to return free pages - VIRTIO_BALLOON_F_FREE_PAGE_HINT */
 	struct shrinker shrinker;
 
+	/* OOM notifier to deflate on OOM - VIRTIO_BALLOON_F_DEFLATE_ON_OOM */
+	struct notifier_block oom_nb;
+
 	/* Free page reporting device */
 	struct virtqueue *reporting_vq;
 	struct page_reporting_dev_info pr_dev_info;
@@ -830,50 +836,13 @@ static unsigned long shrink_free_pages(struct virtio_balloon *vb,
 	return blocks_freed * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
 }
 
-static unsigned long leak_balloon_pages(struct virtio_balloon *vb,
-                                          unsigned long pages_to_free)
-{
-	return leak_balloon(vb, pages_to_free * VIRTIO_BALLOON_PAGES_PER_PAGE) /
-		VIRTIO_BALLOON_PAGES_PER_PAGE;
-}
-
-static unsigned long shrink_balloon_pages(struct virtio_balloon *vb,
-					  unsigned long pages_to_free)
-{
-	unsigned long pages_freed = 0;
-
-	/*
-	 * One invocation of leak_balloon can deflate at most
-	 * VIRTIO_BALLOON_ARRAY_PFNS_MAX balloon pages, so we call it
-	 * multiple times to deflate pages till reaching pages_to_free.
-	 */
-	while (vb->num_pages && pages_freed < pages_to_free)
-		pages_freed += leak_balloon_pages(vb,
-						  pages_to_free - pages_freed);
-
-	update_balloon_size(vb);
-
-	return pages_freed;
-}
-
 static unsigned long virtio_balloon_shrinker_scan(struct shrinker *shrinker,
 						  struct shrink_control *sc)
 {
-	unsigned long pages_to_free, pages_freed = 0;
 	struct virtio_balloon *vb = container_of(shrinker,
 					struct virtio_balloon, shrinker);
 
-	pages_to_free = sc->nr_to_scan;
-
-	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
-		pages_freed = shrink_free_pages(vb, pages_to_free);
-
-	if (pages_freed >= pages_to_free)
-		return pages_freed;
-
-	pages_freed += shrink_balloon_pages(vb, pages_to_free - pages_freed);
-
-	return pages_freed;
+	return shrink_free_pages(vb, sc->nr_to_scan);
 }
 
 static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
@@ -881,12 +850,22 @@ static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
 {
 	struct virtio_balloon *vb = container_of(shrinker,
 					struct virtio_balloon, shrinker);
-	unsigned long count;
 
-	count = vb->num_pages / VIRTIO_BALLOON_PAGES_PER_PAGE;
-	count += vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
+	return vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
+}
+
+static int virtio_balloon_oom_notify(struct notifier_block *nb,
+				     unsigned long dummy, void *parm)
+{
+	struct virtio_balloon *vb = container_of(nb,
+						 struct virtio_balloon, oom_nb);
+	unsigned long *freed = parm;
+
+	*freed += leak_balloon(vb, VIRTIO_BALLOON_OOM_NR_PAGES) /
+		  VIRTIO_BALLOON_PAGES_PER_PAGE;
+	update_balloon_size(vb);
 
-	return count;
+	return NOTIFY_OK;
 }
 
 static void virtio_balloon_unregister_shrinker(struct virtio_balloon *vb)
@@ -971,7 +950,23 @@ static int virtballoon_probe(struct virtio_device *vdev)
 						  VIRTIO_BALLOON_CMD_ID_STOP);
 		spin_lock_init(&vb->free_page_list_lock);
 		INIT_LIST_HEAD(&vb->free_page_list);
+		/*
+		 * We're allowed to reuse any free pages, even if they are
+		 * still to be processed by the host.
+		 */
+		err = virtio_balloon_register_shrinker(vb);
+		if (err)
+			goto out_del_balloon_wq;
+	}
+
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
+		vb->oom_nb.notifier_call = virtio_balloon_oom_notify;
+		vb->oom_nb.priority = VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY;
+		err = register_oom_notifier(&vb->oom_nb);
+		if (err < 0)
+			goto out_unregister_shrinker;
 	}
+
 	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON)) {
 		/* Start with poison val of 0 representing general init */
 		__u32 poison_val = 0;
@@ -986,15 +981,6 @@ static int virtballoon_probe(struct virtio_device *vdev)
 		virtio_cwrite(vb->vdev, struct virtio_balloon_config,
 			      poison_val, &poison_val);
 	}
-	/*
-	 * We continue to use VIRTIO_BALLOON_F_DEFLATE_ON_OOM to decide if a
-	 * shrinker needs to be registered to relieve memory pressure.
-	 */
-	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
-		err = virtio_balloon_register_shrinker(vb);
-		if (err)
-			goto out_del_balloon_wq;
-	}
 
 	vb->pr_dev_info.report = virtballoon_free_page_report;
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING)) {
@@ -1003,12 +989,12 @@ static int virtballoon_probe(struct virtio_device *vdev)
 		capacity = virtqueue_get_vring_size(vb->reporting_vq);
 		if (capacity < PAGE_REPORTING_CAPACITY) {
 			err = -ENOSPC;
-			goto out_unregister_shrinker;
+			goto out_unregister_oom;
 		}
 
 		err = page_reporting_register(&vb->pr_dev_info);
 		if (err)
-			goto out_unregister_shrinker;
+			goto out_unregister_oom;
 	}
 
 	virtio_device_ready(vdev);
@@ -1017,8 +1003,11 @@ static int virtballoon_probe(struct virtio_device *vdev)
 		virtballoon_changed(vdev);
 	return 0;
 
-out_unregister_shrinker:
+out_unregister_oom:
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
+		unregister_oom_notifier(&vb->oom_nb);
+out_unregister_shrinker:
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
 		virtio_balloon_unregister_shrinker(vb);
 out_del_balloon_wq:
 	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
@@ -1061,6 +1050,8 @@ static void virtballoon_remove(struct virtio_device *vdev)
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
 		page_reporting_unregister(&vb->pr_dev_info);
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
+		unregister_oom_notifier(&vb->oom_nb);
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
 		virtio_balloon_unregister_shrinker(vb);
 	spin_lock_irq(&vb->stop_update_lock);
 	vb->stop_update = true;
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
