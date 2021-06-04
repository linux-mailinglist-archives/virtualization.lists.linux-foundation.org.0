Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 628F339B234
	for <lists.virtualization@lfdr.de>; Fri,  4 Jun 2021 07:54:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E11AF82AB9;
	Fri,  4 Jun 2021 05:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzOQbjjdOXWR; Fri,  4 Jun 2021 05:54:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1EC482ACD;
	Fri,  4 Jun 2021 05:54:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E173C0001;
	Fri,  4 Jun 2021 05:54:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C504C0001
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B66F6F943
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSclkdzRqaxB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D45786F942
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622786062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Iy/gnaCvLxp4h+bVzLUI8j+eO2vvAPrkrWPiAFq8VY=;
 b=TLfL/Oq5NLf12aPmPZHHVUq/yUsmSlBZpX/gOtcCcwTnoyCAI6dHYdttcQcnlqAnIT1JHK
 dzy3tmit8ytYBNIPC1BE92GVSd2rB8eiA2PkltelC7/DbFuqvKGcm9yI+42vriDhQRUhuK
 mc8Z/sLPued8QZJN0HBgTeVuuwqosQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-JcSceWTlMPSaNP9kW5suBQ-1; Fri, 04 Jun 2021 01:54:21 -0400
X-MC-Unique: JcSceWTlMPSaNP9kW5suBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DDFE513A;
 Fri,  4 Jun 2021 05:54:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-212.pek2.redhat.com
 [10.72.12.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74D8F5D9CC;
 Fri,  4 Jun 2021 05:54:10 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Subject: [PATCH 2/7] virtio_ring: rename vring_desc_extra_packed
Date: Fri,  4 Jun 2021 13:53:45 +0800
Message-Id: <20210604055350.58753-3-jasowang@redhat.com>
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

Rename vring_desc_extra_packed to vring_desc_extra since the structure
are pretty generic which could be reused by split virtqueue as well.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index e1e9ed42e637..c25ea5776687 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -77,7 +77,7 @@ struct vring_desc_state_packed {
 	u16 last;			/* The last desc state in a list. */
 };
 
-struct vring_desc_extra_packed {
+struct vring_desc_extra {
 	dma_addr_t addr;		/* Buffer DMA addr. */
 	u32 len;			/* Buffer length. */
 	u16 flags;			/* Descriptor flags. */
@@ -166,7 +166,7 @@ struct vring_virtqueue {
 
 			/* Per-descriptor state. */
 			struct vring_desc_state_packed *desc_state;
-			struct vring_desc_extra_packed *desc_extra;
+			struct vring_desc_extra *desc_extra;
 
 			/* DMA address and size information */
 			dma_addr_t ring_dma_addr;
@@ -912,7 +912,7 @@ static struct virtqueue *vring_create_virtqueue_split(
  */
 
 static void vring_unmap_state_packed(const struct vring_virtqueue *vq,
-				     struct vring_desc_extra_packed *state)
+				     struct vring_desc_extra *state)
 {
 	u16 flags;
 
@@ -1651,13 +1651,13 @@ static struct virtqueue *vring_create_virtqueue_packed(
 	vq->free_head = 0;
 
 	vq->packed.desc_extra = kmalloc_array(num,
-			sizeof(struct vring_desc_extra_packed),
+			sizeof(struct vring_desc_extra),
 			GFP_KERNEL);
 	if (!vq->packed.desc_extra)
 		goto err_desc_extra;
 
 	memset(vq->packed.desc_extra, 0,
-		num * sizeof(struct vring_desc_extra_packed));
+		num * sizeof(struct vring_desc_extra));
 
 	for (i = 0; i < num - 1; i++)
 		vq->packed.desc_extra[i].next = i + 1;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
