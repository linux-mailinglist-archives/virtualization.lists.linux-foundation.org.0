Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 10980368E8F
	for <lists.virtualization@lfdr.de>; Fri, 23 Apr 2021 10:11:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3EC40FB5;
	Fri, 23 Apr 2021 08:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qnGeayQpirtf; Fri, 23 Apr 2021 08:11:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id C77C041464;
	Fri, 23 Apr 2021 08:11:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D4A4C000B;
	Fri, 23 Apr 2021 08:11:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02EECC000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Apr 2021 08:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E612C40FB5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Apr 2021 08:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7H_hdxRT45Lz
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Apr 2021 08:11:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FE0E41462
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Apr 2021 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619165461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pueseaxcZOwlP6qfuGPWprIWYCt1cs/IoMkOSoirRnc=;
 b=QQ6KzLlxz7eunQJn2a72uTLgmAafkc+tlZUmQG57UqBMePibEnD2HRqwTNGjgYzQU2Vl5u
 deUxGLtoJWK/6tnx9D6biovNIkcN6xKJ6i5Gesv8+oWzJqF4cQUNeqpkcQrdo0n8F2e4JU
 zJQLDcjRIG46LhKTWXPD6s3b2Lv+wwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-Z8zLkpJfMtaKIIZasDKaKw-1; Fri, 23 Apr 2021 04:10:57 -0400
X-MC-Unique: Z8zLkpJfMtaKIIZasDKaKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55CBB18397A8;
 Fri, 23 Apr 2021 08:10:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-225.pek2.redhat.com
 [10.72.13.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B7825C541;
 Fri, 23 Apr 2021 08:10:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH V2 5/7] virtio_ring: introduce virtqueue_desc_add_split()
Date: Fri, 23 Apr 2021 16:09:40 +0800
Message-Id: <20210423080942.2997-6-jasowang@redhat.com>
In-Reply-To: <20210423080942.2997-1-jasowang@redhat.com>
References: <20210423080942.2997-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: ashish.kalra@amd.com, file@sect.tu-berlin.de, kvm@vger.kernel.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
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

This patch introduces a helper for storing descriptor in the
descriptor table for split virtqueue.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 39 ++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 5509c2643fb1..11dfa0dc8ec1 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -412,6 +412,20 @@ static struct vring_desc *alloc_indirect_split(struct virtqueue *_vq,
 	return desc;
 }
 
+static inline unsigned int virtqueue_add_desc_split(struct virtqueue *vq,
+						    struct vring_desc *desc,
+						    unsigned int i,
+						    dma_addr_t addr,
+						    unsigned int len,
+						    u16 flags)
+{
+	desc[i].flags = cpu_to_virtio16(vq->vdev, flags);
+	desc[i].addr = cpu_to_virtio64(vq->vdev, addr);
+	desc[i].len = cpu_to_virtio32(vq->vdev, len);
+
+	return virtio16_to_cpu(vq->vdev, desc[i].next);
+}
+
 static inline int virtqueue_add_split(struct virtqueue *_vq,
 				      struct scatterlist *sgs[],
 				      unsigned int total_sg,
@@ -484,11 +498,9 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 			if (vring_mapping_error(vq, addr))
 				goto unmap_release;
 
-			desc[i].flags = cpu_to_virtio16(_vq->vdev, VRING_DESC_F_NEXT);
-			desc[i].addr = cpu_to_virtio64(_vq->vdev, addr);
-			desc[i].len = cpu_to_virtio32(_vq->vdev, sg->length);
 			prev = i;
-			i = virtio16_to_cpu(_vq->vdev, desc[i].next);
+			i = virtqueue_add_desc_split(_vq, desc, i, addr, sg->length,
+						     VRING_DESC_F_NEXT);
 		}
 	}
 	for (; n < (out_sgs + in_sgs); n++) {
@@ -497,11 +509,11 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 			if (vring_mapping_error(vq, addr))
 				goto unmap_release;
 
-			desc[i].flags = cpu_to_virtio16(_vq->vdev, VRING_DESC_F_NEXT | VRING_DESC_F_WRITE);
-			desc[i].addr = cpu_to_virtio64(_vq->vdev, addr);
-			desc[i].len = cpu_to_virtio32(_vq->vdev, sg->length);
 			prev = i;
-			i = virtio16_to_cpu(_vq->vdev, desc[i].next);
+			i = virtqueue_add_desc_split(_vq, desc, i, addr,
+						     sg->length,
+						     VRING_DESC_F_NEXT |
+						     VRING_DESC_F_WRITE);
 		}
 	}
 	/* Last one doesn't continue. */
@@ -515,13 +527,10 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 		if (vring_mapping_error(vq, addr))
 			goto unmap_release;
 
-		vq->split.vring.desc[head].flags = cpu_to_virtio16(_vq->vdev,
-				VRING_DESC_F_INDIRECT);
-		vq->split.vring.desc[head].addr = cpu_to_virtio64(_vq->vdev,
-				addr);
-
-		vq->split.vring.desc[head].len = cpu_to_virtio32(_vq->vdev,
-				total_sg * sizeof(struct vring_desc));
+		virtqueue_add_desc_split(_vq, vq->split.vring.desc,
+					 head, addr,
+					 total_sg * sizeof(struct vring_desc),
+			                 VRING_DESC_F_INDIRECT);
 	}
 
 	/* We're using some buffers from the free list. */
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
