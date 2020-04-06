Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E15AA19FFC4
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:02:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B958866A9;
	Mon,  6 Apr 2020 21:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKQguh2C1Dt4; Mon,  6 Apr 2020 21:02:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C1AAC86538;
	Mon,  6 Apr 2020 21:02:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6851C0177;
	Mon,  6 Apr 2020 21:02:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5DB9C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C1DEC2041E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uh7dUSaAYbRr
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 76CFF20015
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586206927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V8xaBUZcNVWW1ObGlu3v9yKYMY7OCX5Z43TKgR5akQo=;
 b=NrKVMWSg/21N4qgJqa+dwbl+OdD2xObhWuyAwkqCN2MBvouY9VxBPZZIf3JttwHvyWuWSZ
 d9+siv9TH2AN6VCR009FEyAtf8HjjKXu3uv8PTlRjGv+FpmpBNp2jjzbP/AeQoK9zekeY0
 GgKTAztkS1REUYcgePcuSjQklMRFIJI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-uPUNynEYPmCIFt6ZdG3n-A-1; Mon, 06 Apr 2020 17:02:05 -0400
X-MC-Unique: uPUNynEYPmCIFt6ZdG3n-A-1
Received: by mail-wm1-f69.google.com with SMTP id f81so377662wmf.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V8xaBUZcNVWW1ObGlu3v9yKYMY7OCX5Z43TKgR5akQo=;
 b=HONuDY0FLXLEguwXD0zMWj0WAkgrdLIj/d4O8ymTgfYIpCSiyrzCEQ7Oz7HmLtz69O
 7SeHy8YX6UzCBmxNNxrcFumtDuhxA/40YRrE/ulZrbv/fJzM60hg/mUKk/zdslBdkPwe
 vCsOWbJk0JyDc4kV2hoK1EwUsnJcJ+YeiEAoAcch1Guy8Jf9/D9bUsODIwSjyABrIq9Q
 AIjOFkO/mAmaVB5+9kg09NkKWo87Fq9Th2RHRyR8QGV/ll+fGZvDGnMzs21o2fLloHQn
 /yONJ3NOuwwwJ01oxv2WcUlVCAEPc1BgzbHyB9T8RLBsPv1Z3SQ/DxHETWxcak7/zyn2
 tuWw==
X-Gm-Message-State: AGi0Pua07XRAGnCQ5y/vo1PzTr04DLFEWaE0+XtfYm/7CzElDclbMgUr
 dHJxtvtwd5KBGgM1RfzGjOwP38ifAZYHxTTN3qXzFMOvSq3zVyBDNHYqo+KVzTXWQdme6hz7IcS
 C5tU8H7NmoIiluh9XoF7UlmmaSJLsKiehAtVvYX6Kdw==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr1328398wml.189.1586206923911; 
 Mon, 06 Apr 2020 14:02:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypLsVSfZRz+UvRmoZ1UzwjGyUzpgtewvck4mS2IT+AvQSbVhloxcLRFVWZLlFerlNSa1G3ycBg==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr1328371wml.189.1586206923655; 
 Mon, 06 Apr 2020 14:02:03 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id c12sm25048604wrw.90.2020.04.06.14.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:02:03 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:02:01 -0400
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
