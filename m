Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4723C039
	for <lists.virtualization@lfdr.de>; Tue,  4 Aug 2020 21:42:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F704862C1;
	Tue,  4 Aug 2020 19:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnvLrj2pTZzm; Tue,  4 Aug 2020 19:42:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88EA1862AB;
	Tue,  4 Aug 2020 19:42:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72CEEC013C;
	Tue,  4 Aug 2020 19:42:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FC5FC004C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 19:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0C68487FE9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 19:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1TVR8Cvw1ZL
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 19:42:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BA45E87FFB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596570135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcFLaiIwXztw2tm8Rg2ib9m7zR+rRxxy65slu0ULfFE=;
 b=FKSPqZ9SlpMAeJ27zwA0hGf8MDPC7PhHSNqlDbAm7P05Bba6Tn5godEx0lf1mjsejLwjZS
 ja8GoiFSiShEkkUjOrt2J5ahWcTezZ47zmberOAiyCOw5Mv9cOJEyAdYQ5f64wFB307HJa
 0w2GQ3ZbwmJgjifgHxGET3WR+edCRMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-mqWn6R1COLCAX2jZ827R8A-1; Tue, 04 Aug 2020 15:42:13 -0400
X-MC-Unique: mqWn6R1COLCAX2jZ827R8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19C3F58;
 Tue,  4 Aug 2020 19:42:12 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-95.ams2.redhat.com [10.36.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F82272E4F;
 Tue,  4 Aug 2020 19:42:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] virtio-mem: don't special-case ZONE_MOVABLE
Date: Tue,  4 Aug 2020 21:41:41 +0200
Message-Id: <20200804194142.28279-6-david@redhat.com>
In-Reply-To: <20200804194142.28279-1-david@redhat.com>
References: <20200804194142.28279-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
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

When introducing virtio-mem, the semantics of ZONE_MOVABLE were rather
unclear, which is why we special-cased ZONE_MOVABLE such that partially
plugged blocks would never end up in ZONE_MOVABLE.

Now that the semantics are much clearer (and will be documented in
a follow-up patch including the new virtio-mem behavior), let's allow to
online partially plugged memory blocks to ZONE_MOVABLE and also consider
memory blocks that were onlined to ZONE_MOVABLE when unplugging memory.
While unplugged memory pages are, in general, unmovable, they can be
skipped when offlining memory.

virtio-mem only unplugs fairly big chunks (in the megabyte range) and
rather tries to shrink the memory region than randomly choosing memory. In
theory, if all other pages in the movable zone would be movable, virtio-mem
would only shrink that zone and not create any kind of fragmentation.

In the future, we might want to remember the zone again and use the
information when (un)plugging memory. For now, let's keep it simple.

Note: Support for defragmentation is planned, to deal with fragmentation
after unplug due to memory chunks within memory blocks that could not
get unplugged before (e.g., somebody pinning pages within ZONE_MOVABLE
for a longer time).

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 47 +++++++------------------------------
 1 file changed, 8 insertions(+), 39 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index f26f5f64ae822..2ddfc4a0e2ee0 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -36,18 +36,10 @@ enum virtio_mem_mb_state {
 	VIRTIO_MEM_MB_STATE_OFFLINE,
 	/* Partially plugged, fully added to Linux, offline. */
 	VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL,
-	/* Fully plugged, fully added to Linux, online (!ZONE_MOVABLE). */
+	/* Fully plugged, fully added to Linux, online. */
 	VIRTIO_MEM_MB_STATE_ONLINE,
-	/* Partially plugged, fully added to Linux, online (!ZONE_MOVABLE). */
+	/* Partially plugged, fully added to Linux, online. */
 	VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL,
-	/*
-	 * Fully plugged, fully added to Linux, online (ZONE_MOVABLE).
-	 * We are not allowed to allocate (unplug) parts of this block that
-	 * are not movable (similar to gigantic pages). We will never allow
-	 * to online OFFLINE_PARTIAL to ZONE_MOVABLE (as they would contain
-	 * unmovable parts).
-	 */
-	VIRTIO_MEM_MB_STATE_ONLINE_MOVABLE,
 	VIRTIO_MEM_MB_STATE_COUNT
 };
 
