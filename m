Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B89A51A03FC
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:08:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6A82D207B0;
	Tue,  7 Apr 2020 01:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72G2wkBDj6zI; Tue,  7 Apr 2020 01:07:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AB2552413D;
	Tue,  7 Apr 2020 01:07:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B746C0177;
	Tue,  7 Apr 2020 01:07:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00A2EC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E493C8777F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Is9Sud7ZRdn6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 00FB287765
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9Mom4OhtTxtDHxzUnnXxvRU3zaONixqwgs5hBxczCA=;
 b=i410mWS7zWSVs5SU7FrXiYs2SeJRq9hVjBFVG4KVnvwo0j4ors5Jq/ZBiEepSNlewmK0v6
 E34y549Y6OXjwCl6NV+4COty+zQnQ/QRkKsm7Jr2VuNiXtpQ/zga175zRL8rUnbWQUyCf/
 +GUeBeBk6Ncfqop37tVZ0M2oUhZJ2LY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-x9Riqi7YOGq3A6SU2tT8eg-1; Mon, 06 Apr 2020 21:07:49 -0400
X-MC-Unique: x9Riqi7YOGq3A6SU2tT8eg-1
Received: by mail-wm1-f69.google.com with SMTP id n127so33508wme.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s9Mom4OhtTxtDHxzUnnXxvRU3zaONixqwgs5hBxczCA=;
 b=Td6lP2Kr4QUWihSf0PhhkSyvVsb3AVf+r/mPaSzFRCqM1zyGI3WGLYGwZUoWNKT1X1
 clsFy7T/7UEHLVeN7PIZZXsPBceKfmu+wKxWAD0/nEWlExJD6xpHXPMrqhQNjUE0Ne3j
 1hWQbMWI6SeCjjpfGH2CjvUrFgSWTCyzAkurG3mdvhc/0c3cGNwn/7XAZxHfDmISeOlP
 ZXaeP3B9FQ0jgakXULKrHF2zMH9IXtTX7qr9K8FfwUmczna5rS9V4j0V7CNVbhcH/osC
 nz16azkBwhwFV75385ve5gxjqu4Zstzlal8cl7oalOblpAruWME22I2ymj64wD8DCEF/
 6eGA==
X-Gm-Message-State: AGi0PuaYE215iW8iHBXNkBSBPe41e2xHz3TVVNC5Qa7+BTEcpwCeWWJB
 SYq1/Iixl60fKmgurhenNWX6oiTu8FIetym2oVYBxVk10pcuEtAY8/IzS964JHqSar3kZqbbLP5
 eeesK8hv1naoz05sjEmxsubqyQhyy89kNmn6y4UjRCg==
X-Received: by 2002:a1c:1fca:: with SMTP id f193mr2011212wmf.5.1586221667502; 
 Mon, 06 Apr 2020 18:07:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypI2kbXjpwa81pslGC91wSJV93qqpn7rHzCxCLN6d5M/mFdqTlYs1aMMNlbk/4ocXf6OPo/tow==
X-Received: by 2002:a1c:1fca:: with SMTP id f193mr2011192wmf.5.1586221667224; 
 Mon, 06 Apr 2020 18:07:47 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id l185sm66782wml.44.2020.04.06.18.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:46 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/19] virtio: stop using legacy struct vring in kernel
Message-ID: <20200407010700.446571-10-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
 drivers/block/virtio_blk.c       |  1 +
 include/linux/virtio.h           |  1 -
 include/linux/virtio_ring.h      | 10 ++++++++++
 include/linux/vringh.h           |  1 +
 include/uapi/linux/virtio_ring.h | 26 ++++++++++++++++----------
 5 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 0736248999b0..dd5732dc4b07 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -15,6 +15,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk-mq-virtio.h>
 #include <linux/numa.h>
+#include <uapi/linux/virtio_ring.h>
 
 #define PART_BITS 4
 #define VQ_NAME_LEN 16
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 15f906e4a748..a493eac08393 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -9,7 +9,6 @@
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/gfp.h>
-#include <linux/vringh.h>
 
 /**
  * virtqueue - a queue to register buffers for sending or receiving.
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
