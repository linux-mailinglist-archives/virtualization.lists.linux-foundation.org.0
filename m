Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C791158F55
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 13:58:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E08C864E9;
	Tue, 11 Feb 2020 12:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7909CflTcDB; Tue, 11 Feb 2020 12:58:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9EF6285EF2;
	Tue, 11 Feb 2020 12:58:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81F3BC07FE;
	Tue, 11 Feb 2020 12:58:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D65C1C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 12:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C35D2843E6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 12:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6NI5gFzgd08
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 12:58:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E60FD83F08
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 12:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581425881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=NDAUG5b2L0WtTQjUET/3Q/GS3BAIvLs/Nmzrxkl3iQw=;
 b=RlW0CN/Yw3DHSAGoHBuoM5BunawMCXQ4YXA8hN32PQAfnyhZTnRuWKcp1LDRPM6WJEypGS
 3WCxYjylFstNdsbj8R1N4GJULKoIkZStzCnRYD35vVzm2GfJ2BG9V2nTy1+y331KZcMW0F
 RtNkWttSwGJdYJgwTDHvF6Bx8fP8wC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-czr5kwyMPpqWcEdHnJyITw-1; Tue, 11 Feb 2020 07:57:57 -0500
X-MC-Unique: czr5kwyMPpqWcEdHnJyITw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C34988017DF;
 Tue, 11 Feb 2020 12:57:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60EC35C1B2;
 Tue, 11 Feb 2020 12:57:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AD07316E2D; Tue, 11 Feb 2020 13:57:51 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: rework batching
Date: Tue, 11 Feb 2020 13:57:51 +0100
Message-Id: <20200211125751.7697-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Drop notification from command submission.  Add virtio_gpu_notify()
calls everywhere instead.  This results in more batching because we now
notify only once for a series of commands.  We already had that for page
flips, now we also batch resource creation (create + attach-backing),
display updates (edid + display-info) and device initialization.  With
this in place it is also possible to make notification optional for
userspace ioctls.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++---
 drivers/gpu/drm/virtio/virtgpu_display.c |  2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  4 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  3 +++
 drivers/gpu/drm/virtio/virtgpu_object.c  |  1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  5 ++--
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 31 +++++++++---------------
 7 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7fd8361e1c9e..28aeac8717e1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -179,8 +179,7 @@ struct virtio_gpu_device {
 	struct kmem_cache *vbufs;
 	bool vqs_ready;
 
-	bool disable_notify;
-	bool pending_notify;
+	atomic_t pending_commands;
 
 	struct ida	resource_ida;
 
@@ -334,8 +333,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
 void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
-void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
-void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
+void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
 /* virtio_gpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 7b0f0643bb2d..e95fcfd8d20c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -90,6 +90,7 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0,
 				   crtc->mode.hdisplay,
 				   crtc->mode.vdisplay, 0, 0);
+	virtio_gpu_notify(vgdev);
 }
 
 static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -108,6 +109,7 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
 	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0);
+	virtio_gpu_notify(vgdev);
 	output->enabled = false;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 205ec4abae2b..75d818d707e6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -158,6 +158,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
 			      vfpriv->ctx_id, buflist, out_fence);
+	virtio_gpu_notify(vgdev);
 	return 0;
 
 out_memdup:
@@ -314,6 +315,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 		(vgdev, vfpriv->ctx_id, offset, args->level,
 		 &args->box, objs, fence);
 	dma_fence_put(&fence->f);
+	virtio_gpu_notify(vgdev);
 	return 0;
 
 err_unlock:
@@ -359,6 +361,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 args->level, &args->box, objs, fence);
 		dma_fence_put(&fence->f);
 	}
+	virtio_gpu_notify(vgdev);
 	return 0;
 
 err_unlock:
@@ -445,6 +448,7 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	/* not in cache - need to talk to hw */
 	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
+	virtio_gpu_notify(vgdev);
 
 copy_exit:
 	ret = wait_event_timeout(vgdev->resp_wq,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index c1086df49816..44e4c07d0162 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -44,6 +44,7 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
 		if (vgdev->has_edid)
 			virtio_gpu_cmd_get_edids(vgdev);
 		virtio_gpu_cmd_get_display_info(vgdev);
+		virtio_gpu_notify(vgdev);
 		drm_helper_hpd_irq_event(vgdev->ddev);
 		events_clear |= VIRTIO_GPU_EVENT_DISPLAY;
 	}
@@ -92,6 +93,7 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 	}
 	for (i = 0; i < num_capsets; i++) {
 		virtio_gpu_cmd_get_capset_info(vgdev, i);
+		virtio_gpu_notify(vgdev);
 		ret = wait_event_timeout(vgdev->resp_wq,
 					 vgdev->capsets[i].id > 0, 5 * HZ);
 		if (ret == 0) {
@@ -206,6 +208,7 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (vgdev->has_edid)
 		virtio_gpu_cmd_get_edids(vgdev);
 	virtio_gpu_cmd_get_display_info(vgdev);
+	virtio_gpu_notify(vgdev);
 	wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
 			   5 * HZ);
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 8870ee23ff2b..65d6834d3c74 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -224,6 +224,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		return ret;
 	}
 
+	virtio_gpu_notify(vgdev);
 	*bo_ptr = bo;
 	return 0;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index ac42c84d2d7f..fd6487fb0855 100644
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
@@ -187,7 +185,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				      rect.x2 - rect.x1,
 				      rect.y2 - rect.y1);
 
-	virtio_gpu_enable_notify(vgdev);
+	virtio_gpu_notify(vgdev);
 }
 
 static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
@@ -265,6 +263,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 			 plane->state->crtc_w,
 			 plane->state->crtc_h,
 			 0, 0, objs, vgfb->fence);
+		virtio_gpu_notify(vgdev);
 		dma_fence_wait(&vgfb->fence->f, true);
 		dma_fence_put(&vgfb->fence->f);
 		vgfb->fence = NULL;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index a682c2fcbe9a..ccc89b7578a0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -329,7 +329,6 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 				      int incnt)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
-	bool notify = false;
 	int ret;
 
 	if (vgdev->has_indirect)
@@ -369,16 +368,9 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
 
-	notify = virtqueue_kick_prepare(vq);
+	atomic_inc(&vgdev->pending_commands);
 
 	spin_unlock(&vgdev->ctrlq.qlock);
-
-	if (notify) {
-		if (vgdev->disable_notify)
-			vgdev->pending_notify = true;
-		else
-			virtqueue_notify(vq);
-	}
 }
 
 static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
@@ -434,19 +426,20 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
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
+	if (atomic_read(&vgdev->pending_commands) == 0)
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
-- 
2.18.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
