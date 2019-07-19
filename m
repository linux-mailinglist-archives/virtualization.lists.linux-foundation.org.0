Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 872956D98D
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 05:57:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B2AF61EE8;
	Fri, 19 Jul 2019 03:57:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 663081C6C
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 03:56:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BD51B12E
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 03:56:52 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A0C032184E;
	Fri, 19 Jul 2019 03:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563508612;
	bh=YxhhvzvXE6Bce1kbgm2suGKFRx5o/yNjvKqLyD1/Lok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G7b2ZUqWJl3fhpmtc+jy4zTnXuwaZfTdB2nDtXWQrOT3wzHi5KW4FuPsH+xtJXuAq
	etFrOaUWTeP+4SXaF0TzWIZmz4oXc1tOq/G7oGKIVG0Y5K0TAL2HzMJuUWIt0geiJs
	Rl6zATMhebQpVUpt33FqVmG3LSQkes4mJd1nH9iI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 005/171] drm/virtio: set seqno for dma-fence
Date: Thu, 18 Jul 2019 23:53:56 -0400
Message-Id: <20190719035643.14300-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, Chia-I Wu <olvaffe@gmail.com>,
	Emil Velikov <emil.velikov@collabora.com>
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

From: Chia-I Wu <olvaffe@gmail.com>

[ Upstream commit efe2bf965522bf0796d413b47a2abbf81d471d6f ]

This is motivated by having meaningful ftrace events, but it also
fixes use cases where dma_fence_is_later is called, such as in
sync_file_merge.

In other drivers, fence creation and cmdbuf submission normally
happen atomically,

  mutex_lock();
  fence = dma_fence_create(..., ++timeline->seqno);
  submit_cmdbuf();
  mutex_unlock();

and have no such issue.  But in our driver, because most ioctls
queue commands into ctrlq, we do not want to grab a lock.  Instead,
we set seqno to 0 when a fence is created, and update it when the
command is finally queued and the seqno is known.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20190429220825.156644-1-olvaffe@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 -
 drivers/gpu/drm/virtio/virtgpu_fence.c | 17 ++++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index b69ae10ca238..d724fb3de44e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -102,7 +102,6 @@ struct virtio_gpu_fence {
 	struct dma_fence f;
 	struct virtio_gpu_fence_driver *drv;
 	struct list_head node;
-	uint64_t seq;
 };
 #define to_virtio_fence(x) \
 	container_of(x, struct virtio_gpu_fence, f)
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 87d1966192f4..72b4f7561432 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -40,16 +40,14 @@ bool virtio_fence_signaled(struct dma_fence *f)
 {
 	struct virtio_gpu_fence *fence = to_virtio_fence(f);
 
-	if (atomic64_read(&fence->drv->last_seq) >= fence->seq)
+	if (atomic64_read(&fence->drv->last_seq) >= fence->f.seqno)
 		return true;
 	return false;
 }
 
 static void virtio_fence_value_str(struct dma_fence *f, char *str, int size)
 {
-	struct virtio_gpu_fence *fence = to_virtio_fence(f);
-
-	snprintf(str, size, "%llu", fence->seq);
+	snprintf(str, size, "%llu", f->seqno);
 }
 
 static void virtio_timeline_value_str(struct dma_fence *f, char *str, int size)
@@ -76,6 +74,11 @@ struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
 		return fence;
 
 	fence->drv = drv;
+
+	/* This only partially initializes the fence because the seqno is
+	 * unknown yet.  The fence must not be used outside of the driver
+	 * until virtio_gpu_fence_emit is called.
+	 */
 	dma_fence_init(&fence->f, &virtio_fence_ops, &drv->lock, drv->context, 0);
 
 	return fence;
@@ -89,13 +92,13 @@ int virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
-	fence->seq = ++drv->sync_seq;
+	fence->f.seqno = ++drv->sync_seq;
 	dma_fence_get(&fence->f);
 	list_add_tail(&fence->node, &drv->fences);
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
 
 	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
-	cmd_hdr->fence_id = cpu_to_le64(fence->seq);
+	cmd_hdr->fence_id = cpu_to_le64(fence->f.seqno);
 	return 0;
 }
 
@@ -109,7 +112,7 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 	spin_lock_irqsave(&drv->lock, irq_flags);
 	atomic64_set(&vgdev->fence_drv.last_seq, last_seq);
 	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
-		if (last_seq < fence->seq)
+		if (last_seq < fence->f.seqno)
 			continue;
 		dma_fence_signal_locked(&fence->f);
 		list_del(&fence->node);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
