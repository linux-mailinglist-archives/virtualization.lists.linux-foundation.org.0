Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4079DE1217
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 08:25:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0F051B88;
	Wed, 23 Oct 2019 06:25:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5942EAF3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 06:25:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C63A714D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571811947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=oVc09gtJkfw81t/CSZzvN6PZuWLwf46NNAtbbfhMjiE=;
	b=YrE+4zST5AXKYTjBtjgsW87XhRENVpriYF4qhWhDYpxk/eB6kEvvsr0LUdqloFqjr6h1qm
	WTPezuBhvEjnv1KME0weBZPjQSNcPsKk1Z/0jfnKTkbGMDnFCLUYL6HS8WtVZm5SPavvyy
	dcq9VW5wz4F/oaZghyW7y4qtanIFTRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-141-jmzfOARtMemy09B3Bu1Opw-1; Wed, 23 Oct 2019 02:25:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4242107AD31;
	Wed, 23 Oct 2019 06:25:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7CAD194B6;
	Wed, 23 Oct 2019 06:25:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 0FED09D76; Wed, 23 Oct 2019 08:25:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/virtio: Simplify virtio_gpu_primary_plane_update
	workflow.
Date: Wed, 23 Oct 2019 08:25:38 +0200
Message-Id: <20191023062539.11728-3-kraxel@redhat.com>
In-Reply-To: <20191023062539.11728-1-kraxel@redhat.com>
References: <20191023062539.11728-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: jmzfOARtMemy09B3Bu1Opw-1
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

Return early for the no framebuffer (or disabled output) case.
Results in a simpler code flow for the remaining cases.
No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 62 ++++++++++++++------------
 1 file changed, 33 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 390524143139..0b5a760bc293 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -110,7 +110,6 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	struct virtio_gpu_output *output = NULL;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
-	uint32_t handle;
 
 	if (plane->state->crtc)
 		output = drm_crtc_to_virtio_gpu_output(plane->state->crtc);
@@ -119,47 +118,52 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	if (WARN_ON(!output))
 		return;
 
-	if (plane->state->fb && output->enabled) {
-		vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
-		bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-		handle = bo->hw_res_handle;
-		if (bo->dumb) {
-			struct virtio_gpu_object_array *objs;
+	if (!plane->state->fb || !output->enabled) {
+		DRM_DEBUG("nofb\n");
+		virtio_gpu_cmd_set_scanout(vgdev, output->index, 0,
+					   plane->state->src_w >> 16,
+					   plane->state->src_h >> 16,
+					   0, 0);
+		return;
+	}
+
+	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
+	if (bo->dumb) {
+		struct virtio_gpu_object_array *objs;
 
-			objs = virtio_gpu_array_alloc(1);
-			if (!objs)
-				return;
-			virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
-			virtio_gpu_cmd_transfer_to_host_2d
-				(vgdev, 0,
-				 plane->state->src_w >> 16,
-				 plane->state->src_h >> 16,
-				 plane->state->src_x >> 16,
-				 plane->state->src_y >> 16,
-				 objs, NULL);
-		}
-	} else {
-		handle = 0;
+		objs = virtio_gpu_array_alloc(1);
+		if (!objs)
+			return;
+		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
+		virtio_gpu_cmd_transfer_to_host_2d
+			(vgdev, 0,
+			 plane->state->src_w >> 16,
+			 plane->state->src_h >> 16,
+			 plane->state->src_x >> 16,
+			 plane->state->src_y >> 16,
+			 objs, NULL);
 	}
 
-	DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n", handle,
+	DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
+		  bo->hw_res_handle,
 		  plane->state->crtc_w, plane->state->crtc_h,
 		  plane->state->crtc_x, plane->state->crtc_y,
 		  plane->state->src_w >> 16,
 		  plane->state->src_h >> 16,
 		  plane->state->src_x >> 16,
 		  plane->state->src_y >> 16);
-	virtio_gpu_cmd_set_scanout(vgdev, output->index, handle,
+	virtio_gpu_cmd_set_scanout(vgdev, output->index,
+				   bo->hw_res_handle,
 				   plane->state->src_w >> 16,
 				   plane->state->src_h >> 16,
 				   plane->state->src_x >> 16,
 				   plane->state->src_y >> 16);
-	if (handle)
-		virtio_gpu_cmd_resource_flush(vgdev, handle,
-					      plane->state->src_x >> 16,
-					      plane->state->src_y >> 16,
-					      plane->state->src_w >> 16,
-					      plane->state->src_h >> 16);
+	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
+				      plane->state->src_x >> 16,
+				      plane->state->src_y >> 16,
+				      plane->state->src_w >> 16,
+				      plane->state->src_h >> 16);
 }
 
 static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
