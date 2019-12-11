Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D222311A621
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 09:42:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8609686E1A;
	Wed, 11 Dec 2019 08:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkVlHRLyT0qj; Wed, 11 Dec 2019 08:42:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DA86086F85;
	Wed, 11 Dec 2019 08:42:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1D15C0881;
	Wed, 11 Dec 2019 08:42:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4ACDC1D82
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 900002051B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mujkrerAhOle
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:42:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 5F3F3204C3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576053746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dsst+sWX0VFTEAJu3TuQCKDms+wHXt+MxKKJ0t44GQg=;
 b=Hsq64ZMlidk69+a6w8lru9K3iP1V1oyzGSodRVNaUzMqPYlPDRvsc6vXMJYXUlA0GcAGXU
 yEYC8EKOXDfuShzmxdQYhQkswTcxeMKZzqZzu91Fbc4HvArCSm3UE1KFyohaltQCMQTAX3
 0p5BNMnaA5CgZzYQo/koozOwyoWTldo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-ZP_jTZwRNryhmIsXO6DjjQ-1; Wed, 11 Dec 2019 03:42:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A85EA107ACCC;
 Wed, 11 Dec 2019 08:42:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78BD960BE1;
 Wed, 11 Dec 2019 08:42:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 904E51747D; Wed, 11 Dec 2019 09:42:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] virtio-gpu: batch display update commands.
Date: Wed, 11 Dec 2019 09:42:15 +0100
Message-Id: <20191211084216.25405-3-kraxel@redhat.com>
In-Reply-To: <20191211084216.25405-1-kraxel@redhat.com>
References: <20191211084216.25405-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ZP_jTZwRNryhmIsXO6DjjQ-1
X-Mimecast-Spam-Score: 0
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, gurchetansingh@chromium.org
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

When the driver submits multiple commands in a row it makes sense to
notify the host only after submitting the last one, so the host can
process them all at once, with a single vmexit.

Add functions to enable/disable notifications to allow that.  Use the
new functions for primary plane updates.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c |  4 ++++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 23 +++++++++++++++++++++--
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index eedae2a7b532..29cf005ed6b9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -183,6 +183,9 @@ struct virtio_gpu_device {
 	struct kmem_cache *vbufs;
 	bool vqs_ready;
 
+	bool disable_notify;
+	bool pending_notify;
+
 	struct ida	resource_ida;
 
 	wait_queue_head_t resp_wq;
@@ -335,6 +338,9 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
 void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
+void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
+void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
+
 /* virtio_gpu_display.c */
 int virtio_gpu_framebuffer_init(struct drm_device *dev,
 				struct virtio_gpu_framebuffer *vgfb,
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a0f91658c2bc..2e0d14e005db 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -146,6 +146,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 		return;
 	}
 
+	virtio_gpu_disable_notify(vgdev);
+
 	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
 	if (bo->dumb)
@@ -173,6 +175,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				      plane->state->src_y >> 16,
 				      plane->state->src_w >> 16,
 				      plane->state->src_h >> 16);
+
+	virtio_gpu_enable_notify(vgdev);
 }
 
 static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9274c4063c70..5914e79d3429 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -404,8 +404,12 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	}
 	notify = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf, vout);
 	spin_unlock(&vgdev->ctrlq.qlock);
-	if (notify)
-		virtqueue_notify(vgdev->ctrlq.vq);
+	if (notify) {
+		if (vgdev->disable_notify)
+			vgdev->pending_notify = true;
+		else
+			virtqueue_notify(vgdev->ctrlq.vq);
+	}
 
 	if (sgt) {
 		sg_free_table(sgt);
@@ -413,6 +417,21 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	}
 }
 
+void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev)
+{
+	vgdev->disable_notify = true;
+}
+
+void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
+{
+	vgdev->disable_notify = false;
+
+	if (!vgdev->pending_notify)
+		return;
+	vgdev->pending_notify = false;
+	virtqueue_notify(vgdev->ctrlq.vq);
+}
+
 static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
 					 struct virtio_gpu_vbuffer *vbuf)
 {
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
