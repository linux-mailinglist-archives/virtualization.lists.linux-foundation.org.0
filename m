Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B98C2B06C9
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 14:40:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 09A5C8711C;
	Thu, 12 Nov 2020 13:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4qArAEP7sdh; Thu, 12 Nov 2020 13:40:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7652886CFC;
	Thu, 12 Nov 2020 13:40:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 566FCC016F;
	Thu, 12 Nov 2020 13:40:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9F1AC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E5FD2877AF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYlIm8h326gW
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:40:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1E47B877AC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36IiVgyuJHz3OHwKQ5JmOQlOnJM9D0Xc6EdXVsjAEj8=;
 b=Km+9Elz34YFJy+WVsiCQjjrX5oFM/1SMEZUqH9StDxyzDAoV7+u705YdD0Xjia9gHMy+iA
 5s/Z5H7IhtBTmdKcNDq7iI5qR4xt4RV69ELei8vUnvhwiw81T3oZKMp9j44V84ntOh/bvR
 A/0OC2xQguFWaeylpemqIxk8KmLO5fI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-LaP5dPENMxKAFPX-lYsjcQ-1; Thu, 12 Nov 2020 08:40:07 -0500
X-MC-Unique: LaP5dPENMxKAFPX-lYsjcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4506D5F9EE;
 Thu, 12 Nov 2020 13:40:06 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D9A455765;
 Thu, 12 Nov 2020 13:39:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 26/29] virtio-mem: allow to force Big Block Mode (BBM) and
 set the big block size
Date: Thu, 12 Nov 2020 14:38:12 +0100
Message-Id: <20201112133815.13332-27-david@redhat.com>
In-Reply-To: <20201112133815.13332-1-david@redhat.com>
References: <20201112133815.13332-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
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

Let's allow to force BBM, even if subblocks would be possible. Take care
of properly calculating the first big block id, because the start
address might no longer be aligned to the big block size.

Also, allow to manually configure the size of Big Blocks.

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 8a4f735360ac..861149acafe5 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -27,6 +27,16 @@ static bool unplug_online = true;
 module_param(unplug_online, bool, 0644);
 MODULE_PARM_DESC(unplug_online, "Try to unplug online memory");
 
+static bool force_bbm;
+module_param(force_bbm, bool, 0444);
+MODULE_PARM_DESC(force_bbm,
+		"Force Big Block Mode. Default is 0 (auto-selection)");
+
+static unsigned long bbm_block_size;
+module_param(bbm_block_size, ulong, 0444);
+MODULE_PARM_DESC(bbm_block_size,
+		 "Big Block size in bytes. Default is 0 (auto-detection).");
+
 /*
  * virtio-mem currently supports the following modes of operation:
  *
@@ -2164,7 +2174,7 @@ static int virtio_mem_init(struct virtio_mem *vm)
 			pageblock_nr_pages) * PAGE_SIZE;
 	sb_size = max_t(uint64_t, vm->device_block_size, sb_size);
 
-	if (sb_size < memory_block_size_bytes()) {
+	if (sb_size < memory_block_size_bytes() && !force_bbm) {
 		/* SBM: At least two subblocks per Linux memory block. */
 		vm->in_sbm = true;
 		vm->sbm.sb_size = sb_size;
@@ -2177,9 +2187,24 @@ static int virtio_mem_init(struct virtio_mem *vm)
 		vm->sbm.next_mb_id = vm->sbm.first_mb_id;
 	} else {
 		/* BBM: At least one Linux memory block. */
-		vm->bbm.bb_size = vm->device_block_size;
+		vm->bbm.bb_size = max_t(uint64_t, vm->device_block_size,
+					memory_block_size_bytes());
+
+		if (bbm_block_size) {
+			if (!is_power_of_2(bbm_block_size)) {
+				dev_warn(&vm->vdev->dev,
+					 "bbm_block_size is not a power of 2");
+			} else if (bbm_block_size < vm->bbm.bb_size) {
+				dev_warn(&vm->vdev->dev,
+					 "bbm_block_size is too small");
+			} else {
+				vm->bbm.bb_size = bbm_block_size;
+			}
+		}
 
-		vm->bbm.first_bb_id = virtio_mem_phys_to_bb_id(vm, vm->addr);
+		/* Round up to the next aligned big block */
+		addr = vm->addr + vm->bbm.bb_size - 1;
+		vm->bbm.first_bb_id = virtio_mem_phys_to_bb_id(vm, addr);
 		vm->bbm.next_bb_id = vm->bbm.first_bb_id;
 	}
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
