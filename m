Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A1F8454F
	for <lists.virtualization@lfdr.de>; Wed,  7 Aug 2019 09:07:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C1722E35;
	Wed,  7 Aug 2019 07:06:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 784D4E2F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 07:06:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9EBE282F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 07:06:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 304BD30BA1B9;
	Wed,  7 Aug 2019 07:06:47 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
	(hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A96071001DC0;
	Wed,  7 Aug 2019 07:06:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: [PATCH V4 7/9] vhost: do not use RCU to synchronize MMU notifier with
	worker
Date: Wed,  7 Aug 2019 03:06:15 -0400
Message-Id: <20190807070617.23716-8-jasowang@redhat.com>
In-Reply-To: <20190807070617.23716-1-jasowang@redhat.com>
References: <20190807070617.23716-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 07 Aug 2019 07:06:47 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, jgg@ziepe.ca
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

We used to use RCU to synchronize MMU notifier with worker. This leads
calling synchronize_rcu() in invalidate_range_start(). But on a busy
system, there would be many factors that may slow down the
synchronize_rcu() which makes it unsuitable to be called in MMU
notifier.

So this patch switches use seqlock counter to track whether or not the
map was used. The counter was increased when vq try to start or finish
uses the map. This means, when it was even, we're sure there's no
readers and MMU notifier is synchronized. When it was odd, it means
there's a reader we need to wait it to be even again then we are
synchronized. Consider the read critical section is pretty small the
synchronization should be done very fast.

Reported-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual address")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vhost.c | 141 ++++++++++++++++++++++++++----------------
 drivers/vhost/vhost.h |   7 ++-
 2 files changed, 90 insertions(+), 58 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index cfc11f9ed9c9..57bfbb60d960 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -324,17 +324,16 @@ static void vhost_uninit_vq_maps(struct vhost_virtqueue *vq)
 
 	spin_lock(&vq->mmu_lock);
 	for (i = 0; i < VHOST_NUM_ADDRS; i++) {
-		map[i] = rcu_dereference_protected(vq->maps[i],
-				  lockdep_is_held(&vq->mmu_lock));
+		map[i] = vq->maps[i];
 		if (map[i]) {
 			vhost_set_map_dirty(vq, map[i], i);
-			rcu_assign_pointer(vq->maps[i], NULL);
+			vq->maps[i] = NULL;
 		}
 	}
 	spin_unlock(&vq->mmu_lock);
 
-	/* No need for synchronize_rcu() or kfree_rcu() since we are
-	 * serialized with memory accessors (e.g vq mutex held).
+	/* No need for synchronization since we are serialized with
+	 * memory accessors (e.g vq mutex held).
 	 */
 
 	for (i = 0; i < VHOST_NUM_ADDRS; i++)
@@ -362,6 +361,40 @@ static bool vhost_map_range_overlap(struct vhost_uaddr *uaddr,
 	return !(end < uaddr->uaddr || start > uaddr->uaddr - 1 + uaddr->size);
 }
 
+static void inline vhost_vq_access_map_begin(struct vhost_virtqueue *vq)
+{
+	write_seqcount_begin(&vq->seq);
+}
+
+static void inline vhost_vq_access_map_end(struct vhost_virtqueue *vq)
+{
+	write_seqcount_end(&vq->seq);
+}
+
+static void inline vhost_vq_sync_access(struct vhost_virtqueue *vq)
+{
+	unsigned int seq;
+
+	/* Make sure any changes to map was done before checking seq
+	 * counter. Paired with smp_wmb() in write_seqcount_begin().
+	 */
+	smp_mb();
+	seq = raw_read_seqcount(&vq->seq);
+	/* Odd means the map was currently accessed by vhost worker */
+	if (seq & 0x1) {
+		/* When seq changes, we are sure no reader can see
+		 * previous map */
+		while (raw_read_seqcount(&vq->seq) == seq) {
+			if (need_resched())
+				schedule();
+		}
+	}
+	/* Make sure seq counter was checked before map is
+	 * freed. Paired with smp_wmb() in write_seqcount_end().
+	 */
+	smp_mb();
+}
+
 static void vhost_invalidate_vq_start(struct vhost_virtqueue *vq,
 				      int index,
 				      unsigned long start,
@@ -376,16 +409,15 @@ static void vhost_invalidate_vq_start(struct vhost_virtqueue *vq,
 	spin_lock(&vq->mmu_lock);
 	++vq->invalidate_count;
 
-	map = rcu_dereference_protected(vq->maps[index],
-					lockdep_is_held(&vq->mmu_lock));
+	map = vq->maps[index];
 	if (map) {
 		vhost_set_map_dirty(vq, map, index);
-		rcu_assign_pointer(vq->maps[index], NULL);
+		vq->maps[index] = NULL;
 	}
 	spin_unlock(&vq->mmu_lock);
 
 	if (map) {
-		synchronize_rcu();
+		vhost_vq_sync_access(vq);
 		vhost_map_unprefetch(map);
 	}
 }
@@ -457,7 +489,7 @@ static void vhost_init_maps(struct vhost_dev *dev)
 	for (i = 0; i < dev->nvqs; ++i) {
 		vq = dev->vqs[i];
 		for (j = 0; j < VHOST_NUM_ADDRS; j++)
-			RCU_INIT_POINTER(vq->maps[j], NULL);
+			vq->maps[j] = NULL;
 	}
 }
 #endif
@@ -655,6 +687,7 @@ void vhost_dev_init(struct vhost_dev *dev,
 		vq->indirect = NULL;
 		vq->heads = NULL;
 		vq->dev = dev;
+		seqcount_init(&vq->seq);
 		mutex_init(&vq->mutex);
 		spin_lock_init(&vq->mmu_lock);
 		vhost_vq_reset(dev, vq);
@@ -921,7 +954,7 @@ static int vhost_map_prefetch(struct vhost_virtqueue *vq,
 	map->npages = npages;
 	map->pages = pages;
 
-	rcu_assign_pointer(vq->maps[index], map);
+	vq->maps[index] = map;
 	/* No need for a synchronize_rcu(). This function should be
 	 * called by dev->worker so we are serialized with all
 	 * readers.
@@ -1216,18 +1249,18 @@ static inline int vhost_put_avail_event(struct vhost_virtqueue *vq)
 	struct vring_used *used;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
+		vhost_vq_access_map_begin(vq);
 
-		map = rcu_dereference(vq->maps[VHOST_ADDR_USED]);
+		map = vq->maps[VHOST_ADDR_USED];
 		if (likely(map)) {
 			used = map->addr;
 			*((__virtio16 *)&used->ring[vq->num]) =
 				cpu_to_vhost16(vq, vq->avail_idx);
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
 
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1245,18 +1278,18 @@ static inline int vhost_put_used(struct vhost_virtqueue *vq,
 	size_t size;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
+		vhost_vq_access_map_begin(vq);
 
-		map = rcu_dereference(vq->maps[VHOST_ADDR_USED]);
+		map = vq->maps[VHOST_ADDR_USED];
 		if (likely(map)) {
 			used = map->addr;
 			size = count * sizeof(*head);
 			memcpy(used->ring + idx, head, size);
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
 
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1272,17 +1305,17 @@ static inline int vhost_put_used_flags(struct vhost_virtqueue *vq)
 	struct vring_used *used;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
+		vhost_vq_access_map_begin(vq);
 
-		map = rcu_dereference(vq->maps[VHOST_ADDR_USED]);
+		map = vq->maps[VHOST_ADDR_USED];
 		if (likely(map)) {
 			used = map->addr;
 			used->flags = cpu_to_vhost16(vq, vq->used_flags);
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
 
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1298,17 +1331,17 @@ static inline int vhost_put_used_idx(struct vhost_virtqueue *vq)
 	struct vring_used *used;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
+		vhost_vq_access_map_begin(vq);
 
-		map = rcu_dereference(vq->maps[VHOST_ADDR_USED]);
+		map = vq->maps[VHOST_ADDR_USED];
 		if (likely(map)) {
 			used = map->addr;
 			used->idx = cpu_to_vhost16(vq, vq->last_used_idx);
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
 
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1362,17 +1395,17 @@ static inline int vhost_get_avail_idx(struct vhost_virtqueue *vq,
 	struct vring_avail *avail;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
+		vhost_vq_access_map_begin(vq);
 
-		map = rcu_dereference(vq->maps[VHOST_ADDR_AVAIL]);
+		map = vq->maps[VHOST_ADDR_AVAIL];
 		if (likely(map)) {
 			avail = map->addr;
 			*idx = avail->idx;
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
 
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1387,17 +1420,17 @@ static inline int vhost_get_avail_head(struct vhost_virtqueue *vq,
 	struct vring_avail *avail;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
+		vhost_vq_access_map_begin(vq);
 
-		map = rcu_dereference(vq->maps[VHOST_ADDR_AVAIL]);
+		map = vq->maps[VHOST_ADDR_AVAIL];
 		if (likely(map)) {
 			avail = map->addr;
 			*head = avail->ring[idx & (vq->num - 1)];
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
 
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1413,17 +1446,17 @@ static inline int vhost_get_avail_flags(struct vhost_virtqueue *vq,
 	struct vring_avail *avail;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
+		vhost_vq_access_map_begin(vq);
 
-		map = rcu_dereference(vq->maps[VHOST_ADDR_AVAIL]);
+		map = vq->maps[VHOST_ADDR_AVAIL];
 		if (likely(map)) {
 			avail = map->addr;
 			*flags = avail->flags;
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
 
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1438,15 +1471,15 @@ static inline int vhost_get_used_event(struct vhost_virtqueue *vq,
 	struct vring_avail *avail;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
-		map = rcu_dereference(vq->maps[VHOST_ADDR_AVAIL]);
+		vhost_vq_access_map_begin(vq);
+		map = vq->maps[VHOST_ADDR_AVAIL];
 		if (likely(map)) {
 			avail = map->addr;
 			*event = (__virtio16)avail->ring[vq->num];
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1461,17 +1494,17 @@ static inline int vhost_get_used_idx(struct vhost_virtqueue *vq,
 	struct vring_used *used;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
+		vhost_vq_access_map_begin(vq);
 
-		map = rcu_dereference(vq->maps[VHOST_ADDR_USED]);
+		map = vq->maps[VHOST_ADDR_USED];
 		if (likely(map)) {
 			used = map->addr;
 			*idx = used->idx;
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
 
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1486,17 +1519,17 @@ static inline int vhost_get_desc(struct vhost_virtqueue *vq,
 	struct vring_desc *d;
 
 	if (!vq->iotlb) {
-		rcu_read_lock();
+		vhost_vq_access_map_begin(vq);
 
-		map = rcu_dereference(vq->maps[VHOST_ADDR_DESC]);
+		map = vq->maps[VHOST_ADDR_DESC];
 		if (likely(map)) {
 			d = map->addr;
 			*desc = *(d + idx);
-			rcu_read_unlock();
+			vhost_vq_access_map_end(vq);
 			return 0;
 		}
 
-		rcu_read_unlock();
+		vhost_vq_access_map_end(vq);
 	}
 #endif
 
@@ -1843,13 +1876,11 @@ static bool iotlb_access_ok(struct vhost_virtqueue *vq,
 #if VHOST_ARCH_CAN_ACCEL_UACCESS
 static void vhost_vq_map_prefetch(struct vhost_virtqueue *vq)
 {
-	struct vhost_map __rcu *map;
+	struct vhost_map *map;
 	int i;
 
 	for (i = 0; i < VHOST_NUM_ADDRS; i++) {
-		rcu_read_lock();
-		map = rcu_dereference(vq->maps[i]);
-		rcu_read_unlock();
+		map = vq->maps[i];
 		if (unlikely(!map))
 			vhost_map_prefetch(vq, i);
 	}
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index a9a2a93857d2..12399e7c7a61 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -115,16 +115,17 @@ struct vhost_virtqueue {
 #if VHOST_ARCH_CAN_ACCEL_UACCESS
 	/* Read by memory accessors, modified by meta data
 	 * prefetching, MMU notifier and vring ioctl().
-	 * Synchonrized through mmu_lock (writers) and RCU (writers
-	 * and readers).
+	 * Synchonrized through mmu_lock (writers) and seqlock
+         * counters,  see vhost_vq_access_map_{begin|end}().
 	 */
-	struct vhost_map __rcu *maps[VHOST_NUM_ADDRS];
+	struct vhost_map *maps[VHOST_NUM_ADDRS];
 	/* Read by MMU notifier, modified by vring ioctl(),
 	 * synchronized through MMU notifier
 	 * registering/unregistering.
 	 */
 	struct vhost_uaddr uaddrs[VHOST_NUM_ADDRS];
 #endif
+	seqcount_t seq;
 	const struct vhost_umem_node *meta_iotlb[VHOST_NUM_ADDRS];
 
 	struct file *kick;
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
