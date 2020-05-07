Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B651C8D55
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 16:03:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4533426475;
	Thu,  7 May 2020 14:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JP94AGJIVKy; Thu,  7 May 2020 14:03:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC3DE26418;
	Thu,  7 May 2020 14:03:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D777AC07FF;
	Thu,  7 May 2020 14:03:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C950EC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C39DD89390
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UE7XfwMZa8b9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 14CB289397
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588860226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mneKSrcFh5+MZzllxZ6nUp+i4lcHd2Bq+t93L/e/DVA=;
 b=DRaWWOpX868T1WO/FZrPtWzITVeXITsCYkMUnT7Bjdxg/YduQ6r1IcImzy0LklbgwWdoxX
 Kqhzhud1boH6ibrax5aMvhifQcthydqzYDAQIGoesTxvbA+Wmqro7a2UmHxluxKnJpH751
 6wZbctXcWRTsIAhzyxT6/7s6twCMvgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-jkKsHUXTMYKhCTvguYHs1w-1; Thu, 07 May 2020 10:03:40 -0400
X-MC-Unique: jkKsHUXTMYKhCTvguYHs1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3E141895950;
 Thu,  7 May 2020 14:03:38 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCE136109E;
 Thu,  7 May 2020 14:03:36 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/15] virtio-mem: Unplug subblocks right-to-left
Date: Thu,  7 May 2020 16:01:37 +0200
Message-Id: <20200507140139.17083-14-david@redhat.com>
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

We unplug blocks right-to-left, let's also unplug subblocks within a block
right-to-left.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 38 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 8dd57b61b09b..a719e1a04ac7 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -353,18 +353,6 @@ static bool virtio_mem_mb_test_sb_unplugged(struct virtio_mem *vm,
 	return find_next_bit(vm->sb_bitmap, bit + count, bit) >= bit + count;
 }
 
-/*
- * Find the first plugged subblock. Returns vm->nb_sb_per_mb in case there is
- * none.
- */
-static int virtio_mem_mb_first_plugged_sb(struct virtio_mem *vm,
-					  unsigned long mb_id)
-{
-	const int bit = (mb_id - vm->first_mb_id) * vm->nb_sb_per_mb;
-
-	return find_next_bit(vm->sb_bitmap, bit + vm->nb_sb_per_mb, bit) - bit;
-}
-
 /*
  * Find the first unplugged subblock. Returns vm->nb_sb_per_mb in case there is
  * none.
@@ -1016,21 +1004,27 @@ static int virtio_mem_mb_unplug_any_sb(struct virtio_mem *vm,
 	int sb_id, count;
 	int rc;
 
+	sb_id = vm->nb_sb_per_mb - 1;
 	while (*nb_sb) {
-		sb_id = virtio_mem_mb_first_plugged_sb(vm, mb_id);
-		if (sb_id >= vm->nb_sb_per_mb)
+		/* Find the next candidate subblock */
+		while (sb_id >= 0 &&
+		       virtio_mem_mb_test_sb_unplugged(vm, mb_id, sb_id, 1))
+			sb_id--;
+		if (sb_id < 0)
 			break;
+		/* Try to unplug multiple subblocks at a time */
 		count = 1;
-		while (count < *nb_sb &&
-		       sb_id + count  < vm->nb_sb_per_mb &&
-		       virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id + count,
-						     1))
+		while (count < *nb_sb && sb_id > 0 &&
+		       virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id - 1, 1)) {
 			count++;
+			sb_id--;
+		}
 
 		rc = virtio_mem_mb_unplug_sb(vm, mb_id, sb_id, count);
 		if (rc)
 			return rc;
 		*nb_sb -= count;
+		sb_id--;
 	}
 
 	return 0;
@@ -1337,12 +1331,12 @@ static int virtio_mem_mb_unplug_any_sb_online(struct virtio_mem *vm,
 	 * we should sense via something like is_mem_section_removable()
 	 * first if it makes sense to go ahead any try to allocate.
 	 */
-	for (sb_id = 0; sb_id < vm->nb_sb_per_mb && *nb_sb; sb_id++) {
+	for (sb_id = vm->nb_sb_per_mb - 1; sb_id >= 0 && *nb_sb; sb_id--) {
 		/* Find the next candidate subblock */
-		while (sb_id < vm->nb_sb_per_mb &&
+		while (sb_id >= 0 &&
 		       !virtio_mem_mb_test_sb_plugged(vm, mb_id, sb_id, 1))
-			sb_id++;
-		if (sb_id >= vm->nb_sb_per_mb)
+			sb_id--;
+		if (sb_id < 0)
 			break;
 
 		start_pfn = PFN_DOWN(virtio_mem_mb_id_to_phys(mb_id) +
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
