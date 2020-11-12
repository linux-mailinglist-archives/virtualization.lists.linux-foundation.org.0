Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0B2B06A7
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 14:39:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8FEC6877B3;
	Thu, 12 Nov 2020 13:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzsWEhwfl31D; Thu, 12 Nov 2020 13:39:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D88EE877B6;
	Thu, 12 Nov 2020 13:38:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1326C088B;
	Thu, 12 Nov 2020 13:38:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B5BFC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 06A20870FC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nh+AYZZrc82l
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:38:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3DD66870E5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s7b/l63zYUaR+OsccnXVvZ/uAYcvm6kvDksVTa1Mbhc=;
 b=QpLxOCK42KkRMngF7D57VFnVqFHpfbg7CbWaPBy4PjJ2HnjGhzlnVYMNz9ucZAie08Y1eV
 PUyy1J8pDgV6iP340m4CcCCn4z/ml1cLGsnk6Wt9y8u7FPcnkGHhFAUIXxpQqS/qvQVIjt
 X9pEN2L8ydSASkXc7u4UKqeeGaiQbJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-IhACjZgxNUGOglFtNSkyqg-1; Thu, 12 Nov 2020 08:38:54 -0500
X-MC-Unique: IhACjZgxNUGOglFtNSkyqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5257018BA282;
 Thu, 12 Nov 2020 13:38:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C589655765;
 Thu, 12 Nov 2020 13:38:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/29] virtio-mem: retry fake-offlining via
 alloc_contig_range() on ZONE_MOVABLE
Date: Thu, 12 Nov 2020 14:37:56 +0100
Message-Id: <20201112133815.13332-11-david@redhat.com>
In-Reply-To: <20201112133815.13332-1-david@redhat.com>
References: <20201112133815.13332-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

ZONE_MOVABLE is supposed to give some guarantees, yet,
alloc_contig_range() isn't prepared to properly deal with some racy
cases properly (e.g., temporary page pinning when exiting processed, PCP).

Retry 5 times for now. There is certainly room for improvement in the
future.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index c24055248f9d..2f1ce4d4781b 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -784,19 +784,34 @@ static void virtio_mem_fake_online(unsigned long pfn, unsigned long nr_pages)
  */
 static int virtio_mem_fake_offline(unsigned long pfn, unsigned long nr_pages)
 {
-	int rc;
+	const bool is_movable = zone_idx(page_zone(pfn_to_page(pfn))) ==
+				ZONE_MOVABLE;
+	int rc, retry_count;
 
-	rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
-				GFP_KERNEL);
-	if (rc == -ENOMEM)
-		/* whoops, out of memory */
-		return rc;
-	if (rc)
-		return -EBUSY;
+	/*
+	 * TODO: We want an alloc_contig_range() mode that tries to allocate
+	 * harder (e.g., dealing with temporarily pinned pages, PCP), especially
+	 * with ZONE_MOVABLE. So for now, retry a couple of times with
+	 * ZONE_MOVABLE before giving up - because that zone is supposed to give
+	 * some guarantees.
+	 */
+	for (retry_count = 0; retry_count < 5; retry_count++) {
+		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
+					GFP_KERNEL);
+		if (rc == -ENOMEM)
+			/* whoops, out of memory */
+			return rc;
+		else if (rc && !is_movable)
+			break;
+		else if (rc)
+			continue;
 
-	virtio_mem_set_fake_offline(pfn, nr_pages, true);
-	adjust_managed_page_count(pfn_to_page(pfn), -nr_pages);
-	return 0;
+		virtio_mem_set_fake_offline(pfn, nr_pages, true);
+		adjust_managed_page_count(pfn_to_page(pfn), -nr_pages);
+		return 0;
+	}
+
+	return -EBUSY;
 }
 
 /*
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
