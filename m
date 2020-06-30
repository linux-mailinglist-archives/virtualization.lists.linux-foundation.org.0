Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C492320F71E
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 16:27:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 622B4870C8;
	Tue, 30 Jun 2020 14:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXpmc2lG-PZa; Tue, 30 Jun 2020 14:27:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CDBF0870D2;
	Tue, 30 Jun 2020 14:27:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE3EFC016E;
	Tue, 30 Jun 2020 14:27:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48990C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3821D8847C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMvglZGpy2CI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:27:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2077D883DC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593527221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPcgoQSd9zgD8sRNB0iEyYsKFokxdsQN2mBN3e3fHKE=;
 b=gImtzd7slZhfeboYPIwOZPybIY4//h2d+MpJHhmbLk+TfoS81RylZNlK1qRyGh6qjWOXHx
 R0FWhjv77dnEhYLwpuGzQpqHBcz6p5577kiMYWgn+Jp1xNKTmWXMDIQY5UML1+rSLLFZyr
 r0a689la/vm/6jMGNgqyVGeo7clZ6V8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-FNQn-3sHMjaEZBpM4I6OMw-1; Tue, 30 Jun 2020 10:26:58 -0400
X-MC-Unique: FNQn-3sHMjaEZBpM4I6OMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC4C68BF8C2;
 Tue, 30 Jun 2020 14:26:57 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-56.ams2.redhat.com [10.36.114.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F6E019C4F;
 Tue, 30 Jun 2020 14:26:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/6] mm/page_alloc: restrict ZONE_MOVABLE optimization in
 has_unmovable_pages() to memory offlining
Date: Tue, 30 Jun 2020 16:26:38 +0200
Message-Id: <20200630142639.22770-6-david@redhat.com>
In-Reply-To: <20200630142639.22770-1-david@redhat.com>
References: <20200630142639.22770-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Michal Hocko <mhocko@suse.com>, "Michael S . Tsirkin" <mst@redhat.com>,
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

We can already have pages that can be offlined but not allocated in
ZONE_MOVABLE - PageHWPoison pages. While these pages can be skipped when
offlining ("moving them to /dev/null"), we cannot move them when
allocating.

virtio-mem managed memory is similar. The logical memory holes
corresponding to unplug memory ranges can be skipped when offlining,
however, the pages cannot be moved. Currently, virtio-mem special-cases
ZONE_MOVABLE, such that:
- partially plugged memory blocks it added to Linux cannot be onlined to
  ZONE_MOVABLE
- when unplugging memory, it will never consider memory blocks that were
  onlined to ZONE_MOVABLE

We also want to support ZONE_MOVABLE in virtio-mem for both cases. Note
that virtio-mem does not blindly try to unplug random pages within its
managed memory region. It always plugs memory left-to-right and tries to
unplug memory right-to-left - in roughly MAX_ORDER - 1 granularity. In
theory, the movable ZONE part would only shrink when unplugging memory
from ZONE_MOVABLE.

Let's perform the ZONE_MOVABLE optimization only for memory offlining,
such that we reduce the number of false positives from
has_unmovable_pages() in case of alloc_contig_range() on ZONE_MOVABLE.

Note: We currently don't seem to have any user of alloc_contig_range()
that actually uses ZONE_MOVABLE. This change is mostly valuable for the
documentation.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index bd3ebf08f09b9..45077d74d975d 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8237,9 +8237,12 @@ struct page *has_unmovable_pages(struct zone *zone, struct page *page,
 		/*
 		 * If the zone is movable and we have ruled out all reserved
 		 * pages then it should be reasonably safe to assume the rest
-		 * is movable.
+		 * is movable. As we can have some pages in the movable zone
+		 * that are only considered movable for memory offlining (esp.,
+		 * PageHWPoison and PageOffline that will be skipped), we
+		 * perform this optimization only for memory offlining.
 		 */
-		if (zone_idx(zone) == ZONE_MOVABLE)
+		if ((flags & MEMORY_OFFLINE) && zone_idx(zone) == ZONE_MOVABLE)
 			continue;
 
 		/*
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
