Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A97D41EA
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 15:56:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AD69915B5;
	Fri, 11 Oct 2019 13:56:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 86E971596
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:46:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 832FF604
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:46:06 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4E5A9B281
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:46:05 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id s14so8946077qkg.12
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 06:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=4QQJmzFzcB+s98hCdlFYskwk8yd9+Vjxg/V7InxbF+w=;
	b=qpunu/OYXBxcm31XLEpp1o07OLS1FUYZo7ZazmLe9W3ryQt0hLbYkSakxsooSffd54
	t3SSI5lpV48ZF9tqJUED6FEIMCD4m3ugkhLVy2mPRza2NaRMfex7lsxkpeKQIxS/Be2J
	LVmSuTzaU8/LofiOzMFe7K4ithwGjMohVUJuA+yYMd62gi0V8VDT158uGv8w3X94Ud2H
	cn9+T8RW6GGK3Vu7K+zfOFoMMKMXkJ+7JIE61Y9AU6W/XRRJtcvvRbmLcuPp1Y8yinhn
	Lg3YxFtOKIExE0UhiyejerwnH19Wh9YVn4w5wcREJhBP7VuTwtzcd1AP1x2vmnVZJD6n
	TJTA==
X-Gm-Message-State: APjAAAUepvP8SgttBvbaWXwp3klRi3bBbXRupb+/yufoDMHVLHd34YeP
	rLhnYcVuBzndxAwJuKpUIkCIWD97Zsuq0Y86ZkG9GnRDW1VT2UQwDH75nUKWq8QOmQ6KrX2omAv
	MdRdHOFEvRtfzDsEMspLR3x4fU+5sp/kXhIt3KIYuzw==
X-Received: by 2002:a05:6214:841:: with SMTP id
	dg1mr15842897qvb.55.1570801564972; 
	Fri, 11 Oct 2019 06:46:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsR4qL0IbkdqWA0+KkKg2ppd90RIWdUOTuTCDdYP0zUBqv/SGi1pdYD4XNDCPUozXGp2EouQ==
X-Received: by 2002:a05:6214:841:: with SMTP id
	dg1mr15842829qvb.55.1570801564334; 
	Fri, 11 Oct 2019 06:46:04 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	w85sm4201550qkb.57.2019.10.11.06.46.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 06:46:03 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:45:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v1 1/2] vhost: option to fetch descriptors through an
	independent struct
Message-ID: <20191011134358.16912-2-mst@redhat.com>
References: <20191011134358.16912-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011134358.16912-1-mst@redhat.com>
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

The idea is to support multiple ring formats by converting
to a format-independent array of descriptors.

This costs extra cycles, but we gain in ability
to fetch a batch of descriptors in one go, which
is good for code cache locality.

To simplify benchmarking, I kept the old code
around so one can switch back and forth by
writing into a module parameter.
This will go away in the final submission.

This patch causes a minor performance degradation,
it's been kept as simple as possible for ease of review.
Next patch gets us back the performance by adding batching.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/test.c  |  17 ++-
 drivers/vhost/vhost.c | 299 +++++++++++++++++++++++++++++++++++++++++-
 drivers/vhost/vhost.h |  16 +++
 3 files changed, 327 insertions(+), 5 deletions(-)

diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 056308008288..39a018a7af2d 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -18,6 +18,9 @@
 #include "test.h"
 #include "vhost.h"
 
+static int newcode = 0;
+module_param(newcode, int, 0644);
+
 /* Max number of bytes transferred before requeueing the job.
  * Using this limit prevents one virtqueue from starving others. */
 #define VHOST_TEST_WEIGHT 0x80000
