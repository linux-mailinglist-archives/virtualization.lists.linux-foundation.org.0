Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1410A28B54C
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 14:57:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BA3EC2094B;
	Mon, 12 Oct 2020 12:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzvnGv+MGCOF; Mon, 12 Oct 2020 12:56:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B3B0D207B0;
	Mon, 12 Oct 2020 12:56:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CD9EC07FF;
	Mon, 12 Oct 2020 12:56:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D04D9C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BB440207A6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUcHCsrpmucT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:56:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 1CE762094D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602507412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0W8H+Eppwo/SCQzkVeDdbAcVbZKbYgif5wttVSOP2BA=;
 b=GhoA/UuyfXs/uMVZPKWSDPvd1+UqkJwFzHCsxvkAEcSWWgPIDU1E8PvoUBXRWhAjQ8lRtp
 32Eaug4x7mAwkxyTZZeAqof0o9wgRZUbRIGnCIfGa3fwIDFP/6SrbInLMRNtvAOj9km12l
 ImvzIkyyifq+E/2rb5ebNdoqGgAgxUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-T0HyHURqNQS580ecS-Y9RA-1; Mon, 12 Oct 2020 08:56:48 -0400
X-MC-Unique: T0HyHURqNQS580ecS-Y9RA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18060107465A;
 Mon, 12 Oct 2020 12:56:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EED4A60C07;
 Mon, 12 Oct 2020 12:56:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 24/29] virtio-mem: print debug messages from
 virtio_mem_send_*_request()
Date: Mon, 12 Oct 2020 14:53:18 +0200
Message-Id: <20201012125323.17509-25-david@redhat.com>
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

Let's move the existing dev_dbg() into the functions, print if something
went wrong, and also print for virtio_mem_send_unplug_all_request().

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c | 50 ++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index eb2ad31a8d8a..e68d0d99590c 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1053,23 +1053,33 @@ static int virtio_mem_send_plug_request(struct virtio_mem *vm, uint64_t addr,
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
@@ -1081,21 +1091,30 @@ static int virtio_mem_send_unplug_request(struct virtio_mem *vm, uint64_t addr,
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
@@ -1103,6 +1122,9 @@ static int virtio_mem_send_unplug_all_request(struct virtio_mem *vm)
 	const struct virtio_mem_req req = {
 		.type = cpu_to_virtio16(vm->vdev, VIRTIO_MEM_REQ_UNPLUG_ALL),
 	};
+	int rc = -ENOMEM;
+
+	dev_dbg(&vm->vdev->dev, "unplugging all memory");
 
 	switch (virtio_mem_send_request(vm, &req)) {
 	case VIRTIO_MEM_RESP_ACK:
@@ -1112,10 +1134,14 @@ static int virtio_mem_send_unplug_all_request(struct virtio_mem *vm)
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
@@ -1130,9 +1156,6 @@ static int virtio_mem_sbm_plug_sb(struct virtio_mem *vm, unsigned long mb_id,
 	const uint64_t size = count * vm->sbm.sb_size;
 	int rc;
 
-	dev_dbg(&vm->vdev->dev, "plugging memory block: %lu : %i - %i\n", mb_id,
-		sb_id, sb_id + count - 1);
-
 	rc = virtio_mem_send_plug_request(vm, addr, size);
 	if (!rc)
 		virtio_mem_sbm_set_sb_plugged(vm, mb_id, sb_id, count);
@@ -1151,9 +1174,6 @@ static int virtio_mem_sbm_unplug_sb(struct virtio_mem *vm, unsigned long mb_id,
 	const uint64_t size = count * vm->sbm.sb_size;
 	int rc;
 
-	dev_dbg(&vm->vdev->dev, "unplugging memory block: %lu : %i - %i\n",
-		mb_id, sb_id, sb_id + count - 1);
-
 	rc = virtio_mem_send_unplug_request(vm, addr, size);
 	if (!rc)
 		virtio_mem_sbm_set_sb_unplugged(vm, mb_id, sb_id, count);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
