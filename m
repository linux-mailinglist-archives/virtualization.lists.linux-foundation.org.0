Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3338915BF1D
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 14:22:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB92487EDB;
	Thu, 13 Feb 2020 13:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2O7oukGe+id; Thu, 13 Feb 2020 13:22:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4FB4487E19;
	Thu, 13 Feb 2020 13:22:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E662C0177;
	Thu, 13 Feb 2020 13:22:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B93C3C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B636820489
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0eAH4WwY01y
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 32D3620411
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581600134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=c2L1hbDWCF6Pn6waRTqSSOIFgcuapW6lr9VXW92f9OI=;
 b=RqyrIBNHhDTLxv2kB1ZDvjUY95SlMFOzbp+rsRdnCxFLAAXXr/kc2rjfFsXUqpCTb/jYnK
 xzqMjy/c4DlPuQ4grmi2QninJOSlaFzXGhlRD+1Y6a3/fnepC4mLGy7YHU4MjVn4/pz9LR
 azoMJCKy8oBsiif64EjD5D6TMyR6dXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-rJxdbWv5ONeDy6R52b219Q-1; Thu, 13 Feb 2020 08:22:09 -0500
X-MC-Unique: rJxdbWv5ONeDy6R52b219Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C6CD800D4C;
 Thu, 13 Feb 2020 13:22:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1015590083;
 Thu, 13 Feb 2020 13:22:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 57BDC9AE0; Thu, 13 Feb 2020 14:22:04 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/virtio: batch plane updates (pageflip)
Date: Thu, 13 Feb 2020 14:22:01 +0100
Message-Id: <20200213132203.23441-3-kraxel@redhat.com>
In-Reply-To: <20200213132203.23441-1-kraxel@redhat.com>
References: <20200213132203.23441-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Move virtio_gpu_notify() to higher-level functions for
virtio_gpu_cmd_resource_flush(), virtio_gpu_cmd_set_scanout() and
virtio_gpu_cmd_transfer_to_host_{2d,3d}().

virtio_gpu_primary_plane_update() will notify only once for a series
of commands (restores plane update command batching).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   | 1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 3 +++
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 4 ----
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index af953db4a0c9..2b7e6ae65546 100644
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
index 0477d1250f2d..467649733d24 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -359,6 +359,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 args->level, &args->box, objs, fence);
 		dma_fence_put(&fence->f);
 	}
+	virtio_gpu_notify(vgdev);
 	return 0;
 
 err_unlock:
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 08b2e4127eb3..52d24179bcec 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -148,6 +148,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 					   plane->state->src_w >> 16,
 					   plane->state->src_h >> 16,
 					   0, 0);
+		virtio_gpu_notify(vgdev);
 		return;
 	}
 
@@ -184,6 +185,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				      rect.y1,
 				      rect.x2 - rect.x1,
 				      rect.y2 - rect.y1);
+	virtio_gpu_notify(vgdev);
 }
 
 static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
@@ -262,6 +264,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 			 plane->state->crtc_w,
 			 plane->state->crtc_h,
 			 0, 0, objs, vgfb->fence);
+		virtio_gpu_notify(vgdev);
 		dma_fence_wait(&vgfb->fence->f, true);
 		dma_fence_put(&vgfb->fence->f);
 		vgfb->fence = NULL;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 812212975440..9d4ca0fafa5f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -567,7 +567,6 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
@@ -589,7 +588,6 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
@@ -622,7 +620,6 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_notify(vgdev);
 }
 
 static void
@@ -1048,7 +1045,6 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->level = cpu_to_le32(level);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
-- 
2.18.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
