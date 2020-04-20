Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2491B16B5
	for <lists.virtualization@lfdr.de>; Mon, 20 Apr 2020 22:10:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3EEED86E21;
	Mon, 20 Apr 2020 20:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GfcGvQNXdFR; Mon, 20 Apr 2020 20:10:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C5138760E;
	Mon, 20 Apr 2020 20:10:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09162C0177;
	Mon, 20 Apr 2020 20:10:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DD27C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8CA91849D2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPYOuw2g7B45
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B52DE84430
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587413352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=3cdUNjir+RJ29IhWI2+VQqP/CP/QCzQGQxj8crbt+CU=;
 b=ZwmxI4M7/usPm0jf49pg3ANFqH3rQY4bWt3+d9VrE6okk9eZtADXu5JDCPDTtlTfCOnKkS
 r2szUzTqMP8mjdjoa8+18kvWttXSVfiKm40punHVTYiXqbwCyYAP6tKjwOAZCEmobkGtZi
 to5sediPD4xlIk7tdFn6VqJjhNr8KlU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-nwWNfOPrO_2L8uZfBpU79w-1; Mon, 20 Apr 2020 16:09:08 -0400
X-MC-Unique: nwWNfOPrO_2L8uZfBpU79w-1
Received: by mail-wm1-f69.google.com with SMTP id q5so359705wmc.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 13:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=3cdUNjir+RJ29IhWI2+VQqP/CP/QCzQGQxj8crbt+CU=;
 b=Bj7RTT+L6c6vv9/L24hve3dq6e3t3vcIxC6hogs7C/Efa6fM3bDDZGWtth5xg7aKhD
 6DrNQtvyQR7HAhQcUL5UMfwtipFbOf1JzFSmqhViVoOX/8qN/4qLdwgm3eqRn9jIQ0s/
 fQ+8Ttv1yMGbwvUUjuPIjou9VRJe5ZqCCaXvoQoo3kyj4XSQT6XjCWE+GWl1ihqTj7ML
 ieGb2/JAfafKlSiBxLZSwAzhIdWGvEJ7AlPnfS0KoQSkLAr/0GzeHQ2YA+Sn7S1BJ6mB
 zBTQR1Q6SlFPwWHBMsH5O3Lh6e+vGhZNPtfe48xAN/zroFFHcizcjptsNgoegbek3BaZ
 2m5A==
X-Gm-Message-State: AGi0PuYixeT/ZcdfYgf/yF6EUCF+/IYsx71+zR2alQWOb/eFHVnT//9t
 N/H4E5/sEhnb6uph4Dpi4xI330+t0yduZx8Xm0cg5K9m/+KH68XhtlfPO6zSguQZI9hKqIAOQgN
 CwEOmSSHtWyPIcROsEi2psnObszMeqHR8TQ588pPP2w==
X-Received: by 2002:adf:f48f:: with SMTP id l15mr14175275wro.161.1587413347520; 
 Mon, 20 Apr 2020 13:09:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypLkaZVhyiGNviDtldj3DJMdeZ39eLj1tjCm5p8aa1AKRsrwnukiu6MtIA4c2rwxsEck4bJl5Q==
X-Received: by 2002:adf:f48f:: with SMTP id l15mr14175249wro.161.1587413347145; 
 Mon, 20 Apr 2020 13:09:07 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id c83sm618373wmd.23.2020.04.20.13.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 13:09:06 -0700 (PDT)
Date: Mon, 20 Apr 2020 16:09:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] virtio: force spec specified alignment on types
Message-ID: <20200420200550.254983-1-mst@redhat.com>
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

Note that userspace that allocates the memory is actually OK and does
not need to be fixed, but userspace that gets it from guest or another
process does need to be fixed. The later doesn't generally talk to the
kernel so while it might be buggy it's not talking to the kernel in the
buggy way - it's just using the header in the buggy way - so fixing
header and asking userspace to recompile is the best we can do.

I verified that the produced kernel binary on x86 is exactly identical
before and after the change.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Changes from v1:
	update vhost, vringh pointers to use the new typedefs

 drivers/vhost/vhost.c            |  8 +++----
 drivers/vhost/vhost.h            |  6 ++---
 drivers/vhost/vringh.c           |  6 ++---
 include/linux/vringh.h           |  6 ++---
 include/uapi/linux/virtio_ring.h | 38 +++++++++++++++++++++++---------
 5 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index d450e16c5c25..21706759377e 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -1244,9 +1244,9 @@ static int vhost_iotlb_miss(struct vhost_virtqueue *vq, u64 iova, int access)
 }
 
 static bool vq_access_ok(struct vhost_virtqueue *vq, unsigned int num,
-			 struct vring_desc __user *desc,
-			 struct vring_avail __user *avail,
-			 struct vring_used __user *used)
+			 vring_desc_t __user *desc,
+			 vring_avail_t __user *avail,
+			 vring_used_t __user *used)
 
 {
 	return access_ok(desc, vhost_get_desc_size(vq, num)) &&
@@ -2301,7 +2301,7 @@ static int __vhost_add_used_n(struct vhost_virtqueue *vq,
 			    struct vring_used_elem *heads,
 			    unsigned count)
 {
-	struct vring_used_elem __user *used;
+	vring_used_t __user *used;
 	u16 old, new;
 	int start;
 
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index f8403bd46b85..60cab4c78229 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -67,9 +67,9 @@ struct vhost_virtqueue {
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
 	struct file *kick;
 	struct eventfd_ctx *call_ctx;
diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index ba8e0d6cfd97..e059a9a47cdf 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -620,9 +620,9 @@ static inline int xfer_to_user(const struct vringh *vrh,
  */
 int vringh_init_user(struct vringh *vrh, u64 features,
 		     unsigned int num, bool weak_barriers,
-		     struct vring_desc __user *desc,
-		     struct vring_avail __user *avail,
-		     struct vring_used __user *used)
+		     vring_desc_t __user *desc,
+		     vring_avail_t __user *avail,
+		     vring_used_t __user *used)
 {
 	/* Sane power of 2 please! */
 	if (!num || num > 0xffff || (num & (num - 1))) {
diff --git a/include/linux/vringh.h b/include/linux/vringh.h
index 9e2763d7c159..59bd50f99291 100644
--- a/include/linux/vringh.h
+++ b/include/linux/vringh.h
@@ -105,9 +105,9 @@ struct vringh_kiov {
 /* Helpers for userspace vrings. */
 int vringh_init_user(struct vringh *vrh, u64 features,
 		     unsigned int num, bool weak_barriers,
-		     struct vring_desc __user *desc,
-		     struct vring_avail __user *avail,
-		     struct vring_used __user *used);
+		     vring_desc_t __user *desc,
+		     vring_avail_t __user *avail,
+		     vring_used_t __user *used);
 
 static inline void vringh_iov_init(struct vringh_iov *iov,
 				   struct iovec *iovec, unsigned num)
diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
index 9223c3a5c46a..177227f0d9cd 100644
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
@@ -135,6 +125,34 @@ struct vring {
 #define VRING_USED_ALIGN_SIZE 4
 #define VRING_DESC_ALIGN_SIZE 16
 
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
+typedef struct vring_desc __aligned(VRING_DESC_ALIGN_SIZE) vring_desc_t;
+typedef struct vring_avail __aligned(VRING_AVAIL_ALIGN_SIZE) vring_avail_t;
+typedef struct vring_used __aligned(VRING_USED_ALIGN_SIZE) vring_used_t;
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
 #ifndef VIRTIO_RING_NO_LEGACY
 
 /* The standard layout for the ring is a continuous chunk of memory which looks
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
