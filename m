Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A242B06AA
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 14:39:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 06F3286BCB;
	Thu, 12 Nov 2020 13:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRFSdx9PYeTd; Thu, 12 Nov 2020 13:39:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7F67C86CDE;
	Thu, 12 Nov 2020 13:39:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 639F8C016F;
	Thu, 12 Nov 2020 13:39:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE99BC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE578877B6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdHokoIuUT-3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 46230877B2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vdbw4BBnAlXbecdd3kz0Gf6U85wgo73x2VHWlqh8gqU=;
 b=dS9s3rYZOxh+L5NRp8y9k6L5oOZ/Qyqym9W3YYJM8qZNLAokKsCis8WPCEsMQ1/rVYJECP
 1yt41Bfze4XOLel4UH0il4hZaXYqoK88l0Mb7krqpytE89yPf4Z9crhSfawQMWDUuewDLa
 Nbk2ZWMDa5asAHz8uJZQ4B7eTfiL+8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-BYRt4WzrNyuEdueCGAxQeA-1; Thu, 12 Nov 2020 08:39:01 -0500
X-MC-Unique: BYRt4WzrNyuEdueCGAxQeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F976801FD4;
 Thu, 12 Nov 2020 13:39:00 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF55075132;
 Thu, 12 Nov 2020 13:38:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/29] virtio-mem: generalize virtio_mem_owned_mb()
Date: Thu, 12 Nov 2020 14:37:58 +0100
Message-Id: <20201112133815.13332-13-david@redhat.com>
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

Avoid using memory block ids. Rename it to virtio_mem_contains_range().

This is a preparation for Big Block Mode (BBM).

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 3731097cd9e8..2193c5172195 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -512,12 +512,13 @@ static bool virtio_mem_overlaps_range(struct virtio_mem *vm,
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
@@ -871,7 +872,7 @@ static void virtio_mem_online_page_cb(struct page *page, unsigned int order)
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
