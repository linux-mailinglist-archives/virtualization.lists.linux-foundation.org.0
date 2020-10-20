Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C906B28B557
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 14:57:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8B4DC87518;
	Mon, 12 Oct 2020 12:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9XsevOqQMaZ; Mon, 12 Oct 2020 12:57:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DFF3487525;
	Mon, 12 Oct 2020 12:57:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5437C0051;
	Mon, 12 Oct 2020 12:57:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B9CEC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E293A207B0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0WXu4neLNR5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:57:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id DB674207A6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602507465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlLSSBoCkFFWagMZyRYO1orM7xpzBH86dCBKmm6DQts=;
 b=P0Q5Jj6LOsAn3kOCPdEsyEh8vLEDZuq5lbLgaV+kL9CW/UllhYUarZnRoYJJLFqKvPvJJB
 YTbZuLv0phu5QILOu/IvsdFlLZOxCkqJ4f+9uVW0Xy+fhfTNK501sjsG+WybQhRNipTrKG
 Bh//ABY/d3iS2EewNGR9YMYoBPcPe+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-Q6MFmn7kMzeoacM48P8spA-1; Mon, 12 Oct 2020 08:57:42 -0400
X-MC-Unique: Q6MFmn7kMzeoacM48P8spA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71AA464085;
 Mon, 12 Oct 2020 12:57:39 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 140B760C07;
 Mon, 12 Oct 2020 12:57:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 29/29] virtio-mem: Big Block Mode (BBM) - safe memory
 hotunplug
Date: Mon, 12 Oct 2020 14:53:23 +0200
Message-Id: <20201012125323.17509-30-david@redhat.com>
In-Reply-To: <20201012125323.17509-1-david@redhat.com>
References: <20201012125323.17509-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Let's add a safe mechanism to unplug memory, avoiding long/endless loops
when trying to offline memory - similar to in SBM.

Fake-offline all memory (via alloc_contig_range()) before trying to
offline+remove it. Use this mode as default, but allow to enable the other
mode explicitly (which could give better memory hotunplug guarantees in
some environments).

The "unsafe" mode can be enabled e.g., via virtio_mem.bbm_safe_unplug=0
on the cmdline.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 97 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 6bcd0acbff32..09f11489be6f 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -37,6 +37,11 @@ module_param(bbm_block_size, ulong, 0444);
 MODULE_PARM_DESC(bbm_block_size,
 		 "Big Block size in bytes. Default is 0 (auto-detection).");
 
+static bool bbm_safe_unplug = true;
+module_param(bbm_safe_unplug, bool, 0444);
+MODULE_PARM_DESC(bbm_safe_unplug,
+	     "Use a safe unplug mechanism in BBM, avoiding long/endless loops");
+
 /*
  * virtio-mem currently supports the following modes of operation:
  *
@@ -87,6 +92,8 @@ enum virtio_mem_bbm_bb_state {
 	VIRTIO_MEM_BBM_BB_PLUGGED,
 	/* Plugged and added to Linux. */
 	VIRTIO_MEM_BBM_BB_ADDED,
+	/* All online parts are fake-offline, ready to remove. */
+	VIRTIO_MEM_BBM_BB_FAKE_OFFLINE,
 	VIRTIO_MEM_BBM_BB_COUNT
 };
 
@@ -889,6 +896,32 @@ static void virtio_mem_sbm_notify_cancel_offline(struct virtio_mem *vm,
 	}
 }
 
