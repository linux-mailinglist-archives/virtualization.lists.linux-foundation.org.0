Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC801F2389
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 01:15:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 45E9F87B3E;
	Mon,  8 Jun 2020 23:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezCnHeEWlCWm; Mon,  8 Jun 2020 23:15:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 954B988364;
	Mon,  8 Jun 2020 23:15:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62BBAC016F;
	Mon,  8 Jun 2020 23:15:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6039C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 23:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AC91021509
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 23:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OCfIVg2RA1h
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 23:15:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 4C5A5204FB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 23:15:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72D6920659;
 Mon,  8 Jun 2020 23:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658130;
 bh=gL58T2l+VxFbECqv+1prH9CNa859ONoY9tJLzNTc4zQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nKGoQXZRlFxBGarqTQ65InCkk8fuMcDGmawFsgMhAiGuuGW9rx9+6NRaseg2mh+Fe
 /w0xZijq1ia4iwFYElMa+yhIO/VP4ED/s3JHAIJeRnlt822K0Jij7K4M2renHflB3v
 sndO38juaU5Ex2erDYiEHVyC0XOD3zpM1c5KAh0Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 165/606] virtio-balloon: Revert "virtio-balloon:
 Switch back to OOM handler for VIRTIO_BALLOON_F_DEFLATE_ON_OOM"
Date: Mon,  8 Jun 2020 19:04:50 -0400
Message-Id: <20200608231211.3363633-165-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

From: "Michael S. Tsirkin" <mst@redhat.com>

[ Upstream commit 835a6a649d0dd1b1f46759eb60fff2f63ed253a7 ]

This reverts commit 5a6b4cc5b7a1892a8d7f63d6cbac6e0ae2a9d031.

It has been queued properly in the akpm tree, this version is just
creating conflicts.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/virtio/virtio_balloon.c | 107 +++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 44 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 44375a22307b..341458fd95ca 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -14,7 +14,6 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/balloon_compaction.h>
-#include <linux/oom.h>
 #include <linux/wait.h>
 #include <linux/mm.h>
 #include <linux/mount.h>
@@ -28,9 +27,7 @@
  */
 #define VIRTIO_BALLOON_PAGES_PER_PAGE (unsigned)(PAGE_SIZE >> VIRTIO_BALLOON_PFN_SHIFT)
 #define VIRTIO_BALLOON_ARRAY_PFNS_MAX 256
-/* Maximum number of (4k) pages to deflate on OOM notifications. */
-#define VIRTIO_BALLOON_OOM_NR_PAGES 256
-#define VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY 80
+#define VIRTBALLOON_OOM_NOTIFY_PRIORITY 80
 
 #define VIRTIO_BALLOON_FREE_PAGE_ALLOC_FLAG (__GFP_NORETRY | __GFP_NOWARN | \
 					     __GFP_NOMEMALLOC)
