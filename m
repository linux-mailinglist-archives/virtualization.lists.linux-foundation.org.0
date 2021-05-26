Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B173913CC
	for <lists.virtualization@lfdr.de>; Wed, 26 May 2021 11:32:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B10940540;
	Wed, 26 May 2021 09:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dehRRn9uaYMt; Wed, 26 May 2021 09:32:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD784059C;
	Wed, 26 May 2021 09:32:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4528C0001;
	Wed, 26 May 2021 09:32:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4247CC0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23E0140208
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_bLXJ4fiRhv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:32:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5374D401B9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 May 2021 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622021528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpQl70FCJrKzkRws/ycp8B14QnuETKoEKh3YFLooSpk=;
 b=gqiObnwYZBPS9mVSMmPBvXlbdA/lVJynS9Kl15KUOiCLT9XWSndR7bDmW9krIqLejnBxjL
 hDErOrWJrRSo0Nb/74Iimiox0jl8LP6C0fCtPQossoFesT7O1zVjHbOV4MZjmxIFyauL4Q
 oycehSI7QW88FB6R4T+F92hRnSqe7So=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-bVRoSnEGNimMg5ofHHzOIg-1; Wed, 26 May 2021 05:31:26 -0400
X-MC-Unique: bVRoSnEGNimMg5ofHHzOIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C4F0106BB2B;
 Wed, 26 May 2021 09:31:23 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-99.ams2.redhat.com [10.36.113.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 668435D9CC;
 Wed, 26 May 2021 09:31:17 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] fs/proc/kcore: don't read offline sections,
 logically offline pages and hwpoisoned pages
Date: Wed, 26 May 2021 11:30:38 +0200
Message-Id: <20210526093041.8800-4-david@redhat.com>
In-Reply-To: <20210526093041.8800-1-david@redhat.com>
References: <20210526093041.8800-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Aili Yao <yaoaili@kingsoft.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Liu <wei.liu@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Steven Price <steven.price@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Jiri Bohac <jbohac@suse.cz>, Haiyang Zhang <haiyangz@microsoft.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@linux.ibm.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
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

Let's avoid reading:

1) Offline memory sections: the content of offline memory sections is stale
   as the memory is effectively unused by the kernel. On s390x with standby
   memory, offline memory sections (belonging to offline storage
   increments) are not accessible. With virtio-mem and the hyper-v balloon,
   we can have unavailable memory chunks that should not be accessed inside
   offline memory sections. Last but not least, offline memory sections
   might contain hwpoisoned pages which we can no longer identify
   because the memmap is stale.

2) PG_offline pages: logically offline pages that are documented as
   "The content of these pages is effectively stale. Such pages should not
    be touched (read/write/dump/save) except by their owner.".
   Examples include pages inflated in a balloon or unavailble memory
   ranges inside hotplugged memory sections with virtio-mem or the hyper-v
   balloon.

3) PG_hwpoison pages: Reading pages marked as hwpoisoned can be fatal.
   As documented: "Accessing is not safe since it may cause another machine
   check. Don't touch!"

Introduce is_page_hwpoison(), adding a comment that it is inherently
racy but best we can really do.

Reading /proc/kcore now performs similar checks as when reading
/proc/vmcore for kdump via makedumpfile: problematic pages are exclude.
It's also similar to hibernation code, however, we don't skip hwpoisoned
pages when processing pages in kernel/power/snapshot.c:saveable_page() yet.

Note 1: we can race against memory offlining code, especially
memory going offline and getting unplugged: however, we will properly tear
down the identity mapping and handle faults gracefully when accessing
this memory from kcore code.

Note 2: we can race against drivers setting PageOffline() and turning
memory inaccessible in the hypervisor. We'll handle this in a follow-up
patch.

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/proc/kcore.c            | 14 +++++++++++++-
 include/linux/page-flags.h | 12 ++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index ed6fbb3bd50c..92ff1e4436cb 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -465,6 +465,9 @@ read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
 
 	m = NULL;
 	while (buflen) {
+		struct page *page;
+		unsigned long pfn;
+
 		/*
 		 * If this is the first iteration or the address is not within
 		 * the previous entry, search for a matching entry.
@@ -503,7 +506,16 @@ read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
 			}
 			break;
 		case KCORE_RAM:
-			if (!pfn_is_ram(__pa(start) >> PAGE_SHIFT)) {
+			pfn = __pa(start) >> PAGE_SHIFT;
+			page = pfn_to_online_page(pfn);
+
+			/*
+			 * Don't read offline sections, logically offline pages
+			 * (e.g., inflated in a balloon), hwpoisoned pages,
+			 * and explicitly excluded physical ranges.
+			 */
+			if (!page || PageOffline(page) ||
+			    is_page_hwpoison(page) || !pfn_is_ram(pfn)) {
 				if (clear_user(buffer, tsz)) {
 					ret = -EFAULT;
 					goto out;
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 04a34c08e0a6..daed82744f4b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -694,6 +694,18 @@ PAGEFLAG_FALSE(DoubleMap)
 	TESTSCFLAG_FALSE(DoubleMap)
 #endif
 
+/*
+ * Check if a page is currently marked HWPoisoned. Note that this check is
+ * best effort only and inherently racy: there is no way to synchronize with
+ * failing hardware.
+ */
+static inline bool is_page_hwpoison(struct page *page)
+{
+	if (PageHWPoison(page))
+		return true;
+	return PageHuge(page) && PageHWPoison(compound_head(page));
+}
+
 /*
  * For pages that are never mapped to userspace (and aren't PageSlab),
  * page_type may be used.  Because it is initialised to -1, we invert the
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
