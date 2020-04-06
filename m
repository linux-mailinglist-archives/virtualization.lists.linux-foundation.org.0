Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFFF1A0032
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:34:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 151D08828E;
	Mon,  6 Apr 2020 21:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4xQGcYa0ojB; Mon,  6 Apr 2020 21:34:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29CE188292;
	Mon,  6 Apr 2020 21:34:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15BE6C0177;
	Mon,  6 Apr 2020 21:34:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D421DC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D0D3A865DB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cgHL_aaX4Kpz
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 25FA2865E0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V8xaBUZcNVWW1ObGlu3v9yKYMY7OCX5Z43TKgR5akQo=;
 b=fUOrCUWLW+UJSmPxI6obmc3ePikXZdxN3k2lJkEuRMaBqQW+slH0mYgzc4knXqBGcvuoT3
 QPkWjBsKVUUeTKSwk+aJbmbbEIFbXgzUlmUOsfQSnfGPTqiVcFIcuvTjBkCOMGsP5xYNwh
 6B49Ma9qGm6Y7wLEYI0E/mEJd2uMYPE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-ItBoSKJbMPiZYu94AV9bbw-1; Mon, 06 Apr 2020 17:34:38 -0400
X-MC-Unique: ItBoSKJbMPiZYu94AV9bbw-1
Received: by mail-wr1-f70.google.com with SMTP id t13so587500wru.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V8xaBUZcNVWW1ObGlu3v9yKYMY7OCX5Z43TKgR5akQo=;
 b=AxPM5u+FzRLwWGlCbwATGXOiZWYjr9k2C4j8kohHm4BDX3CtuPCTxEjqKbm2Lxmmf5
 Pro/cksJEJJRgqSBWTNT1CwM52RUbi2vd8tCWEZZnw1h+1Se0EhPp1ODaAg+bOwe6dI4
 hFghyd206IgpTJCFa6GrG2D3k3wzFMBa+aW1OGzXVrcphAcwJTYyIXJOaw/t5xjAJQfA
 neoUFrXoecmx9HHE2268+JdNW0dcRRiqhQO732GGEW34L3OcbIVZ7Vmio53s58Pyw3qj
 Iy5mi8lExoFgJ9DzglpxlfPj5Q5Vzu2A5WuAjQMPU3OThC1AAXuufuUY7h9zM+TW0ukq
 MHAw==
X-Gm-Message-State: AGi0Pub/2EUk2/Rx6HRil5rXG3Sf/p7mTAmiF4z4Qkc0PWmaKPO2ooE1
 uBWreC49iGS9B/10lf8fsEYftohVEIi2MNbbDNC3+4ijT+LWUDtJyObjGF51kOVKt46aM25CsyP
 oy54NOLnj7vNjjpH7Y8DD9JRHR4jfbBBrOhEaWhvIZw==
X-Received: by 2002:adf:ed8b:: with SMTP id c11mr1335295wro.14.1586208877362; 
 Mon, 06 Apr 2020 14:34:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ6dpicgfzNq7i2GgfmGv356FjsQ1V9/KoUP0AtiURGxPnf7+CVg/psv+qORkcg1A5Xj6bsmQ==
X-Received: by 2002:adf:ed8b:: with SMTP id c11mr1335281wro.14.1586208877142; 
 Mon, 06 Apr 2020 14:34:37 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id b5sm16826979wrs.16.2020.04.06.14.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:36 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/12] virtio: stop using legacy struct vring in kernel
Message-ID: <20200406210108.148131-6-mst@redhat.com>
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

struct vring (in the uapi directory) and supporting APIs are kept
around to solely avoid breaking old userspace builds.
It's not actually part of the UAPI - it was kept in the UAPI
header by mistake, and using it in kernel isn't necessary
and prevents us from making changes safely.
In particular, the APIs actually assume the legacy layout.

Add an internal kernel-only struct vring and
switch everyone to use that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/virtio_ring.h      | 10 ++++++++++
 include/linux/vringh.h           |  1 +
 include/uapi/linux/virtio_ring.h | 26 ++++++++++++++++----------
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 3dc70adfe5f5..11680e74761a 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -60,6 +60,16 @@ static inline void virtio_store_mb(bool weak_barriers,
 struct virtio_device;
 struct virtqueue;
 
+struct vring {
+	unsigned int num;
+
+	struct vring_desc *desc;
+
+	struct vring_avail *avail;
+
+	struct vring_used *used;
+};
+
 /*
  * Creates a virtqueue and allocates the descriptor ring.  If
  * may_reduce_num is set, then this may allocate a smaller ring than
diff --git a/include/linux/vringh.h b/include/linux/vringh.h
index 9e2763d7c159..d71b3710f58e 100644
--- a/include/linux/vringh.h
+++ b/include/linux/vringh.h
@@ -11,6 +11,7 @@
 #ifndef _LINUX_VRINGH_H
 #define _LINUX_VRINGH_H
 #include <uapi/linux/virtio_ring.h>
+#include <linux/virtio_ring.h>
 #include <linux/virtio_byteorder.h>
 #include <linux/uio.h>
 #include <linux/slab.h>
diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
index 9223c3a5c46a..8961a4adda5c 100644
--- a/include/uapi/linux/virtio_ring.h
+++ b/include/uapi/linux/virtio_ring.h
@@ -118,16 +118,6 @@ struct vring_used {
 	struct vring_used_elem ring[];
 };
 
-struct vring {
-	unsigned int num;
-
-	struct vring_desc *desc;
-
-	struct vring_avail *avail;
-
-	struct vring_used *used;
-};
-
 /* Alignment requirements for vring elements.
  * When using pre-virtio 1.0 layout, these fall out naturally.
  */
@@ -166,6 +156,21 @@ struct vring {
 #define vring_used_event(vr) ((vr)->avail->ring[(vr)->num])
 #define vring_avail_event(vr) (*(__virtio16 *)&(vr)->used->ring[(vr)->num])
 
+#ifndef __KERNEL__
+/*
+ * The following definitions have been put in the UAPI header by mistake. We
+ * keep them around to avoid breaking old userspace builds.
+ */
+struct vring {
+	unsigned int num;
+
+	struct vring_desc *desc;
+
+	struct vring_avail *avail;
+
+	struct vring_used *used;
+};
+
 static inline void vring_init(struct vring *vr, unsigned int num, void *p,
 			      unsigned long align)
 {
@@ -182,6 +187,7 @@ static inline unsigned vring_size(unsigned int num, unsigned long align)
 		 + align - 1) & ~(align - 1))
 		+ sizeof(__virtio16) * 3 + sizeof(struct vring_used_elem) * num;
 }
+#endif
 
 #endif /* VIRTIO_RING_NO_LEGACY */
 
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
