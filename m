Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE11A03FE
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:08:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 93D21241A8;
	Tue,  7 Apr 2020 01:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xlu+yKLW1PkO; Tue,  7 Apr 2020 01:08:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2675120517;
	Tue,  7 Apr 2020 01:08:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 078EBC0177;
	Tue,  7 Apr 2020 01:08:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C13B4C089E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AAB9E885BD
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id japgQkVzkFbj
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DA0668851B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=Zj40fYoODoxVi4XHTvSdf5tMUxOn5Z1jCVM5YUiFTZgAVX1keAY38q6HXye5XcJMDftBcC
 wNEU1mjVazEQOFe45/U/lGIIDAoZzuQpicRdNsZYcvm3KCN6BA19erKrBHV71V7MKnCnyc
 pq4dlSEDPPtYGWGyMvLl5xBj3JbyAuw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-Zcm5JtMEOyG9OD8qWBAPqQ-1; Mon, 06 Apr 2020 21:07:55 -0400
X-MC-Unique: Zcm5JtMEOyG9OD8qWBAPqQ-1
Received: by mail-wm1-f72.google.com with SMTP id f9so27063wme.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=peBFcR19Yh7i5Qol58XXme7FoQLJn4PrPg90+KfnKspx2BpDjN899d4v73ilT9xhHU
 xGvQFv+Ic9S8JaCgQv6M6Vsvk1Se3CIDos//nb5ZsO7t0XNtIyJjpRn/55g13zdlgSgu
 GiHJAQd1nizr5P/4H49uevj1yx9aAFXD1JL4LAxy9/Va7Oyv4a/MDGhHvCmAA1qd5PCq
 YC1YZIDDylq/ecSepI8/uXxWfT0Vkg7L/lRPxfROl/duzcCCUpURpuUMr8I3YlQ86UHV
 C+jfnq2/+hzXN05SRA7WIRe/hCOWzcyrv7HU/zSotzQLE6I3XLYQqKGtYU+EqLwdtBPd
 r+Ag==
X-Gm-Message-State: AGi0PuYvXcAB8TeF7HChSeLX6/sfca0d/JTFxHPBRBiMHcE/Lti+aHD8
 g6atx6eQNnV7xT+APh6IV9vvKezHTUhoi603eLtiAC/Lolg+grSuq23ymjOFpvbEfJrUgoe9v5y
 wugiK+87tqciRxbY4y69XaLHNYAc+RcO8+4UkO8tDDQ==
X-Received: by 2002:adf:b64f:: with SMTP id i15mr2141421wre.351.1586221673877; 
 Mon, 06 Apr 2020 18:07:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypIfcRjSa8EBjoFB9rOfrumGltBNTU2RyNzqAtIHJkjB9ul09RYHrNTl2krVquGlGZNCgZMiqA==
X-Received: by 2002:adf:b64f:: with SMTP id i15mr2141409wre.351.1586221673660; 
 Mon, 06 Apr 2020 18:07:53 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id r2sm122541wmg.2.2020.04.06.18.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:53 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 12/19] virtio_ring: switch to virtio_legacy_init/size
Message-ID: <20200407010700.446571-13-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

These are used for legacy ring format, switch to APIs
that make this explicit.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_ring.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 58b96baa8d48..2a2b12449bac 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -867,8 +867,10 @@ static struct virtqueue *vring_create_virtqueue_split(
 	}
 
 	/* TODO: allocate each queue chunk individually */
-	for (; num && vring_size(num, vring_align) > PAGE_SIZE; num /= 2) {
-		queue = vring_alloc_queue(vdev, vring_size(num, vring_align),
+	for (; num && vring_legacy_size(num, vring_align) > PAGE_SIZE;
+	     num /= 2) {
+		queue = vring_alloc_queue(vdev,
+					  vring_legacy_size(num, vring_align),
 					  &dma_addr,
 					  GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
 		if (queue)
@@ -882,14 +884,15 @@ static struct virtqueue *vring_create_virtqueue_split(
 
 	if (!queue) {
 		/* Try to get a single page. You are my only hope! */
-		queue = vring_alloc_queue(vdev, vring_size(num, vring_align),
+		queue = vring_alloc_queue(vdev,
+					  vring_legacy_size(num, vring_align),
 					  &dma_addr, GFP_KERNEL|__GFP_ZERO);
 	}
 	if (!queue)
 		return NULL;
 
-	queue_size_in_bytes = vring_size(num, vring_align);
-	vring_init(&vring, num, queue, vring_align);
+	queue_size_in_bytes = vring_legacy_size(num, vring_align);
+	vring_legacy_init(&vring, num, queue, vring_align);
 
 	vq = __vring_new_virtqueue(index, vring, vdev, weak_barriers, context,
 				   notify, callback, name);
@@ -2169,7 +2172,7 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
 	if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED))
 		return NULL;
 
-	vring_init(&vring, num, pages, vring_align);
+	vring_legacy_init(&vring, num, pages, vring_align);
 	return __vring_new_virtqueue(index, vring, vdev, weak_barriers, context,
 				     notify, callback, name);
 }
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
