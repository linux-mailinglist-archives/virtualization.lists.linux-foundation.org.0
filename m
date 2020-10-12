Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C768728B526
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 14:55:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D8F4874BC;
	Mon, 12 Oct 2020 12:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRVQ7W0Qgxt0; Mon, 12 Oct 2020 12:55:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBBCD87472;
	Mon, 12 Oct 2020 12:55:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6D88C07FF;
	Mon, 12 Oct 2020 12:55:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DA0CC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 46516874BF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjtHV-3R4zfX
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:55:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7A671874BB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602507320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uNq+DgFx1awbtxRCO5i53i4OzQ+SF2JZ2u66Xi43bM=;
 b=gw6wzoCyOKndojGss0fHhCRqiqmz96pLbWtkpMS7gsn1LWCVgZQ9RVbyEHt1xXWlaXwlyM
 sky5taVQKtteS/eWiiy5hSHDlrs9RY9Utz+R66jkot6pm/4psoH0SgTw5UuSYuOubJfClH
 +sAmCaM/F13Vv2XX/gaKoFurwJnuVOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-qnEyoJ0YOFmFIFcl_UGbGQ-1; Mon, 12 Oct 2020 08:55:15 -0400
X-MC-Unique: qnEyoJ0YOFmFIFcl_UGbGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6722164144;
 Mon, 12 Oct 2020 12:55:14 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1C6460C07;
 Mon, 12 Oct 2020 12:55:09 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 13/29] virtio-mem: factor out handling of fake-offline
 pages in memory notifier
Date: Mon, 12 Oct 2020 14:53:07 +0200
Message-Id: <20201012125323.17509-14-david@redhat.com>
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

Let's factor out the core pieces and place the implementation next to
virtio_mem_fake_offline(). We'll reuse this functionality soon.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 73 +++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 23 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index d132bc54ef57..a2124892e510 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -168,6 +168,10 @@ static LIST_HEAD(virtio_mem_devices);
 
 static void virtio_mem_online_page_cb(struct page *page, unsigned int order);
 static void virtio_mem_retry(struct virtio_mem *vm);
+static void virtio_mem_fake_offline_going_offline(unsigned long pfn,
+						  unsigned long nr_pages);
+static void virtio_mem_fake_offline_cancel_offline(unsigned long pfn,
+						   unsigned long nr_pages);
 
 /*
  * Register a virtio-mem device so it will be considered for the online_page
@@ -604,27 +608,15 @@ static void virtio_mem_notify_going_offline(struct virtio_mem *vm,
 					    unsigned long mb_id)
 {
 	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
-	struct page *page;
 	unsigned long pfn;
-	int sb_id, i;
+	int sb_id;
 
 	for (sb_id = 0; sb_id < vm->nb_sb_per_mb; sb_id++) {
 		if (virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id, 1))
 			continue;
-		/*
-		 * Drop our reference to the pages so the memory can get
-		 * offlined and add the unplugged pages to the managed
-		 * page counters (so offlining code can correctly subtract
-		 * them again).
-		 */
 		pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
 			       sb_id * vm->subblock_size);
-		adjust_managed_page_count(pfn_to_page(pfn), nr_pages);
-		for (i = 0; i < nr_pages; i++) {
-			page = pfn_to_page(pfn + i);
-			if (WARN_ON(!page_ref_dec_and_test(page)))
-				dump_page(page, "unplugged page referenced");
-		}
+		virtio_mem_fake_offline_going_offline(pfn, nr_pages);
 	}
 }
 
@@ -633,21 +625,14 @@ static void virtio_mem_notify_cancel_offline(struct virtio_mem *vm,
 {
 	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
 	unsigned long pfn;
-	int sb_id, i;
+	int sb_id;
 
 	for (sb_id = 0; sb_id < vm->nb_sb_per_mb; sb_id++) {
 		if (virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id, 1))
 			continue;
-		/*
-		 * Get the reference we dropped when going offline and
-		 * subtract the unplugged pages from the managed page
-		 * counters.
-		 */
 		pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
 			       sb_id * vm->subblock_size);
-		adjust_managed_page_count(pfn_to_page(pfn), -nr_pages);
-		for (i = 0; i < nr_pages; i++)
-			page_ref_inc(pfn_to_page(pfn + i));
+		virtio_mem_fake_offline_cancel_offline(pfn, nr_pages);
 	}
 }
 
@@ -853,6 +838,48 @@ static int virtio_mem_fake_offline(unsigned long pfn, unsigned long nr_pages)
 	return 0;
 }
 
+/*
+ * Handle fake-offline pages when memory is going offline - such that the
+ * pages can be skipped by mm-core when offlining.
+ */
+static void virtio_mem_fake_offline_going_offline(unsigned long pfn,
+						  unsigned long nr_pages)
+{
+	struct page *page;
+	unsigned long i;
+
+	/*
+	 * Drop our reference to the pages so the memory can get offlined
+	 * and add the unplugged pages to the managed page counters (so
+	 * offlining code can correctly subtract them again).
+	 */
+	adjust_managed_page_count(pfn_to_page(pfn), nr_pages);
+	/* Drop our reference to the pages so the memory can get offlined. */
+	for (i = 0; i < nr_pages; i++) {
+		page = pfn_to_page(pfn + i);
+		if (WARN_ON(!page_ref_dec_and_test(page)))
+			dump_page(page, "fake-offline page referenced");
+	}
+}
+
+/*
+ * Handle fake-offline pages when memory offlining is canceled - to undo
+ * what we did in virtio_mem_fake_offline_going_offline().
+ */
+static void virtio_mem_fake_offline_cancel_offline(unsigned long pfn,
+						   unsigned long nr_pages)
+{
+	unsigned long i;
+
+	/*
+	 * Get the reference we dropped when going offline and subtract the
+	 * unplugged pages from the managed page counters.
+	 */
+	adjust_managed_page_count(pfn_to_page(pfn), -nr_pages);
+	for (i = 0; i < nr_pages; i++)
+		page_ref_inc(pfn_to_page(pfn + i));
+}
+
 static void virtio_mem_online_page_cb(struct page *page, unsigned int order)
 {
 	const unsigned long addr = page_to_phys(page);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
