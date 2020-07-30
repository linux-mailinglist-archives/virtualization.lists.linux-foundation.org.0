Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F303232F84
	for <lists.virtualization@lfdr.de>; Thu, 30 Jul 2020 11:34:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A9C4E87DA6;
	Thu, 30 Jul 2020 09:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BC7O4px2NpP; Thu, 30 Jul 2020 09:34:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 326D687D92;
	Thu, 30 Jul 2020 09:34:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B666C004D;
	Thu, 30 Jul 2020 09:34:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D88AC004D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2CD1587D65
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7j7cDjuGpP1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4F61F87B4F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596101683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyDrSr/R3IYIedmMJp2EbzPQ1RIZu9oQIJgsVrWfxkI=;
 b=Ozlcc2r+/Rpb1LG8ZQEISXtF0JT6KZnslzKziUm2hIRu1Vkq6yiDWhBNdCHqjshjax133N
 7H/onwd3mH1ZG8ZCdNv9FNAcZnhki/YWqkOIDkHZgouue/salNv+URKwNWhPyu1+5q2AzI
 hU6jmB45SpFrvVCVWU3HHOzr8ZaSzhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-lDLuFZxMNhyGsrVpnuPohw-1; Thu, 30 Jul 2020 05:34:41 -0400
X-MC-Unique: lDLuFZxMNhyGsrVpnuPohw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93EC981F3DF;
 Thu, 30 Jul 2020 09:34:22 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63E875FC31;
 Thu, 30 Jul 2020 09:34:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] mm/page_isolation: don't dump_page(NULL) in
 set_migratetype_isolate()
Date: Thu, 30 Jul 2020 11:34:11 +0200
Message-Id: <20200730093416.36210-2-david@redhat.com>
In-Reply-To: <20200730093416.36210-1-david@redhat.com>
References: <20200730093416.36210-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
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

Right now, if we have two isolations racing, we might trigger the
WARN_ON_ONCE() and to dump_page(NULL), dereferencing NULL. Let's just
return directly.

In the future, we might want to report -EAGAIN to the caller instead, as
this could indicate a temporary isolation failure only.

Reviewed-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
Fixes: 4a55c0474a92 ("mm/hotplug: silence a lockdep splat with printk()")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Qian Cai <cai@lca.pw>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index f6d07c5f0d34d..7d7d263ce7f4b 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -29,10 +29,12 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	/*
 	 * We assume the caller intended to SET migrate type to isolate.
 	 * If it is already set, then someone else must have raced and
-	 * set it before us.  Return -EBUSY
+	 * set it before us.
 	 */
-	if (is_migrate_isolate_page(page))
-		goto out;
+	if (is_migrate_isolate_page(page)) {
+		spin_unlock_irqrestore(&zone->lock, flags);
+		return -EBUSY;
+	}
 
 	/*
 	 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
@@ -52,7 +54,6 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 		ret = 0;
 	}
 
-out:
 	spin_unlock_irqrestore(&zone->lock, flags);
 	if (!ret) {
 		drain_all_pages(zone);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
