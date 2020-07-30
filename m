Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 95641232F8A
	for <lists.virtualization@lfdr.de>; Thu, 30 Jul 2020 11:34:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3D97E241AE;
	Thu, 30 Jul 2020 09:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5YEju-pVFLO; Thu, 30 Jul 2020 09:34:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B6FC2227D1;
	Thu, 30 Jul 2020 09:34:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DF83C004D;
	Thu, 30 Jul 2020 09:34:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 198FDC004D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 10CD087D63
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8dteRnZHueu
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 236A387D65
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596101686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNmXR+u9IzTxR95YCO3PnwRTTSVw3K+hGsEdO4nA3OU=;
 b=Si+6Y+GgghcFWPap5qTL0QH6QiosfOhQvqZ0LIIuAtAdk+iHukvkMgi48oh7dCbgvMZQok
 DZESJqQm4EhDT+6nh5etVT+MV9gsKYu36NJb2m8K3JdaYD71k0aTDDXIGsCt1G5LS5WQpd
 RiDIz4jPsawc6PyBWpgpHoWneai6e0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-5eV1rBhrMvu-wfNEUcfJTQ-1; Thu, 30 Jul 2020 05:34:44 -0400
X-MC-Unique: 5eV1rBhrMvu-wfNEUcfJTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 779781015179;
 Thu, 30 Jul 2020 09:34:29 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82BCE69324;
 Thu, 30 Jul 2020 09:34:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] mm/page_isolation: cleanup set_migratetype_isolate()
Date: Thu, 30 Jul 2020 11:34:14 +0200
Message-Id: <20200730093416.36210-5-david@redhat.com>
In-Reply-To: <20200730093416.36210-1-david@redhat.com>
References: <20200730093416.36210-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
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

Let's clean it up a bit, simplifying error handling and getting rid of
the label.

Reviewed-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index d099aac479601..e65fe5d770849 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -17,12 +17,9 @@
 
 static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags)
 {
-	struct page *unmovable = NULL;
-	struct zone *zone;
+	struct zone *zone = page_zone(page);
+	struct page *unmovable;
 	unsigned long flags;
-	int ret = -EBUSY;
-
-	zone = page_zone(page);
 
 	spin_lock_irqsave(&zone->lock, flags);
 
@@ -51,13 +48,13 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 									NULL);
 
 		__mod_zone_freepage_state(zone, -nr_pages, mt);
-		ret = 0;
+		spin_unlock_irqrestore(&zone->lock, flags);
+		drain_all_pages(zone);
+		return 0;
 	}
 
 	spin_unlock_irqrestore(&zone->lock, flags);
-	if (!ret) {
-		drain_all_pages(zone);
-	} else if ((isol_flags & REPORT_FAILURE) && unmovable) {
+	if (isol_flags & REPORT_FAILURE) {
 		/*
 		 * printk() with zone->lock held will likely trigger a
 		 * lockdep splat, so defer it here.
@@ -65,7 +62,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 		dump_page(unmovable, "unmovable page");
 	}
 
-	return ret;
+	return -EBUSY;
 }
 
 static void unset_migratetype_isolate(struct page *page, unsigned migratetype)
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
