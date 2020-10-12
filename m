Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 368AC28B517
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 14:54:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EDD9687480;
	Mon, 12 Oct 2020 12:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfYBcdXd+8Su; Mon, 12 Oct 2020 12:54:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DCF987477;
	Mon, 12 Oct 2020 12:54:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BE5CC0051;
	Mon, 12 Oct 2020 12:54:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06221C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 00DEC86A60
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gr3o2sz+xYTz
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:54:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7997186A62
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602507275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQDWeH2qYFqH9wAdtLA1r7drvKX0EXkimbPBAYSfLvU=;
 b=O2YCCw4fFEYbu/1mCo6L8l6vuu0oGFpUyIBMmlIqgIcqapNV8ZsTrshp6UIYegKy3Hpqo7
 k6EqncFDXBYcz90Kn6fGquRlqq/1sl/c9HPP123a5W64ybPcy+S2Pv23ByyM85FeWXSJXp
 SwIXhqu3xXsApD+eIX1O/j7TpzvB3QU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-aCYmZaVGOvSMCy6HIaBuKw-1; Mon, 12 Oct 2020 08:54:31 -0400
X-MC-Unique: aCYmZaVGOvSMCy6HIaBuKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B2DF1084D60;
 Mon, 12 Oct 2020 12:54:30 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7957260C07;
 Mon, 12 Oct 2020 12:54:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/29] virtio-mem: generalize virtio_mem_owned_mb()
Date: Mon, 12 Oct 2020 14:53:00 +0200
Message-Id: <20201012125323.17509-7-david@redhat.com>
In-Reply-To: <20201012125323.17509-1-david@redhat.com>
References: <20201012125323.17509-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
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

Avoid using memory block ids. Rename it to virtio_mem_contains_range().

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 6bbd1cfd10d3..821143db14fe 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -500,12 +500,13 @@ static bool virtio_mem_overlaps_range(struct virtio_mem *vm,
 }
 
 /*
- * Test if a virtio-mem device owns a memory block. Can be called from
+ * Test if a virtio-mem device contains a given range. Can be called from
  * (notifier) callbacks lockless.
  */
-static bool virtio_mem_owned_mb(struct virtio_mem *vm, unsigned long mb_id)
+static bool virtio_mem_contains_range(struct virtio_mem *vm, uint64_t start,
+				      uint64_t size)
 {
-	return mb_id >= vm->first_mb_id && mb_id <= vm->last_mb_id;
+	return start >= vm->addr && start + size <= vm->addr + vm->region_size;
 }
 
 static int virtio_mem_notify_going_online(struct virtio_mem *vm,
@@ -800,7 +801,7 @@ static void virtio_mem_online_page_cb(struct page *page, unsigned int order)
 	 */
 	rcu_read_lock();
 	list_for_each_entry_rcu(vm, &virtio_mem_devices, next) {
-		if (!virtio_mem_owned_mb(vm, mb_id))
+		if (!virtio_mem_contains_range(vm, addr, PFN_PHYS(1 << order)))
 			continue;
 
 		sb_id = virtio_mem_phys_to_sb_id(vm, addr);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
