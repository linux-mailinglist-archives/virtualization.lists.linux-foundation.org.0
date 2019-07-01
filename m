Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A713CC4F
	for <lists.virtualization@lfdr.de>; Tue, 11 Jun 2019 14:54:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C9571EBA;
	Tue, 11 Jun 2019 12:54:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9FD1CE9E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 12:54:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DEEBF6D6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 12:54:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 430E5C1EB1FF;
	Tue, 11 Jun 2019 12:54:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-25.ams2.redhat.com
	[10.36.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36DF95C22E;
	Tue, 11 Jun 2019 12:54:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 2C80416E05; Tue, 11 Jun 2019 14:54:08 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: drop framebuffer dirty tracking code
Date: Tue, 11 Jun 2019 14:54:07 +0200
Message-Id: <20190611125408.29421-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 11 Jun 2019 12:54:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

No need to have our own implementation,
atomic helpers can do it for us.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h     |   7 --
 drivers/gpu/drm/virtio/virtgpu_display.c |  20 +--
 drivers/gpu/drm/virtio/virtgpu_fb.c      | 150 -----------------------
 drivers/gpu/drm/virtio/Makefile          |   2 +-
 4 files changed, 3 insertions(+), 176 deletions(-)
 delete mode 100644 drivers/gpu/drm/virtio/virtgpu_fb.c

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 5faccf92aa15..9e2d3062b01d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -142,9 +142,6 @@ struct virtio_gpu_output {
 
 struct virtio_gpu_framebuffer {
 	struct drm_framebuffer base;
-	int x1, y1, x2, y2; /* dirty rect */
-	spinlock_t dirty_lock;
-	uint32_t hw_res_handle;
 	struct virtio_gpu_fence *fence;
 };
 #define to_virtio_gpu_framebuffer(x) \
@@ -254,10 +251,6 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
 			      struct drm_device *dev,
 			      uint32_t handle, uint64_t *offset_p);
 
-/* virtio_fb */
-int virtio_gpu_surface_dirty(struct virtio_gpu_framebuffer *qfb,
-			     struct drm_clip_rect *clips,
-			     unsigned int num_clips);
 /* virtio vg */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 86843a4d6102..ba16e8cb7124 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -29,6 +29,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_damage_helper.h>
 
 #define XRES_MIN    32
 #define YRES_MIN    32
@@ -49,23 +50,10 @@ static const struct drm_crtc_funcs virtio_gpu_crtc_funcs = {
 	.atomic_destroy_state   = drm_atomic_helper_crtc_destroy_state,
 };
 
-static int
-virtio_gpu_framebuffer_surface_dirty(struct drm_framebuffer *fb,
-				     struct drm_file *file_priv,
-				     unsigned int flags, unsigned int color,
-				     struct drm_clip_rect *clips,
-				     unsigned int num_clips)
-{
-	struct virtio_gpu_framebuffer *virtio_gpu_fb
-		= to_virtio_gpu_framebuffer(fb);
-
-	return virtio_gpu_surface_dirty(virtio_gpu_fb, clips, num_clips);
-}
-
 static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
 	.destroy = drm_gem_fb_destroy,
-	.dirty = virtio_gpu_framebuffer_surface_dirty,
+	.dirty = drm_atomic_helper_dirtyfb,
 };
 
 int
@@ -85,10 +73,6 @@ virtio_gpu_framebuffer_init(struct drm_device *dev,
 		vgfb->base.obj[0] = NULL;
 		return ret;
 	}
