Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A192B06C7
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 14:40:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 47DCA85C77;
	Thu, 12 Nov 2020 13:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQalBukvzsix; Thu, 12 Nov 2020 13:40:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F1F386CE9;
	Thu, 12 Nov 2020 13:40:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19728C016F;
	Thu, 12 Nov 2020 13:40:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D24AC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 428FD877AF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DF-60FoKqV1l
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:40:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 22950877AC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCjVAAUVoNKqfkaVv8sPIQO1nP2Jfsw5KK4wOD97Wpg=;
 b=OLKEifuoH5nVwWGzAp7k379EXlYJq8kPp066Lu0yRCfkII6lZs/JUJpRzAF7qNHK+YWqE8
 oZAXxn66JzOSGDJdSYIV7gsmU/eom9uKSUusL/ik1JER3WPYgyzoNUgZVovuz5OqYYmyFz
 am3JBglaLIMI4O14ERbgRmcx99ZKgwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-vCFPWU_UPX2YxFSOUU1hLw-1; Thu, 12 Nov 2020 08:39:57 -0500
X-MC-Unique: vCFPWU_UPX2YxFSOUU1hLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2298809DE2;
 Thu, 12 Nov 2020 13:39:55 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17FEF55765;
 Thu, 12 Nov 2020 13:39:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/29] virtio-mem: Big Block Mode (BBM) memory hotplug
Date: Thu, 12 Nov 2020 14:38:11 +0100
Message-Id: <20201112133815.13332-26-david@redhat.com>
In-Reply-To: <20201112133815.13332-1-david@redhat.com>
References: <20201112133815.13332-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
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

Currently, we do not support device block sizes that exceed the Linux
memory block size. For example, having a device block size of 1 GiB (e.g.,
gigantic pages in the hypervisor) won't work with 128 MiB Linux memory
blocks.

Let's implement Big Block Mode (BBM), whereby we add/remove at least
one Linux memory block at a time. With a 1 GiB device block size, a Big
Block (BB) will cover 8 Linux memory blocks.

We'll keep registering the online_page_callback machinery, it will be used
for safe memory hotunplug in BBM next.

