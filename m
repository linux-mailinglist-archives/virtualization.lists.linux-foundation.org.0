Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C89AC40
	for <lists.virtualization@lfdr.de>; Fri, 23 Aug 2019 11:57:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 63E88EB0;
	Fri, 23 Aug 2019 09:55:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3C26FE9C
	for <virtualization@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 09:55:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 619371DD19
	for <virtualization@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 09:55:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0FE010576F2;
	Fri, 23 Aug 2019 09:55:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D8705D9D3;
	Fri, 23 Aug 2019 09:55:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 23F1E31E93; Fri, 23 Aug 2019 11:55:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 08/18] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
Date: Fri, 23 Aug 2019 11:54:53 +0200
Message-Id: <20190823095503.2261-9-kraxel@redhat.com>
In-Reply-To: <20190823095503.2261-1-kraxel@redhat.com>
References: <20190823095503.2261-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Fri, 23 Aug 2019 09:55:13 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
	olvaffe@gmail.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Rework fencing workflow, starting with virtio_gpu_execbuffer_ioctl.
Stop using ttm helpers, use the virtio_gpu_array_* helpers (which work
on the reservation objects directly) instead.

Also store the object array in struct virtio_gpu_vbuffer, so we
explicitly keep a reference of all buffers used instead of depending
on ttm_bo_put() checking whenever the object is actually idle before
releasing it.

New workflow:

 (1) All gem objects needed by a command are added to a
     virtio_gpu_object_array.
 (2) All reservation objects will be locked (virtio_gpu_array_lock_resv).
 (3) virtio_gpu_fence_emit() completes fence initialization.
 (4) fence gets added to the objects, reservation objects are unlocked
     (virtio_gpu_array_add_fence, virtio_gpu_array_unlock_resv).
 (5) virtio command is submitted to the host.
 (6) The completion callback (virtio_gpu_dequeue_ctrl_func)
     will drop object references and free virtio_gpu_object_array.

v6: rewrite most of the patch.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 56 +++++++++-----------------
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 21 +++++++---
 3 files changed, 38 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index b6bd2b1141fb..f4f843aec18a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -121,9 +121,9 @@ struct virtio_gpu_vbuffer {
 
 	char *resp_buf;
 	int resp_size;
-
 	virtio_gpu_resp_cb resp_cb;
 
+	struct virtio_gpu_object_array *objs;
 	struct list_head list;
 };
 
@@ -318,7 +318,9 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t resource_id);
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 			   void *data, uint32_t data_size,
-			   uint32_t ctx_id, struct virtio_gpu_fence *fence);
+			   uint32_t ctx_id,
+			   struct virtio_gpu_object_array *objs,
+			   struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  uint32_t resource_id, uint32_t ctx_id,
 					  uint64_t offset, uint32_t level,
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 285824c42e19..6baf43148e01 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -107,16 +107,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	struct drm_virtgpu_execbuffer *exbuf = data;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
-	struct drm_gem_object *gobj;
 	struct virtio_gpu_fence *out_fence;
-	struct virtio_gpu_object *qobj;
 	int ret;
 	uint32_t *bo_handles = NULL;
 	void __user *user_bo_handles = NULL;
-	struct list_head validate_list;
-	struct ttm_validate_buffer *buflist = NULL;
-	int i;
-	struct ww_acquire_ctx ticket;
+	struct virtio_gpu_object_array *buflist = NULL;
 	struct sync_file *sync_file;
 	int in_fence_fd = exbuf->fence_fd;
 	int out_fence_fd = -1;
@@ -157,15 +152,10 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			return out_fence_fd;
 	}
 
-	INIT_LIST_HEAD(&validate_list);
 	if (exbuf->num_bo_handles) {
-
 		bo_handles = kvmalloc_array(exbuf->num_bo_handles,
-					   sizeof(uint32_t), GFP_KERNEL);
-		buflist = kvmalloc_array(exbuf->num_bo_handles,
-					   sizeof(struct ttm_validate_buffer),
-					   GFP_KERNEL | __GFP_ZERO);
-		if (!bo_handles || !buflist) {
+					    sizeof(uint32_t), GFP_KERNEL);
+		if (!bo_handles) {
 			ret = -ENOMEM;
 			goto out_unused_fd;
 		}
@@ -177,25 +167,21 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			goto out_unused_fd;
 		}
 