-
-	spin_lock_init(&vgfb->dirty_lock);
-	vgfb->x1 = vgfb->y1 = INT_MAX;
-	vgfb->x2 = vgfb->y2 = 0;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_fb.c b/drivers/gpu/drm/virtio/virtgpu_fb.c
deleted file mode 100644
index b07584b1c2bf..000000000000
--- a/drivers/gpu/drm/virtio/virtgpu_fb.c
+++ /dev/null
@@ -1,150 +0,0 @@
-/*
- * Copyright (C) 2015 Red Hat, Inc.
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining
- * a copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sublicense, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial
- * portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
- * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
- * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
- * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
- * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#include <drm/drmP.h>
-#include <drm/drm_fb_helper.h>
-#include "virtgpu_drv.h"
-
-static int virtio_gpu_dirty_update(struct virtio_gpu_framebuffer *fb,
-				   bool store, int x, int y,
-				   int width, int height)
-{
-	struct drm_device *dev = fb->base.dev;
-	struct virtio_gpu_device *vgdev = dev->dev_private;
-	bool store_for_later = false;
-	int bpp = fb->base.format->cpp[0];
-	int x2, y2;
-	unsigned long flags;
-	struct virtio_gpu_object *obj = gem_to_virtio_gpu_obj(fb->base.obj[0]);
-
-	if ((width <= 0) ||
-	    (x + width > fb->base.width) ||
-	    (y + height > fb->base.height)) {
-		DRM_DEBUG("values out of range %dx%d+%d+%d, fb %dx%d\n",
-			  width, height, x, y,
-			  fb->base.width, fb->base.height);
-		return -EINVAL;
-	}
-
-	/*
-	 * Can be called with pretty much any context (console output
-	 * path).  If we are in atomic just store the dirty rect info
-	 * to send out the update later.
-	 *
-	 * Can't test inside spin lock.
-	 */
-	if (in_atomic() || store)
-		store_for_later = true;
-
-	x2 = x + width - 1;
-	y2 = y + height - 1;
-
-	spin_lock_irqsave(&fb->dirty_lock, flags);
-
-	if (fb->y1 < y)
-		y = fb->y1;
-	if (fb->y2 > y2)
-		y2 = fb->y2;
-	if (fb->x1 < x)
-		x = fb->x1;
-	if (fb->x2 > x2)
-		x2 = fb->x2;
-
-	if (store_for_later) {
-		fb->x1 = x;
-		fb->x2 = x2;
-		fb->y1 = y;
-		fb->y2 = y2;
-		spin_unlock_irqrestore(&fb->dirty_lock, flags);
-		return 0;
-	}
-
-	fb->x1 = fb->y1 = INT_MAX;
-	fb->x2 = fb->y2 = 0;
-
-	spin_unlock_irqrestore(&fb->dirty_lock, flags);
-
-	{
-		uint32_t offset;
-		uint32_t w = x2 - x + 1;
-		uint32_t h = y2 - y + 1;
-
-		offset = (y * fb->base.pitches[0]) + x * bpp;
-
-		virtio_gpu_cmd_transfer_to_host_2d(vgdev, obj,
-						   offset,
-						   cpu_to_le32(w),
-						   cpu_to_le32(h),
-						   cpu_to_le32(x),
-						   cpu_to_le32(y),
-						   NULL);
-
-	}
-	virtio_gpu_cmd_resource_flush(vgdev, obj->hw_res_handle,
-				      x, y, x2 - x + 1, y2 - y + 1);
-	return 0;
-}
-
-int virtio_gpu_surface_dirty(struct virtio_gpu_framebuffer *vgfb,
-			     struct drm_clip_rect *clips,
-			     unsigned int num_clips)
-{
-	struct virtio_gpu_device *vgdev = vgfb->base.dev->dev_private;
-	struct virtio_gpu_object *obj = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	struct drm_clip_rect norect;
-	struct drm_clip_rect *clips_ptr;
-	int left, right, top, bottom;
-	int i;
-	int inc = 1;
-
-	if (!num_clips) {
-		num_clips = 1;
-		clips = &norect;
-		norect.x1 = norect.y1 = 0;
-		norect.x2 = vgfb->base.width;
-		norect.y2 = vgfb->base.height;
-	}
-	left = clips->x1;
-	right = clips->x2;
-	top = clips->y1;
-	bottom = clips->y2;
-
-	/* skip the first clip rect */
-	for (i = 1, clips_ptr = clips + inc;
-	     i < num_clips; i++, clips_ptr += inc) {
-		left = min_t(int, left, (int)clips_ptr->x1);
-		right = max_t(int, right, (int)clips_ptr->x2);
-		top = min_t(int, top, (int)clips_ptr->y1);
-		bottom = max_t(int, bottom, (int)clips_ptr->y2);
-	}
-
-	if (obj->dumb)
-		return virtio_gpu_dirty_update(vgfb, false, left, top,
-					       right - left, bottom - top);
-
-	virtio_gpu_cmd_resource_flush(vgdev, obj->hw_res_handle,
-				      left, top, right - left, bottom - top);
-	return 0;
-}
diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index 42949a17ff70..458e606a936f 100644
--- a/drivers/gpu/drm/virtio/Makefile
+++ b/drivers/gpu/drm/virtio/Makefile
@@ -4,7 +4,7 @@
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
 virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o \
-	virtgpu_fb.o virtgpu_display.o virtgpu_vq.o virtgpu_ttm.o \
+	virtgpu_display.o virtgpu_vq.o virtgpu_ttm.o \
 	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
 	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
