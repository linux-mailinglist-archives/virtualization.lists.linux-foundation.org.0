Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A191AAE29
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 00:00:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 18DC21C49;
	Thu,  5 Sep 2019 22:00:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F20B01C28
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 22:00:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6B26E896
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 22:00:16 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 205so2811778pfw.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 05 Sep 2019 15:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=awe/FZlFt6W5mRsQyenuEisLmRJCTiud4/jehSXxi7c=;
	b=CKy7sYUyzN84ffQMtrtNbVCew5ZTFIWqKsxP/xcG5jkPa1YSJ/9q1aG77QUTeC8Git
	mbKCwtGxUi/NeDFWvmpN++Z7Fl/Cr959nnvDPvZKpEXKOLyS3dSka5hmdTxHjZ6Hbmxy
	n7qVodTLgY+HxZ3Q7/dvmN1oERxiexG2wY2TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=awe/FZlFt6W5mRsQyenuEisLmRJCTiud4/jehSXxi7c=;
	b=NSknm43eF07fl1SAUc3uNOgrYwccVfErWkQSyU+YiEHo4N5ocnMQevHuFLbwrH6+EF
	6+WCpzgtj4poXxmjRZTprFLaHGHQ6JbDArMIwJsVz2BzwdKF7HwMGQNDuEjKqjhvOLt7
	nayP68YbExx7dWfuS4heNoKR9LwOt3ROSdUUrhXDVw+d9BlamUWzg0oXVqU3a0rjMiMJ
	hxNnvyc5XRNkDvLGFkJPdfGOpnwVQ/5NwEygbl0m4XRXoyyCQaQKJFpZYmEnLiEn/XWi
	nkucXNpd18IpribW3OCluLsPvbvJseo5yigk9l3GUIZsTb1KmfXh/mlt7+cTqCNKRlcF
	ID8Q==
X-Gm-Message-State: APjAAAWjycGoGQ9ht2eMdo5c4XzHaMRKmRZBpEtb2HmfduBD3rSoKWz1
	JPbpXWtCWtrAkKP84ydOQsTcxQ==
X-Google-Smtp-Source: APXvYqzGozfUHb31L4GRuAoOZbw5U6Q7xIQdOo2UA+FiBRWtnfnZpZRgDCPRKwGPVhPB/fFHvWo99A==
X-Received: by 2002:a62:3c1:: with SMTP id 184mr497016pfd.209.1567720816129;
	Thu, 05 Sep 2019 15:00:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	k95sm2121815pje.10.2019.09.05.15.00.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Sep 2019 15:00:14 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v2] drm/virtio: Use vmalloc for command buffer allocations.
Date: Thu,  5 Sep 2019 15:00:08 -0700
Message-Id: <20190905220008.75488-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190829212417.257397-1-davidriley@chromium.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>
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

Userspace requested command buffer allocations could be too large
to make as a contiguous allocation.  Use vmalloc if necessary to
satisfy those allocations.

Signed-off-by: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |   4 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 114 ++++++++++++++++++++-----
 2 files changed, 96 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index ac60be9b5c19..a8732a8af766 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -195,7 +195,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_free;
 
