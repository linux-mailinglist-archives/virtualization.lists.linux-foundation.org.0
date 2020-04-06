Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB719F8EF
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 17:35:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31471863E3;
	Mon,  6 Apr 2020 15:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqndyITBrq5T; Mon,  6 Apr 2020 15:35:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 22B28863BB;
	Mon,  6 Apr 2020 15:35:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1206CC0177;
	Mon,  6 Apr 2020 15:35:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64814C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5DBFC863BB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xxz9jpYdVBKn
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:35:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D9E4B863AE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586187330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QND5NnddbwjXGO6/wJxK8GLfIvEx+9y/zCcRIrMKHyE=;
 b=NdZ2ESsVs5sPOwLLKnBBRXQiczCEIqMuzFaTuYvTMEEEoFAwtY6luR6UulY01pVirE0dth
 aaDCKY9jEvKmsxCjvLiuygOMMhwtD2QUMB8zL8XsF5l6SyMUPH+swp2gYt0/44TzKRs5qi
 H966UnP33Ag9TvvdHJUX+79VP6VySmQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-HFn1sjnzPOqxfC9Slwe5sA-1; Mon, 06 Apr 2020 11:35:28 -0400
X-MC-Unique: HFn1sjnzPOqxfC9Slwe5sA-1
Received: by mail-wm1-f70.google.com with SMTP id v8so5047174wml.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 08:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QND5NnddbwjXGO6/wJxK8GLfIvEx+9y/zCcRIrMKHyE=;
 b=I7hnAyzcNQ49SFC9R7EKfu4xCQClVegNjx6uMaFRBjaqXHUMv+v0MIVV6zwyHztolK
 ZYQEdIkXoBZVJfOVCB2t03ofYwvtW8uzZwyGS0lQDuLnwsC9tR1OGBjUZqXKxT+Q1mkE
 bCWtPTlEaQ1SMrBDATNsZaFP2tTqS1BjLOLYeG8ZmvCHau8zYCJSlX4XCBPxsDNETwf1
 bI6sop6pUFnWtReLJpsJBsi33mJPqM1JEW8DRTeD1NMYzy4AhHrXH4hrTCShr+pUg2fH
 k8jN8PXGUBPfp1snHva5RrEWdfCSVdFOxS1kX0G8WyQM/sg+NqGMtVUb/pok/rcgzw29
 MhSg==
X-Gm-Message-State: AGi0PuYnCKOWEnqYbyqBKL/Duo65FsE1fA9E01GyQ1sbyWTtAOeMDau/
 2keQPGQHqq4Zgf7EDeO9gx3jVqy5a/0edeYjRZF35JEaOj6KeAmLKI8VqB/yGtkFTx07NX8/7w/
 W518szMRtGsCB2eIPhexQCU4gYTLl7jJcjLZw6sUlsw==
X-Received: by 2002:a7b:cd87:: with SMTP id y7mr228610wmj.131.1586187326530;
 Mon, 06 Apr 2020 08:35:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypIWtMdR0UuqroTpp1bogNSZnbulbAndUvl7ol3dcxbNqWfqtQ4pqjBJyfh4Fy/jR9FK8ia7vg==
X-Received: by 2002:a7b:cd87:: with SMTP id y7mr228574wmj.131.1586187326125;
 Mon, 06 Apr 2020 08:35:26 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id m21sm24929751wmc.6.2020.04.06.08.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 08:35:25 -0700 (PDT)
Date: Mon, 6 Apr 2020 11:35:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] virtio: stop using legacy struct vring
Message-ID: <20200406153245.127680-2-mst@redhat.com>
References: <20200406153245.127680-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406153245.127680-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Arnd Bergmann <arnd@arndb.de>, Vadim Pasternak <vadimp@mellanox.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Dutt <sudeep.dutt@intel.com>, platform-driver-x86@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Darren Hart <dvhart@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Andy Shevchenko <andy@infradead.org>
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
around to avoid breaking old userspace builds.
It's not actually part of the UAPI - it was kept in the UAPI
header by mistake, and using it in kernel isn't necessary
and prevents us from making changes safely.
In particular, the APIs actually assume the legacy layout.

