Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A012228B535
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 14:56:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 612C2874BC;
	Mon, 12 Oct 2020 12:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hIWl4ljLG2c; Mon, 12 Oct 2020 12:56:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D0C6874CB;
	Mon, 12 Oct 2020 12:56:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F428C0051;
	Mon, 12 Oct 2020 12:56:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0EC7C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9E407874C0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r6uLx4ZP+G9k
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:56:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B39A874BC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602507366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8Nusm9Q3UIodGmd2qdyty+RAJQgSi+pxy/2Ikrm7wc=;
 b=KQWhoq8tpG2VyXVcOgKSebLB8lwpzwrNFRvAB8uLKuHWQXZCjkFUyMugHcqnGtGZNL7GMI
 /2GiZJf8PLsSRLJ7bm3Op00Y80vaMjnynncptKJb3QCPa10qwPYwZnFzLH5RJbMGvmOsAf
 BpXR7J3sLJEboZxNOSfqsy3rl+UkFZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-4DVPmcraN3m3e7Ga8dg-Bw-1; Mon, 12 Oct 2020 08:56:03 -0400
X-MC-Unique: 4DVPmcraN3m3e7Ga8dg-Bw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87222107AD64;
 Mon, 12 Oct 2020 12:56:02 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A39860C07;
 Mon, 12 Oct 2020 12:55:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 19/29] virito-mem: existing (un)plug functions are specific
 to Sub Block Mode (SBM)
Date: Mon, 12 Oct 2020 14:53:13 +0200
Message-Id: <20201012125323.17509-20-david@redhat.com>
In-Reply-To: <20201012125323.17509-1-david@redhat.com>
References: <20201012125323.17509-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
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

Let's rename them accordingly. virtio_mem_plug_request() and
virtio_mem_unplug_request() will be handled separately.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 90 ++++++++++++++++++-------------------
 1 file changed, 43 insertions(+), 47 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 73ff6e9ba839..fc2b1ff3beed 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1075,8 +1075,8 @@ static int virtio_mem_send_unplug_all_request(struct virtio_mem *vm)
  * Plug selected subblocks. Updates the plugged state, but not the state
  * of the memory block.
  */
-static int virtio_mem_mb_plug_sb(struct virtio_mem *vm, unsigned long mb_id,
-				 int sb_id, int count)
+static int virtio_mem_sbm_plug_sb(struct virtio_mem *vm, unsigned long mb_id,
+				  int sb_id, int count)
 {
 	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id) +
 			      sb_id * vm->subblock_size;