+static void virtio_mem_bbm_notify_going_offline(struct virtio_mem *vm,
+						unsigned long bb_id,
+						unsigned long pfn,
+						unsigned long nr_pages)
+{
+	/*
+	 * When marked as "fake-offline", all online memory of this device block
+	 * is allocated by us. Otherwise, we don't have any memory allocated.
+	 */
+	if (virtio_mem_bbm_get_bb_state(vm, bb_id) !=
+	    VIRTIO_MEM_BBM_BB_FAKE_OFFLINE)
+		return;
+	virtio_mem_fake_offline_going_offline(pfn, nr_pages);
+}
+
+static void virtio_mem_bbm_notify_cancel_offline(struct virtio_mem *vm,
+						 unsigned long bb_id,
+						 unsigned long pfn,
+						 unsigned long nr_pages)
+{
+	if (virtio_mem_bbm_get_bb_state(vm, bb_id) !=
+	    VIRTIO_MEM_BBM_BB_FAKE_OFFLINE)
+		return;
+	virtio_mem_fake_offline_cancel_offline(pfn, nr_pages);
+}
+
 /*
  * This callback will either be called synchronously from add_memory() or
  * asynchronously (e.g., triggered via user space). We have to be careful
@@ -949,6 +982,10 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 		vm->hotplug_active = true;
 		if (vm->in_sbm)
 			virtio_mem_sbm_notify_going_offline(vm, id);
+		else
+			virtio_mem_bbm_notify_going_offline(vm, id,
+							    mhp->start_pfn,
+							    mhp->nr_pages);
 		break;
 	case MEM_GOING_ONLINE:
 		mutex_lock(&vm->hotplug_mutex);
@@ -999,6 +1036,10 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 			break;
 		if (vm->in_sbm)
 			virtio_mem_sbm_notify_cancel_offline(vm, id);
+		else
+			virtio_mem_bbm_notify_cancel_offline(vm, id,
+							     mhp->start_pfn,
+							     mhp->nr_pages);
 		vm->hotplug_active = false;
 		mutex_unlock(&vm->hotplug_mutex);
 		break;
@@ -1189,7 +1230,13 @@ static void virtio_mem_online_page_cb(struct page *page, unsigned int order)
 			do_online = virtio_mem_sbm_test_sb_plugged(vm, id,
 								   sb_id, 1);
 		} else {
-			do_online = true;
+			/*
+			 * If the whole block is marked fake offline, keep
+			 * everything that way.
+			 */
+			id = virtio_mem_phys_to_bb_id(vm, addr);
+			do_online = virtio_mem_bbm_get_bb_state(vm, id) !=
+				    VIRTIO_MEM_BBM_BB_FAKE_OFFLINE;
 		}
 		if (do_online)
 			generic_online_page(page, order);
@@ -1969,15 +2016,50 @@ static int virtio_mem_sbm_unplug_request(struct virtio_mem *vm, uint64_t diff)
 static int virtio_mem_bbm_offline_remove_and_unplug_bb(struct virtio_mem *vm,
 						       unsigned long bb_id)
 {
+	const unsigned long start_pfn = PFN_DOWN(virtio_mem_bb_id_to_phys(vm, bb_id));
+	const unsigned long nr_pages = PFN_DOWN(vm->bbm.bb_size);
+	unsigned long end_pfn = start_pfn + nr_pages;
+	unsigned long pfn;
+	struct page *page;
 	int rc;
 
 	if (WARN_ON_ONCE(virtio_mem_bbm_get_bb_state(vm, bb_id) !=
 			 VIRTIO_MEM_BBM_BB_ADDED))
 		return -EINVAL;
 
+	if (bbm_safe_unplug) {
+		/*
+		 * Start by fake-offlining all memory. Once we marked the device
+		 * block as fake-offline, all newly onlined memory will
+		 * automatically be kept fake-offline. Protect from concurrent
+		 * onlining/offlining until we have a consistent state.
+		 */
+		mutex_lock(&vm->hotplug_mutex);
+		virtio_mem_bbm_set_bb_state(vm, bb_id,
+					    VIRTIO_MEM_BBM_BB_FAKE_OFFLINE);
+
+		for (pfn = start_pfn; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
+			page = pfn_to_online_page(pfn);
+			if (!page)
+				continue;
+
+			rc = virtio_mem_fake_offline(pfn, PAGES_PER_SECTION);
+			if (rc) {
+				end_pfn = pfn;
+				goto rollback_safe_unplug;
+			}
+		}
+		mutex_unlock(&vm->hotplug_mutex);
+	}
+
 	rc = virtio_mem_bbm_offline_and_remove_bb(vm, bb_id);
-	if (rc)
+	if (rc) {
+		if (bbm_safe_unplug) {
+			mutex_lock(&vm->hotplug_mutex);
+			goto rollback_safe_unplug;
+		}
 		return rc;
+	}
 
 	rc = virtio_mem_bbm_unplug_bb(vm, bb_id);
 	if (rc)
@@ -1987,6 +2069,17 @@ static int virtio_mem_bbm_offline_remove_and_unplug_bb(struct virtio_mem *vm,
 		virtio_mem_bbm_set_bb_state(vm, bb_id,
 					    VIRTIO_MEM_BBM_BB_UNUSED);
 	return rc;
+
+rollback_safe_unplug:
+	for (pfn = start_pfn; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
+		page = pfn_to_online_page(pfn);
+		if (!page)
+			continue;
+		virtio_mem_fake_online(pfn, PAGES_PER_SECTION);
+	}
+	virtio_mem_bbm_set_bb_state(vm, bb_id, VIRTIO_MEM_BBM_BB_ADDED);
+	mutex_unlock(&vm->hotplug_mutex);
+	return rc;
 }
 
 /*
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