@@ -58,10 +61,16 @@ static void handle_vq(struct vhost_test *n)
 	vhost_disable_notify(&n->dev, vq);
 
 	for (;;) {
-		head = vhost_get_vq_desc(vq, vq->iov,
-					 ARRAY_SIZE(vq->iov),
-					 &out, &in,
-					 NULL, NULL);
+		if (newcode)
+			head = vhost_get_vq_desc_batch(vq, vq->iov,
+						       ARRAY_SIZE(vq->iov),
+						       &out, &in,
+						       NULL, NULL);
+		else
+			head = vhost_get_vq_desc(vq, vq->iov,
+						 ARRAY_SIZE(vq->iov),
+						 &out, &in,
+						 NULL, NULL);
 		/* On error, stop handling until the next kick. */
 		if (unlikely(head < 0))
 			break;
diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 36ca2cf419bf..36661d6cb51f 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -301,6 +301,7 @@ static void vhost_vq_reset(struct vhost_dev *dev,
 			   struct vhost_virtqueue *vq)
 {
 	vq->num = 1;
+	vq->ndescs = 0;
 	vq->desc = NULL;
 	vq->avail = NULL;
 	vq->used = NULL;
@@ -369,6 +370,9 @@ static int vhost_worker(void *data)
 
 static void vhost_vq_free_iovecs(struct vhost_virtqueue *vq)
 {
+	kfree(vq->descs);
+	vq->descs = NULL;
+	vq->max_descs = 0;
 	kfree(vq->indirect);
 	vq->indirect = NULL;
 	kfree(vq->log);
@@ -385,6 +389,10 @@ static long vhost_dev_alloc_iovecs(struct vhost_dev *dev)
 
 	for (i = 0; i < dev->nvqs; ++i) {
 		vq = dev->vqs[i];
+		vq->max_descs = dev->iov_limit;
+		vq->descs = kmalloc_array(vq->max_descs,
+					  sizeof(*vq->descs),
+					  GFP_KERNEL);
 		vq->indirect = kmalloc_array(UIO_MAXIOV,
 					     sizeof(*vq->indirect),
 					     GFP_KERNEL);
@@ -392,7 +400,7 @@ static long vhost_dev_alloc_iovecs(struct vhost_dev *dev)
 					GFP_KERNEL);
 		vq->heads = kmalloc_array(dev->iov_limit, sizeof(*vq->heads),
 					  GFP_KERNEL);
-		if (!vq->indirect || !vq->log || !vq->heads)
+		if (!vq->indirect || !vq->log || !vq->heads || !vq->descs)
 			goto err_nomem;
 	}
 	return 0;
@@ -2346,6 +2354,295 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 }
 EXPORT_SYMBOL_GPL(vhost_get_vq_desc);
 
+static struct vhost_desc *peek_split_desc(struct vhost_virtqueue *vq)
+{
+	BUG_ON(!vq->ndescs);
+	return &vq->descs[vq->ndescs - 1];
+}
+
+static void pop_split_desc(struct vhost_virtqueue *vq)
+{
+	BUG_ON(!vq->ndescs);
+	--vq->ndescs;
+}
+
+static int push_split_desc(struct vhost_virtqueue *vq, struct vring_desc *desc, u16 id)
+{
+	struct vhost_desc *h;
+
+	if (unlikely(vq->ndescs >= vq->max_descs))
+		return -EINVAL;
+	h = &vq->descs[vq->ndescs++];
+	h->addr = vhost64_to_cpu(vq, desc->addr);
+	h->len = vhost32_to_cpu(vq, desc->len);
+	h->flags = vhost16_to_cpu(vq, desc->flags);
+	h->id = id;
+
+	return 0;
+}
+
+static int fetch_indirect_descs(struct vhost_virtqueue *vq,
+				struct vhost_desc *indirect,
+				u16 head)
+{
+	struct vring_desc desc;
+	unsigned int i = 0, count, found = 0;
+	u32 len = indirect->len;
+	struct iov_iter from;
+	int ret;
+
+	/* Sanity check */
+	if (unlikely(len % sizeof desc)) {
+		vq_err(vq, "Invalid length in indirect descriptor: "
+		       "len 0x%llx not multiple of 0x%zx\n",
+		       (unsigned long long)len,
+		       sizeof desc);
+		return -EINVAL;
+	}
+
+	ret = translate_desc(vq, indirect->addr, len, vq->indirect,
+			     UIO_MAXIOV, VHOST_ACCESS_RO);
+	if (unlikely(ret < 0)) {
+		if (ret != -EAGAIN)
+			vq_err(vq, "Translation failure %d in indirect.\n", ret);
+		return ret;
+	}
+	iov_iter_init(&from, READ, vq->indirect, ret, len);
+
+	/* We will use the result as an address to read from, so most
+	 * architectures only need a compiler barrier here. */
+	read_barrier_depends();
+
+	count = len / sizeof desc;
+	/* Buffers are chained via a 16 bit next field, so
+	 * we can have at most 2^16 of these. */
+	if (unlikely(count > USHRT_MAX + 1)) {
+		vq_err(vq, "Indirect buffer length too big: %d\n",
+		       indirect->len);
+		return -E2BIG;
+	}
+	if (unlikely(vq->ndescs + count > vq->max_descs)) {
+		vq_err(vq, "Too many indirect + direct descs: %d + %d\n",
+		       vq->ndescs, indirect->len);
+		return -E2BIG;
+	}
+
+	do {
+		if (unlikely(++found > count)) {
+			vq_err(vq, "Loop detected: last one at %u "
+			       "indirect size %u\n",
+			       i, count);
+			return -EINVAL;
+		}
+		if (unlikely(!copy_from_iter_full(&desc, sizeof(desc), &from))) {
+			vq_err(vq, "Failed indirect descriptor: idx %d, %zx\n",
+			       i, (size_t)indirect->addr + i * sizeof desc);
+			return -EINVAL;
+		}
+		if (unlikely(desc.flags & cpu_to_vhost16(vq, VRING_DESC_F_INDIRECT))) {
+			vq_err(vq, "Nested indirect descriptor: idx %d, %zx\n",
+			       i, (size_t)indirect->addr + i * sizeof desc);
+			return -EINVAL;
+		}
+
+		push_split_desc(vq, &desc, head);
+	} while ((i = next_desc(vq, &desc)) != -1);
+	return 0;
+}
+
+static int fetch_descs(struct vhost_virtqueue *vq)
+{
+	struct vring_desc desc;
+	unsigned int i, head, found = 0;
+	u16 last_avail_idx;
+	__virtio16 avail_idx;
+	__virtio16 ring_head;
+	int ret;
+
+	/* Check it isn't doing very strange things with descriptor numbers. */
+	last_avail_idx = vq->last_avail_idx;
+
+	if (vq->avail_idx == vq->last_avail_idx) {
+		if (unlikely(vhost_get_avail_idx(vq, &avail_idx))) {
+			vq_err(vq, "Failed to access avail idx at %p\n",
+				&vq->avail->idx);
+			return -EFAULT;
+		}
+		vq->avail_idx = vhost16_to_cpu(vq, avail_idx);
+
+		if (unlikely((u16)(vq->avail_idx - last_avail_idx) > vq->num)) {
+			vq_err(vq, "Guest moved used index from %u to %u",
+				last_avail_idx, vq->avail_idx);
+			return -EFAULT;
+		}
+
+		/* If there's nothing new since last we looked, return
+		 * invalid.
+		 */
+		if (vq->avail_idx == last_avail_idx)
+			return vq->num;
+
+		/* Only get avail ring entries after they have been
+		 * exposed by guest.
+		 */
+		smp_rmb();
+	}
+
+	/* Grab the next descriptor number they're advertising */
+	if (unlikely(vhost_get_avail_head(vq, &ring_head, last_avail_idx))) {
+		vq_err(vq, "Failed to read head: idx %d address %p\n",
+		       last_avail_idx,
+		       &vq->avail->ring[last_avail_idx % vq->num]);
+		return -EFAULT;
+	}
+
+	head = vhost16_to_cpu(vq, ring_head);
+
+	/* If their number is silly, that's an error. */
+	if (unlikely(head >= vq->num)) {
+		vq_err(vq, "Guest says index %u > %u is available",
+		       head, vq->num);
+		return -EINVAL;
+	}
+
+	i = head;
+	do {
+		if (unlikely(i >= vq->num)) {
+			vq_err(vq, "Desc index is %u > %u, head = %u",
+			       i, vq->num, head);
+			return -EINVAL;
+		}
+		if (unlikely(++found > vq->num)) {
+			vq_err(vq, "Loop detected: last one at %u "
+			       "vq size %u head %u\n",
+			       i, vq->num, head);
+			return -EINVAL;
+		}
+		ret = vhost_get_desc(vq, &desc, i);
+		if (unlikely(ret)) {
+			vq_err(vq, "Failed to get descriptor: idx %d addr %p\n",
+			       i, vq->desc + i);
+			return -EFAULT;
+		}
+		ret = push_split_desc(vq, &desc, head);
+		if (unlikely(ret)) {
+			vq_err(vq, "Failed to save descriptor: idx %d\n", i);
+			return -EINVAL;
+		}
+	} while ((i = next_desc(vq, &desc)) != -1);
+
+	/* On success, increment avail index. */
+	vq->last_avail_idx++;
+
+	/* Assume notifications from guest are disabled at this point,
+	 * if they aren't we would need to update avail_event index. */
+	BUG_ON(!(vq->used_flags & VRING_USED_F_NO_NOTIFY));
+
+	return 0;
+}
+
+/* This looks in the virtqueue and for the first available buffer, and converts
+ * it to an iovec for convenient access.  Since descriptors consist of some
+ * number of output then some number of input descriptors, it's actually two
+ * iovecs, but we pack them into one and note how many of each there were.
+ *
+ * This function returns the descriptor number found, or vq->num (which is
+ * never a valid descriptor number) if none was found.  A negative code is
+ * returned on error. */
+int vhost_get_vq_desc_batch(struct vhost_virtqueue *vq,
+		      struct iovec iov[], unsigned int iov_size,
+		      unsigned int *out_num, unsigned int *in_num,
+		      struct vhost_log *log, unsigned int *log_num)
+{
+	int ret = fetch_descs(vq);
+	struct vhost_desc *last;
+	u16 id;
+	int i;
+
+	if (ret)
+		return ret;
+
+	last = peek_split_desc(vq);
+	id = last->id;
+
+	if (last->flags & VRING_DESC_F_INDIRECT) {
+			int r;
+
+			pop_split_desc(vq);
+			r = fetch_indirect_descs(vq, last, id);
+			if (unlikely(r < 0)) {
+				if (r != -EAGAIN)
+					vq_err(vq, "Failure detected "
+					       "in indirect descriptor at idx %d\n", id);
+				return ret;
+			}
+	}
+
+	/* Now convert to IOV */
+	/* When we start there are none of either input nor output. */
+	*out_num = *in_num = 0;
+	if (unlikely(log))
+		*log_num = 0;
+
+	for (i = 0; i < vq->ndescs; ++i) {
+		unsigned iov_count = *in_num + *out_num;
+		struct vhost_desc *desc = &vq->descs[i];
+		int access;
+
+		if (desc->flags & ~(VRING_DESC_F_INDIRECT | VRING_DESC_F_WRITE)) {
+			vq_err(vq, "Unexpected flags: 0x%x at descriptor id 0x%x\n",
+			       desc->flags, desc->id);
+			ret = -EINVAL;
+			goto err;
+		}
+		if (desc->flags & VRING_DESC_F_WRITE)
+			access = VHOST_ACCESS_WO;
+		else
+			access = VHOST_ACCESS_RO;
+		ret = translate_desc(vq, desc->addr,
+				     desc->len, iov + iov_count,
+				     iov_size - iov_count, access);
+		if (unlikely(ret < 0)) {
+			if (ret != -EAGAIN)
+				vq_err(vq, "Translation failure %d descriptor idx %d\n",
+					ret, i);
+			goto err;
+		}
+		if (access == VHOST_ACCESS_WO) {
+			/* If this is an input descriptor,
+			 * increment that count. */
+			*in_num += ret;
+			if (unlikely(log && ret)) {
+				log[*log_num].addr = desc->addr;
+				log[*log_num].len = desc->len;
+				++*log_num;
+			}
+		} else {
+			/* If it's an output descriptor, they're all supposed
+			 * to come before any input descriptors. */
+			if (unlikely(*in_num)) {
+				vq_err(vq, "Descriptor has out after in: "
+				       "idx %d\n", i);
+				ret = -EINVAL;
+				goto err;
+			}
+			*out_num += ret;
+		}
+	}
+
+	ret = id;
+	vq->ndescs = 0;
+
+	return ret;
+
+err:
+	vhost_discard_vq_desc(vq, 1);
+	vq->ndescs = 0;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vhost_get_vq_desc_batch);
+
 /* Reverse the effect of vhost_get_vq_desc. Useful for error handling. */
 void vhost_discard_vq_desc(struct vhost_virtqueue *vq, int n)
 {
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index e9ed2722b633..1724f61b6c2d 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -80,6 +80,13 @@ enum vhost_uaddr_type {
 	VHOST_NUM_ADDRS = 3,
 };
 
+struct vhost_desc {
+	u64 addr;
+	u32 len;
+	u16 flags; /* VRING_DESC_F_WRITE, VRING_DESC_F_NEXT */
+	u16 id;
+};
+
 /* The virtqueue structure describes a queue attached to a device. */
 struct vhost_virtqueue {
 	struct vhost_dev *dev;
@@ -90,6 +97,11 @@ struct vhost_virtqueue {
 	struct vring_desc __user *desc;
 	struct vring_avail __user *avail;
 	struct vring_used __user *used;
+
+	struct vhost_desc *descs;
+	int ndescs;
+	int max_descs;
+
 	const struct vhost_umem_node *meta_iotlb[VHOST_NUM_ADDRS];
 	struct file *kick;
 	struct eventfd_ctx *call_ctx;
@@ -190,6 +202,10 @@ long vhost_vring_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *arg
 bool vhost_vq_access_ok(struct vhost_virtqueue *vq);
 bool vhost_log_access_ok(struct vhost_dev *);
 
+int vhost_get_vq_desc_batch(struct vhost_virtqueue *,
+		      struct iovec iov[], unsigned int iov_count,
+		      unsigned int *out_num, unsigned int *in_num,
+		      struct vhost_log *log, unsigned int *log_num);
 int vhost_get_vq_desc(struct vhost_virtqueue *,
 		      struct iovec iov[], unsigned int iov_count,
 		      unsigned int *out_num, unsigned int *in_num,
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
