Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE122B06A3
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 14:38:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CDA75870D1;
	Thu, 12 Nov 2020 13:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JL146K3ALn-D; Thu, 12 Nov 2020 13:38:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3954F8709F;
	Thu, 12 Nov 2020 13:38:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E0C1C016F;
	Thu, 12 Nov 2020 13:38:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D56AC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 19E13877A7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHPL2jxvNJ+Y
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:38:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BBCEB87796
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605188332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEe6VBE/5yZyIS6nKePb3w8IGCBXjgtR7vD5nfLEPS4=;
 b=gCJY3omLWQikuEE/2V6J4V4y9gJp6HvC/XqSafN0hhmEmg09/sGjXAO1SGPGnV3q8mLgS7
 WuPPUJ+1s9s0sZbNhDi0wb/QuljM5nt3ZoNz5xA7ur5wchBpwkDywX6aj6tLo2pgEw2Hik
 IMsSodmdC9IPpK6CqS0bW8u3uA+XiSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-_OjfKXOoNG6x4NfMOn8JpQ-1; Thu, 12 Nov 2020 08:38:48 -0500
X-MC-Unique: _OjfKXOoNG6x4NfMOn8JpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CE8518BA28D;
 Thu, 12 Nov 2020 13:38:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7509155765;
 Thu, 12 Nov 2020 13:38:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/29] virtio-mem: print debug messages from
 virtio_mem_send_*_request()
Date: Thu, 12 Nov 2020 14:37:53 +0100
Message-Id: <20201112133815.13332-8-david@redhat.com>
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

Let's move the existing dev_dbg() into the functions, print if something
went wrong, and also print for virtio_mem_send_unplug_all_request().

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 50 ++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 30b4d07f5263..4742497feff0 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -869,23 +869,33 @@ static int virtio_mem_send_plug_request(struct virtio_mem *vm, uint64_t addr,
 		.u.plug.addr = cpu_to_virtio64(vm->vdev, addr),
 		.u.plug.nb_blocks = cpu_to_virtio16(vm->vdev, nb_vm_blocks),
 	};
+	int rc = -ENOMEM;
 
 	if (atomic_read(&vm->config_changed))
 		return -EAGAIN;
 
+	dev_dbg(&vm->vdev->dev, "plugging memory: 0x%llx - 0x%llx\n", addr,
+		addr + size - 1);
+
 	switch (virtio_mem_send_request(vm, &req)) {
 	case VIRTIO_MEM_RESP_ACK:
 		vm->plugged_size += size;
 		return 0;
 	case VIRTIO_MEM_RESP_NACK:
-		return -EAGAIN;
+		rc = -EAGAIN;
+		break;
 	case VIRTIO_MEM_RESP_BUSY:
-		return -ETXTBSY;
+		rc = -ETXTBSY;
+		break;
 	case VIRTIO_MEM_RESP_ERROR:
-		return -EINVAL;
+		rc = -EINVAL;
+		break;
 	default:
-		return -ENOMEM;
+		break;
 	}
+
+	dev_dbg(&vm->vdev->dev, "plugging memory failed: %d\n", rc);
+	return rc;
 }
 
 static int virtio_mem_send_unplug_request(struct virtio_mem *vm, uint64_t addr,
@@ -897,21 +907,30 @@ static int virtio_mem_send_unplug_request(struct virtio_mem *vm, uint64_t addr,
 		.u.unplug.addr = cpu_to_virtio64(vm->vdev, addr),
 		.u.unplug.nb_blocks = cpu_to_virtio16(vm->vdev, nb_vm_blocks),
 	};
+	int rc = -ENOMEM;
 
 	if (atomic_read(&vm->config_changed))
 		return -EAGAIN;
 
+	dev_dbg(&vm->vdev->dev, "unplugging memory: 0x%llx - 0x%llx\n", addr,
+		addr + size - 1);
+
 	switch (virtio_mem_send_request(vm, &req)) {
 	case VIRTIO_MEM_RESP_ACK:
 		vm->plugged_size -= size;
 		return 0;
 	case VIRTIO_MEM_RESP_BUSY:
-		return -ETXTBSY;
+		rc = -ETXTBSY;
+		break;
 	case VIRTIO_MEM_RESP_ERROR:
-		return -EINVAL;
+		rc = -EINVAL;
+		break;
 	default:
-		return -ENOMEM;
+		break;
 	}
+
+	dev_dbg(&vm->vdev->dev, "unplugging memory failed: %d\n", rc);
+	return rc;
 }
 
 static int virtio_mem_send_unplug_all_request(struct virtio_mem *vm)
@@ -919,6 +938,9 @@ static int virtio_mem_send_unplug_all_request(struct virtio_mem *vm)
 	const struct virtio_mem_req req = {
 		.type = cpu_to_virtio16(vm->vdev, VIRTIO_MEM_REQ_UNPLUG_ALL),
 	};
+	int rc = -ENOMEM;
+
+	dev_dbg(&vm->vdev->dev, "unplugging all memory");
 
 	switch (virtio_mem_send_request(vm, &req)) {
 	case VIRTIO_MEM_RESP_ACK:
@@ -928,10 +950,14 @@ static int virtio_mem_send_unplug_all_request(struct virtio_mem *vm)
 		atomic_set(&vm->config_changed, 1);
 		return 0;
 	case VIRTIO_MEM_RESP_BUSY:
-		return -ETXTBSY;
+		rc = -ETXTBSY;
+		break;
 	default:
-		return -ENOMEM;
+		break;
 	}
+
+	dev_dbg(&vm->vdev->dev, "unplugging all memory failed: %d\n", rc);
+	return rc;
 }
 
 /*
@@ -946,9 +972,6 @@ static int virtio_mem_mb_plug_sb(struct virtio_mem *vm, unsigned long mb_id,
 	const uint64_t size = count * vm->subblock_size;
 	int rc;
 
-	dev_dbg(&vm->vdev->dev, "plugging memory block: %lu : %i - %i\n", mb_id,
-		sb_id, sb_id + count - 1);
-
 	rc = virtio_mem_send_plug_request(vm, addr, size);
 	if (!rc)
 		virtio_mem_mb_set_sb_plugged(vm, mb_id, sb_id, count);
@@ -967,9 +990,6 @@ static int virtio_mem_mb_unplug_sb(struct virtio_mem *vm, unsigned long mb_id,
 	const uint64_t size = count * vm->subblock_size;
 	int rc;
 
-	dev_dbg(&vm->vdev->dev, "unplugging memory block: %lu : %i - %i\n",
-		mb_id, sb_id, sb_id + count - 1);
-
 	rc = virtio_mem_send_unplug_request(vm, addr, size);
 	if (!rc)
 		virtio_mem_mb_set_sb_unplugged(vm, mb_id, sb_id, count);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
