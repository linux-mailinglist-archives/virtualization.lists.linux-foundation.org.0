Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D728A24D279
	for <lists.virtualization@lfdr.de>; Fri, 21 Aug 2020 12:34:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 630D286CC5;
	Fri, 21 Aug 2020 10:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAte4MQNg29v; Fri, 21 Aug 2020 10:34:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6FE9486D08;
	Fri, 21 Aug 2020 10:34:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58EFFC0051;
	Fri, 21 Aug 2020 10:34:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44791C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 10:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 33AAE884C4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 10:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJca3PPGNv24
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 10:34:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0B65187898
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598006093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJmXFP26TlaoILesjgfmIBQIbNPk9EKlqFijZvcbNh0=;
 b=Ly6ZFeFAHlQTp3z74DK+koRzK//15LkkZv1vB7y3QJRRrDD9WQ9fxMdeo6UAc98gnlZ319
 CZWdavdUjxrnV+zmeX3mC4XNHckaAhyLcGb4OdfLEh3LhFq0tL/C2Xlla0dCgwgmIk0glz
 hpm5YEHCNWRwEXVdRrBqdlGRVNfAm94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-6z0QkybENJy6Io-WetcOng-1; Fri, 21 Aug 2020 06:34:49 -0400
X-MC-Unique: 6z0QkybENJy6Io-WetcOng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6DAF640CA;
 Fri, 21 Aug 2020 10:34:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDF5460BF1;
 Fri, 21 Aug 2020 10:34:44 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] kernel/resource: make release_mem_region_adjustable()
 never fail
Date: Fri, 21 Aug 2020 12:34:27 +0200
Message-Id: <20200821103431.13481-2-david@redhat.com>
In-Reply-To: <20200821103431.13481-1-david@redhat.com>
References: <20200821103431.13481-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Kees Cook <keescook@chromium.org>,
 Baoquan He <bhe@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Yang <richardw.yang@linux.intel.com>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
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

Let's make sure splitting a resource on memory hotunplug will never fail.
This will become more relevant once we merge selected system ram
resources - then, we'll trigger that case more frequently on memory
hotunplug.

In general, this function is already unlikely to fail. When we remove
memory, we free up quite a lot of metadata (memmap, page tables, memory
block device, etc.). The only way it could really fail currently is when
injecting allocation errors.

