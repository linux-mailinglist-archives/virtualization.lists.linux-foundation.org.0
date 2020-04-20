Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C31B176C
	for <lists.virtualization@lfdr.de>; Mon, 20 Apr 2020 22:46:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB18686BA4;
	Mon, 20 Apr 2020 20:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8I03bd1OSv1; Mon, 20 Apr 2020 20:46:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2467C87015;
	Mon, 20 Apr 2020 20:46:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18C57C0177;
	Mon, 20 Apr 2020 20:46:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AA4DC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7939187E79
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OC7Ufk+0szkz
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:46:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 874B886E1A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587415586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=zitm8y/YEtvxoae4RHGKvdioLUb/8tpbBBFZl1ezpPQ=;
 b=HKmiqcn4JNRttKaPUqgLxLBkxhdo2Z/6g0AJBBrrYVEmKwXxTuQ6gqaUHMypT88PhwQgGr
 z38mWPqTQAi7xK72X9shZPaVcLueJjd9wS8ZmdYI+JE2jZPN9JAH5w18vJ3u6k8b6nWav2
 Gcy5p6t6mQoCyYDfAmKM12es75qPgHM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-IGJHKgpYPHe5v_Bjd_3x0w-1; Mon, 20 Apr 2020 16:46:22 -0400
X-MC-Unique: IGJHKgpYPHe5v_Bjd_3x0w-1
Received: by mail-wr1-f71.google.com with SMTP id f2so6352632wrm.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 13:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=zitm8y/YEtvxoae4RHGKvdioLUb/8tpbBBFZl1ezpPQ=;
 b=fStRJwArQITf6AN0BpNQ7Vd22wYyWu9GbBQ31owkTJo3X0JC0gtGzpnOIg6Cwkf/Ss
 4btzymD76ntKB1QEigdu1cOJeVR7rsBxN7SThfPTRYUnYYszxI+jUkHtH+3J/nZ465l7
 Sc5a9lfhn+OqpECebYP50R3VaPK2s2/w88t90qp+6Gn1/ZtG0sogyhiXITIqCI+NHsNE
 /o5tfdx4o1UYHCnHUh/J8cjBtM1fjfZpZIpcD9P12wxW0hDaBuM6snApKd9PnADgOszT
 NHsqmxQztiVEuZZJMhfyEz5qzxZ7F9if4DNyPITC33LT1CBteLMPT5MRN0Yl6iiTYr6a
 j2Pw==
X-Gm-Message-State: AGi0PuZz86nAJqqR8nfE1HP9scqYXpGIlmkLLB8IXxG0Z9L0GTmFLPcv
 3x8swzjD4j+0ESgFidaoxrW/lV0UvR57jrJVklEXw0ZwdwnppPkajYCP9KIkZcYjeiMt+50XZOT
 q1oL0lJd0sRKxVjym/aujXSwJ9s8VUO1d3BlboOB14A==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr1207568wmc.62.1587415581307;
 Mon, 20 Apr 2020 13:46:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKyJsF+0b/+QmhBX/Xb7KPgYRkuoZmP6Tl3OAkh2e8A5WhnWdTS0+NP9bpkrzJ76sID8W8HIQ==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr1207549wmc.62.1587415581012;
 Mon, 20 Apr 2020 13:46:21 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id q187sm666370wma.41.2020.04.20.13.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 13:46:20 -0700 (PDT)
Date: Mon, 20 Apr 2020 16:46:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] virtio: force spec specified alignment on types
Message-ID: <20200420204448.377168-1-mst@redhat.com>
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

changes from v2:
	add vring_used_elem_t to ensure alignment for substructures
changes from v1:
	swicth all __user to the new typedefs

 drivers/vhost/vhost.c            |  8 +++---
 drivers/vhost/vhost.h            |  6 ++---
 drivers/vhost/vringh.c           |  6 ++---
 include/linux/vringh.h           |  6 ++---
 include/uapi/linux/virtio_ring.h | 43 ++++++++++++++++++++++++--------
 5 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index d450e16c5c25..bc77b0f465fd 100644
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
+	vring_used_elem_t __user *used;
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
index 9223c3a5c46a..b2c20f794472 100644
--- a/include/uapi/linux/virtio_ring.h
+++ b/include/uapi/linux/virtio_ring.h
@@ -86,6 +86,13 @@
  * at the end of the used ring. Guest should ignore the used->flags field. */
 #define VIRTIO_RING_F_EVENT_IDX		29
 
+/* Alignment requirements for vring elements.
+ * When using pre-virtio 1.0 layout, these fall out naturally.
+ */
+#define VRING_AVAIL_ALIGN_SIZE 2
+#define VRING_USED_ALIGN_SIZE 4
+#define VRING_DESC_ALIGN_SIZE 16
+
 /* Virtio ring descriptors: 16 bytes.  These can chain together via "next". */
 struct vring_desc {
 	/* Address (guest-physical). */
@@ -112,29 +119,43 @@ struct vring_used_elem {
 	__virtio32 len;
 };
 
+typedef struct vring_used_elem __aligned(VRING_USED_ALIGN_SIZE)
+	vring_used_elem_t;
+
 struct vring_used {
 	__virtio16 flags;
 	__virtio16 idx;
-	struct vring_used_elem ring[];
+	vring_used_elem_t ring[];
 };
 
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
 struct vring {
 	unsigned int num;
 
-	struct vring_desc *desc;
+	vring_desc_t *desc;
 
-	struct vring_avail *avail;
+	vring_avail_t *avail;
 
-	struct vring_used *used;
+	vring_used_t *used;
 };
 
-/* Alignment requirements for vring elements.
- * When using pre-virtio 1.0 layout, these fall out naturally.
- */
-#define VRING_AVAIL_ALIGN_SIZE 2
-#define VRING_USED_ALIGN_SIZE 4
-#define VRING_DESC_ALIGN_SIZE 16
-
 #ifndef VIRTIO_RING_NO_LEGACY
 
 /* The standard layout for the ring is a continuous chunk of memory which looks
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
