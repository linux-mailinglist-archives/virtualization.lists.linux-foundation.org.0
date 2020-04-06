Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D519FFCC
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:02:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0042785C6F;
	Mon,  6 Apr 2020 21:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qgrMUZQwbCO; Mon,  6 Apr 2020 21:02:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C000285A1E;
	Mon,  6 Apr 2020 21:02:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4D41C0177;
	Mon,  6 Apr 2020 21:02:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AE9DC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5F99D8639F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KP5JNBDyA4fU
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0D1D086640
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586206932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=e2gm9YzHyvELboMT5eBKg81NjDVNgv6Q1O/0GOYMnqxkLKWnz/SX2iW16jmx1M5xwJZebM
 eJCOStyu08KLO4RdU3nKmVnNMv9QDjOIeybv0vL+93lbgUBI3CCu7k8cwhQc9HmkC0pTXd
 rzu22eFwTEJyL0bZkkVGGuIp3+Rd6JU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-TngS8OcoMy23X_NiJ978jw-1; Mon, 06 Apr 2020 17:02:11 -0400
X-MC-Unique: TngS8OcoMy23X_NiJ978jw-1
Received: by mail-wr1-f71.google.com with SMTP id v14so525537wrq.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=QVXqHaWImgt7QFSGV2i1wpOAyiPQCkICAGQbRJnqNP8/RhOJfbqV32cMtRxrdVQTz7
 Bs8U6vdO6ae67X2g181HNfoq3hE4GsWKUWSviSdHenaqy9vTPMbMvqgNCgbeGYddBCon
 ulVnvR8hp53NgViU32t2g4U9oQqLXr+mTzkVDHIttMjMzUV4QRphhDKGry5n4obpmADV
 OJM8nYTC+lQXOu/jdr98YmqjZdNcvz8zRm0HHkjBvZRVQxj+35bO9kkwf9JVKQSTmxVE
 Q4sg9YxnmH1fVAOjKAv28EMgIm9XHZrfGL6FccLivmkqmwcdYaVMHrsTtfxUbmfnm9Vj
 3K+w==
X-Gm-Message-State: AGi0PuagpxMaqbqoFf4qcZ5QyYC+SPbQateAtoO81WK0y+j+eRkmBeqn
 sv5bw8XlIWqW0lgQMKymU9ufaWCccm3ACuNLwxY8gNaqy99RgkcUvJruDn/5k06UOUyL/SzEikE
 E10kx06FE86CGwi0mOsOIJ9HtXEQFccNwyUsk+q/ZlQ==
X-Received: by 2002:a1c:6842:: with SMTP id d63mr1293528wmc.181.1586206930251; 
 Mon, 06 Apr 2020 14:02:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypK46UeT7hSc7/FRw/ZfK/Alzzl0DsY/mlvbwQnLFFlZtyfm+3qIkxx4f3atLLdur2aq7jJVnA==
X-Received: by 2002:a1c:6842:: with SMTP id d63mr1293511wmc.181.1586206930056; 
 Mon, 06 Apr 2020 14:02:10 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id w15sm18070870wra.25.2020.04.06.14.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:02:09 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:02:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/12] virtio_ring: switch to virtio_legacy_init/size
Message-ID: <20200406210108.148131-9-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
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
