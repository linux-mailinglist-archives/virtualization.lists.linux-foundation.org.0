Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6097328B525
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 14:55:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25BA785FAE;
	Mon, 12 Oct 2020 12:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGK-R44Cepru; Mon, 12 Oct 2020 12:55:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B15D085F7F;
	Mon, 12 Oct 2020 12:55:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A48F3C0051;
	Mon, 12 Oct 2020 12:55:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC641C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 98AF786A4F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZ8wqf6CGgD7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:55:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B975C86A4C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602507318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRNzaKNhWih50ca6Rdrr2BHB9XOrtl2sT3OFPr5P+gI=;
 b=ItaeWp44AxLoFJak12pR08g7BAlc+c3uyRTZLrWLrugpcx7UKpJE9xgRKBXrwnXcTpC7/A
 oaMHUc0ZKFro0551kbB+RCWeBAkTuXc08exZ39ZgbQ7HMUNckDB6Lcvdoabd+KpZ8AiYKo
 2JIVdPop2LRTnkIow2dI1+IgBqJPj8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-hypicrj3NCq7ZQK3pT2P4g-1; Mon, 12 Oct 2020 08:55:10 -0400
X-MC-Unique: hypicrj3NCq7ZQK3pT2P4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1E3464145;
 Mon, 12 Oct 2020 12:55:08 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 784E460C07;
 Mon, 12 Oct 2020 12:54:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/29] virtio-mem: factor out fake-offlining into
 virtio_mem_fake_offline()
Date: Mon, 12 Oct 2020 14:53:06 +0200
Message-Id: <20201012125323.17509-13-david@redhat.com>
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

... which now matches virtio_mem_fake_online(). We'll reuse this
functionality soon.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 00d1cfca4713..d132bc54ef57 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -832,6 +832,27 @@ static void virtio_mem_fake_online(unsigned long pfn, unsigned long nr_pages)
 	}
 }
 
+/*
+ * Try to allocate a range, marking pages fake-offline, effectively
+ * fake-offlining them.
+ */
+static int virtio_mem_fake_offline(unsigned long pfn, unsigned long nr_pages)
+{
+	int rc;
+
+	rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
+				GFP_KERNEL);
+	if (rc == -ENOMEM)
+		/* whoops, out of memory */
+		return rc;
+	if (rc)
+		return -EBUSY;
+
+	virtio_mem_set_fake_offline(pfn, nr_pages, true);
+	adjust_managed_page_count(pfn_to_page(pfn), -nr_pages);
+	return 0;
+}
+
 static void virtio_mem_online_page_cb(struct page *page, unsigned int order)
 {
 	const unsigned long addr = page_to_phys(page);
@@ -1335,17 +1356,10 @@ static int virtio_mem_mb_unplug_sb_online(struct virtio_mem *vm,
 
 	start_pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
 			     sb_id * vm->subblock_size);
-	rc = alloc_contig_range(start_pfn, start_pfn + nr_pages,
-				MIGRATE_MOVABLE, GFP_KERNEL);
-	if (rc == -ENOMEM)
-		/* whoops, out of memory */
-		return rc;
-	if (rc)
-		return -EBUSY;
 
-	/* Mark it as fake-offline before unplugging it */
-	virtio_mem_set_fake_offline(start_pfn, nr_pages, true);
-	adjust_managed_page_count(pfn_to_page(start_pfn), -nr_pages);
+	rc = virtio_mem_fake_offline(start_pfn, nr_pages);
+	if (rc)
+		return rc;
 
 	/* Try to unplug the allocated memory */
 	rc = virtio_mem_mb_unplug_sb(vm, mb_id, sb_id, count);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
