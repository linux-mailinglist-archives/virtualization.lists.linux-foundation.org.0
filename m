Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E932B06B4
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 14:39:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5EDB3877AB;
	Thu, 12 Nov 2020 13:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TU6Q3YYI71zz; Thu, 12 Nov 2020 13:39:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3A19E877C4;
	Thu, 12 Nov 2020 13:39:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2349AC016F;
	Thu, 12 Nov 2020 13:39:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5DF9C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D25C0877BD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5f9AXVj40C2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 70A33877AB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zez07Rq5Av5EJUJRWvHbggO1UlVg9cndc3mQArrzhCk=;
 b=LNApv6A7BlwNGpS5WIsTGvMvn6aXIDfS9csRh/DO3T48pHdhAErcaBwVWc+FcP7K7EUZYr
 5ppX9w3yRmhbUhaGs6Yn9Xwt9JB6rm5JqkPTD+hVslffRxlG7lioK4YhB0XLoT+PqbNMNo
 9TsEy+4LfRY9vFqveYVrBgJvyode0FI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-jcpGai-FMuaVrEW-WA98cw-1; Thu, 12 Nov 2020 08:39:16 -0500
X-MC-Unique: jcpGai-FMuaVrEW-WA98cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69024107ACF8;
 Thu, 12 Nov 2020 13:39:15 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0ED255766;
 Thu, 12 Nov 2020 13:39:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/29] virtio-mem: memory block states are specific to Sub
 Block Mode (SBM)
Date: Thu, 12 Nov 2020 14:38:04 +0100
Message-Id: <20201112133815.13332-19-david@redhat.com>
In-Reply-To: <20201112133815.13332-1-david@redhat.com>
References: <20201112133815.13332-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

let's use a new "sbm" sub-struct to hold SBM-specific state and rename +
move applicable definitions, functions, and variables (related to
memory block states).

While at it:
- Drop the "_STATE" part from memory block states
- Rename "nb_mb_state" to "mb_count"
- "set_mb_state" / "get_mb_state" vs. "mb_set_state" / "mb_get_state"
- Don't use lengthy "enum virtio_mem_smb_mb_state", simply use "uint8_t"

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 215 ++++++++++++++++++------------------
 1 file changed, 109 insertions(+), 106 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 4234bfc0cf52..c6cc301c78e1 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -42,20 +42,23 @@ MODULE_PARM_DESC(unplug_online, "Try to unplug online memory");
  * onlined to the same zone - virtio-mem relies on this behavior.
  */
 
