Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 392CC3ED8E9
	for <lists.virtualization@lfdr.de>; Mon, 16 Aug 2021 16:25:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A33A605F5;
	Mon, 16 Aug 2021 14:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETbvFVo3DZiB; Mon, 16 Aug 2021 14:25:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 54BDF60705;
	Mon, 16 Aug 2021 14:25:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4DDCC000E;
	Mon, 16 Aug 2021 14:25:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E73BC000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 14:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EB7680E8B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 14:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0QOEgeOauVa
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 14:25:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99F1D80EAE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629123946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QfJ17b00++bWuSHxnMjiXEwJtyWC6f0LPnUvtr2zO94=;
 b=QNVUwMOrrmPUTbhwt7m+3Vjavkewtq4dRP8KwjDedKz0InVGnITDJoqKzam9akM3g7xWdH
 +X9A+yRbXzA1XAs0kPvPLmGjWlU6WmXb5iltnfcMkNuLcWRc8gVoGrs3a2QCjtIiP6Dq4Y
 BnNpVcSHRG3WyrbMNQatlBhlH9FqKJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-OaNHpWQ-Mna__9B2ypxbvQ-1; Mon, 16 Aug 2021 10:25:43 -0400
X-MC-Unique: OaNHpWQ-Mna__9B2ypxbvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A207087D549;
 Mon, 16 Aug 2021 14:25:41 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAB7619C46;
 Mon, 16 Aug 2021 14:25:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] kernel/resource: cleanup and optimize
 iomem_is_exclusive()
Date: Mon, 16 Aug 2021 16:25:05 +0200
Message-Id: <20210816142505.28359-4-david@redhat.com>
In-Reply-To: <20210816142505.28359-1-david@redhat.com>
References: <20210816142505.28359-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Hanjun Guo <guohanjun@huawei.com>,
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

Let's clean it up a bit, reusing for_each_resource() and avoiding
traversing subtrees we are not interested in.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 kernel/resource.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index f57a14617c49..7e59b57afa56 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1759,10 +1759,9 @@ static int strict_iomem_checks;
  */
 bool iomem_is_exclusive(u64 addr)
 {
-	struct resource *p = &iomem_resource;
-	bool err = false;
-	loff_t l;
+	bool skip_children = false, err = false;
 	int size = PAGE_SIZE;
+	struct resource *p;
 
 	if (!strict_iomem_checks)
 		return false;
@@ -1770,15 +1769,19 @@ bool iomem_is_exclusive(u64 addr)
 	addr = addr & PAGE_MASK;
 
 	read_lock(&resource_lock);
-	for (p = p->child; p ; p = r_next(NULL, p, &l)) {
+	for_each_resource(&iomem_resource, p, skip_children) {
 		/*
 		 * We can probably skip the resources without
 		 * IORESOURCE_IO attribute?
 		 */
 		if (p->start >= addr + size)
 			break;
-		if (p->end < addr)
+		if (p->end < addr) {
+			skip_children = true;
 			continue;
+		}
+		skip_children = false;
+
 		/*
 		 * A resource is exclusive if IORESOURCE_EXCLUSIVE is set
 		 * or CONFIG_IO_STRICT_DEVMEM is enabled and the
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
