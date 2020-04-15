Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB61A9C9F
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 13:37:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 359AE862B2;
	Wed, 15 Apr 2020 11:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBXzFSZfZ775; Wed, 15 Apr 2020 11:37:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E0BA8657C;
	Wed, 15 Apr 2020 11:37:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01818C0172;
	Wed, 15 Apr 2020 11:37:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D569FC0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 11:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D21E885FCB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 11:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8xcJvGK3q2N
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 11:36:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D45E285F8E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 11:36:59 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CB392076D;
 Wed, 15 Apr 2020 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950619;
 bh=t2vxuyEVvMwBIPi2Bv1grCHBPcE/KbAgC+Ecfy39oI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c+z5CJnDokf+bWawdMucnNmWpX3/bEynrJBwtucpwRBJTf8rn8jEInlcYSi5BqD0v
 5BTwtqJKw8DgoknkGUq9kBEWhYAM+5XcsBARBu9A7dR2FgXQSYxX4QRZowvJP624l+
 LYIzV7hY+EdF6JB4ZVzVVzdgxNpPOPcZ4iLZ9LAU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 111/129] virtio-balloon: Switch back to OOM
 handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Date: Wed, 15 Apr 2020 07:34:26 -0400
Message-Id: <20200415113445.11881-111-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, Tyler Sanderson <tysand@google.com>,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
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

From: David Hildenbrand <david@redhat.com>

[ Upstream commit 5a6b4cc5b7a1892a8d7f63d6cbac6e0ae2a9d031 ]

Commit 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
changed the behavior when deflation happens automatically. Instead of
deflating when called by the OOM handler, the shrinker is used.

However, the balloon is not simply some slab cache that should be
shrunk when under memory pressure. The shrinker does not have a concept of
priorities, so this behavior cannot be configured.

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

Especially, a drop_slab() will result in the whole balloon getting
deflated - undesired. While handling it via the OOM handler might not be
perfect, it keeps existing behavior. If we want a different behavior, then
we need a new feature bit and document it properly (although, there should
be a clear use case and the intended effects should be well described).

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

Note1: using the OOM handler is frowned upon, but it really is what we
       need for this feature.

Note2: without VIRTIO_BALLOON_F_MUST_TELL_HOST (iow, always with QEMU) we
       could actually skip sending deflation requests to our hypervisor,
       making the OOM path *very* simple. Besically freeing pages and
       updating the balloon. If the communication with the host ever
       becomes a problem on this call path.

[1] https://www.spinics.net/lists/linux-virtualization/msg40863.html

Test report by Tyler Sanderson:

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

Attached [1] is a png of a graph showing the problematic behavior without
this patch. It shows deflate-queue activity increasing linearly while
balloon size stays constant over the course of more than 8 minutes of
the test.

[1] https://lore.kernel.org/linux-mm/CAJuQAmphPcfew1v_EOgAdSFiprzjiZjmOf3iJDmFX0gD6b9TYQ@mail.gmail.com/2-without_patch.png

Full test report and discussion [2]:

[2] https://lore.kernel.org/r/CAJuQAmphPcfew1v_EOgAdSFiprzjiZjmOf3iJDmFX0gD6b9TYQ@mail.gmail.com

Tested-by: Tyler Sanderson <tysand@google.com>
Reported-by: Tyler Sanderson <tysand@google.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Wei Wang <wei.w.wang@intel.com>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Nadav Amit <namit@vmware.com>
Cc: Michal Hocko <mhocko@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Link: https://lore.kernel.org/r/20200205163402.42627-4-david@redhat.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/virtio/virtio_balloon.c | 107 +++++++++++++-------------------
 1 file changed, 44 insertions(+), 63 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 341458fd95ca4..44375a22307b3 100644
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
@@ -27,7 +28,9 @@
  */
 #define VIRTIO_BALLOON_PAGES_PER_PAGE (unsigned)(PAGE_SIZE >> VIRTIO_BALLOON_PFN_SHIFT)
 #define VIRTIO_BALLOON_ARRAY_PFNS_MAX 256
-#define VIRTBALLOON_OOM_NOTIFY_PRIORITY 80
+/* Maximum number of (4k) pages to deflate on OOM notifications. */
+#define VIRTIO_BALLOON_OOM_NR_PAGES 256
+#define VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY 80
 
 #define VIRTIO_BALLOON_FREE_PAGE_ALLOC_FLAG (__GFP_NORETRY | __GFP_NOWARN | \
 					     __GFP_NOMEMALLOC)
