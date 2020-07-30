Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AB94F232F8C
	for <lists.virtualization@lfdr.de>; Thu, 30 Jul 2020 11:34:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6565D878B7;
	Thu, 30 Jul 2020 09:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kp0lpyaz7eSl; Thu, 30 Jul 2020 09:34:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDC3187938;
	Thu, 30 Jul 2020 09:34:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B8BEC004F;
	Thu, 30 Jul 2020 09:34:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FF22C004D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6C20F878BA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Or93i4fOrO1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A4E48878B7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596101693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7jg4C1lFVntmOxGkfWB8fseKoI6mDXqgm9t3qEGdZo=;
 b=iZBeCJRRiyigcajQbKd9saMp+jdIAh90fb6MoUjRekefdnSTsOLmusROzCMwlNNpvj6p3w
 k4Qd4VpFSYtwjJZffinCFNekDHFHM+bdve/L2nDIMiRvlJfFSMu0HlbAVzlHschQc8wBDZ
 Y10JElr+YJzAKHtUfIUE7Jlt+Hj+kow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-rYSpW6Z6MeS919xjdJcRDQ-1; Thu, 30 Jul 2020 05:34:49 -0400
X-MC-Unique: rYSpW6Z6MeS919xjdJcRDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C46E72D41;
 Thu, 30 Jul 2020 09:34:34 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D63B5FC31;
 Thu, 30 Jul 2020 09:34:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] mm: document semantics of ZONE_MOVABLE
Date: Thu, 30 Jul 2020 11:34:16 +0200
Message-Id: <20200730093416.36210-7-david@redhat.com>
In-Reply-To: <20200730093416.36210-1-david@redhat.com>
References: <20200730093416.36210-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
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

Let's document what ZONE_MOVABLE means, how it's used, and which special
cases we have regarding unmovable pages (memory offlining vs. migration /
allocations).

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mmzone.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index f6f884970511d..b8c49b2aff684 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -372,6 +372,40 @@ enum zone_type {
 	 */
 	ZONE_HIGHMEM,
 #endif
+	/*
+	 * ZONE_MOVABLE is similar to ZONE_NORMAL, except that it *primarily*
+	 * only contains movable pages. Main use cases are to make memory
+	 * offlining more likely to succeed, and to locally limit unmovable
+	 * allocations - e.g., to increase the number of THP/huge pages.
+	 * Notable special cases:
+	 *
+	 * 1. Pinned pages: (Long-term) pinning of movable pages might
+	 *    essentially turn such pages unmovable. Memory offlining might
+	 *    retry a long time.
+	 * 2. memblock allocations: kernelcore/movablecore setups might create
+	 *    situations where ZONE_MOVABLE contains unmovable allocations
+	 *    after boot. Memory offlining and allocations fail early.
+	 * 3. Memory holes: Such pages cannot be allocated. Applies only to
+	 *    boot memory, not hotplugged memory. Memory offlining and
+	 *    allocations fail early.
+	 * 4. PG_hwpoison pages: While poisoned pages can be skipped during
+	 *    memory offlining, such pages cannot be allocated.
+	 * 5. Unmovable PG_offline pages: In paravirtualized environments,
+	 *    hotplugged memory blocks might only partially be managed by the
+	 *    buddy (e.g., via XEN-balloon, Hyper-V balloon, virtio-mem). The
+	 *    parts not manged by the buddy are unmovable PG_offline pages. In
+	 *    some cases (virtio-mem), such pages can be skipped during
+	 *    memory offlining, however, cannot be moved/allcoated. These
+	 *    techniques might use alloc_contig_range() to hide previously
+	 *    exposed pages from the buddy again (e.g., to implement some sort
+	 *    of memory unplug in virtio-mem).
+	 *
+	 * In general, no unmovable allocations that degrade memory offlining
+	 * should end up in ZONE_MOVABLE. Allocators (like alloc_contig_range())
+	 * have to expect that migrating pages in ZONE_MOVABLE can fail (even
+	 * if has_unmovable_pages() states that there are no unmovable pages,
+	 * there can be false negatives).
+	 */
 	ZONE_MOVABLE,
 #ifdef CONFIG_ZONE_DEVICE
 	ZONE_DEVICE,
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
