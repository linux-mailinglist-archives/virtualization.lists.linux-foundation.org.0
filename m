Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86B5D196
	for <lists.virtualization@lfdr.de>; Tue,  2 Jul 2019 16:22:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CAD1A1867;
	Tue,  2 Jul 2019 14:22:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CA50A173D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 14:19:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7406C87D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 14:19:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9601C18B2FA;
	Tue,  2 Jul 2019 14:19:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
	[10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09DEA5D968;
	Tue,  2 Jul 2019 14:19:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D7F8C17446; Tue,  2 Jul 2019 16:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/18] drm/virtio: simplify cursor updates
Date: Tue,  2 Jul 2019 16:18:48 +0200
Message-Id: <20190702141903.1131-4-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-1-kraxel@redhat.com>
References: <20190702141903.1131-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 02 Jul 2019 14:19:12 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

No need to do the reservation dance,
we can just wait on the fence directly.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 024c2aa0c929..4b805bf466d3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -184,7 +184,6 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo = NULL;
 	uint32_t handle;
-	int ret = 0;
 
 	if (plane->state->crtc)
 		output = drm_crtc_to_virtio_gpu_output(plane->state->crtc);
@@ -208,15 +207,9 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 			 cpu_to_le32(plane->state->crtc_w),
 			 cpu_to_le32(plane->state->crtc_h),
 			 0, 0, vgfb->fence);
-		ret = virtio_gpu_object_reserve(bo, false);
-		if (!ret) {
-			reservation_object_add_excl_fence(bo->tbo.resv,
-							  &vgfb->fence->f);
-			dma_fence_put(&vgfb->fence->f);
-			vgfb->fence = NULL;
-			virtio_gpu_object_unreserve(bo);
-			virtio_gpu_object_wait(bo, false);
-		}
+		dma_fence_wait(&vgfb->fence->f, true);
+		dma_fence_put(&vgfb->fence->f);
+		vgfb->fence = NULL;
 	}
 
 	if (plane->state->fb != old_state->fb) {
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
