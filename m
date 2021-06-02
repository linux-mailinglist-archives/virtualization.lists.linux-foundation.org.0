Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB6A3992FD
	for <lists.virtualization@lfdr.de>; Wed,  2 Jun 2021 20:58:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AFED40536;
	Wed,  2 Jun 2021 18:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8_TF5_4LyZg; Wed,  2 Jun 2021 18:58:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D2614053B;
	Wed,  2 Jun 2021 18:58:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38F9FC0001;
	Wed,  2 Jun 2021 18:58:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42F93C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 18:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EA2940536
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 18:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHi1__hyGMj8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 18:57:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C1BB4052E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622660278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opX8nHoEd36stvd7Apu9m63irxvh9gxuAe97ioC+BQQ=;
 b=UvQWWIVl865Y6GkRWiXKjoLH+bOx2ZS8h5euKeHqnxaxuEdmGmobxLV58+7t+umcSVNyfD
 Oo0KPtrErXx1ERnZrpmzHwkMKoartkWJhCzFE060fr1wmGrWbKYDy/3h4FL1gcEVzVX4aZ
 LKKUbARYT4GXPON/1XMHmUEaOaOYb2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-yPJ8YLn9PiC5J6o7nhb5Lg-1; Wed, 02 Jun 2021 14:57:54 -0400
X-MC-Unique: yPJ8YLn9PiC5J6o7nhb5Lg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C90E180FD64;
 Wed,  2 Jun 2021 18:57:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-159.ams2.redhat.com [10.36.114.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70247100238C;
 Wed,  2 Jun 2021 18:57:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] virtio-mem: simplify high-level unplug handling in Sub
 Block Mode
Date: Wed,  2 Jun 2021 20:57:17 +0200
Message-Id: <20210602185720.31821-5-david@redhat.com>
In-Reply-To: <20210602185720.31821-1-david@redhat.com>
References: <20210602185720.31821-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, virtualization@lists.linux-foundation.org,
 Marek Kedzierski <mkedzier@redhat.com>, Hui Zhu <teawater@gmail.com>,
 Oscar Salvador <osalvador@suse.de>
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

Let's simplify by introducing a new virtio_mem_sbm_unplug_any_sb(),
similar to virtio_mem_sbm_plug_any_sb(), to simplify high-level memory
block selection when unplugging in Sub Block Mode.

Rename existing virtio_mem_sbm_unplug_any_sb() to
virtio_mem_sbm_unplug_any_sb_raw().

The only change is that we now temporarily unlock the hotplug mutex around
cond_resched() when processing offline memory blocks, which doesn't
make a real difference as we already have to temporarily unlock in
virtio_mem_sbm_unplug_any_sb_offline() when removing a memory block.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 103 ++++++++++++++++++++----------------
 1 file changed, 57 insertions(+), 46 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index c0e6ea6244e4..d54bb34a7ed8 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1453,8 +1453,8 @@ static int virtio_mem_bbm_plug_bb(struct virtio_mem *vm, unsigned long bb_id)
  *
  * Note: can fail after some subblocks were unplugged.
  */
-static int virtio_mem_sbm_unplug_any_sb(struct virtio_mem *vm,
-					unsigned long mb_id, uint64_t *nb_sb)
+static int virtio_mem_sbm_unplug_any_sb_raw(struct virtio_mem *vm,
+					    unsigned long mb_id, uint64_t *nb_sb)
 {
 	int sb_id, count;
 	int rc;
@@ -1496,7 +1496,7 @@ static int virtio_mem_sbm_unplug_mb(struct virtio_mem *vm, unsigned long mb_id)
 {
 	uint64_t nb_sb = vm->sbm.sbs_per_mb;
 
-	return virtio_mem_sbm_unplug_any_sb(vm, mb_id, &nb_sb);
+	return virtio_mem_sbm_unplug_any_sb_raw(vm, mb_id, &nb_sb);
 }
 
 /*
@@ -1806,7 +1806,7 @@ static int virtio_mem_sbm_unplug_any_sb_offline(struct virtio_mem *vm,
 {
 	int rc;
 
-	rc = virtio_mem_sbm_unplug_any_sb(vm, mb_id, nb_sb);
+	rc = virtio_mem_sbm_unplug_any_sb_raw(vm, mb_id, nb_sb);
 
 	/* some subblocks might have been unplugged even on failure */
 	if (!virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->sbm.sbs_per_mb))
@@ -1929,11 +1929,46 @@ static int virtio_mem_sbm_unplug_any_sb_online(struct virtio_mem *vm,
 	return 0;
 }
 
