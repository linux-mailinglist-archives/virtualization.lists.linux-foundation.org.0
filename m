Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838A1A0036
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:34:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2FBF87C4A;
	Mon,  6 Apr 2020 21:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTg1JvoRf+LW; Mon,  6 Apr 2020 21:34:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4719587CBE;
	Mon,  6 Apr 2020 21:34:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EC8AC0177;
	Mon,  6 Apr 2020 21:34:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C248C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1776C87CBE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItTaV-+a8baG
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 55CCA87C8A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=GZaTGOTtrejNvlzfRcYIyML1jJLyDiMQ6gTzjHMbvUb6aiQ2T5eOzylhNipiTqUPwxQdm+
 1GeKv/E3YUopRtsB6kE3FpVXejSQKTbClsePysCyItd8HJ1ra+1t7GvG97ycLkaf1qs7r9
 m4mjhvmnKkiIvrQ7Jf5PJkHiX380ZFE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-e5a-NtYJMxW70hA8fT0dGA-1; Mon, 06 Apr 2020 17:34:44 -0400
X-MC-Unique: e5a-NtYJMxW70hA8fT0dGA-1
Received: by mail-wm1-f72.google.com with SMTP id f8so40950wmh.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=kyKzl+ch+CcWcHlBgWPdNkm8CJTW6AMKtRQmIe/srSxLLGgHEJekk1FKgy6jBD7e3x
 9CtOrWAquW/A6GlJflLayRrtlq510XJAAacXYUQv6zjQKX0Bu9acQx7B37aPr9VHHlLK
 zewC8wNyvFqpvsp34YFNCV0d9deLXkLjE87uu+FF4PTS1qYIlJ3oMTeOWWe5426W3MYD
 UZCfO5GoqbiJR/DU6SmEtplXusIVqpvXiwXlIniy09xuBZYIhEYj+hGejOZlxA2p6/JY
 pGFkN1SHNE/JVgrzKyn2glv0aZ2Z94lIW/SiwW/GN0JHmrmba6TjfzD4jLHW0uPG8mPG
 2gIQ==
X-Gm-Message-State: AGi0PuaNZPwEeYzj2IRC6vZ/5LcVXVgVC4b8KaztTs31YMVYqJJBoHea
 02MdHwU3wrPnvfspCc94ERSbjgqPA4LwQncB0b8fvLiKe46NiUvdpR4OLq055AarKlsIn45J2G8
 McyTW7h6TjG/XM5t5c+OZE7RR5UmcvMPNlN2GOTFtSw==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr1429057wrw.25.1586208883781;
 Mon, 06 Apr 2020 14:34:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypLw9se6vWJefI4H5bbFId9Y8QOH6OesSwNWQIfj42clOY+n7XvT5IlX8YIGGdhCgHehhTgWYQ==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr1429045wrw.25.1586208883613;
 Mon, 06 Apr 2020 14:34:43 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id f16sm992522wmc.37.2020.04.06.14.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:43 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:41 -0400
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
