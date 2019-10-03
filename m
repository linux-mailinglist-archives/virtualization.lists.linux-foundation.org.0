Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D5CB031
	for <lists.virtualization@lfdr.de>; Thu,  3 Oct 2019 22:33:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 86AF5157F;
	Thu,  3 Oct 2019 20:33:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BF22A157A
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 20:33:49 +0000 (UTC)
X-Greylist: delayed 00:13:19 by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D0773D3
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 20:33:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id BBEC5B04F;
	Thu,  3 Oct 2019 20:20:27 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: akpm@linux-foundation.org
Subject: [PATCH 07/11] vhost: convert vhost_umem_interval_tree to half closed
	intervals
Date: Thu,  3 Oct 2019 13:18:54 -0700
Message-Id: <20191003201858.11666-8-dave@stgolabs.net>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191003201858.11666-1-dave@stgolabs.net>
References: <20191003201858.11666-1-dave@stgolabs.net>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dave@stgolabs.net, Davidlohr Bueso <dbueso@suse.de>,
	peterz@infradead.org, Michael@mail.linuxfoundation.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	walken@google.com, linux-rdma@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The vhost_umem interval tree really wants [a, b) intervals,
not fully closed as currently. As such convert it to use the
new interval_tree_gen.h, and also rename the 'last' endpoint
in the node to 'end', which both a more suitable name for
the half closed interval and also reduces the chances of some
caller being missed.

Cc: Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 drivers/vhost/vhost.c | 19 +++++++++----------
 drivers/vhost/vhost.h |  4 ++--
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 36ca2cf419bf..80c3cca24dc7 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -28,7 +28,7 @@
 #include <linux/sort.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/signal.h>
-#include <linux/interval_tree_generic.h>
+#include <linux/interval_tree_gen.h>
 #include <linux/nospec.h>
 
 #include "vhost.h"
@@ -51,7 +51,7 @@ enum {
 
 INTERVAL_TREE_DEFINE(struct vhost_umem_node,
 		     rb, __u64, __subtree_last,
-		     START, LAST, static inline, vhost_umem_interval_tree);
+		     START, END, static inline, vhost_umem_interval_tree);
 
 #ifdef CONFIG_VHOST_CROSS_ENDIAN_LEGACY
 static void vhost_disable_cross_endian(struct vhost_virtqueue *vq)
@@ -1034,7 +1034,7 @@ static int vhost_new_umem_range(struct vhost_umem *umem,
 
 	node->start = start;
 	node->size = size;
-	node->last = end;
+	node->end = end;
 	node->userspace_addr = userspace_addr;
 	node->perm = perm;
 	INIT_LIST_HEAD(&node->link);
@@ -1112,7 +1112,7 @@ static int vhost_process_iotlb_msg(struct vhost_dev *dev,
 		}
 		vhost_vq_meta_reset(dev);
 		if (vhost_new_umem_range(dev->iotlb, msg->iova, msg->size,
-					 msg->iova + msg->size - 1,
+					 msg->iova + msg->size,
 					 msg->uaddr, msg->perm)) {
 			ret = -ENOMEM;
 			break;
@@ -1126,7 +1126,7 @@ static int vhost_process_iotlb_msg(struct vhost_dev *dev,
 		}
 		vhost_vq_meta_reset(dev);
 		vhost_del_umem_range(dev->iotlb, msg->iova,
-				     msg->iova + msg->size - 1);
+				     msg->iova + msg->size);
 		break;
 	default:
 		ret = -EINVAL;
@@ -1320,15 +1320,14 @@ static bool iotlb_access_ok(struct vhost_virtqueue *vq,
 {
 	const struct vhost_umem_node *node;
 	struct vhost_umem *umem = vq->iotlb;
-	u64 s = 0, size, orig_addr = addr, last = addr + len - 1;
+	u64 s = 0, size, orig_addr = addr, last = addr + len;
 
 	if (vhost_vq_meta_fetch(vq, addr, len, type))
 		return true;
 
 	while (len > s) {
 		node = vhost_umem_interval_tree_iter_first(&umem->umem_tree,
-							   addr,
-							   last);
+							   addr, last);
 		if (node == NULL || node->start > addr) {
 			vhost_iotlb_miss(vq, addr, access);
 			return false;
@@ -1455,7 +1454,7 @@ static long vhost_set_memory(struct vhost_dev *d, struct vhost_memory __user *m)
 					 region->guest_phys_addr,
 					 region->memory_size,
 					 region->guest_phys_addr +
-					 region->memory_size - 1,
+					 region->memory_size,
 					 region->userspace_addr,
 					 VHOST_ACCESS_RW))
 			goto err;
@@ -2055,7 +2054,7 @@ static int translate_desc(struct vhost_virtqueue *vq, u64 addr, u32 len,
 		}
 
 		node = vhost_umem_interval_tree_iter_first(&umem->umem_tree,
-							addr, addr + len - 1);
+							   addr, addr + len);
 		if (node == NULL || node->start > addr) {
 			if (umem != dev->iotlb) {
 				ret = -EFAULT;
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index e9ed2722b633..bb36cb9ed5ec 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -53,13 +53,13 @@ struct vhost_log {
 };
 
 #define START(node) ((node)->start)
-#define LAST(node) ((node)->last)
+#define END(node) ((node)->end)
 
 struct vhost_umem_node {
 	struct rb_node rb;
 	struct list_head link;
 	__u64 start;
-	__u64 last;
+	__u64 end;
 	__u64 size;
 	__u64 userspace_addr;
 	__u32 perm;
-- 
2.16.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