@@ -1096,8 +1096,8 @@ static int virtio_mem_mb_plug_sb(struct virtio_mem *vm, unsigned long mb_id,
  * Unplug selected subblocks. Updates the plugged state, but not the state
  * of the memory block.
  */
-static int virtio_mem_mb_unplug_sb(struct virtio_mem *vm, unsigned long mb_id,
-				   int sb_id, int count)
+static int virtio_mem_sbm_unplug_sb(struct virtio_mem *vm, unsigned long mb_id,
+				    int sb_id, int count)
 {
 	const uint64_t addr = virtio_mem_mb_id_to_phys(mb_id) +
 			      sb_id * vm->subblock_size;
@@ -1122,8 +1122,8 @@ static int virtio_mem_mb_unplug_sb(struct virtio_mem *vm, unsigned long mb_id,
  *
  * Note: can fail after some subblocks were unplugged.
  */
-static int virtio_mem_mb_unplug_any_sb(struct virtio_mem *vm,
-				       unsigned long mb_id, uint64_t *nb_sb)
+static int virtio_mem_sbm_unplug_any_sb(struct virtio_mem *vm,
+					unsigned long mb_id, uint64_t *nb_sb)
 {
 	int sb_id, count;
 	int rc;
@@ -1144,7 +1144,7 @@ static int virtio_mem_mb_unplug_any_sb(struct virtio_mem *vm,
 			sb_id--;
 		}
 
-		rc = virtio_mem_mb_unplug_sb(vm, mb_id, sb_id, count);
+		rc = virtio_mem_sbm_unplug_sb(vm, mb_id, sb_id, count);
 		if (rc)
 			return rc;
 		*nb_sb -= count;
@@ -1161,18 +1161,18 @@ static int virtio_mem_mb_unplug_any_sb(struct virtio_mem *vm,
  *
  * Note: can fail after some subblocks were unplugged.
  */
-static int virtio_mem_mb_unplug(struct virtio_mem *vm, unsigned long mb_id)
+static int virtio_mem_sbm_unplug_mb(struct virtio_mem *vm, unsigned long mb_id)
 {
 	uint64_t nb_sb = vm->nb_sb_per_mb;
 
-	return virtio_mem_mb_unplug_any_sb(vm, mb_id, &nb_sb);
+	return virtio_mem_sbm_unplug_any_sb(vm, mb_id, &nb_sb);
 }
 
 /*
  * Prepare tracking data for the next memory block.
  */
-static int virtio_mem_prepare_next_mb(struct virtio_mem *vm,
-				      unsigned long *mb_id)
+static int virtio_mem_sbm_prepare_next_mb(struct virtio_mem *vm,
+					  unsigned long *mb_id)
 {
 	int rc;
 
@@ -1200,9 +1200,8 @@ static int virtio_mem_prepare_next_mb(struct virtio_mem *vm,
  *
  * Will modify the state of the memory block.
  */
-static int virtio_mem_mb_plug_and_add(struct virtio_mem *vm,
-				      unsigned long mb_id,
-				      uint64_t *nb_sb)
+static int virtio_mem_sbm_plug_and_add_mb(struct virtio_mem *vm,
+					  unsigned long mb_id, uint64_t *nb_sb)
 {
 	const int count = min_t(int, *nb_sb, vm->nb_sb_per_mb);
 	int rc;
@@ -1214,7 +1213,7 @@ static int virtio_mem_mb_plug_and_add(struct virtio_mem *vm,
 	 * Plug the requested number of subblocks before adding it to linux,
 	 * so that onlining will directly online all plugged subblocks.
 	 */
-	rc = virtio_mem_mb_plug_sb(vm, mb_id, 0, count);
+	rc = virtio_mem_sbm_plug_sb(vm, mb_id, 0, count);
 	if (rc)
 		return rc;
 
@@ -1241,7 +1240,7 @@ static int virtio_mem_mb_plug_and_add(struct virtio_mem *vm,
 		 * TODO: Linux MM does not properly clean up yet in all cases
 		 * where adding of memory failed - especially on -ENOMEM.
 		 */
-		if (virtio_mem_mb_unplug_sb(vm, mb_id, 0, count))
+		if (virtio_mem_sbm_unplug_sb(vm, mb_id, 0, count))
 			new_state = VIRTIO_MEM_SBM_MB_PLUGGED;
 		virtio_mem_sbm_set_mb_state(vm, mb_id, new_state);
 		return rc;
@@ -1259,8 +1258,9 @@ static int virtio_mem_mb_plug_and_add(struct virtio_mem *vm,
  *
  * Note: Can fail after some subblocks were successfully plugged.
  */
-static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
-				     uint64_t *nb_sb, bool online)
+static int virtio_mem_sbm_plug_any_sb(struct virtio_mem *vm,
+				      unsigned long mb_id, uint64_t *nb_sb,
+				      bool online)
 {
 	unsigned long pfn, nr_pages;
 	int sb_id, count;
@@ -1279,7 +1279,7 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
 		       !virtio_mem_sbm_test_sb_plugged(vm, mb_id, sb_id + count, 1))
 			count++;
 
-		rc = virtio_mem_mb_plug_sb(vm, mb_id, sb_id, count);
+		rc = virtio_mem_sbm_plug_sb(vm, mb_id, sb_id, count);
 		if (rc)
 			return rc;
 		*nb_sb -= count;
@@ -1323,7 +1323,7 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 	/* Try to plug subblocks of partially plugged online blocks. */
 	virtio_mem_sbm_for_each_mb(vm, mb_id,
 				   VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL) {
-		rc = virtio_mem_mb_plug_any_sb(vm, mb_id, &nb_sb, true);
+		rc = virtio_mem_sbm_plug_any_sb(vm, mb_id, &nb_sb, true);
 		if (rc || !nb_sb)
 			goto out_unlock;
 		cond_resched();
@@ -1332,7 +1332,7 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 	/* Try to plug subblocks of partially plugged offline blocks. */
 	virtio_mem_sbm_for_each_mb(vm, mb_id,
 				   VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL) {
-		rc = virtio_mem_mb_plug_any_sb(vm, mb_id, &nb_sb, false);
+		rc = virtio_mem_sbm_plug_any_sb(vm, mb_id, &nb_sb, false);
 		if (rc || !nb_sb)
 			goto out_unlock;
 		cond_resched();
@@ -1349,7 +1349,7 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 		if (!virtio_mem_could_add_memory(vm, memory_block_size_bytes()))
 			return -ENOSPC;
 
-		rc = virtio_mem_mb_plug_and_add(vm, mb_id, &nb_sb);
+		rc = virtio_mem_sbm_plug_and_add_mb(vm, mb_id, &nb_sb);
 		if (rc || !nb_sb)
 			return rc;
 		cond_resched();
@@ -1360,10 +1360,10 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 		if (!virtio_mem_could_add_memory(vm, memory_block_size_bytes()))
 			return -ENOSPC;
 
-		rc = virtio_mem_prepare_next_mb(vm, &mb_id);
+		rc = virtio_mem_sbm_prepare_next_mb(vm, &mb_id);
 		if (rc)
 			return rc;
-		rc = virtio_mem_mb_plug_and_add(vm, mb_id, &nb_sb);
+		rc = virtio_mem_sbm_plug_and_add_mb(vm, mb_id, &nb_sb);
 		if (rc)
 			return rc;
 		cond_resched();
@@ -1384,13 +1384,13 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
  *
  * Note: Can fail after some subblocks were successfully unplugged.
  */
-static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
-					       unsigned long mb_id,
-					       uint64_t *nb_sb)
+static int virtio_mem_sbm_unplug_any_sb_offline(struct virtio_mem *vm,
+						unsigned long mb_id,
+						uint64_t *nb_sb)
 {
 	int rc;
 
-	rc = virtio_mem_mb_unplug_any_sb(vm, mb_id, nb_sb);
+	rc = virtio_mem_sbm_unplug_any_sb(vm, mb_id, nb_sb);
 
 	/* some subblocks might have been unplugged even on failure */
 	if (!virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->nb_sb_per_mb))
@@ -1422,9 +1422,9 @@ static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
  *
  * Will modify the state of the memory block.
  */
-static int virtio_mem_mb_unplug_sb_online(struct virtio_mem *vm,
-					  unsigned long mb_id, int sb_id,
-					  int count)
+static int virtio_mem_sbm_unplug_sb_online(struct virtio_mem *vm,
+					   unsigned long mb_id, int sb_id,
+					   int count)
 {
 	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size) * count;
 	unsigned long start_pfn;
@@ -1438,7 +1438,7 @@ static int virtio_mem_mb_unplug_sb_online(struct virtio_mem *vm,
 		return rc;
 
 	/* Try to unplug the allocated memory */
-	rc = virtio_mem_mb_unplug_sb(vm, mb_id, sb_id, count);
+	rc = virtio_mem_sbm_unplug_sb(vm, mb_id, sb_id, count);
 	if (rc) {
 		/* Return the memory to the buddy. */
 		virtio_mem_fake_online(start_pfn, nr_pages);
@@ -1460,17 +1460,17 @@ static int virtio_mem_mb_unplug_sb_online(struct virtio_mem *vm,
  * Note: Can fail after some subblocks were successfully unplugged. Can
  *       return 0 even if subblocks were busy and could not get unplugged.
  */
-static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
-					      unsigned long mb_id,
-					      uint64_t *nb_sb)
+static int virtio_mem_sbm_unplug_any_sb_online(struct virtio_mem *vm,
+					       unsigned long mb_id,
+					       uint64_t *nb_sb)
 {
 	int rc, sb_id;
 
 	/* If possible, try to unplug the complete block in one shot. */
 	if (*nb_sb >= vm->nb_sb_per_mb &&
 	    virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->nb_sb_per_mb)) {
-		rc = virtio_mem_mb_unplug_sb_online(vm, mb_id, 0,
-						    vm->nb_sb_per_mb);
+		rc = virtio_mem_sbm_unplug_sb_online(vm, mb_id, 0,
+						     vm->nb_sb_per_mb);
 		if (!rc) {
 			*nb_sb -= vm->nb_sb_per_mb;
 			goto unplugged;
@@ -1487,7 +1487,7 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
 		if (sb_id < 0)
 			break;
 
-		rc = virtio_mem_mb_unplug_sb_online(vm, mb_id, sb_id, 1);
+		rc = virtio_mem_sbm_unplug_sb_online(vm, mb_id, sb_id, 1);
 		if (rc == -EBUSY)
 			continue;
 		else if (rc)
@@ -1535,8 +1535,7 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 	/* Try to unplug subblocks of partially plugged offline blocks. */
 	virtio_mem_sbm_for_each_mb_rev(vm, mb_id,
 				       VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL) {
-		rc = virtio_mem_mb_unplug_any_sb_offline(vm, mb_id,
-							 &nb_sb);
+		rc = virtio_mem_sbm_unplug_any_sb_offline(vm, mb_id, &nb_sb);
 		if (rc || !nb_sb)
 			goto out_unlock;
 		cond_resched();
@@ -1544,8 +1543,7 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 
 	/* Try to unplug subblocks of plugged offline blocks. */
 	virtio_mem_sbm_for_each_mb_rev(vm, mb_id, VIRTIO_MEM_SBM_MB_OFFLINE) {
-		rc = virtio_mem_mb_unplug_any_sb_offline(vm, mb_id,
-							 &nb_sb);
+		rc = virtio_mem_sbm_unplug_any_sb_offline(vm, mb_id, &nb_sb);
 		if (rc || !nb_sb)
 			goto out_unlock;
 		cond_resched();
@@ -1559,8 +1557,7 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 	/* Try to unplug subblocks of partially plugged online blocks. */
 	virtio_mem_sbm_for_each_mb_rev(vm, mb_id,
 				       VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL) {
-		rc = virtio_mem_mb_unplug_any_sb_online(vm, mb_id,
-							&nb_sb);
+		rc = virtio_mem_sbm_unplug_any_sb_online(vm, mb_id, &nb_sb);
 		if (rc || !nb_sb)
 			goto out_unlock;
 		mutex_unlock(&vm->hotplug_mutex);
@@ -1570,8 +1567,7 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 
 	/* Try to unplug subblocks of plugged online blocks. */
 	virtio_mem_sbm_for_each_mb_rev(vm, mb_id, VIRTIO_MEM_SBM_MB_ONLINE) {
-		rc = virtio_mem_mb_unplug_any_sb_online(vm, mb_id,
-							&nb_sb);
+		rc = virtio_mem_sbm_unplug_any_sb_online(vm, mb_id, &nb_sb);
 		if (rc || !nb_sb)
 			goto out_unlock;
 		mutex_unlock(&vm->hotplug_mutex);
@@ -1596,7 +1592,7 @@ static int virtio_mem_unplug_pending_mb(struct virtio_mem *vm)
 	int rc;
 
 	virtio_mem_sbm_for_each_mb(vm, mb_id, VIRTIO_MEM_SBM_MB_PLUGGED) {
-		rc = virtio_mem_mb_unplug(vm, mb_id);
+		rc = virtio_mem_sbm_unplug_mb(vm, mb_id);
 		if (rc)
 			return rc;
 		virtio_mem_sbm_set_mb_state(vm, mb_id,
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
