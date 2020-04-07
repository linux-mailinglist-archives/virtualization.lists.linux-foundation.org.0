Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D321A044C
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:17:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC5AB88419;
	Tue,  7 Apr 2020 01:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhQD4VxOZU6j; Tue,  7 Apr 2020 01:17:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B83AC8839A;
	Tue,  7 Apr 2020 01:17:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95570C0177;
	Tue,  7 Apr 2020 01:17:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2FEAC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E2C3B822AE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KojayD9Qf1pA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 46C5B84FA7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=Ky1BQGs41UTd5SwOZ1YP5u356yOqPMlnnuE7x43IfIZ6gwvU6VEC062AOpg25D5YqwnUG0
 H+JK3U0Tn29SZ7FWB6WQ2/pjARjwa1nXPn5gygtPyE+gSuIF5xtzVXaOkJKlOJ39m+Xj8L
 2ImDS9Y3ECwi0+BwQM7ZYytCNJPQMts=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-EGy1qJSvOqOMNxZko0okhA-1; Mon, 06 Apr 2020 21:16:55 -0400
X-MC-Unique: EGy1qJSvOqOMNxZko0okhA-1
Received: by mail-wr1-f69.google.com with SMTP id 91so873964wro.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ULp/a+ohh8j4o+miqnJW1p9vX21ZhvTitDNwFW0Sn2M=;
 b=Ze3xg0t7zr3eZ4La06+Wh4jIg1cq3V49Z/rfI4DaAzA2AH4mFslt9DrZpa/sFxsbhE
 ZUx/XwIyy5zfJydHWY0mEfJ1gJH9WIiW5W/MPMkNi6WdutfSEw3Mpw0skOxXGpAu2oA4
 KJVUqrkM0sSshkCvUn+Br1k3ZJMUJbEdz7OiGGZYnrNeIOaTVznNkolxANS1W1wpb3Cl
 R9Z5J6SlTaFkjb+MMtQKUP7yQKoN9guwbvvGb4olUfLpuAElJXhpu9YmJ25AMVa/LNzb
 CZ2iPaIxvPeNy3VeRwojT9SOcFx+IVxzRtRXh3HTNZHsuVkmPj0u1rhQr2G3ACA8ZZcy
 XNTg==
X-Gm-Message-State: AGi0PubNkqPwYZ4QorIiTlfg1mq4Csihp+ktK706Lf1jmaD1KC4vW8+s
 EBN6W6FzEgxUUgpR0U1Ogg+0B8sYq15L6jmUHmHjIqSMZTLTaxhCLdgwlf0EC/A+7UIIqyXgORe
 Io9iyjGsI+TlyThvblB6WkxuayTTvaJj4EbDH9R9/tw==
X-Received: by 2002:a7b:c631:: with SMTP id p17mr1726584wmk.11.1586222214537; 
 Mon, 06 Apr 2020 18:16:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypLjIhFyH07bUYywqhGNaJX5Wtx+enu7S0NAc2uNHsSy+3qxl0vkfgSGoPEyUjwqcIMOmjfStQ==
X-Received: by 2002:a7b:c631:: with SMTP id p17mr1726567wmk.11.1586222214298; 
 Mon, 06 Apr 2020 18:16:54 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id q187sm89265wma.41.2020.04.06.18.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:53 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 12/19] virtio_ring: switch to virtio_legacy_init/size
Message-ID: <20200407011612.478226-13-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
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