Note: BBM is properly prepared for variable-sized Linux memory
blocks that we might see in the future. So we won't care how many Linux
memory blocks a big block actually spans, and how the memory notifier is
called.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 560 ++++++++++++++++++++++++++++--------
 1 file changed, 441 insertions(+), 119 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 95fa0262af1d..8a4f735360ac 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -30,12 +30,18 @@ MODULE_PARM_DESC(unplug_online, "Try to unplug online memory");
 /*
  * virtio-mem currently supports the following modes of operation:
  *
- * * Sub Block Mode (SBM): A Linux memory block spans 1..X subblocks (SB). The
+ * * Sub Block Mode (SBM): A Linux memory block spans 2..X subblocks (SB). The
  *   size of a Sub Block (SB) is determined based on the device block size, the
  *   pageblock size, and the maximum allocation granularity of the buddy.
  *   Subblocks within a Linux memory block might either be plugged or unplugged.
  *   Memory is added/removed to Linux MM in Linux memory block granularity.
  *
+ * * Big Block Mode (BBM): A Big Block (BB) spans 1..X Linux memory blocks.
+ *   Memory is added/removed to Linux MM in Big Block granularity.
+ *
+ * The mode is determined automatically based on the Linux memory block size
+ * and the device block size.
+ *
  * User space / core MM (auto onlining) is responsible for onlining added
  * Linux memory blocks - and for selecting a zone. Linux Memory Blocks are
  * always onlined separately, and all memory within a Linux memory block is
@@ -61,6 +67,19 @@ enum virtio_mem_sbm_mb_state {
 	VIRTIO_MEM_SBM_MB_COUNT
 };
 
+/*
+ * State of a Big Block (BB) in BBM, covering 1..X Linux memory blocks.
+ */
+enum virtio_mem_bbm_bb_state {
+	/* Unplugged, not added to Linux. Can be reused later. */
+	VIRTIO_MEM_BBM_BB_UNUSED = 0,
+	/* Plugged, not added to Linux. Error on add_memory(). */
+	VIRTIO_MEM_BBM_BB_PLUGGED,
+	/* Plugged and added to Linux. */
+	VIRTIO_MEM_BBM_BB_ADDED,
+	VIRTIO_MEM_BBM_BB_COUNT
+};
+
 struct virtio_mem {
 	struct virtio_device *vdev;
 
@@ -113,47 +132,70 @@ struct virtio_mem {
 	atomic64_t offline_size;
 	uint64_t offline_threshold;
 
-	struct {
-		/* Id of the first memory block of this device. */
-		unsigned long first_mb_id;
-		/* Id of the last usable memory block of this device. */
-		unsigned long last_usable_mb_id;
-		/* Id of the next memory bock to prepare when needed. */
-		unsigned long next_mb_id;
-
-		/* The subblock size. */
-		uint64_t sb_size;
-		/* The number of subblocks per Linux memory block. */
-		uint32_t sbs_per_mb;
-
-		/* Summary of all memory block states. */
-		unsigned long mb_count[VIRTIO_MEM_SBM_MB_COUNT];
-
-		/*
-		 * One byte state per memory block. Allocated via vmalloc().
-		 * Resized (alloc+copy+free) on demand.
-		 *
-		 * With 128 MiB memory blocks, we have states for 512 GiB of
-		 * memory in one 4 KiB page.
-		 */
-		uint8_t *mb_states;
-
-		/*
-		 * Bitmap: one bit per subblock. Allocated similar to
-		 * sbm.mb_states.
-		 *
-		 * A set bit means the corresponding subblock is plugged,
-		 * otherwise it's unblocked.
-		 *
-		 * With 4 MiB subblocks, we manage 128 GiB of memory in one
-		 * 4 KiB page.
-		 */
-		unsigned long *sb_states;
-	} sbm;
+	/* If set, the driver is in SBM, otherwise in BBM. */
+	bool in_sbm;
+
+	union {
+		struct {
+			/* Id of the first memory block of this device. */
+			unsigned long first_mb_id;
+			/* Id of the last usable memory block of this device. */
+			unsigned long last_usable_mb_id;
+			/* Id of the next memory bock to prepare when needed. */
+			unsigned long next_mb_id;
+
+			/* The subblock size. */
+			uint64_t sb_size;
+			/* The number of subblocks per Linux memory block. */
+			uint32_t sbs_per_mb;
+
+			/* Summary of all memory block states. */
+			unsigned long mb_count[VIRTIO_MEM_SBM_MB_COUNT];
+
+			/*
+			 * One byte state per memory block. Allocated via
+			 * vmalloc(). Resized (alloc+copy+free) on demand.
+			 *
+			 * With 128 MiB memory blocks, we have states for 512
+			 * GiB of memory in one 4 KiB page.
+			 */
+			uint8_t *mb_states;
+
+			/*
+			 * Bitmap: one bit per subblock. Allocated similar to
+			 * sbm.mb_states.
+			 *
+			 * A set bit means the corresponding subblock is
+			 * plugged, otherwise it's unblocked.
+			 *
+			 * With 4 MiB subblocks, we manage 128 GiB of memory
+			 * in one 4 KiB page.
+			 */
+			unsigned long *sb_states;
+		} sbm;
+
+		struct {
+			/* Id of the first big block of this device. */
+			unsigned long first_bb_id;
+			/* Id of the last usable big block of this device. */
+			unsigned long last_usable_bb_id;
+			/* Id of the next device bock to prepare when needed. */
+			unsigned long next_bb_id;
+
+			/* Summary of all big block states. */
+			unsigned long bb_count[VIRTIO_MEM_BBM_BB_COUNT];
+
+			/* One byte state per big block. See sbm.mb_states. */
+			uint8_t *bb_states;
+
+			/* The block size used for plugging/adding/removing. */
+			uint64_t bb_size;
+		} bbm;
+	};
 
 	/*
-	 * Mutex that protects the sbm.mb_count, sbm.mb_states, and
-	 * sbm.sb_states.
+	 * Mutex that protects the sbm.mb_count, sbm.mb_states,
+	 * sbm.sb_states, bbm.bb_count, and bbm.bb_states
 	 *
 	 * When this lock is held the pointers can't change, ONLINE and
 	 * OFFLINE blocks can't change the state and no subblocks will get
@@ -247,6 +289,24 @@ static unsigned long virtio_mem_mb_id_to_phys(unsigned long mb_id)
 	return mb_id * memory_block_size_bytes();
 }
 
+/*
+ * Calculate the big block id of a given address.
+ */
+static unsigned long virtio_mem_phys_to_bb_id(struct virtio_mem *vm,
+					      uint64_t addr)
+{
+	return addr / vm->bbm.bb_size;
+}
+
+/*
+ * Calculate the physical start address of a given big block id.
+ */
+static uint64_t virtio_mem_bb_id_to_phys(struct virtio_mem *vm,
+					 unsigned long bb_id)
+{
+	return bb_id * vm->bbm.bb_size;
+}
+
 /*
  * Calculate the subblock id of a given address.
  */
@@ -259,6 +319,67 @@ static unsigned long virtio_mem_phys_to_sb_id(struct virtio_mem *vm,
 	return (addr - mb_addr) / vm->sbm.sb_size;
 }
 
+/*
+ * Set the state of a big block, taking care of the state counter.
+ */
+static void virtio_mem_bbm_set_bb_state(struct virtio_mem *vm,
+					unsigned long bb_id,
+					enum virtio_mem_bbm_bb_state state)
+{
+	const unsigned long idx = bb_id - vm->bbm.first_bb_id;
+	enum virtio_mem_bbm_bb_state old_state;
+
+	old_state = vm->bbm.bb_states[idx];
+	vm->bbm.bb_states[idx] = state;
+
+	BUG_ON(vm->bbm.bb_count[old_state] == 0);
+	vm->bbm.bb_count[old_state]--;
+	vm->bbm.bb_count[state]++;
+}
+
+/*
+ * Get the state of a big block.
+ */
+static enum virtio_mem_bbm_bb_state virtio_mem_bbm_get_bb_state(struct virtio_mem *vm,
+								unsigned long bb_id)
+{
+	return vm->bbm.bb_states[bb_id - vm->bbm.first_bb_id];
+}
+
+/*
+ * Prepare the big block state array for the next big block.
+ */
+static int virtio_mem_bbm_bb_states_prepare_next_bb(struct virtio_mem *vm)
+{
+	unsigned long old_bytes = vm->bbm.next_bb_id - vm->bbm.first_bb_id;
+	unsigned long new_bytes = old_bytes + 1;
+	int old_pages = PFN_UP(old_bytes);
+	int new_pages = PFN_UP(new_bytes);
+	uint8_t *new_array;
+
+	if (vm->bbm.bb_states && old_pages == new_pages)
+		return 0;
+
+	new_array = vzalloc(new_pages * PAGE_SIZE);
+	if (!new_array)
+		return -ENOMEM;
+
+	mutex_lock(&vm->hotplug_mutex);
+	if (vm->bbm.bb_states)
+		memcpy(new_array, vm->bbm.bb_states, old_pages * PAGE_SIZE);
+	vfree(vm->bbm.bb_states);
+	vm->bbm.bb_states = new_array;
+	mutex_unlock(&vm->hotplug_mutex);
+
+	return 0;
+}
+
+#define virtio_mem_bbm_for_each_bb(_vm, _bb_id, _state) \
+	for (_bb_id = vm->bbm.first_bb_id; \
+	     _bb_id < vm->bbm.next_bb_id && _vm->bbm.bb_count[_state]; \
+	     _bb_id++) \
+		if (virtio_mem_bbm_get_bb_state(_vm, _bb_id) == _state)
+
 /*
  * Set the state of a memory block, taking care of the state counter.
  */
@@ -502,6 +623,17 @@ static int virtio_mem_sbm_add_mb(struct virtio_mem *vm, unsigned long mb_id)
 	return virtio_mem_add_memory(vm, addr, size);
 }
 
+/*
+ * See virtio_mem_add_memory(): Try adding a big block.
+ */
+static int virtio_mem_bbm_add_bb(struct virtio_mem *vm, unsigned long bb_id)
+{
+	const uint64_t addr = virtio_mem_bb_id_to_phys(vm, bb_id);
+	const uint64_t size = vm->bbm.bb_size;
+
+	return virtio_mem_add_memory(vm, addr, size);
+}
+
 /*
  * Try removing memory from Linux. Will only fail if memory blocks aren't
  * offline.
@@ -729,20 +861,33 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 	struct memory_notify *mhp = arg;
 	const unsigned long start = PFN_PHYS(mhp->start_pfn);
 	const unsigned long size = PFN_PHYS(mhp->nr_pages);
-	const unsigned long mb_id = virtio_mem_phys_to_mb_id(start);
 	int rc = NOTIFY_OK;
+	unsigned long id;
 
 	if (!virtio_mem_overlaps_range(vm, start, size))
 		return NOTIFY_DONE;
 
-	/*
-	 * Memory is onlined/offlined in memory block granularity. We cannot
-	 * cross virtio-mem device boundaries and memory block boundaries. Bail
-	 * out if this ever changes.
-	 */
-	if (WARN_ON_ONCE(size != memory_block_size_bytes() ||
-			 !IS_ALIGNED(start, memory_block_size_bytes())))
-		return NOTIFY_BAD;
+	if (vm->in_sbm) {
+		id = virtio_mem_phys_to_mb_id(start);
+		/*
+		 * In SBM, we add memory in separate memory blocks - we expect
+		 * it to be onlined/offlined in the same granularity. Bail out
+		 * if this ever changes.
+		 */
+		if (WARN_ON_ONCE(size != memory_block_size_bytes() ||
+				 !IS_ALIGNED(start, memory_block_size_bytes())))
+			return NOTIFY_BAD;
+	} else {
+		id = virtio_mem_phys_to_bb_id(vm, start);
+		/*
+		 * In BBM, we only care about onlining/offlining happening
+		 * within a single big block, we don't care about the
+		 * actual granularity as we don't track individual Linux
+		 * memory blocks.
+		 */
+		if (WARN_ON_ONCE(id != virtio_mem_phys_to_bb_id(vm, start + size - 1)))
+			return NOTIFY_BAD;
+	}
 
 	/*
 	 * Avoid circular locking lockdep warnings. We lock the mutex
@@ -761,7 +906,8 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 			break;
 		}
 		vm->hotplug_active = true;
-		virtio_mem_sbm_notify_going_offline(vm, mb_id);
+		if (vm->in_sbm)
+			virtio_mem_sbm_notify_going_offline(vm, id);
 		break;
 	case MEM_GOING_ONLINE:
 		mutex_lock(&vm->hotplug_mutex);
@@ -771,10 +917,12 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 			break;
 		}
 		vm->hotplug_active = true;
-		rc = virtio_mem_sbm_notify_going_online(vm, mb_id);
+		if (vm->in_sbm)
+			rc = virtio_mem_sbm_notify_going_online(vm, id);
 		break;
 	case MEM_OFFLINE:
-		virtio_mem_sbm_notify_offline(vm, mb_id);
+		if (vm->in_sbm)
+			virtio_mem_sbm_notify_offline(vm, id);
 
 		atomic64_add(size, &vm->offline_size);
 		/*
@@ -788,7 +936,8 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 		mutex_unlock(&vm->hotplug_mutex);
 		break;
 	case MEM_ONLINE:
-		virtio_mem_sbm_notify_online(vm, mb_id);
+		if (vm->in_sbm)
+			virtio_mem_sbm_notify_online(vm, id);
 
 		atomic64_sub(size, &vm->offline_size);
 		/*
@@ -807,7 +956,8 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 	case MEM_CANCEL_OFFLINE:
 		if (!vm->hotplug_active)
 			break;
-		virtio_mem_sbm_notify_cancel_offline(vm, mb_id);
+		if (vm->in_sbm)
+			virtio_mem_sbm_notify_cancel_offline(vm, id);
 		vm->hotplug_active = false;
 		mutex_unlock(&vm->hotplug_mutex);
 		break;
@@ -978,27 +1128,29 @@ static void virtio_mem_fake_offline_cancel_offline(unsigned long pfn,
 static void virtio_mem_online_page_cb(struct page *page, unsigned int order)
 {
 	const unsigned long addr = page_to_phys(page);
-	const unsigned long mb_id = virtio_mem_phys_to_mb_id(addr);
+	unsigned long id, sb_id;
 	struct virtio_mem *vm;
-	int sb_id;
+	bool do_online;
 
-	/*
-	 * We exploit here that subblocks have at least MAX_ORDER_NR_PAGES.
-	 * size/alignment and that this callback is is called with such a
-	 * size/alignment. So we cannot cross subblocks and therefore
-	 * also not memory blocks.
-	 */
 	rcu_read_lock();
 	list_for_each_entry_rcu(vm, &virtio_mem_devices, next) {
 		if (!virtio_mem_contains_range(vm, addr, PFN_PHYS(1 << order)))
 			continue;
 
-		sb_id = virtio_mem_phys_to_sb_id(vm, addr);
-		/*
-		 * If plugged, online the pages, otherwise, set them fake
-		 * offline (PageOffline).
-		 */
-		if (virtio_mem_sbm_test_sb_plugged(vm, mb_id, sb_id, 1))
+		if (vm->in_sbm) {
+			/*
+			 * We exploit here that subblocks have at least
+			 * MAX_ORDER_NR_PAGES size/alignment - so we cannot
+			 * cross subblocks within one call.
+			 */
+			id = virtio_mem_phys_to_mb_id(addr);
+			sb_id = virtio_mem_phys_to_sb_id(vm, addr);
+			do_online = virtio_mem_sbm_test_sb_plugged(vm, id,
+								   sb_id, 1);
+		} else {
+			do_online = true;
+		}
+		if (do_online)
 			generic_online_page(page, order);
 		else
 			virtio_mem_set_fake_offline(PFN_DOWN(addr), 1 << order,
@@ -1178,6 +1330,32 @@ static int virtio_mem_sbm_unplug_sb(struct virtio_mem *vm, unsigned long mb_id,
 	return rc;
 }
 
+/*
+ * Request to unplug a big block.
+ *
+ * Will not modify the state of the big block.
+ */
+static int virtio_mem_bbm_unplug_bb(struct virtio_mem *vm, unsigned long bb_id)
+{
+	const uint64_t addr = virtio_mem_bb_id_to_phys(vm, bb_id);
+	const uint64_t size = vm->bbm.bb_size;
+
+	return virtio_mem_send_unplug_request(vm, addr, size);
+}
+
+/*
+ * Request to plug a big block.
+ *
+ * Will not modify the state of the big block.
+ */
+static int virtio_mem_bbm_plug_bb(struct virtio_mem *vm, unsigned long bb_id)
+{
+	const uint64_t addr = virtio_mem_bb_id_to_phys(vm, bb_id);
+	const uint64_t size = vm->bbm.bb_size;
+
+	return virtio_mem_send_plug_request(vm, addr, size);
+}
+
 /*
  * Unplug the desired number of plugged subblocks of a offline or not-added
  * memory block. Will fail if any subblock cannot get unplugged (instead of
@@ -1363,10 +1541,7 @@ static int virtio_mem_sbm_plug_any_sb(struct virtio_mem *vm,
 	return 0;
 }
 
-/*
- * Try to plug the requested amount of memory.
- */
-static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
+static int virtio_mem_sbm_plug_request(struct virtio_mem *vm, uint64_t diff)
 {
 	uint64_t nb_sb = diff / vm->sbm.sb_size;
 	unsigned long mb_id;
@@ -1433,6 +1608,112 @@ static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
 	return rc;
 }
 
+/*
+ * Plug a big block and add it to Linux.
+ *
+ * Will modify the state of the big block.
+ */
+static int virtio_mem_bbm_plug_and_add_bb(struct virtio_mem *vm,
+					  unsigned long bb_id)
+{
+	int rc;
+
+	if (WARN_ON_ONCE(virtio_mem_bbm_get_bb_state(vm, bb_id) !=
+			 VIRTIO_MEM_BBM_BB_UNUSED))
+		return -EINVAL;
+
+	rc = virtio_mem_bbm_plug_bb(vm, bb_id);
+	if (rc)
+		return rc;
+	virtio_mem_bbm_set_bb_state(vm, bb_id, VIRTIO_MEM_BBM_BB_ADDED);
+
+	rc = virtio_mem_bbm_add_bb(vm, bb_id);
+	if (rc) {
+		if (!virtio_mem_bbm_unplug_bb(vm, bb_id))
+			virtio_mem_bbm_set_bb_state(vm, bb_id,
+						    VIRTIO_MEM_BBM_BB_UNUSED);
+		else
+			/* Retry from the main loop. */
+			virtio_mem_bbm_set_bb_state(vm, bb_id,
+						    VIRTIO_MEM_BBM_BB_PLUGGED);
+		return rc;
+	}
+	return 0;
+}
+
+/*
+ * Prepare tracking data for the next big block.
+ */
+static int virtio_mem_bbm_prepare_next_bb(struct virtio_mem *vm,
+					  unsigned long *bb_id)
+{
+	int rc;
+
+	if (vm->bbm.next_bb_id > vm->bbm.last_usable_bb_id)
+		return -ENOSPC;
+
+	/* Resize the big block state array if required. */
+	rc = virtio_mem_bbm_bb_states_prepare_next_bb(vm);
+	if (rc)
+		return rc;
+
+	vm->bbm.bb_count[VIRTIO_MEM_BBM_BB_UNUSED]++;
+	*bb_id = vm->bbm.next_bb_id;
+	vm->bbm.next_bb_id++;
+	return 0;
+}
+
+static int virtio_mem_bbm_plug_request(struct virtio_mem *vm, uint64_t diff)
+{
+	uint64_t nb_bb = diff / vm->bbm.bb_size;
+	unsigned long bb_id;
+	int rc;
+
+	if (!nb_bb)
+		return 0;
+
+	/* Try to plug and add unused big blocks */
+	virtio_mem_bbm_for_each_bb(vm, bb_id, VIRTIO_MEM_BBM_BB_UNUSED) {
+		if (!virtio_mem_could_add_memory(vm, vm->bbm.bb_size))
+			return -ENOSPC;
+
+		rc = virtio_mem_bbm_plug_and_add_bb(vm, bb_id);
+		if (!rc)
+			nb_bb--;
+		if (rc || !nb_bb)
+			return rc;
+		cond_resched();
+	}
+
+	/* Try to prepare, plug and add new big blocks */
+	while (nb_bb) {
+		if (!virtio_mem_could_add_memory(vm, vm->bbm.bb_size))
+			return -ENOSPC;
+
+		rc = virtio_mem_bbm_prepare_next_bb(vm, &bb_id);
+		if (rc)
+			return rc;
+		rc = virtio_mem_bbm_plug_and_add_bb(vm, bb_id);
+		if (!rc)
+			nb_bb--;
+		if (rc)
+			return rc;
+		cond_resched();
+	}
+
+	return 0;
+}
+
+/*
+ * Try to plug the requested amount of memory.
+ */
+static int virtio_mem_plug_request(struct virtio_mem *vm, uint64_t diff)
+{
+	if (vm->in_sbm)
+		return virtio_mem_sbm_plug_request(vm, diff);
+	return virtio_mem_bbm_plug_request(vm, diff);
+}
+
 /*
  * Unplug the desired number of plugged subblocks of an offline memory block.
  * Will fail if any subblock cannot get unplugged (instead of skipping it).
@@ -1571,10 +1852,7 @@ static int virtio_mem_sbm_unplug_any_sb_online(struct virtio_mem *vm,
 	return 0;
 }
 
-/*
- * Try to unplug the requested amount of memory.
- */
-static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
+static int virtio_mem_sbm_unplug_request(struct virtio_mem *vm, uint64_t diff)
 {
 	uint64_t nb_sb = diff / vm->sbm.sb_size;
 	unsigned long mb_id;
@@ -1640,20 +1918,42 @@ static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
 	return rc;
 }
 
+/*
+ * Try to unplug the requested amount of memory.
+ */
+static int virtio_mem_unplug_request(struct virtio_mem *vm, uint64_t diff)
+{
+	if (vm->in_sbm)
+		return virtio_mem_sbm_unplug_request(vm, diff);
+	return -EBUSY;
+}
+
 /*
  * Try to unplug all blocks that couldn't be unplugged before, for example,
  * because the hypervisor was busy.
  */
 static int virtio_mem_unplug_pending_mb(struct virtio_mem *vm)
 {
-	unsigned long mb_id;
+	unsigned long id;
 	int rc;
 
-	virtio_mem_sbm_for_each_mb(vm, mb_id, VIRTIO_MEM_SBM_MB_PLUGGED) {
-		rc = virtio_mem_sbm_unplug_mb(vm, mb_id);
+	if (!vm->in_sbm) {
+		virtio_mem_bbm_for_each_bb(vm, id,
+					   VIRTIO_MEM_BBM_BB_PLUGGED) {
+			rc = virtio_mem_bbm_unplug_bb(vm, id);
+			if (rc)
+				return rc;
+			virtio_mem_bbm_set_bb_state(vm, id,
+						    VIRTIO_MEM_BBM_BB_UNUSED);
+		}
+		return 0;
+	}
+
+	virtio_mem_sbm_for_each_mb(vm, id, VIRTIO_MEM_SBM_MB_PLUGGED) {
+		rc = virtio_mem_sbm_unplug_mb(vm, id);
 		if (rc)
 			return rc;
-		virtio_mem_sbm_set_mb_state(vm, mb_id,
+		virtio_mem_sbm_set_mb_state(vm, id,
 					    VIRTIO_MEM_SBM_MB_UNUSED);
 	}
 
@@ -1679,7 +1979,13 @@ static void virtio_mem_refresh_config(struct virtio_mem *vm)
 			usable_region_size, &usable_region_size);
 	end_addr = vm->addr + usable_region_size;
 	end_addr = min(end_addr, phys_limit);
-	vm->sbm.last_usable_mb_id = virtio_mem_phys_to_mb_id(end_addr) - 1;
+
+	if (vm->in_sbm)
+		vm->sbm.last_usable_mb_id =
+					 virtio_mem_phys_to_mb_id(end_addr) - 1;
+	else
+		vm->bbm.last_usable_bb_id =
+				     virtio_mem_phys_to_bb_id(vm, end_addr) - 1;
 
 	/* see if there is a request to change the size */
 	virtio_cread_le(vm->vdev, struct virtio_mem_config, requested_size,
@@ -1802,6 +2108,7 @@ static int virtio_mem_init_vq(struct virtio_mem *vm)
 static int virtio_mem_init(struct virtio_mem *vm)
 {
 	const uint64_t phys_limit = 1UL << MAX_PHYSMEM_BITS;
+	uint64_t sb_size, addr;
 	uint16_t node_id;
 
 	if (!vm->vdev->config->get) {
@@ -1834,16 +2141,6 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	if (vm->nid == NUMA_NO_NODE)
 		vm->nid = memory_add_physaddr_to_nid(vm->addr);
 
-	/*
-	 * We always hotplug memory in memory block granularity. This way,
-	 * we have to wait for exactly one memory block to online.
-	 */
-	if (vm->device_block_size > memory_block_size_bytes()) {
-		dev_err(&vm->vdev->dev,
-			"The block size is not supported (too big).\n");
-		return -EINVAL;
-	}
-
 	/* bad device setup - warn only */
 	if (!IS_ALIGNED(vm->addr, memory_block_size_bytes()))
 		dev_warn(&vm->vdev->dev,
@@ -1863,20 +2160,35 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	 * - Is required for now for alloc_contig_range() to work reliably -
 	 *   it doesn't properly handle smaller granularity on ZONE_NORMAL.
 	 */
-	vm->sbm.sb_size = max_t(uint64_t, MAX_ORDER_NR_PAGES,
-				pageblock_nr_pages) * PAGE_SIZE;
-	vm->sbm.sb_size = max_t(uint64_t, vm->device_block_size,
-				vm->sbm.sb_size);
-	vm->sbm.sbs_per_mb = memory_block_size_bytes() / vm->sbm.sb_size;
+	sb_size = max_t(uint64_t, MAX_ORDER_NR_PAGES,
+			pageblock_nr_pages) * PAGE_SIZE;
+	sb_size = max_t(uint64_t, vm->device_block_size, sb_size);
+
+	if (sb_size < memory_block_size_bytes()) {
+		/* SBM: At least two subblocks per Linux memory block. */
+		vm->in_sbm = true;
+		vm->sbm.sb_size = sb_size;
+		vm->sbm.sbs_per_mb = memory_block_size_bytes() /
+				     vm->sbm.sb_size;
+
+		/* Round up to the next full memory block */
+		addr = vm->addr + memory_block_size_bytes() - 1;
+		vm->sbm.first_mb_id = virtio_mem_phys_to_mb_id(addr);
+		vm->sbm.next_mb_id = vm->sbm.first_mb_id;
+	} else {
+		/* BBM: At least one Linux memory block. */
+		vm->bbm.bb_size = vm->device_block_size;
 
-	/* Round up to the next full memory block */
-	vm->sbm.first_mb_id = virtio_mem_phys_to_mb_id(vm->addr - 1 +
-						       memory_block_size_bytes());
-	vm->sbm.next_mb_id = vm->sbm.first_mb_id;
+		vm->bbm.first_bb_id = virtio_mem_phys_to_bb_id(vm, vm->addr);
+		vm->bbm.next_bb_id = vm->bbm.first_bb_id;
+	}
 
 	/* Prepare the offline threshold - make sure we can add two blocks. */
 	vm->offline_threshold = max_t(uint64_t, 2 * memory_block_size_bytes(),
 				      VIRTIO_MEM_DEFAULT_OFFLINE_THRESHOLD);
+	/* In BBM, we also want at least two big blocks. */
+	vm->offline_threshold = max_t(uint64_t, 2 * vm->bbm.bb_size,
+				      vm->offline_threshold);
 
 	dev_info(&vm->vdev->dev, "start address: 0x%llx", vm->addr);
 	dev_info(&vm->vdev->dev, "region size: 0x%llx", vm->region_size);
@@ -1884,8 +2196,12 @@ static int virtio_mem_init(struct virtio_mem *vm)
 		 (unsigned long long)vm->device_block_size);
 	dev_info(&vm->vdev->dev, "memory block size: 0x%lx",
 		 memory_block_size_bytes());
-	dev_info(&vm->vdev->dev, "subblock size: 0x%llx",
-		 (unsigned long long)vm->sbm.sb_size);
+	if (vm->in_sbm)
+		dev_info(&vm->vdev->dev, "subblock size: 0x%llx",
+			 (unsigned long long)vm->sbm.sb_size);
+	else
+		dev_info(&vm->vdev->dev, "big block size: 0x%llx",
+			 (unsigned long long)vm->bbm.bb_size);
 	if (vm->nid != NUMA_NO_NODE && IS_ENABLED(CONFIG_NUMA))
 		dev_info(&vm->vdev->dev, "nid: %d", vm->nid);
 
@@ -2042,22 +2358,24 @@ static void virtio_mem_remove(struct virtio_device *vdev)
 	cancel_work_sync(&vm->wq);
 	hrtimer_cancel(&vm->retry_timer);
 
-	/*
-	 * After we unregistered our callbacks, user space can online partially
-	 * plugged offline blocks. Make sure to remove them.
-	 */
-	virtio_mem_sbm_for_each_mb(vm, mb_id,
-				   VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL) {
-		rc = virtio_mem_sbm_remove_mb(vm, mb_id);
-		BUG_ON(rc);
-		virtio_mem_sbm_set_mb_state(vm, mb_id,
-					    VIRTIO_MEM_SBM_MB_UNUSED);
+	if (vm->in_sbm) {
+		/*
+		 * After we unregistered our callbacks, user space can online
+		 * partially plugged offline blocks. Make sure to remove them.
+		 */
+		virtio_mem_sbm_for_each_mb(vm, mb_id,
+					   VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL) {
+			rc = virtio_mem_sbm_remove_mb(vm, mb_id);
+			BUG_ON(rc);
+			virtio_mem_sbm_set_mb_state(vm, mb_id,
+						    VIRTIO_MEM_SBM_MB_UNUSED);
+		}
+		/*
+		 * After we unregistered our callbacks, user space can no longer
+		 * offline partially plugged online memory blocks. No need to
+		 * worry about them.
+		 */
 	}
-	/*
-	 * After we unregistered our callbacks, user space can no longer
-	 * offline partially plugged online memory blocks. No need to worry
-	 * about them.
-	 */
 
 	/* unregister callbacks */
 	unregister_virtio_mem_device(vm);
@@ -2076,8 +2394,12 @@ static void virtio_mem_remove(struct virtio_device *vdev)
 	}
 
 	/* remove all tracking data - no locking needed */
-	vfree(vm->sbm.mb_states);
-	vfree(vm->sbm.sb_states);
+	if (vm->in_sbm) {
+		vfree(vm->sbm.mb_states);
+		vfree(vm->sbm.sb_states);
+	} else {
+		vfree(vm->bbm.bb_states);
+	}
 
 	/* reset the device and cleanup the queues */
 	vdev->config->reset(vdev);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
