Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F968A28E7
	for <lists.virtualization@lfdr.de>; Thu, 29 Aug 2019 23:26:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ABDB1566C;
	Thu, 29 Aug 2019 21:26:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 032B85108
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 21:24:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 825B68AA
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 21:24:26 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id m3so2248285pgv.13
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 14:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E2P9cOC9rhcxBzt6NHNxzx1T9WKYvIwrZWNTN0rkY+s=;
	b=h0jTQN3TrKHnWNcg4cy77XJ0Co8Zx9n1Djd8fwUQW0bwNR3x0a6yxAkmXQyKGJ0vuP
	2HpX11DY6L3hw3NBb+hAtyV/Ga22TIDS/NvuS5CEUbOTIw9b4QOdmT1FdD8gNz1QHFby
	OVTmlgN4RoKEVolCdsq3rEd/zNSOYd16GWfJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E2P9cOC9rhcxBzt6NHNxzx1T9WKYvIwrZWNTN0rkY+s=;
	b=nl2w++r3swTmJN6qRrGRm4/25RqPL6JGSf+xVp/YREns6LEyBid4pcwndOhHFTuq+S
	xK1vRpF/e0dshGGVnQF++8rHXkRM45RL2qYcLmtuzS9V/IghkEEl0XN3V3IgebuZIzt3
	t81sx4VE44FyGJmOUUAsr/Ncap5nmYFf/kz3cmK88e+261LuC2v+WSvHtDQCoECqgyfV
	TWHsbTiW/l6xw5XGa/VQ9guxy4brF/efWFiBIgaHWCcPWSWGD6bh9FotYuPP7sCXQmPJ
	Y4yLgqZLWVEPLASNF8C+MZuBIZ/a7QWCy/7d7HMuzVq1syuShfogEhdGtOHnJ5TO9C4S
	m6bg==
X-Gm-Message-State: APjAAAUhC+RskovvBtUGhfbUpSvMdCAPGaE5ExdVT2ioP/g3zg7Z1o6z
	yrnIFFZGLvp2bUHWjTjMTl/g4g==
X-Google-Smtp-Source: APXvYqwrArfkjixaiROj/5i5BAEgcr0XtH1eJ8V9j+D6f55gAYz46DjrMy53tXXCLTJpgC2htTwUPA==
X-Received: by 2002:a63:f357:: with SMTP id t23mr10380346pgj.421.1567113866106;
	Thu, 29 Aug 2019 14:24:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id o9sm2972126pgv.19.2019.08.29.14.24.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 29 Aug 2019 14:24:25 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
Date: Thu, 29 Aug 2019 14:24:17 -0700
Message-Id: <20190829212417.257397-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
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
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 74 ++++++++++++++++++++++++--
 2 files changed, 73 insertions(+), 5 deletions(-)

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
index 981ee16e3ee9..bcbc48b7284f 100644
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
 
@@ -251,6 +251,59 @@ void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
 	wake_up(&vgdev->cursorq.ack_queue);
 }
 
+/* How many bytes left in this page. */
+static unsigned int rest_of_page(void *data)
+{
+	return PAGE_SIZE - offset_in_page(data);
+}
+
+/* Create sg_table from a vmalloc'd buffer. */
+static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size)
+{
+	int nents, ret, s, i;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	struct page *pg;
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
 					       struct virtio_gpu_vbuffer *vbuf)
 		__releases(&vgdev->ctrlq.qlock)
@@ -260,6 +313,7 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 	struct scatterlist *sgs[3], vcmd, vout, vresp;
 	int outcnt = 0, incnt = 0;
 	int ret;
+	struct sg_table *sgt = NULL;
 
 	if (!vgdev->vqs_ready)
 		return -ENODEV;
@@ -269,8 +323,17 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 	outcnt++;
 
 	if (vbuf->data_size) {
-		sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
-		sgs[outcnt + incnt] = &vout;
+		if (is_vmalloc_addr(vbuf->data_buf)) {
+			spin_unlock(&vgdev->ctrlq.qlock);
+			sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size);
+			spin_lock(&vgdev->ctrlq.qlock);
+			if (!sgt)
+				return -ENOMEM;
+			sgs[outcnt + incnt] = sgt->sgl;
+		} else {
+			sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
+			sgs[outcnt + incnt] = &vout;
+		}
 		outcnt++;
 	}
 
@@ -294,6 +357,11 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 		virtqueue_kick(vq);
 	}
 
+	if (sgt) {
+		sg_free_table(sgt);
+		kfree(sgt);
+	}
+
 	if (!ret)
 		ret = vq->num_free;
 	return ret;
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
