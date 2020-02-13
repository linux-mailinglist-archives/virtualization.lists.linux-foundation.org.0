Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B38315BF20
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 14:22:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E6C6B86E3F;
	Thu, 13 Feb 2020 13:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08JxVm-HsuNV; Thu, 13 Feb 2020 13:22:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8336486E3A;
	Thu, 13 Feb 2020 13:22:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E0E7C0177;
	Thu, 13 Feb 2020 13:22:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45F8FC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 357F320411
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tOoaH7daamw6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id E6AE22000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581600133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=9A+wSkyxusnRX7BicnjW3WSbmTih3JMxMiULkIbUYv8=;
 b=DwAQiWzh+j5SyzjKQyRlXUHTbv47WwZ5OHCjk+6L+vAdIAlXGQiWr/nQXbQ8tJxwLnwZkm
 It4IjnRLm9c+zTEumaaucZ36YmMDxdC+rcnxi8/BqGWy8ALBnrCO37TC3/5MpJYAU4EuS/
 gKin+tt8RS4jby8qYjBI/ZtnauVvgyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-oQB6h8WnMoe3oyTrqDIccA-1; Thu, 13 Feb 2020 08:22:09 -0500
X-MC-Unique: oQB6h8WnMoe3oyTrqDIccA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58627800D41;
 Thu, 13 Feb 2020 13:22:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0BDC26FB9;
 Thu, 13 Feb 2020 13:22:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2538D9B0B; Thu, 13 Feb 2020 14:22:04 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/virtio: rework notification for better batching
Date: Thu, 13 Feb 2020 14:22:00 +0100
Message-Id: <20200213132203.23441-2-kraxel@redhat.com>
In-Reply-To: <20200213132203.23441-1-kraxel@redhat.com>
References: <20200213132203.23441-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org,
 olvaffe@gmail.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Drop the virtio_gpu_{disable,enable}_notify().  Add a new
virtio_gpu_notify() call instead, which must be called whenever
the driver wants make sure the host is notified needed.

Drop automatic notification from command submission.  Add
virtio_gpu_notify() calls after each command query instead.
This allows more fine-grained control over host notification
and can move around the notify calls in subsequent patches to
batch command submissions. With this in place it is also
possible to make notification optional for userspace ioctls.

Page flip batching goes away (temporarely).

v3:
 - move batching to separate patches.
v2:
 - rebase to latest drm-misc-next.
 - use "if (!atomic_read())".
 - add review & test tags.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Tested-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++--
 drivers/gpu/drm/virtio/virtgpu_plane.c |  4 ---
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 50 ++++++++++++++++----------
 3 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index af9403e1cf78..2f6c4ccbfd14 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -179,8 +179,7 @@ struct virtio_gpu_device {
 	struct virtio_gpu_queue cursorq;
 	struct kmem_cache *vbufs;
 
-	bool disable_notify;
-	bool pending_notify;
+	atomic_t pending_commands;
 
 	struct ida	resource_ida;
 
@@ -335,8 +334,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
 void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
-void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
-void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
+void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
 /* virtio_gpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index d1c3f5fbfee4..08b2e4127eb3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -154,8 +154,6 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
 		return;
 
-	virtio_gpu_disable_notify(vgdev);
-
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
 	if (bo->dumb)
 		virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
@@ -186,8 +184,6 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				      rect.y1,
 				      rect.x2 - rect.x1,
 				      rect.y2 - rect.y1);
-
-	virtio_gpu_enable_notify(vgdev);
 }
 
 static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index cfe9c54f87a3..812212975440 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -329,7 +329,6 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 				      int incnt)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
-	bool notify = false;
 	int ret, idx;
 
 	if (!drm_dev_enter(vgdev->ddev, &idx)) {
@@ -368,16 +367,10 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
 
-	notify = virtqueue_kick_prepare(vq);
+	atomic_inc(&vgdev->pending_commands);
 
 	spin_unlock(&vgdev->ctrlq.qlock);
 
-	if (notify) {
-		if (vgdev->disable_notify)
-			vgdev->pending_notify = true;
-		else
-			virtqueue_notify(vq);
-	}
 	drm_dev_exit(idx);
 }
 
@@ -434,19 +427,20 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	}
 }
 
-void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev)
+void virtio_gpu_notify(struct virtio_gpu_device *vgdev)
 {
-	vgdev->disable_notify = true;
-}
+	bool notify;
 
-void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
-{
-	vgdev->disable_notify = false;
-
-	if (!vgdev->pending_notify)
+	if (!atomic_read(&vgdev->pending_commands))
 		return;
-	vgdev->pending_notify = false;
-	virtqueue_notify(vgdev->ctrlq.vq);
+
+	spin_lock(&vgdev->ctrlq.qlock);
+	atomic_set(&vgdev->pending_commands, 0);
+	notify = virtqueue_kick_prepare(vgdev->ctrlq.vq);
+	spin_unlock(&vgdev->ctrlq.qlock);
+
+	if (notify)
+		virtqueue_notify(vgdev->ctrlq.vq);
 }
 
 static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
@@ -520,6 +514,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->height = cpu_to_le32(params->height);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 	bo->created = true;
 }
 
@@ -549,6 +544,7 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 
 	vbuf->resp_cb_data = bo;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
@@ -571,6 +567,7 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
@@ -592,6 +589,7 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
@@ -624,6 +622,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 static void
@@ -647,6 +646,7 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	vbuf->data_size = sizeof(*ents) * nents;
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
@@ -779,6 +779,7 @@ int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
 	vgdev->display_info_pending = true;
 	cmd_p->type = cpu_to_le32(VIRTIO_GPU_CMD_GET_DISPLAY_INFO);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 	return 0;
 }
 
@@ -802,6 +803,7 @@ int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx)
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_CAPSET_INFO);
 	cmd_p->capset_index = cpu_to_le32(idx);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 	return 0;
 }
 
@@ -877,6 +879,7 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 	cmd_p->capset_version = cpu_to_le32(version);
 	*cache_p = cache_ent;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 
 	return 0;
 }
@@ -904,6 +907,7 @@ int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
 		cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_EDID);
 		cmd_p->scanout = cpu_to_le32(scanout);
 		virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+		virtio_gpu_notify(vgdev);
 	}
 
 	return 0;
@@ -924,6 +928,7 @@ void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
 	strncpy(cmd_p->debug_name, name, sizeof(cmd_p->debug_name) - 1);
 	cmd_p->debug_name[sizeof(cmd_p->debug_name) - 1] = 0;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
@@ -938,6 +943,7 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DESTROY);
 	cmd_p->hdr.ctx_id = cpu_to_le32(id);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
@@ -956,7 +962,7 @@ void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
@@ -975,6 +981,7 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void
@@ -1006,6 +1013,8 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->flags = cpu_to_le32(params->flags);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
+
 	bo->created = true;
 }
 
@@ -1039,6 +1048,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->level = cpu_to_le32(level);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
@@ -1065,6 +1075,7 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->level = cpu_to_le32(level);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
@@ -1088,6 +1099,7 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 	cmd_p->size = cpu_to_le32(data_size);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-- 
2.18.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