@@ -526,21 +518,10 @@ static bool virtio_mem_owned_mb(struct virtio_mem *vm, unsigned long mb_id)
 }
 
 static int virtio_mem_notify_going_online(struct virtio_mem *vm,
-					  unsigned long mb_id,
-					  enum zone_type zone)
+					  unsigned long mb_id)
 {
 	switch (virtio_mem_mb_get_state(vm, mb_id)) {
 	case VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL:
-		/*
-		 * We won't allow to online a partially plugged memory block
-		 * to the MOVABLE zone - it would contain unmovable parts.
-		 */
-		if (zone == ZONE_MOVABLE) {
-			dev_warn_ratelimited(&vm->vdev->dev,
-					     "memory block has holes, MOVABLE not supported\n");
-			return NOTIFY_BAD;
-		}
-		return NOTIFY_OK;
 	case VIRTIO_MEM_MB_STATE_OFFLINE:
 		return NOTIFY_OK;
 	default:
@@ -560,7 +541,6 @@ static void virtio_mem_notify_offline(struct virtio_mem *vm,
 					VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL);
 		break;
 	case VIRTIO_MEM_MB_STATE_ONLINE:
-	case VIRTIO_MEM_MB_STATE_ONLINE_MOVABLE:
 		virtio_mem_mb_set_state(vm, mb_id,
 					VIRTIO_MEM_MB_STATE_OFFLINE);
 		break;
@@ -579,24 +559,17 @@ static void virtio_mem_notify_offline(struct virtio_mem *vm,
 	virtio_mem_retry(vm);
 }
 
-static void virtio_mem_notify_online(struct virtio_mem *vm, unsigned long mb_id,
-				     enum zone_type zone)
+static void virtio_mem_notify_online(struct virtio_mem *vm, unsigned long mb_id)
 {
 	unsigned long nb_offline;
 
 	switch (virtio_mem_mb_get_state(vm, mb_id)) {
 	case VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL:
-		BUG_ON(zone == ZONE_MOVABLE);
 		virtio_mem_mb_set_state(vm, mb_id,
 					VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL);
 		break;
 	case VIRTIO_MEM_MB_STATE_OFFLINE:
-		if (zone == ZONE_MOVABLE)
-			virtio_mem_mb_set_state(vm, mb_id,
-					    VIRTIO_MEM_MB_STATE_ONLINE_MOVABLE);
-		else
-			virtio_mem_mb_set_state(vm, mb_id,
-						VIRTIO_MEM_MB_STATE_ONLINE);
+		virtio_mem_mb_set_state(vm, mb_id, VIRTIO_MEM_MB_STATE_ONLINE);
 		break;
 	default:
 		BUG();
@@ -675,7 +648,6 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 	const unsigned long start = PFN_PHYS(mhp->start_pfn);
 	const unsigned long size = PFN_PHYS(mhp->nr_pages);
 	const unsigned long mb_id = virtio_mem_phys_to_mb_id(start);
-	enum zone_type zone;
 	int rc = NOTIFY_OK;
 
 	if (!virtio_mem_overlaps_range(vm, start, size))
@@ -717,8 +689,7 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 			break;
 		}
 		vm->hotplug_active = true;
-		zone = page_zonenum(pfn_to_page(mhp->start_pfn));
-		rc = virtio_mem_notify_going_online(vm, mb_id, zone);
+		rc = virtio_mem_notify_going_online(vm, mb_id);
 		break;
 	case MEM_OFFLINE:
 		virtio_mem_notify_offline(vm, mb_id);
@@ -726,8 +697,7 @@ static int virtio_mem_memory_notifier_cb(struct notifier_block *nb,
 		mutex_unlock(&vm->hotplug_mutex);
 		break;
 	case MEM_ONLINE:
-		zone = page_zonenum(pfn_to_page(mhp->start_pfn));
-		virtio_mem_notify_online(vm, mb_id, zone);
+		virtio_mem_notify_online(vm, mb_id);
 		vm->hotplug_active = false;
 		mutex_unlock(&vm->hotplug_mutex);
 		break;
@@ -1906,8 +1876,7 @@ static void virtio_mem_remove(struct virtio_device *vdev)
 	if (vm->nb_mb_state[VIRTIO_MEM_MB_STATE_OFFLINE] ||
 	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL] ||
 	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE] ||
-	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL] ||
-	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE_MOVABLE]) {
+	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL]) {
 		dev_warn(&vdev->dev, "device still has system memory added\n");
 	} else {
 		virtio_mem_delete_resource(vm);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
