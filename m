Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC839B23D
	for <lists.virtualization@lfdr.de>; Fri,  4 Jun 2021 07:54:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A9F26F95A;
	Fri,  4 Jun 2021 05:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUVSFCGPc2Ym; Fri,  4 Jun 2021 05:54:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C1026F962;
	Fri,  4 Jun 2021 05:54:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13436C0001;
	Fri,  4 Jun 2021 05:54:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBDEFC0001
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C604E405E9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ksDBHAix1K4J
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C7FA40168
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622786090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pueseaxcZOwlP6qfuGPWprIWYCt1cs/IoMkOSoirRnc=;
 b=E2gfRkvTl07NWI/OUfXmCIu8RGLYROa93fikLzLVn5Cfp2Q1NFcgnxOfBHf/1FfWc3hr48
 A/5J1RW+3/2JLtXPpccXFZYFzBDaYXBee14WLTLzPGE6ElizbU4m/tSHEc3zoo5Srji3ct
 PmKRuCk7Wk7PMVcSw7mPFNMTFrrNH0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-JS9x8z55MG6idP8Pa9MdVQ-1; Fri, 04 Jun 2021 01:54:46 -0400
X-MC-Unique: JS9x8z55MG6idP8Pa9MdVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CCFC518C;
 Fri,  4 Jun 2021 05:54:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-212.pek2.redhat.com
 [10.72.12.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2D55D9CC;
 Fri,  4 Jun 2021 05:54:35 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Subject: [PATCH 5/7] virtio_ring: introduce virtqueue_desc_add_split()
Date: Fri,  4 Jun 2021 13:53:48 +0800
Message-Id: <20210604055350.58753-6-jasowang@redhat.com>
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
