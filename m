Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6999041B62C
	for <lists.virtualization@lfdr.de>; Tue, 28 Sep 2021 20:26:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A43E414B6;
	Tue, 28 Sep 2021 18:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Se0fEyt8_RES; Tue, 28 Sep 2021 18:26:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1D9FF414C1;
	Tue, 28 Sep 2021 18:26:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98550C000D;
	Tue, 28 Sep 2021 18:26:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8768C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7CC760B47
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id su_sd9zL60c4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:26:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B535B60B41
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 18:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632853571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzlLhr7xjIoW1XJLU3ED3fLv2V7GEnOWprvFn/XGCFI=;
 b=f/2+TviPXKP4Dumks4c2kr57KjcyuUDkfA8hljxIS8xn26gmGpFxiHDM3n8bQ5EfjxqQDf
 QFOR2ygalqXi77BcgVd5jk+5KYApuTEvCLfb1so1gGuNojAPOVnUAxNPj+MO8dZ+ydfJxS
 DA+o3iqTxjxJyIF1mm3xIYeGN8rzbVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-4ipKgBKjNMS9GXMmOtGfLA-1; Tue, 28 Sep 2021 14:26:09 -0400
X-MC-Unique: 4ipKgBKjNMS9GXMmOtGfLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 690D3A40C1;
 Tue, 28 Sep 2021 18:26:07 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 893F260854;
 Tue, 28 Sep 2021 18:25:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/8] virtio-mem: kdump mode to sanitize /proc/vmcore access
Date: Tue, 28 Sep 2021 20:22:58 +0200
Message-Id: <20210928182258.12451-9-david@redhat.com>
In-Reply-To: <20210928182258.12451-1-david@redhat.com>
References: <20210928182258.12451-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Michal Hocko <mhocko@suse.com>, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Baoquan He <bhe@redhat.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 kexec@lists.infradead.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
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

Although virtio-mem currently supports reading unplugged memory in the
hypervisor, this will change in the future, indicated to the device via
a new feature flag. We similarly sanitized /proc/kcore access recently. [1]

Let's register a vmcore callback, to allow vmcore code to check if a PFN
belonging to a virtio-mem device is either currently plugged and should
be dumped or is currently unplugged and should not be accessed, instead
mapping the shared zeropage or returning zeroes when reading.

This is important when not capturing /proc/vmcore via tools like
"makedumpfile" that can identify logically unplugged virtio-mem memory via
PG_offline in the memmap, but simply by e.g., copying the file.

Distributions that support virtio-mem+kdump have to make sure that the
virtio_mem module will be part of the kdump kernel or the kdump initrd;
dracut was recently [2] extended to include virtio-mem in the generated
initrd. As long as no special kdump kernels are used, this will
automatically make sure that virtio-mem will be around in the kdump initrd
and sanitize /proc/vmcore access -- with dracut.

With this series, we'll send one virtio-mem state request for every
~2 MiB chunk of virtio-mem memory indicated in the vmcore that we intend
to read/map.

In the future, we might want to allow building virtio-mem for kdump
mode only, even without CONFIG_MEMORY_HOTPLUG and friends: this way,
we could support special stripped-down kdump kernels that have many
other config options disabled; we'll tackle that once required. Further,
we might want to try sensing bigger blocks (e.g., memory sections)
first before falling back to device blocks on demand.

Tested with Fedora rawhide, which contains a recent kexec-tools version
(considering "System RAM (virtio_mem)" when creating the vmcore header) and
a recent dracut version (including the virtio_mem module in the kdump
initrd).

