Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E064CE02
	for <lists.virtualization@lfdr.de>; Wed, 14 Dec 2022 17:30:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72AB5404B1;
	Wed, 14 Dec 2022 16:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72AB5404B1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ob3hKkhk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wa_XsyRGChnm; Wed, 14 Dec 2022 16:30:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C6C4340BB2;
	Wed, 14 Dec 2022 16:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6C4340BB2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21E9EC007C;
	Wed, 14 Dec 2022 16:30:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A924C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Dec 2022 16:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25D53404B1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Dec 2022 16:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25D53404B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_ykzuUygsUr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Dec 2022 16:30:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9EFD40111
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9EFD40111
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Dec 2022 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671035439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDSLhjChOzyvO7sWXszZbPlZnPPU1GukY9F9aZWrZdA=;
 b=Ob3hKkhkijtnHdbPCWdJB3GFzyWLr4O1byuN+MucWqNpJoIf/om0nyDqOpXNBw2fs4Kbvn
 FS08Mbw/dUGx6f8k6Q+xzKF7SkVC6i5hSZAZOdvdZCyoqc5UhMkd9njVpiLyOQsB9Z2xWh
 SVnIb2doSmvEpIIKqKyUn6kJ2JpEKyg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-KBJWNxf5OCmTTL5iQ6Pihw-1; Wed, 14 Dec 2022 11:30:38 -0500
X-MC-Unique: KBJWNxf5OCmTTL5iQ6Pihw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so918159wmb.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Dec 2022 08:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uDSLhjChOzyvO7sWXszZbPlZnPPU1GukY9F9aZWrZdA=;
 b=2kNqYKzOCmztNZm8LLe3HPJ1CuxvNCECBUG2vP/EvqMzNCol9hreR8XdiCTL4DlEKb
 9LRTB7+UC05v/27eR2bPop/rmNPPIH2LPtgIHSqdvhLTu/KsMADj7ADMYKjLyg8MDeJy
 ZcZo+nwpAolX+iP66QVsSB0XdU0QV1lr6jyHrtA6HScRbFSo48XByFCL8UgztJOcXyFQ
 GZiDtnPLwcckUqQe/OrgeH7/xx6MCMD7d58FwN99sRDzMssdDVKWPDUPi6N/iS7krVde
 +WD+YV2gdlXzQwdpy1u+il5XSC1E1B6z7oXdl2iI/c7okDP6VLT1RJ6bOoBOKMO6ApFR
 Xymw==
X-Gm-Message-State: ANoB5pnhxw0pQ4Suhh2B0z5xa0zHYGwUExQZcvGCKWVyWYKadJTGkJU4
 uUTydlB+SRduTkrURlOlVqmR/7AmM98gLsPxXKofcxgfmKdOhJ6kpBS+IZmZBW8aEUjmTxZC1Rx
 Go9CyaHEL022c7ZgbN2CmUvTtubhS5+dNWEnGuKJJS50MwNAQiz0Llt9RbT9J3CNDFsLV7GrsqQ
 d6U/7fCQZ4llO4Kkxu+Q==
X-Received: by 2002:a5d:55c4:0:b0:242:19d6:da77 with SMTP id
 i4-20020a5d55c4000000b0024219d6da77mr15384076wrw.15.1671035434315; 
 Wed, 14 Dec 2022 08:30:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf64FO5UwTyJyWczFAW3XAofyHe4ZMJGRxWj6B/ZMPYSJWN7NbuJdbyQLq95i6Mag0G2kucxQQ==
X-Received: by 2002:a5d:55c4:0:b0:242:19d6:da77 with SMTP id
 i4-20020a5d55c4000000b0024219d6da77mr15384042wrw.15.1671035433873; 
 Wed, 14 Dec 2022 08:30:33 -0800 (PST)
Received: from step1.redhat.com (host-87-11-6-51.retail.telecomitalia.it.
 [87.11.6.51]) by smtp.gmail.com with ESMTPSA id
 e17-20020adffd11000000b002422816aa25sm3791759wrr.108.2022.12.14.08.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 08:30:33 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [RFC PATCH 3/6] vringh: support VA with iotlb