-	buf = memdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
+	buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
 	if (IS_ERR(buf)) {
 		ret = PTR_ERR(buf);
 		goto out_unresv;
@@ -230,7 +230,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	return 0;
 
 out_memdup:
-	kfree(buf);
+	kvfree(buf);
 out_unresv:
 	ttm_eu_backoff_reservation(&ticket, &validate_list);
 out_free:
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 981ee16e3ee9..3ec89ae8478c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -154,7 +154,7 @@ static void free_vbuf(struct virtio_gpu_device *vgdev,
 {
 	if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
 		kfree(vbuf->resp_buf);
-	kfree(vbuf->data_buf);
+	kvfree(vbuf->data_buf);
 	kmem_cache_free(vgdev->vbufs, vbuf);
 }
 
@@ -251,13 +251,70 @@ void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
 	wake_up(&vgdev->cursorq.ack_queue);
 }
 
+/* How many bytes left in this page. */
+static unsigned int rest_of_page(void *data)
+{
+	return PAGE_SIZE - offset_in_page(data);
+}
+
+/* Create sg_table from a vmalloc'd buffer. */
+static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
+{
+	int nents, ret, s, i;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	struct page *pg;
+
+	*sg_ents = 0;
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return NULL;
+
+	nents = DIV_ROUND_UP(size, PAGE_SIZE) + 1;
+	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
+	if (ret) {
+		kfree(sgt);
+		return NULL;
+	}
+
+	for_each_sg(sgt->sgl, sg, nents, i) {
+		pg = vmalloc_to_page(data);
+		if (!pg) {
+			sg_free_table(sgt);
+			kfree(sgt);
+			return NULL;
+		}
+
+		s = rest_of_page(data);
+		if (s > size)
+			s = size;
+
+		sg_set_page(sg, pg, s, offset_in_page(data));
+
+		size -= s;
+		data += s;
+		*sg_ents += 1;
+
+		if (size) {
+			sg_unmark_end(sg);
+		} else {
+			sg_mark_end(sg);
+			break;
+		}
+	}
+
+	return sgt;
+}
+
 static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
-					       struct virtio_gpu_vbuffer *vbuf)
+					       struct virtio_gpu_vbuffer *vbuf,
+					       struct scatterlist *vout)
 		__releases(&vgdev->ctrlq.qlock)
 		__acquires(&vgdev->ctrlq.qlock)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
-	struct scatterlist *sgs[3], vcmd, vout, vresp;
+	struct scatterlist *sgs[3], vcmd, vresp;
 	int outcnt = 0, incnt = 0;
 	int ret;
 
@@ -268,9 +325,8 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 	sgs[outcnt + incnt] = &vcmd;
 	outcnt++;
 
-	if (vbuf->data_size) {
-		sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
-		sgs[outcnt + incnt] = &vout;
+	if (vout) {
+		sgs[outcnt + incnt] = vout;
 		outcnt++;
 	}
 
@@ -299,24 +355,30 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 	return ret;
 }
 
-static int virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
-					struct virtio_gpu_vbuffer *vbuf)
-{
-	int rc;
-
-	spin_lock(&vgdev->ctrlq.qlock);
-	rc = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
-	spin_unlock(&vgdev->ctrlq.qlock);
-	return rc;
-}
-
 static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf,
 					       struct virtio_gpu_ctrl_hdr *hdr,
 					       struct virtio_gpu_fence *fence)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
+	struct scatterlist *vout = NULL, sg;
+	struct sg_table *sgt = NULL;
 	int rc;
+	int outcnt = 0;
+
+	if (vbuf->data_size) {
+		if (is_vmalloc_addr(vbuf->data_buf)) {
+			sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
+					     &outcnt);
+			if (!sgt)
+				return -ENOMEM;
+			vout = sgt->sgl;
+		} else {
+			sg_init_one(&sg, vbuf->data_buf, vbuf->data_size);
+			vout = &sg;
+			outcnt = 1;
+		}
+	}
 
 again:
 	spin_lock(&vgdev->ctrlq.qlock);
@@ -329,19 +391,31 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	 * to wait for free space, which can result in fence ids being
 	 * submitted out-of-order.
 	 */
-	if (vq->num_free < 3) {
+	if (vq->num_free < 2 + outcnt) {
 		spin_unlock(&vgdev->ctrlq.qlock);
 		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= 3);
 		goto again;
 	}
 
-	if (fence)
+	if (hdr && fence)
 		virtio_gpu_fence_emit(vgdev, hdr, fence);
-	rc = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
+	rc = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf, vout);
 	spin_unlock(&vgdev->ctrlq.qlock);
+
+	if (sgt) {
+		sg_free_table(sgt);
+		kfree(sgt);
+	}
+
 	return rc;
 }
 
+static int virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
+					struct virtio_gpu_vbuffer *vbuf)
+{
+	return virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL, NULL);
+}
+
 static int virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_vbuffer *vbuf)
 {
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