All other error cases inside release_mem_region_adjustable() seem to be
sanity checks if the function would be abused in different context -
let's add WARN_ON_ONCE().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/ioport.h |  4 ++--
 kernel/resource.c      | 49 ++++++++++++++++++++++++------------------
 mm/memory_hotplug.c    | 22 +------------------
 3 files changed, 31 insertions(+), 44 deletions(-)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 6c2b06fe8beb7..52a91f5fa1a36 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -248,8 +248,8 @@ extern struct resource * __request_region(struct resource *,
 extern void __release_region(struct resource *, resource_size_t,
 				resource_size_t);
 #ifdef CONFIG_MEMORY_HOTREMOVE
-extern int release_mem_region_adjustable(struct resource *, resource_size_t,
-				resource_size_t);
+extern void release_mem_region_adjustable(struct resource *, resource_size_t,
+					  resource_size_t);
 #endif
 
 /* Wrappers for managed devices */
diff --git a/kernel/resource.c b/kernel/resource.c
index 841737bbda9e5..1dcef5d53d76e 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1255,21 +1255,28 @@ EXPORT_SYMBOL(__release_region);
  *   assumes that all children remain in the lower address entry for
  *   simplicity.  Enhance this logic when necessary.
  */
-int release_mem_region_adjustable(struct resource *parent,
-				  resource_size_t start, resource_size_t size)
+void release_mem_region_adjustable(struct resource *parent,
+				   resource_size_t start, resource_size_t size)
 {
+	struct resource *new_res = NULL;
+	bool alloc_nofail = false;
 	struct resource **p;
 	struct resource *res;
-	struct resource *new_res;
 	resource_size_t end;
-	int ret = -EINVAL;
 
 	end = start + size - 1;
-	if ((start < parent->start) || (end > parent->end))
-		return ret;
+	if (WARN_ON_ONCE((start < parent->start) || (end > parent->end)))
+		return;
 
-	/* The alloc_resource() result gets checked later */
-	new_res = alloc_resource(GFP_KERNEL);
+	/*
+	 * We free up quite a lot of memory on memory hotunplug (esp., memap),
+	 * just before releasing the region. This is highly unlikely to
+	 * fail - let's play save and make it never fail as the caller cannot
+	 * perform any error handling (e.g., trying to re-add memory will fail
+	 * similarly).
+	 */
+retry:
+	new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
 
 	p = &parent->child;
 	write_lock(&resource_lock);
@@ -1295,7 +1302,6 @@ int release_mem_region_adjustable(struct resource *parent,
 		 * so if we are dealing with them, let us just back off here.
 		 */
 		if (!(res->flags & IORESOURCE_SYSRAM)) {
-			ret = 0;
 			break;
 		}
 
@@ -1312,20 +1318,23 @@ int release_mem_region_adjustable(struct resource *parent,
 			/* free the whole entry */
 			*p = res->sibling;
 			free_resource(res);
-			ret = 0;
 		} else if (res->start == start && res->end != end) {
 			/* adjust the start */
-			ret = __adjust_resource(res, end + 1,
-						res->end - end);
+			WARN_ON_ONCE(__adjust_resource(res, end + 1,
+						       res->end - end));
 		} else if (res->start != start && res->end == end) {
 			/* adjust the end */
-			ret = __adjust_resource(res, res->start,
-						start - res->start);
+			WARN_ON_ONCE(__adjust_resource(res, res->start,
+						       start - res->start));
 		} else {
-			/* split into two entries */
+			/* split into two entries - we need a new resource */
 			if (!new_res) {
-				ret = -ENOMEM;
-				break;
+				new_res = alloc_resource(GFP_ATOMIC);
+				if (!new_res) {
+					alloc_nofail = true;
+					write_unlock(&resource_lock);
+					goto retry;
+				}
 			}
 			new_res->name = res->name;
 			new_res->start = end + 1;
@@ -1336,9 +1345,8 @@ int release_mem_region_adjustable(struct resource *parent,
 			new_res->sibling = res->sibling;
 			new_res->child = NULL;
 
-			ret = __adjust_resource(res, res->start,
-						start - res->start);
-			if (ret)
+			if (WARN_ON_ONCE(__adjust_resource(res, res->start,
+							   start - res->start)))
 				break;
 			res->sibling = new_res;
 			new_res = NULL;
@@ -1349,7 +1357,6 @@ int release_mem_region_adjustable(struct resource *parent,
 
 	write_unlock(&resource_lock);
 	free_resource(new_res);
-	return ret;
 }
 #endif	/* CONFIG_MEMORY_HOTREMOVE */
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 35d56cbd3e45b..f77fd1810e9f5 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1700,26 +1700,6 @@ void try_offline_node(int nid)
 }
 EXPORT_SYMBOL(try_offline_node);
 
-static void __release_memory_resource(resource_size_t start,
-				      resource_size_t size)
-{
-	int ret;
-
-	/*
-	 * When removing memory in the same granularity as it was added,
-	 * this function never fails. It might only fail if resources
-	 * have to be adjusted or split. We'll ignore the error, as
-	 * removing of memory cannot fail.
-	 */
-	ret = release_mem_region_adjustable(&iomem_resource, start, size);
-	if (ret) {
-		resource_size_t endres = start + size - 1;
-
-		pr_warn("Unable to release resource <%pa-%pa> (%d)\n",
-			&start, &endres, ret);
-	}
-}
-
 static int __ref try_remove_memory(int nid, u64 start, u64 size)
 {
 	int rc = 0;
@@ -1753,7 +1733,7 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
 		memblock_remove(start, size);
 	}
 
-	__release_memory_resource(start, size);
+	release_mem_region_adjustable(&iomem_resource, start, size);
 
 	try_offline_node(nid);
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
