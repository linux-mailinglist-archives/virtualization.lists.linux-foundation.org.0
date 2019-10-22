Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A5DFF05
	for <lists.virtualization@lfdr.de>; Tue, 22 Oct 2019 10:06:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5668E137B;
	Tue, 22 Oct 2019 08:06:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4661E135E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 08:05:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id CBE5289B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571731555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=2rJJiMpAk3KTFb/8+6jAIUN/X+McNBs+lfMw6ea3i+w=;
	b=akdZEapzk4TdGVJsi27SenSj/8E/9qThWDVH+yMxIorR2XQkdTgkFsouHCwtUI4r+zVlRV
	4GDCfDG7GmPLLuyqEOXCtKjpmcPjkItw03AIZ0QDwG7ODkmYUNxuOBo2S/1XzG6g9nv7hk
	1BIX4gtlZ9GiiFHVYD9+zhJqQcuc7ZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-184-0lXyjkArN3yZ1gZkgNW9Bg-1; Tue, 22 Oct 2019 04:05:52 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F55180183D;
	Tue, 22 Oct 2019 08:05:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2F441001B05;
	Tue, 22 Oct 2019 08:05:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id EFAAC9D34; Tue, 22 Oct 2019 10:05:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/virtio: factor out virtio_gpu_update_dumb_bo
Date: Tue, 22 Oct 2019 10:05:46 +0200
Message-Id: <20191022080546.19769-6-kraxel@redhat.com>
In-Reply-To: <20191022080546.19769-1-kraxel@redhat.com>
References: <20191022080546.19769-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 0lXyjkArN3yZ1gZkgNW9Bg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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

No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 36 +++++++++++++++-----------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 0b5a760bc293..bc4bc4475a8c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -102,6 +102,25 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 	return ret;
 }
 
+static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
+				      struct virtio_gpu_object *bo,
+				      struct drm_plane_state *state)
+{
+	struct virtio_gpu_object_array *objs;
+
+	objs = virtio_gpu_array_alloc(1);
+	if (!objs)
+		return;
+	virtio_gpu_array_add_obj(objs, &bo->base.base);
+	virtio_gpu_cmd_transfer_to_host_2d
+		(vgdev, 0,
+		 state->src_w >> 16,
+		 state->src_h >> 16,
+		 state->src_x >> 16,
+		 state->src_y >> 16,
+		 objs, NULL);
+}
+
 static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 					    struct drm_plane_state *old_state)
 {
@@ -129,21 +148,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 
 	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	if (bo->dumb) {
-		struct virtio_gpu_object_array *objs;
-
-		objs = virtio_gpu_array_alloc(1);
-		if (!objs)
-			return;
-		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
-		virtio_gpu_cmd_transfer_to_host_2d
-			(vgdev, 0,
-			 plane->state->src_w >> 16,
-			 plane->state->src_h >> 16,
-			 plane->state->src_x >> 16,
-			 plane->state->src_y >> 16,
-			 objs, NULL);
-	}
+	if (bo->dumb)
+		virtio_gpu_update_dumb_bo(vgdev, bo, plane->state);
 
 	DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
 		  bo->hw_res_handle,
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