[1] https://lkml.kernel.org/r/20210526093041.8800-1-david@redhat.com
[2] https://github.com/dracutdevs/dracut/pull/1157

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 136 ++++++++++++++++++++++++++++++++----
 1 file changed, 124 insertions(+), 12 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 76d8aef3cfd2..ec0b2ab37acb 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -223,6 +223,9 @@ struct virtio_mem {
 	 * When this lock is held the pointers can't change, ONLINE and
 	 * OFFLINE blocks can't change the state and no subblocks will get
 	 * plugged/unplugged.
+	 *
+	 * In kdump mode, used to serialize requests, last_block_addr and
+	 * last_block_plugged.
 	 */
 	struct mutex hotplug_mutex;
 	bool hotplug_active;
@@ -230,6 +233,9 @@ struct virtio_mem {
 	/* An error occurred we cannot handle - stop processing requests. */
 	bool broken;
 
+	/* Cached valued of is_kdump_kernel() when the device was probed. */
+	bool in_kdump;
+
 	/* The driver is being removed. */
 	spinlock_t removal_lock;
 	bool removing;
@@ -243,6 +249,13 @@ struct virtio_mem {
 	/* Memory notifier (online/offline events). */
 	struct notifier_block memory_notifier;
 
+#ifdef CONFIG_PROC_VMCORE
+	/* vmcore callback for /proc/vmcore handling in kdump mode */
+	struct vmcore_cb vmcore_cb;
+	uint64_t last_block_addr;
+	bool last_block_plugged;
+#endif /* CONFIG_PROC_VMCORE */
+
 	/* Next device in the list of virtio-mem devices. */
 	struct list_head next;
 };
@@ -2293,6 +2306,12 @@ static void virtio_mem_run_wq(struct work_struct *work)
 	uint64_t diff;
 	int rc;
 
+	if (unlikely(vm->in_kdump)) {
+		dev_warn_once(&vm->vdev->dev,
+			     "unexpected workqueue run in kdump kernel\n");
+		return;
+	}
+
 	hrtimer_cancel(&vm->retry_timer);
 
 	if (vm->broken)
@@ -2521,6 +2540,86 @@ static int virtio_mem_init_hotplug(struct virtio_mem *vm)
 	return rc;
 }
 
+#ifdef CONFIG_PROC_VMCORE
+static int virtio_mem_send_state_request(struct virtio_mem *vm, uint64_t addr,
+					 uint64_t size)
+{
+	const uint64_t nb_vm_blocks = size / vm->device_block_size;
+	const struct virtio_mem_req req = {
+		.type = cpu_to_virtio16(vm->vdev, VIRTIO_MEM_REQ_STATE),
+		.u.state.addr = cpu_to_virtio64(vm->vdev, addr),
+		.u.state.nb_blocks = cpu_to_virtio16(vm->vdev, nb_vm_blocks),
+	};
+	int rc = -ENOMEM;
+
+	dev_dbg(&vm->vdev->dev, "requesting state: 0x%llx - 0x%llx\n", addr,
+		addr + size - 1);
+
+	switch (virtio_mem_send_request(vm, &req)) {
+	case VIRTIO_MEM_RESP_ACK:
+		return virtio16_to_cpu(vm->vdev, vm->resp.u.state.state);
+	case VIRTIO_MEM_RESP_ERROR:
+		rc = -EINVAL;
+		break;
+	default:
+		break;
+	}
+
+	dev_dbg(&vm->vdev->dev, "requesting state failed: %d\n", rc);
+	return rc;
+}
+
+static bool virtio_mem_vmcore_pfn_is_ram(struct vmcore_cb *cb,
+					 unsigned long pfn)
+{
+	struct virtio_mem *vm = container_of(cb, struct virtio_mem,
+					     vmcore_cb);
+	uint64_t addr = PFN_PHYS(pfn);
+	bool is_ram;
+	int rc;
+
+	if (!virtio_mem_contains_range(vm, addr, addr + PAGE_SIZE))
+		return true;
+	if (!vm->plugged_size)
+		return false;
+
+	/*
+	 * We have to serialize device requests and access to the information
+	 * about the block queried last.
+	 */
+	mutex_lock(&vm->hotplug_mutex);
+
+	addr = ALIGN_DOWN(addr, vm->device_block_size);
+	if (addr != vm->last_block_addr) {
+		rc = virtio_mem_send_state_request(vm, addr,
+						   vm->device_block_size);
+		/* On any kind of error, we're going to signal !ram. */
+		if (rc == VIRTIO_MEM_STATE_PLUGGED)
+			vm->last_block_plugged = true;
+		else
+			vm->last_block_plugged = false;
+		vm->last_block_addr = addr;
+	}
+
+	is_ram = vm->last_block_plugged;
+	mutex_unlock(&vm->hotplug_mutex);
+	return is_ram;
+}
+#endif /* CONFIG_PROC_VMCORE */
+
+static int virtio_mem_init_kdump(struct virtio_mem *vm)
+{
+#ifdef CONFIG_PROC_VMCORE
+	dev_info(&vm->vdev->dev, "memory hot(un)plug disabled in kdump kernel\n");
+	vm->vmcore_cb.pfn_is_ram = virtio_mem_vmcore_pfn_is_ram;
+	register_vmcore_cb(&vm->vmcore_cb);
+	return 0;
+#else /* CONFIG_PROC_VMCORE */
+	dev_warn(&vm->vdev->dev, "disabled in kdump kernel without vmcore\n");
+	return -EBUSY;
+#endif /* CONFIG_PROC_VMCORE */
+}
+
 static int virtio_mem_init(struct virtio_mem *vm)
 {
 	uint16_t node_id;
@@ -2530,15 +2629,6 @@ static int virtio_mem_init(struct virtio_mem *vm)
 		return -EINVAL;
 	}
 
-	/*
-	 * We don't want to (un)plug or reuse any memory when in kdump. The
-	 * memory is still accessible (but not mapped).
-	 */
-	if (is_kdump_kernel()) {
-		dev_warn(&vm->vdev->dev, "disabled in kdump kernel\n");
-		return -EBUSY;
-	}
-
 	/* Fetch all properties that can't change. */
 	virtio_cread_le(vm->vdev, struct virtio_mem_config, plugged_size,
 			&vm->plugged_size);
@@ -2562,6 +2652,12 @@ static int virtio_mem_init(struct virtio_mem *vm)
 	if (vm->nid != NUMA_NO_NODE && IS_ENABLED(CONFIG_NUMA))
 		dev_info(&vm->vdev->dev, "nid: %d", vm->nid);
 
+	/*
+	 * We don't want to (un)plug or reuse any memory when in kdump. The
+	 * memory is still accessible (but not exposed to Linux).
+	 */
+	if (vm->in_kdump)
+		return virtio_mem_init_kdump(vm);
 	return virtio_mem_init_hotplug(vm);
 }
 