-enum virtio_mem_mb_state {
+/*
+ * State of a Linux memory block in SBM.
+ */
+enum virtio_mem_sbm_mb_state {
 	/* Unplugged, not added to Linux. Can be reused later. */
-	VIRTIO_MEM_MB_STATE_UNUSED = 0,
+	VIRTIO_MEM_SBM_MB_UNUSED = 0,
 	/* (Partially) plugged, not added to Linux. Error on add_memory(). */
-	VIRTIO_MEM_MB_STATE_PLUGGED,
+	VIRTIO_MEM_SBM_MB_PLUGGED,
 	/* Fully plugged, fully added to Linux, offline. */
-	VIRTIO_MEM_MB_STATE_OFFLINE,
+	VIRTIO_MEM_SBM_MB_OFFLINE,
 	/* Partially plugged, fully added to Linux, offline. */
-	VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL,
+	VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL,
 	/* Fully plugged, fully added to Linux, online. */
-	VIRTIO_MEM_MB_STATE_ONLINE,
+	VIRTIO_MEM_SBM_MB_ONLINE,
 	/* Partially plugged, fully added to Linux, online. */
-	VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL,
-	VIRTIO_MEM_MB_STATE_COUNT
+	VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL,
+	VIRTIO_MEM_SBM_MB_COUNT
 };
 
 struct virtio_mem {
@@ -113,9 +116,6 @@ struct virtio_mem {
 	 */
 	const char *resource_name;
 
-	/* Summary of all memory block states. */
-	unsigned long nb_mb_state[VIRTIO_MEM_MB_STATE_COUNT];
-
 	/*
 	 * We don't want to add too much memory if it's not getting onlined,
 	 * to avoid running OOM. Besides this threshold, we allow to have at
@@ -125,27 +125,29 @@ struct virtio_mem {
 	atomic64_t offline_size;
 	uint64_t offline_threshold;
 
-	/*
-	 * One byte state per memory block.
-	 *
-	 * Allocated via vmalloc(). When preparing new blocks, resized
-	 * (alloc+copy+free) when needed (crossing pages with the next mb).
-	 * (when crossing pages).
-	 *
-	 * With 128MB memory blocks, we have states for 512GB of memory in one
-	 * page.
-	 */
-	uint8_t *mb_state;
+	struct {
+		/* Summary of all memory block states. */
+		unsigned long mb_count[VIRTIO_MEM_SBM_MB_COUNT];
+
+		/*
+		 * One byte state per memory block. Allocated via vmalloc().
+		 * Resized (alloc+copy+free) on demand.
+		 *
+		 * With 128 MiB memory blocks, we have states for 512 GiB of
+		 * memory in one 4 KiB page.
+		 */
+		uint8_t *mb_states;
+	} sbm;
 
 	/*
-	 * $nb_sb_per_mb bit per memory block. Handled similar to mb_state.
+	 * $nb_sb_per_mb bit per memory block. Handled similar to sbm.mb_states.
 	 *
 	 * With 4MB subblocks, we manage 128GB of memory in one page.
 	 */
 	unsigned long *sb_bitmap;
 
 	/*
-	 * Mutex that protects the nb_mb_state, mb_state, and sb_bitmap.
+	 * Mutex that protects the sbm.mb_count, sbm.mb_states, and sb_bitmap.
 	 *
 	 * When this lock is held the pointers can't change, ONLINE and
 	 * OFFLINE blocks can't change the state and no subblocks will get
@@ -254,68 +256,68 @@ static unsigned long virtio_mem_phys_to_sb_id(struct virtio_mem *vm,
 /*
  * Set the state of a memory block, taking care of the state counter.
  */
-static void virtio_mem_mb_set_state(struct virtio_mem *vm, unsigned long mb_id,
-				    enum virtio_mem_mb_state state)
+static void virtio_mem_sbm_set_mb_state(struct virtio_mem *vm,
+					unsigned long mb_id, uint8_t state)
 {
 	const unsigned long idx = mb_id - vm->first_mb_id;
-	enum virtio_mem_mb_state old_state;
+	uint8_t old_state;
 
-	old_state = vm->mb_state[idx];
-	vm->mb_state[idx] = state;
+	old_state = vm->sbm.mb_states[idx];
+	vm->sbm.mb_states[idx] = state;
 
-	BUG_ON(vm->nb_mb_state[old_state] == 0);
-	vm->nb_mb_state[old_state]--;
-	vm->nb_mb_state[state]++;
+	BUG_ON(vm->sbm.mb_count[old_state] == 0);
+	vm->sbm.mb_count[old_state]--;
+	vm->sbm.mb_count[state]++;
 }
 
 /*
  * Get the state of a memory block.
  */
-static enum virtio_mem_mb_state virtio_mem_mb_get_state(struct virtio_mem *vm,
-							unsigned long mb_id)
+static uint8_t virtio_mem_sbm_get_mb_state(struct virtio_mem *vm,
+					   unsigned long mb_id)
 {
 	const unsigned long idx = mb_id - vm->first_mb_id;
 
-	return vm->mb_state[idx];
+	return vm->sbm.mb_states[idx];
 }
 
 /*
  * Prepare the state array for the next memory block.
  */
-static int virtio_mem_mb_state_prepare_next_mb(struct virtio_mem *vm)
+static int virtio_mem_sbm_mb_states_prepare_next_mb(struct virtio_mem *vm)
 {
 	int old_pages = PFN_UP(vm->next_mb_id - vm->first_mb_id);
 	int new_pages = PFN_UP(vm->next_mb_id - vm->first_mb_id + 1);
-	uint8_t *new_mb_state;
+	uint8_t *new_array;
 
-	if (vm->mb_state && old_pages == new_pages)
+	if (vm->sbm.mb_states && old_pages == new_pages)
 		return 0;
 
-	new_mb_state = vzalloc(new_pages * PAGE_SIZE);
-	if (!new_mb_state)
+	new_array = vzalloc(new_pages * PAGE_SIZE);
+	if (!new_array)
 		return -ENOMEM;
 
 	mutex_lock(&vm->hotplug_mutex);
-	if (vm->mb_state)
-		memcpy(new_mb_state, vm->mb_state, old_pages * PAGE_SIZE);
-	vfree(vm->mb_state);
-	vm->mb_state = new_mb_state;
+	if (vm->sbm.mb_states)
+		memcpy(new_array, vm->sbm.mb_states, old_pages * PAGE_SIZE);
+	vfree(vm->sbm.mb_states);
+	vm->sbm.mb_states = new_array;
 	mutex_unlock(&vm->hotplug_mutex);
 
 	return 0;
 }
 
-#define virtio_mem_for_each_mb_state(_vm, _mb_id, _state) \
+#define virtio_mem_sbm_for_each_mb(_vm, _mb_id, _state) \
 	for (_mb_id = _vm->first_mb_id; \
-	     _mb_id < _vm->next_mb_id && _vm->nb_mb_state[_state]; \
+	     _mb_id < _vm->next_mb_id && _vm->sbm.mb_count[_state]; \
 	     _mb_id++) \
-		if (virtio_mem_mb_get_state(_vm, _mb_id) == _state)
+		if (virtio_mem_sbm_get_mb_state(_vm, _mb_id) == _state)
 
-#define virtio_mem_for_each_mb_state_rev(_vm, _mb_id, _state) \
+#define virtio_mem_sbm_for_each_mb_rev(_vm, _mb_id, _state) \
 	for (_mb_id = _vm->next_mb_id - 1; \
-	     _mb_id >= _vm->first_mb_id && _vm->nb_mb_state[_state]; \
+	     _mb_id >= _vm->first_mb_id && _vm->sbm.mb_count[_state]; \
 	     _mb_id--) \
-		if (virtio_mem_mb_get_state(_vm, _mb_id) == _state)
+		if (virtio_mem_sbm_get_mb_state(_vm, _mb_id) == _state)
 
 /*
  * Calculate the bit number in the subblock bitmap for the given subblock
@@ -581,9 +583,9 @@ static bool virtio_mem_contains_range(struct virtio_mem *vm, uint64_t start,
 static int virtio_mem_notify_going_online(struct virtio_mem *vm,
 					  unsigned long mb_id)
 {
-	switch (virtio_mem_mb_get_state(vm, mb_id)) {
-	case VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL:
-	case VIRTIO_MEM_MB_STATE_OFFLINE:
+	switch (virtio_mem_sbm_get_mb_state(vm, mb_id)) {
+	case VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL:
+	case VIRTIO_MEM_SBM_MB_OFFLINE:
 		return NOTIFY_OK;
 	default:
 		break;
@@ -596,14 +598,14 @@ static int virtio_mem_notify_going_online(struct virtio_mem *vm,
 static void virtio_mem_notify_offline(struct virtio_mem *vm,
 				      unsigned long mb_id)
 {
-	switch (virtio_mem_mb_get_state(vm, mb_id)) {
-	case VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL:
-		virtio_mem_mb_set_state(vm, mb_id,
-					VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL);
+	switch (virtio_mem_sbm_get_mb_state(vm, mb_id)) {
+	case VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL:
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					    VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL);
 		break;
-	case VIRTIO_MEM_MB_STATE_ONLINE:
-		virtio_mem_mb_set_state(vm, mb_id,
-					VIRTIO_MEM_MB_STATE_OFFLINE);
+	case VIRTIO_MEM_SBM_MB_ONLINE:
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					    VIRTIO_MEM_SBM_MB_OFFLINE);
 		break;
 	default:
 		BUG();
@@ -613,13 +615,14 @@ static void virtio_mem_notify_offline(struct virtio_mem *vm,
 
 static void virtio_mem_notify_online(struct virtio_mem *vm, unsigned long mb_id)
 {
-	switch (virtio_mem_mb_get_state(vm, mb_id)) {
-	case VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL:
-		virtio_mem_mb_set_state(vm, mb_id,
-					VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL);
+	switch (virtio_mem_sbm_get_mb_state(vm, mb_id)) {
+	case VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL:
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL);
 		break;
-	case VIRTIO_MEM_MB_STATE_OFFLINE:
-		virtio_mem_mb_set_state(vm, mb_id, VIRTIO_MEM_MB_STATE_ONLINE);
+	case VIRTIO_MEM_SBM_MB_OFFLINE:
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					    VIRTIO_MEM_SBM_MB_ONLINE);
 		break;
 	default:
 		BUG();
@@ -1188,7 +1191,7 @@ static int virtio_mem_prepare_next_mb(struct virtio_mem *vm,
 		return -ENOSPC;
 
 	/* Resize the state array if required. */
-	rc = virtio_mem_mb_state_prepare_next_mb(vm);
+	rc = virtio_mem_sbm_mb_states_prepare_next_mb(vm);
 	if (rc)
 		return rc;
 
@@ -1197,7 +1200,7 @@ static int virtio_mem_prepare_next_mb(struct virtio_mem *vm,
 	if (rc)
 		return rc;
 
-	vm->nb_mb_state[VIRTIO_MEM_MB_STATE_UNUSED]++;
+	vm->sbm.mb_count[VIRTIO_MEM_SBM_MB_UNUSED]++;
 	*mb_id = vm->next_mb_id++;
 	return 0;
 }
@@ -1231,16 +1234,16 @@ static int virtio_mem_mb_plug_and_add(struct virtio_mem *vm,
 	 * so the memory notifiers will find the block in the right state.
 	 */
 	if (count == vm->nb_sb_per_mb)
-		virtio_mem_mb_set_state(vm, mb_id,
-					VIRTIO_MEM_MB_STATE_OFFLINE);
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					    VIRTIO_MEM_SBM_MB_OFFLINE);
 	else
-		virtio_mem_mb_set_state(vm, mb_id,
-					VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL);
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					    VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL);
 
 	/* Add the memory block to linux - if that fails, try to unplug. */
 	rc = virtio_mem_mb_add(vm, mb_id);
 	if (rc) {
-		enum virtio_mem_mb_state new_state = VIRTIO_MEM_MB_STATE_UNUSED;
+		int new_state = VIRTIO_MEM_SBM_MB_UNUSED;
 
 		dev_err(&vm->vdev->dev,
 			"adding memory block %lu failed with %d\n", mb_id, rc);
@@ -1250,8 +1253,8 @@ static int virtio_mem_mb_plug_and_add(struct virtio_mem *vm,
 		 * where adding of memory failed - especially on -ENOMEM.
 		 */
 		if (virtio_mem_mb_unplug_sb(vm, mb_id, 0, count))
-			new_state = VIRTIO_MEM_MB_STATE_PLUGGED;
-		virtio_mem_mb_set_state(vm, mb_id, new_state);
+			new_state = VIRTIO_MEM_SBM_MB_PLUGGED;
+		virtio_mem_sbm_set_mb_state(vm, mb_id, new_state);
 		return rc;
 	}
 
@@ -1304,11 +1307,11 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
 
 	if (virtio_mem_mb_test_sb_plugged(vm, mb_id, 0, vm->nb_sb_per_mb)) {
 		if (online)
-			virtio_mem_mb_set_state(vm, mb_id,
-						VIRTIO_MEM_MB_STATE_ONLINE);
+			virtio_mem_sbm_set_mb_state(vm, mb_id,
+						    VIRTIO_MEM_SBM_MB_ONLINE);
 		else
-			virtio_mem_mb_set_state(vm, mb_id,
-						VIRTIO_MEM_MB_STATE_OFFLINE);
+			virtio_mem_sbm_set_mb_state(vm, mb_id,
+						    VIRTIO_MEM_SBM_MB_OFFLINE);
 	}
 
 	return 0;
@@ -1330,8 +1333,8 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 	mutex_lock(&vm->hotplug_mutex);
 
 	/* Try to plug subblocks of partially plugged online blocks. */
-	virtio_mem_for_each_mb_state(vm, mb_id,
-				     VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL) {
+	virtio_mem_sbm_for_each_mb(vm, mb_id,
+				   VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL) {
 		rc = virtio_mem_mb_plug_any_sb(vm, mb_id, &nb_sb, true);
 		if (rc || !nb_sb)
 			goto out_unlock;
@@ -1339,8 +1342,8 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 	}
 
 	/* Try to plug subblocks of partially plugged offline blocks. */
-	virtio_mem_for_each_mb_state(vm, mb_id,
-				     VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL) {
+	virtio_mem_sbm_for_each_mb(vm, mb_id,
+				   VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL) {
 		rc = virtio_mem_mb_plug_any_sb(vm, mb_id, &nb_sb, false);
 		if (rc || !nb_sb)
 			goto out_unlock;
@@ -1354,7 +1357,7 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 	mutex_unlock(&vm->hotplug_mutex);
 
 	/* Try to plug and add unused blocks */
-	virtio_mem_for_each_mb_state(vm, mb_id, VIRTIO_MEM_MB_STATE_UNUSED) {
+	virtio_mem_sbm_for_each_mb(vm, mb_id, VIRTIO_MEM_SBM_MB_UNUSED) {
 		if (!virtio_mem_could_add_memory(vm, memory_block_size_bytes()))
 			return -ENOSPC;
 
@@ -1403,8 +1406,8 @@ static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
 
 	/* some subblocks might have been unplugged even on failure */
 	if (!virtio_mem_mb_test_sb_plugged(vm, mb_id, 0, vm->nb_sb_per_mb))
-		virtio_mem_mb_set_state(vm, mb_id,
-					VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL);
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					    VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL);
 	if (rc)
 		return rc;
 
@@ -1415,8 +1418,8 @@ static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
 		 * unplugged. Temporarily drop the mutex, so
 		 * any pending GOING_ONLINE requests can be serviced/rejected.
 		 */
-		virtio_mem_mb_set_state(vm, mb_id,
-					VIRTIO_MEM_MB_STATE_UNUSED);
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					    VIRTIO_MEM_SBM_MB_UNUSED);
 
 		mutex_unlock(&vm->hotplug_mutex);
 		rc = virtio_mem_mb_remove(vm, mb_id);
@@ -1454,8 +1457,8 @@ static int virtio_mem_mb_unplug_sb_online(struct virtio_mem *vm,
 		return rc;
 	}
 
-	virtio_mem_mb_set_state(vm, mb_id,
-				VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL);
+	virtio_mem_sbm_set_mb_state(vm, mb_id,
+				    VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL);
 	return 0;
 }
 
@@ -1515,8 +1518,8 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
 		rc = virtio_mem_mb_offline_and_remove(vm, mb_id);
 		mutex_lock(&vm->hotplug_mutex);
 		if (!rc)
-			virtio_mem_mb_set_state(vm, mb_id,
-						VIRTIO_MEM_MB_STATE_UNUSED);
+			virtio_mem_sbm_set_mb_state(vm, mb_id,
+						    VIRTIO_MEM_SBM_MB_UNUSED);
 	}
 
 	return 0;
@@ -1542,8 +1545,8 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 	mutex_lock(&vm->hotplug_mutex);
 
 	/* Try to unplug subblocks of partially plugged offline blocks. */
-	virtio_mem_for_each_mb_state_rev(vm, mb_id,
-					 VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL) {
+	virtio_mem_sbm_for_each_mb_rev(vm, mb_id,
+				       VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL) {
 		rc = virtio_mem_mb_unplug_any_sb_offline(vm, mb_id,
 							 &nb_sb);
 		if (rc || !nb_sb)
@@ -1552,8 +1555,7 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 	}
 
 	/* Try to unplug subblocks of plugged offline blocks. */
-	virtio_mem_for_each_mb_state_rev(vm, mb_id,
-					 VIRTIO_MEM_MB_STATE_OFFLINE) {
+	virtio_mem_sbm_for_each_mb_rev(vm, mb_id, VIRTIO_MEM_SBM_MB_OFFLINE) {
 		rc = virtio_mem_mb_unplug_any_sb_offline(vm, mb_id,
 							 &nb_sb);
 		if (rc || !nb_sb)
@@ -1567,8 +1569,8 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 	}
 
 	/* Try to unplug subblocks of partially plugged online blocks. */
-	virtio_mem_for_each_mb_state_rev(vm, mb_id,
-					 VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL) {
+	virtio_mem_sbm_for_each_mb_rev(vm, mb_id,
+				       VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL) {
 		rc = virtio_mem_mb_unplug_any_sb_online(vm, mb_id,
 							&nb_sb);
 		if (rc || !nb_sb)
@@ -1579,8 +1581,7 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 	}
 
 	/* Try to unplug subblocks of plugged online blocks. */
-	virtio_mem_for_each_mb_state_rev(vm, mb_id,
-					 VIRTIO_MEM_MB_STATE_ONLINE) {
+	virtio_mem_sbm_for_each_mb_rev(vm, mb_id, VIRTIO_MEM_SBM_MB_ONLINE) {
 		rc = virtio_mem_mb_unplug_any_sb_online(vm, mb_id,
 							&nb_sb);
 		if (rc || !nb_sb)
@@ -1606,11 +1607,12 @@ static int virtio_mem_unplug_pending_mb(struct virtio_mem *vm)
 	unsigned long mb_id;
 	int rc;
 
-	virtio_mem_for_each_mb_state(vm, mb_id, VIRTIO_MEM_MB_STATE_PLUGGED) {
+	virtio_mem_sbm_for_each_mb(vm, mb_id, VIRTIO_MEM_SBM_MB_PLUGGED) {
 		rc = virtio_mem_mb_unplug(vm, mb_id);
 		if (rc)
 			return rc;
-		virtio_mem_mb_set_state(vm, mb_id, VIRTIO_MEM_MB_STATE_UNUSED);
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					    VIRTIO_MEM_SBM_MB_UNUSED);
 	}
 
 	return 0;
@@ -2002,11 +2004,12 @@ static void virtio_mem_remove(struct virtio_device *vdev)
 	 * After we unregistered our callbacks, user space can online partially
 	 * plugged offline blocks. Make sure to remove them.
 	 */
-	virtio_mem_for_each_mb_state(vm, mb_id,
-				     VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL) {
+	virtio_mem_sbm_for_each_mb(vm, mb_id,
+				   VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL) {
 		rc = virtio_mem_mb_remove(vm, mb_id);
 		BUG_ON(rc);
-		virtio_mem_mb_set_state(vm, mb_id, VIRTIO_MEM_MB_STATE_UNUSED);
+		virtio_mem_sbm_set_mb_state(vm, mb_id,
+					    VIRTIO_MEM_SBM_MB_UNUSED);
 	}
 	/*
 	 * After we unregistered our callbacks, user space can no longer
@@ -2031,7 +2034,7 @@ static void virtio_mem_remove(struct virtio_device *vdev)
 	}
 
 	/* remove all tracking data - no locking needed */
-	vfree(vm->mb_state);
+	vfree(vm->sbm.mb_states);
 	vfree(vm->sb_bitmap);
 
 	/* reset the device and cleanup the queues */
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
