Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40B11D363
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:13:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D3798716D;
	Thu, 12 Dec 2019 17:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5Udd0_duX2x; Thu, 12 Dec 2019 17:13:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6C01286D9A;
	Thu, 12 Dec 2019 17:13:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54F8CC0881;
	Thu, 12 Dec 2019 17:13:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E443DC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D0E4F86404
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKmPG-O23ses
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 404F7860A2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0M4cPw5UPqfIP6A7Wi24/RJTAYGo9ErvDujysnPmZU=;
 b=ORafC3vWSR/nLxdMxm1IUY7KS3OVD25vLq4K+2EEr9UAq68Xbfq2cOjAn5rZvlNIuaG779
 RqXO9diO6tGa17sme+AERUMkXIFmll7l7/eHC1d9Bhvw3KU74kzX8I9BbltNaUU8bOAOsJ
 t9+U7Vkpvnqhc1a3v5gK5UWjNz3WkAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-kEdgr6KoPPGF7N8xPrxtsw-1; Thu, 12 Dec 2019 12:13:20 -0500
X-MC-Unique: kEdgr6KoPPGF7N8xPrxtsw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82603107ACC4;
 Thu, 12 Dec 2019 17:13:18 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 544CE5C1C3;
 Thu, 12 Dec 2019 17:13:16 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 11/13] mm/vmscan: Move count_vm_event(DROP_SLAB) into
 drop_slab()
Date: Thu, 12 Dec 2019 18:11:35 +0100
Message-Id: <20191212171137.13872-12-david@redhat.com>
In-Reply-To: <20191212171137.13872-1-david@redhat.com>
References: <20191212171137.13872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org
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

Let's count within the function itself, so every invocation (of future
users) will be counted.

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/drop_caches.c | 4 +---
 mm/vmscan.c      | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/drop_caches.c b/fs/drop_caches.c
index d31b6c72b476..a042da782fcd 100644
--- a/fs/drop_caches.c
+++ b/fs/drop_caches.c
@@ -61,10 +61,8 @@ int drop_caches_sysctl_handler(struct ctl_table *table, int write,
 			iterate_supers(drop_pagecache_sb, NULL);
 			count_vm_event(DROP_PAGECACHE);
 		}
-		if (sysctl_drop_caches & 2) {
+		if (sysctl_drop_caches & 2)
 			drop_slab();
-			count_vm_event(DROP_SLAB);
-		}
 		if (!stfu) {
 			pr_info("%s (%d): drop_caches: %d\n",
 				current->comm, task_pid_nr(current),
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 5a6445e86328..c3e53502a84a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -726,6 +726,7 @@ void drop_slab(void)
 
 	for_each_online_node(nid)
 		drop_slab_node(nid);
+	count_vm_event(DROP_SLAB);
 }
 
 static inline int is_page_cache_freeable(struct page *page)
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
