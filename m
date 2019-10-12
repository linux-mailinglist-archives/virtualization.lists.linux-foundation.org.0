Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBFBD5232
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 21:30:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A1A071F46;
	Sat, 12 Oct 2019 19:30:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5BB3A1F20
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 19:19:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 809B614D
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 19:19:01 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08475C049E12
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 19:19:01 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id g62so12622624qkb.20
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 12:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=vCNQPQgI1/xdn8js+zrvAn2xDKTZGQy7ntbyt+SNi5c=;
	b=oIvxNi5k0ABNGF7g97Z+0X/mrV3I0KSjWPPwB2Lx3VwWM19chpOe18szqhtZC1ftRO
	G2l1ym35J74Fz2zms5W+NlXXM8t3sAY1FT3ZcI2LNpBSK2wDgnt78BiMbviE4fxa/mt+
	R0Y8/GfIAapE0j6HPbppYO2YbeiOwewuwUB3esLirDPTPTULVYI1ldNAYN4yradc5kGO
	tEnvSEoxpL3KIAysOcP8Iw6KeV+GsFfaleIZ1VsLqyS48F5rNe63fTkNDBgwLHv4ssLk
	VXuRlxb3QnaQMdGvUQzQRHb73gDmJCOmGSU+r1XkD/KLjuJW9cmW5+apxKuS0NIQpWMl
	xo1Q==
X-Gm-Message-State: APjAAAVzTzPQ7zFs2TzlqDWCeZPd2xkblBRHMJ677nnfotBnVjjntRN+
	zj+QZi35TepugGsCuBlMtrK7iccLSCN76Zb1gp+uiFHhYShB+wiqORM8SLNoY6nKDYq2T3jNhP3
	AA5FYIj/SF64R5oLevNn7yhioXwCRiTJjWLTXJ5si3Q==
X-Received: by 2002:a37:b345:: with SMTP id c66mr21341999qkf.425.1570907940270;
	Sat, 12 Oct 2019 12:19:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnrkVeRCXyBqmetVLMHeVc/t1vaPXh6ShkwpDHRE1ALKN004StNN69cQHnVPGNsHa/QH6iHQ==
X-Received: by 2002:a37:b345:: with SMTP id c66mr21341974qkf.425.1570907939944;
	Sat, 12 Oct 2019 12:18:59 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	29sm6204732qkp.86.2019.10.12.12.18.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 12:18:59 -0700 (PDT)
Date: Sat, 12 Oct 2019 15:18:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 2/2] vhost: batching fetches
Message-ID: <20191012191820.8050-3-mst@redhat.com>
References: <20191012191820.8050-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191012191820.8050-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

With this patch applied, new and old code perform identically.

Lots of extra optimizations are now possible, e.g.
we can fetch multiple heads with copy_from/to_user now.
We can get rid of maintaining the log array.  Etc etc.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/test.c  |  2 +-
 drivers/vhost/vhost.c | 50 ++++++++++++++++++++++++++++++++++++-------
 drivers/vhost/vhost.h |  4 +++-
 3 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 39a018a7af2d..e3a8e9db22cd 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -128,7 +128,7 @@ static int vhost_test_open(struct inode *inode, struct file *f)
 	dev = &n->dev;
 	vqs[VHOST_TEST_VQ] = &n->vqs[VHOST_TEST_VQ];
 	n->vqs[VHOST_TEST_VQ].handle_kick = handle_vq_kick;
