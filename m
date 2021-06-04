Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77239B238
	for <lists.virtualization@lfdr.de>; Fri,  4 Jun 2021 07:54:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0687D400F3;
	Fri,  4 Jun 2021 05:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmUQ_EnEl4LX; Fri,  4 Jun 2021 05:54:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id E566740610;
	Fri,  4 Jun 2021 05:54:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93B8FC0001;
	Fri,  4 Jun 2021 05:54:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50ECDC0001
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C28F40696
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5WpAPhm1ty2x
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7673A40695
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622786070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11TQ6i9OVoMbPFRqUnwUHbTRfc/PohdFDbCQomllfUE=;
 b=dDA/8tpdrqP2HJtCx0YR/ROEfV06zPs/GNciQZdo6pIB0n0ypg9hnMAsS72im+5jjFIu1K
 zUMMJ+e5fiGmC7qgbEZ8BM7aRG3YYlPR8vnuMydB46uBELD6sU6AXP24mfoK3VB+GVCuKC
 7JTELwJzsczRXSqBXjFPdGJMi4gYfBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-fXW_oB-uPKa9DV4LccIoBw-1; Fri, 04 Jun 2021 01:54:29 -0400
X-MC-Unique: fXW_oB-uPKa9DV4LccIoBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D606C180FD71;
 Fri,  4 Jun 2021 05:54:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-212.pek2.redhat.com
 [10.72.12.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C77EC5D9CC;
 Fri,  4 Jun 2021 05:54:20 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Subject: [PATCH 3/7] virtio-ring: factor out desc_extra allocation
Date: Fri,  4 Jun 2021 13:53:46 +0800
Message-Id: <20210604055350.58753-4-jasowang@redhat.com>
In-Reply-To: <20210604055350.58753-1-jasowang@redhat.com>
References: <20210604055350.58753-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: ashish.kalra@amd.com, ak@linux.intel.com, file@sect.tu-berlin.de,
 luto@kernel.org, kvm@vger.kernel.org, konrad.wilk@oracle.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 hch@infradead.org, xieyongji@bytedance.com, stefanha@redhat.com
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

A helper is introduced for the logic of allocating the descriptor
extra data. This will be reused by split virtqueue.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index c25ea5776687..0cdd965dba58 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1550,6 +1550,25 @@ static void *virtqueue_detach_unused_buf_packed(struct virtqueue *_vq)
 	return NULL;
 }
 
+static struct vring_desc_extra *vring_alloc_desc_extra(struct vring_virtqueue *vq,
+						       unsigned int num)
+{
+	struct vring_desc_extra *desc_extra;
+	unsigned int i;
+
+	desc_extra = kmalloc_array(num, sizeof(struct vring_desc_extra),
+				   GFP_KERNEL);
+	if (!desc_extra)
+		return NULL;
+
+	memset(desc_extra, 0, num * sizeof(struct vring_desc_extra));
+
+	for (i = 0; i < num - 1; i++)
+		desc_extra[i].next = i + 1;
+
+	return desc_extra;
+}
+
 static struct virtqueue *vring_create_virtqueue_packed(
 	unsigned int index,
 	unsigned int num,
@@ -1567,7 +1586,6 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	struct vring_packed_desc_event *driver, *device;
 	dma_addr_t ring_dma_addr, driver_event_dma_addr, device_event_dma_addr;
 	size_t ring_size_in_bytes, event_size_in_bytes;
-	unsigned int i;
 
 	ring_size_in_bytes = num * sizeof(struct vring_packed_desc);
 
@@ -1650,18 +1668,10 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	/* Put everything in free lists. */
 	vq->free_head = 0;
 
-	vq->packed.desc_extra = kmalloc_array(num,
-			sizeof(struct vring_desc_extra),
-			GFP_KERNEL);
+	vq->packed.desc_extra = vring_alloc_desc_extra(vq, num);
 	if (!vq->packed.desc_extra)
 		goto err_desc_extra;
 
-	memset(vq->packed.desc_extra, 0,
-		num * sizeof(struct vring_desc_extra));
-
-	for (i = 0; i < num - 1; i++)
-		vq->packed.desc_extra[i].next = i + 1;
-
 	/* No callback?  Tell other side not to bother us. */
 	if (!callback) {
 		vq->packed.event_flags_shadow = VRING_PACKED_EVENT_FLAG_DISABLE;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
