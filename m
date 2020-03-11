Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA3181F04
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 18:16:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BAF6289377;
	Wed, 11 Mar 2020 17:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oH-c2nzVM4G5; Wed, 11 Mar 2020 17:16:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 298CD88C05;
	Wed, 11 Mar 2020 17:16:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AC24C0177;
	Wed, 11 Mar 2020 17:16:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3584C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 92E0289377
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2RvrFZodsR5M
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D3D0C88C05
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583946985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9YlCAxZTLeLO624BWfRaiPaRVXS4Jlz4OonzSFN6/Y=;
 b=McMmTybSJ1vCrmZfwO2N0lxXniCJ6wTYgPY5NWDHLxWOQbmYP8XY6WTXh9URggoqKVK4R7
 QfeM5+RpTEJ1hC5xV0TP0qc9k3PAVm350SwjNthB6m5xLu5+a1Iuksgc8BHKqeIYRlxwFw
 /JZRwLkdZ4s4XGrPHJASKCh7i1yl9SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-cSO6Lp6oPDiaSdR8FyW8Rw-1; Wed, 11 Mar 2020 13:16:21 -0400
X-MC-Unique: cSO6Lp6oPDiaSdR8FyW8Rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0C6D107ACCA;
 Wed, 11 Mar 2020 17:16:19 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-132.ams2.redhat.com [10.36.116.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26F5D60BEE;
 Wed, 11 Mar 2020 17:16:16 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] mm/memory_hotplug: Introduce
 offline_and_remove_memory()
Date: Wed, 11 Mar 2020 18:14:19 +0100
Message-Id: <20200311171422.10484-8-david@redhat.com>
In-Reply-To: <20200311171422.10484-1-david@redhat.com>
References: <20200311171422.10484-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Oscar Salvador <osalvador@suse.com>, virtio-dev@lists.oasis-open.org,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Wei Yang <richard.weiyang@gmail.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org,
 Dan Williams <dan.j.williams@intel.com>
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

virtio-mem wants to offline and remove a memory block once it unplugged
all subblocks (e.g., using alloc_contig_range()). Let's provide
an interface to do that from a driver. virtio-mem already supports to
offline partially unplugged memory blocks. Offlining a fully unplugged
memory block will not require to migrate any pages. All unplugged
subblocks are PageOffline() and have a reference count of 0 - so
offlining code will simply skip them.

All we need is an interface to offline and remove the memory from kernel
module context, where we don't have access to the memory block devices
(esp. find_memory_block() and device_offline()) and the device hotplug
lock.

To keep things simple, allow to only work on a single memory block.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Qian Cai <cai@lca.pw>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memory_hotplug.h |  1 +
 mm/memory_hotplug.c            | 37 ++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index f4d59155f3d4..a98aa16dbfa1 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -311,6 +311,7 @@ extern void try_offline_node(int nid);
 extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages);
 extern int remove_memory(int nid, u64 start, u64 size);
 extern void __remove_memory(int nid, u64 start, u64 size);
+extern int offline_and_remove_memory(int nid, u64 start, u64 size);
 
 #else
 static inline bool is_mem_section_removable(unsigned long pfn,
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index ab1c31e67fd1..d0d337918a15 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1818,4 +1818,41 @@ int remove_memory(int nid, u64 start, u64 size)
 	return rc;
 }
 EXPORT_SYMBOL_GPL(remove_memory);
+
+/*
+ * Try to offline and remove a memory block. Might take a long time to
+ * finish in case memory is still in use. Primarily useful for memory devices
+ * that logically unplugged all memory (so it's no longer in use) and want to
+ * offline + remove the memory block.
+ */
+int offline_and_remove_memory(int nid, u64 start, u64 size)
+{
+	struct memory_block *mem;
+	int rc = -EINVAL;
+
+	if (!IS_ALIGNED(start, memory_block_size_bytes()) ||
+	    size != memory_block_size_bytes())
+		return rc;
+
+	lock_device_hotplug();
+	mem = find_memory_block(__pfn_to_section(PFN_DOWN(start)));
+	if (mem)
+		rc = device_offline(&mem->dev);
+	/* Ignore if the device is already offline. */
+	if (rc > 0)
+		rc = 0;
+
+	/*
+	 * In case we succeeded to offline the memory block, remove it.
+	 * This cannot fail as it cannot get onlined in the meantime.
+	 */
+	if (!rc) {
+		rc = try_remove_memory(nid, start, size);
+		WARN_ON_ONCE(rc);
+	}
+	unlock_device_hotplug();
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(offline_and_remove_memory);
 #endif /* CONFIG_MEMORY_HOTREMOVE */
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
