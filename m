Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2F82B06AD
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 14:39:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F7198709E;
	Thu, 12 Nov 2020 13:39:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hkIVw1x5ir8t; Thu, 12 Nov 2020 13:39:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D71C987075;
	Thu, 12 Nov 2020 13:39:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF9B9C088B;
	Thu, 12 Nov 2020 13:39:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72368C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6F0C0870CF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jhZpAWif3gQi
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9ED2987075
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LRGJVK4/DWh0ybsvg3iyxiy6aEFUSz59akgT5h3oPBs=;
 b=WrOkoE2HFrN4vXOyaxnfjNH7/shNvAu8OJafJOe7hiuadvfmO/z83hHVP2IeT6tO6p24L/
 OFznVNFm9e4DtMKafhh6nZeWelDpLQg72tpcNinma0XZp6lQIffz+wfCprcp/pTozv7b/w
 y8418bFw7j0A4BjPLfS6JPsBfYJ517U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-75tC-WQaPHyz9okuNBx7Vw-1; Thu, 12 Nov 2020 08:39:06 -0500
X-MC-Unique: 75tC-WQaPHyz9okuNBx7Vw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91064809DC0;
 Thu, 12 Nov 2020 13:39:05 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1E6A55765;
 Thu, 12 Nov 2020 13:39:00 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/29] virtio-mem: generalize virtio_mem_overlaps_range()
Date: Thu, 12 Nov 2020 14:37:59 +0100
Message-Id: <20201112133815.13332-14-david@redhat.com>
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

Avoid using memory block ids. While at it, use uint64_t for
address/size.

This is a preparation for Big Block Mode (BBM).

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 2193c5172195..bd76aa79a82e 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -501,14 +501,10 @@ static int virtio_mem_translate_node_id(struct virtio_mem *vm, uint16_t node_id)
  * Test if a virtio-mem device overlaps with the given range. Can be called
  * from (notifier) callbacks lockless.
  */
-static bool virtio_mem_overlaps_range(struct virtio_mem *vm,
-				      unsigned long start, unsigned long size)
+static bool virtio_mem_overlaps_range(struct virtio_mem *vm, uint64_t start,
+				      uint64_t size)
 {
-	unsigned long dev_start = virtio_mem_mb_id_to_phys(vm->first_mb_id);
-	unsigned long dev_end = virtio_mem_mb_id_to_phys(vm->last_mb_id) +
-				memory_block_size_bytes();
-
-	return start < dev_end && dev_start < start + size;
+	return start < vm->addr + vm->region_size && vm->addr < start + size;
 }
 
 /*
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
