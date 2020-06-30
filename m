Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB720F71C
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 16:27:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A1CD087E2B;
	Tue, 30 Jun 2020 14:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmHUKYVhfDUT; Tue, 30 Jun 2020 14:27:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B68787E3C;
	Tue, 30 Jun 2020 14:27:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C2D0C016E;
	Tue, 30 Jun 2020 14:27:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C081C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EFF1B88193
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ureyU+yZyF8v
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7198088251
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593527217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DD/rc1Xq/7AFf3CzfRhrLC3+mqCELzrH74lJa/R5O94=;
 b=bHW2j8xh3DMIPW1ONnwpSfaFgLJ10JqIFE23SuqIoBzET8w1f+ksOEvRFN4Q3CfPx/J3aw
 S4mlJsAgkLX8ZYzSjFXAiNR6DeWNSKlKdwMyAvAytpjadaTbfXCI7Gej0Zdv3Zrfi1u6sf
 WaW9VnzWF162URrxJvjD1fYXOc8WgoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-I3xTV2D-Pi2Lsh1s8osUNg-1; Tue, 30 Jun 2020 10:26:53 -0400
X-MC-Unique: I3xTV2D-Pi2Lsh1s8osUNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EB841005513;
 Tue, 30 Jun 2020 14:26:52 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-56.ams2.redhat.com [10.36.114.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94C1119C4F;
 Tue, 30 Jun 2020 14:26:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/6] mm/page_isolation: don't dump_page(NULL) in
 set_migratetype_isolate()
Date: Tue, 30 Jun 2020 16:26:35 +0200
Message-Id: <20200630142639.22770-3-david@redhat.com>
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

Right now, if we have two isolations racing, we might trigger the
WARN_ON_ONCE() and to dump_page(NULL), dereferencing NULL. Let's just
return directly.

In the future, we might want to report -EAGAIN to the caller instead, as
this could indicate a temporary isolation failure only.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index f6d07c5f0d34d..553b49a34cf71 100644
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
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
