Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AA111A620
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 09:42:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A25672051B;
	Wed, 11 Dec 2019 08:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwpVGs6i5gqO; Wed, 11 Dec 2019 08:42:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5D8D8204CE;
	Wed, 11 Dec 2019 08:42:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 436C8C0881;
	Wed, 11 Dec 2019 08:42:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36294C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1F39086E1A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5iS72MP1joM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:42:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8233386DF0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576053745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtoovQXBmt77VoBhVg39A0Jd/NXJUkCNUGS6KQcNFkc=;
 b=GFSYfH/esJg01S8a5WewPmnQh8H/uJvU+a0pF+ozyaWIzI/z9lbpFDZmZBkUjyHWXnuG5h
 0d/52Os8AdLiRRBAi6UIdaIP/asGNVw/e0MMGYcgE3r2VtjUvZ91fSkazTNdbw8Iia4rW/
 iNUwwXs98vL1JufKW1AKuGWNLyOrl+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-2Jw60vDsMoSH9xfXdMSoEA-1; Wed, 11 Dec 2019 03:42:22 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94B3F800D5B;
 Wed, 11 Dec 2019 08:42:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75C0610013A1;
 Wed, 11 Dec 2019 08:42:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AAD5617536; Wed, 11 Dec 2019 09:42:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] virtio-gpu: use damage info for display updates.
Date: Wed, 11 Dec 2019 09:42:16 +0100
Message-Id: <20191211084216.25405-4-kraxel@redhat.com>
In-Reply-To: <20191211084216.25405-1-kraxel@redhat.com>
References: <20191211084216.25405-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 2Jw60vDsMoSH9xfXdMSoEA-1
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 41 +++++++++++++++-----------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 2e0d14e005db..1a0fbbb91ec7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -24,6 +24,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
 
@@ -103,22 +104,26 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
-				      struct virtio_gpu_object *bo,
-				      struct drm_plane_state *state)
+				      struct drm_plane_state *state,
+				      struct drm_rect *rect)
 {
+	struct virtio_gpu_object *bo =
+		gem_to_virtio_gpu_obj(state->fb->obj[0]);
 	struct virtio_gpu_object_array *objs;
+	uint32_t w = rect->x2 - rect->x1;
+	uint32_t h = rect->y2 - rect->y1;
+	uint32_t x = rect->x1 + (state->src_x >> 16);
+	uint32_t y = rect->y1 + (state->src_y >> 16);
+	uint32_t off = x * state->fb->format->cpp[0] +
+		y * state->fb->pitches[0];
 
 	objs = virtio_gpu_array_alloc(1);
 	if (!objs)
 		return;
 	virtio_gpu_array_add_obj(objs, &bo->base.base);
-	virtio_gpu_cmd_transfer_to_host_2d
-		(vgdev, 0,
-		 state->src_w >> 16,
-		 state->src_h >> 16,
-		 state->src_x >> 16,
-		 state->src_y >> 16,
-		 objs, NULL);
+
+	virtio_gpu_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
+					   objs, NULL);
 }
 
 static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
@@ -127,8 +132,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
-	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
+	struct drm_rect rect;
 
 	if (plane->state->crtc)
 		output = drm_crtc_to_virtio_gpu_output(plane->state->crtc);
@@ -146,12 +151,14 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 		return;
 	}
 
+	if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
+		return;
+
 	virtio_gpu_disable_notify(vgdev);
 
-	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
-	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
+	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
 	if (bo->dumb)
-		virtio_gpu_update_dumb_bo(vgdev, bo, plane->state);
+		virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
 
 	if (plane->state->fb != old_state->fb) {
 		DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
@@ -171,10 +178,10 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	}
 
 	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
-				      plane->state->src_x >> 16,
-				      plane->state->src_y >> 16,
-				      plane->state->src_w >> 16,
-				      plane->state->src_h >> 16);
+				      (plane->state->src_x >> 16) + rect.x1,
+				      (plane->state->src_y >> 16) + rect.y1,
+				      rect.x2 - rect.x1,
+				      rect.y2 - rect.y1);
 
 	virtio_gpu_enable_notify(vgdev);
 }
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
