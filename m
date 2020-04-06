Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D879419F61B
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 14:51:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2EEE4861DE;
	Mon,  6 Apr 2020 12:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuTdm6nRpMXa; Mon,  6 Apr 2020 12:51:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A543686200;
	Mon,  6 Apr 2020 12:51:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 906DCC0177;
	Mon,  6 Apr 2020 12:51:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BD68C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8248E2324E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbzPkSYsonEc
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:51:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 0995C23086
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586177462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=7A/JZx9mU7o1VoLWOXJ3u/SJqb7Gm6YpvdN2hJBccMY=;
 b=eMHmHx30CqfaGnkyucLNlUoVZj2nZjiM/6Xu7BH02W7aJDgBJ1xzgp5XElhM7+lnQLi0QG
 Rop0oxdvVCzNj+oLsijnERqJ44qDakQ/tftvCDQ3iJ+Nuf0eozgiHk2UOE09RGXMCjc/uf
 +s8kkJoSdB7yTi0/vctv8lEdZMqXj8U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-fZoEnqOZO6qp622ElAIc6Q-1; Mon, 06 Apr 2020 08:50:59 -0400
X-MC-Unique: fZoEnqOZO6qp622ElAIc6Q-1
Received: by mail-wm1-f70.google.com with SMTP id e16so4078353wmh.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 05:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=7A/JZx9mU7o1VoLWOXJ3u/SJqb7Gm6YpvdN2hJBccMY=;
 b=J3vCGl2MQVlH7nKqH+UjQznnm3x1vg9QUMKR5tO/4FVdpBPW8L9ReaxciPAovV4Wka
 DL0YvJp1mqV6HafBCJRFyR4aPm51syKjcONcRjzErEINHGBmMO2K74e0TS9QX6i93nja
 bLw2LlQ9k2TscUn3IHefEjBvZwCuWj5lcPk0Nsuw37CNoZf3+g/U2LMeUrxwCuv34HJk
 wv86m1n7k5LvdBRYCcSJHlt7nO7YtPXUDxgTQdHpDAOhaC1jEqt6VcV6Gy9KeociNRGm
 vaxC10wj6wsFwA0LdXt9v9FO7u40AJJErZPgOHWvFDAMCmX6/hn71rd7MfTefniDHJeC
 GtpQ==
X-Gm-Message-State: AGi0PuYQweWyuCmMJWv8RHlyIIFhBoTOcqFnczVCuRn6skXupHCfdFcc
 W/Zbf07SGOyguHvvVmJlZWuZAQbs3w8gbaMp5LdK5nkyX0mzUTCVwv0KsJXLz9b169Inw6hN+8u
 cMkx/skISAy4iYbKSOLwWLoHYoTc1b3kHG0s9NfkRjA==
X-Received: by 2002:adf:81b6:: with SMTP id 51mr17298388wra.229.1586177457394; 
 Mon, 06 Apr 2020 05:50:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypI7/DS77HBZ8L/FNXyj60fPbTTo/BHYI/NHwMQ/9pXpk2TSq6zGsv9CKDz2v5JeoEWm2YjQcw==
X-Received: by 2002:adf:81b6:: with SMTP id 51mr17298368wra.229.1586177457169; 
 Mon, 06 Apr 2020 05:50:57 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id y22sm7895262wma.0.2020.04.06.05.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 05:50:56 -0700 (PDT)
Date: Mon, 6 Apr 2020 08:50:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vhost: force spec specified alignment on types
Message-ID: <20200406124931.120768-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

The ring element addresses are passed between components with different
alignments assumptions. Thus, if guest/userspace selects a pointer and
host then gets and dereferences it, we might need to decrease the
compiler-selected alignment to prevent compiler on the host from
assuming pointer is aligned.

This actually triggers on ARM with -mabi=apcs-gnu - which is a
deprecated configuration, but it seems safer to handle this
generally.

I verified that the produced binary is exactly identical on x86.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

This is my preferred way to handle the ARM incompatibility issues
(in preference to kconfig hacks).
I will push this into next now.
Comments?

 drivers/vhost/vhost.h            |  6 ++---
 include/uapi/linux/virtio_ring.h | 41 ++++++++++++++++++++++++--------
 2 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index cc82918158d2..a67bda9792ec 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -74,9 +74,9 @@ struct vhost_virtqueue {
 	/* The actual ring of buffers. */
 	struct mutex mutex;
 	unsigned int num;
-	struct vring_desc __user *desc;
-	struct vring_avail __user *avail;
-	struct vring_used __user *used;
+	vring_desc_t __user *desc;
+	vring_avail_t __user *avail;
+	vring_used_t __user *used;
 	const struct vhost_iotlb_map *meta_iotlb[VHOST_NUM_ADDRS];
 
 	struct vhost_desc *descs;
diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
index 559f42e73315..cd6e0b2eaf2f 100644
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
@@ -164,6 +154,37 @@ struct vring {
 #define vring_used_event(vr) ((vr)->avail->ring[(vr)->num])
 #define vring_avail_event(vr) (*(__virtio16 *)&(vr)->used->ring[(vr)->num])
 
+/*
+ * The ring element addresses are passed between components with different
+ * alignments assumptions. Thus, we might need to decrease the compiler-selected
+ * alignment, and so must use a typedef to make sure the __aligned attribute
+ * actually takes hold:
+ *
+ * https://gcc.gnu.org/onlinedocs//gcc/Common-Type-Attributes.html#Common-Type-Attributes
+ *
+ * When used on a struct, or struct member, the aligned attribute can only
+ * increase the alignment; in order to decrease it, the packed attribute must
+ * be specified as well. When used as part of a typedef, the aligned attribute
+ * can both increase and decrease alignment, and specifying the packed
+ * attribute generates a warning.
+ */
+typedef struct vring_desc __attribute__((aligned(VRING_DESC_ALIGN_SIZE)))
+	vring_desc_t;
+typedef struct vring_avail __attribute__((aligned(VRING_AVAIL_ALIGN_SIZE)))
+	vring_avail_t;
+typedef struct vring_used __attribute__((aligned(VRING_USED_ALIGN_SIZE)))
+	vring_used_t;
+
+struct vring {
+	unsigned int num;
+
+	vring_desc_t *desc;
+
+	vring_avail_t *avail;
+
+	vring_used_t *used;
+};
+
 static inline void vring_init(struct vring *vr, unsigned int num, void *p,
 			      unsigned long align)
 {
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