@@ -112,8 +115,11 @@ struct virtio_balloon {
 	/* Memory statistics */
 	struct virtio_balloon_stat stats[VIRTIO_BALLOON_S_NR];
 
-	/* To register a shrinker to shrink memory upon memory pressure */
+	/* Shrinker to return free pages - VIRTIO_BALLOON_F_FREE_PAGE_HINT */
 	struct shrinker shrinker;
+
+	/* OOM notifier to deflate on OOM - VIRTIO_BALLOON_F_DEFLATE_ON_OOM */
+	struct notifier_block oom_nb;
 };
 
 static struct virtio_device_id id_table[] = {
@@ -788,50 +794,13 @@ static unsigned long shrink_free_pages(struct virtio_balloon *vb,
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
@@ -839,26 +808,22 @@ static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
 {
 	struct virtio_balloon *vb = container_of(shrinker,
 					struct virtio_balloon, shrinker);
-	unsigned long count;
-
-	count = vb->num_pages / VIRTIO_BALLOON_PAGES_PER_PAGE;
-	count += vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
 
-	return count;
+	return vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
 }
 
-static void virtio_balloon_unregister_shrinker(struct virtio_balloon *vb)
+static int virtio_balloon_oom_notify(struct notifier_block *nb,
+				     unsigned long dummy, void *parm)
 {
-	unregister_shrinker(&vb->shrinker);
-}
+	struct virtio_balloon *vb = container_of(nb,
+						 struct virtio_balloon, oom_nb);
+	unsigned long *freed = parm;
 
-static int virtio_balloon_register_shrinker(struct virtio_balloon *vb)
-{
-	vb->shrinker.scan_objects = virtio_balloon_shrinker_scan;
-	vb->shrinker.count_objects = virtio_balloon_shrinker_count;
-	vb->shrinker.seeks = DEFAULT_SEEKS;
+	*freed += leak_balloon(vb, VIRTIO_BALLOON_OOM_NR_PAGES) /
+		  VIRTIO_BALLOON_PAGES_PER_PAGE;
+	update_balloon_size(vb);
 
-	return register_shrinker(&vb->shrinker);
+	return NOTIFY_OK;
 }
 
 static int virtballoon_probe(struct virtio_device *vdev)
@@ -935,22 +900,35 @@ static int virtballoon_probe(struct virtio_device *vdev)
 			virtio_cwrite(vb->vdev, struct virtio_balloon_config,
 				      poison_val, &poison_val);
 		}
-	}
-	/*
-	 * We continue to use VIRTIO_BALLOON_F_DEFLATE_ON_OOM to decide if a
-	 * shrinker needs to be registered to relieve memory pressure.
-	 */
-	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
-		err = virtio_balloon_register_shrinker(vb);
+
+		/*
+		 * We're allowed to reuse any free pages, even if they are
+		 * still to be processed by the host.
+		 */
+		vb->shrinker.scan_objects = virtio_balloon_shrinker_scan;
+		vb->shrinker.count_objects = virtio_balloon_shrinker_count;
+		vb->shrinker.seeks = DEFAULT_SEEKS;
+		err = register_shrinker(&vb->shrinker);
 		if (err)
 			goto out_del_balloon_wq;
 	}
+	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
+		vb->oom_nb.notifier_call = virtio_balloon_oom_notify;
+		vb->oom_nb.priority = VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY;
+		err = register_oom_notifier(&vb->oom_nb);
+		if (err < 0)
+			goto out_unregister_shrinker;
+	}
+
 	virtio_device_ready(vdev);
 
 	if (towards_target(vb))
 		virtballoon_changed(vdev);
 	return 0;
 
+out_unregister_shrinker:
+	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
+		unregister_shrinker(&vb->shrinker);
 out_del_balloon_wq:
 	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
 		destroy_workqueue(vb->balloon_wq);
@@ -989,8 +967,11 @@ static void virtballoon_remove(struct virtio_device *vdev)
 {
 	struct virtio_balloon *vb = vdev->priv;
 
-	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
-		virtio_balloon_unregister_shrinker(vb);
+	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
+		unregister_oom_notifier(&vb->oom_nb);
+	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
+		unregister_shrinker(&vb->shrinker);
+
 	spin_lock_irq(&vb->stop_update_lock);
 	vb->stop_update = true;
 	spin_unlock_irq(&vb->stop_update_lock);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
