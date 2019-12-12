Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F511D34D
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:12:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03BA78715D;
	Thu, 12 Dec 2019 17:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MB-2PdB7WHg2; Thu, 12 Dec 2019 17:12:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E2218715C;
	Thu, 12 Dec 2019 17:12:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62557C0881;
	Thu, 12 Dec 2019 17:12:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42B64C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3E6218715C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id apHwXOX4oouR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6C16D87154
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cioP1Au5xwfJCBdcc5XOpwCVArGo5wEcHN4WYiyUNDA=;
 b=A/xMs0OeYvn3A/CIJdsRru/ijEZeM5kPXJBzpdFZ7QdR6AgAphwH1kDQ7PUGMQYk2VfbTH
 4MDkiCpRjnMOKzSHuHOZJsOO+7QhDHMNA8m6vZD6LkQoOpUla0od4HgsKX6e5MBbkwAtgf
 GyyHyOrXMlCpPhI9d6P0GAMZ8WWSK1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-Cq7CVDBDPvKYM77AioR_vg-1; Thu, 12 Dec 2019 12:12:30 -0500
X-MC-Unique: Cq7CVDBDPvKYM77AioR_vg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27E901005502;
 Thu, 12 Dec 2019 17:12:28 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D4E25C1C3;
 Thu, 12 Dec 2019 17:12:19 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 04/13] mm: Export alloc_contig_range() /
 free_contig_range()
Date: Thu, 12 Dec 2019 18:11:28 +0100
Message-Id: <20191212171137.13872-5-david@redhat.com>
In-Reply-To: <20191212171137.13872-1-david@redhat.com>
References: <20191212171137.13872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtio-dev@lists.oasis-open.org, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org,
 Mel Gorman <mgorman@techsingularity.net>,
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

A virtio-mem device wants to allocate memory from the memory region it
manages in order to unplug it in the hypervisor - similar to
a balloon driver. Also, it might want to plug previously unplugged
(allocated) memory and give it back to Linux. alloc_contig_range() /
free_contig_range() seem to be the perfect interface for this task.

In contrast to existing balloon devices, a virtio-mem device operates
on bigger chunks (e.g., 4MB) and only on physical memory it manages. It
tracks which chunks (subblocks) are still plugged, so it can go ahead
and try to alloc_contig_range()+unplug them on unplug request, or
plug+free_contig_range() unplugged chunks on plug requests.

A virtio-mem device will use alloc_contig_range() / free_contig_range()
only on ranges that belong to the same node/zone in at least
MAX(MAX_ORDER - 1, pageblock_order) order granularity - e.g., 4MB on
x86-64. The virtio-mem device added that memory, so the memory
exists and does not contain any holes. virtio-mem will only try to allocate
on ZONE_NORMAL, never on ZONE_MOVABLE, just like when allocating
gigantic pages (we don't put unmovable data into the movable zone).

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Pavel Tatashin <pavel.tatashin@microsoft.com>
Cc: Alexander Potapenko <glider@google.com>
Acked-by: Michal Hocko <mhocko@suse.com> # to export contig range allocator API
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 62dcd6b76c80..5334decc9e06 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8494,6 +8494,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 				pfn_max_align_up(end), migratetype);
 	return ret;
 }
+EXPORT_SYMBOL(alloc_contig_range);
 
 static int __alloc_contig_pages(unsigned long start_pfn,
 				unsigned long nr_pages, gfp_t gfp_mask)
@@ -8609,6 +8610,7 @@ void free_contig_range(unsigned long pfn, unsigned int nr_pages)
 	}
 	WARN(count != 0, "%d pages are still in use!\n", count);
 }
+EXPORT_SYMBOL(free_contig_range);
 
 /*
  * The zone indicated has a new number of managed_pages; batch sizes and percpu
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
