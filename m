Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B752520F71A
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 16:27:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7736922C6B;
	Tue, 30 Jun 2020 14:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tg6by7AkJdtq; Tue, 30 Jun 2020 14:27:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4AB6D22D22;
	Tue, 30 Jun 2020 14:27:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 376FBC088F;
	Tue, 30 Jun 2020 14:27:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9FCAC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9A20188312
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kc7RhCP4ZIpG
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 18D7288193
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593527217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1oWFzZRql4rEsDZi7pymoQzhYazF2IoWIrAEApG3l4=;
 b=iNFc5ZjPtfFXm0ueSl9IqpCp5cexT23l2gkJeMUcjjYCEHs8foEi7PCzwLQlTCHE1WD1fL
 Ez6p/9Z4WSAYv034zXVusYm9P6/3lxbUHKpFBaH3ekSojtR0BmXo4iKWiHQlJdWk5sFh/t
 p/rERyYJl/B1BWVChbQtEsC6whT1CCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-vvvtDriVMKizqzFs3goetA-1; Tue, 30 Jun 2020 10:26:55 -0400
X-MC-Unique: vvvtDriVMKizqzFs3goetA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BDA6107ACCA;
 Tue, 30 Jun 2020 14:26:54 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-56.ams2.redhat.com [10.36.114.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E26C282EF;
 Tue, 30 Jun 2020 14:26:52 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/6] mm/page_isolation: drop WARN_ON_ONCE() in
 set_migratetype_isolate()
Date: Tue, 30 Jun 2020 16:26:36 +0200
Message-Id: <20200630142639.22770-4-david@redhat.com>
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

Inside has_unmovable_pages(), we have a comment describing how unmovable
data could end up in ZONE_MOVABLE - via "movable_core". Also, besides
checking if the first page in the pageblock is reserved, we don't
perform any further checks in case of ZONE_MOVABLE.

In case of memory offlining, we set REPORT_FAILURE, properly
dump_page() the page and handle the error gracefully.
alloc_contig_pages() users currently never allocate from ZONE_MOVABLE.
E.g., hugetlb uses alloc_contig_pages() for the allocation of gigantic
pages only, which will never end up on the MOVABLE zone
(see htlb_alloc_mask()).

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 553b49a34cf71..02a01bff6b219 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -58,16 +58,12 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	spin_unlock_irqrestore(&zone->lock, flags);
 	if (!ret) {
 		drain_all_pages(zone);
-	} else {
-		WARN_ON_ONCE(zone_idx(zone) == ZONE_MOVABLE);
-
-		if ((isol_flags & REPORT_FAILURE) && unmovable)
-			/*
-			 * printk() with zone->lock held will likely trigger a
-			 * lockdep splat, so defer it here.
-			 */
-			dump_page(unmovable, "unmovable page");
-	}
+	} else if ((isol_flags & REPORT_FAILURE) && unmovable)
+		/*
+		 * printk() with zone->lock held will likely trigger a
+		 * lockdep splat, so defer it here.
+		 */
+		dump_page(unmovable, "unmovable page");
 
 	return ret;
 }
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
