Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515D1A0111
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 00:26:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 37C5F874CD;
	Mon,  6 Apr 2020 22:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVZtCBx416Uj; Mon,  6 Apr 2020 22:26:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B824D87698;
	Mon,  6 Apr 2020 22:26:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B18DAC0177;
	Mon,  6 Apr 2020 22:26:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D505DC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C273723492
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2+3YgQv-cEb3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id A1F3E233B0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586212009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=EKAqgXTrXHwNbpuwSlnn546IaTnylXUaf2OZ8Z4EpgzKxG4uggne0SJTvydAJVqvfN5SwR
 g5aKhhby0rrz2mHa6mlLxJN+1qqJw0+HkymTprG4KItUlP1gEeRjGE+clGC2n3vd/Y5QwM
 t3G72ZVXULN7P+8j9r0bR7xiuJshwvY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-bRpuo0RuOMGv4lJu9gzakA-1; Mon, 06 Apr 2020 18:26:48 -0400
X-MC-Unique: bRpuo0RuOMGv4lJu9gzakA-1
Received: by mail-wr1-f72.google.com with SMTP id 88so662366wrq.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 15:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=THIMdpOD+6rS9ou5Iv49ABRxsG4gEdXjeHuEUwNNen262jvDKbbL8GjztAmoowHxF4
 ZHU85XdzHDk//DxH28qJPat5Lu46NZ5/+cz87VnQmCM52z87H8f1IHK8Xdi/wcdC2zX4
 F78Gs5pUXlC2BgHP/op8ouT++G5ytc9uFehRqaGyEMcgfAoYhzAjG3by6wg8QKsgczH2
 rX0PgNTXrvBbDf3zydq329vCDF//zdWpLayDpF74hZn9x3enNb3c/TwwaXahUEpLY2bU
 a3VGK/kDr00P6GEjumuGbc/n14HBE+AgAEQNZBtRGPrPccI6tP3lGCr239B55vhyAUaj
 ncSw==
X-Gm-Message-State: AGi0PuYR0eFBITU0OFcsFSHPjS3DcY+PqVZ0AWbFIMrMrfXsbDQcwaNa
 zOs/bCw0M+qpJIaWQvYDCs9mUR04awCd84/je+LIqDtFaBscvgrwAt54BDKONrAO8vGVVC9qYNs
 LFLylZ3s+QkIgrzs1JwykKIurMocbrdCkWKcT8tnKAw==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr1419732wrs.13.1586212006474; 
 Mon, 06 Apr 2020 15:26:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypIkxBLu25fw45zb5jREJzls/InwdOIvj/VbUKyPwLvD/Yfz07D3HJPIah6ye0egaH0TNBseBQ==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr1419719wrs.13.1586212006287; 
 Mon, 06 Apr 2020 15:26:46 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id q14sm26442191wrx.57.2020.04.06.15.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:26:45 -0700 (PDT)
Date: Mon, 6 Apr 2020 18:26:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/12] virtio_ring: switch to virtio_legacy_init/size
Message-ID: <20200406222507.281867-9-mst@redhat.com>
References: <20200406222507.281867-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406222507.281867-1-mst@redhat.com>
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
