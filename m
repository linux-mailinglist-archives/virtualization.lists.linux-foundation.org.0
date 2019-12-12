Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8557611D364
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 18:13:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39A35883E7;
	Thu, 12 Dec 2019 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sX6jh-zXpWdL; Thu, 12 Dec 2019 17:13:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8792865C4;
	Thu, 12 Dec 2019 17:13:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F7C1C0881;
	Thu, 12 Dec 2019 17:13:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82CD4C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7B32924F76
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnm5RB3XZMKy
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id AC4C424A5A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576170810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2upD/YUhaw2ZDUGySKrouuwI8eCyNFFa47e7Zu9VlYw=;
 b=LUaY5Gnuq2gnLK91kJ21eKMjxMK7jhFgHVgvspxLuDMWZRYTMC986MUbH49o9LpSkdfT2A
 yHiaHMUi195L0eAJ+ZZwQdf/uJirdBMtlnnndq6OpUZHwsVJbanB9XncWmy6dv+bOHf7KD
 Y8gH1Ph1Clur/Am0ETCiit9ZQmz9aXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-nNkgjHYrMa--T3YPAku24w-1; Thu, 12 Dec 2019 12:13:27 -0500
X-MC-Unique: nNkgjHYrMa--T3YPAku24w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73FEB107ACC5;
 Thu, 12 Dec 2019 17:13:25 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D360E5C1C3;
 Thu, 12 Dec 2019 17:13:18 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 12/13] mm/vmscan: Export drop_slab() and
 drop_slab_node()
Date: Thu, 12 Dec 2019 18:11:36 +0100
Message-Id: <20191212171137.13872-13-david@redhat.com>
In-Reply-To: <20191212171137.13872-1-david@redhat.com>
References: <20191212171137.13872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
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

We already have a way to trigger reclaiming of all reclaimable slab objects
from user space (echo 2 > /proc/sys/vm/drop_caches). Let's allow drivers
to also trigger this when they really want to make progress and know what
they are doing.

virtio-mem wants to use these functions when it failed to unplug memory
for quite some time (e.g., after 30 minutes). It will then try to
free up reclaimable objects by dropping the slab caches every now and
then (e.g., every 30 minutes) as long as necessary. There will be a way to
disable this feature and info messages will be logged.

In the future, we want to have a drop_slab_range() functionality
instead. Memory offlining code has similar demands and also other
alloc_contig_range() users (e.g., gigantic pages) could make good use of
this feature. Adding it, however, requires more work/thought.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 4 ++--
 mm/vmscan.c        | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 64799c5cb39f..483300f58be8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2706,8 +2706,8 @@ int drop_caches_sysctl_handler(struct ctl_table *, int,
 					void __user *, size_t *, loff_t *);
 #endif
 
-void drop_slab(void);
-void drop_slab_node(int nid);
+extern void drop_slab(void);
+extern void drop_slab_node(int nid);
 
 #ifndef CONFIG_MMU
 #define randomize_va_space 0
diff --git a/mm/vmscan.c b/mm/vmscan.c
index c3e53502a84a..4e1cdaaec5e6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -719,6 +719,7 @@ void drop_slab_node(int nid)
 		} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
 	} while (freed > 10);
 }
+EXPORT_SYMBOL(drop_slab_node);
 
 void drop_slab(void)
 {
@@ -728,6 +729,7 @@ void drop_slab(void)
 		drop_slab_node(nid);
 	count_vm_event(DROP_SLAB);
 }
+EXPORT_SYMBOL(drop_slab);
 
 static inline int is_page_cache_freeable(struct page *page)
 {
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