@@ -2640,6 +2736,7 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 	hrtimer_init(&vm->retry_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	vm->retry_timer.function = virtio_mem_timer_expired;
 	vm->retry_timer_ms = VIRTIO_MEM_RETRY_TIMER_MIN_MS;
+	vm->in_kdump = is_kdump_kernel();
 
 	/* register the virtqueue */
 	rc = virtio_mem_init_vq(vm);
@@ -2654,8 +2751,10 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 	virtio_device_ready(vdev);
 
 	/* trigger a config update to start processing the requested_size */
-	atomic_set(&vm->config_changed, 1);
-	queue_work(system_freezable_wq, &vm->wq);
+	if (!vm->in_kdump) {
+		atomic_set(&vm->config_changed, 1);
+		queue_work(system_freezable_wq, &vm->wq);
+	}
 
 	return 0;
 out_del_vq:
@@ -2732,11 +2831,21 @@ static void virtio_mem_deinit_hotplug(struct virtio_mem *vm)
 	}
 }
 
+static void virtio_mem_deinit_kdump(struct virtio_mem *vm)
+{
+#ifdef CONFIG_PROC_VMCORE
+	unregister_vmcore_cb(&vm->vmcore_cb);
+#endif /* CONFIG_PROC_VMCORE */
+}
+
 static void virtio_mem_remove(struct virtio_device *vdev)
 {
 	struct virtio_mem *vm = vdev->priv;
 
-	virtio_mem_deinit_hotplug(vm);
+	if (vm->in_kdump)
+		virtio_mem_deinit_kdump(vm);
+	else
+		virtio_mem_deinit_hotplug(vm);
 
 	/* reset the device and cleanup the queues */
 	vdev->config->reset(vdev);
@@ -2750,6 +2859,9 @@ static void virtio_mem_config_changed(struct virtio_device *vdev)
 {
 	struct virtio_mem *vm = vdev->priv;
 
+	if (unlikely(vm->in_kdump))
+		return;
+
 	atomic_set(&vm->config_changed, 1);
 	virtio_mem_retry(vm);
 }
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
