Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B75B11CD8D
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 13:54:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EDF28887FE;
	Thu, 12 Dec 2019 12:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hh9KF7nyE12B; Thu, 12 Dec 2019 12:53:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7700988802;
	Thu, 12 Dec 2019 12:53:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5841CC0881;
	Thu, 12 Dec 2019 12:53:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D73AEC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BE09C882DD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLGyRgNIz4uy
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:53:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CF681882D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 12:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576155235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=yfsqRxgDubeOFoB29hzjK9oDh1fi5tQsU42uuGO4JvA=;
 b=gG22YFSvLczwJb+OiOsn8TgI6BxWdT97sN19Q0JTTzzBLomYKjvKKmli95PJH72XJB7eb0
 dUg/SMBdjcSsTg1HNn73icvo/QKKAu9MgAusa4485V0AubSjSXl0iTQwpuDUsdLguHC8rg
 pxamBU09VxX7WZsmT9TPQ/dTdDk0KBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-jtrs1QBLO1mAcdbtrBxEDg-1; Thu, 12 Dec 2019 07:53:53 -0500
X-MC-Unique: jtrs1QBLO1mAcdbtrBxEDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A356E802B79;
 Thu, 12 Dec 2019 12:53:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.36.118.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C522A19C58;
 Thu, 12 Dec 2019 12:53:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1C99F9D62; Thu, 12 Dec 2019 13:53:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] virtio-gpu: batch display update commands.
Date: Thu, 12 Dec 2019 13:53:45 +0100
Message-Id: <20191212125346.8334-3-kraxel@redhat.com>
In-Reply-To: <20191212125346.8334-1-kraxel@redhat.com>
References: <20191212125346.8334-1-kraxel@redhat.com>
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
index 59bf76d4a333..2fb068cd680e 100644
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
@@ -177,6 +179,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
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
