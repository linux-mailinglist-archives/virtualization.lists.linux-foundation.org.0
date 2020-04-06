Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 387911A004D
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:35:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF521865E0;
	Mon,  6 Apr 2020 21:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9RS-dID6FPib; Mon,  6 Apr 2020 21:35:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CDF42867E5;
	Mon,  6 Apr 2020 21:35:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B50CBC0177;
	Mon,  6 Apr 2020 21:35:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49C5EC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 325AA882EC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GtQfDYy1twZ
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2ACB1882E7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=CDIawn9T/QdRblC8h14xykuDTPnHMRn2WQULd2QcWEsaE1CPpWj6AvjeaWCxQloyO8BpbQ
 BF2+KQyhtcP+oiCgPYlVjW6JopCfvj67vB5taEBdF35A2c7x0dTvae9NztmLnc30QOZ0Lc
 p4S7yIn2kNqvwoivRvBjJ/ryvkxQLZQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-TOHx1nEhOK6eJ5AQ29xhNQ-1; Mon, 06 Apr 2020 17:35:12 -0400
X-MC-Unique: TOHx1nEhOK6eJ5AQ29xhNQ-1
Received: by mail-wr1-f72.google.com with SMTP id k11so566479wrm.19
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=cCooJpUU2ivJt2QTKoTe3qT5vmMqvXLEQaKSLgufMFESaMNJU8JvAh7w6W68D6l1bT
 ibEedk4qFcO1Lue8iKhoR2YY2FLMX6ltr4CzgY4QJwpjRRTR2bZM9A25c9Vb7vsvEDPd
 vP2bpphfe7JsigpTeC7tQd2YEq5yzZVi6G63R0Tb4LrA3PR7W9sV1NbL5X4qASubraRe
 7z2gJsl8dxqBefmWz5EPnhmkPb/xIbPtf8e3EXoDclnxRxW4s2yQzFZjRWPvq1b6cwVR
 k0wgOZ6j2KVkj2K0ki9QDiCN+/L+H+4jzGnv8IIpYNa9bCuERcJnQkoX1FyRGTSeRyKO
 49TA==
X-Gm-Message-State: AGi0PuZQKAUrVR6x7Q2KYuxYzSVSmqt6VOl60kqY1awZ0WNZ873LK8LK
 siINXn5HZm6w+lfTrObY9c50Egj0aloff9abswjq/LI3TuSMiOav7gY3pID3uSrPckCr9/y7cYH
 W4iXyVxiQa/mnWqbFQf/idF8Tbx6jYMPYerkpH6KIKg==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr1246800wrn.261.1586208911499; 
 Mon, 06 Apr 2020 14:35:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypJbkdgDZgNMY0iAAa/Eyi8WiLVhpONpbKtk9vD8/d2+UPKCWImbmOi+Byoh1R/61B6Ivp7n1w==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr1246786wrn.261.1586208911331; 
 Mon, 06 Apr 2020 14:35:11 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id v186sm1072155wme.24.2020.04.06.14.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:35:10 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:35:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/12] virtio_ring: switch to virtio_legacy_init/size
Message-ID: <20200406213314.248038-9-mst@redhat.com>
References: <20200406213314.248038-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406213314.248038-1-mst@redhat.com>
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
