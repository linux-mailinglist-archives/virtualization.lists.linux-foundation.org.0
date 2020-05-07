Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB81C8D5A
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 16:03:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71D388957C;
	Thu,  7 May 2020 14:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFmZx-5HLdQR; Thu,  7 May 2020 14:03:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 920E8895B4;
	Thu,  7 May 2020 14:03:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76F09C07FF;
	Thu,  7 May 2020 14:03:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C036C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6FEFE26426
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8wQyAIub-wV
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id AA088263F9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588860231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQSI93WDnJ16nEtoeWpgKm4iRZohoBJubdiofU1fO/E=;
 b=iELLDIcTRGoPE6e9TuTzBJ6GRrcFZQ5nxB8aZopNof2wOxHvfEAVVDt7AjwNR+MBotmJTJ
 ITJc58jBVsDdzHDm83dXpw3PyNC+zp373GDKdgU0/3fFaPC2VEiY17CRqWF4DOqolvlixs
 EZkdjLwPaJes+lb8SVny3VGCuqVOZ8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-qfwtH60tNo6ptdwVBH69jQ-1; Thu, 07 May 2020 10:03:45 -0400
X-MC-Unique: qfwtH60tNo6ptdwVBH69jQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81E171895950;
 Thu,  7 May 2020 14:03:43 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EEFE60CCC;
 Thu,  7 May 2020 14:03:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/15] virtio-mem: Try to unplug the complete online memory
 block first
Date: Thu,  7 May 2020 16:01:39 +0200
Message-Id: <20200507140139.17083-16-david@redhat.com>
In-Reply-To: <20200507140139.17083-1-david@redhat.com>
References: <20200507140139.17083-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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

Right now, we always try to unplug single subblocks when processing an
online memory block. Let's try to unplug the complete online memory block
first, in case it is fully plugged and the unplug request is large
enough. Fallback to single subblocks in case the memory block cannot get
unplugged as a whole.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 88 ++++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 31 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index abd93b778a26..9e523db3bee1 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1307,6 +1307,46 @@ static int virtio_mem_mb_unplug_any_sb_offline(struct virtio_mem *vm,
 	return 0;
 }
 
+/*
+ * Unplug the given plugged subblocks of an online memory block.
+ *
+ * Will modify the state of the memory block.
+ */
+static int virtio_mem_mb_unplug_sb_online(struct virtio_mem *vm,
+					  unsigned long mb_id, int sb_id,
+					  int count)
+{
+	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size) * count;
+	unsigned long start_pfn;
+	int rc;
+
+	start_pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
+			     sb_id * vm->subblock_size);
+	rc = alloc_contig_range(start_pfn, start_pfn + nr_pages,
+				MIGRATE_MOVABLE, GFP_KERNEL);
+	if (rc == -ENOMEM)
+		/* whoops, out of memory */
+		return rc;
+	if (rc)
+		return -EBUSY;
+
+	/* Mark it as fake-offline before unplugging it */
+	virtio_mem_set_fake_offline(start_pfn, nr_pages, true);
+	adjust_managed_page_count(pfn_to_page(start_pfn), -nr_pages);
+
+	/* Try to unplug the allocated memory */
+	rc = virtio_mem_mb_unplug_sb(vm, mb_id, sb_id, count);
+	if (rc) {
+		/* Return the memory to the buddy. */
+		virtio_mem_fake_online(start_pfn, nr_pages);
+		return rc;
+	}
+
+	virtio_mem_mb_set_state(vm, mb_id,
+				VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL);
+	return 0;
+}
+
 /*
  * Unplug the desired number of plugged subblocks of an online memory block.
  * Will skip subblock that are busy.
@@ -1321,16 +1361,21 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
 					      unsigned long mb_id,
 					      uint64_t *nb_sb)
 {
-	const unsigned long nr_pages = PFN_DOWN(vm->subblock_size);
-	unsigned long start_pfn;
 	int rc, sb_id;
 
-	/*
-	 * TODO: To increase the performance we want to try bigger, consecutive
-	 * subblocks first before falling back to single subblocks. Also,
-	 * we should sense via something like is_mem_section_removable()
-	 * first if it makes sense to go ahead any try to allocate.
-	 */
+	/* If possible, try to unplug the complete block in one shot. */
+	if (*nb_sb >= vm->nb_sb_per_mb &&
+	    virtio_mem_mb_test_sb_plugged(vm, mb_id, 0, vm->nb_sb_per_mb)) {
+		rc = virtio_mem_mb_unplug_sb_online(vm, mb_id, 0,
+						    vm->nb_sb_per_mb);
+		if (!rc) {
+			*nb_sb -= vm->nb_sb_per_mb;
+			goto unplugged;
+		} else if (rc != -EBUSY)
+			return rc;
+	}
+
+	/* Fallback to single subblocks. */
 	for (sb_id = vm->nb_sb_per_mb - 1; sb_id >= 0 && *nb_sb; sb_id--) {
 		/* Find the next candidate subblock */
 		while (sb_id >= 0 &&
@@ -1339,34 +1384,15 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
 		if (sb_id < 0)
 			break;
 
-		start_pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
-				     sb_id * vm->subblock_size);
-		rc = alloc_contig_range(start_pfn, start_pfn + nr_pages,
-					MIGRATE_MOVABLE, GFP_KERNEL);
-		if (rc == -ENOMEM)
-			/* whoops, out of memory */
-			return rc;
-		if (rc)
-			/* memory busy, we can't unplug this chunk */
+		rc = virtio_mem_mb_unplug_sb_online(vm, mb_id, sb_id, 1);
+		if (rc == -EBUSY)
 			continue;
-
-		/* Mark it as fake-offline before unplugging it */
-		virtio_mem_set_fake_offline(start_pfn, nr_pages, true);
-		adjust_managed_page_count(pfn_to_page(start_pfn), -nr_pages);
-
-		/* Try to unplug the allocated memory */
-		rc = virtio_mem_mb_unplug_sb(vm, mb_id, sb_id, 1);
-		if (rc) {
-			/* Return the memory to the buddy. */
-			virtio_mem_fake_online(start_pfn, nr_pages);
+		else if (rc)
 			return rc;
-		}
-
-		virtio_mem_mb_set_state(vm, mb_id,
-					VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL);
 		*nb_sb -= 1;
 	}
 
+unplugged:
 	/*
 	 * Once all subblocks of a memory block were unplugged, offline and
 	 * remove it. This will usually not fail, as no memory is in use
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
