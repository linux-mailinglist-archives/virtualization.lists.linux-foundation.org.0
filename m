Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C95402FFA63
	for <lists.virtualization@lfdr.de>; Fri, 22 Jan 2021 03:34:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 38B91863CD;
	Fri, 22 Jan 2021 02:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8SMKmuxRSBl; Fri, 22 Jan 2021 02:34:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 24F10861F1;
	Fri, 22 Jan 2021 02:34:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 095D6C013A;
	Fri, 22 Jan 2021 02:34:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33996C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 02:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1F73E86A2E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 02:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vp1ZzrwBO8t
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 02:34:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 72B00861F4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 02:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611282860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mrbE8mBTpGomFbeCrPwbS2wD3DEUWUY4pOy3LzHODGI=;
 b=B3aqYwPQ2Hw8zPy8rvZawwvjEGVZ+zQ0TA6CybS2STjC0Nnc31HEk2zCkwSVuyrQnA6M2D
 r8DHY7G5HfXPeGcavk/7TPwzwvQUbW0w5DXyTTt6IGHlSpcZsfNdQiTs0sNaF6OKG26dZz
 RtaG0ucubvxpPHyF+n2Wi9tWKpNcdtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332--ntZPMBrNhu8ozTAeAa4Rw-1; Thu, 21 Jan 2021 21:34:16 -0500
X-MC-Unique: -ntZPMBrNhu8ozTAeAa4Rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 669CD8144E0;
 Fri, 22 Jan 2021 02:34:14 +0000 (UTC)