@@ -115,11 +112,8 @@ struct virtio_balloon {
 	/* Memory statistics */
 	struct virtio_balloon_stat stats[VIRTIO_BALLOON_S_NR];
 
-	/* Shrinker to return free pages - VIRTIO_BALLOON_F_FREE_PAGE_HINT */
+	/* To register a shrinker to shrink memory upon memory pressure */
 	struct shrinker shrinker;
-
-	/* OOM notifier to deflate on OOM - VIRTIO_BALLOON_F_DEFLATE_ON_OOM */
-	struct notifier_block oom_nb;
 };
 
 static struct virtio_device_id id_table[] = {
@@ -794,13 +788,50 @@ static unsigned long shrink_free_pages(struct virtio_balloon *vb,
 	return blocks_freed * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
 }
 
+static unsigned long leak_balloon_pages(struct virtio_balloon *vb,
+                                          unsigned long pages_to_free)
+{
+	return leak_balloon(vb, pages_to_free * VIRTIO_BALLOON_PAGES_PER_PAGE) /
+		VIRTIO_BALLOON_PAGES_PER_PAGE;
+}
+
+static unsigned long shrink_balloon_pages(struct virtio_balloon *vb,
+					  unsigned long pages_to_free)
+{
+	unsigned long pages_freed = 0;
+
+	/*
+	 * One invocation of leak_balloon can deflate at most
+	 * VIRTIO_BALLOON_ARRAY_PFNS_MAX balloon pages, so we call it
+	 * multiple times to deflate pages till reaching pages_to_free.
+	 */
+	while (vb->num_pages && pages_freed < pages_to_free)
+		pages_freed += leak_balloon_pages(vb,
+						  pages_to_free - pages_freed);
+
+	update_balloon_size(vb);
+
+	return pages_freed;
+}
+
 static unsigned long virtio_balloon_shrinker_scan(struct shrinker *shrinker,
 						  struct shrink_control *sc)
 {
+	unsigned long pages_to_free, pages_freed = 0;
 	struct virtio_balloon *vb = container_of(shrinker,
 					struct virtio_balloon, shrinker);
 
-	return shrink_free_pages(vb, sc->nr_to_scan);
+	pages_to_free = sc->nr_to_scan;
+
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
+		pages_freed = shrink_free_pages(vb, pages_to_free);
+
+	if (pages_freed >= pages_to_free)
+		return pages_freed;
+
+	pages_freed += shrink_balloon_pages(vb, pages_to_free - pages_freed);
+
+	return pages_freed;
 }
 
 static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
@@ -808,22 +839,26 @@ static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
 {
 	struct virtio_balloon *vb = container_of(shrinker,
 					struct virtio_balloon, shrinker);
+	unsigned long count;
+
+	count = vb->num_pages / VIRTIO_BALLOON_PAGES_PER_PAGE;
+	count += vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
 
-	return vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
+	return count;
 }
 
-static int virtio_balloon_oom_notify(struct notifier_block *nb,
-				     unsigned long dummy, void *parm)
+static void virtio_balloon_unregister_shrinker(struct virtio_balloon *vb)
 {
-	struct virtio_balloon *vb = container_of(nb,
-						 struct virtio_balloon, oom_nb);
-	unsigned long *freed = parm;
+	unregister_shrinker(&vb->shrinker);
+}
 
-	*freed += leak_balloon(vb, VIRTIO_BALLOON_OOM_NR_PAGES) /
-		  VIRTIO_BALLOON_PAGES_PER_PAGE;
-	update_balloon_size(vb);
+static int virtio_balloon_register_shrinker(struct virtio_balloon *vb)
+{
+	vb->shrinker.scan_objects = virtio_balloon_shrinker_scan;
+	vb->shrinker.count_objects = virtio_balloon_shrinker_count;
+	vb->shrinker.seeks = DEFAULT_SEEKS;
 
-	return NOTIFY_OK;
+	return register_shrinker(&vb->shrinker);
 }
 
 static int virtballoon_probe(struct virtio_device *vdev)
@@ -900,35 +935,22 @@ static int virtballoon_probe(struct virtio_device *vdev)
 			virtio_cwrite(vb->vdev, struct virtio_balloon_config,
 				      poison_val, &poison_val);
 		}
-
-		/*
-		 * We're allowed to reuse any free pages, even if they are
-		 * still to be processed by the host.
-		 */
-		vb->shrinker.scan_objects = virtio_balloon_shrinker_scan;
-		vb->shrinker.count_objects = virtio_balloon_shrinker_count;
-		vb->shrinker.seeks = DEFAULT_SEEKS;
-		err = register_shrinker(&vb->shrinker);
+	}
+	/*
+	 * We continue to use VIRTIO_BALLOON_F_DEFLATE_ON_OOM to decide if a
+	 * shrinker needs to be registered to relieve memory pressure.
+	 */
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
+		err = virtio_balloon_register_shrinker(vb);
 		if (err)
 			goto out_del_balloon_wq;
 	}
-	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
-		vb->oom_nb.notifier_call = virtio_balloon_oom_notify;
-		vb->oom_nb.priority = VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY;
-		err = register_oom_notifier(&vb->oom_nb);
-		if (err < 0)
-			goto out_unregister_shrinker;
-	}
-
 	virtio_device_ready(vdev);
 
 	if (towards_target(vb))
 		virtballoon_changed(vdev);
 	return 0;
 
-out_unregister_shrinker:
-	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
-		unregister_shrinker(&vb->shrinker);
 out_del_balloon_wq:
 	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
 		destroy_workqueue(vb->balloon_wq);
@@ -967,11 +989,8 @@ static void virtballoon_remove(struct virtio_device *vdev)
 {
 	struct virtio_balloon *vb = vdev->priv;
 
-	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
-		unregister_oom_notifier(&vb->oom_nb);
-	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
-		unregister_shrinker(&vb->shrinker);
-
+	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
+		virtio_balloon_unregister_shrinker(vb);
 	spin_lock_irq(&vb->stop_update_lock);
 	vb->stop_update = true;
 	spin_unlock_irq(&vb->stop_update_lock);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
