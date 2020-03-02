Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D8175C32
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 14:51:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67AC2861B3;
	Mon,  2 Mar 2020 13:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBEwfkkkFrLp; Mon,  2 Mar 2020 13:51:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AAC6086038;
	Mon,  2 Mar 2020 13:51:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 922B4C013E;
	Mon,  2 Mar 2020 13:51:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAE84C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 13:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C64D720489
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 13:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDAQ1ApMNwyg
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 13:51:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id D2C7B20425
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583157110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FiCQRZVKNip0tJQTjyPcrPcjQQToViBOoP7sm23P5rA=;
 b=XXY53XT9CG50jWhT1muC9EGFgcSSWKNi5I21qYWx0+k/f0TPTDVAa8SeDoxpD9ojecZLOB
 MAlU51EtFkgrbbM7Je/cat/B2beih8hVOibX2wvNXLReJPfmzDCkl6y+AEgW5OxmUxuZMA
 NgVbglthO/i4f9eIvHQDBYWo3yyBEFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-kOprc3jJMlih9pd5-Echgw-1; Mon, 02 Mar 2020 08:51:48 -0500
X-MC-Unique: kOprc3jJMlih9pd5-Echgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C8D713F7;
 Mon,  2 Mar 2020 13:51:46 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-114.ams2.redhat.com [10.36.116.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A09227183;
 Mon,  2 Mar 2020 13:51:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/11] mm: Export alloc_contig_range() / free_contig_range()
Date: Mon,  2 Mar 2020 14:49:34 +0100
Message-Id: <20200302134941.315212-5-david@redhat.com>
In-Reply-To: <20200302134941.315212-1-david@redhat.com>
References: <20200302134941.315212-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index 79e950d76ffc..8d7be3f33e26 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8597,6 +8597,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 				pfn_max_align_up(end), migratetype);
 	return ret;
 }
+EXPORT_SYMBOL(alloc_contig_range);
 
 static int __alloc_contig_pages(unsigned long start_pfn,
 				unsigned long nr_pages, gfp_t gfp_mask)
@@ -8712,6 +8713,7 @@ void free_contig_range(unsigned long pfn, unsigned int nr_pages)
 	}
 	WARN(count != 0, "%d pages are still in use!\n", count);
 }
+EXPORT_SYMBOL(free_contig_range);
 
 /*
  * The zone indicated has a new number of managed_pages; batch sizes and percpu
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