Date: Wed, 14 Dec 2022 17:30:22 +0100
Message-Id: <20221214163025.103075-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214163025.103075-1-sgarzare@redhat.com>
References: <20221214163025.103075-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, eperezma@redhat.com, stefanha@redhat.com
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

vDPA supports the possibility to use user VA in the iotlb messages.
So, let's add support for user VA in vringh to use it in the vDPA
simulators.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/vringh.h             |   5 +-
 drivers/vdpa/mlx5/core/resources.c |   3 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.c  |   2 +-
 drivers/vdpa/vdpa_sim/vdpa_sim.c   |   4 +-
 drivers/vhost/vringh.c             | 250 +++++++++++++++++++++++------
 5 files changed, 207 insertions(+), 57 deletions(-)

diff --git a/include/linux/vringh.h b/include/linux/vringh.h
index 212892cf9822..c70962f16b1f 100644
--- a/include/linux/vringh.h
+++ b/include/linux/vringh.h
@@ -32,6 +32,9 @@ struct vringh {
 	/* Can we get away with weak barriers? */
 	bool weak_barriers;
 
+	/* Use user's VA */
+	bool use_va;
+
 	/* Last available index we saw (ie. where we're up to). */
 	u16 last_avail_idx;
 
@@ -279,7 +282,7 @@ void vringh_set_iotlb(struct vringh *vrh, struct vhost_iotlb *iotlb,
 		      spinlock_t *iotlb_lock);
 
 int vringh_init_iotlb(struct vringh *vrh, u64 features,
-		      unsigned int num, bool weak_barriers,
+		      unsigned int num, bool weak_barriers, bool use_va,
 		      struct vring_desc *desc,
 		      struct vring_avail *avail,
 		      struct vring_used *used);
diff --git a/drivers/vdpa/mlx5/core/resources.c b/drivers/vdpa/mlx5/core/resources.c
index 9800f9bec225..e0bab3458b40 100644
--- a/drivers/vdpa/mlx5/core/resources.c
+++ b/drivers/vdpa/mlx5/core/resources.c
@@ -233,7 +233,8 @@ static int init_ctrl_vq(struct mlx5_vdpa_dev *mvdev)
 	if (!mvdev->cvq.iotlb)
 		return -ENOMEM;
 
-	vringh_set_iotlb(&mvdev->cvq.vring, mvdev->cvq.iotlb, &mvdev->cvq.iommu_lock);
+	vringh_set_iotlb(&mvdev->cvq.vring, mvdev->cvq.iotlb,
+			 &mvdev->cvq.iommu_lock);
 
 	return 0;
 }
diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 90913365def4..81ba0867e2c8 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -2504,7 +2504,7 @@ static int setup_cvq_vring(struct mlx5_vdpa_dev *mvdev)
 
 	if (mvdev->actual_features & BIT_ULL(VIRTIO_NET_F_CTRL_VQ))
 		err = vringh_init_iotlb(&cvq->vring, mvdev->actual_features,
-					MLX5_CVQ_MAX_ENT, false,
+					MLX5_CVQ_MAX_ENT, false, false,
 					(struct vring_desc *)(uintptr_t)cvq->desc_addr,
 					(struct vring_avail *)(uintptr_t)cvq->driver_addr,
 					(struct vring_used *)(uintptr_t)cvq->device_addr);
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index b20689f8fe89..2e0ee7280aa8 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -67,7 +67,7 @@ static void vdpasim_queue_ready(struct vdpasim *vdpasim, unsigned int idx)
 {
 	struct vdpasim_virtqueue *vq = &vdpasim->vqs[idx];
 
-	vringh_init_iotlb(&vq->vring, vdpasim->features, vq->num, false,
+	vringh_init_iotlb(&vq->vring, vdpasim->features, vq->num, false, false,
 			  (struct vring_desc *)(uintptr_t)vq->desc_addr,
 			  (struct vring_avail *)
 			  (uintptr_t)vq->driver_addr,
@@ -87,7 +87,7 @@ static void vdpasim_vq_reset(struct vdpasim *vdpasim,
 	vq->cb = NULL;
 	vq->private = NULL;
 	vringh_init_iotlb(&vq->vring, vdpasim->dev_attr.supported_features,
-			  VDPASIM_QUEUE_MAX, false, NULL, NULL, NULL);
+			  VDPASIM_QUEUE_MAX, false, false, NULL, NULL, NULL);
 
 	vq->vring.notify = NULL;
 }
diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 11f59dd06a74..c1f77dc93482 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -1094,15 +1094,99 @@ EXPORT_SYMBOL(vringh_need_notify_kern);
 
 #if IS_REACHABLE(CONFIG_VHOST_IOTLB)
 
-static int iotlb_translate(const struct vringh *vrh,
-			   u64 addr, u64 len, u64 *translated,
-			   struct bio_vec iov[],
-			   int iov_size, u32 perm)
+static int iotlb_translate_va(const struct vringh *vrh,
+			      u64 addr, u64 len, u64 *translated,
+			      struct iovec iov[],
+			      int iov_size, u32 perm)
 {
 	struct vhost_iotlb_map *map;
 	struct vhost_iotlb *iotlb = vrh->iotlb;
+	u64 s = 0, last = addr + len - 1;
+	int ret = 0;
+
+	spin_lock(vrh->iotlb_lock);
+
+	while (len > s) {
+		u64 size;
+
+		if (unlikely(ret >= iov_size)) {
+			ret = -ENOBUFS;
+			break;
+		}
+
+		map = vhost_iotlb_itree_first(iotlb, addr, last);
+		if (!map || map->start > addr) {
+			ret = -EINVAL;
+			break;
+		} else if (!(map->perm & perm)) {
+			ret = -EPERM;
+			break;
+		}
+
+		size = map->size - addr + map->start;
+		iov[ret].iov_len = min(len - s, size);
+		iov[ret].iov_base = (void __user *)(unsigned long)
+				    (map->addr + addr - map->start);
+		s += size;
+		addr += size;
+		++ret;
+	}
+
+	spin_unlock(vrh->iotlb_lock);
+
+	if (translated)
+		*translated = min(len, s);
+
+	return ret;
+}
+
+static inline int copy_from_va(const struct vringh *vrh, void *dst, void *src,
+			       u64 len, u64 *translated)
+{
+	struct iovec iov[16];
+	struct iov_iter iter;
+	int ret;
+
+	ret = iotlb_translate_va(vrh, (u64)(uintptr_t)src, len, translated, iov,
+				 ARRAY_SIZE(iov), VHOST_MAP_RO);
+	if (ret == -ENOBUFS)
+		ret = ARRAY_SIZE(iov);
+	else if (ret < 0)
+		return ret;
+
+	iov_iter_init(&iter, READ, iov, ret, *translated);
+
+	return copy_from_iter(dst, *translated, &iter);
+}
+
+static inline int copy_to_va(const struct vringh *vrh, void *dst, void *src,
+			     u64 len, u64 *translated)
+{
+	struct iovec iov[16];
+	struct iov_iter iter;
+	int ret;
+
+	ret = iotlb_translate_va(vrh, (u64)(uintptr_t)dst, len, translated, iov,
+				 ARRAY_SIZE(iov), VHOST_MAP_WO);
+	if (ret == -ENOBUFS)
+		ret = ARRAY_SIZE(iov);
+	else if (ret < 0)
+		return ret;
+
+	iov_iter_init(&iter, WRITE, iov, ret, *translated);
+
+	return copy_to_iter(src, *translated, &iter);
+}
+
+static int iotlb_translate_pa(const struct vringh *vrh,
+			      u64 addr, u64 len, u64 *translated,
+			      struct bio_vec iov[],
+			      int iov_size, u32 perm)
+{
+	struct vhost_iotlb_map *map;
+	struct vhost_iotlb *iotlb = vrh->iotlb;
+	u64 s = 0, last = addr + len - 1;
 	int ret = 0;
-	u64 s = 0;
 
 	spin_lock(vrh->iotlb_lock);
 
@@ -1114,8 +1198,7 @@ static int iotlb_translate(const struct vringh *vrh,
 			break;
 		}
 
-		map = vhost_iotlb_itree_first(iotlb, addr,
-					      addr + len - 1);
+		map = vhost_iotlb_itree_first(iotlb, addr, last);
 		if (!map || map->start > addr) {
 			ret = -EINVAL;
 			break;
@@ -1143,28 +1226,61 @@ static int iotlb_translate(const struct vringh *vrh,
 	return ret;
 }
 
+static inline int copy_from_pa(const struct vringh *vrh, void *dst, void *src,
+			       u64 len, u64 *translated)
+{
+	struct bio_vec iov[16];
+	struct iov_iter iter;
+	int ret;
+
+	ret = iotlb_translate_pa(vrh, (u64)(uintptr_t)src, len, translated, iov,
+				 ARRAY_SIZE(iov), VHOST_MAP_RO);
+	if (ret == -ENOBUFS)
+		ret = ARRAY_SIZE(iov);
+	else if (ret < 0)
+		return ret;
+
+	iov_iter_bvec(&iter, READ, iov, ret, *translated);
+
+	return copy_from_iter(dst, *translated, &iter);
+}
+
+static inline int copy_to_pa(const struct vringh *vrh, void *dst, void *src,
+			     u64 len, u64 *translated)
+{
+	struct bio_vec iov[16];
+	struct iov_iter iter;
+	int ret;
+
+	ret = iotlb_translate_pa(vrh, (u64)(uintptr_t)dst, len, translated, iov,
+				 ARRAY_SIZE(iov), VHOST_MAP_WO);
+	if (ret == -ENOBUFS)
+		ret = ARRAY_SIZE(iov);
+	else if (ret < 0)
+		return ret;
+
+	iov_iter_bvec(&iter, WRITE, iov, ret, *translated);
+
+	return copy_to_iter(src, *translated, &iter);
+}
+
 static inline int copy_from_iotlb(const struct vringh *vrh, void *dst,
 				  void *src, size_t len)
 {
 	u64 total_translated = 0;
 
 	while (total_translated < len) {
-		struct bio_vec iov[16];
-		struct iov_iter iter;
 		u64 translated;
 		int ret;
 
-		ret = iotlb_translate(vrh, (u64)(uintptr_t)src,
-				      len - total_translated, &translated,
-				      iov, ARRAY_SIZE(iov), VHOST_MAP_RO);
-		if (ret == -ENOBUFS)
-			ret = ARRAY_SIZE(iov);
-		else if (ret < 0)
-			return ret;
-
-		iov_iter_bvec(&iter, READ, iov, ret, translated);
+		if (vrh->use_va) {
+			ret = copy_from_va(vrh, dst, src,
+					   len - total_translated, &translated);
+		} else {
+			ret = copy_from_pa(vrh, dst, src,
+					   len - total_translated, &translated);
+		}
 
-		ret = copy_from_iter(dst, translated, &iter);
 		if (ret < 0)
 			return ret;
 
@@ -1182,22 +1298,17 @@ static inline int copy_to_iotlb(const struct vringh *vrh, void *dst,
 	u64 total_translated = 0;
 
 	while (total_translated < len) {
-		struct bio_vec iov[16];
-		struct iov_iter iter;
 		u64 translated;
 		int ret;
 
-		ret = iotlb_translate(vrh, (u64)(uintptr_t)dst,
-				      len - total_translated, &translated,
-				      iov, ARRAY_SIZE(iov), VHOST_MAP_WO);
-		if (ret == -ENOBUFS)
-			ret = ARRAY_SIZE(iov);
-		else if (ret < 0)
-			return ret;
-
-		iov_iter_bvec(&iter, WRITE, iov, ret, translated);
+		if (vrh->use_va) {
+			ret = copy_to_va(vrh, dst, src,
+					 len - total_translated, &translated);
+		} else {
+			ret = copy_to_pa(vrh, dst, src,
+					 len - total_translated, &translated);
+		}
 
-		ret = copy_to_iter(src, translated, &iter);
 		if (ret < 0)
 			return ret;
 
@@ -1212,20 +1323,36 @@ static inline int copy_to_iotlb(const struct vringh *vrh, void *dst,
 static inline int getu16_iotlb(const struct vringh *vrh,
 			       u16 *val, const __virtio16 *p)
 {
-	struct bio_vec iov;
-	void *kaddr, *from;
 	int ret;
 
 	/* Atomic read is needed for getu16 */
-	ret = iotlb_translate(vrh, (u64)(uintptr_t)p, sizeof(*p), NULL,
-			      &iov, 1, VHOST_MAP_RO);
-	if (ret < 0)
-		return ret;
+	if (vrh->use_va) {
+		struct iovec iov;
+
+		ret = iotlb_translate_va(vrh, (u64)(uintptr_t)p, sizeof(*p),
+					 NULL, &iov, 1, VHOST_MAP_RO);
+		if (ret < 0)
+			return ret;
 
-	kaddr = kmap_atomic(iov.bv_page);
-	from = kaddr + iov.bv_offset;
-	*val = vringh16_to_cpu(vrh, READ_ONCE(*(__virtio16 *)from));
-	kunmap_atomic(kaddr);
+		ret = __get_user(*val, (__virtio16 *)iov.iov_base);
+		if (ret)
+			return ret;
+
+		*val = vringh16_to_cpu(vrh, *val);
+	} else {
+		struct bio_vec iov;
+		void *kaddr, *from;
+
+		ret = iotlb_translate_pa(vrh, (u64)(uintptr_t)p, sizeof(*p),
+					 NULL, &iov, 1, VHOST_MAP_RO);
+		if (ret < 0)
+			return ret;
+
+		kaddr = kmap_atomic(iov.bv_page);
+		from = kaddr + iov.bv_offset;
+		*val = vringh16_to_cpu(vrh, READ_ONCE(*(__virtio16 *)from));
+		kunmap_atomic(kaddr);
+	}
 
 	return 0;
 }
@@ -1233,20 +1360,36 @@ static inline int getu16_iotlb(const struct vringh *vrh,
 static inline int putu16_iotlb(const struct vringh *vrh,
 			       __virtio16 *p, u16 val)
 {
-	struct bio_vec iov;
-	void *kaddr, *to;
 	int ret;
 
 	/* Atomic write is needed for putu16 */
-	ret = iotlb_translate(vrh, (u64)(uintptr_t)p, sizeof(*p), NULL,
-			      &iov, 1, VHOST_MAP_WO);
-	if (ret < 0)
-		return ret;
+	if (vrh->use_va) {
+		struct iovec iov;
 
-	kaddr = kmap_atomic(iov.bv_page);
-	to = kaddr + iov.bv_offset;
-	WRITE_ONCE(*(__virtio16 *)to, cpu_to_vringh16(vrh, val));
-	kunmap_atomic(kaddr);
+		ret = iotlb_translate_va(vrh, (u64)(uintptr_t)p, sizeof(*p),
+					 NULL, &iov, 1, VHOST_MAP_RO);
+		if (ret < 0)
+			return ret;
+
+		val = cpu_to_vringh16(vrh, val);
+
+		ret = __put_user(val, (__virtio16 *)iov.iov_base);
+		if (ret)
+			return ret;
+	} else {
+		struct bio_vec iov;
+		void *kaddr, *to;
+
+		ret = iotlb_translate_pa(vrh, (u64)(uintptr_t)p, sizeof(*p), NULL,
+					 &iov, 1, VHOST_MAP_WO);
+		if (ret < 0)
+			return ret;
+
+		kaddr = kmap_atomic(iov.bv_page);
+		to = kaddr + iov.bv_offset;
+		WRITE_ONCE(*(__virtio16 *)to, cpu_to_vringh16(vrh, val));
+		kunmap_atomic(kaddr);
+	}
 
 	return 0;
 }
@@ -1308,6 +1451,7 @@ static inline int putused_iotlb(const struct vringh *vrh,
  * @features: the feature bits for this ring.
  * @num: the number of elements.
  * @weak_barriers: true if we only need memory barriers, not I/O.
+ * @use_va: true if IOTLB contains user VA
  * @desc: the userpace descriptor pointer.
  * @avail: the userpace avail pointer.
  * @used: the userpace used pointer.
@@ -1315,11 +1459,13 @@ static inline int putused_iotlb(const struct vringh *vrh,
  * Returns an error if num is invalid.
  */
 int vringh_init_iotlb(struct vringh *vrh, u64 features,
-		      unsigned int num, bool weak_barriers,
+		      unsigned int num, bool weak_barriers, bool use_va,
 		      struct vring_desc *desc,
 		      struct vring_avail *avail,
 		      struct vring_used *used)
 {
+	vrh->use_va = use_va;
+
 	return vringh_init_kern(vrh, features, num, weak_barriers,
 				desc, avail, used);
 }
-- 
2.38.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
