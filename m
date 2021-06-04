Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F3C39B23A
	for <lists.virtualization@lfdr.de>; Fri,  4 Jun 2021 07:54:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27FDF6F942;
	Fri,  4 Jun 2021 05:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYZc8SCV-u3x; Fri,  4 Jun 2021 05:54:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 184D26F95B;
	Fri,  4 Jun 2021 05:54:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5FD5C0001;
	Fri,  4 Jun 2021 05:54:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D36FC0001
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F2B06F95A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Or_QLvQPIrx
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD4A56F942
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 05:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622786079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbiiXanJPfz96ay/qiIqUUYDY4TZVIjkqLicSiV3UY4=;
 b=PC0xwUA7kOQ6q1zd6J1TydMb5T6Ru5RqeOP2OMYc7OPdI4k1rdwU6+1b4P79tEHXxT0RUs
 Nwl+BXmwuKk0qIJ7vrH5cwc1x/ijZLFISi/YaCFQ1MjH00L53cKK/BfS+vAtGhCGywdT9N
 itKC7h0L0fJxUzV80UMDTmMwFkeltVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-SSTCJvdKOpOGv4dcPNFQtg-1; Fri, 04 Jun 2021 01:54:36 -0400
X-MC-Unique: SSTCJvdKOpOGv4dcPNFQtg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E073C180FD70;
 Fri,  4 Jun 2021 05:54:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-212.pek2.redhat.com
 [10.72.12.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E9FA5D9CC;
 Fri,  4 Jun 2021 05:54:28 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Subject: [PATCH 4/7] virtio_ring: secure handling of mapping errors
Date: Fri,  4 Jun 2021 13:53:47 +0800
Message-Id: <20210604055350.58753-5-jasowang@redhat.com>
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

We should not depend on the DMA address, length and flag of descriptor
table since they could be wrote with arbitrary value by the device. So
this patch switches to use the stored one in desc_extra.

Note that the indirect descriptors are fine since they are read-only
streaming mappings.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 0cdd965dba58..5509c2643fb1 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1213,13 +1213,16 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
 unmap_release:
 	err_idx = i;
 	i = head;
+	curr = vq->free_head;
 
 	vq->packed.avail_used_flags = avail_used_flags;
 
 	for (n = 0; n < total_sg; n++) {
 		if (i == err_idx)
 			break;
-		vring_unmap_desc_packed(vq, &desc[i]);
+		vring_unmap_state_packed(vq,
+					 &vq->packed.desc_extra[curr]);
+		curr = vq->packed.desc_extra[curr].next;
 		i++;
 		if (i >= vq->packed.vring.num)
 			i = 0;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
