Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D1B036F
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 20:14:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1BC1E9B;
	Wed, 11 Sep 2019 18:14:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C3F7FE3C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 18:14:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4C50881A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 18:14:15 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t11so10517911plo.0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jXhdF34fWpCmU0rbmWA1E+x/O7viGYJ2RgC8HYIROiY=;
	b=RtnXpoYfLAC4rtL4bjrCmE3G/t40XxkLPu1f2NPVTKsBUY/Nn+kVJEeLhS+wDklRXZ
	Qp8eb+ZWa3o4lE4//hp7YBwKhX5JgdtLRGJp7rvmS4YG9U63+TwOiLej1RE6aJqn/EoD
	WYF2kwM264l5jO5pkiy3QQOg66CiAVVz9maZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jXhdF34fWpCmU0rbmWA1E+x/O7viGYJ2RgC8HYIROiY=;
	b=DHWmkboMgSUJPdgXtr4R13jqAajaei9EcJ5DA6y5RHaB4Xbiol2V+cHgoaMkduly65
	vPxZtoDVoxx8RtgpcY3ZANEcxbAs2LFP7pcejt+c8482SlsKrxTOLkz7OavC79R/EvQB
	2w87CIHrpBYtfK3qn5++803Z+2qhHF0nn5VYzcVR3l0nZ9buam1ZHiF3TpwkM1KGYcjs
	FiNkXVrgy1c/SZhyfmww1vp87Wz6qm/NTFZE/VbAlZHs8ITCpFbADTDFc9+kRa3e9th+
	fb84Zm04ZtuQBroBUu4FdisG2DF+Hikl8Dfar7+6ajwz3Kp6p2+cCZAgfyO0aaU0ojj+
	8K1Q==
X-Gm-Message-State: APjAAAWSDiC26JEY3dat4jltjJxnfwtvPxg74gOINUElp+kwIWPJycW8
	QYddjma5I0yLy+EWGHoFGT8w6g==
X-Google-Smtp-Source: APXvYqwijnVpSCyrOk2zNhhDUxXV/lyUbYRDrb2kuDeMwHY0Qts6nLLyXGJqlZOF6xxnhwAcdwSRMw==
X-Received: by 2002:a17:902:7c13:: with SMTP id
	x19mr39596513pll.322.1568225654889; 
	Wed, 11 Sep 2019 11:14:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id
	x8sm22730241pfn.106.2019.09.11.11.14.13
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Sep 2019 11:14:13 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v4 2/2] drm/virtio: Use vmalloc for command buffer allocations.
Date: Wed, 11 Sep 2019 11:14:03 -0700
Message-Id: <20190911181403.40909-3-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
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
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  4 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 78 +++++++++++++++++++++++---
 2 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index f5083c538f9c..9af1ec62434f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -143,7 +143,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			goto out_unused_fd;
 	}
 
-	buf = memdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
+	buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
 	if (IS_ERR(buf)) {
 		ret = PTR_ERR(buf);
 		goto out_unresv;
@@ -172,7 +172,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	return 0;
 
 out_memdup:
-	kfree(buf);
+	kvfree(buf);
 out_unresv:
 	if (buflist)
 		virtio_gpu_array_unlock_resv(buflist);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 5a64c776138d..9f9b782dd332 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -155,7 +155,7 @@ static void free_vbuf(struct virtio_gpu_device *vgdev,
 {
 	if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
 		kfree(vbuf->resp_buf);
-	kfree(vbuf->data_buf);
+	kvfree(vbuf->data_buf);
 	kmem_cache_free(vgdev->vbufs, vbuf);
 }
 
@@ -256,13 +256,54 @@ void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
 	wake_up(&vgdev->cursorq.ack_queue);
 }
 
+/* Create sg_table from a vmalloc'd buffer. */
+static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
+{
+	int ret, s, i;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	struct page *pg;
+
+	if (WARN_ON(!PAGE_ALIGNED(data)))
+		return NULL;
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return NULL;
+
+	*sg_ents = DIV_ROUND_UP(size, PAGE_SIZE);
+	ret = sg_alloc_table(sgt, *sg_ents, GFP_KERNEL);
+	if (ret) {
+		kfree(sgt);
+		return NULL;
+	}
+
+	for_each_sg(sgt->sgl, sg, *sg_ents, i) {
+		pg = vmalloc_to_page(data);
+		if (!pg) {
+			sg_free_table(sgt);
+			kfree(sgt);
+			return NULL;
+		}
+
+		s = min_t(int, PAGE_SIZE, size);
+		sg_set_page(sg, pg, s, 0);
+
+		size -= s;
+		data += s;
+	}
+
+	return sgt;
+}
+
 static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
-						struct virtio_gpu_vbuffer *vbuf)
+						struct virtio_gpu_vbuffer *vbuf,
+						struct scatterlist *vout)
 		__releases(&vgdev->ctrlq.qlock)
 		__acquires(&vgdev->ctrlq.qlock)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
-	struct scatterlist *sgs[3], vcmd, vout, vresp;
+	struct scatterlist *sgs[3], vcmd, vresp;
 	int outcnt = 0, incnt = 0;
 	bool notify = false;
 	int ret;
@@ -274,9 +315,8 @@ static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 	sgs[outcnt + incnt] = &vcmd;
 	outcnt++;
 
-	if (vbuf->data_size) {
-		sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
-		sgs[outcnt + incnt] = &vout;
+	if (vout) {
+		sgs[outcnt + incnt] = vout;
 		outcnt++;
 	}
 
@@ -308,7 +348,24 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 						struct virtio_gpu_fence *fence)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
+	struct scatterlist *vout = NULL, sg;
+	struct sg_table *sgt = NULL;
 	bool notify;
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
@@ -321,7 +378,7 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	 * to wait for free space, which can result in fence ids being
 	 * submitted out-of-order.
 	 */
-	if (vq->num_free < 3) {
+	if (vq->num_free < 2 + outcnt) {
 		spin_unlock(&vgdev->ctrlq.qlock);
 		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= 3);
 		goto again;
@@ -334,10 +391,15 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 			virtio_gpu_array_unlock_resv(vbuf->objs);
 		}
 	}
-	notify = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
+	notify = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf, vout);
 	spin_unlock(&vgdev->ctrlq.qlock);
 	if (notify)
 		virtqueue_notify(vgdev->ctrlq.vq);
+
+	if (sgt) {
+		sg_free_table(sgt);
+		kfree(sgt);
+	}
 }
 
 static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
-- 
2.23.0.162.g0b9fbb3734-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
