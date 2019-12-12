Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8349C11D354
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:13:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 415848888A;
	Thu, 12 Dec 2019 17:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bFZZsQ8x3crx; Thu, 12 Dec 2019 17:13:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58CC788884;
	Thu, 12 Dec 2019 17:13:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EE03C0881;
	Thu, 12 Dec 2019 17:13:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB128C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D44CA8873F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCTWzdrToyUJ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 14CE288754
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5AU/VyzF87tvu+cshF+3w2ny6cT9bermISGCUG/Yli4=;
 b=Zp6P/wR2bDCE+9a569MgGFULgdUJQBvd5hn7oP21p8qhZSQS7JjfBp8zK8LoDl6iLz6e0D
 W3+Wy1gKoTsZ8mBLRVBtRIUAUgOKww/JqxRgfjWq4CNGw+mMbyEd/d2JgRF0msfJ4n150B
 IK26LHJRos+8Ch4EHfssOdUy3Yveym0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-v7hnQy_5PeGS2XdIH4L5TA-1; Thu, 12 Dec 2019 12:12:57 -0500
X-MC-Unique: v7hnQy_5PeGS2XdIH4L5TA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 229B3800053;
 Thu, 12 Dec 2019 17:12:56 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E93A5C298;
 Thu, 12 Dec 2019 17:12:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 07/13] virtio-mem: Allow to offline partially unplugged
 memory blocks
Date: Thu, 12 Dec 2019 18:11:31 +0100
Message-Id: <20191212171137.13872-8-david@redhat.com>
In-Reply-To: <20191212171137.13872-1-david@redhat.com>
References: <20191212171137.13872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtio-dev@lists.oasis-open.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org, Dave Young <dyoung@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
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

Dropping the reference count of PageOffline() pages allows offlining
code to skip them. However, we also have to convert PG_reserved to
another flag - let's use PG_dirty - so has_unmovable_pages() will
properly handle them. PG_reserved pages get detected as unmovable right
away.

We need the flag to see if we are onlining pages the first time, or if
we allocated them via alloc_contig_range().

Properly take care of offlining code also modifying the stats and
special handling in case the driver gets unloaded.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 64 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 5a142a371222..a12a0f9c076b 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -564,6 +564,53 @@ static void virtio_mem_notify_online(struct virtio_mem *vm, unsigned long mb_id,
 		virtio_mem_retry(vm);
 }
 
+static void virtio_mem_notify_going_offline(struct virtio_mem *vm,
+					    unsigned long mb_id)
+{
+	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
+	unsigned long pfn;
+	int sb_id, i;
+
+	for (sb_id = 0; sb_id < vm->nb_sb_per_mb; sb_id++) {
+		if (virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id, 1))
+			continue;
+		/*
+		 * Drop our reference to the pages so the memory can get
+		 * offlined and add the unplugged pages to the managed
+		 * page counters (so offlining code can correctly subtract
+		 * them again).
+		 */
+		pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
+			       sb_id * vm->subblock_size);
+		adjust_managed_page_count(pfn_to_page(pfn), nr_pages);
+		for (i = 0; i < nr_pages; i++)
+			page_ref_dec(pfn_to_page(pfn + i));
+	}
+}
+
+static void virtio_mem_notify_cancel_offline(struct virtio_mem *vm,
+					     unsigned long mb_id)
+{
+	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
+	unsigned long pfn;
+	int sb_id, i;
+
+	for (sb_id = 0; sb_id < vm->nb_sb_per_mb; sb_id++) {
+		if (virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id, 1))
+			continue;
+		/*
+		 * Get the reference we dropped when going offline and
+		 * subtract the unplugged pages from the managed page
+		 * counters.
+		 */
+		pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
+			       sb_id * vm->subblock_size);
+		adjust_managed_page_count(pfn_to_page(pfn), -nr_pages);
+		for (i = 0; i < nr_pages; i++)
+			page_ref_inc(pfn_to_page(pfn + i));
+	}
+}
+
 /*
  * This callback will either be called synchonously from add_memory() or
  * asynchronously (e.g., triggered via user space). We have to be careful
@@ -611,6 +658,7 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 			break;
 		mutex_lock(&vm->hotplug_mutex);
 		vm->hotplug_active = true;
+		virtio_mem_notify_going_offline(vm, mb_id);
 		break;
 	case MEM_GOING_ONLINE:
 		spin_lock_irq(&vm->removal_lock);
@@ -636,6 +684,12 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 		mutex_unlock(&vm->hotplug_mutex);
 		break;
 	case MEM_CANCEL_OFFLINE:
+		if (!vm->hotplug_active)
+			break;
+		virtio_mem_notify_cancel_offline(vm, mb_id);
+		vm->hotplug_active = false;
+		mutex_unlock(&vm->hotplug_mutex);
+		break;
 	case MEM_CANCEL_ONLINE:
 		if (!vm->hotplug_active)
 			break;
@@ -660,8 +714,11 @@ static void virtio_mem_set_fake_offline(unsigned long pfn,
 		struct page *page = pfn_to_page(pfn);
 
 		__SetPageOffline(page);
-		if (!onlined)
+		if (!onlined) {
 			SetPageDirty(page);
+			/* FIXME: remove after cleanups */
+			ClearPageReserved(page);
+		}
 	}
 }
 
@@ -1719,6 +1776,11 @@ static void virtio_mem_remove(struct virtio_device *vdev)
 		rc = virtio_mem_mb_remove(vm, mb_id);
 		BUG_ON(rc);
 	}
+	/*
+	 * After we unregistered our callbacks, user space can no longer
+	 * offline partially plugged online memory blocks. No need to worry
+	 * about them.
+	 */
 
 	/* unregister callbacks */
 	unregister_virtio_mem_device(vm);
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
