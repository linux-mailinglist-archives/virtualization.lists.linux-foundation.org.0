Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E61F82B06A9
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 14:39:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B9AF870D6;
	Thu, 12 Nov 2020 13:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yONyDq48WcMX; Thu, 12 Nov 2020 13:39:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 35E7B870CF;
	Thu, 12 Nov 2020 13:39:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2612BC016F;
	Thu, 12 Nov 2020 13:39:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0B0EC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 978982E1D9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjRxCu5FAjBh
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:39:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id CC17F2E1B9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/nNt7biy+blXgzIzbt4CpC5LP6Jojqi23BTUap8oBc=;
 b=aoPDq1x2TXVD94Tzrw/tAXTgjbtJl/BUkKY5DmSXyvz6b1RWfVFy+RKsEOoxVo8dk9E0Jh
 5+C9H7PGmi8rfm3mTBtjA6eew20t7XZHy50WiqX7kjkDYiq6wijPfGVft6cGbLJFY3jWcp
 eIKUHpWS177idTBxI1Nm8qsTFefFqUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-5Fh2xBDQNl2QNPWUNGhIQg-1; Thu, 12 Nov 2020 08:38:57 -0500
X-MC-Unique: 5Fh2xBDQNl2QNPWUNGhIQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6083A802B47;
 Thu, 12 Nov 2020 13:38:55 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A272055765;
 Thu, 12 Nov 2020 13:38:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/29] virtio-mem: generalize check for added memory
Date: Thu, 12 Nov 2020 14:37:57 +0100
Message-Id: <20201112133815.13332-12-david@redhat.com>
In-Reply-To: <20201112133815.13332-1-david@redhat.com>
References: <20201112133815.13332-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
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

Let's check by traversing busy system RAM resources instead, to avoid
relying on memory block states.

Don't use walk_system_ram_range(), as that works on pages and we want to
use the bare addresses we have easily at hand.

This is a preparation for Big Block Mode (BBM), which won't have memory
block states.

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 2f1ce4d4781b..3731097cd9e8 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1833,6 +1833,20 @@ static void virtio_mem_delete_resource(struct virtio_mem *vm)
 	vm->parent_resource = NULL;
 }
 
+static int virtio_mem_range_has_system_ram(struct resource *res, void *arg)
+{
+	return 1;
+}
+
+static bool virtio_mem_has_memory_added(struct virtio_mem *vm)
+{
+	const unsigned long flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	return walk_iomem_res_desc(IORES_DESC_NONE, flags, vm->addr,
+				   vm->addr + vm->region_size, NULL,
+				   virtio_mem_range_has_system_ram) == 1;
+}
+
 static int virtio_mem_probe(struct virtio_device *vdev)
 {
 	struct virtio_mem *vm;
@@ -1954,10 +1968,7 @@ static void virtio_mem_remove(struct virtio_device *vdev)
 	 * the system. And there is no way to stop the driver/device from going
 	 * away. Warn at least.
 	 */
-	if (vm->nb_mb_state[VIRTIO_MEM_MB_STATE_OFFLINE] ||
-	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL] ||
-	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE] ||
-	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL]) {
+	if (virtio_mem_has_memory_added(vm)) {
 		dev_warn(&vdev->dev, "device still has system memory added\n");
 	} else {
 		virtio_mem_delete_resource(vm);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