Add struct vring_s (identical ATM) and supporting
legacy APIs and switch everyone to use that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/misc/mic/vop/vop_main.c          |  2 +-
 drivers/platform/mellanox/mlxbf-tmfifo.c | 10 ++++-----
 drivers/virtio/virtio_ring.c             | 10 ++++-----
 include/linux/virtio.h                   |  2 +-
 include/linux/virtio_ring.h              | 28 ++++++++++++++++++++++++
 include/linux/vringh.h                   |  2 +-
 tools/virtio/ringtest/virtio_ring_0_9.c  |  6 ++---
 tools/virtio/virtio_test.c               |  2 +-
 tools/virtio/vringh_test.c               | 20 ++++++++---------
 9 files changed, 55 insertions(+), 27 deletions(-)

diff --git a/drivers/misc/mic/vop/vop_main.c b/drivers/misc/mic/vop/vop_main.c
index 85942f6717c5..817abf0b5cd1 100644
--- a/drivers/misc/mic/vop/vop_main.c
+++ b/drivers/misc/mic/vop/vop_main.c
@@ -281,7 +281,7 @@ static struct virtqueue *vop_new_virtqueue(unsigned int index,
 				      void *used)
 {
 	bool weak_barriers = false;
-	struct vring vring;
+	struct vring_s vring;
 
 	vring_init(&vring, num, pages, MIC_VIRTIO_RING_ALIGN);
 	vring.used = used;
diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 5739a9669b29..eddbb1a0c742 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -287,7 +287,7 @@ static irqreturn_t mlxbf_tmfifo_irq_handler(int irq, void *arg)
 static struct vring_desc *
 mlxbf_tmfifo_get_next_desc(struct mlxbf_tmfifo_vring *vring)
 {
-	const struct vring *vr = virtqueue_get_vring(vring->vq);
+	const struct vring_s *vr = virtqueue_get_vring(vring->vq);
 	struct virtio_device *vdev = vring->vq->vdev;
 	unsigned int idx, head;
 
@@ -308,7 +308,7 @@ mlxbf_tmfifo_get_next_desc(struct mlxbf_tmfifo_vring *vring)
 static void mlxbf_tmfifo_release_desc(struct mlxbf_tmfifo_vring *vring,
 				      struct vring_desc *desc, u32 len)
 {
-	const struct vring *vr = virtqueue_get_vring(vring->vq);
+	const struct vring_s *vr = virtqueue_get_vring(vring->vq);
 	struct virtio_device *vdev = vring->vq->vdev;
 	u16 idx, vr_idx;
 
@@ -330,7 +330,7 @@ static void mlxbf_tmfifo_release_desc(struct mlxbf_tmfifo_vring *vring,
 static u32 mlxbf_tmfifo_get_pkt_len(struct mlxbf_tmfifo_vring *vring,
 				    struct vring_desc *desc)
 {
-	const struct vring *vr = virtqueue_get_vring(vring->vq);
+	const struct vring_s *vr = virtqueue_get_vring(vring->vq);
 	struct virtio_device *vdev = vring->vq->vdev;
 	u32 len = 0, idx;
 
@@ -412,7 +412,7 @@ static void mlxbf_tmfifo_console_output_one(struct mlxbf_tmfifo_vdev *cons,
 					    struct mlxbf_tmfifo_vring *vring,
 					    struct vring_desc *desc)
 {
-	const struct vring *vr = virtqueue_get_vring(vring->vq);
+	const struct vring_s *vr = virtqueue_get_vring(vring->vq);
 	struct virtio_device *vdev = &cons->vdev;
 	u32 len, idx, seg;
 	void *addr;
@@ -671,7 +671,7 @@ static void mlxbf_tmfifo_rxtx_header(struct mlxbf_tmfifo_vring *vring,
 static bool mlxbf_tmfifo_rxtx_one_desc(struct mlxbf_tmfifo_vring *vring,
 				       bool is_rx, int *avail)
 {
-	const struct vring *vr = virtqueue_get_vring(vring->vq);
+	const struct vring_s *vr = virtqueue_get_vring(vring->vq);
 	struct mlxbf_tmfifo *fifo = vring->fifo;
 	struct virtio_device *vdev;
 	bool vring_change = false;
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 58b96baa8d48..d62d926eb9a4 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -117,7 +117,7 @@ struct vring_virtqueue {
 		/* Available for split ring */
 		struct {
 			/* Actual memory layout for this queue. */
-			struct vring vring;
+			struct vring_s vring;
 
 			/* Last written value to avail->flags */
 			u16 avail_flags_shadow;
@@ -858,7 +858,7 @@ static struct virtqueue *vring_create_virtqueue_split(
 	void *queue = NULL;
 	dma_addr_t dma_addr;
 	size_t queue_size_in_bytes;
-	struct vring vring;
+	struct vring_s vring;
 
 	/* We assume num is a power of 2. */
 	if (num & (num - 1)) {
@@ -2051,7 +2051,7 @@ EXPORT_SYMBOL_GPL(vring_interrupt);
 
 /* Only available for split ring */
 struct virtqueue *__vring_new_virtqueue(unsigned int index,
-					struct vring vring,
+					struct vring_s vring,
 					struct virtio_device *vdev,
 					bool weak_barriers,
 					bool context,
@@ -2164,7 +2164,7 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
 				      void (*callback)(struct virtqueue *vq),
 				      const char *name)
 {
-	struct vring vring;
+	struct vring_s vring;
 
 	if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED))
 		return NULL;
@@ -2320,7 +2320,7 @@ dma_addr_t virtqueue_get_used_addr(struct virtqueue *_vq)
 EXPORT_SYMBOL_GPL(virtqueue_get_used_addr);
 
 /* Only available for split ring */
-const struct vring *virtqueue_get_vring(struct virtqueue *vq)
+const struct vring_s *virtqueue_get_vring(struct virtqueue *vq)
 {
 	return &to_vvq(vq)->split.vring;
 }
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 15f906e4a748..3f5cb607bd7f 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -85,7 +85,7 @@ unsigned int virtqueue_get_vring_size(struct virtqueue *vq);
 
 bool virtqueue_is_broken(struct virtqueue *vq);
 
-const struct vring *virtqueue_get_vring(struct virtqueue *vq);
+const struct vring_s *virtqueue_get_vring(struct virtqueue *vq);
 dma_addr_t virtqueue_get_desc_addr(struct virtqueue *vq);
 dma_addr_t virtqueue_get_avail_addr(struct virtqueue *vq);
 dma_addr_t virtqueue_get_used_addr(struct virtqueue *vq);
diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 3dc70adfe5f5..09fc6164b523 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -112,4 +112,32 @@ void vring_del_virtqueue(struct virtqueue *vq);
 void vring_transport_features(struct virtio_device *vdev);
 
 irqreturn_t vring_interrupt(int irq, void *_vq);
+
+struct vring_s {
+	unsigned int num;
+
+	struct vring_desc *desc;
+
+	struct vring_avail *avail;
+
+	struct vring_used *used;
+};
+
+static inline void vring_legacy_init(struct vring_s *vr, unsigned int num, void *p,
+				     unsigned long align)
+{
+	vr->num = num;
+	vr->desc = p;
+	vr->avail = (struct vring_avail *)((char *)p + num * sizeof(struct vring_desc));
+	vr->used = (void *)(((uintptr_t)&vr->avail->ring[num] + sizeof(__virtio16)
+		+ align-1) & ~(align - 1));
+}
+
+static inline unsigned vring_legacy_size(unsigned int num, unsigned long align)
+{
+	return ((sizeof(struct vring_desc) * num + sizeof(__virtio16) * (3 + num)
+		 + align - 1) & ~(align - 1))
+		+ sizeof(__virtio16) * 3 + sizeof(struct vring_used_elem) * num;
+}
+
 #endif /* _LINUX_VIRTIO_RING_H */
diff --git a/include/linux/vringh.h b/include/linux/vringh.h
index 9e2763d7c159..552b4bb400d3 100644
--- a/include/linux/vringh.h
+++ b/include/linux/vringh.h
@@ -41,7 +41,7 @@ struct vringh {
 	u32 completed;
 
 	/* The vring (note: it may contain user pointers!) */
-	struct vring vring;
+	struct vring_s vring;
 
 	/* IOTLB for this vring */
 	struct vhost_iotlb *iotlb;
diff --git a/tools/virtio/ringtest/virtio_ring_0_9.c b/tools/virtio/ringtest/virtio_ring_0_9.c
index 13a035a390e9..e2ab6ac53966 100644
--- a/tools/virtio/ringtest/virtio_ring_0_9.c
+++ b/tools/virtio/ringtest/virtio_ring_0_9.c
@@ -67,13 +67,13 @@ void alloc_ring(void)
 	int i;
 	void *p;
 
-	ret = posix_memalign(&p, 0x1000, vring_size(ring_size, 0x1000));
+	ret = posix_memalign(&p, 0x1000, vring_legacy_size(ring_size, 0x1000));
 	if (ret) {
 		perror("Unable to allocate ring buffer.\n");
 		exit(3);
 	}
-	memset(p, 0, vring_size(ring_size, 0x1000));
-	vring_init(&ring, ring_size, p, 0x1000);
+	memset(p, 0, vring_legacy_size(ring_size, 0x1000));
+	vring_legacy_init(&ring, ring_size, p, 0x1000);
 
 	guest.avail_idx = 0;
 	guest.kicked_avail_idx = -1;
diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
index 93d81cd64ba0..3f1e4e43a615 100644
--- a/tools/virtio/virtio_test.c
+++ b/tools/virtio/virtio_test.c
@@ -32,7 +32,7 @@ struct vq_info {
 	int idx;
 	void *ring;
 	/* copy used for control */
-	struct vring vring;
+	struct vring_s vring;
 	struct virtqueue *vq;
 };
 
diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
index 293653463303..d26dc6530bd4 100644
--- a/tools/virtio/vringh_test.c
+++ b/tools/virtio/vringh_test.c
@@ -151,7 +151,7 @@ static int parallel_test(u64 features,
 		err(1, "Opening /tmp/vringh_test-file");
 
 	/* Extra room at the end for some data, and indirects */
-	mapsize = vring_size(RINGSIZE, ALIGN)
+	mapsize = vring_legacy_size(RINGSIZE, ALIGN)
 		+ RINGSIZE * 2 * sizeof(int)
 		+ RINGSIZE * 6 * sizeof(struct vring_desc);
 	mapsize = (mapsize + getpagesize() - 1) & ~(getpagesize() - 1);
@@ -185,7 +185,7 @@ static int parallel_test(u64 features,
 		close(to_guest[0]);
 		close(to_host[1]);
 
-		vring_init(&vrh.vring, RINGSIZE, host_map, ALIGN);
+		vring_legacy_init(&vrh.vring, RINGSIZE, host_map, ALIGN);
 		vringh_init_user(&vrh, features, RINGSIZE, true,
 				 vrh.vring.desc, vrh.vring.avail, vrh.vring.used);
 		CPU_SET(first_cpu, &cpu_set);
@@ -297,7 +297,7 @@ static int parallel_test(u64 features,
 		unsigned int finished = 0;
 
 		/* We pass sg[]s pointing into here, but we need RINGSIZE+1 */
-		data = guest_map + vring_size(RINGSIZE, ALIGN);
+		data = guest_map + vring_legacy_size(RINGSIZE, ALIGN);
 		indirects = (void *)data + (RINGSIZE + 1) * 2 * sizeof(int);
 
 		/* We are the guest. */
@@ -478,7 +478,7 @@ int main(int argc, char *argv[])
 	if (posix_memalign(&__user_addr_min, PAGE_SIZE, USER_MEM) != 0)
 		abort();
 	__user_addr_max = __user_addr_min + USER_MEM;
-	memset(__user_addr_min, 0, vring_size(RINGSIZE, ALIGN));
+	memset(__user_addr_min, 0, vring_legacy_size(RINGSIZE, ALIGN));
 
 	/* Set up guest side. */
 	vq = vring_new_virtqueue(0, RINGSIZE, ALIGN, &vdev, true, false,
@@ -487,7 +487,7 @@ int main(int argc, char *argv[])
 				 "guest vq");
 
 	/* Set up host side. */
-	vring_init(&vrh.vring, RINGSIZE, __user_addr_min, ALIGN);
+	vring_legacy_init(&vrh.vring, RINGSIZE, __user_addr_min, ALIGN);
 	vringh_init_user(&vrh, vdev.features, RINGSIZE, true,
 			 vrh.vring.desc, vrh.vring.avail, vrh.vring.used);
 
@@ -506,7 +506,7 @@ int main(int argc, char *argv[])
 	sgs[1] = &guest_sg[1];
 
 	/* May allocate an indirect, so force it to allocate user addr */
-	__kmalloc_fake = __user_addr_min + vring_size(RINGSIZE, ALIGN);
+	__kmalloc_fake = __user_addr_min + vring_legacy_size(RINGSIZE, ALIGN);
 	err = virtqueue_add_sgs(vq, sgs, 1, 1, &err, GFP_KERNEL);
 	if (err)
 		errx(1, "virtqueue_add_sgs: %i", err);
@@ -556,7 +556,7 @@ int main(int argc, char *argv[])
 		errx(1, "vringh_complete_user: %i", err);
 
 	/* Guest should see used token now. */
-	__kfree_ignore_start = __user_addr_min + vring_size(RINGSIZE, ALIGN);
+	__kfree_ignore_start = __user_addr_min + vring_legacy_size(RINGSIZE, ALIGN);
 	__kfree_ignore_end = __kfree_ignore_start + 1;
 	ret = virtqueue_get_buf(vq, &i);
 	if (ret != &err)
@@ -575,7 +575,7 @@ int main(int argc, char *argv[])
 		((char *)__user_addr_max - USER_MEM/4)[i] = i;
 
 	/* This will allocate an indirect, so force it to allocate user addr */
-	__kmalloc_fake = __user_addr_min + vring_size(RINGSIZE, ALIGN);
+	__kmalloc_fake = __user_addr_min + vring_legacy_size(RINGSIZE, ALIGN);
 	err = virtqueue_add_outbuf(vq, guest_sg, RINGSIZE, &err, GFP_KERNEL);
 	if (err)
 		errx(1, "virtqueue_add_outbuf (large): %i", err);
@@ -660,7 +660,7 @@ int main(int argc, char *argv[])
 	if (__virtio_test_bit(&vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
 		char *data = __user_addr_max - USER_MEM/4;
 		struct vring_desc *d = __user_addr_max - USER_MEM/2;
-		struct vring vring;
+		struct vring_s vring;
 
 		/* Force creation of direct, which we modify. */
 		__virtio_clear_bit(&vdev, VIRTIO_RING_F_INDIRECT_DESC);
@@ -680,7 +680,7 @@ int main(int argc, char *argv[])
 		if (err)
 			errx(1, "virtqueue_add_outbuf (indirect): %i", err);
 
-		vring_init(&vring, RINGSIZE, __user_addr_min, ALIGN);
+		vring_legacy_init(&vring, RINGSIZE, __user_addr_min, ALIGN);
 
 		/* They're used in order, but double-check... */
 		assert(vring.desc[0].addr == (unsigned long)d);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