+/*
+ * Unplug the desired number of plugged subblocks of a memory block that is
+ * already added to Linux. Will skip subblock of online memory blocks that are
+ * busy (by the OS). Will fail if any subblock that's not busy cannot get
+ * unplugged.
+ *
+ * Will modify the state of the memory block. Might temporarily drop the
+ * hotplug_mutex.
+ *
+ * Note: Can fail after some subblocks were successfully unplugged. Can
+ *       return 0 even if subblocks were busy and could not get unplugged.
+ */
+static int virtio_mem_sbm_unplug_any_sb(struct virtio_mem *vm,
+					unsigned long mb_id,
+					uint64_t *nb_sb)
+{
+	const int old_state = virtio_mem_sbm_get_mb_state(vm, mb_id);
+
+	switch (old_state) {
+	case VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL:
+	case VIRTIO_MEM_SBM_MB_ONLINE:
+		return virtio_mem_sbm_unplug_any_sb_online(vm, mb_id, nb_sb);
+	case VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL:
+	case VIRTIO_MEM_SBM_MB_OFFLINE:
+		return virtio_mem_sbm_unplug_any_sb_offline(vm, mb_id, nb_sb);
+	}
+	return -EINVAL;
+}
+
 static int virtio_mem_sbm_unplug_request(struct virtio_mem *vm, uint64_t diff)
 {
+	const int mb_states[] = {
+		VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL,
+		VIRTIO_MEM_SBM_MB_OFFLINE,
+		VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL,
+		VIRTIO_MEM_SBM_MB_ONLINE,
+	};
 	uint64_t nb_sb = diff / vm->sbm.sb_size;
 	unsigned long mb_id;
-	int rc;
+	int rc, i;
 
 	if (!nb_sb)
 		return 0;
@@ -1945,47 +1980,23 @@ static int virtio_mem_sbm_unplug_request(struct virtio_mem *vm, uint64_t diff)
 	 */
 	mutex_lock(&vm->hotplug_mutex);
 
-	/* Try to unplug subblocks of partially plugged offline blocks. */
-	virtio_mem_sbm_for_each_mb_rev(vm, mb_id,
-				       VIRTIO_MEM_SBM_MB_OFFLINE_PARTIAL) {
-		rc = virtio_mem_sbm_unplug_any_sb_offline(vm, mb_id, &nb_sb);
-		if (rc || !nb_sb)
-			goto out_unlock;
-		cond_resched();
-	}
-
-	/* Try to unplug subblocks of plugged offline blocks. */
-	virtio_mem_sbm_for_each_mb_rev(vm, mb_id, VIRTIO_MEM_SBM_MB_OFFLINE) {
-		rc = virtio_mem_sbm_unplug_any_sb_offline(vm, mb_id, &nb_sb);
-		if (rc || !nb_sb)
-			goto out_unlock;
-		cond_resched();
-	}
-
-	if (!unplug_online) {
-		mutex_unlock(&vm->hotplug_mutex);
-		return 0;
-	}
-
-	/* Try to unplug subblocks of partially plugged online blocks. */
-	virtio_mem_sbm_for_each_mb_rev(vm, mb_id,
-				       VIRTIO_MEM_SBM_MB_ONLINE_PARTIAL) {
-		rc = virtio_mem_sbm_unplug_any_sb_online(vm, mb_id, &nb_sb);
-		if (rc || !nb_sb)
-			goto out_unlock;
-		mutex_unlock(&vm->hotplug_mutex);
-		cond_resched();
-		mutex_lock(&vm->hotplug_mutex);
-	}
-
-	/* Try to unplug subblocks of plugged online blocks. */
-	virtio_mem_sbm_for_each_mb_rev(vm, mb_id, VIRTIO_MEM_SBM_MB_ONLINE) {
-		rc = virtio_mem_sbm_unplug_any_sb_online(vm, mb_id, &nb_sb);
-		if (rc || !nb_sb)
-			goto out_unlock;
-		mutex_unlock(&vm->hotplug_mutex);
-		cond_resched();
-		mutex_lock(&vm->hotplug_mutex);
+	/*
+	 * We try unplug from partially plugged blocks first, to try removing
+	 * whole memory blocks along with metadata.
+	 */
+	for (i = 0; i < ARRAY_SIZE(mb_states); i++) {
+		virtio_mem_sbm_for_each_mb_rev(vm, mb_id, mb_states[i]) {
+			rc = virtio_mem_sbm_unplug_any_sb(vm, mb_id, &nb_sb);
+			if (rc || !nb_sb)
+				goto out_unlock;
+			mutex_unlock(&vm->hotplug_mutex);
+			cond_resched();
+			mutex_lock(&vm->hotplug_mutex);
+		}
+		if (!unplug_online && i == 1) {
+			mutex_unlock(&vm->hotplug_mutex);
+			return 0;
+		}
 	}
 
 	mutex_unlock(&vm->hotplug_mutex);
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
