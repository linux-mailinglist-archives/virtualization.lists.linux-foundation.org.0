Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E14B3663F9
	for <lists.virtualization@lfdr.de>; Wed, 21 Apr 2021 05:22:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F23C608B7;
	Wed, 21 Apr 2021 03:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ki6jKzcj9cqR; Wed, 21 Apr 2021 03:22:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 667A860B49;
	Wed, 21 Apr 2021 03:22:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBEAEC0020;
	Wed, 21 Apr 2021 03:22:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE439C0020
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E93440634
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RibCaTJA0kLV
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:22:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD33140642
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 03:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618975338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hoojy8FYOBs7XLo+S/qLf7Fvtx0zhibi9/ME4wYJTig=;
 b=cmhqP0TQxawLYgwR9eD2MA3i4EgqjQuH3w+M3Ti6XBuVF+LVa9faXNhcrpxlU1cmkKYeHy
 2NwEAaYJcJGniup4cS6hP+aGLc17B2gmXKCGcQ75DsU4CE/StjZfD/dF/CwALCOuJrbi0h
 j2T3D/txDG1vX5ZnSrQxP+flc9JxskM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-sNW5xQT6NIOK9xVj046-AA-1; Tue, 20 Apr 2021 23:22:16 -0400
X-MC-Unique: sNW5xQT6NIOK9xVj046-AA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C83D6801984;
 Wed, 21 Apr 2021 03:22:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-189.pek2.redhat.com
 [10.72.13.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 860E16064B;
 Wed, 21 Apr 2021 03:22:04 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH 6/7] virtio: use err label in __vring_new_virtqueue()
Date: Wed, 21 Apr 2021 11:21:16 +0800
Message-Id: <20210421032117.5177-7-jasowang@redhat.com>
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

Using error label for unwind in __vring_new_virtqueue. This is useful
for future refacotring.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 11dfa0dc8ec1..9800f1c9ce4c 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2137,10 +2137,8 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
 
 	vq->split.desc_state = kmalloc_array(vring.num,
 			sizeof(struct vring_desc_state_split), GFP_KERNEL);
-	if (!vq->split.desc_state) {
-		kfree(vq);
-		return NULL;
-	}
+	if (!vq->split.desc_state)
+		goto err_state;
 
 	/* Put everything in free lists. */
 	vq->free_head = 0;
@@ -2151,6 +2149,10 @@ struct virtqueue *__vring_new_virtqueue(unsigned int index,
 
 	list_add_tail(&vq->vq.list, &vdev->vqs);
 	return &vq->vq;
+
+err_state:
+	kfree(vq);
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(__vring_new_virtqueue);
 
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