-		for (i = 0; i < exbuf->num_bo_handles; i++) {
-			gobj = drm_gem_object_lookup(drm_file, bo_handles[i]);
-			if (!gobj) {
-				ret = -ENOENT;
-				goto out_unused_fd;
-			}
-
-			qobj = gem_to_virtio_gpu_obj(gobj);
-			buflist[i].bo = &qobj->tbo;
-
-			list_add(&buflist[i].head, &validate_list);
+		buflist = virtio_gpu_array_from_handles(drm_file, bo_handles,
+							exbuf->num_bo_handles);
+		if (!buflist) {
+			ret = -ENOENT;
+			goto out_unused_fd;
 		}
 		kvfree(bo_handles);
 		bo_handles = NULL;
 	}
 
-	ret = virtio_gpu_object_list_validate(&ticket, &validate_list);
-	if (ret)
-		goto out_free;
+	if (buflist) {
+		ret = virtio_gpu_array_lock_resv(buflist);
+		if (ret)
+			goto out_unused_fd;
+	}
 
 	buf = memdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
 	if (IS_ERR(buf)) {
@@ -222,24 +208,18 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	}
 
 	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
-			      vfpriv->ctx_id, out_fence);
-
-	ttm_eu_fence_buffer_objects(&ticket, &validate_list, &out_fence->f);
-
-	/* fence the command bo */
-	virtio_gpu_unref_list(&validate_list);
-	kvfree(buflist);
+			      vfpriv->ctx_id, buflist, out_fence);
 	return 0;
 
 out_memdup:
 	kfree(buf);
 out_unresv:
-	ttm_eu_backoff_reservation(&ticket, &validate_list);
-out_free:
-	virtio_gpu_unref_list(&validate_list);
+	if (buflist)
+		virtio_gpu_array_unlock_resv(buflist);
 out_unused_fd:
 	kvfree(bo_handles);
-	kvfree(buflist);
+	if (buflist)
+		virtio_gpu_array_put_free(buflist);
 
 	if (out_fence_fd >= 0)
 		put_unused_fd(out_fence_fd);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 7ac20490e1b4..24245c37d69f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -192,7 +192,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 	} while (!virtqueue_enable_cb(vgdev->ctrlq.vq));
 	spin_unlock(&vgdev->ctrlq.qlock);
 
-	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
+	list_for_each_entry(entry, &reclaim_list, list) {
 		resp = (struct virtio_gpu_ctrl_hdr *)entry->resp_buf;
 
 		trace_virtio_gpu_cmd_response(vgdev->ctrlq.vq, resp);
@@ -219,14 +219,18 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 		}
 		if (entry->resp_cb)
 			entry->resp_cb(vgdev, entry);
-
-		list_del(&entry->list);
-		free_vbuf(vgdev, entry);
 	}
 	wake_up(&vgdev->ctrlq.ack_queue);
 
 	if (fence_id)
 		virtio_gpu_fence_event_process(vgdev, fence_id);
+
+	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
+		if (entry->objs)
+			virtio_gpu_array_put_free(entry->objs);
+		list_del(&entry->list);
+		free_vbuf(vgdev, entry);
+	}
 }
 
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
@@ -338,6 +342,10 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 
 	if (fence)
 		virtio_gpu_fence_emit(vgdev, hdr, fence);
+	if (vbuf->objs) {
+		virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
+		virtio_gpu_array_unlock_resv(vbuf->objs);
+	}
 	rc = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf);
 	spin_unlock(&vgdev->ctrlq.qlock);
 	return rc;
@@ -940,7 +948,9 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 			   void *data, uint32_t data_size,
-			   uint32_t ctx_id, struct virtio_gpu_fence *fence)
+			   uint32_t ctx_id,
+			   struct virtio_gpu_object_array *objs,
+			   struct virtio_gpu_fence *fence)
 {
 	struct virtio_gpu_cmd_submit *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
@@ -950,6 +960,7 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 
 	vbuf->data_buf = data;
 	vbuf->data_size = data_size;
+	vbuf->objs = objs;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_SUBMIT_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
