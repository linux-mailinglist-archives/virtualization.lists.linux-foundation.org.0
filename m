Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A973663EF
	for <lists.virtualization@lfdr.de>; Wed, 21 Apr 2021 05:21:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2025608B6;
	Wed, 21 Apr 2021 03:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DKf2o9Wi-wui; Wed, 21 Apr 2021 03:21:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 463B360B4B;
	Wed, 21 Apr 2021 03:21:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C141AC000B;
	Wed, 21 Apr 2021 03:21:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E6B1C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D38F540628
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPCiGcoSZLUa
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:21:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 285D840624
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618975305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Iy/gnaCvLxp4h+bVzLUI8j+eO2vvAPrkrWPiAFq8VY=;
 b=Mq1Iy5VDkXbHZTWFrAKsYFDeSN+iidpP7LjnGtr/iTlLkKuYvArZroPejFxk4EhhBNW53T
 K0UQoY0QCzAxDcF/8TkNo/BTGUOncBkVpFRfOX/8Hz0RfvXL9F7a3UobRjGutD5BObev4a
 1JmgH3j9kUEsP2vv/6afL1mpQO8CZak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-tMhfc-cVNlqf6YP-srmgbg-1; Tue, 20 Apr 2021 23:21:44 -0400
X-MC-Unique: tMhfc-cVNlqf6YP-srmgbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBACC18397B2;
 Wed, 21 Apr 2021 03:21:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-189.pek2.redhat.com
 [10.72.13.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0DC45B4A6;
 Wed, 21 Apr 2021 03:21:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH 2/7] virtio_ring: rename vring_desc_extra_packed
Date: Wed, 21 Apr 2021 11:21:12 +0800
Message-Id: <20210421032117.5177-3-jasowang@redhat.com>
In-Reply-To: <20210421032117.5177-1-jasowang@redhat.com>
References: <20210421032117.5177-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: ashish.kalra@amd.com, file@sect.tu-berlin.de,
 martin.radev@aisec.fraunhofer.de, kvm@vger.kernel.org, konrad.wilk@oracle.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 xieyongji@bytedance.com, stefanha@redhat.com
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