Received: from localhost (ovpn-13-11.pek2.redhat.com [10.72.13.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FB5E60855;
 Fri, 22 Jan 2021 02:34:10 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org
Subject: [PATCH V7 04/13] sbitmap: move allocation hint into sbitmap
Date: Fri, 22 Jan 2021 10:33:08 +0800
Message-Id: <20210122023317.687987-5-ming.lei@redhat.com>
In-Reply-To: <20210122023317.687987-1-ming.lei@redhat.com>
References: <20210122023317.687987-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Sumanesh Samanta <sumanesh.samanta@broadcom.com>,
 "Ewan D . Milne" <emilne@redhat.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>, Ming Lei <ming.lei@redhat.com>,
 virtualization@lists.linux-foundation.org, Omar Sandoval <osandov@fb.com>,
 Mike Christie <michael.christie@oracle.com>
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

Allocation hint should have belonged to sbitmap, also when sbitmap's
depth is high and no need to use mulitple wakeup queues, user can
benefit from percpu allocation hint too.

So move allocation hint into sbitmap, then scsi device queue can benefit
from allocation hint when converting to plain sbitmap in the following
patches.

Meantime convert vhost/scsi.c to use sbitmap allocation with percpu
alloc hint, which way is more efficient than previous way.

Cc: Omar Sandoval <osandov@fb.com>
Cc: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: Sumanesh Samanta <sumanesh.samanta@broadcom.com>
Cc: Ewan D. Milne <emilne@redhat.com>
Cc: Mike Christie <michael.christie@oracle.com>
Cc: virtualization@lists.linux-foundation.org
Reviewed-by: Hannes Reinecke <hare@suse.de>
Tested-by: Sumanesh Samanta <sumanesh.samanta@broadcom.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-mq.c          |   2 +-
 block/kyber-iosched.c   |   2 +-
 drivers/vhost/scsi.c    |   4 +-
 include/linux/sbitmap.h |  41 +++++++++------
 lib/sbitmap.c           | 112 +++++++++++++++++++++++-----------------
 5 files changed, 96 insertions(+), 65 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index c5eead257568..ef1a9f2003a0 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2676,7 +2676,7 @@ blk_mq_alloc_hctx(struct request_queue *q, struct blk_mq_tag_set *set,
 		goto free_cpumask;
 
 	if (sbitmap_init_node(&hctx->ctx_map, nr_cpu_ids, ilog2(8),
-				gfp, node, false))
+				gfp, node, false, false))
 		goto free_ctxs;
 	hctx->nr_ctx = 0;
 
diff --git a/block/kyber-iosched.c b/block/kyber-iosched.c
index cc8bcfe1d587..3949d68ac4c1 100644
--- a/block/kyber-iosched.c
+++ b/block/kyber-iosched.c
@@ -480,7 +480,7 @@ static int kyber_init_hctx(struct blk_mq_hw_ctx *hctx, unsigned int hctx_idx)
 	for (i = 0; i < KYBER_NUM_DOMAINS; i++) {
 		if (sbitmap_init_node(&khd->kcq_map[i], hctx->nr_ctx,
 				      ilog2(8), GFP_KERNEL, hctx->numa_node,
-				      false)) {
+				      false, false)) {
 			while (--i >= 0)
 				sbitmap_free(&khd->kcq_map[i]);
 			goto err_kcqs;
diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index ab230f6f79e8..8531751b28dd 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -614,7 +614,7 @@ vhost_scsi_get_cmd(struct vhost_virtqueue *vq, struct vhost_scsi_tpg *tpg,
 		return ERR_PTR(-EIO);
 	}
 
-	tag = sbitmap_get(&svq->scsi_tags, 0);
+	tag = sbitmap_get(&svq->scsi_tags);
 	if (tag < 0) {
 		pr_err("Unable to obtain tag for vhost_scsi_cmd\n");
 		return ERR_PTR(-ENOMEM);
@@ -1512,7 +1512,7 @@ static int vhost_scsi_setup_vq_cmds(struct vhost_virtqueue *vq, int max_cmds)
 		return 0;
 
 	if (sbitmap_init_node(&svq->scsi_tags, max_cmds, -1, GFP_KERNEL,
-			      NUMA_NO_NODE, false))
+			      NUMA_NO_NODE, false, true))
 		return -ENOMEM;
 	svq->max_cmds = max_cmds;
 
diff --git a/include/linux/sbitmap.h b/include/linux/sbitmap.h
index 734ee6214cd6..247776fcc02c 100644
--- a/include/linux/sbitmap.h
+++ b/include/linux/sbitmap.h
@@ -65,6 +65,14 @@ struct sbitmap {
 	 * @map: Allocated bitmap.
 	 */
 	struct sbitmap_word *map;
+
+	/*
+	 * @alloc_hint: Cache of last successfully allocated or freed bit.
+	 *
+	 * This is per-cpu, which allows multiple users to stick to different
+	 * cachelines until the map is exhausted.
+	 */
+	unsigned int __percpu *alloc_hint;
 };
 
 #define SBQ_WAIT_QUEUES 8
@@ -100,14 +108,6 @@ struct sbitmap_queue {
 	 */
 	struct sbitmap sb;
 
-	/*
-	 * @alloc_hint: Cache of last successfully allocated or freed bit.
-	 *
-	 * This is per-cpu, which allows multiple users to stick to different
-	 * cachelines until the map is exhausted.
-	 */
-	unsigned int __percpu *alloc_hint;
-
 	/**
 	 * @wake_batch: Number of bits which must be freed before we wake up any
 	 * waiters.
@@ -147,11 +147,13 @@ struct sbitmap_queue {
  * @round_robin: If true, be stricter about allocation order; always allocate
  *               starting from the last allocated bit. This is less efficient
  *               than the default behavior (false).
+ * @alloc_hint: If true, apply percpu hint for where to start searching for
+ *              a free bit.
  *
  * Return: Zero on success or negative errno on failure.
  */
 int sbitmap_init_node(struct sbitmap *sb, unsigned int depth, int shift,
-		      gfp_t flags, int node, bool round_robin);
+		      gfp_t flags, int node, bool round_robin, bool alloc_hint);
 
 /**
  * sbitmap_free() - Free memory used by a &struct sbitmap.
@@ -159,6 +161,7 @@ int sbitmap_init_node(struct sbitmap *sb, unsigned int depth, int shift,
  */
 static inline void sbitmap_free(struct sbitmap *sb)
 {
+	free_percpu(sb->alloc_hint);
 	kfree(sb->map);
 	sb->map = NULL;
 }
@@ -176,19 +179,17 @@ void sbitmap_resize(struct sbitmap *sb, unsigned int depth);
 /**
  * sbitmap_get() - Try to allocate a free bit from a &struct sbitmap.
  * @sb: Bitmap to allocate from.
- * @alloc_hint: Hint for where to start searching for a free bit.
  *
  * This operation provides acquire barrier semantics if it succeeds.
  *
  * Return: Non-negative allocated bit number if successful, -1 otherwise.
  */
-int sbitmap_get(struct sbitmap *sb, unsigned int alloc_hint);
+int sbitmap_get(struct sbitmap *sb);
 
 /**
  * sbitmap_get_shallow() - Try to allocate a free bit from a &struct sbitmap,
  * limiting the depth used from each word.
  * @sb: Bitmap to allocate from.
- * @alloc_hint: Hint for where to start searching for a free bit.
  * @shallow_depth: The maximum number of bits to allocate from a single word.
  *
  * This rather specific operation allows for having multiple users with
@@ -200,8 +201,7 @@ int sbitmap_get(struct sbitmap *sb, unsigned int alloc_hint);
  *
  * Return: Non-negative allocated bit number if successful, -1 otherwise.
  */
-int sbitmap_get_shallow(struct sbitmap *sb, unsigned int alloc_hint,
-			unsigned long shallow_depth);
+int sbitmap_get_shallow(struct sbitmap *sb, unsigned long shallow_depth);
 
 /**
  * sbitmap_any_bit_set() - Check for a set bit in a &struct sbitmap.
@@ -315,6 +315,18 @@ static inline void sbitmap_deferred_clear_bit(struct sbitmap *sb, unsigned int b
 	set_bit(SB_NR_TO_BIT(sb, bitnr), addr);
 }
 
+/*
+ * Pair of sbitmap_get, and this one applies both cleared bit and
+ * allocation hint.
+ */
+static inline void sbitmap_put(struct sbitmap *sb, unsigned int bitnr)
+{
+	sbitmap_deferred_clear_bit(sb, bitnr);
+
+	if (likely(sb->alloc_hint && !sb->round_robin && bitnr < sb->depth))
+		*this_cpu_ptr(sb->alloc_hint) = bitnr;
+}
+
 static inline int sbitmap_test_bit(struct sbitmap *sb, unsigned int bitnr)
 {
 	return test_bit(SB_NR_TO_BIT(sb, bitnr), __sbitmap_word(sb, bitnr));
@@ -363,7 +375,6 @@ int sbitmap_queue_init_node(struct sbitmap_queue *sbq, unsigned int depth,
 static inline void sbitmap_queue_free(struct sbitmap_queue *sbq)
 {
 	kfree(sbq->ws);
-	free_percpu(sbq->alloc_hint);
 	sbitmap_free(&sbq->sb);
 }
 
diff --git a/lib/sbitmap.c b/lib/sbitmap.c
index 2b43a6aefec3..e395435654aa 100644
--- a/lib/sbitmap.c
+++ b/lib/sbitmap.c
@@ -9,52 +9,51 @@
 #include <linux/sbitmap.h>
 #include <linux/seq_file.h>
 
-static int init_alloc_hint(struct sbitmap_queue *sbq, gfp_t flags)
+static int init_alloc_hint(struct sbitmap *sb, gfp_t flags)
 {
-	unsigned depth = sbq->sb.depth;
+	unsigned depth = sb->depth;
 
-	sbq->alloc_hint = alloc_percpu_gfp(unsigned int, flags);
-	if (!sbq->alloc_hint)
+	sb->alloc_hint = alloc_percpu_gfp(unsigned int, flags);
+	if (!sb->alloc_hint)
 		return -ENOMEM;
 
-	if (depth && !sbq->sb.round_robin) {
+	if (depth && !sb->round_robin) {
 		int i;
 
 		for_each_possible_cpu(i)
-			*per_cpu_ptr(sbq->alloc_hint, i) = prandom_u32() % depth;
+			*per_cpu_ptr(sb->alloc_hint, i) = prandom_u32() % depth;
 	}
-
 	return 0;
 }
 
-static inline unsigned update_alloc_hint_before_get(struct sbitmap_queue *sbq,
+static inline unsigned update_alloc_hint_before_get(struct sbitmap *sb,
 						    unsigned int depth)
 {
 	unsigned hint;
 
-	hint = this_cpu_read(*sbq->alloc_hint);
+	hint = this_cpu_read(*sb->alloc_hint);
 	if (unlikely(hint >= depth)) {
 		hint = depth ? prandom_u32() % depth : 0;
-		this_cpu_write(*sbq->alloc_hint, hint);
+		this_cpu_write(*sb->alloc_hint, hint);
 	}
 
 	return hint;
 }
 
-static inline void update_alloc_hint_after_get(struct sbitmap_queue *sbq,
+static inline void update_alloc_hint_after_get(struct sbitmap *sb,
 					       unsigned int depth,
 					       unsigned int hint,
 					       unsigned int nr)
 {
 	if (nr == -1) {
 		/* If the map is full, a hint won't do us much good. */
-		this_cpu_write(*sbq->alloc_hint, 0);
-	} else if (nr == hint || unlikely(sbq->sb.round_robin)) {
+		this_cpu_write(*sb->alloc_hint, 0);
+	} else if (nr == hint || unlikely(sb->round_robin)) {
 		/* Only update the hint if we used it. */
 		hint = nr + 1;
 		if (hint >= depth - 1)
 			hint = 0;
-		this_cpu_write(*sbq->alloc_hint, hint);
+		this_cpu_write(*sb->alloc_hint, hint);
 	}
 }
 
@@ -82,7 +81,8 @@ static inline bool sbitmap_deferred_clear(struct sbitmap_word *map)
 }
 
 int sbitmap_init_node(struct sbitmap *sb, unsigned int depth, int shift,
-		      gfp_t flags, int node, bool round_robin)
+		      gfp_t flags, int node, bool round_robin,
+		      bool alloc_hint)
 {
 	unsigned int bits_per_word;
 	unsigned int i;
@@ -114,9 +114,18 @@ int sbitmap_init_node(struct sbitmap *sb, unsigned int depth, int shift,
 		return 0;
 	}
 
+	if (alloc_hint) {
+		if (init_alloc_hint(sb, flags))
+			return -ENOMEM;
+	} else {
+		sb->alloc_hint = NULL;
+	}
+
 	sb->map = kcalloc_node(sb->map_nr, sizeof(*sb->map), flags, node);
-	if (!sb->map)
+	if (!sb->map) {
+		free_percpu(sb->alloc_hint);
 		return -ENOMEM;
+	}
 
 	for (i = 0; i < sb->map_nr; i++) {
 		sb->map[i].depth = min(depth, bits_per_word);
@@ -196,7 +205,7 @@ static int sbitmap_find_bit_in_index(struct sbitmap *sb, int index,
 	return nr;
 }
 
-int sbitmap_get(struct sbitmap *sb, unsigned int alloc_hint)
+static int __sbitmap_get(struct sbitmap *sb, unsigned int alloc_hint)
 {
 	unsigned int i, index;
 	int nr = -1;
@@ -228,10 +237,27 @@ int sbitmap_get(struct sbitmap *sb, unsigned int alloc_hint)
 
 	return nr;
 }
+
+int sbitmap_get(struct sbitmap *sb)
+{
+	int nr;
+	unsigned int hint, depth;
+
+	if (WARN_ON_ONCE(unlikely(!sb->alloc_hint)))
+		return -1;
+
+	depth = READ_ONCE(sb->depth);
+	hint = update_alloc_hint_before_get(sb, depth);
+	nr = __sbitmap_get(sb, hint);
+	update_alloc_hint_after_get(sb, depth, hint, nr);
+
+	return nr;
+}
 EXPORT_SYMBOL_GPL(sbitmap_get);
 
-int sbitmap_get_shallow(struct sbitmap *sb, unsigned int alloc_hint,
-			unsigned long shallow_depth)
+static int __sbitmap_get_shallow(struct sbitmap *sb,
+				 unsigned int alloc_hint,
+				 unsigned long shallow_depth)
 {
 	unsigned int i, index;
 	int nr = -1;
@@ -263,6 +289,22 @@ int sbitmap_get_shallow(struct sbitmap *sb, unsigned int alloc_hint,
 
 	return nr;
 }
+
+int sbitmap_get_shallow(struct sbitmap *sb, unsigned long shallow_depth)
+{
+	int nr;
+	unsigned int hint, depth;
+
+	if (WARN_ON_ONCE(unlikely(!sb->alloc_hint)))
+		return -1;
+
+	depth = READ_ONCE(sb->depth);
+	hint = update_alloc_hint_before_get(sb, depth);
+	nr = __sbitmap_get_shallow(sb, hint, shallow_depth);
+	update_alloc_hint_after_get(sb, depth, hint, nr);
+
+	return nr;
+}
 EXPORT_SYMBOL_GPL(sbitmap_get_shallow);
 
 bool sbitmap_any_bit_set(const struct sbitmap *sb)
@@ -400,15 +442,10 @@ int sbitmap_queue_init_node(struct sbitmap_queue *sbq, unsigned int depth,
 	int i;
 
 	ret = sbitmap_init_node(&sbq->sb, depth, shift, flags, node,
-				round_robin);
+				round_robin, true);
 	if (ret)
 		return ret;
 
-	if (init_alloc_hint(sbq, flags) != 0) {
-		sbitmap_free(&sbq->sb);
-		return -ENOMEM;
-	}
-
 	sbq->min_shallow_depth = UINT_MAX;
 	sbq->wake_batch = sbq_calc_wake_batch(sbq, depth);
 	atomic_set(&sbq->wake_index, 0);
@@ -416,7 +453,6 @@ int sbitmap_queue_init_node(struct sbitmap_queue *sbq, unsigned int depth,
 
 	sbq->ws = kzalloc_node(SBQ_WAIT_QUEUES * sizeof(*sbq->ws), flags, node);
 	if (!sbq->ws) {
-		free_percpu(sbq->alloc_hint);
 		sbitmap_free(&sbq->sb);
 		return -ENOMEM;
 	}
@@ -458,32 +494,16 @@ EXPORT_SYMBOL_GPL(sbitmap_queue_resize);
 
 int __sbitmap_queue_get(struct sbitmap_queue *sbq)
 {
-	unsigned int hint, depth;
-	int nr;
-
-	depth = READ_ONCE(sbq->sb.depth);
-	hint = update_alloc_hint_before_get(sbq, depth);
-	nr = sbitmap_get(&sbq->sb, hint);
-	update_alloc_hint_after_get(sbq, depth, hint, nr);
-
-	return nr;
+	return sbitmap_get(&sbq->sb);
 }
 EXPORT_SYMBOL_GPL(__sbitmap_queue_get);
 
 int __sbitmap_queue_get_shallow(struct sbitmap_queue *sbq,
 				unsigned int shallow_depth)
 {
-	unsigned int hint, depth;
-	int nr;
-
 	WARN_ON_ONCE(shallow_depth < sbq->min_shallow_depth);
 
-	depth = READ_ONCE(sbq->sb.depth);
-	hint = update_alloc_hint_before_get(sbq, depth);
-	nr = sbitmap_get_shallow(&sbq->sb, hint, shallow_depth);
-	update_alloc_hint_after_get(sbq, depth, hint, nr);
-
-	return nr;
+	return sbitmap_get_shallow(&sbq->sb, shallow_depth);
 }
 EXPORT_SYMBOL_GPL(__sbitmap_queue_get_shallow);
 
@@ -592,7 +612,7 @@ void sbitmap_queue_clear(struct sbitmap_queue *sbq, unsigned int nr,
 	sbitmap_queue_wake_up(sbq);
 
 	if (likely(!sbq->sb.round_robin && nr < sbq->sb.depth))
-		*per_cpu_ptr(sbq->alloc_hint, cpu) = nr;
+		*per_cpu_ptr(sbq->sb.alloc_hint, cpu) = nr;
 }
 EXPORT_SYMBOL_GPL(sbitmap_queue_clear);
 
@@ -630,7 +650,7 @@ void sbitmap_queue_show(struct sbitmap_queue *sbq, struct seq_file *m)
 		if (!first)
 			seq_puts(m, ", ");
 		first = false;
-		seq_printf(m, "%u", *per_cpu_ptr(sbq->alloc_hint, i));
+		seq_printf(m, "%u", *per_cpu_ptr(sbq->sb.alloc_hint, i));
 	}
 	seq_puts(m, "}\n");
 
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