-	vhost_dev_init(dev, vqs, VHOST_TEST_VQ_MAX, UIO_MAXIOV,
+	vhost_dev_init(dev, vqs, VHOST_TEST_VQ_MAX, UIO_MAXIOV + 64,
 		       VHOST_TEST_PKT_WEIGHT, VHOST_TEST_WEIGHT);
 
 	f->private_data = n;
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 36661d6cb51f..50d4a148d60d 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -302,6 +302,7 @@ static void vhost_vq_reset(struct vhost_dev *dev,
 {
 	vq->num = 1;
 	vq->ndescs = 0;
+	vq->first_desc = 0;
 	vq->desc = NULL;
 	vq->avail = NULL;
 	vq->used = NULL;
@@ -390,6 +391,7 @@ static long vhost_dev_alloc_iovecs(struct vhost_dev *dev)
 	for (i = 0; i < dev->nvqs; ++i) {
 		vq = dev->vqs[i];
 		vq->max_descs = dev->iov_limit;
+		vq->batch_descs = dev->iov_limit - UIO_MAXIOV;
 		vq->descs = kmalloc_array(vq->max_descs,
 					  sizeof(*vq->descs),
 					  GFP_KERNEL);
@@ -2366,6 +2368,8 @@ static void pop_split_desc(struct vhost_virtqueue *vq)
 	--vq->ndescs;
 }
 
+#define VHOST_DESC_FLAGS (VRING_DESC_F_INDIRECT | VRING_DESC_F_WRITE | \
+			  VRING_DESC_F_NEXT)
 static int push_split_desc(struct vhost_virtqueue *vq, struct vring_desc *desc, u16 id)
 {
 	struct vhost_desc *h;
@@ -2375,7 +2379,7 @@ static int push_split_desc(struct vhost_virtqueue *vq, struct vring_desc *desc,
 	h = &vq->descs[vq->ndescs++];
 	h->addr = vhost64_to_cpu(vq, desc->addr);
 	h->len = vhost32_to_cpu(vq, desc->len);
-	h->flags = vhost16_to_cpu(vq, desc->flags);
+	h->flags = vhost16_to_cpu(vq, desc->flags) & VHOST_DESC_FLAGS;
 	h->id = id;
 
 	return 0;
@@ -2450,7 +2454,7 @@ static int fetch_indirect_descs(struct vhost_virtqueue *vq,
 	return 0;
 }
 
-static int fetch_descs(struct vhost_virtqueue *vq)
+static int fetch_buf(struct vhost_virtqueue *vq)
 {
 	struct vring_desc desc;
 	unsigned int i, head, found = 0;
@@ -2462,7 +2466,11 @@ static int fetch_descs(struct vhost_virtqueue *vq)
 	/* Check it isn't doing very strange things with descriptor numbers. */
 	last_avail_idx = vq->last_avail_idx;
 
-	if (vq->avail_idx == vq->last_avail_idx) {
+	if (unlikely(vq->avail_idx == vq->last_avail_idx)) {
+		/* If we already have work to do, don't bother re-checking. */
+		if (likely(vq->ndescs))
+			return vq->num;
+
 		if (unlikely(vhost_get_avail_idx(vq, &avail_idx))) {
 			vq_err(vq, "Failed to access avail idx at %p\n",
 				&vq->avail->idx);
@@ -2541,6 +2549,24 @@ static int fetch_descs(struct vhost_virtqueue *vq)
 	return 0;
 }
 
+static int fetch_descs(struct vhost_virtqueue *vq)
+{
+	int ret = 0;
+
+	if (unlikely(vq->first_desc >= vq->ndescs)) {
+		vq->first_desc = 0;
+		vq->ndescs = 0;
+	}
+
+	if (vq->ndescs)
+		return 0;
+
+	while (!ret && vq->ndescs <= vq->batch_descs)
+		ret = fetch_buf(vq);
+
+	return vq->ndescs ? 0 : ret;
+}
+
 /* This looks in the virtqueue and for the first available buffer, and converts
  * it to an iovec for convenient access.  Since descriptors consist of some
  * number of output then some number of input descriptors, it's actually two
@@ -2562,6 +2588,8 @@ int vhost_get_vq_desc_batch(struct vhost_virtqueue *vq,
 	if (ret)
 		return ret;
 
+	/* Note: indirect descriptors are not batched */
+	/* TODO: batch up to a limit */
 	last = peek_split_desc(vq);
 	id = last->id;
 
@@ -2584,12 +2612,12 @@ int vhost_get_vq_desc_batch(struct vhost_virtqueue *vq,
 	if (unlikely(log))
 		*log_num = 0;
 
-	for (i = 0; i < vq->ndescs; ++i) {
+	for (i = vq->first_desc; i < vq->ndescs; ++i) {
 		unsigned iov_count = *in_num + *out_num;
 		struct vhost_desc *desc = &vq->descs[i];
 		int access;
 
-		if (desc->flags & ~(VRING_DESC_F_INDIRECT | VRING_DESC_F_WRITE)) {
+		if (desc->flags & ~VHOST_DESC_FLAGS) {
 			vq_err(vq, "Unexpected flags: 0x%x at descriptor id 0x%x\n",
 			       desc->flags, desc->id);
 			ret = -EINVAL;
@@ -2628,15 +2656,21 @@ int vhost_get_vq_desc_batch(struct vhost_virtqueue *vq,
 			}
 			*out_num += ret;
 		}
+
+		ret = desc->id;
+
+		if (!(desc->flags & VRING_DESC_F_NEXT))
+			break;
 	}
 
-	ret = id;
-	vq->ndescs = 0;
+	vq->first_desc = i + 1;
 
 	return ret;
 
 err:
-	vhost_discard_vq_desc(vq, 1);
+	for (i = vq->first_desc; i < vq->ndescs; ++i)
+		if (!(vq->descs[i].flags & VRING_DESC_F_NEXT))
+			vhost_discard_vq_desc(vq, 1);
 	vq->ndescs = 0;
 
 	return ret;
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 1724f61b6c2d..8b88e0c903da 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -100,7 +100,9 @@ struct vhost_virtqueue {
 
 	struct vhost_desc *descs;
 	int ndescs;
+	int first_desc;
 	int max_descs;
+	int batch_descs;
 
 	const struct vhost_umem_node *meta_iotlb[VHOST_NUM_ADDRS];
 	struct file *kick;
@@ -245,7 +247,7 @@ ssize_t vhost_chr_write_iter(struct vhost_dev *dev,
 int vhost_init_device_iotlb(struct vhost_dev *d, bool enabled);
 
 #define vq_err(vq, fmt, ...) do {                                  \
-		pr_debug(pr_fmt(fmt), ##__VA_ARGS__);       \
+		pr_err(pr_fmt(fmt), ##__VA_ARGS__);       \
 		if ((vq)->error_ctx)                               \
 				eventfd_signal((vq)->error_ctx, 1);\
 	} while (0)
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
